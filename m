Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB6C3C34
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678050947; x=1709586947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w81DSHgpCP2heN6aDGHQnEkJu85TZ9ri+FYAS1CGWKk=;
  b=bUnMy2LiIXCRKlK+to13CQJDjYdp8cJW/oEWWnP0U43DuPgPSF0GD482
   HMH/ey0gNCHjMInhKp7vVKFXdkVDJlTzPAP7D9uv59wvBfVRxKPdvq+46
   kift/0VrOGSUdE7LbeIxgeXHsVQ/XA3CgWOnYykG+rfItGQmhTEBjSC+L
   Ox/+0df4OtgCsZLB2YUZT1Rk8/mNlYQYwiUOvjV5ckU6kVGsjaMUlund1
   64OtKHZ2c3e15a1Y43oy+1VS232T7RQ9aQdgfECMso/F1v7wSiJx6w5H0
   OEtn1PYP5NM8bvRCmMdm4nKIJf09X7/qOJd6BjtssjEH5FubAz+TTTQ7P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337739551"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337739551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 13:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="708439301"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="708439301"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Mar 2023 13:15:45 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYvho-00033u-0k;
	Sun, 05 Mar 2023 21:15:44 +0000
Date: Mon, 6 Mar 2023 05:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [linux-stable-rc:queue/5.4 157/213]
 drivers/mtd/nand/raw/fsl_elbc_nand.c:768:22: error: 'struct nand_ecc_ctrl'
 has no member named 'engine_type'
