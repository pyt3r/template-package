<h1 align="center" style="margin:1em;">
    template-package : python + azure + anaconda
</h1>

<h4 align="center">
    The template-package is a boilerplate python repo for setting up a CI pipeline
</h4>

<p align="center">

<a href="https://dev.azure.com/pyt3r/template/_build">
<img src="https://img.shields.io/azure-devops/build/pyt3r/template/3"
 alt="Builds" /></a>

<a href="https://anaconda.org/pyt3r/template">
<img src="https://img.shields.io/conda/v/pyt3r/template"
 alt="Version" /></a>
 
<a href="https://anaconda.org/pyt3r/template">
<img src="https://img.shields.io/conda/pn/pyt3r/template"
 alt="Platform" /></a>

<a href="https://dev.azure.com/pyt3r/template/_build">
<img src="https://img.shields.io/azure-devops/coverage/pyt3r/template/3"
 alt="Coverage" /></a>
 
<a href="https://anaconda.org/pyt3r/template">
<img src="https://img.shields.io/conda/dn/pyt3r/template"
 alt="Downloads" /></a>

</p>

<br>

# Table of Contents

- [Prerequisites](#prerequisites)
- [Features](#features)
- [Conda Build](#conda-build)
- [Azure Pipelines](#azure-pipelines)
- [Artifact](#artifact)
- [Author](#author)
- [License](#license)


## Features
* invoke a simple [conda-build](https://docs.conda.io/projects/conda-build/en/latest/) recipe
* trigger a simple CI [Azure Pipeline]((https://dev.azure.com/pyt3r/template/_build)) to build, test, and publish a conda package artifact, which can be uploaded to [Anaconda Cloud](https://anaconda.org/pyt3r/template)

## Prerequisites
* [(mini)conda](https://docs.conda.io/en/latest/miniconda.html)
* [python](https://www.python.org/) >= 3.7
* Unix


## Conda Build

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


## Azure Pipelines
Each commit (and PR) to the master branch invokes the [azure-pipelines.yml](azure-pipelines.yml) script, which automates the Steps 1 through 3 above.

The pipeline concludes by publishing the coverage report and conda package artifact on [Azure](https://dev.azure.com/pyt3r/template/_build).

## Artifact
Upon the conclusion of the pipeline, users may access and upload the published artifact (a conda package) to [Anaconda Cloud](https://anaconda.org/pyt3r/template) where it may be installed as follows: 

```
$ conda install -c pyt3r template
```

## Author

* **pyt3r**

## License

* [MIT License](LICENSE)
