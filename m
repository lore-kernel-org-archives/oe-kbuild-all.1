Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40084157E7A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714757267; cv=none; b=K4hwjj1rl1RAJme4GB4axAEzSd7iVTA5RcPNFI8y1dJmEWL8y/Cm9mHHN2wg9cAToW2mcJ9N4xD35ZIShJVBSoJZT4Cm4oURogRkGhyDsILYFZhhpRXtf/zG6jRxWl0RfSKd26ClaBzhXBLPv38a36+t3lAlK6c8jF6eaQPLUZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714757267; c=relaxed/simple;
	bh=kC1rxghHJQnlVZD5qvO+LCxYw8ev5a1rXSdqYFOpRcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClogYAzd8PRJrEGYe8dm8Ha71xXTrevFNBjUM400EpwmGzxjcs1I0ZjJb1CqcOurbZENQ2hkwnyNBwUc1Cf5Hj/wX4V5BsryOuMLxNOjBmjVbK4oTgeDllrLiHlhwrUW9NxjrX1ho87ThEeShr9o3BYfY3c1FmF+GCvSHrbzsBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgYQm/Wu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgYQm/Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714757266; x=1746293266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kC1rxghHJQnlVZD5qvO+LCxYw8ev5a1rXSdqYFOpRcI=;
  b=PgYQm/WuwJniThMALK/4iYC+riqFtAraFA/4eHGNY4Fmq/LUz71qyzVI
   KZb6a8GJslAlj5BlH6T0WieEqsv0wtStrumWWgf8tb6vw7MY6cbHsr+LO
   iGmRvAjjTLnS5uzWnpHHD1rciifuv/W4F18Ue9HMffmAxLuWuscRyrmgP
   gwQILGUFkv6JbC+brbeSW/w1FKbaPnxnpeFfxdEX/we0sVM0+mxxud6Er
   Z+cOiD8R88PJxNi5JuwuRkahoCInjjjkdBj9EahiGagLwhbUC9HktWj2/
   9XFf5EZsonxhkaKj2P+SHq+tJQWxDmm+0Bg68NR8OzLd39HV9A151N77b
   A==;
X-CSE-ConnectionGUID: B8OD3tEASHiCrM6CxEkNsA==
X-CSE-MsgGUID: 4YcpOF4oQnaTTipI18Z1uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="35962837"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="35962837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 10:27:46 -0700
X-CSE-ConnectionGUID: 8YhapoZfTDmSgK1qONHdyg==
X-CSE-MsgGUID: 7JxxymMNQJWZVSh4FkrWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="28100002"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2024 10:27:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2whC-000Bwm-0p;
	Fri, 03 May 2024 17:27:42 +0000
Date: Sat, 4 May 2024 01:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 145/1143]
 drivers/soc/aspeed/aspeed-bmc-dev.c:433:16: warning: conversion from 'long
 unsigned int' to 'u32' {aka 'unsigned int'} changes value from
 '18446744073708503041' to '4293918721'
Message-ID: <202405040118.GjeEHyFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 2667c4a4b011369552565f08ce22c013b0f68f5e [145/1143] soc:aspeed: bmc device for ast2700
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040118.GjeEHyFu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040118.GjeEHyFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040118.GjeEHyFu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/aspeed/aspeed-bmc-dev.c: In function 'aspeed_bmc_device_init':
>> drivers/soc/aspeed/aspeed-bmc-dev.c:433:16: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073708503041' to '4293918721' [-Woverflow]
     433 |         writel(~(BMC_MEM_BAR_SIZE - 1) | HOST2BMC_MEM_BAR_ENABLE,


vim +433 drivers/soc/aspeed/aspeed-bmc-dev.c

   432	
 > 433		writel(~(BMC_MEM_BAR_SIZE - 1) | HOST2BMC_MEM_BAR_ENABLE,
   434		       bmc_device->reg_base + ASPEED_BMC_MEM_BAR);
   435		writel(bmc_device->bmc_mem_phy, bmc_device->reg_base + ASPEED_BMC_MEM_BAR_REMAP);
   436	#endif
   437	
   438		//Setting BMC to Host Q register
   439		writel(BMC2HOST_Q2_FULL_UNMASK | BMC2HOST_Q1_FULL_UNMASK | BMC2HOST_ENABLE_INTB,
   440		       bmc_device->reg_base + ASPEED_BMC_BMC2HOST_STS);
   441		writel(HOST2BMC_Q2_FULL_UNMASK | HOST2BMC_Q1_FULL_UNMASK | HOST2BMC_ENABLE_INTB,
   442		       bmc_device->reg_base + ASPEED_BMC_HOST2BMC_STS);
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
