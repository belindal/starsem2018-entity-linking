GPUID=$1
model=$2  # train/VCG/vector_trained
eval_data=$3  # webqsp/graphqs/webqsp_filtered/graphqs_filtered

if [[ $model = 'train' ]]
then
    MODELPATH="$(python -m entitylinking.mlearning.training.train_entity_linker configs/trainmodel_vector_model.yaml 1 $GPUID | tail -n1)"
elif [[ $model = 'VCG' ]]
then
    MODELPATH=trainedmodels/VectorModel_114.torchweights
elif [[ $model = 'vector_trained' ]]
then
    MODELPATH=trainedmodels/VectorModel_2020-03-19_249655.torchweights
else
    MODELPATH=trainedmodels/FeatureModel_SimplifiedVCG.torchweights
fi
if [[ ( $eval_data = 'webqsp' ) || ( $eval_data = 'both' ) ]]
then
    # eval on webqsp
    python -m entitylinking.evaluation.evaluate $MODELPATH configs/evaluate_webqsp.yaml
elif [[ ( $eval_data = 'graphqs' ) || ( $eval_data = 'both' ) ]]
then
    # eval on graphquestions
    python -m entitylinking.evaluation.evaluate $MODELPATH configs/evaluate_graphquestions.yaml
elif [[ ( $eval_data = 'webqsp_filtered' ) ]]
then
    python -m entitylinking.evaluation.evaluate $MODELPATH configs/evaluate_webqsp_filtered.yaml
elif [[ ( $eval_data = 'graphqs_filtered' ) ]]
then
    python -m entitylinking.evaluation.evaluate $MODELPATH configs/evaluate_graphquestions_filtered.yaml
fi

