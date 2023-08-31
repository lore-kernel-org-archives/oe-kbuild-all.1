Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E023A5399
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 22:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693520412; x=1725056412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tos1i8ZluVnig8WLI5AvOww9L21AGgrg0voZ0NDSWtg=;
  b=ilD21eT//w/g2Evlae9tMmBfog4ssNXPCk5TXsfuzoG22MWrrkDN8f4m
   8CeS+a0YlSfdNiYEwl/r1qrYTUl/uOi9sUAI5uVuiOTriJqXqLWfO3H5v
   NJjt0LXjMPLdufMessOqg8cIEDvEgMyw9HwU1RSqlp4N0OMoC3FI1JQ4Z
   gkxC2CuGeatJN8gaxi7yCK1lmDsPJQmKxV97vJGhUI3lRtAJ5PcsWNfbY
   676RoBFz9mECN8HOTY5+FcwjwYMGpoHZzP7LqFqeLaefu69EnDdCoEXiJ
   jZbLfAOwIJIIUzDFmfW4AsyCovcXKeQZy1fUCt9pn7GikxMf08rNh/0RC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407076135"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="407076135"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 15:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="716522584"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="716522584"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 15:20:10 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbq1I-0000b3-15;
	Thu, 31 Aug 2023 22:20:08 +0000
Date: Fri, 1 Sep 2023 06:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 615/24603]
 drivers/clk/imx/clk-blk-ctrl.c:291:12: warning:
 'imx_blk_ctrl_runtime_resume' defined but not used
Message-ID: <202309010602.kmPPJ7Lk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 75921c395c22cf9a3d9ff9af0e9962fc2b62105a [615/24603] clk: imx: Add blk_ctrl combo driver
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010602.kmPPJ7Lk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010602.kmPPJ7Lk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010602.kmPPJ7Lk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-blk-ctrl.c:291:12: warning: 'imx_blk_ctrl_runtime_resume' defined but not used [-Wunused-function]
     291 | static int imx_blk_ctrl_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-blk-ctrl.c:284:12: warning: 'imx_blk_ctrl_runtime_suspend' defined but not used [-Wunused-function]
     284 | static int imx_blk_ctrl_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx_blk_ctrl_runtime_resume +291 drivers/clk/imx/clk-blk-ctrl.c

   283	
 > 284	static int imx_blk_ctrl_runtime_suspend(struct device *dev)
   285	{
   286		imx_blk_ctrl_read_write(dev, false);
   287	
   288		return 0;
   289	}
   290	
 > 291	static int imx_blk_ctrl_runtime_resume(struct device *dev)
   292	{
   293		imx_blk_ctrl_read_write(dev, true);
   294	
   295		return 0;
   296	}
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
