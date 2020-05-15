Content-Type: multipart/mixed; boundary="===============9202662790763144259=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Fri, 15 May 2020 21:43:26 +0800
Message-ID: <202005152142.AWvx4xc5%lkp@intel.com>
In-Reply-To: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9202662790763144259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Ramuthevar,Vadivel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm-soc/for-next linus/master linux/master v5.7=
-rc5 next-20200514]
[cannot apply to mtd/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Ramuthevar-Vadivel-Murugan=
X/mtd-rawnand-Add-NAND-controller-support-on-Intel-LGM-SoC/20200515-185904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@    expected unsigned in=
t val @@    got restricted __be32 [assignedunsigned int val @@
>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expected=
 unsigned int val
>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got rest=
ricted __be32 [assigned] [usertype] reg
   drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@    expected unsigned in=
t val @@    got restricted __be32 [assignedunsigned int val @@
   drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    expected=
 unsigned int val
   drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got rest=
ricted __be32 [assigned] [usertype] reg

vim +441 drivers/mtd/nand/raw/intel-nand-controller.c

   420	=

   421	static int ebu_nand_write_page_hwecc(struct nand_chip *chip, const u=
8 *buf,
   422					     int oob_required, int page)
   423	{
   424		struct mtd_info *mtd =3D nand_to_mtd(chip);
   425		struct ebu_nand_controller *ebu_host =3D nand_get_controller_data(c=
hip);
   426		void __iomem *int_sta =3D ebu_host->hsnand + HSNAND_INT_STA;
   427		int ret, val, x;
   428		__be32 reg;
   429	=

   430		ebu_nand_trigger(ebu_host, page, NAND_CMD_SEQIN);
   431	=

   432		ret =3D ebu_dma_start(ebu_host, DMA_MEM_TO_DEV, buf, mtd->writesize=
);
   433		if (ret)
   434			return ret;
   435	=

   436		if (oob_required) {
   437			const u8 *pdata;
   438	=

   439			pdata =3D chip->oob_poi;
   440			reg =3D cpu_to_be32(*pdata++);
 > 441			writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
   442	=

   443			reg =3D cpu_to_be32(*pdata);
   444			writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
   445		}
   446	=

   447		ret =3D readl_poll_timeout_atomic(int_sta, val,
   448						!(val & HSNAND_INT_STA_WR_C), 10, 1000);
   449		if (ret)
   450			return -EIO;
   451	=

   452		x =3D readl(ebu_host->hsnand + HSNAND_CTL);
   453		x &=3D ~HSNAND_CTL_GO;
   454		writel(x, ebu_host->hsnand + HSNAND_CTL);
   455	=

   456		return 0;
   457	}
   458	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9202662790763144259==--

