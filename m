Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05E79C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695574415; x=1727110415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ySVJ21dOF/hNz1CgIR237l0d4nXRs5ZtNtPqME4wiU=;
  b=gQM9cpJFPq0AMyN6XDCuaY9uHmsmquWeFjsB5wsKSegyQLhNIct28XvU
   bk8tj49RaeQhR8upgPLY0KQUEsDQ1sRFTl7h6ZFIDYxWQbmyPzYqmK8jI
   Bk3iZz6dkxBXHASUFxheOxaBybn8bRJ82T/7bARhNKc2p88FAOcqOaB4n
   jY/Xcpo0zdpwqvoZiGl4HbJmP+3l30saPrk3rNX0LoA2GxvCMuyRISkRW
   hpl7kHeDcfBbyfqYd7/Uu6kz6fnHVBLMPGP+T7Lr+mfy6L83NDMUTRlMD
   6NftwjVCC1k+1952ppmfUJMPxRklPJXOpNPePz2je5AaqxKJUI3OC7ehx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371432190"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="371432190"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 09:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724737739"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="724737739"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Sep 2023 09:53:32 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkSMM-0000Aj-08;
	Sun, 24 Sep 2023 16:53:30 +0000
Date: Mon, 25 Sep 2023 00:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harinik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 905/1370]
 drivers/mtd/spi-nor/swp.c:696 spi_nor_try_unlock_all() warn: inconsistent
 indenting
Message-ID: <202309250019.zIkG64Se-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 5719f11b6499d5a94e70e5bad2cb1b0a3f9f1b5c [905/1370] mtd: spi-nor: Add flash lock/unlock feature
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230925/202309250019.zIkG64Se-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309250019.zIkG64Se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250019.zIkG64Se-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/swp.c:696 spi_nor_try_unlock_all() warn: inconsistent indenting

vim +696 drivers/mtd/spi-nor/swp.c

5719f11b6499d5 Harini Katakam       2023-01-18  664  
c4c795105f2924 Tudor Ambarus        2021-03-22  665  /**
c4c795105f2924 Tudor Ambarus        2021-03-22  666   * spi_nor_try_unlock_all() - Tries to unlock the entire flash memory array.
c4c795105f2924 Tudor Ambarus        2021-03-22  667   * @nor:	pointer to a 'struct spi_nor'.
c4c795105f2924 Tudor Ambarus        2021-03-22  668   *
c4c795105f2924 Tudor Ambarus        2021-03-22  669   * Some SPI NOR flashes are write protected by default after a power-on reset
c4c795105f2924 Tudor Ambarus        2021-03-22  670   * cycle, in order to avoid inadvertent writes during power-up. Backward
c4c795105f2924 Tudor Ambarus        2021-03-22  671   * compatibility imposes to unlock the entire flash memory array at power-up
c4c795105f2924 Tudor Ambarus        2021-03-22  672   * by default.
c4c795105f2924 Tudor Ambarus        2021-03-22  673   *
c4c795105f2924 Tudor Ambarus        2021-03-22  674   * Unprotecting the entire flash array will fail for boards which are hardware
c4c795105f2924 Tudor Ambarus        2021-03-22  675   * write-protected. Thus any errors are ignored.
c4c795105f2924 Tudor Ambarus        2021-03-22  676   */
c4c795105f2924 Tudor Ambarus        2021-03-22  677  void spi_nor_try_unlock_all(struct spi_nor *nor)
c4c795105f2924 Tudor Ambarus        2021-03-22  678  {
aa5a6e93900b17 Amit Kumar Mahapatra 2023-01-18  679  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
c4c795105f2924 Tudor Ambarus        2021-03-22  680  	int ret;
5719f11b6499d5 Harini Katakam       2023-01-18  681  	const struct flash_info *info = nor->info;
3d20dfdb2efb3f Michal Simek         2023-01-19  682  
3d20dfdb2efb3f Michal Simek         2023-01-19  683  	if (!(nor->flags & SNOR_F_HAS_LOCK))
3d20dfdb2efb3f Michal Simek         2023-01-19  684  		return;
3d20dfdb2efb3f Michal Simek         2023-01-19  685  
3d20dfdb2efb3f Michal Simek         2023-01-19  686  	dev_dbg(nor->dev, "Unprotecting entire flash array\n");
3d20dfdb2efb3f Michal Simek         2023-01-19  687  
5719f11b6499d5 Harini Katakam       2023-01-18  688  	if (nor->jedec_id == CFI_MFR_ATMEL ||
5719f11b6499d5 Harini Katakam       2023-01-18  689  	    nor->jedec_id == CFI_MFR_INTEL ||
5719f11b6499d5 Harini Katakam       2023-01-18  690  	    nor->jedec_id == CFI_MFR_SST ||
5719f11b6499d5 Harini Katakam       2023-01-18  691  	    nor->flags & SNOR_F_HAS_LOCK) {
5719f11b6499d5 Harini Katakam       2023-01-18  692  		if (info->flags & SST_GLOBAL_PROT_UNLK) {
5719f11b6499d5 Harini Katakam       2023-01-18  693  			spi_nor_prot_unlock(nor);
5719f11b6499d5 Harini Katakam       2023-01-18  694  		} else {
aa5a6e93900b17 Amit Kumar Mahapatra 2023-01-18  695  			ret = spi_nor_unlock(&nor->mtd, 0, params->size);
c4c795105f2924 Tudor Ambarus        2021-03-22 @696  				if (ret)
c4c795105f2924 Tudor Ambarus        2021-03-22  697  					dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
c4c795105f2924 Tudor Ambarus        2021-03-22  698  		}
5719f11b6499d5 Harini Katakam       2023-01-18  699  	}
5719f11b6499d5 Harini Katakam       2023-01-18  700  }
c4c795105f2924 Tudor Ambarus        2021-03-22  701  

:::::: The code at line 696 was first introduced by commit
:::::: c4c795105f2924c80752c30ffd3c7029a8e0ef28 mtd: spi-nor: Move Software Write Protection logic out of the core

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
