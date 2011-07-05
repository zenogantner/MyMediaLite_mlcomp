MYMEDIA_ASSEMBLY_DIR=$(CURDIR)../mymedialite/src/RatingPrediction/bin/Debug

ZIP=bipolar-slopeone.zip bmf.zip global-average.zip item-average.zip item-knn-cosine.zip item-knn-pearson.zip slopeone.zip user-average.zip user-knn-cosine.zip user-knn-pearson.zip

all: $(ZIP)

%.zip: %.sh
	cp $< run
	zip $@ *.dll *.mdb *.exe README run

clean:
	rm *.zip
	rum run