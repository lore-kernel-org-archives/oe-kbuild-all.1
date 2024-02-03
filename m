Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD648CC7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706963121; cv=none; b=dy4jJinL5RYXXeh+JexDdwo0Kr1nBsc6fF8IE5xKh/ksqkBMDP+OwMgRbRyuYYTZV+y7svF1jIZD3u0fXqXVPRe9wqtpGrWeSeIaaGsN2mu3xcdx5h7MCyzubIUPvMw4PGrkubpay1nQLInjuqwKp3j0NMTfruEkrD/R24a0ts4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706963121; c=relaxed/simple;
	bh=snDWCxU4u5l7a6UuM0kV7rVS/xMJAVI8FwdcwMmquqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZUJdX+5i9eSnkYs2kfT1+WE+kpHpQMVdiV0MdcqXZjFV/6KYTk0dSRPRU7AwqsFw1x8PFPTxjl8bV+/J0wVDpkJgKH73Un3S0AOZydnGVVWUtkYUpBgEnp8w12EUF6AiJ5rleVvZKR1mF65MG7gkUCbEuIU4J1YdlS5yVZ/Eu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciJchdbN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciJchdbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706963119; x=1738499119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snDWCxU4u5l7a6UuM0kV7rVS/xMJAVI8FwdcwMmquqQ=;
  b=ciJchdbNfCDK/6qSARRAWq01pAcfIHoBKINC6nHjHkRRVIU5oNIBAOnn
   0k8p4TA6+ppMo5fR/uj2k6qqlUcFQkhPxg5Nw+yb9lHyFg6GVruRGwZ46
   qk3zTBtr2AyV1QvsZvA9EhvF5eb5zqFBxm5zUl0SBkpEtwaNDVkPojWK2
   9bwkw8dTznpSxjjs9K7Yc2QB1HzWPAjvLT5ZNdNkbGbay5ezjaZT4HzD0
   DmVxyP5Q3YHmX/sDqv81++ABGhKwsWOPe8S0hXktI4VA69e4gkpCVzpqi
   2dMimc3MCSGaseJHwcUDdlUYiOR3L4cp/d9nIVPmNwtflDB5STNe5s3CJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="468891"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="468891"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 04:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="373796"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2024 04:25:17 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWF58-00052C-3B;
	Sat, 03 Feb 2024 12:25:14 +0000
Date: Sat, 3 Feb 2024 20:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 48/52]
 drivers/dma/esp32s3-gdma.c:299:12: warning: 'esp32_dma_runtime_resume'
 defined but not used
Message-ID: <202402032032.gmcy5fq2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: a5c85057774730482c8e4ece98a1358656d82304 [48/52] WIP: drivers/dma/esp32s3-gdma: add ESP32S3 GDMA driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402032032.gmcy5fq2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032032.gmcy5fq2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032032.gmcy5fq2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/esp32s3-gdma.c:299:12: warning: 'esp32_dma_runtime_resume' defined but not used [-Wunused-function]
     299 | static int esp32_dma_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/esp32s3-gdma.c:290:12: warning: 'esp32_dma_runtime_suspend' defined but not used [-Wunused-function]
     290 | static int esp32_dma_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/esp32_dma_runtime_resume +299 drivers/dma/esp32s3-gdma.c

   288	
   289	#ifdef CONFIG_PM
 > 290	static int esp32_dma_runtime_suspend(struct device *dev)
   291	{
   292		struct esp32_dma_device *dmadev = dev_get_drvdata(dev);
   293	
   294		clk_disable_unprepare(dmadev->clk);
   295	
   296		return 0;
   297	}
   298	
 > 299	static int esp32_dma_runtime_resume(struct device *dev)
   300	{
   301		struct esp32_dma_device *dmadev = dev_get_drvdata(dev);
   302		int ret;
   303	
   304		ret = clk_prepare_enable(dmadev->clk);
   305		if (ret) {
   306			dev_err(dev, "failed to prepare_enable clock\n");
   307			return ret;
   308		}
   309	
   310		return 0;
   311	}
   312	#endif
   313	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
