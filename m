Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBF7282F31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778910263; cv=none; b=s1cJ1ZPgSeFnLORQKGyzTitVN1T7wUWc+n23w8jmPSQObZxcQ08Zo2U5/5NfiD/XkpdzlfEKRR8NwxHSXmW/9beiU7gzvuy0+WBf3P74j4rsAKmQbsY/gQq23YTWb4IdIE8oO1BHf6aAKOE/y5L4bG8xuQgeksZRZm1wPQLm2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778910263; c=relaxed/simple;
	bh=uj3g24ZvGFNUutQr1zTXp/3zxibs7a0DM77jhnLmP64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j+SdmHlgJHGuxpLicqV9j9haWDVNW6Y4sqY+yoqLlJOeFcNaxLcBwS0oTSuSCSVqdGT3iuQk8ElMfEz5lOuwB3XSOgw3ucTJ3puGIobmSSh79m8WD+8xKuX5+OP9qgnvN5CK1WJvwrlxUm0xgwJQCrgTvVDcBT6rRTbUPyaov6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hD/dtlNp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hD/dtlNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778910262; x=1810446262;
  h=date:from:to:cc:subject:message-id;
  bh=uj3g24ZvGFNUutQr1zTXp/3zxibs7a0DM77jhnLmP64=;
  b=hD/dtlNp26Z0PGUE3LDIGIG85c9y29mirOhi5cUelj0SmJSgCV5xrXF9
   30UNMPChYjUHDQHc8xMw0cdFbPQrzQHlR4HAAl16Ppa1CP+zsMkKhwetP
   8A4uOXXmL9WLbsBR3jXBczjmmPCDeNP7ZSbxDmLLahkIlf4idbavzUoPi
   pLhq/SkQQodb41I3hUp+ROlq4/JTUESB8yY4w/AdorSfHA5gbMWOR42Wd
   A1digT0WFp78soeNPJLVVm6mZcYfaSjjndEDO6p05WX3rOB59E3tISpDW
   bSljgUIigUlUY2Z2TItI9IlYC4mnoqaOrq0fch7UCcca25AIPcGHlSfMc
   A==;
X-CSE-ConnectionGUID: APWdFzPSQk2eN+vMdXN2CQ==
X-CSE-MsgGUID: 6rrHdXPpTGqLJL7f1Bh1Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="91245868"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="91245868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 22:44:21 -0700
X-CSE-ConnectionGUID: e+c8T59dRX2cWSGT4WzQew==
X-CSE-MsgGUID: qFRMm9r3SyWOmzNWTEfY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="262667654"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 22:44:19 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO7ov-000000000Y1-0y9M;
	Sat, 16 May 2026 05:44:17 +0000
Date: Sat, 16 May 2026 13:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 1/1]
 drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning: '%i'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size between 7 and 22
Message-ID: <202605161323.oqgz4LKt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Justin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   f815f5cffc922b8894200a0522dcb04211c469ec
commit: ad61903add56561b72b49d717c01563cf1535781 [1/1] realtek: Update the Makefile and Kconfig in the realtek folder
config: arm-randconfig-002-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161323.oqgz4LKt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161323.oqgz4LKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ad61903add56 ("realtek: Update the Makefile and Kconfig in the realtek folder")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161323.oqgz4LKt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/rtase/rtase_main.c: In function 'rtase_open':
>> drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning: '%i' directive output may be truncated writing between 1 and 10 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%i",
                                                       ^~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:45: note: directive argument in the range [0, 2147483647]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%i",
                                                ^~~~~~~~~~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:4: note: 'snprintf' output between 6 and 30 bytes into a destination of size 26
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%i",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         tp->dev->name, i);
         ~~~~~~~~~~~~~~~~~


vim +1117 drivers/net/ethernet/realtek/rtase/rtase_main.c

