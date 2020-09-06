Run using
```console
srun --gpus-per-node=0 --partition=priority --comment=leaving0911 --time=3000 --cpus-per-task 1 --mem=400000 --pty -l bash run_experiments.sh 0 vector_trained webqsp_filtered
```

```console
srun --gpus-per-node=0 --partition=priority --comment=leaving0911 --time=3000 --cpus-per-task 1 --mem=400000 --pty -l bash run_experiments.sh 0 vector_trained graphqs_filtered
```
