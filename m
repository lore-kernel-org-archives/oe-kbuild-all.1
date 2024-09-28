Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A0882D98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727522597; cv=none; b=pW3vSpBJ0OTJrB8aHpPQ+lm2zKxnB0W8ZXJlCrUywr6sq5jbkXyP4JLXF8nEonhJiXdCeAz4nPGBWq4L1tLCKalzjJszhHuMpPibRaUcSHWmt/m1+tc+skuxpf4KZjEX6z+dX3V0Xs2btn5VlJ10GW9cPnAAdEYfUPb3mZcoXE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727522597; c=relaxed/simple;
	bh=k7xe0P+szj+gX0SNf4Xv9GWC15D9N/ZsOF1mmhIkcQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEdj/q/aK1k42McRC5YqcD7MmHZWZxAlBhgBlcDOpO47wjIebGOysYb7nVv4CNsWfv88jqow06fSU6fS+wMRkWeR+wJSJnADWm0To6lidD+I0Xl5EsHmCponXg4s0k+LrX2YdSaFDicrMZkA3Q+zHMiZ0tSOZOGocY3PLtfhyTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGtDwiJc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGtDwiJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727522595; x=1759058595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7xe0P+szj+gX0SNf4Xv9GWC15D9N/ZsOF1mmhIkcQU=;
  b=lGtDwiJcVtiI4s+zy0T80pKtvavFYiluGv4ZvzpGx4J3BiKwZQ7QlshH
   a/eLw1fzup9VF3GjVp4GQ9CHU9OLTPEKMXITaPui5UFm8FufrUHQDOTKU
   axn13sjSqHg9otkND9hoKvrZAaJ68glJ7oIZVGcGMH0vUAY6ipDDTCKKL
   VUFpfORKFsFTfUgs4c26p642HERCnQixU5bEKEaUYpVgfuuntwXmk7NKk
   cQwDCOA8sFBKm88VJvk8jPnY/2Ez5sW2vfD9MQ4v7D6KWNabqmLTFOYve
   NZCMdIwCpy61/8lcNve4gF9E7veb5G3KTtDsPb+3s2079WuK7296/N/8c
   A==;
X-CSE-ConnectionGUID: RWbpoBdISImS9dl5m399nQ==
X-CSE-MsgGUID: N5Yd6MYeT3Wu6VDGEh3veQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26535671"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26535671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:23:14 -0700
X-CSE-ConnectionGUID: jxXYLFMOTTSohgnr6tNOHg==
X-CSE-MsgGUID: hlAIk7QrRmK5W0+mhrvxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77614127"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2024 04:23:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVXa-000ND5-2p;
	Sat, 28 Sep 2024 11:23:10 +0000
Date: Sat, 28 Sep 2024 19:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1169/16788]
 drivers/dma/mxs-dma.c:911:5: warning: no previous prototype for
 'mxs_dma_runtime_suspend'
Message-ID: <202409281949.SReLcTY3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b1e770181b1bbb4b7bd2da67d72ad1d686578079 [1169/16788] LF-251-1: dma: mxs-dma: enable runtime PM for mxs-dma
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281949.SReLcTY3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281949.SReLcTY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281949.SReLcTY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c: In function 'mxs_dma_remove':
   drivers/dma/mxs-dma.c:876:9: error: implicit declaration of function 'dma_pool_destroy'; did you mean 'mas_destroy'? [-Wimplicit-function-declaration]
     876 |         dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
         |         ^~~~~~~~~~~~~~~~
         |         mas_destroy
   drivers/dma/mxs-dma.c:876:47: error: 'struct mxs_dma_chan' has no member named 'ccw_pool'
     876 |         dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
         |                                               ^
   drivers/dma/mxs-dma.c:882:25: error: 'struct mxs_dma_chan' has no member named 'ccw_pool'
     882 |                 mxs_chan->ccw_pool = NULL;
         |                         ^~
   drivers/dma/mxs-dma.c: At top level:
>> drivers/dma/mxs-dma.c:911:5: warning: no previous prototype for 'mxs_dma_runtime_suspend' [-Wmissing-prototypes]
     911 | int mxs_dma_runtime_suspend(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/mxs-dma.c:920:5: warning: no previous prototype for 'mxs_dma_runtime_resume' [-Wmissing-prototypes]
     920 | int mxs_dma_runtime_resume(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/mxs_dma_runtime_suspend +911 drivers/dma/mxs-dma.c

   910	
 > 911	int mxs_dma_runtime_suspend(struct device *dev)
   912	{
   913		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   914	
   915		clk_disable_unprepare(mxs_dma->clk);
   916	
   917		return 0;
   918	}
   919	
 > 920	int mxs_dma_runtime_resume(struct device *dev)
   921	{
   922		struct mxs_dma_engine *mxs_dma = dev_get_drvdata(dev);
   923		int ret;
   924	
   925		ret = clk_prepare_enable(mxs_dma->clk);
   926		if (ret) {
   927			dev_err(&mxs_dma->pdev->dev, "failed to enable the clock\n");
   928			return ret;
   929		}
   930	
   931		return 0;
   932	}
   933	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
