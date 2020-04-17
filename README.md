# template-package : python + azure + anaconda
![build] ![version] ![conda] ![platforms] ![coverage] ![downloads]

[build]: https://dev.azure.com/pyt3r/template/_apis/build/status/pyt3r.template-package
[coverage]: https://img.shields.io/azure-devops/coverage/pyt3r/template/3
[version]: https://anaconda.org/pyt3r/template/badges/version.svg
[lrd]: https://anaconda.org/pyt3r/template/badges/latest_release_date.svg
[lrrd]: https://anaconda.org/pyt3r/template/badges/latest_release_relative_date.svg
[platforms]: https://anaconda.org/pyt3r/template/badges/platforms.svg
[downloads]: https://anaconda.org/pyt3r/template/badges/downloads.svg
[conda]: https://anaconda.org/pyt3r/template/badges/installer/conda.svg


The **template-package** is a boilerplate python repo supporting the following features:
* a simple [conda-build](https://docs.conda.io/projects/conda-build/en/latest/) recipe
* a simple [Azure Pipeline](https://docs.microsoft.com/en-us/azure/devops/pipelines/get-started/what-is-azure-pipelines?view=azure-devops) to build, test, and publish a conda package artifact 

## Prerequisites
* [(mini)conda](https://docs.conda.io/en/latest/miniconda.html)
* [python](https://www.python.org/) >= 3.7
* Unix

## A Simple Conda Build 

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

4. (Optional) Test the entry point defined in [conda-recipe/meta.yaml](conda-recipe/meta.yaml)
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


## A Simple Azure Pipeline
Each commit (and PR) to the master branch invokes the [azure-pipelines.yml](azure-pipelines.yml) script, which automates the Steps 1 through 3 above.

The pipeline concludes by publishing the coverage report and conda package artifact on [Azure](https://dev.azure.com/pyt3r/template/_build).


## Final Artifact

Upon the conclusion of the pipeline, users may access and upload the published artifact to [Anaconda Cloud](https://anaconda.org/pyt3r/template) where it may be installed as follows: 

```
$ conda install -c pyt3r template
```

## Authors

* **pyt3r**

## License

* [MIT License](LICENSE)
