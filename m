Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E2392C57
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 10:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669123; cv=none; b=WPaUlppl8gEsgSOja0BX72xUl8DvkOWwyY3IqdAhCYVpt5E+SSk7HOzWWzEX/wJ7Gv5VoNFNqWEDe9Pi5WkEGqb2/oSQoTzX2CDrU6jDZbbV0bh9/bunECBOnj6UISEdeEwSbQO9VWA9JP6nxt7sWVuWKcpRdg7C9+MYJctRoYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669123; c=relaxed/simple;
	bh=2gmXOYlU4Gt5e0SMm4amUj6D62KvasjSAHgA7Ux4vcQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OdhUHBviUpVIYmWsO3jHoHYffP8wkEtFg2Ha792qkLHXjuP41dhhxQnQkwc+9l4+3obtUjvQRxDFtYNCGoHImLDglOPbf+PmiQwAGAnadvQvAiGy46XCEQYeOh1EA5v/Jaur7nUYsXl1Ptjcb1+zs7VWfX0hQAzNv7Ti7Z0he28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyRylTVV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyRylTVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669121; x=1810205121;
  h=date:from:to:cc:subject:message-id;
  bh=2gmXOYlU4Gt5e0SMm4amUj6D62KvasjSAHgA7Ux4vcQ=;
  b=OyRylTVV/1NZe7OgKPftXC2s9C4IZJ85X//ziXzy38E078g+Ca+lfFQ0
   /2zM70rGTjSTAUfgKsp4JIiJ6DCdKCLyQIb2Yh3pX9KE9Gt+xNkaAbgJ+
   WabdoMj9/3ajjV8MUZ7e8+AB5Rh+VfGNpIL5qk2o08dvNZXyVcG1u/wUh
   hiRwlB6SI3/nYkhq/YyeMeE+B2BpHMnCtqYJu1UkI+bGvGtxwQh2Kcrfd
   X8jbAStEytdFzNlBjJ2ZAS+HCwA1EMhzcXwdOFQwa+Ddm0uaptyf/srpk
   5B86zWnoplaL1yabylnPKu82677KhkM1aXiAfVUYxglqxcQxhfsFL3my1
   g==;
X-CSE-ConnectionGUID: Zrd0LnMtQIuxyseXmAz02w==
X-CSE-MsgGUID: ZCJo7/ZiSqOWVlS57pd/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79705848"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79705848"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:45:20 -0700
X-CSE-ConnectionGUID: DyL2LxycT+6dnDQCVEb3rQ==
X-CSE-MsgGUID: /tJLvQ2sRBeFJ1J9qaLAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="243039823"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2026 03:45:18 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN75X-000000003wr-11cN;
	Wed, 13 May 2026 10:45:15 +0000
Date: Wed, 13 May 2026 18:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Lai <justinlai0215@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Joe Damato <jdamato@fastly.com>
Subject: drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52:
 warning: '%u' directive output may be truncated writing between 1 and 10
 bytes into a region of size between 7 and 22
Message-ID: <202605131825.WUeRwNdl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Justin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: ef7d33e174564d6294edd00ca797e2b0aac76259 rtase: Modify the format specifier in snprintf to %u
date:   1 year ago
config: microblaze-randconfig-r123-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131825.WUeRwNdl-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131825.WUeRwNdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ef7d33e17456 ("rtase: Modify the format specifier in snprintf to %u")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131825.WUeRwNdl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/rtase/rtase_main.c: In function 'rtase_open':
>> drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:52: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
                                                       ^~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:45: note: directive argument in the range [0, 2147483647]
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
                                                ^~~~~~~~~~
   drivers/net/ethernet/realtek/rtase/rtase_main.c:1117:4: note: 'snprintf' output between 6 and 30 bytes into a destination of size 26
       snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         tp->dev->name, i);
         ~~~~~~~~~~~~~~~~~


vim +1117 drivers/net/ethernet/realtek/rtase/rtase_main.c

  1086	
  1087	static int rtase_open(struct net_device *dev)
  1088	{
  1089		struct rtase_private *tp = netdev_priv(dev);
  1090		const struct pci_dev *pdev = tp->pdev;
  1091		struct rtase_int_vector *ivec;
  1092		u16 i = 0, j;
  1093		int ret;
  1094	
  1095		ivec = &tp->int_vector[0];
  1096		tp->rx_buf_sz = RTASE_RX_BUF_SIZE;
  1097	
  1098		ret = rtase_alloc_desc(tp);
  1099		if (ret)
  1100			return ret;
  1101	
  1102		ret = rtase_init_ring(dev);
  1103		if (ret)
  1104			goto err_free_all_allocated_mem;
  1105	
  1106		rtase_hw_config(dev);
  1107	
  1108		if (tp->sw_flag & RTASE_SWF_MSIX_ENABLED) {
  1109			ret = request_irq(ivec->irq, rtase_interrupt, 0,
  1110					  dev->name, ivec);
  1111			if (ret)
  1112				goto err_free_all_allocated_irq;
  1113	
  1114			/* request other interrupts to handle multiqueue */
  1115			for (i = 1; i < tp->int_nums; i++) {
  1116				ivec = &tp->int_vector[i];
> 1117				snprintf(ivec->name, sizeof(ivec->name), "%s_int%u",
  1118					 tp->dev->name, i);
  1119				ret = request_irq(ivec->irq, rtase_q_interrupt, 0,
  1120						  ivec->name, ivec);
  1121				if (ret)
  1122					goto err_free_all_allocated_irq;
  1123			}
  1124		} else {
  1125			ret = request_irq(pdev->irq, rtase_interrupt, 0, dev->name,
  1126					  ivec);
  1127			if (ret)
  1128				goto err_free_all_allocated_mem;
  1129		}
  1130	
  1131		rtase_hw_start(dev);
  1132	
  1133		for (i = 0; i < tp->int_nums; i++) {
  1134			ivec = &tp->int_vector[i];
  1135			napi_enable(&ivec->napi);
  1136		}
  1137	
  1138		netif_carrier_on(dev);
  1139		netif_wake_queue(dev);
  1140	
  1141		return 0;
  1142	
  1143	err_free_all_allocated_irq:
  1144		for (j = 0; j < i; j++)
  1145			free_irq(tp->int_vector[j].irq, &tp->int_vector[j]);
  1146	
  1147	err_free_all_allocated_mem:
  1148		rtase_free_desc(tp);
  1149	
  1150		return ret;
  1151	}
  1152	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
