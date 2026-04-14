Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37560392822
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168882; cv=none; b=Q2JZ3L5wn7vAOL6cfASchL2dKgVWdPH5PGRov6vDpWMjnfRceeVeXuJhF18kNquIPmdhI6eGotnxo7cVJQC/sVclJwNl9bZTWYd6+mlEKTJRfVDBNYqaDDzM9/ngsbS5nG0advzukT83ywVJhWER742scL9S9Qqm18S2RgyNnjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168882; c=relaxed/simple;
	bh=j8M6X944jmnwdwkInCPgu51bHCQSbYWkJsT0RK8wOsw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iACsmZf+U/UeaBzK31GX8MN8JCEgvzlU0ndSkLvThxnfwO9injtQFuWnaDwIlocw4TDKrDPTj+UqfRq2F96bCmVI6v+t0eSzGxL+Y747pDzBAGwkGt+N+F+eDmH5UQGc95grZAfbIQgak3JTFFtGC3AucjpDvBUzeL/N5wgeJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEj1XQ9G; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEj1XQ9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168881; x=1807704881;
  h=date:from:to:cc:subject:message-id;
  bh=j8M6X944jmnwdwkInCPgu51bHCQSbYWkJsT0RK8wOsw=;
  b=EEj1XQ9GOe+KZZSuWJ91Yda2kyXJGlPeNx5/YR5ZwaISM+/qCRV2ZhtN
   wulF+luqjOB4/giny8lj3GGGH82khYPWwsWiM+x0fEC4Wd6IG3wi54wPQ
   GW4DDc43CzGGUBpo35xixGJoSORyx64C9+Ddd7qJ2G8Tl9LpuZyGKjDAL
   8Dc65uGpWoKN0UDiQ35ar7I6lP3x3op7ycjN5dPWLeJOWUcD1xr8sd0Xw
   YvvNaSZcJbXHi4yOe1CLyZmOmOkOMSfIlSG+K2hOm4+str8ABlZ8y+xys
   zgEKCTUz4FlnPljXO9Eyn3vkZFtMsGWhqVh42O9rYyZaf4+M3Ft8Y+ODH
   Q==;
X-CSE-ConnectionGUID: pqwQkOpMQoSiXJV3NVeNbg==
X-CSE-MsgGUID: UkRIigxkR5a/WnRFemh/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88202219"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88202219"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:14:40 -0700
X-CSE-ConnectionGUID: CbrpbcIvQEGWVmOAGnLy7A==
X-CSE-MsgGUID: /8rXOs3yTqeeMxZYkazDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253479699"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 05:14:39 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCcf6-000000001Qx-3oym;
	Tue, 14 Apr 2026 12:14:36 +0000
Date: Tue, 14 Apr 2026 20:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:FIELD_GET_SIGEXT 28/30]
 drivers/iio/adc/intel_dc_ti_adc.c:294:25: error: implicit declaration of
 function 'FIELD_GET_SIGEXTT'; did you mean 'FIELD_GET_SIGEXT'?
Message-ID: <202604142041.O1iQRp1R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux FIELD_GET_SIGEXT
head:   b45fd87eea83a93ba8fcda6037b5595d7d34e11d
commit: 1be0b2861cd2b462415e8c9f0e1eb55fa903fe4d [28/30] intel adc
config: x86_64-buildonly-randconfig-002-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142041.O1iQRp1R-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142041.O1iQRp1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142041.O1iQRp1R-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/intel_dc_ti_adc.c: In function 'dc_ti_adc_probe':
>> drivers/iio/adc/intel_dc_ti_adc.c:294:25: error: implicit declaration of function 'FIELD_GET_SIGEXTT'; did you mean 'FIELD_GET_SIGEXT'? [-Wimplicit-function-declaration]
     294 |         info->vbat_ge = FIELD_GET_SIGEXTT(DC_TI_VBAT_GE, val);
         |                         ^~~~~~~~~~~~~~~~~
         |                         FIELD_GET_SIGEXT


vim +294 drivers/iio/adc/intel_dc_ti_adc.c

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
