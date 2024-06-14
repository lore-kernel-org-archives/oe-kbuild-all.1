Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9FB1849
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354269; cv=none; b=KaLSqWoSPymMOwOGCFDuaYkuVGaX4PDaLLaI0MiE1jnLPXlIEu3Ahyd2h8rsIj/L5g7kIhRJRNOaoQG77R4VQmSogZ2V9pzNpTKornuS3hrex4FJYYeNvURNn8Y+fO1P9dgVWRe4JFbl73zvXbClrHIOG+aSRZe1FT9/1D1+xGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354269; c=relaxed/simple;
	bh=BonVXSllKQPjuFUYqyUIsJOZ7k7wZPsaW9p4y4rZ6uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XLJ2cnMGosopH/uaHz4F1LYp9C5pYAaLRT/rqcQh2HTeBzhtOlVAKUodVeVw4A++xkadnHvx+4EmvqY1WEx8+4Gao/TJZr37E1uQG926OnBX9igwXSYj+aRMbKER4B9OjX4UaH2BcUQlnOtM9tcP/c5TcMGRRbcDCd0hLWJoNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hod5DPbi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hod5DPbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718354268; x=1749890268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BonVXSllKQPjuFUYqyUIsJOZ7k7wZPsaW9p4y4rZ6uQ=;
  b=Hod5DPbi9X8KOfui85sgRoAtHV2L2ZjgI2mAMQy6P2Kdma2EItGLfvpB
   yP9gk9gSW79QM6I04D2P2YSVdw1cbpVnkPcIJSJ+e9QmxvnjLlJnoJPEc
   BlclpK3lDmFruk7O53CFzJ6RZ/nOu0/DeYqnqCIYMEJo6iUU1A/8ydxFh
   XzgpWY6/x7xIckHjtnHYOiTp9B1UxL0bnvvTBo7VM87O0UpPtYS6CU4tn
   QGSwjaoW3xUY44G+84dZNEJVIPPMdb8VNMzw8wr18kbMZ/h7pXKGBNyfA
   +p36OarOPJc1YGPQY72+qfdupnjae9sXGAVPCfnbYTN1FVPELGzi18br8
   w==;
X-CSE-ConnectionGUID: pvB4xKQxTLSlNUXwSv7BTA==
X-CSE-MsgGUID: YloagyzMSZ66BdUhF/Ku0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26649409"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="26649409"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:37:48 -0700
X-CSE-ConnectionGUID: zexDoKGRQripgForqsFPcQ==
X-CSE-MsgGUID: FO9yZpkoSs287AlB0fEIfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="44809611"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2024 01:37:46 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI2RM-000120-0G;
	Fri, 14 Jun 2024 08:37:44 +0000
Date: Fri, 14 Jun 2024 16:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 15/15] drivers/spi/spi-microchip-core-qspi.c:588:13:
 warning: 'mchp_coreqspi_deactivate_cs' defined but not used
Message-ID: <202406141653.CPl2oIdh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   37d983ccb68234f6cc876daf9f3e951fa4489856
commit: 37d983ccb68234f6cc876daf9f3e951fa4489856 [15/15] builds but nothing further done, a reminder that Mark asked for this
config: loongarch-randconfig-001-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141653.CPl2oIdh-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141653.CPl2oIdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141653.CPl2oIdh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-microchip-core-qspi.c:588:13: warning: 'mchp_coreqspi_deactivate_cs' defined but not used [-Wunused-function]
     588 | static void mchp_coreqspi_deactivate_cs(struct spi_device *spi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/spi/spi-microchip-core-qspi.c:582:13: warning: 'mchp_coreqspi_activate_cs' defined but not used [-Wunused-function]
     582 | static void mchp_coreqspi_activate_cs(struct spi_device *spi)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mchp_coreqspi_deactivate_cs +588 drivers/spi/spi-microchip-core-qspi.c

8596124c4c1bc7 Naga Sureshkumar Relli 2022-08-08  580  
4826c8be9e3ac1 Cyril Jean             2023-11-29  581  
4826c8be9e3ac1 Cyril Jean             2023-11-29 @582  static void mchp_coreqspi_activate_cs(struct spi_device *spi)
4826c8be9e3ac1 Cyril Jean             2023-11-29  583  {
4826c8be9e3ac1 Cyril Jean             2023-11-29  584  	if (spi_get_csgpiod(spi, 0))
4826c8be9e3ac1 Cyril Jean             2023-11-29  585  		gpiod_set_value(spi_get_csgpiod(spi, 0), 1);
4826c8be9e3ac1 Cyril Jean             2023-11-29  586  }
4826c8be9e3ac1 Cyril Jean             2023-11-29  587  
4826c8be9e3ac1 Cyril Jean             2023-11-29 @588  static void mchp_coreqspi_deactivate_cs(struct spi_device *spi)
4826c8be9e3ac1 Cyril Jean             2023-11-29  589  {
4826c8be9e3ac1 Cyril Jean             2023-11-29  590  	if (spi_get_csgpiod(spi, 0))
4826c8be9e3ac1 Cyril Jean             2023-11-29  591  		gpiod_set_value(spi_get_csgpiod(spi, 0), 0);
4826c8be9e3ac1 Cyril Jean             2023-11-29  592  }
4826c8be9e3ac1 Cyril Jean             2023-11-29  593  

:::::: The code at line 588 was first introduced by commit
:::::: 4826c8be9e3ac14feb8b905eab5104ea77656925 spi: microchip-core-qspi: Add regular transfers

:::::: TO: Cyril Jean <cyril.jean@microchip.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
