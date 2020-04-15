# template-package
A template python package containing the following:
* a simple [conda-build](https://docs.conda.io/projects/conda-build/en/latest/) recipe
* a simple [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops) yaml to automate builds and run tests 

## Prerequisites
* [(mini)conda](https://docs.conda.io/en/latest/miniconda.html)
* [python](https://www.python.org/) >= 3.7
* Unix

## Conda Build and Test 

1. Create and activate a conda environment:
    ```
    $ conda env create --name test-env --file ci/test-env-requirements.yml python=3.7
    $ conda activate test-env
    ```

2. Build and add the template package to the environment:
    ```
    (test-env) $ cd ..
    (test-env) $ mkdir tmp-build
    (test-env) $ conda build template-package --output-folder=tmp-build
    (test-env) $ conda install tmp-build/**/template*.tar.bz2
    ```

3. Run the tests against the template package and view the report:
    ```
    (test-env) $ coverage run -m --include=**/template/* --omit=**/test_*.py unittest discover template-package/tests
    (test-env) $ coverage report -m
    (test-env) $ rm -r .coverage
    ```

4. (Optional) Test the entry point defined in [conda-recipe/meta.yaml](https://github.com/pyt3r/template-package/blob/master/conda-recipe/meta.yaml)
    ```
    (test-env) $ template-entry-point
    ```

5. (Optional) Upload the artifact (requires an Anaconda account)
    ```
    (test-env) $ anaconda upload tmp-build/**/template*.tar.bz2
    ```

6. (Optional) Deactivate
    ```
    (test-env) $ conda deactivate
   
    $ echo "..and we're back to normal"
    ```



## Azure Pipelines
Each commit (and PR) to the master branch invokes the [azure-pipelines.yml](https://github.com/pyt3r/template-package/blob/master/azure-pipelines.yml) script, which encapsulates steps 1 through 3 in an automated manner.

The latest build status of the template-package (incl. coverage reports) may be found [here](https://dev.azure.com/pyt3rb/template%20pipeline%20for%20a%20template%20python%20package/_build).


## Final Artifact
Installation ([noarch](https://anaconda.org/pyt3r/template)):
```
$ conda install -c pyt3r template
```

## Authors

* **pyt3r**

## License

* [MIT License](https://github.com/pyt3r/template-package/blob/master/LICENSE)
