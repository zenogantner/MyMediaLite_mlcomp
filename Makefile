MYMEDIA_DIR=$(CURDIR)/../mymedialite/src/RatingPrediction/bin/Debug

ZIP=bipolar-slopeone.zip bmf-10.zip bmf-20.zip bmf-40.zip bmf-5.zip bmf-60.zip factorwise-mf.zip global-average.zip item-average.zip item-knn-cosine.zip item-knn-pearson.zip mf-10.zip mf-20.zip mf-40.zip mf-5.zip mf-60.zip slopeone.zip user-average.zip user-knn-cosine.zip user-knn-pearson.zip

get-mymedialite:
	cp $(MYMEDIA_DIR)/*.dll .
	cp $(MYMEDIA_DIR)/*.exe .
	cp $(MYMEDIA_DIR)/*.mdb .
	rm MathNet.Iridium.dll	

all: $(ZIP)

%.zip: %.sh
	./$<
	cp $< run
	touch hp.txt
	./$< setHyperparameter 1
	zip $@ *.dll *.mdb *.exe README run hp.txt

clean:
	rm -f *.zip
	rm -f run
	rm -f hp.txt
	rm -f model.txt
	rm -f training_file