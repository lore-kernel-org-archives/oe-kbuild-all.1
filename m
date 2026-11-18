Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037148;
	b=xK6XWQGysd7hCC0+We6KG+iKLRiOlthGHX4nNcXm8pbmNB8uN+dWavc7cevprJXHcLBl
	 J7JR2KOk1gIFKm07LuKH7KTyY0K/Ynn9sgnkL2aw1jPtkQcS6V4j/N/0q+yEeMpy3Zv5P
	 WRjMp4faqQ448/VKJaFA8soNyZOtq5TKPLPrUrDOdXgGBJ4rFK24Az0RoMo2k88xTmZBs
	 EEB9+e+8K4ecbBv11b/ryiPL8nQ4cnImj5FH985Z+PPxDNwoV5ENbrYJ8PHvmUDgO/1ar
	 He9pMj3QbFK3RJk1mv+W3XU5ZbEgihXqaSbBEZQbtczh91a66crDsFqHW85T6p5DgJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037148;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=K+6McmEYZjMpQtW80Pjx77jFEaqQPS1b6cQI5g1iJ4Y=;
	b=km04lsIxNX6+q4ZV5fHxb5wZitZe0+5E0VKzthpnGT30Z/r8i8yTXEFKF3CGFFC7e9il
	 qhsTUq88Gs2mxLQqUnVVaxKD/LTDQr/d9T0wK3n7NscMw3onGRkUtMPCLKXy4zWdSfG/D
	 wLD7tSwt0E1WMv7IdYFHijgb4nTn6++cDrNeiXxRW25fCdNEAX8aa7oS6E1mSlLEH8rIS
	 GwHrpwrWYxeveD3AsnJfsPLlezpXBEdINm9zXB6EKkzeL8x9N/i7kbTipZysANa7uFJLD
	 4QtWCnhmqufOmq8fJoXsjYD6YCCOd5iiyO4Ko3LPgTKH68a6p7wG6O58P1r/3mG9w0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nf8sR09w;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAA60A2602
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 21:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1CAA60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nf8sR09w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795037147; x=1826573147;
  h=date:from:to:cc:subject:message-id;
  bh=YPcEa7xJWqemu7M/yRccEpiuulI0gBmHsH3rdE2tBGg=;
  b=Nf8sR09whN2/D7q+OVyATkESCfVlOFN5OPaeDTXC2X3VTcYoA8XA5tmV
   kenLn+F9gfKtIFfNnwSbjnhob3KC5e/zWQ6hDf6tur+sT1THFfL0uddwl
   5zj31AkGwGCRQDjAqqDophkPcXgBDCNROCJ9IHgVBESEJe88Gq2/WQJq3
   nJvEA5X2aCakWyiDKo13KY1kjwqBd+IG9S/ya3VTzQgXV3hemiWRRdvGh
   6QeJFWv5YKjp2TwenDuOCIse3M0WvR2RcFlFYAO7DxROaOy+N4NPRS14Z
   0agkMHz/oRfd8sIzJR6B7azAIxq0wUP+5BAps+Iwo9G/JdlPKv3VR3SR6
   g==;
X-CSE-ConnectionGUID: PClxf63SSMGuhyOezFr5Qw==
X-CSE-MsgGUID: UQk8pJwLSCO+1JhRWDt6ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3861684"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3861684"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:25:46 -0800
X-CSE-ConnectionGUID: 74Qy6KHvSP+YkJ9ThQYSrg==
X-CSE-MsgGUID: n8PM1vbbS4qRKGxdNQJ1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11990384"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Nov 2026 13:25:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTn9y-000000003TV-0nZX;
	Wed, 18 Nov 2026 21:25:42 +0000
Date: Wed, 18 Nov 2026 22:25:34 +0100
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:generic-set-memory/rfc-v2 38/59] mm/pageattr.c:36:23:
 warning: '%lu' directive output may be truncated writing between 1 and 17
 bytes into a region of size 16
Message-ID: <20261118221952.MHEBuyfD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git generic-set-memory/rfc-v2
head:   a095c48646998ad2b7c07e66d9f48b528ff46e21
commit: a71624ddc69aca86c7a8c3760d66502dfedd993c [38/59] riscv: use the generic change_page_attr() core
config: riscv-randconfig-2003-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118221952.MHEBuyfD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118221952.MHEBuyfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118221952.MHEBuyfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/pageattr.c: In function 'cpa_report_meminfo':
>> mm/pageattr.c:36:23: warning: '%lu' directive output may be truncated writing between 1 and 17 bytes into a region of size 16 [-Wformat-truncation=]
      snprintf(buf, len, "%luk", size >> 10);
                          ^~~
   mm/pageattr.c:36:22: note: directive argument in the range [0, 18014398509481983]
      snprintf(buf, len, "%luk", size >> 10);
                         ^~~~~~
   mm/pageattr.c:36:3: note: 'snprintf' output between 3 and 19 bytes into a destination of size 16
      snprintf(buf, len, "%luk", size >> 10);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +36 mm/pageattr.c

cef90439521d0f Mike Rapoport (Microsoft  2026-11-11  25) 
23804824af336c Mike Rapoport (Microsoft  2026-11-11  26) #if defined(CONFIG_PROC_FS) || defined(CONFIG_CPA_STATISTICS)
23804824af336c Mike Rapoport (Microsoft  2026-11-11  27) static const char *cpa_size_str(enum pgtable_level level, char *buf, size_t len)
23804824af336c Mike Rapoport (Microsoft  2026-11-11  28) {
23804824af336c Mike Rapoport (Microsoft  2026-11-11  29) 	unsigned long size = pgtable_level_size(level);
23804824af336c Mike Rapoport (Microsoft  2026-11-11  30) 
23804824af336c Mike Rapoport (Microsoft  2026-11-11  31) 	if (size >= SZ_1G)
23804824af336c Mike Rapoport (Microsoft  2026-11-11  32) 		snprintf(buf, len, "%luG", size >> 30);
23804824af336c Mike Rapoport (Microsoft  2026-11-11  33) 	else if (size >= SZ_1M)
23804824af336c Mike Rapoport (Microsoft  2026-11-11  34) 		snprintf(buf, len, "%luM", size >> 20);
23804824af336c Mike Rapoport (Microsoft  2026-11-11  35) 	else
23804824af336c Mike Rapoport (Microsoft  2026-11-11 @36) 		snprintf(buf, len, "%luk", size >> 10);
23804824af336c Mike Rapoport (Microsoft  2026-11-11  37) 
23804824af336c Mike Rapoport (Microsoft  2026-11-11  38) 	return buf;
23804824af336c Mike Rapoport (Microsoft  2026-11-11  39) }
23804824af336c Mike Rapoport (Microsoft  2026-11-11  40) #endif
23804824af336c Mike Rapoport (Microsoft  2026-11-11  41) 

:::::: The code at line 36 was first introduced by commit
:::::: 23804824af336c962d990879bdb693396188c198 mm/pageattr: move the direct map counters and /proc/meminfo from x86

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
