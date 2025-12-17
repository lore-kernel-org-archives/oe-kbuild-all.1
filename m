Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6FA22B8D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 04:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765944415; cv=none; b=k1KHn6vZNQqtdSzgOlpPNIkrh3T0dagCb5cflICuFkOD/xc2T2NIc4sipsRO/1lkBsXynMb/IJ3cVErssutmTuEBgkxFy0EYoOCNd5XsSsbRpOHmAczAG5CkaFUv4UshChif1NsVJ3jx3gh43WxDBdHenfTo7bcUrmS8egL9Zw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765944415; c=relaxed/simple;
	bh=Us9u+8GVfapmWRO7h/NZdVB7HgmG40mnuXRnM50bQVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fO1PYQwzAy2n/j2kWWDt4QvAiUQTUJhsNMlUUOB20UFlqVRjg+NhoYC5Nrq/bBeJPH3mKgmVt/T2hCSQa+uZnHN5oLwYKFbItZSvyGu3MIJ75T6GJVdBRU3j2aX7kbU8k4AwNWt9THRIPecm7l9AlGusGtxR5LBQcY65WuHUOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaHcaXJZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaHcaXJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765944413; x=1797480413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Us9u+8GVfapmWRO7h/NZdVB7HgmG40mnuXRnM50bQVg=;
  b=JaHcaXJZsDN+/R8G7skZqs7RuFx/931zSj/ycgskmjpiDeMSjhS/L9md
   9Bw8MARvJh3HHl1eFrWXIH+/mEEZsnuYtZRtp+UzCcLzN4Azut1LYzGmM
   Q9NSKbpaN9K3rNNEWSndO4E/ZsA3tTDOlSd4+sW8RDH+L5RiEYFoFqYvQ
   9Haii3RSnFXKe7Icer18cO9FU2xF8I5zHmdVNVEahBTZfmNsnh4i69F1W
   09oRpHFA3I9dedCRzUIHvDdf0jsLyHq4CJYEzjRbaYUuYAuqg4B9TQ0l2
   cdXHmbn/OFpCv0drtooJZYgPpyJ4xopZh7fXU019txNcCJIDnVk9pRIm7
   A==;
X-CSE-ConnectionGUID: pYeSKjfIQL6YAGpL4KnShQ==
X-CSE-MsgGUID: Koey9bVGSS6aZocoLmS9Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="55445895"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="55445895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 20:06:53 -0800
X-CSE-ConnectionGUID: xHJNxeTMTYCBaYGrTwhtTg==
X-CSE-MsgGUID: K/hKpIZDQ1KnbfL8eG2OQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="197480723"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Dec 2025 20:06:52 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVioK-0000000049m-22CL;
	Wed, 17 Dec 2025 04:06:48 +0000
Date: Wed, 17 Dec 2025 12:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 2/2]
 drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning: '%i'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size between 7 and 22
Message-ID: <202512171214.0dfu5bPI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Justin,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   a7e6fb8e7fb7fae958bcf0af780dbc872c8f74bd
commit: ad61903add56561b72b49d717c01563cf1535781 [2/2] realtek: Update the Makefile and Kconfig in the realtek folder
config: arm64-randconfig-001-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171214.0dfu5bPI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171214.0dfu5bPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171214.0dfu5bPI-lkp@intel.com/

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
