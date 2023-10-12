Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53127EC7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Scujd1Hl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697126426; x=1728662426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndbMtOP4IOrXkIlzfHhpNIaugusPfXi5enNfONe4yRM=;
  b=Scujd1HlF3C1bCtUqeJDiyWvnj+2h0TUr39C8kmxwdUy8ZBNzlBeJL+G
   8MP8bmZxWPl/QzcaUkPj0sUM4zsHAzMkqft+xFlJEOWOCjXN52FwCkJG5
   NJoIORYiYPF0avV691n5Yyn3rwAda0yW/uTT3GwhjA7TacZsChpIR4o0e
   pHiVMckd5JGMuUzWyW5Ede7OcaMFEk+x40IUSGaSpWvMNuO0zvLitegb7
   bincycrdd5s3hWJNczgSk3HZlpp1K0IFkG6sLlxde1mzoXGjDGQDNuSLw
   9BMEQmrIsD76gClRWgcDIc2RIMDb7mrQbMwo6RV0GMf6j1bd8m9pYWkaT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471214351"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471214351"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928045573"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="928045573"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Oct 2023 09:00:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqy6n-0003bA-26;
	Thu, 12 Oct 2023 16:00:21 +0000
Date: Thu, 12 Oct 2023 23:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 553/15768]
 drivers/clk/imx/clk-blk-ctrl.c:291:12: warning:
 'imx_blk_ctrl_runtime_resume' defined but not used
Message-ID: <202310122348.9RY4Fxqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 78668ad4d3771b2b0caca88d8bea83e4f438f8b5 [553/15768] clk: imx: Add blk_ctrl combo driver
config: csky-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231012/202310122348.9RY4Fxqx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122348.9RY4Fxqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122348.9RY4Fxqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-blk-ctrl.c: In function 'imx_blk_ctrl_register_one_clock':
   drivers/clk/imx/clk-blk-ctrl.c:140:26: error: implicit declaration of function 'imx_dev_clk_hw_mux_flags'; did you mean 'imx_clk_hw_mux_flags'? [-Werror=implicit-function-declaration]
     140 |                 clk_hw = imx_dev_clk_hw_mux_flags(dev, hw->name,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          imx_clk_hw_mux_flags
   drivers/clk/imx/clk-blk-ctrl.c:140:24: warning: assignment to 'struct clk_hw *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     140 |                 clk_hw = imx_dev_clk_hw_mux_flags(dev, hw->name,
         |                        ^
   drivers/clk/imx/clk-blk-ctrl.c:148:26: error: implicit declaration of function 'imx_dev_clk_hw_gate'; did you mean 'imx_clk_hw_gate'? [-Werror=implicit-function-declaration]
     148 |                 clk_hw = imx_dev_clk_hw_gate(dev, hw->name, hw->parents,
         |                          ^~~~~~~~~~~~~~~~~~~
         |                          imx_clk_hw_gate
   drivers/clk/imx/clk-blk-ctrl.c:148:24: warning: assignment to 'struct clk_hw *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     148 |                 clk_hw = imx_dev_clk_hw_gate(dev, hw->name, hw->parents,
         |                        ^
   drivers/clk/imx/clk-blk-ctrl.c:152:26: error: implicit declaration of function 'imx_dev_clk_hw_gate_shared'; did you mean 'imx_clk_hw_gate2_shared'? [-Werror=implicit-function-declaration]
     152 |                 clk_hw = imx_dev_clk_hw_gate_shared(dev, hw->name,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                          imx_clk_hw_gate2_shared
   drivers/clk/imx/clk-blk-ctrl.c:152:24: warning: assignment to 'struct clk_hw *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     152 |                 clk_hw = imx_dev_clk_hw_gate_shared(dev, hw->name,
         |                        ^
   drivers/clk/imx/clk-blk-ctrl.c: At top level:
>> drivers/clk/imx/clk-blk-ctrl.c:291:12: warning: 'imx_blk_ctrl_runtime_resume' defined but not used [-Wunused-function]
     291 | static int imx_blk_ctrl_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/imx/clk-blk-ctrl.c:284:12: warning: 'imx_blk_ctrl_runtime_suspend' defined but not used [-Wunused-function]
     284 | static int imx_blk_ctrl_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
