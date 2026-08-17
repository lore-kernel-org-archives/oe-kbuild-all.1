Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36AF3D7D83
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 16:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983651; cv=none; b=B0voIF9ePpCCF5OxH32Tbd82Ujs7/vOqE/qW8qGpoPHEVhAQIgmJXtXjZegwGdzsiEDeoVT2phyHBrFYRt6Ak5bEBU6mKCKRkf11Bc6wFg8xU2U4+56d5v5hvPJKzCOeEZMrYqiEKFL2RXonEyvMOgREBzDiQc1IrMzrJ8rUCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983651; c=relaxed/simple;
	bh=7mgRhLlLVz8ea8xbEyNRrj9hGr4kbdg4tsZR2ivmrSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Xk2Hf1XVDvpz6Uco8LSUe2W61xYGevQDFXe9EPMPvK0CEeuwcqaAPhqvrgtoy/36MaLqovpvpwzHw8mT027k77u9ZpWRebUU/XcV/ClOdJVPm+QUhn2VuBPavcpCbv3HahwSYa2B9EvRT88diNlRKNSEs6J/cxnxnqWSORQVw8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdbOjHuo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdbOjHuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786983650; x=1818519650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mgRhLlLVz8ea8xbEyNRrj9hGr4kbdg4tsZR2ivmrSo=;
  b=WdbOjHuoRv/Xxye1MEp8dInwzsa6vZsKXTlbFKipYb4AZi4AXkffpP7+
   qB9SK+iTe1a8C8L7OoNZ1jiMjPdTMMqr7K+uTYaXDISWzaeLrJ5bBbAyk
   6pIf9Qio2XbOzK0OOlBZ8n/SjSzA89QT5/aB41Ssga+aprpsTrxmbStzv
   Xn0lh8jt6gNQ9dNkbVCvxrE+5AW/5X7+c2AI364GEWw1an/aMu3x0qNFQ
   iP9fwot5322QTuiFwIWPhDmGiwm387Ctc2I1wWxSW/itVD+1AB7QC4q4s
   3gf2gu5AqcU4fjwWMqLT/BI+5nclJ8iov4V+isspDxJl5IbV/ZVDRpAFR
   g==;
X-CSE-ConnectionGUID: QpdL24b3TxedwBw3+Pgd0g==
X-CSE-MsgGUID: fgJpS2xWSkSgSArhqcOjnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="91334919"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="91334919"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 09:20:49 -0700
X-CSE-ConnectionGUID: PyfsP7ruRMGY7TAfJ/+XXA==
X-CSE-MsgGUID: nkeF6s3wRL6cK/HIeuPY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="263619249"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2026 09:20:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww04r-00000000dc0-3CnO;
	Mon, 17 Aug 2026 16:20:45 +0000
Date: Tue, 18 Aug 2026 00:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cached-prefix 66/71] lib/dynamic_debug.c:2205:2:
 error: #endif without #if
