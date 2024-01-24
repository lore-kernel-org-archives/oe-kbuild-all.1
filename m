Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760713541D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706138303; cv=none; b=T/i55gNXJAPuAiN0kX6+fNKYTCEMSyX3kKlW90CKx1uGOmFMj/9MWapTzqt38MlnZotqzTFt1hvs3Bdym60XDTl4gXq3UHnxLP08piDVs3cYErVJSPScl2fcz8gEisCdfsYnrzVNnKcYepeka3/AAziHD4xZldf8kv+ot/N53e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706138303; c=relaxed/simple;
	bh=YH1I83l1ZeLyXJYZqd+l2JSNbSmGsQnTl5iPXG91WH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y6i0UmFepJSHAJ4n9DrotrvceyfQ6u5+K6ovERWvxHPe5NTExWR31F2cDtla9pMrFOb4GQHDPO2vTkeBGH4WadPLO8//BfyEOGCOssfTZPAfWoHsELGSdcXJDWEyw9v8Ur9dyJitY/e+dFl7QvSTe1WyVCjQUyzy/wCWoJlcKvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdZbC6ts; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdZbC6ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706138300; x=1737674300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YH1I83l1ZeLyXJYZqd+l2JSNbSmGsQnTl5iPXG91WH0=;
  b=kdZbC6tsVw1/mLX1CBM7H6uwVuFx+T9Qyf0t0WQ1vcaU9NnpkmZ2AUVL
   At8/MhXySh1nCyRTFAP63sjgems176pAslnm/MPtoI9PKZEZjvCdHYcqn
   wRwlhlQcVYbwHb1Dwmm95sdWNic6BFi7Z1P080C2vpwna8AwQ7SqR1qiH
   Uh/bYfrLzyk8Vwg0TGfWA6wZ50wCaNrBC2kwPykYPcJduOGf6HHmTxTHt
   14iLH9GbxTXXpH3zKu5SC78NeY200TKYyAZaigQ7cP9zYMdfhiV0Ds+NP
   Xeqc82KDpkYJloYc7mU7zjBrgBTchZg2eZJJ4mAF5s27gF07CtnEZts2D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="904920"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="904920"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 15:18:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2081309"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2024 15:18:18 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSmVb-0008Vl-2d;
	Wed, 24 Jan 2024 23:18:15 +0000
Date: Thu, 25 Jan 2024 07:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21263/21567]
 drivers/iio/adc/phytium-adc.c:662:12: warning: 'phytium_adc_resume' defined
 but not used
Message-ID: <202401250716.GKgR8ZVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0ff07578f017c011d7806126c4aaafdbf39b32fa
commit: 69245da182c15b365e3b770e7ac56db0f8118165 [21263/21567] adc: add phytium adc driver
config: arm64-randconfig-004-20240125 (https://download.01.org/0day-ci/archive/20240125/202401250716.GKgR8ZVW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250716.GKgR8ZVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250716.GKgR8ZVW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/phytium-adc.c:662:12: warning: 'phytium_adc_resume' defined but not used [-Wunused-function]
     662 | static int phytium_adc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/phytium-adc.c:651:12: warning: 'phytium_adc_suspend' defined but not used [-Wunused-function]
     651 | static int phytium_adc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/phytium_adc_resume +662 drivers/iio/adc/phytium-adc.c

   649	
   650	#ifdef CONFIG_PM
 > 651	static int phytium_adc_suspend(struct device *dev)
   652	{
   653		struct iio_dev *indio_dev = dev_get_drvdata(dev);
   654		struct phytium_adc *adc = iio_priv(indio_dev);
   655	
   656		phytium_adc_power_setup(adc, false);
   657		clk_disable_unprepare(adc->adc_clk);
   658	
   659		return 0;
   660	}
   661	
 > 662	static int phytium_adc_resume(struct device *dev)
   663	{
   664		struct iio_dev *indio_dev = dev_get_drvdata(dev);
   665		struct phytium_adc *adc = iio_priv(indio_dev);
   666	
   667		clk_prepare_enable(adc->adc_clk);
   668		phytium_adc_power_setup(adc, true);
   669	
   670		return 0;
   671	}
   672	#endif
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
