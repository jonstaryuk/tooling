function optimizePdf
    command gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/ebook -dNumRenderingThreads=4 \
        -dBandBufferSpace=500000000 -dBufferSpace=1000000000 \
        -sOutputFile="$argv[1].opt.pdf" \
        -c "1000000000 setvmthreshold" -f "$argv[1]"
end
