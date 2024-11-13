Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35081632CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 22:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731536987; cv=none; b=Ebeh/BxZQeFOBG68MRmos18EbDaNkbcUKjJrxNX2ESegVHmEfXPYK3Pgby1wZrqXvWTUJr6IWKWspFhfVSRNrDKBwADNthOuhC0M7E7OOUWixTa7SENCrvR0Nak/K/quAEI7luBZv3bpECJ/6AXtsEmEx/oBhYjp3cTyNlzbKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731536987; c=relaxed/simple;
	bh=XxO/A+l1WPPFzsYdl2KXt4Kw1lJn0hTWoMEi3c8jtyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uolE6tMky/l2DUyD3SwRnVA6WPkv4iHsiqKqOZF9P7Ckiww2vK3XeoFFS7KzU2BHg87rb1c+ShWhoY3e4NDR3Fk1H9DvgKvrbcx3Qn09uZqCc5nHRLZCgUnasZgEDBlyfe/5A1G2SB9GkLbY55qbiJ7Xw+ceh3r7rnQ5idiXQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/YhiYWs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/YhiYWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731536984; x=1763072984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XxO/A+l1WPPFzsYdl2KXt4Kw1lJn0hTWoMEi3c8jtyQ=;
  b=a/YhiYWssOE6C9gZ9wVod+zg3uCeKYctb5QrtjWRtUQaUc5UiFL6HnAf
   nidlnzIUQovbn2tAItN2hopPxtGWnMZl7AC2py65pzvDDcFPftUe/5MN/
   j2sBkg+BPK7vp+OA7FCMq2bzDlK7VDyTxU3XXHIl8yKWFxbv84++shwkv
   SDsukl/vVMnc4Kx9Oetgapb1z92rniASFB1JD1F/pGcyPLTayTJuTKLM5
   IQ0EXYNtk82sIF95nskYBGg6Lw9RuGs0WIYveJUF4RSrfqXhsNChy3XEC
   0V5smSYbm53cgH2+tK4UceO234ciw0qexCULXeuce9ER2t+ax4/yZ24g+
   A==;
X-CSE-ConnectionGUID: 76EO7uGjST6AHsoTq75RfQ==
X-CSE-MsgGUID: pvbuPvc+SHi3rt7HAHAzMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="19059286"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="19059286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 14:29:44 -0800
X-CSE-ConnectionGUID: //CJrXfhRhyhz23G4uf90g==
X-CSE-MsgGUID: sGZAYToCQ+mKhLRDoaY0iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="87766125"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2024 14:29:43 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBLrp-0000ml-18;
	Wed, 13 Nov 2024 22:29:41 +0000
Date: Thu, 14 Nov 2024 06:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/iio/adc/phytium-adc.c:662:12: warning: 'phytium_adc_resume' defined
 but not used
Message-ID: <202411140635.9MErzKIu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 69245da182c15b365e3b770e7ac56db0f8118165 [1294/1294] adc: add phytium adc driver
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140635.9MErzKIu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140635.9MErzKIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140635.9MErzKIu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/phytium-adc.c:662:12: warning: 'phytium_adc_resume' defined but not used [-Wunused-function]
     662 | static int phytium_adc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/phytium-adc.c:651:12: warning: 'phytium_adc_suspend' defined but not used [-Wunused-function]
     651 | static int phytium_adc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


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
