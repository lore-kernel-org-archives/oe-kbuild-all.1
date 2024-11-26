Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3A195390
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732620939; cv=none; b=tXYs59DSP5hvNk7e7a5RZnZeq8emZ6IGz+Oq2dhs2MDSq99MNp73eMgSwXQQtRapF2XDTZml2kBgdunKbivka8KuSlRtuw6GxbOLUls+8HzMLbKfXV0Sb5KHRu1RW/hhYh0rEUKkAbZpnYVBb2ftri/F+Z5BpdJZHATmm4GyPYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732620939; c=relaxed/simple;
	bh=eH53wsMVQPlQ0fmVO0rypqiDRDp+VgRxHjhyYOXvwVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KKdd5N1/dUFyIlHX4jo39t+6+8SEsM5f7vWep7HEWOqTB4pmTGyACBv2Y8VVTbMtuVMdzilPrhWKIKqXH56oN3fpQZoEaFk4kYeWvPxHnNXllLRCH7vNvbEYS7qJt0Ouqu5Rx/kSpmpMhHX2/l/TXV7D54STKuGp6hBgiKN0xPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ3+ifjv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ3+ifjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732620938; x=1764156938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eH53wsMVQPlQ0fmVO0rypqiDRDp+VgRxHjhyYOXvwVM=;
  b=KJ3+ifjvlNN/MAdGLla0i4wAkzByyMbXaS/NgNcPRZrn5dJzExQmph7u
   zde6/rWIg/VGlZlSmBHtfSYSSY0muUXbN9K/VOTJAfwY545ZMX/8wwWTO
   5RdHNZx4uM11gVqF72LEAjsAQq/JMsClCtVcuKiCHMY/pQblIo5TsAZRe
   9mgZqSit7JRxp+IKR1ojSQS6jsrrwJwTHrYI02qv1DobkWGmEnpc9BX5J
   0tW0DkBgdn5YdZhhmmRn8PkfBaKm4HvpAar1ySlDU8MTd9il1q5cxQcvd
   wtKUNdbko9/maCzC7C7riTX7xBEhFdbsBIp1YXUON0k5fKVJE3uOq+v1p
   g==;
X-CSE-ConnectionGUID: oa13yc+8QF20sdG7MAR78Q==
X-CSE-MsgGUID: hbpW5E9TSEOlOJSDAVBKlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50183506"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="50183506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 03:35:37 -0800
X-CSE-ConnectionGUID: zp5L7RjZTgOSClGGL03bmw==
X-CSE-MsgGUID: OYt6dTIYTb29yGg8tVcRkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="91994898"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2024 03:35:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFtqw-0007Ff-07;
	Tue, 26 Nov 2024 11:35:34 +0000
Date: Tue, 26 Nov 2024 19:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/device.h:381:23: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202411261939.0W2NYIG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: f6bb3e9d98c2e8d70587d5ddaf9426ef30d7865c net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
date:   5 months ago
config: s390-randconfig-r132-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261939.0W2NYIG0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241126/202411261939.0W2NYIG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261939.0W2NYIG0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/pcs/pcs-xpcs-plat.c: note: in included file:
>> include/linux/device.h:381:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/device.h:381:23: sparse:     expected void [noderef] __iomem *
   include/linux/device.h:381:23: sparse:     got void *

vim +381 include/linux/device.h

da7c07b1083809 Mark Brown 2023-07-18  376  
da7c07b1083809 Mark Brown 2023-07-18  377  static inline
da7c07b1083809 Mark Brown 2023-07-18  378  void __iomem *devm_ioremap_resource(struct device *dev,
da7c07b1083809 Mark Brown 2023-07-18  379  				    const struct resource *res)
da7c07b1083809 Mark Brown 2023-07-18  380  {
da7c07b1083809 Mark Brown 2023-07-18 @381  	return ERR_PTR(-EINVAL);
da7c07b1083809 Mark Brown 2023-07-18  382  }
da7c07b1083809 Mark Brown 2023-07-18  383  

:::::: The code at line 381 was first introduced by commit
:::::: da7c07b1083809888c82522e74370f962fb7685e driver core: Provide stubs for !IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
