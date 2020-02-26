Content-Type: multipart/mixed; boundary="===============1786370078381662858=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [block:block-5.6 2/3] kernel/trace/blktrace.c:347:12: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Wed, 26 Feb 2020 16:44:35 +0800
Message-ID: <202002261622.EZx3EFwO%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1786370078381662858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it block-5.6
head:   93d7c3185893b185e7f4347f8986b9b521254a6e
commit: c780e86dd48ef6467a1146cf7d0fe1e05a635039 [2/3] blktrace: Protect q-=
>blk_trace with RCU
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout c780e86dd48ef6467a1146cf7d0fe1e05a635039
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/trace/blktrace.c:347:12: sparse: sparse: incorrect type in assign=
ment (different address spaces)
>> kernel/trace/blktrace.c:347:12: sparse:    expected struct blk_trace *bt
>> kernel/trace/blktrace.c:347:12: sparse:    got struct blk_trace [noderef=
] <asn:4> *[assigned] __ret
>> kernel/trace/blktrace.c:547:13: sparse: sparse: incorrect type in initia=
lizer (different address spaces)
>> kernel/trace/blktrace.c:547:13: sparse:    expected struct blk_trace [no=
deref] <asn:4> *__new
>> kernel/trace/blktrace.c:547:13: sparse:    got struct blk_trace *[assign=
ed] bt
   kernel/trace/blktrace.c:998:50: sparse: sparse: incorrect type in argume=
nt 7 (different base types)
   kernel/trace/blktrace.c:998:50: sparse:    expected int error
   kernel/trace/blktrace.c:998:50: sparse:    got restricted blk_status_t [=
usertype] bi_status
   kernel/trace/blktrace.c:1036:68: sparse: sparse: incorrect type in argum=
ent 7 (different base types)
   kernel/trace/blktrace.c:1036:68: sparse:    expected int error
   kernel/trace/blktrace.c:1036:68: sparse:    got restricted blk_status_t =
[usertype] bi_status
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1257:16: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1264:32: sparse: sparse: incorrect type in initi=
alizer (different base types)
   kernel/trace/blktrace.c:1264:32: sparse:    expected unsigned long long =
[usertype] sector_from
   kernel/trace/blktrace.c:1264:32: sparse:    got restricted __be64 const =
[usertype] sector_from
   kernel/trace/blktrace.c:1266:24: sparse: sparse: incorrect type in assig=
nment (different base types)
   kernel/trace/blktrace.c:1266:24: sparse:    expected restricted __be32 [=
usertype] device_from
   kernel/trace/blktrace.c:1266:24: sparse:    got unsigned int
   kernel/trace/blktrace.c:1267:24: sparse: sparse: incorrect type in assig=
nment (different base types)
   kernel/trace/blktrace.c:1267:24: sparse:    expected restricted __be32 [=
usertype] device_to
   kernel/trace/blktrace.c:1267:24: sparse:    got unsigned int
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:26: sparse: sparse: cast to restricted __be=
64
   kernel/trace/blktrace.c:1268:24: sparse: sparse: incorrect type in assig=
nment (different base types)
   kernel/trace/blktrace.c:1268:24: sparse:    expected restricted __be64 [=
usertype] sector_from
   kernel/trace/blktrace.c:1268:24: sparse:    got unsigned long long
   kernel/trace/blktrace.c:1415:26: sparse: sparse: restricted __be32 degra=
des to integer
   kernel/trace/blktrace.c:1415:48: sparse: sparse: restricted __be32 degra=
des to integer
   kernel/trace/blktrace.c:1416:27: sparse: sparse: cast from restricted __=
be64
   kernel/trace/blktrace.c:1640:12: sparse: sparse: incorrect type in assig=
nment (different address spaces)
   kernel/trace/blktrace.c:1640:12: sparse:    expected struct blk_trace *bt
   kernel/trace/blktrace.c:1640:12: sparse:    got struct blk_trace [nodere=
f] <asn:4> *[assigned] __ret
   kernel/trace/blktrace.c:1673:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces)
   kernel/trace/blktrace.c:1673:13: sparse:    expected struct blk_trace [n=
oderef] <asn:4> *__new
   kernel/trace/blktrace.c:1673:13: sparse:    got struct blk_trace *[assig=
ned] bt

vim +347 kernel/trace/blktrace.c

2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  342  =

1f2cac107c591c2 kernel/trace/blktrace.c Jens Axboe 2017-11-05  343  static =
int __blk_trace_remove(struct request_queue *q)
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  344  {
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  345  	struct=
 blk_trace *bt;
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  346  =

2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23 @347  	bt =3D=
 xchg(&q->blk_trace, NULL);
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  348  	if (!b=
t)
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  349  		retur=
n -EINVAL;
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  350  =

5554720482a6317 kernel/trace/blktrace.c Li Zefan   2009-03-25  351  	if (bt=
->trace_state !=3D Blktrace_running)
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  352  		blk_t=
race_cleanup(bt);
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  353  =

2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  354  	return=
 0;
2056a782f8e7e65 block/blktrace.c        Jens Axboe 2006-03-23  355  }
1f2cac107c591c2 kernel/trace/blktrace.c Jens Axboe 2017-11-05  356  =


:::::: The code at line 347 was first introduced by commit
:::::: 2056a782f8e7e65fd4bfd027506b4ce1c5e9ccd4 [PATCH] Block queue IO trac=
ing support (blktrace) as of 2006-03-23

:::::: TO: Jens Axboe <axboe@suse.de>
:::::: CC: Jens Axboe <axboe@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1786370078381662858==--

