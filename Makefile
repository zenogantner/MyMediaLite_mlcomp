MYMEDIA_DIR=$(CURDIR)/../mymedialite/src/RatingPrediction/bin/Debug

ZIP=bipolar-slopeone.zip bmf.zip global-average.zip item-average.zip item-knn-cosine.zip item-knn-pearson.zip slopeone.zip user-average.zip user-knn-cosine.zip user-knn-pearson.zip

get-mymedialite:
	cp $(MYMEDIA_DIR)/*.dll .
	cp $(MYMEDIA_DIR)/*.exe .
	cp $(MYMEDIA_DIR)/*.mdb .
	rm MathNet.Iridium.dll

all: $(ZIP)

%.zip: %.sh
	cp $< run
	zip $@ *.dll *.mdb *.exe README run

clean:
	rm -f *.zip
	rm -f run