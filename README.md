## HBase-PoC
Sample HBase Implementation.
 The purpose of this guide, is to show you just a way to construct a sandbox for testing purposes involving a Hadoop instance along an HBase one. This guide is based on several sources of information, you'll find the links at the end of the article.

### What will you need?

1. Local Docker environment up & running.
2. Clone the source code of the repository.
3. That's all, just get fun with! :bowtie:

### Assumptions.
There are three basic things that you need to know about a Docker, first of all i'm going to suposse that you know what's Docker and how does it works but if you don't just dont worry and go to the [Docker Site](https://docs.docker.com/get-started/#conclusion-of-part-one) and take yourself into a journey of UNIX and containers. But let's go to the point you need to consider the **Dockerfile** as like a recipe for the container construction.

### Let's get start with this.
1. First of all you have to, [clone](https://github.com/rkobismarck/hbase-poc).
2. Execute the next command:
```console
foo@bar:hbase-poc robertotrujillo$./start-cluster.sh
```