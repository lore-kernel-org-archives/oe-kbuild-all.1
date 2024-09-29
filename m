Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE8145345
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727613693; cv=none; b=igETsfiVQa5OtpBnkEI9jhvLqzomMqq9wNY99mbgvtMkyVPnEOYljsa1kzETGWYOdOSGfwH3u2OmXCprCLuhQIA/Y86BwXMKk+4ilrX9q7QhOHx4j7gaFzBVKp9Md69M0QXeaozXY9CAv+hmrngnnRihaPKEN+kL2j1gBlVlEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727613693; c=relaxed/simple;
	bh=z43O49WMaTGWRyc0aM0N0oPUoHuEMYn0f4UDcUUmN8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGNVOdE6X+eJKT/Rvz8Lze8joLXb1Ih4OWEpmRNRcgLAjzWjqvvoja6W9SyCOj5indCNAEoWFVlgHpy9+LVSO0RHSDUnKKR2GqQp1XuW4iwV0xUWMoCPpqhdhWHrjwVZxr5CQIuoKLlPgx/3xCyyG5a5qosY7He/4vW1/Ii5IPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnZ0iDyv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnZ0iDyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727613691; x=1759149691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z43O49WMaTGWRyc0aM0N0oPUoHuEMYn0f4UDcUUmN8I=;
  b=nnZ0iDyvsJqLsFmA09yxAqaK97uksFHUole7yKXPI/ofsRCMrztcdmqR
   FmnJsnFIHncGjMaMKGP9EcJp7JZZdZQiLsKcReOGvcmjo9wfH+K8RWLPB
   lEBkaUBBDEIgBdcmccGdXDDUTOyI9s0HzB4n3RLfN3QqoNyvV2IkyCefp
   pjIwa6BMlhLuKEC3TdL/qvDRLUCk1A0mbYLHZ8yWgcf7KQxyybTh9ZjAE
   rB2c/nzIYbMG+51EnA/khRG2et6yiZcNtudJbgAtMo8ssSlZcLzRf90DQ
   +W31/C8mdXqFvmQxaIEdqEC/BTz8aD7kDffjzMnJG6uOcIhgUyLx130cg
   g==;
X-CSE-ConnectionGUID: 1R/CW2wtTi2jUflI2HEXaA==
X-CSE-MsgGUID: qxKFHzecSkW8Tg/xCDltIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30500620"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30500620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 05:41:30 -0700
X-CSE-ConnectionGUID: wpB/9Nn7SMurzMVoPvjtlA==
X-CSE-MsgGUID: gxwfnD4ETEyzB2phMj9BUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73000311"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 05:41:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sutEt-000OHp-0f;
	Sun, 29 Sep 2024 12:41:27 +0000
Date: Sun, 29 Sep 2024 20:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1169/16788]
 drivers/dma/mxs-dma.c:911:5: warning: no previous prototype for function
 'mxs_dma_runtime_suspend'
Message-ID: <202409292037.koweZv5m-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409292037.koweZv5m-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292037.koweZv5m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292037.koweZv5m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mxs-dma.c:876:2: error: call to undeclared function 'dma_pool_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     876 |         dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
         |         ^
   drivers/dma/mxs-dma.c:876:41: error: no member named 'ccw_pool' in 'struct mxs_dma_chan'
     876 |         dma_pool_destroy(mxs_dma->mxs_chans[0].ccw_pool);
         |                          ~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/dma/mxs-dma.c:882:13: error: no member named 'ccw_pool' in 'struct mxs_dma_chan'
     882 |                 mxs_chan->ccw_pool = NULL;
         |                 ~~~~~~~~  ^
>> drivers/dma/mxs-dma.c:911:5: warning: no previous prototype for function 'mxs_dma_runtime_suspend' [-Wmissing-prototypes]
     911 | int mxs_dma_runtime_suspend(struct device *dev)
         |     ^
   drivers/dma/mxs-dma.c:911:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     911 | int mxs_dma_runtime_suspend(struct device *dev)
         | ^
         | static 
>> drivers/dma/mxs-dma.c:920:5: warning: no previous prototype for function 'mxs_dma_runtime_resume' [-Wmissing-prototypes]
     920 | int mxs_dma_runtime_resume(struct device *dev)
         |     ^
   drivers/dma/mxs-dma.c:920:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     920 | int mxs_dma_runtime_resume(struct device *dev)
         | ^
         | static 
   2 warnings and 3 errors generated.


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
