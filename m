Content-Type: multipart/mixed; boundary="===============7279034771848439097=="
MIME-Version: 1.0
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kbuild-all@lists.01.org
Subject: Re: [mtd:nand/next 6/7] drivers/mtd/nand/raw/qcom_nandc.c:765:7: error: 'nandc' undeclared
Date: Mon, 10 May 2021 18:20:39 +0200
Message-ID: <20210510182039.4dec6952@xps13>
In-Reply-To: <202105102310.Ywar24xP-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7279034771848439097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

kernel test robot <lkp@intel.com> wrote on Mon, 10 May 2021 23:02:14
+0800:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nan=
d/next
> head:   612a421079a7fa3042fd713eb62b455aac1a0e88
> commit: 4ea7f88f173804f344988f580fb41ba96f7666da [6/7] mtd: rawnand: qcom=
: avoid writing to obsolete register
> config: arc-randconfig-p001-20210510 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/c=
ommit/?id=3D4ea7f88f173804f344988f580fb41ba96f7666da
>         git remote add mtd https://git.kernel.org/pub/scm/linux/kernel/gi=
t/mtd/linux.git
>         git fetch --no-tags mtd nand/next
>         git checkout 4ea7f88f173804f344988f580fb41ba96f7666da
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Darc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    drivers/mtd/nand/raw/qcom_nandc.c: In function 'update_rw_regs':
> >> drivers/mtd/nand/raw/qcom_nandc.c:765:7: error: 'nandc' undeclared (fi=
rst use in this function)  =

>      765 |  if (!nandc->props->qpic_v2)
>          |       ^~~~~

I'll drop de patch and wait for a v3 which fixes this.

Thanks,
Miqu=C3=A8l
--===============7279034771848439097==--