2bbba79e348d87 Justin Lai 2024-09-04  1086  
ea244d7d8dce07 Justin Lai 2024-09-04  1087  static int rtase_open(struct net_device *dev)
ea244d7d8dce07 Justin Lai 2024-09-04  1088  {
ea244d7d8dce07 Justin Lai 2024-09-04  1089  	struct rtase_private *tp = netdev_priv(dev);
ea244d7d8dce07 Justin Lai 2024-09-04  1090  	const struct pci_dev *pdev = tp->pdev;
ea244d7d8dce07 Justin Lai 2024-09-04  1091  	struct rtase_int_vector *ivec;
ea244d7d8dce07 Justin Lai 2024-09-04  1092  	u16 i = 0, j;
ea244d7d8dce07 Justin Lai 2024-09-04  1093  	int ret;
ea244d7d8dce07 Justin Lai 2024-09-04  1094  
ea244d7d8dce07 Justin Lai 2024-09-04  1095  	ivec = &tp->int_vector[0];
ea244d7d8dce07 Justin Lai 2024-09-04  1096  	tp->rx_buf_sz = RTASE_RX_BUF_SIZE;
ea244d7d8dce07 Justin Lai 2024-09-04  1097  
ea244d7d8dce07 Justin Lai 2024-09-04  1098  	ret = rtase_alloc_desc(tp);
ea244d7d8dce07 Justin Lai 2024-09-04  1099  	if (ret)
ea244d7d8dce07 Justin Lai 2024-09-04  1100  		return ret;
ea244d7d8dce07 Justin Lai 2024-09-04  1101  
ea244d7d8dce07 Justin Lai 2024-09-04  1102  	ret = rtase_init_ring(dev);
ea244d7d8dce07 Justin Lai 2024-09-04  1103  	if (ret)
ea244d7d8dce07 Justin Lai 2024-09-04  1104  		goto err_free_all_allocated_mem;
ea244d7d8dce07 Justin Lai 2024-09-04  1105  
ea244d7d8dce07 Justin Lai 2024-09-04  1106  	rtase_hw_config(dev);
ea244d7d8dce07 Justin Lai 2024-09-04  1107  
ea244d7d8dce07 Justin Lai 2024-09-04  1108  	if (tp->sw_flag & RTASE_SWF_MSIX_ENABLED) {
ea244d7d8dce07 Justin Lai 2024-09-04  1109  		ret = request_irq(ivec->irq, rtase_interrupt, 0,
ea244d7d8dce07 Justin Lai 2024-09-04  1110  				  dev->name, ivec);
ea244d7d8dce07 Justin Lai 2024-09-04  1111  		if (ret)
ea244d7d8dce07 Justin Lai 2024-09-04  1112  			goto err_free_all_allocated_irq;
ea244d7d8dce07 Justin Lai 2024-09-04  1113  
ea244d7d8dce07 Justin Lai 2024-09-04  1114  		/* request other interrupts to handle multiqueue */
ea244d7d8dce07 Justin Lai 2024-09-04  1115  		for (i = 1; i < tp->int_nums; i++) {
ea244d7d8dce07 Justin Lai 2024-09-04  1116  			ivec = &tp->int_vector[i];
ea244d7d8dce07 Justin Lai 2024-09-04 @1117  			snprintf(ivec->name, sizeof(ivec->name), "%s_int%i",
ea244d7d8dce07 Justin Lai 2024-09-04  1118  				 tp->dev->name, i);
ea244d7d8dce07 Justin Lai 2024-09-04  1119  			ret = request_irq(ivec->irq, rtase_q_interrupt, 0,
ea244d7d8dce07 Justin Lai 2024-09-04  1120  					  ivec->name, ivec);
ea244d7d8dce07 Justin Lai 2024-09-04  1121  			if (ret)
ea244d7d8dce07 Justin Lai 2024-09-04  1122  				goto err_free_all_allocated_irq;
ea244d7d8dce07 Justin Lai 2024-09-04  1123  		}
ea244d7d8dce07 Justin Lai 2024-09-04  1124  	} else {
ea244d7d8dce07 Justin Lai 2024-09-04  1125  		ret = request_irq(pdev->irq, rtase_interrupt, 0, dev->name,
ea244d7d8dce07 Justin Lai 2024-09-04  1126  				  ivec);
ea244d7d8dce07 Justin Lai 2024-09-04  1127  		if (ret)
ea244d7d8dce07 Justin Lai 2024-09-04  1128  			goto err_free_all_allocated_mem;
ea244d7d8dce07 Justin Lai 2024-09-04  1129  	}
ea244d7d8dce07 Justin Lai 2024-09-04  1130  
ea244d7d8dce07 Justin Lai 2024-09-04  1131  	rtase_hw_start(dev);
ea244d7d8dce07 Justin Lai 2024-09-04  1132  
ea244d7d8dce07 Justin Lai 2024-09-04  1133  	for (i = 0; i < tp->int_nums; i++) {
ea244d7d8dce07 Justin Lai 2024-09-04  1134  		ivec = &tp->int_vector[i];
ea244d7d8dce07 Justin Lai 2024-09-04  1135  		napi_enable(&ivec->napi);
ea244d7d8dce07 Justin Lai 2024-09-04  1136  	}
ea244d7d8dce07 Justin Lai 2024-09-04  1137  
ea244d7d8dce07 Justin Lai 2024-09-04  1138  	netif_carrier_on(dev);
ea244d7d8dce07 Justin Lai 2024-09-04  1139  	netif_wake_queue(dev);
ea244d7d8dce07 Justin Lai 2024-09-04  1140  
ea244d7d8dce07 Justin Lai 2024-09-04  1141  	return 0;
ea244d7d8dce07 Justin Lai 2024-09-04  1142  
ea244d7d8dce07 Justin Lai 2024-09-04  1143  err_free_all_allocated_irq:
ea244d7d8dce07 Justin Lai 2024-09-04  1144  	for (j = 0; j < i; j++)
ea244d7d8dce07 Justin Lai 2024-09-04  1145  		free_irq(tp->int_vector[j].irq, &tp->int_vector[j]);
ea244d7d8dce07 Justin Lai 2024-09-04  1146  
ea244d7d8dce07 Justin Lai 2024-09-04  1147  err_free_all_allocated_mem:
ea244d7d8dce07 Justin Lai 2024-09-04  1148  	rtase_free_desc(tp);
ea244d7d8dce07 Justin Lai 2024-09-04  1149  
ea244d7d8dce07 Justin Lai 2024-09-04  1150  	return ret;
ea244d7d8dce07 Justin Lai 2024-09-04  1151  }
ea244d7d8dce07 Justin Lai 2024-09-04  1152  

:::::: The code at line 1117 was first introduced by commit
:::::: ea244d7d8dce074e8a38e658ecd2e96abed288af rtase: Implement the .ndo_open function

:::::: TO: Justin Lai <justinlai0215@realtek.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
