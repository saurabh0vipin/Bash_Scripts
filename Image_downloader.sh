#download the html code of the web page in page.html
wget -U/Mozilla -q "https://wallpapercave.com/dark-knight-hd-wallpaper" -O - > page.html

#geather all the image sources from the html code and put into IMG_sources.txt
grep -E "/wp/[^/\s]+\.(jpg|png|gif)" page.html -o > IMG_sources.txt

#convert IMG_sources into meaning full urls and save url.txt
sed -E "s/\/wp\//https:\/\/wallpapercave.com\/wp\//g" IMG_sources.txt | uniq > urls.txt

#download images into downloads
wget -i urls.txt -P downloads/
