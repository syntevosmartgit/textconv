
# textconv Diff Demo with SmartGit

This repository demonstrates how to use Git's `textconv` feature to compare the content of Office documents (using [markitdown](https://github.com/microsoft/markitdown)) and PDF files (using [pdftotext](https://www.xpdfreader.com/pdftotext-man.html)) directly within [SmartGit](https://www.syntevo.com/smartgit/). The Idea is to convert the content of binary files to a plain-text or markdown representation and then use SmartGit's built in diff to visualize the changes in the binaries. 
We also have a JSON example that shows how this can be used to make files like JSON or XML easier to diff.

This approach can also be extended to other binary files, such as using `exif` for image files, to enable effective diffing.

For detailed documentation on Git's `textconv` capabilities, refer to the official documentation:  
[Git Attributes: Performing Text Diffs of Binary Files](https://git-scm.com/docs/gitattributes#_performing_text_diffs_of_binary_files)

**Note:** Depending on the runtime of the conversion tools, rendering the diff in SmartGit may take a moment.

---

## Setting Up textconv for PDFs

To enable `textconv` for PDFs, update your local `.git/config` file with the following lines:

```ini
[diff "pdf"]
    textconv = sh -c 'pdftotext -layout -enc UTF-8 "$0" -'
```

Alternatively, you can achieve the same configuration using the Git CLI:

```sh
git config set diff.pdf.textconv 'sh -c ''pdftotext -layout -enc UTF-8 "$0" -'''
```

---

## Setting Up textconv for Office Documents and Others

Using [markitdown](https://github.com/microsoft/markitdown), various file formats (e.g., `.docx`) can be converted to Markdown for diffing. Below are the setup steps:

1. **Install Python**  
    Ensure Python is installed and available in your system's PATH.
    e.g for Windows: https://docs.python.org/3/using/windows.html
    
2. **Install MarkItDown**  
    Install MarkItDown using the instructions from the [markitdown repository](https://github.com/microsoft/markitdown).
	e.g. via `pip install markitdown` 
	Test if you can run markitdown from a console in your repository.
	`markitdown mypdf.pdf`
    
3. **Configure Git**  
    Use the following commands to set up the `textconv` configuration for `.docx` files:
    
    ```sh
    git config set diff.docx.textconv markitdown
    git config set diff.docx.cachetextconv true
    git config set diff.xlsx.textconv markitdown
    git config set diff.xlsx.cachetextconv true
    ```
    
4. **Update `.gitattributes`**  
    Define which file types will use the `textconv` conversion by configuring `.gitattributes`. (See below for details.)
    

This repository includes a preconfigured `.gitattributes` file for convenience.

---

## Setting Up textconv with a JSON formatter

Our JSON Example assumes Python is on the machine and in the PATH like for markitdown.
To enable `textconv` for JSON, update your local `.git/config` file with the following lines:

```ini
[diff "json"]
    textconv = python -m json.tool
```

Alternatively, you can achieve the same configuration using the Git CLI:

```sh
git config set diff.json.textconv 'python -m json.tool'
```


---

## Example `.gitattributes` Configuration

To enable `textconv` for specific file types in your repository, define them in your `.gitattributes` file. For example:

```gitattributes
pdf-conv.pdf diff=pdf
*.docx diff=docx
*.json diff=json
*.xlsx diff=xlsx
```

This configuration ensures that the specified files (`.pdf` ,`.docx` and `.json`) are processed using the appropriate converters (`pdftotext` ,`markitdown` and `json.tool`, respectively).

---

By following these steps, you'll enable effective and user-friendly diffing of binary file types such as PDFs and Office documents directly within SmartGit.