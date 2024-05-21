Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B79610C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716267651; cv=none; b=na3EAvg7hku/2T1cZgiPLjJ1FLTlQiJ9pB9zlBUMmgULEdGXrrT6CNWjwlh4IwyclC1bSH9qwzh3iEgHc0xeZRZ4p/MYYhpRPAFqCh39o6lTtsGypkH3cCU9lyU8dfKTMrQb2gzFZOAPH1mBy2hDPbKhta3446hw8OiWRj14qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716267651; c=relaxed/simple;
	bh=L3mhhqeQT1COUFnGWdLHDkFK6D8I0zTAwCUeMR7s8u0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fxL6Hkgg0yHB8VyyZZFaLnZhyylpD/HuG7kQMRMXtaVeIfUIy+9JB3RL5MFkpuoYqUlhupG31+EXgdlLy0n18szG3s1kEzH0RTgcJKJgbqUJfzRs0uOiM9ig1f/yFO7G4y5QMpyagc88RyTJmCgq3IXnfyi9PqbqRbnBRqSEyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3E5QyT8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3E5QyT8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716267649; x=1747803649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L3mhhqeQT1COUFnGWdLHDkFK6D8I0zTAwCUeMR7s8u0=;
  b=d3E5QyT8PVlE89s9gr9E/keJjvT6Wm+BJ2BN/LAiXuaSXfJd9N85FbYr
   srSqn6UfHOaPrKwkiWCicVeABENrCC/imoWd/CyW/14ElpA6yJRipD648
   0etBJbLQ35gr8/DLvihHe2LegBbFPIYUUxE5dIQkR1cZpAQuOLcLUfcbw
   v9siokz/ex8+JMpXPzkBRluV5/1g703rJXCSHVh+YUWb9vgcDM/gqHP+m
   ZKWAeQQ5XCjyYl2tNvsvgh0joYCC25+czfOrk+P3oIZLzK9YULiah4tL3
   0FBoCJJEIrQk3nu77qLmJDWSUu+/fdQJjrP290HseD/3BYnVHvQXiaCtY
   g==;
X-CSE-ConnectionGUID: 4OW/QK4+QgKewPCNqVOM6g==
X-CSE-MsgGUID: cWzGhjBxQK6fGMpkmaQkkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12552436"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12552436"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 22:00:49 -0700
X-CSE-ConnectionGUID: NFms9jZKSwWS6yaqHCMHgA==
X-CSE-MsgGUID: 42Rx6O8kSDyTV4uWhqeIgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="32650975"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2024 22:00:48 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Hc9-0005sW-34;
	Tue, 21 May 2024 05:00:42 +0000
Date: Tue, 21 May 2024 12:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 39/44]
 drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for
 function 'gunyah_gup_reclaim_parcel'
Message-ID: <202405211238.ncxy7I4A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   833aa73663421306198d4b3ea83ef44087c9fe19
commit: 296cceed084451decfd348415b1db9c833443713 [39/44] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240521/202405211238.ncxy7I4A-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211238.ncxy7I4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211238.ncxy7I4A-lkp@intel.com/

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
