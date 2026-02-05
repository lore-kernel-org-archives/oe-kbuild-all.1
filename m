Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E77830B52B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770323074; cv=none; b=qc+czpR2ZytcOsw4rVh+pnXjdhWEKi+6Tv8YpqhdM8hmhTd5mfquHcHf5eEY+jFGzaR9UfqI4KvVOftP+3md9Jr5e9hdTboyweMf1Evp20YFmNjt+LOxv3Br78KF1xBwFJqSD4KYFL2IvbELadICGlZ2O0gKEkKDdWptNypDPpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770323074; c=relaxed/simple;
	bh=T2jnkyWWuqioV6t/kCCn5puLUJ00J5tUGKaRnZFTciU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bUMaZ10hSrXCzj4A+h3vBh56Sw5o0ennfGfi9NSwzOJ6r2vJr15eFOL/JAgELOXsHv/xtBSigkTw3zagIY4yCbK0Oe23FcEvKTm4GtNj77r2wCa+GnxLxXtEbu3qEj3E0TGjWpuP4HOqMdz/znxcCBhTLEm3eIHpDuwTEzjEtAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b51reOe5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b51reOe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770323073; x=1801859073;
  h=date:from:to:cc:subject:message-id;
  bh=T2jnkyWWuqioV6t/kCCn5puLUJ00J5tUGKaRnZFTciU=;
  b=b51reOe5fyj6myWWM/F6hzpJQ82c+uTGiAccXuxt37IU6usSyom1NNui
   BDmUZ64WDb6TBqM9a3QhEzWVp26CSlFl0Dg/kvxdM8Y5XfFSQtlWgJgF/
   zxV23P/SRt6fppZg0+FH1S064h05EKO2pIA3z2IGaUEj5wjMOgAH54ukK
   4RYMRlBplw0qsaupv2z+fbXL6A8ATCjDIfoLxPA4WCPJe3pxw2423pWld
   Y5m6SL5+seKVnUdgd6A/hmyFnJl9VQkVTBihQQ4DTuDSTc/ZVP9KmNC6D
   dQOt1Ouw/bNplKTlTOSzYqFmA6U3sgfqCjaLgfsmyZg3xs4jYz2kkg4jw
   g==;
X-CSE-ConnectionGUID: DE8WzU06SzmrkBcfCxXbqQ==
X-CSE-MsgGUID: ecpdPwZRRvumQg6Cr1auFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71258995"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71258995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 12:24:32 -0800
X-CSE-ConnectionGUID: nhdjAp/nRQGkoKUdGPUzig==
X-CSE-MsgGUID: dTggF4aoRDG6tuOaKkjmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="209764423"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2026 12:24:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo5ts-00000000kBE-1fHL;
	Thu, 05 Feb 2026 20:24:28 +0000
Date: Fri, 06 Feb 2026 04:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/net/ethernet/aeroflex/greth.c:363:9: sparse: sparse: incorrect type
 in argument 1 (different base types)
