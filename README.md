# template-package
A template python package containing the following:
* a simple [conda-build](https://docs.conda.io/projects/conda-build/en/latest/) recipe
* a simple [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops) yaml to automate builds and run tests 

## Prerequisites
* [(mini)conda](https://docs.conda.io/en/latest/miniconda.html)

## Conda
1. Create and activate a conda environment:
    ```
    $ conda create env --name test-env --file ci/test-env-requirements.yml
    $ conda activate test-env
    ```

2. Build and add the template package to the environment:
    ```
    (test-env) $ cd ..
    (test-env) $ mkdir tmp-build
    (test-env) $ conda build template-package --output-folder=tmp-build
    (test-env) $ conda install tmp-build/**/pyt3r_template**.tar.bz2
    (test-env) $ rm -r tmp-build
    ```

3. Run tests against the template package:
    ```
    (test-env) $ pytest template-package/tests
    ```

4. Test the entry point defined in [conda-recipe/meta.yaml](https://github.com/pyt3r/template-package/blob/master/conda-recipe/meta.yaml)
    ```
    (test-env) $ pyt3r_template-hello
    ```

5. Deactivate
    ```
    (test-env) $ conda deactivate
   
   $ echo "and we're back to normal"
    ```

## Azure Pipelines
Each commit (and PR) to master invokes the [azure-pipelines.yml](https://github.com/pyt3r/template-package/blob/master/azure-pipelines.yml) script, which encapsulates the above steps in an automated manner.

The latest build status of the template-package (incl. coverage reports, etc.) may be found at the following link:
* [Build Status: pyt3r_template](https://dev.azure.com/pyt3rb/template%20pipeline%20for%20a%20template%20python%20package/_build)

## Authors

* **pyt3r**

## License

[MIT License](https://github.com/pyt3r/plandas-package/blob/master/LICENSE)
