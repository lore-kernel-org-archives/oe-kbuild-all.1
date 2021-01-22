Content-Type: multipart/mixed; boundary="===============8838845574941707166=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V6 02/13] sbitmap: maintain allocation round_robin in sbitmap
Date: Fri, 22 Jan 2021 10:38:10 +0800
Message-ID: <20210122023810.GA509982@T590>
In-Reply-To: <202101181225.2uTanVzh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8838845574941707166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 12:42:07PM +0800, kernel test robot wrote:
> Hi Ming,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on mkp-scsi/for-next]
> [also build test ERROR on scsi/for-next block/for-next v5.11-rc4 next-202=
10115]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Ming-Lei/blk-mq-scsi-tra=
cking-device-queue-depth-via-sbitmap/20210118-085444
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-=
next
> config: powerpc-randconfig-r001-20210118 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 95d1=
46182fdf2315e74943b93fb3bb0cbafc5d89)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://github.com/0day-ci/linux/commit/16943bc0fa2683fd8d85547=
45fffe62394a42ec9
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Ming-Lei/blk-mq-scsi-tracking-de=
vice-queue-depth-via-sbitmap/20210118-085444
>         git checkout 16943bc0fa2683fd8d8554745fffe62394a42ec9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    drivers/vhost/scsi.c:617:40: error: too many arguments to function cal=
l, expected 2, have 3
>            tag =3D sbitmap_get(&svq->scsi_tags, 0, false);
>                  ~~~~~~~~~~~                     ^~~~~
>    include/linux/sbitmap.h:185:5: note: 'sbitmap_get' declared here
>    int sbitmap_get(struct sbitmap *sb, unsigned int alloc_hint);
>        ^
> >> drivers/vhost/scsi.c:1515:22: error: too few arguments to function cal=
l, expected 6, have 5
>                                  NUMA_NO_NODE))
>                                              ^
>    include/linux/sbitmap.h:153:5: note: 'sbitmap_init_node' declared here
>    int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shif=
t,
>        ^
>    2 errors generated.
> =


Thanks for the report, and this failure has been fixed in V7.



-- =

Ming

--===============8838845574941707166==--

