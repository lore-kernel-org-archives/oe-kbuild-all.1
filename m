Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAEE11CAA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694034366; x=1725570366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EVNp/3kkhMOI6LDLaidbPhFmezS39EYimXmUocZkmR8=;
  b=aGGU5FcfI/UERjdFOw3fzpBaMauzsKfJMluAphjMbRM4mo5zlWCGbRqW
   8HGgu1cW29uAHKQuN4CmUgJFCtLlDf/Ohuc3a8ZgOszWIvy+kqPDWiC2z
   0yva6TSEtkqqFPKvVj1WoifdbJE1/FR5dQzrdCRMDCx9NgjgFXA2gH062
   /ETjw3qL0uPEIPVW9shqEodlXnd7mjIiX+36FYCplpwpDDu5VpYotLwYI
   az/UG1IiMUp4oKinR/piDerLqhoJJ9heyLs53sV+l5kDMGTsPqqyoqoGX
   9ZrLVL28v1ubR7Hq/I7ySkC+IzO6hJYyybtoW1BXUPPCUu5AecpXz7RUr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379894707"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379894707"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741720425"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="741720425"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 14:06:03 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzir-0000an-1L;
	Wed, 06 Sep 2023 21:06:01 +0000
Date: Thu, 7 Sep 2023 05:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6176/24606]
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:714:5: warning: no previous
 prototype for function 'bch_create_debugfs'
Message-ID: <202309070419.DAkwoOJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 069390cf1885392613428599244b700f8682e8b1 [6176/24606] Merge branch 'nand/next' into next
config: mips-randconfig-r033-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070419.DAkwoOJ6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070419.DAkwoOJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070419.DAkwoOJ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:714:5: warning: no previous prototype for function 'bch_create_debugfs' [-Wmissing-prototypes]
   int bch_create_debugfs(struct gpmi_nand_data *this)
       ^
   drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:714:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bch_create_debugfs(struct gpmi_nand_data *this)
   ^
   static 
   1 warning generated.


vim +/bch_create_debugfs +714 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c

2febcdf84b75aa drivers/mtd/nand/gpmi-nand/gpmi-nand.c     Huang Shijie 2013-05-17  713  
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09 @714  int bch_create_debugfs(struct gpmi_nand_data *this)
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  715  {
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  716  	struct bch_geometry *bch_geo = &this->bch_geometry;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  717  	struct dentry *dbg_root;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  718  
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  719  	dbg_root = debugfs_create_dir("gpmi-nand", NULL);
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  720  	if (!dbg_root) {
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  721  		dev_err(this->dev, "failed to create debug directory\n");
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  722  		return -EINVAL;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  723  	}
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  724  
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  725  	dbg_bch_geo.data = (void *)bch_geo;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  726  	dbg_bch_geo.size = sizeof(struct bch_geometry);
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  727  	if (!debugfs_create_blob("bch_geometry", S_IRUGO,
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  728  				dbg_root, &dbg_bch_geo)) {
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  729  		dev_err(this->dev, "failed to create debug bch geometry\n");
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  730  		return -EINVAL;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  731  	}
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  732  
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  733  	/* create raw mode flag */
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  734  	if (!debugfs_create_file("raw_mode", S_IRUGO,
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  735  				dbg_root, NULL, NULL)) {
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  736  		dev_err(this->dev, "failed to create raw mode flag\n");
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  737  		return -EINVAL;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  738  	}
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  739  
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  740  	return 0;
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  741  }
14736bd45fa944 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c Han Xu       2019-12-09  742  

:::::: The code at line 714 was first introduced by commit
:::::: 14736bd45fa94409a2fea5512bc64db4963a33a5 MLK-11747: mtd: nand: raw: gpmi-nand: add the debugfs files for gpmi-nand for kobs-ng

:::::: TO: Han Xu <han.xu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
