Content-Type: multipart/mixed; boundary="===============3303225578642589959=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [usb:usb-testing 7/9] drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Thu, 06 May 2021 23:37:15 +0800
Message-ID: <202105062309.R5efCyjE-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3303225578642589959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   83a9d2a05296bf5a5fee13206dc4499a40978908
commit: 54dacbcc6b8921a211bd736d2f208d3c78594241 [7/9] usb: isp1760: move t=
o regmap for register access
config: h8300-randconfig-s032-20210506 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/co=
mmit/?id=3D54dacbcc6b8921a211bd736d2f208d3c78594241
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/=
gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout 54dacbcc6b8921a211bd736d2f208d3c78594241
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:246:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c: note: in included file (through inclu=
de/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:267:23: sparse: sparse: cast to restri=
cted __le32
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/isp1760/isp1760-hcd.c:301:38: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:301:38: sparse:     expected unsigned =
int [usertype] b
   drivers/usb/isp1760/isp1760-hcd.c:301:38: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:322:30: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int [usertyp=
e] b @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:322:30: sparse:     expected unsigned =
int [usertype] b
   drivers/usb/isp1760/isp1760-hcd.c:322:30: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:346:50: sparse: sparse: incorrect type=
 in argument 3 (different base types) @@     expected unsigned int const [u=
sertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:346:50: sparse:     expected unsigned =
int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:346:50: sparse:     got restricted __d=
w *
   drivers/usb/isp1760/isp1760-hcd.c:350:60: sparse: sparse: incorrect type=
 in argument 3 (different base types) @@     expected unsigned int const [u=
sertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:350:60: sparse:     expected unsigned =
int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:350:60: sparse:     got restricted __d=
w *
>> drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected struct usb_hcd *h=
cd @@     got void [noderef] __iomem *regs @@
   drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse:     expected struct us=
b_hcd *hcd
   drivers/usb/isp1760/isp1760-hcd.c:485:42: sparse:     got void [noderef]=
 __iomem *regs
   drivers/usb/isp1760/isp1760-hcd.c:486:42: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected struct usb_hcd *h=
cd @@     got void [noderef] __iomem *regs @@
   drivers/usb/isp1760/isp1760-hcd.c:486:42: sparse:     expected struct us=
b_hcd *hcd
   drivers/usb/isp1760/isp1760-hcd.c:486:42: sparse:     got void [noderef]=
 __iomem *regs
   drivers/usb/isp1760/isp1760-hcd.c:587:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw0 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:587:18: sparse:     expected restricte=
d __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:587:18: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:588:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:588:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:588:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:589:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:589:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:589:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:590:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:590:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:590:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:593:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw1 @@     got unsigned int @@
   drivers/usb/isp1760/isp1760-hcd.c:593:18: sparse:     expected restricte=
d __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:593:18: sparse:     got unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:594:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:594:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:594:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:595:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:595:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:595:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:598:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:598:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:598:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:600:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:600:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:600:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:605:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:605:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:605:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:607:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:607:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:607:34: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:609:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:609:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:609:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:610:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:610:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:610:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:615:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:615:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:615:34: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:620:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:620:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:620:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:623:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:623:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:623:34: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:627:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:627:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:627:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:628:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:628:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:628:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:631:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:631:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:631:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:632:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:632:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:632:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:635:34: sparse: sparse: invalid assign=
ment: &=3D
   drivers/usb/isp1760/isp1760-hcd.c:635:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:635:34: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:637:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:637:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:637:34: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:640:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:640:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:640:18: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:642:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:642:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:642:18: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:687:26: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw5 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:687:26: sparse:     expected restricte=
d __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:687:26: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:693:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:693:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:693:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:694:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw4 @@     got unsigned int [assigned] [usertype] usof @@
   drivers/usb/isp1760/isp1760-hcd.c:694:18: sparse:     expected restricte=
d __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:694:18: sparse:     got unsigned int [=
assigned] [usertype] usof
   drivers/usb/isp1760/isp1760-hcd.c:1027:13: sparse: sparse: bad assignmen=
t (>>=3D) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1032:16: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1037:33: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1058:29: sparse: sparse: bad assignmen=
t (>>=3D) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1071:16: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1072:24: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1074:26: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1089:17: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1089:47: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1095:14: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1095:49: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1173:40: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1176:41: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1186:38: sparse: sparse: restricted __=
dw degrades to integer

vim +485 drivers/usb/isp1760/isp1760-hcd.c

   463	=

   464	/* one-time init, only for memory state */
   465	static int priv_init(struct usb_hcd *hcd)
   466	{
   467		struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
   468		u32 isoc_cache;
   469		u32 isoc_thres;
   470	=

   471		int i;
   472	=

   473		spin_lock_init(&priv->lock);
   474	=

   475		for (i =3D 0; i < QH_END; i++)
   476			INIT_LIST_HEAD(&priv->qh_list[i]);
   477	=

   478		/*
   479		 * hw default: 1K periodic list heads, one per frame.
   480		 * periodic_size can shrink by USBCMD update if hcc_params allows.
   481		 */
   482		priv->periodic_size =3D DEFAULT_I_TDPS;
   483	=

   484		/* controllers may cache some of the periodic schedule ... */
 > 485		isoc_cache =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_CACHE);
   486		isoc_thres =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_THRES);
   487	=

   488		/* full frame cache */
   489		if (isoc_cache)
   490			priv->i_thresh =3D 8;
   491		else /* N microframes cached */
   492			priv->i_thresh =3D 2 + isoc_thres;
   493	=

   494		return 0;
   495	}
   496	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3303225578642589959==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/HSeIkWZ//0A/vdHqdRwAQA=
--===============3303225578642589959==--

