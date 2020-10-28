Content-Type: multipart/mixed; boundary="===============0017470362298882116=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/dma/mediatek/mtk-hsdma.c:451:17: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 29 Oct 2020 07:11:36 +0800
Message-ID: <202010290733.VhRpOMqe-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0017470362298882116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
commit: a5460b5e5fb82656807840d40d3deaecad094044 READ_ONCE: Simplify implem=
entations of {READ,WRITE}_ONCE()
date:   7 months ago
config: xtensa-randconfig-s031-20201029 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-56-gc09e8239-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da5460b5e5fb82656807840d40d3deaecad094044
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a5460b5e5fb82656807840d40d3deaecad094044
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dxtensa =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/dma/mediatek/mtk-hsdma.c:451:17: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 vola=
tile @@     got unsigned int [usertype] src @@
   drivers/dma/mediatek/mtk-hsdma.c:451:17: sparse:     expected restricted=
 __le32 volatile
>> drivers/dma/mediatek/mtk-hsdma.c:451:17: sparse:     got unsigned int [u=
sertype] src
   drivers/dma/mediatek/mtk-hsdma.c:452:17: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/dma/mediatek/mtk-hsdma.c:452:17: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 vola=
tile @@     got unsigned int @@
   drivers/dma/mediatek/mtk-hsdma.c:452:17: sparse:     expected restricted=
 __le32 volatile
   drivers/dma/mediatek/mtk-hsdma.c:452:17: sparse:     got unsigned int
>> drivers/dma/mediatek/mtk-hsdma.c:456:17: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 vola=
tile @@     got unsigned int [usertype] dest @@
   drivers/dma/mediatek/mtk-hsdma.c:456:17: sparse:     expected restricted=
 __le32 volatile
>> drivers/dma/mediatek/mtk-hsdma.c:456:17: sparse:     got unsigned int [u=
sertype] dest
   drivers/dma/mediatek/mtk-hsdma.c:457:17: sparse: sparse: incorrect type =
in assignment (different base types) @@     expected restricted __le32 vola=
tile @@     got int @@
   drivers/dma/mediatek/mtk-hsdma.c:457:17: sparse:     expected restricted=
 __le32 volatile
   drivers/dma/mediatek/mtk-hsdma.c:457:17: sparse:     got int
   drivers/dma/mediatek/mtk-hsdma.c:580:33: sparse: sparse: restricted __le=
32 degrades to integer
   drivers/dma/mediatek/mtk-hsdma.c:604:26: sparse: sparse: Using plain int=
eger as NULL pointer
   drivers/dma/mediatek/mtk-hsdma.c:878:18: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected restricted __le32 [us=
ertype] ddone @@     got unsigned long @@
   drivers/dma/mediatek/mtk-hsdma.c:878:18: sparse:     expected restricted=
 __le32 [usertype] ddone
   drivers/dma/mediatek/mtk-hsdma.c:878:18: sparse:     got unsigned long
   drivers/dma/mediatek/mtk-hsdma.c:879:16: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected restricted __le32 [us=
ertype] ls0 @@     got unsigned long @@
   drivers/dma/mediatek/mtk-hsdma.c:879:16: sparse:     expected restricted=
 __le32 [usertype] ls0
   drivers/dma/mediatek/mtk-hsdma.c:879:16: sparse:     got unsigned long
   drivers/dma/mediatek/mtk-hsdma.c:883:18: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected restricted __le32 [us=
ertype] ddone @@     got unsigned long @@
   drivers/dma/mediatek/mtk-hsdma.c:883:18: sparse:     expected restricted=
 __le32 [usertype] ddone
   drivers/dma/mediatek/mtk-hsdma.c:883:18: sparse:     got unsigned long
   drivers/dma/mediatek/mtk-hsdma.c:884:16: sparse: sparse: incorrect type =
