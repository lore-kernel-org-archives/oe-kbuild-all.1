Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A121E511
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776194587; cv=none; b=LfU0nOc2RFHEpJxUsWgR/2zEYOfkI/30hi4gO6kwbOj8xXs6I5ELwFz+txdv1c1q3gqCaoKno6GbD14CV9iT4IG4iTaxHpPI4WKdQIdZUWRNq7whjVRaCuBjEY1Z7519sixopHBmtXy2rBrz6JkoWFhNxn82mfDd+zpDpJyIZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776194587; c=relaxed/simple;
	bh=86mGlfQWngSyNkY5T7KcBeqvcQ1px2XEjznMSb06GDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lEUXLgxATxlu6IJePh5TSEnp+4IOZ/0fsJZLp7ZR//dHw0JgqNCKk8977ICew3N+412ZTHWNHf4vRcT0orwgy7M8umH4gmRUAuW0A8nY2PU6yK44NMHsNMU1Uwo8ZXCyoIT7dE/8eROI01tx+l7EQrq1SZEtW7bmVjFLiIlVRao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fwq7CLrR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fwq7CLrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776194586; x=1807730586;
  h=date:from:to:cc:subject:message-id;
  bh=86mGlfQWngSyNkY5T7KcBeqvcQ1px2XEjznMSb06GDU=;
  b=Fwq7CLrR00D2I6e5+OKL/vyPBwkTAU9WwDcQ/0L+OKNDEccjslgbbwtn
   loxdUQwmz0fVyPFTgEtwN5vOZoyE5cBb7dFsYHsE7Slw0yhDVj1ZTPqYv
   lTM+dtFWS2Mt/ethVpy0snJvZdF40EtAxKiCBruMAtQO+br4DuGsucDa/
   6fFtW5xi6hAqVTbj0YAe7z/RBvWEps7IqP8gB59rz+7xZPlAP0rq1JoOh
   95cNlVee5MhrsG9P9vXd2WMaEZB38V+6wNSVUcRjmDN4jbsupCJohFJzF
   q++5wnwgUTc+2H8f3gv1MBTbNdRQLDBQEKuP7YmnPQoOLUK+kLNafTXJ7
   A==;
X-CSE-ConnectionGUID: OsdIUZqeQSyxDnL3o6Pgkg==
X-CSE-MsgGUID: V80tE5RTT3asxP3Qm9c2sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88610541"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88610541"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 12:23:06 -0700
X-CSE-ConnectionGUID: sPz1Byy7Q0aX3z8QxYw4vQ==
X-CSE-MsgGUID: X6HVDpUbRQa8/nSYHN97lw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Apr 2026 12:23:04 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCjLh-000000001mz-3cfU;
	Tue, 14 Apr 2026 19:23:01 +0000
Date: Wed, 15 Apr 2026 03:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:FIELD_GET_SIGEXT 28/30]
 drivers/iio/adc/intel_dc_ti_adc.c:294:18: error: call to undeclared function
 'FIELD_GET_SIGEXTT'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604150319.hqESW9wm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux FIELD_GET_SIGEXT
head:   b45fd87eea83a93ba8fcda6037b5595d7d34e11d
commit: 1be0b2861cd2b462415e8c9f0e1eb55fa903fe4d [28/30] intel adc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260415/202604150319.hqESW9wm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150319.hqESW9wm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150319.hqESW9wm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/intel_dc_ti_adc.c:294:18: error: call to undeclared function 'FIELD_GET_SIGEXTT'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |         info->vbat_ge = FIELD_GET_SIGEXTT(DC_TI_VBAT_GE, val);
         |                         ^
   1 error generated.


vim +/FIELD_GET_SIGEXTT +294 drivers/iio/adc/intel_dc_ti_adc.c

   254	
   255	static int dc_ti_adc_probe(struct platform_device *pdev)
   256	{
   257		struct device *dev = &pdev->dev;
   258		struct intel_soc_pmic *pmic = dev_get_drvdata(dev->parent);
   259		struct dc_ti_adc_info *info;
   260		struct iio_dev *indio_dev;
   261		unsigned int val;
   262		int irq, ret;
   263	
   264		irq = platform_get_irq(pdev, 0);
   265		if (irq < 0)
   266			return irq;
   267	
   268		indio_dev = devm_iio_device_alloc(dev, sizeof(*info));
   269		if (!indio_dev)
   270			return -ENOMEM;
   271	
   272		info = iio_priv(indio_dev);
   273	
   274		ret = devm_mutex_init(dev, &info->lock);
   275		if (ret)
   276			return ret;
   277	
   278		init_waitqueue_head(&info->wait);
   279	
   280		info->dev = dev;
   281		info->regmap = pmic->regmap;
   282	
   283		indio_dev->name = "dc_ti_adc";
   284		indio_dev->channels = dc_ti_adc_channels;
   285		indio_dev->num_channels = ARRAY_SIZE(dc_ti_adc_channels);
   286		indio_dev->info = &dc_ti_adc_iio_info;
   287		indio_dev->modes = INDIO_DIRECT_MODE;
   288	
   289		ret = regmap_read(info->regmap, DC_TI_VBAT_ZSE_GE_REG, &val);
   290		if (ret)
   291			return ret;
   292	
   293		info->vbat_zse = FIELD_GET_SIGEXT(DC_TI_VBAT_ZSE, val);
 > 294		info->vbat_ge = FIELD_GET_SIGEXTT(DC_TI_VBAT_GE, val);
   295	
   296		dev_dbg(dev, "vbat-zse %d vbat-ge %d\n", info->vbat_zse, info->vbat_ge);
   297	
   298		ret = devm_iio_map_array_register(dev, indio_dev, dc_ti_adc_default_maps);
   299		if (ret)
   300			return ret;
   301	
   302		ret = devm_request_threaded_irq(dev, irq, NULL, dc_ti_adc_isr,
   303						IRQF_ONESHOT, indio_dev->name, info);
   304		if (ret)
   305			return ret;
   306	
   307		return devm_iio_device_register(dev, indio_dev);
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
