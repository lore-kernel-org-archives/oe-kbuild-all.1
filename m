Content-Type: multipart/mixed; boundary="===============0000471451174915194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/media/common/videobuf2/videobuf2-core.c:391:12: warning: stack frame size of 2080 bytes in function '__vb2_queue_alloc'
Date: Sun, 30 May 2021 18:35:17 +0800
Message-ID: <202105301809.JFoKgL0Y-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0000471451174915194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b90e90f40b4ff23c753126008bf4713a42353af6
commit: bac63f1239aceb092e94fee3ef112dbaea79b372 media: vb2: set cache sync=
 hints when init buffers
date:   6 months ago
config: powerpc64-randconfig-r034-20210530 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bc6799=
f2f79f0ae87e9f1ebf9d25ba799fbd25a9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbac63f1239aceb092e94fee3ef112dbaea79b372
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bac63f1239aceb092e94fee3ef112dbaea79b372
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:249:1: note: expanded from here
   __do_insb
   ^
   arch/powerpc/include/asm/io.h:541:56: note: expanded from macro '__do_in=
sb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:251:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:542:56: note: expanded from macro '__do_in=
sw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:2:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:543:56: note: expanded from macro '__do_in=
sl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (=
n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:4:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:544:58: note: expanded from macro '__do_ou=
tsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:6:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:545:58: note: expanded from macro '__do_ou=
tsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/media/common/videobuf2/videobuf2-core.c:29:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:604:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer ari=
thmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c=
),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   arch/powerpc/include/asm/io.h:601:3: note: expanded from macro 'DEF_PCI_=
AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:8:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:546:58: note: expanded from macro '__do_ou=
tsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n=
))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/media/common/videobuf2/videobuf2-core.c:391:12: warning: stack f=
rame size of 2080 bytes in function '__vb2_queue_alloc' [-Wframe-larger-tha=
n=3D]
   static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
              ^
   14 warnings generated.


vim +/__vb2_queue_alloc +391 drivers/media/common/videobuf2/videobuf2-core.c

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  383  =