Message-ID: <202303060514.1ziBICF7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   7e4264b9da39196223ec9b479de16f6754975db8
commit: 842272b5ce22bb8e260a44c95281084265a6eef3 [157/213] mtd: rawnand: fsl_elbc: Propagate HW ECC settings to HW
config: powerpc-randconfig-r004-20230305 (https://download.01.org/0day-ci/archive/20230306/202303060514.1ziBICF7-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=842272b5ce22bb8e260a44c95281084265a6eef3
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 842272b5ce22bb8e260a44c95281084265a6eef3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303060514.1ziBICF7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/raw/fsl_elbc_nand.c: In function 'fsl_elbc_attach_chip':
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:768:22: error: 'struct nand_ecc_ctrl' has no member named 'engine_type'
     768 |         if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
         |                      ^
>> drivers/mtd/nand/raw/fsl_elbc_nand.c:768:38: error: 'NAND_ECC_ENGINE_TYPE_ON_HOST' undeclared (first use in this function)
     768 |         if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/fsl_elbc_nand.c:768:38: note: each undeclared identifier is reported only once for each function it appears in


vim +768 drivers/mtd/nand/raw/fsl_elbc_nand.c

   722	
   723	static int fsl_elbc_attach_chip(struct nand_chip *chip)
   724	{
   725		struct mtd_info *mtd = nand_to_mtd(chip);
   726		struct fsl_elbc_mtd *priv = nand_get_controller_data(chip);
   727		struct fsl_lbc_ctrl *ctrl = priv->ctrl;
   728		struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
   729		unsigned int al;
   730		u32 br;
   731	
   732		switch (chip->ecc.mode) {
   733		/*
   734		 * if ECC was not chosen in DT, decide whether to use HW or SW ECC from
   735		 * CS Base Register
   736		 */
   737		case NAND_ECC_NONE:
   738			/* If CS Base Register selects full hardware ECC then use it */
   739			if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
   740			    BR_DECC_CHK_GEN) {
   741				chip->ecc.read_page = fsl_elbc_read_page;
   742				chip->ecc.write_page = fsl_elbc_write_page;
   743				chip->ecc.write_subpage = fsl_elbc_write_subpage;
   744	
   745				chip->ecc.mode = NAND_ECC_HW;
   746				mtd_set_ooblayout(mtd, &fsl_elbc_ooblayout_ops);
   747				chip->ecc.size = 512;
   748				chip->ecc.bytes = 3;
   749				chip->ecc.strength = 1;
   750			} else {
   751				/* otherwise fall back to default software ECC */
   752				chip->ecc.mode = NAND_ECC_SOFT;
   753				chip->ecc.algo = NAND_ECC_HAMMING;
   754			}
   755			break;
   756	
   757		/* if SW ECC was chosen in DT, we do not need to set anything here */
   758		case NAND_ECC_SOFT:
   759			break;
   760	
   761		/* should we also implement NAND_ECC_HW to do as the code above? */
   762		default:
   763			return -EINVAL;
   764		}
   765	
   766		/* enable/disable HW ECC checking and generating based on if HW ECC was chosen */
   767		br = in_be32(&lbc->bank[priv->bank].br) & ~BR_DECC;
 > 768		if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
   769			out_be32(&lbc->bank[priv->bank].br, br | BR_DECC_CHK_GEN);
   770		else
   771			out_be32(&lbc->bank[priv->bank].br, br | BR_DECC_OFF);
   772	
   773		/* calculate FMR Address Length field */
   774		al = 0;
   775		if (chip->pagemask & 0xffff0000)
   776			al++;
   777		if (chip->pagemask & 0xff000000)
   778			al++;
   779	
   780		priv->fmr |= al << FMR_AL_SHIFT;
   781	
   782		dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips = %d\n",
   783		        nanddev_ntargets(&chip->base));
   784		dev_dbg(priv->dev, "fsl_elbc_init: nand->chipsize = %lld\n",
   785		        nanddev_target_size(&chip->base));
   786		dev_dbg(priv->dev, "fsl_elbc_init: nand->pagemask = %8x\n",
   787		        chip->pagemask);
   788		dev_dbg(priv->dev, "fsl_elbc_init: nand->legacy.chip_delay = %d\n",
   789		        chip->legacy.chip_delay);
   790		dev_dbg(priv->dev, "fsl_elbc_init: nand->badblockpos = %d\n",
   791		        chip->badblockpos);
   792		dev_dbg(priv->dev, "fsl_elbc_init: nand->chip_shift = %d\n",
   793		        chip->chip_shift);
   794		dev_dbg(priv->dev, "fsl_elbc_init: nand->page_shift = %d\n",
   795		        chip->page_shift);
   796		dev_dbg(priv->dev, "fsl_elbc_init: nand->phys_erase_shift = %d\n",
   797		        chip->phys_erase_shift);
   798		dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.mode = %d\n",
   799		        chip->ecc.mode);
   800		dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.steps = %d\n",
   801		        chip->ecc.steps);
   802		dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.bytes = %d\n",
   803		        chip->ecc.bytes);
   804		dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.total = %d\n",
   805		        chip->ecc.total);
   806		dev_dbg(priv->dev, "fsl_elbc_init: mtd->ooblayout = %p\n",
   807			mtd->ooblayout);
   808		dev_dbg(priv->dev, "fsl_elbc_init: mtd->flags = %08x\n", mtd->flags);
   809		dev_dbg(priv->dev, "fsl_elbc_init: mtd->size = %lld\n", mtd->size);
   810		dev_dbg(priv->dev, "fsl_elbc_init: mtd->erasesize = %d\n",
   811		        mtd->erasesize);
   812		dev_dbg(priv->dev, "fsl_elbc_init: mtd->writesize = %d\n",
   813		        mtd->writesize);
   814		dev_dbg(priv->dev, "fsl_elbc_init: mtd->oobsize = %d\n",
   815		        mtd->oobsize);
   816	
   817		/* adjust Option Register and ECC to match Flash page size */
   818		if (mtd->writesize == 512) {
   819			priv->page_size = 0;
   820			clrbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
   821		} else if (mtd->writesize == 2048) {
   822			priv->page_size = 1;
   823			setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
   824		} else {
   825			dev_err(priv->dev,
   826			        "fsl_elbc_init: page size %d is not supported\n",
   827			        mtd->writesize);
   828			return -ENOTSUPP;
   829		}
   830	
   831		return 0;
   832	}
   833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
