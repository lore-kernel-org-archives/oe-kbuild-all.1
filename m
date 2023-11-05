Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A05979CC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8t+MjC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699171950; x=1730707950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlHpfIEilcti5Kd5F28G7Z/pi0Pxxgacb21ZG2gLY6c=;
  b=b8t+MjC9xnH/8tOwLb114Oc/nl4TVJuoI1go92/y0kAxj+bytK1hZNAJ
   3JFIjOhAir0e1fvk3Lm+3G3HkXr3Ny8jkv7VLaZHfK9NxCIULXUKWSV0j
   bkE9ElDXCyik8te5w23CYfot/GxT5+qwj7Tb9MUcPFWxdubnN8gHRLcu8
   Kyvosi6YmbMerKcni0ynn2got2fa4ySya1IdjADWrW6pyncVCXiboOIN5
   O0Yfx1m65ZMftLzLu7Z3/Tp5l9YDk2qy/1ruQ/n01vUt8ZcGioU4ExX5y
   mXSsTXHnEhyw+wJWzLPAgnBt43+v4MpgthXAsPRz4g/nPDAdeyXNfEPyA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379523869"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="379523869"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="885610125"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="885610125"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 01:12:28 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzYF8-0005BQ-1X;
	Sun, 05 Nov 2023 08:12:26 +0000
Date: Sun, 5 Nov 2023 16:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] drivers/mmc/core/mmc.c:978:6:
 warning: no previous prototype for function 'mmc_set_bus_speed'
Message-ID: <202311051619.kzIxWzyU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   85ccc4a25c6007d2ac4284565b1864f9abd44808
commit: 5bcf8db7706a21860890cfe88688e002ccd76352 [1/1] ANDROID: mmc: core: Export core functions required for clk scaling
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311051619.kzIxWzyU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051619.kzIxWzyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051619.kzIxWzyU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/mmc.c:978:6: warning: no previous prototype for function 'mmc_set_bus_speed' [-Wmissing-prototypes]
   void mmc_set_bus_speed(struct mmc_card *card)
        ^
   drivers/mmc/core/mmc.c:978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mmc_set_bus_speed(struct mmc_card *card)
   ^
   static 
   1 warning generated.


vim +/mmc_set_bus_speed +978 drivers/mmc/core/mmc.c

   974	
   975	/*
   976	 * Set the bus speed for the selected speed mode.
   977	 */
 > 978	void mmc_set_bus_speed(struct mmc_card *card)
   979	{
   980		unsigned int max_dtr = (unsigned int)-1;
   981	
   982		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   983		     max_dtr > card->ext_csd.hs200_max_dtr)
   984			max_dtr = card->ext_csd.hs200_max_dtr;
   985		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   986			max_dtr = card->ext_csd.hs_max_dtr;
   987		else if (max_dtr > card->csd.max_dtr)
   988			max_dtr = card->csd.max_dtr;
   989	
   990		mmc_set_clock(card->host, max_dtr);
   991	}
   992	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
