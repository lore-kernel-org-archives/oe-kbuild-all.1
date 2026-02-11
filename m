Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941A2EA731
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770833747; cv=none; b=Qnsd8TUlEurDxjLz0gxVDh1GmFKfeuHJma03YvRoxp5rl2sXCbaXOVcxTV8lwmZHvtuCLzREw9Fh0ySbeIfw0hGZ6+vDr+xLdqiW72YnzMziWk+cbsfJvwotrwmXp7s0SBmYe2M5Nw6/ojDjQIHZwpSFjqKeVGM069oFxWoGcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770833747; c=relaxed/simple;
	bh=xNQohoL/V5xuGbpEy8lYTy6PR6YPehDCy/ci5516HCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DOA+vvbPJYVrFQQftH7PX5L+xLfUQl1LaP5xEWafmt88AXMVt8kBf/6cOm3KVFqXIWglKsLmszxrAQZCYd4WZ4NCB1aQxMe6f2hDZRi2XW8qlAix8P/oLyP4YOSTcjq6GMIsMTBzgToYzTJZuD8+aL4iHHTsCmupadKkYJ5lE5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz3NP9/y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz3NP9/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770833745; x=1802369745;
  h=date:from:to:cc:subject:message-id;
  bh=xNQohoL/V5xuGbpEy8lYTy6PR6YPehDCy/ci5516HCE=;
  b=Cz3NP9/y8JEaeuJZmdbQh8cJSTvSYM6me2jecIFykJrS/KErpgCXj734
   rGc4+8ckOIc5AdXOgOxLZQbnXqQQUMz4RB1dDohgDGCbSydTJPBNCq5bx
   Z2JaIAiXriv4A7eqKdHk/m31ndaJ6rQkGNpzCR2J+GtmOVN40GhxJ//o7
   SL3MwuGoFD8BjK/5SC9TqzaIQ/UIrY0/C3ZHD8wVfSK1TB7kQT600B8Vv
   GWOsqMEx6LmwbvDkVpSsLQBpQ2FL46B828EErKl4C+bxyyCTKXojGdj/k
   /ifSNG0ZbXfpE6ABtJSsaqPEeooN1g7I0WVW/kW2mLR9CtGvcAtqZpWQu
   g==;
X-CSE-ConnectionGUID: P3DdUr+HS5ypmX+sABSs2w==
X-CSE-MsgGUID: xmdCf1rOT9C7MDd7UNWXWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82628918"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="82628918"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 10:15:44 -0800
X-CSE-ConnectionGUID: iePuvEBQQHiOpiRs67y01w==
X-CSE-MsgGUID: qHjTema0Tc2yih8wCI7dgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211232186"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2026 10:15:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqEkW-00000000qEu-4BeW;
	Wed, 11 Feb 2026 18:15:41 +0000
Date: Thu, 12 Feb 2026 02:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 arch/arm64/mm/mmu.c:1499:5: sparse: sparse: symbol
 'check_range_driver_managed' was not declared. Should it be static?
Message-ID: <202602120234.d1MpiYK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 1b4aca7d82ae9b40145484fa09ceab38a6a06062 [203/203] ANDROID: arm64/mm: implement {populate/depopulate}_range_driver_managed
config: arm64-randconfig-r134-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120234.d1MpiYK0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120234.d1MpiYK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120234.d1MpiYK0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/mm/mmu.c:1499:5: sparse: sparse: symbol 'check_range_driver_managed' was not declared. Should it be static?

vim +/check_range_driver_managed +1499 arch/arm64/mm/mmu.c

  1498	
> 1499	int check_range_driver_managed(u64 start, u64 size, const char *resource_name)
  1500	{
  1501		struct mem_section *ms;
  1502		unsigned long pfn = __phys_to_pfn(start);
  1503		unsigned long end_pfn = __phys_to_pfn(start + size);
  1504		struct resource *res;
  1505		unsigned long flags;
  1506	
  1507		res = lookup_resource(&iomem_resource, start);
  1508		if (!res) {
  1509			pr_err("%s: couldn't find memory resource for start 0x%lx\n",
  1510				   __func__, start);
  1511			return -EINVAL;
  1512		}
  1513	
  1514		flags = res->flags;
  1515	
  1516		if (!(flags & IORESOURCE_SYSRAM_DRIVER_MANAGED) ||
  1517		    strstr(resource_name, "System RAM (") != resource_name)
  1518			return -EINVAL;
  1519	
  1520		for (; pfn < end_pfn; pfn += PAGES_PER_SECTION) {
  1521			ms = __pfn_to_section(pfn);
  1522			if (early_section(ms))
  1523				return -EINVAL;
  1524		}
  1525	
  1526		return 0;
  1527	}
  1528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