Message-ID: <202608180019.QQmR184G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cached-prefix
head:   9c2bc97085eaafb97fb747811e19d549297d5e0a
commit: f5a1c2c15cfd150a90470a1fefc12568fbce7441 [66/71] dyndbg: Combine 3 site-data maple trees into a single tree
config: i386-randconfig-011-20260812 (https://download.01.org/0day-ci/archive/20260818/202608180019.QQmR184G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180019.QQmR184G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180019.QQmR184G-lkp@intel.com/

Note: the jimc/dd-cached-prefix HEAD 9c2bc97085eaafb97fb747811e19d549297d5e0a builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_proc_show':
   lib/dynamic_debug.c:1435:58: error: 'pr_prefixes_count' undeclared (first use in this function); did you mean 'pr_prefixes_lock'?
    1435 |                 seq_printf(m, "#: cached_prefixes=%u\n", pr_prefixes_count);
         |                                                          ^~~~~~~~~~~~~~~~~
         |                                                          pr_prefixes_lock
   lib/dynamic_debug.c:1435:58: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:2205:2: error: #endif without #if
    2205 | #endif
         |  ^~~~~
>> lib/dynamic_debug.c:2160:13: warning: 'ddebug_prefix_range' defined but not used [-Wunused-function]
    2160 | static void ddebug_prefix_range(const struct _ddebug *desc,
         |             ^~~~~~~~~~~~~~~~~~~


vim +2205 lib/dynamic_debug.c

f5a1c2c15cfd15 Jim Cromie 2026-06-24  2159  
ecf273dd666033 Jim Cromie 2026-06-29 @2160  static void ddebug_prefix_range(const struct _ddebug *desc,
ecf273dd666033 Jim Cromie 2026-06-29  2161  				struct _dd_prefix_key_range *range)
ecf273dd666033 Jim Cromie 2026-06-29  2162  {
ecf273dd666033 Jim Cromie 2026-06-29  2163  	unsigned long addr = (unsigned long)desc;
ecf273dd666033 Jim Cromie 2026-06-29  2164  	unsigned long start = addr;
ecf273dd666033 Jim Cromie 2026-06-29  2165  	unsigned long end = addr;
ecf273dd666033 Jim Cromie 2026-06-29  2166  	uint8_t flags = prefix_flags(desc->flags);
ecf273dd666033 Jim Cromie 2026-06-29  2167  
ecf273dd666033 Jim Cromie 2026-06-29  2168  	if (flags & _DPRINTK_FLAGS_INCL_LINENO) {
ecf273dd666033 Jim Cromie 2026-06-29  2169  		/*
ecf273dd666033 Jim Cromie 2026-06-29  2170  		 * except for amdgpu, which has macros with 2+ pr_debugs,
ecf273dd666033 Jim Cromie 2026-06-29  2171  		 * all prefixes with line-numbers are unique.
ecf273dd666033 Jim Cromie 2026-06-29  2172  		 */
ecf273dd666033 Jim Cromie 2026-06-29  2173  		range->start = range->end = ddebug_prefix_key(desc);
ecf273dd666033 Jim Cromie 2026-06-29  2174  		return;
ecf273dd666033 Jim Cromie 2026-06-29  2175  	}
ecf273dd666033 Jim Cromie 2026-06-29  2176  
ecf273dd666033 Jim Cromie 2026-06-29  2177  	/* 1. Module Level (Always the base for sharing) */
ecf273dd666033 Jim Cromie 2026-06-29  2178  	{
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2179  		unsigned long mod_start, mod_end;
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2180  		ddebug_resolve_range(&dd_site_map, addr, &mod_start, &mod_end, DD_TAG_MOD);
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2181  		start = mod_start;
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2182  		end = mod_end;
ecf273dd666033 Jim Cromie 2026-06-29  2183  	}
ecf273dd666033 Jim Cromie 2026-06-29  2184  
ecf273dd666033 Jim Cromie 2026-06-29  2185  	/* 2. File Level (Narrow further if +s is set) */
ecf273dd666033 Jim Cromie 2026-06-29  2186  	if (flags & _DPRINTK_FLAGS_INCL_SOURCENAME) {
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2187  		unsigned long file_start, file_end;
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2188  		ddebug_resolve_range(&dd_site_map, addr, &file_start, &file_end, DD_TAG_FILE);
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2189  		start = max(start, file_start);
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2190  		end = min(end, file_end);
ecf273dd666033 Jim Cromie 2026-06-29  2191  	}
ecf273dd666033 Jim Cromie 2026-06-29  2192  
ecf273dd666033 Jim Cromie 2026-06-29  2193  	/* 3. Function Level (Narrow if +f is set) */
ecf273dd666033 Jim Cromie 2026-06-29  2194  	if (flags & _DPRINTK_FLAGS_INCL_FUNCNAME) {
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2195  		unsigned long func_start, func_end;
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2196  		ddebug_resolve_range(&dd_site_map, addr, &func_start, &func_end, DD_TAG_FUNC);
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2197  		start = max(start, func_start);
f5a1c2c15cfd15 Jim Cromie 2026-06-24  2198  		end = min(end, func_end);
ecf273dd666033 Jim Cromie 2026-06-29  2199  	}
ecf273dd666033 Jim Cromie 2026-06-29  2200  
ecf273dd666033 Jim Cromie 2026-06-29  2201  	/* Convert descriptor addresses to top-shifted flag-partitioned keys */
ecf273dd666033 Jim Cromie 2026-06-29  2202  	range->start = ddebug_pack_key(start, flags);
ecf273dd666033 Jim Cromie 2026-06-29  2203  	range->end = ddebug_pack_key(end, flags);
ecf273dd666033 Jim Cromie 2026-06-29  2204  }
ecf273dd666033 Jim Cromie 2026-06-29 @2205  #endif
ecf273dd666033 Jim Cromie 2026-06-29  2206  

:::::: The code at line 2205 was first introduced by commit
:::::: ecf273dd6660331c645940bfe8e7bbca17921ef9 dyndbg: cache shared dynamic prefixes

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
