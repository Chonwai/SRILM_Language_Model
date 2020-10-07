# SRILM_Language_Model

## How to use

First, you need to extract the **split-srilm-package.zip** file which is a multiple segments zip file:

```bash
zip -F split-srilm-package.zip --out srilm-package.zip
unzip srilm-package.zip
```

Next, run the train.sh to train the model and it will save the perplexity result:

```bash
sh train.sh
```

All of the perplexity will save into the result folder.
