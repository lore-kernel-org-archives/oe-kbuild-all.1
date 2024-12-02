Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FBA2040AA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153745; cv=none; b=EFlUk7vsdru4Tz08ZsR1Zu1E6nnwJrL0ZZDZwmNRcNGEdq9W36wnNEug3aGKpExaNgS6Ddf+CcGR1oM9Nqv/Ns/JeQ+eTE7+4hpwcbiMeDH2XQ7qdGszu6dMmNktswXDqEwPyhETbeNvyOqQRr349rSFedB6ibJ8fbUQyXw5mVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153745; c=relaxed/simple;
	bh=9f/qoQ3rdYWyjy2OviV1FGGVeNyb/okg1jD9VLb45Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwIbo41i6JNjgUHlFufKSM6eEFNCjqjPjYoYoKuSoqOIFxRyb8+jqMItVdQGzPmS6K2hVreD0B3VFluq94L2BI/BPx+nKUVad8W2gEuoxLRSp4yoi9cYfU0vYj7xhoMMZM5rQvtO0QkAAmH2Zz6UfNhHFbSBjcLeEO9w1y6wCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7UQIaQv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7UQIaQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733153743; x=1764689743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9f/qoQ3rdYWyjy2OviV1FGGVeNyb/okg1jD9VLb45Fo=;
  b=k7UQIaQvR3dJs+ptE/rvM3B4ME+97S/G9MAXtEPeQsPqkoZqZskUtX3s
   YTTPAe4vvGgrzB+fbGXRDGjdknME53Rr6i4c7oIIXn64y+3r2M3ENjDkN
   Hj+FR7yi8Tvfr46v2gWgQKIni73g36qJ6/iD4/yuFnLve1NoCLrne5B5x
   6nAvrA2VScTzhijofjr7hWMggN+TxkO4vykXWcrt2oyy66ThAjo/bdgDm
   JyPEfw2g0hSfMWRMG9c2+J+oz2MZ/ncLc5eHWJXmyWOTfeKXsF0Yb6j7A
   bzzvR+SDmSr3d+2soyWRiZZQNN+9yZTwo042/0+7+86NA35OHpqVWgycF
   A==;
X-CSE-ConnectionGUID: uXQ3Fm3aSQm72nDREwuUFw==
X-CSE-MsgGUID: ZTNIuTVLRL+aljBCMLiG2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="58722911"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="58722911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 07:35:41 -0800
X-CSE-ConnectionGUID: lFJ4jYU4SOmAEQX1hOXKcA==
X-CSE-MsgGUID: 0ElO980wRJa+Glby6+Yq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="93607627"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2024 07:35:40 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI8SY-0002X1-1e;
	Mon, 02 Dec 2024 15:35:38 +0000
Date: Mon, 2 Dec 2024 23:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/iio/adc/phytium-adc.c:662:12: warning: 'phytium_adc_resume' defined
 but not used
Message-ID: <202412022331.nyd9c2hV-lkp@intel.com>
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
head:   312efa97a54edf7e64f108312c4d8c6961a1abaf
commit: 69245da182c15b365e3b770e7ac56db0f8118165 [1294/1294] adc: add phytium adc driver
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241202/202412022331.nyd9c2hV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412022331.nyd9c2hV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412022331.nyd9c2hV-lkp@intel.com/

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
