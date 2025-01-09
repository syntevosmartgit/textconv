#Configure textconv in .git/config
git config set diff.docx.textconv markitdown 
git config set diff.docx.cachetextconv true 
git config set diff.pdf.textconv 'sh -c ''pdftotext -layout -enc UTF-8 "$0" -'''
