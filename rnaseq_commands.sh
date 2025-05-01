#20250104 FastQC and MutliQC report of FastQC analysis on sample data from OBDS course Day 4 AM
load_mamba #alias for obds-rnaseq environment
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ fastqc --help 
#fastqc run on paired CD4 files
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ fastqc -t 2  cd4_rep1_read1.fastq.gz cd4_rep1_read2.fastq.gz --outdir /project/bras5846/linux/3_analysis/1_fastqc
#setup for multiqc reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls ../3_analysis/1_fastqc/
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ multiqc --help
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls ../3_analysis           
#new folder for reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ mkdir ../3_analysis/reports/
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls 
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls ../3_analysis
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ cd ../3_analysis/1_fastqc 
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ pwd
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ ls .
#run multiqc on reports from fastqc
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ multiqc . --outdir ../reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ ls ../reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ cd ..          
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis$ pwd
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis$ ls
#adding commands to this
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis$ nano rnaseq_commands.sh
