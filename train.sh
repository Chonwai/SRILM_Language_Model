cd srilm-package/bin/macosx
echo "cd srilm-package/bin/macosx"
for ((i=1;i<=5;i++))
do
    echo "Counting the ${i}-Gram..."
    ./ngram-count -text ../../../dataset/word_news_train.txt -order ${i} -write ../../../ngram/Word"${i}"Gram.count
    echo "Modeling..."
    ./ngram-count -read ../../../ngram/Word"${i}"Gram.count -order ${i} -lm ../../../model/Word"${i}"GramModel.lm -interpolate -kndiscount
    echo "Switch to Perplexity on Testing Set!"
    ./ngram -ppl ../../../dataset/news_test.txt -order ${i} -lm ../../../model/Word"${i}"GramModel.lm -debug 1 > ../../../result/WordModelTestResult"${i}"Gram.ppl
    echo "Switch to Perplexity on Training Set!"
    ./ngram -ppl ../../../dataset/word_news_train.txt -order ${i} -lm ../../../model/Word"${i}"GramModel.lm -debug 1 > ../../../result/WordModelTrainResult"${i}"Gram.ppl
done

for ((i=1;i<=9;i++))
do
    echo "Counting the ${i}-Gram..."
    ./ngram-count -text ../../../dataset/char_news_train.txt -order ${i} -write ../../../ngram/Char"${i}"Gram.count
    echo "Modeling..."
    ./ngram-count -read ../../../ngram/Char"${i}"Gram.count -order ${i} -lm ../../../model/Char"${i}"GramModel.lm -interpolate -kndiscount
    echo "Switch to Perplexity on Testing Set!"
    ./ngram -ppl ../../../dataset/news_test.txt -order ${i} -lm ../../../model/Char"${i}"GramModel.lm -debug 1 > ../../../result/CharModelTestResult"${i}"Gram.ppl
    echo "Switch to Perplexity on Training Set!"
    ./ngram -ppl ../../../dataset/char_news_train.txt -order ${i} -lm ../../../model/Char"${i}"GramModel.lm -debug 1 > ../../../result/CharModelTrainResult"${i}"Gram.ppl
done

echo "Finished All! Hope we can defeat COVID-19 ;)"