2a87af6ba1b9df drivers/media/v4l2-core/videobuf2-core.c        Mauro Carval=
ho Chehab 2017-11-27  384  /*
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  385   * __vb2_queue_alloc() - allocate videobuf buffe=
r structures and (for MMAP type)
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  386   * video buffer memory for all buffers/planes on=
 the queue and initializes the
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  387   * queue
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  388   *
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  389   * Returns the number of buffers successfully al=
located.
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  390   */
bed04f93424737 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung=
          2015-10-06 @391  static int __vb2_queue_alloc(struct vb2_queue *q=
, enum vb2_memory memory,
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  392  			     unsigned int num_buffers, unsigned int n=
um_planes,
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  393  			     const unsigned plane_sizes[VB2_MAX_PLANE=
S])
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  394  {
489648afcd309b drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  395  	unsigned int buffer, plane;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  396  	struct vb2_buffer *vb;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  397  	int ret;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  398  =

df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carval=
ho Chehab 2017-12-28  399  	/* Ensure that q->num_buffers+num_buffers is be=
low VB2_MAX_FRAME */
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carval=
ho Chehab 2017-12-28  400  	num_buffers =3D min_t(unsigned int, num_buffers,
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carval=
ho Chehab 2017-12-28  401  			    VB2_MAX_FRAME - q->num_buffers);
df93dc61b0d8b1 drivers/media/common/videobuf/videobuf2-core.c  Mauro Carval=
ho Chehab 2017-12-28  402  =

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  403  	for (buffer =3D 0; buffer < num_buffers; ++buff=
er) {
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  404  		/* Allocate videobuf buffer structures */
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  405  		vb =3D kzalloc(q->buf_struct_size, GFP_KERNEL);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  406  		if (!vb) {
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinc=
hart      2020-06-21  407  			dprintk(q, 1, "memory alloc for buffer struct=
 failed\n");
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  408  			break;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  409  		}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  410  =

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  411  		vb->state =3D VB2_BUF_STATE_DEQUEUED;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  412  		vb->vb2_queue =3D q;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  413  		vb->num_planes =3D num_planes;
2d7007153f0c9b drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung=
          2015-09-22  414  		vb->index =3D q->num_buffers + buffer;
2d7007153f0c9b drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung=
          2015-09-22  415  		vb->type =3D q->type;
2d7007153f0c9b drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung=
          2015-09-22  416  		vb->memory =3D memory;
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  417  		/*
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  418  		 * We need to set these flags here so that the=
 videobuf2 core
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  419  		 * will call ->prepare()/->finish() cache sync=
/flush on vb2
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  420  		 * buffers when appropriate. However, we can a=
void explicit
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  421  		 * ->prepare() and ->finish() cache sync for D=
MABUF buffers,
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  422  		 * because DMA exporter takes care of it.
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  423  		 */
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  424  		if (q->memory !=3D VB2_MEMORY_DMABUF) {
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  425  			vb->need_cache_sync_on_prepare =3D 1;
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  426  			vb->need_cache_sync_on_finish =3D 1;
bac63f1239aceb drivers/media/common/videobuf2/videobuf2-core.c Sergey Senoz=
hatsky    2020-11-30  427  		}
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  428  		for (plane =3D 0; plane < num_planes; ++plane)=
 {
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  429  			vb->planes[plane].length =3D plane_sizes[plan=
e];
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  430  			vb->planes[plane].min_length =3D plane_sizes[=
plane];
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  431  		}
8e013700bc1280 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil=
          2018-06-01  432  		call_void_bufop(q, init_buffer, vb);
8e013700bc1280 drivers/media/common/videobuf2/videobuf2-core.c Hans Verkuil=
          2018-06-01  433  =

e32f856ab29e93 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  434  		q->bufs[vb->index] =3D vb;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  435  =

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  436  		/* Allocate video buffer memory for the MMAP t=
ype */
bed04f93424737 drivers/media/v4l2-core/videobuf2-core.c        Junghak Sung=
          2015-10-06  437  		if (memory =3D=3D VB2_MEMORY_MMAP) {
c1426bc727b788 drivers/media/video/videobuf2-core.c            Marek Szypro=
wski      2011-08-24  438  			ret =3D __vb2_buf_mem_alloc(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  439  			if (ret) {
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinc=
hart      2020-06-21  440  				dprintk(q, 1, "failed allocating memory for =
buffer %d\n",
8720427c198b6d drivers/media/v4l2-core/videobuf2-core.c        Mauro Carval=
ho Chehab 2016-10-18  441  					buffer);
e32f856ab29e93 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  442  				q->bufs[vb->index] =3D NULL;
58e1ba3ce6b2c8 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  443  				kfree(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  444  				break;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  445  			}
20eedf0e169180 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  446  			__setup_offsets(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  447  			/*
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  448  			 * Call the driver-provided buffer initializa=
tion
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  449  			 * callback, if given. An error in initializa=
tion
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  450  			 * results in queue setup failure.
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  451  			 */
b5b4541eef8eac drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2014-01-29  452  			ret =3D call_vb_qop(vb, buf_init, vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  453  			if (ret) {
b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinc=
hart      2020-06-21  454  				dprintk(q, 1, "buffer %d %p initialization f=
ailed\n",
8720427c198b6d drivers/media/v4l2-core/videobuf2-core.c        Mauro Carval=
ho Chehab 2016-10-18  455  					buffer, vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  456  				__vb2_buf_mem_free(vb);
e32f856ab29e93 drivers/media/v4l2-core/videobuf2-core.c        Hans Verkuil=
          2015-11-20  457  				q->bufs[vb->index] =3D NULL;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  458  				kfree(vb);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  459  				break;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  460  			}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  461  		}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  462  	}
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  463  =

b820935b35479e drivers/media/common/videobuf2/videobuf2-core.c Laurent Pinc=
hart      2020-06-21  464  	dprintk(q, 3, "allocated %d buffers, %d plane(s=
) each\n",
2d86401c2cbfce drivers/media/video/videobuf2-core.c            Guennadi Lia=
khovetski 2011-09-28  465  		buffer, num_planes);
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  466  =

e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  467  	return buffer;
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  468  }
e23ccc0ad92586 drivers/media/video/videobuf2-core.c            Pawel Osciak=
          2010-10-11  469  =


:::::: The code at line 391 was first introduced by commit
:::::: bed04f9342473743fc96b71c3130f645c718bd47 [media] media: videobuf2: R=
eplace v4l2-specific data with vb2 data

:::::: TO: Junghak Sung <jh1009.sung@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0000471451174915194==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0000471451174915194==--