Message-ID: <202602060400.PEriLecu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   6b1c42d783637b473efce598dce9deab5c10ed42
commit: 9e61ba55c416e3551523e3f77305e88155bf8c16 [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sparc-randconfig-r122-20260205 (https://download.01.org/0day-ci/archive/20260206/202602060400.PEriLecu-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060400.PEriLecu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060400.PEriLecu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/aeroflex/greth.c:363:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:363:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:363:9: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:363:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:363:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:363:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:407:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:407:24: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:407:24: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:407:24: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:410:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:410:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:410:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:410:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:410:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:410:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:754:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:754:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:754:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:754:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:754:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:754:17: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:871:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:871:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:871:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:871:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:871:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:871:17: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:629:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:629:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:629:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:629:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:629:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:629:17: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:694:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:694:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:694:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:694:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:694:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:694:17: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:596:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:596:18: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:596:18: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:596:18: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:602:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:602:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:602:16: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:602:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1031:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1031:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1031:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1031:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1031:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1031:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1032:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1032:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1032:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1032:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1032:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1032:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1068:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1068:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1068:15: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1068:15: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1076:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1076:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1076:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1076:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1076:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1076:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1077:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1077:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1077:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1077:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1077:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1077:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1079:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1079:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1079:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1079:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1079:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1079:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1085:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1085:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1085:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1085:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1085:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1085:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1093:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1093:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1093:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1093:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1093:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1093:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:329:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:329:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:329:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:329:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:329:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:329:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:330:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:330:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:330:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:330:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
--
   drivers/net/ethernet/aeroflex/greth.c:1175:15: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1175:15: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1176:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1176:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1176:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1176:25: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1191:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1191:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1191:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1191:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1191:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1191:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1213:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1213:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1213:32: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1213:32: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1224:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1224:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1224:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1224:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1224:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1224:25: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1370:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct greth_regs *regs @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/aeroflex/greth.c:1370:21: sparse:     expected struct greth_regs *regs
   drivers/net/ethernet/aeroflex/greth.c:1370:21: sparse:     got void [noderef] __iomem *
   drivers/net/ethernet/aeroflex/greth.c:1391:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1391:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1391:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1391:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1391:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1391:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1395:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1395:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1395:16: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1395:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1405:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1405:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1405:27: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1405:27: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1408:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1408:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1408:15: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1408:15: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1419:17: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1480:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1480:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1480:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1480:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1480:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1480:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1481:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1481:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1481:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1481:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1481:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1481:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1485:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:1485:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:1485:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:1485:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1485:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1485:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1523:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct greth_regs *regs @@
   drivers/net/ethernet/aeroflex/greth.c:1523:46: sparse:     expected void [noderef] __iomem *base
   drivers/net/ethernet/aeroflex/greth.c:1523:46: sparse:     got struct greth_regs *regs
   drivers/net/ethernet/aeroflex/greth.c:1545:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct greth_regs *regs @@
   drivers/net/ethernet/aeroflex/greth.c:1545:47: sparse:     expected void [noderef] __iomem *base
   drivers/net/ethernet/aeroflex/greth.c:1545:47: sparse:     got struct greth_regs *regs
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:147:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:131:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:142:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:120:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:126:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:152:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:157:22: sparse:     got restricted __be32 [usertype]
>> drivers/net/ethernet/aeroflex/greth.c:157:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:157:40: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:137:9: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *bd @@
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse:     got unsigned int [usertype] *bd
   drivers/net/ethernet/aeroflex/greth.c:162:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse:     got unsigned int *
   drivers/net/ethernet/aeroflex/greth.c:1155:16: sparse: sparse: cast to restricted __be32

vim +363 drivers/net/ethernet/aeroflex/greth.c

d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  338  
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  339  static int greth_open(struct net_device *dev)
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  340  {
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  341  	struct greth_private *greth = netdev_priv(dev);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  342  	int err;
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  343  
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  344  	err = greth_init_rings(greth);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  345  	if (err) {
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  346  		if (netif_msg_ifup(greth))
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  347  			dev_err(&dev->dev, "Could not allocate memory for DMA rings\n");
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  348  		return err;
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  349  	}
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  350  
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  351  	err = request_irq(greth->irq, greth_interrupt, 0, "eth", (void *) dev);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  352  	if (err) {
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  353  		if (netif_msg_ifup(greth))
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  354  			dev_err(&dev->dev, "Could not allocate interrupt %d\n", dev->irq);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  355  		greth_clean_rings(greth);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  356  		return err;
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  357  	}
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  358  
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  359  	if (netif_msg_ifup(greth))
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  360  		dev_dbg(&dev->dev, " starting queue\n");
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  361  	netif_start_queue(dev);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  362  
bbe9e637330abe5 drivers/net/greth.c Daniel Hellstrom  2011-01-14 @363  	GRETH_REGSAVE(greth->regs->status, 0xFF);
bbe9e637330abe5 drivers/net/greth.c Daniel Hellstrom  2011-01-14  364  
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  365  	napi_enable(&greth->napi);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  366  
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  367  	greth_enable_irqs(greth);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  368  	greth_enable_tx(greth);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  369  	greth_enable_rx(greth);
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  370  	return 0;
d4c41139df6e74c drivers/net/greth.c Kristoffer Glembo 2010-02-15  371  

:::::: The code at line 363 was first introduced by commit
:::::: bbe9e637330abe55442aebe799425e224086959f GRETH: fix opening/closing

:::::: TO: Daniel Hellstrom <daniel@gaisler.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
