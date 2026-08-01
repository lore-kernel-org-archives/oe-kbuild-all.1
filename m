Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B9E3B14D7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785577382; cv=none; b=hFYUzam1904aPF7GNqREny4W+LxEr6o+wRcp/0Yf7vnIaa99PF7cD1JJWzEVmNJcLe9vFHm+vNp1px5lODPxFeAxfiI6NQn7pau+MzX96ZUTwlNKVeXce6V1oX9n44BnWX6kRkShv/266I4pEVAU8Y6vsVrFzy65VsEFAtV/qtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785577382; c=relaxed/simple;
	bh=2H+Wgo1rZRi0vGRr8dVWFrxefa55oRMIXfwnsLaocnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eggOSVO7N9exAwheuwsiO0LeN1w4UEX1DI4jNbaiPTcO57k6AzfH2LB48PHn+0bJs8zLl+wFkD7Vra5rkz1X/F/WtXen/gAjSHoChAA3l7FlQb0QoWEdT9ghRLpEFYLnPn4yHZ/agdxhF8AfJXG71mNozuAAdzjtfmnrpBLSLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZpjmKS6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZpjmKS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785577379; x=1817113379;
  h=date:from:to:cc:subject:message-id;
  bh=2H+Wgo1rZRi0vGRr8dVWFrxefa55oRMIXfwnsLaocnM=;
  b=bZpjmKS6grExPiZHrRHfA72UzpqBDu0kkC+HngMafQMMXotXi8C+PE7p
   VQz3nF9gqiGXZ/4XFAupZMSIgQgbzZbt0amAeTIlUTCmNd6G63+6Ipthw
   CFselFmjOafeZtBwPgWe6qgxzOzD6CvSmwpr9HdxmH0SgouhMCEl/bOVS
   Ga//IsIxZeOqDFsPEaTj9F5G1Joaj7kYChX6JYFm4mc9uIm78HhpM3oZf
   RIXACWzwqCnQi+KGUSId0Nbu1WwfmFY2QjBpAwbuQqYuSaVfuYSTopD/N
   s3HQ0fif8quj/I3K2FvhA/8T/YuiYRk2lSUEPBRHvQOPO//hzGNfawEGr
   w==;
X-CSE-ConnectionGUID: buraQOs3Ske/rBI9zxHPhg==
X-CSE-MsgGUID: j2J9a+QrREyWaWX+YX7Y9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86395120"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="86395120"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 02:42:57 -0700
X-CSE-ConnectionGUID: H3N8fBKXR3Sz/BYOZZdXbw==
X-CSE-MsgGUID: dShPqWWcQE28e2ICdAa45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="260215067"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Aug 2026 02:42:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq6F4-0000000037B-0Esg;
	Sat, 01 Aug 2026 09:42:54 +0000
Date: Sat, 01 Aug 2026 17:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 290/700]
 drivers/gpio/gpio-ssd210.c:448:22: warning: unused variable 'offset'
Message-ID: <202608011730.fftfW3p0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 2833a14b64ac977478b34e1993f75fe0a2aaa4b9 [290/700] gpio: mstar: ssd210 gpio support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260801/202608011730.fftfW3p0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011730.fftfW3p0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011730.fftfW3p0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-ssd210.c: In function 'ssd210_gpio_child_to_parent_hwirq':
>> drivers/gpio/gpio-ssd210.c:448:22: warning: unused variable 'offset' [-Wunused-variable]
     448 |         unsigned int offset = priv->gpio_data->offsets[child];
         |                      ^~~~~~


vim +/offset +448 drivers/gpio/gpio-ssd210.c

   440	
   441	static int ssd210_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
   442						     unsigned int child,
   443						     unsigned int child_type,
   444						     unsigned int *parent,
   445						     unsigned int *parent_type)
   446	{
   447		struct ssd210_gpio *priv = gpiochip_get_data(chip);
 > 448		unsigned int offset = priv->gpio_data->offsets[child];
   449	
   450		return -EINVAL;
   451	}
   452	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
