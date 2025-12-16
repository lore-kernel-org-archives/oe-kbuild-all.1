Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D29D313520
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875394; cv=none; b=rIBkQ+54TArVdL3wTJixg9LPnuwQdVaWRLrEMhvRjszZe5uAGx8TB0rAdSNtRn4GeJCOdqWtGDPCAlVfP2qNQAL2Ro70tKhkaV9et/c1rlbEvpnCYOK1TCbb5JSnBINfJ3u5FUcVb2cUX8grP+wQ1iGYnlWrzqrV27Er2T2Qz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875394; c=relaxed/simple;
	bh=Bf4JH99VSf8JQYsbSJvx7xFwfKju2AoXFtP78IFmqDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtBIGp2G2D8tRtpOuQewlJcqq/4MtqbViN8ruu0OOo2o9vaxG6j1DFNUxmD8lXwAdPoJDIzi2F80fFIgs801maJqtMxTG1A9wSbWgNs93E8lC2OioDWXq4IDj6l/PQ1kGvJ7n6NYmpMd1XVY1OANkUxhRlpR1y4oaVDNVBxIUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLlhECw1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLlhECw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765875392; x=1797411392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bf4JH99VSf8JQYsbSJvx7xFwfKju2AoXFtP78IFmqDo=;
  b=PLlhECw16O5mImUn3fpl3ZEK+s1n8GhN84YRhshdX5wqL03oaRvYDAU4
   AgoQO3aJHzqpF44LyXkCeneJbf7IPcqs3ILqqZJ4vfdG7Ay3N4saAdJCD
   k9pIL7CYKDZH1xEXwHEyz3RdLIWLMqBLuGcYO9zcgTn2JXAJgma+ZLsM4
   Jk5PI0M/9QQyGsUSl3MZhwabHPI1pbQMslwGFSXuj6GN6SvQvpdZGQC4C
   t0psIXndHAImbC36XVi7ekZE2FpM9aDbvzYjLhbmg72jfR6NIx/zBcUey
   b5BP1QIUnpBab6IkwBi0QPwtlcTDPA71y8wE6gLp0EcRG8NKgAZ/uC9YZ
   Q==;
X-CSE-ConnectionGUID: KLw+d73mSW2+6Tbv5CJDWA==
X-CSE-MsgGUID: a8RNSC/7TLiyrKHivwqoSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78425104"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78425104"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:56:31 -0800
X-CSE-ConnectionGUID: jt3ZJiUHRdeKaBF98/Dexg==
X-CSE-MsgGUID: Mw/22HXPTKW7jnr8OoKe6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="202374141"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 00:56:30 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQr1-000000001P6-1Xk4;
	Tue, 16 Dec 2025 08:56:24 +0000
Date: Tue, 16 Dec 2025 16:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for
 function 'gunyah_gup_reclaim_parcel'
Message-ID: <202512161724.AD6OgVJM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: 296cceed084451decfd348415b1db9c833443713 [2/2] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512161724.AD6OgVJM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161724.AD6OgVJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161724.AD6OgVJM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virt/gunyah/vm_mgr.c:18:
   In file included from drivers/virt/gunyah/vm_mgr.h:13:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for function 'gunyah_gup_reclaim_parcel' [-Wmissing-prototypes]
     887 | int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
         |     ^
   drivers/virt/gunyah/vm_mgr.c:887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     887 | int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
         | ^
         | static 
   6 warnings generated.


vim +/gunyah_gup_reclaim_parcel +887 drivers/virt/gunyah/vm_mgr.c

   886	
 > 887	int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
   888				       struct gunyah_rm_mem_parcel *parcel, u64 gfn,
   889				       u64 nr)
   890	{
   891		struct gunyah_rm_mem_entry *entry;
   892		struct folio *folio;
   893		pgoff_t i;
   894		int ret;
   895	
   896		if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
   897			ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
   898			if (ret) {
   899				dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
   900					ret);
   901				/* We can't reclaim the pages -- hold onto the pages
   902				 * forever because we don't know what state the memory
   903				 * is in
   904				 */
   905				return ret;
   906			}
   907			parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
   908	
   909			for (i = 0; i < parcel->n_mem_entries; i++) {
   910				entry = &parcel->mem_entries[i];
   911	
   912				folio = pfn_folio(PHYS_PFN(le64_to_cpu(entry->phys_addr)));
   913	
   914				if (folio_test_private(folio))
   915					gunyah_folio_host_reclaim(folio);
   916	
   917				folio_put(folio);
   918			}
   919	
   920			kfree(parcel->mem_entries);
   921			kfree(parcel->acl_entries);
   922		}
   923	
   924		return 0;
   925	}
   926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
