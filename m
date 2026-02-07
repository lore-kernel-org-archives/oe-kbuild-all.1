Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995D288AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770436230; cv=none; b=UldMEWi96/kBxE8nmyLzjVyUabKXf3plQW4ngUXIXLo10U2XSan5G98rSfkrsfCs7BIV2iGEPZ+WllMTn1tHEgRDrW8SJ4aYeibS5t2limNd+FEhOgpg/8ArSLQZENldW3Z1IlJ67jhyfg8MO2zRJWFx0AZhuwYfe1MzCbeIKdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770436230; c=relaxed/simple;
	bh=3Id/dkr5wWyRjw79gZXyEXI8PBHZNMfIoL5iH/PG7yQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCKOfJ2jENcO3ZmnXmJ5rrefHwM5Krg7PCAJoOAMi+YLlRWnLOXHDLLUgL5u56j0iorYAVPfAeaiUKPw/bMcvE4MIl/hb669IgKzhZNYWqKb1QInsBEannZ2YfXZvfhvI0gWY1oDgfnUK/EVL1w6MImElSUfPV6E+ZfmlwAqrIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDvEobSk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDvEobSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770436230; x=1801972230;
  h=date:from:to:cc:subject:message-id;
  bh=3Id/dkr5wWyRjw79gZXyEXI8PBHZNMfIoL5iH/PG7yQ=;
  b=oDvEobSkk/85EnVul6b0dHGQf9mo1yEQ4n9+Vn4KtuWd4j2Pakq7BqgF
   7v5sOrxyDNcvPCBsoihsTcHGcLZRp4sjOM7Vwy9xeE4TUT0NtTQ0c3vp8
   DhEBsv7DBjY2zPQHFTTsDBxY7E2F6cjKVgi7O/zquu84Qj7PNIJv4nwOt
   u0x48e5rdbAMIHk77kvVACu39uoD5jgqKjLOvCmvwXJu6vR1yOWfOwlI8
   JgNSyZPQ55NBnAPbppIc6rYhdHlD3hrs4xdsSWzjJ1eQSVQcxyKeiA1/k
   tNdAH3FT3BFvaShCv674AdAOK0masDTJp5aMHx7WRjGNytMS6mv1B23VW
   A==;
X-CSE-ConnectionGUID: iXsuSROFTuCaV0GGVkOFAw==
X-CSE-MsgGUID: XTChai5NReiyjAFdr7TXBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75492176"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75492176"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 19:50:29 -0800
X-CSE-ConnectionGUID: Ae0jEdIcSoWDOuu+gvHFXg==
X-CSE-MsgGUID: 6zw4nruwQIuDH35Xv99Gww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215220382"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 19:50:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voZKz-00000000lMu-3gFU;
	Sat, 07 Feb 2026 03:50:25 +0000
Date: Sat, 07 Feb 2026 11:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/mm.h:30:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202602071127.n6ZcXuhX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eeee2f3cb9b462b9954fc31022a42fe014fbdc24
commit: 97868360eb78e4c699cbf00baed15af55d0266f7 [1/1] ANDROID: vendor_hooks: add rvh for control memory dirty rate
config: i386-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071127.n6ZcXuhX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071127.n6ZcXuhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071127.n6ZcXuhX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page-writeback.c: note: in included file:
>> include/trace/hooks/mm.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   mm/page-writeback.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'folio_redirty_for_writepage' - different lock contexts for basic block
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in '__folio_cancel_dirty' - different lock contexts for basic block
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'folio_clear_dirty_for_io' - different lock contexts for basic block

vim +30 include/trace/hooks/mm.h

    12	
    13	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    14				TP_PROTO(gfp_t *flags),
    15				TP_ARGS(flags), 1);
    16	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    17				TP_PROTO(gfp_t *flags),
    18				TP_ARGS(flags), 1);
    19	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    20				TP_PROTO(gfp_t *flags),
    21				TP_ARGS(flags), 1);
    22	
    23	*/
    24	DECLARE_HOOK(android_vh_slab_folio_alloced,
    25		TP_PROTO(unsigned int order, gfp_t flags),
    26		TP_ARGS(order, flags));
    27	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
    28		TP_PROTO(struct page *page, unsigned int order, gfp_t flags),
    29		TP_ARGS(page, order, flags));
  > 30	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
    31		TP_PROTO(void *unused),
    32		TP_ARGS(unused), 1);
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