in initializer (different base types) @@     expected restricted __le32 [us=
ertype] ls0 @@     got unsigned long @@
   drivers/dma/mediatek/mtk-hsdma.c:884:16: sparse:     expected restricted=
 __le32 [usertype] ls0
   drivers/dma/mediatek/mtk-hsdma.c:884:16: sparse:     got unsigned long
   drivers/dma/mediatek/mtk-hsdma.c: note: in included file (through arch/x=
tensa/include/asm/io.h, include/linux/scatterlist.h, include/linux/dmaengin=
e.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32

vim +451 drivers/dma/mediatek/mtk-hsdma.c

548c4597e984b7 Sean Wang 2018-03-15  411  =

548c4597e984b7 Sean Wang 2018-03-15  412  static int mtk_hsdma_issue_pendin=
g_vdesc(struct mtk_hsdma_device *hsdma,
548c4597e984b7 Sean Wang 2018-03-15  413  					 struct mtk_hsdma_pchan *pc,
548c4597e984b7 Sean Wang 2018-03-15  414  					 struct mtk_hsdma_vdesc *hvd)
548c4597e984b7 Sean Wang 2018-03-15  415  {
548c4597e984b7 Sean Wang 2018-03-15  416  	struct mtk_hsdma_ring *ring =3D =
&pc->ring;
548c4597e984b7 Sean Wang 2018-03-15  417  	struct mtk_hsdma_pdesc *txd, *rx=
d;
548c4597e984b7 Sean Wang 2018-03-15  418  	u16 reserved, prev, tlen, num_sg=
s;
548c4597e984b7 Sean Wang 2018-03-15  419  	unsigned long flags;
548c4597e984b7 Sean Wang 2018-03-15  420  =

548c4597e984b7 Sean Wang 2018-03-15  421  	/* Protect against PC is accesse=
d by multiple VCs simultaneously */
548c4597e984b7 Sean Wang 2018-03-15  422  	spin_lock_irqsave(&hsdma->lock, =
flags);
548c4597e984b7 Sean Wang 2018-03-15  423  =

548c4597e984b7 Sean Wang 2018-03-15  424  	/*
548c4597e984b7 Sean Wang 2018-03-15  425  	 * Reserve rooms, where pc->nr_f=
ree is used to track how many free
548c4597e984b7 Sean Wang 2018-03-15  426  	 * rooms in the ring being updat=
ed in user and IRQ context.
548c4597e984b7 Sean Wang 2018-03-15  427  	 */
548c4597e984b7 Sean Wang 2018-03-15  428  	num_sgs =3D DIV_ROUND_UP(hvd->le=
n, MTK_HSDMA_MAX_LEN);
548c4597e984b7 Sean Wang 2018-03-15  429  	reserved =3D min_t(u16, num_sgs,=
 atomic_read(&pc->nr_free));
548c4597e984b7 Sean Wang 2018-03-15  430  =

548c4597e984b7 Sean Wang 2018-03-15  431  	if (!reserved) {
548c4597e984b7 Sean Wang 2018-03-15  432  		spin_unlock_irqrestore(&hsdma->=
lock, flags);
548c4597e984b7 Sean Wang 2018-03-15  433  		return -ENOSPC;
548c4597e984b7 Sean Wang 2018-03-15  434  	}
548c4597e984b7 Sean Wang 2018-03-15  435  =

548c4597e984b7 Sean Wang 2018-03-15  436  	atomic_sub(reserved, &pc->nr_fre=
e);
548c4597e984b7 Sean Wang 2018-03-15  437  =

548c4597e984b7 Sean Wang 2018-03-15  438  	while (reserved--) {
548c4597e984b7 Sean Wang 2018-03-15  439  		/* Limit size by PD capability =
for valid data moving */
548c4597e984b7 Sean Wang 2018-03-15  440  		tlen =3D (hvd->len > MTK_HSDMA_=
MAX_LEN) ?
548c4597e984b7 Sean Wang 2018-03-15  441  		       MTK_HSDMA_MAX_LEN : hvd-=
>len;
548c4597e984b7 Sean Wang 2018-03-15  442  =

548c4597e984b7 Sean Wang 2018-03-15  443  		/*
548c4597e984b7 Sean Wang 2018-03-15  444  		 * Setup PDs using the remainin=
g VD info mapped on those
548c4597e984b7 Sean Wang 2018-03-15  445  		 * reserved rooms. And since RX=
D is shared memory between the
548c4597e984b7 Sean Wang 2018-03-15  446  		 * host and the device allocate=
d by dma_alloc_coherent call,
548c4597e984b7 Sean Wang 2018-03-15  447  		 * the helper macro WRITE_ONCE =
can ensure the data written to
548c4597e984b7 Sean Wang 2018-03-15  448  		 * RAM would really happens.
548c4597e984b7 Sean Wang 2018-03-15  449  		 */
548c4597e984b7 Sean Wang 2018-03-15  450  		txd =3D &ring->txd[ring->cur_tp=
tr];
548c4597e984b7 Sean Wang 2018-03-15 @451  		WRITE_ONCE(txd->desc1, hvd->src=
);
548c4597e984b7 Sean Wang 2018-03-15  452  		WRITE_ONCE(txd->desc2,
548c4597e984b7 Sean Wang 2018-03-15  453  			   hsdma->soc->ls0 | MTK_HSDMA=
_DESC_PLEN(tlen));
548c4597e984b7 Sean Wang 2018-03-15  454  =

548c4597e984b7 Sean Wang 2018-03-15  455  		rxd =3D &ring->rxd[ring->cur_tp=
tr];
548c4597e984b7 Sean Wang 2018-03-15 @456  		WRITE_ONCE(rxd->desc1, hvd->des=
t);
548c4597e984b7 Sean Wang 2018-03-15  457  		WRITE_ONCE(rxd->desc2, MTK_HSDM=
A_DESC_PLEN(tlen));
548c4597e984b7 Sean Wang 2018-03-15  458  =

548c4597e984b7 Sean Wang 2018-03-15  459  		/* Associate VD, the PD belonge=
d to */
548c4597e984b7 Sean Wang 2018-03-15  460  		ring->cb[ring->cur_tptr].vd =3D=
 &hvd->vd;
548c4597e984b7 Sean Wang 2018-03-15  461  =

548c4597e984b7 Sean Wang 2018-03-15  462  		/* Move forward the pointer of =
TX ring */
548c4597e984b7 Sean Wang 2018-03-15  463  		ring->cur_tptr =3D MTK_HSDMA_NE=
XT_DESP_IDX(ring->cur_tptr,
548c4597e984b7 Sean Wang 2018-03-15  464  							 MTK_DMA_SIZE);
548c4597e984b7 Sean Wang 2018-03-15  465  =

548c4597e984b7 Sean Wang 2018-03-15  466  		/* Update VD with remaining dat=
a */
548c4597e984b7 Sean Wang 2018-03-15  467  		hvd->src  +=3D tlen;
548c4597e984b7 Sean Wang 2018-03-15  468  		hvd->dest +=3D tlen;
548c4597e984b7 Sean Wang 2018-03-15  469  		hvd->len  -=3D tlen;
548c4597e984b7 Sean Wang 2018-03-15  470  	}
548c4597e984b7 Sean Wang 2018-03-15  471  =

548c4597e984b7 Sean Wang 2018-03-15  472  	/*
548c4597e984b7 Sean Wang 2018-03-15  473  	 * Tagging flag for the last PD =
for VD will be responsible for
548c4597e984b7 Sean Wang 2018-03-15  474  	 * completing VD.
548c4597e984b7 Sean Wang 2018-03-15  475  	 */
548c4597e984b7 Sean Wang 2018-03-15  476  	if (!hvd->len) {
548c4597e984b7 Sean Wang 2018-03-15  477  		prev =3D MTK_HSDMA_LAST_DESP_ID=
X(ring->cur_tptr, MTK_DMA_SIZE);
548c4597e984b7 Sean Wang 2018-03-15  478  		ring->cb[prev].flag =3D MTK_HSD=
MA_VDESC_FINISHED;
548c4597e984b7 Sean Wang 2018-03-15  479  	}
548c4597e984b7 Sean Wang 2018-03-15  480  =

548c4597e984b7 Sean Wang 2018-03-15  481  	/* Ensure all changes indeed don=
e before we're going on */
548c4597e984b7 Sean Wang 2018-03-15  482  	wmb();
548c4597e984b7 Sean Wang 2018-03-15  483  =

548c4597e984b7 Sean Wang 2018-03-15  484  	/*
548c4597e984b7 Sean Wang 2018-03-15  485  	 * Updating into hardware the po=
inter of TX ring lets HSDMA to take
548c4597e984b7 Sean Wang 2018-03-15  486  	 * action for those pending PDs.
548c4597e984b7 Sean Wang 2018-03-15  487  	 */
548c4597e984b7 Sean Wang 2018-03-15  488  	mtk_dma_write(hsdma, MTK_HSDMA_T=
X_CPU, ring->cur_tptr);
548c4597e984b7 Sean Wang 2018-03-15  489  =

548c4597e984b7 Sean Wang 2018-03-15  490  	spin_unlock_irqrestore(&hsdma->l=
ock, flags);
548c4597e984b7 Sean Wang 2018-03-15  491  =

548c4597e984b7 Sean Wang 2018-03-15  492  	return 0;
548c4597e984b7 Sean Wang 2018-03-15  493  }
548c4597e984b7 Sean Wang 2018-03-15  494  =


:::::: The code at line 451 was first introduced by commit
:::::: 548c4597e984b79aad8190235d664f1c3a433f94 dmaengine: mediatek: Add Me=
diaTek High-Speed DMA controller for MT7622 and MT7623 SoC

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0017470362298882116==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
uIhaVGHgkPwXl7chZAHpAQA=
--===============0017470362298882116==--

