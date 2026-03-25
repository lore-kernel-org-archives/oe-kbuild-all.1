Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E6394464
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426412; cv=none; b=Rosau9yFWVrT99jU9NTun9slXn1oi03demSEbHi+hNDK0/tPf1WMWhXpVmwlOu0J3lPU9+lTaOmrzgsa2ONFxFCZwEqOtlDk2112pncgCxI/iuTYmU7BD3cUYWEiKPnS2HS5nSfM0lFRQG8YpjTwNFgKCHu/+LujMYhGRiKNnOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426412; c=relaxed/simple;
	bh=Ec8nF9HFlePCLiOWz0x3BZrdBXI6kX4GYe8dqtQm9wQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RrAmyx9UFIpTdaqJQExQSuXEcQHgrmmEwSizXorX8rX375kBV9742+/LOR4yKa8blxbh6df+mrlO0JQ0QRXiMv8lecqr1DDGNies+mL29BoYzWuZigYqmRdXkJk1bGnCVk8jt3fDECQsYPN79nhak4iqtl8NvBXhb5Dy0JKtUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLPeoRde; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLPeoRde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774426410; x=1805962410;
  h=date:from:to:cc:subject:message-id;
  bh=Ec8nF9HFlePCLiOWz0x3BZrdBXI6kX4GYe8dqtQm9wQ=;
  b=fLPeoRdeobrqqpwLLwHgNqeMuBCXf6DUXw7BPBGINfYQC050Pgpa9ROn
   MsNJ8/NceMrW0euhEYBRzjofOuEOo6+gqMqgbXRV8T7nGiyC9th4NEN7O
   +4y8BqgQwqcBpDXDqcwfJOGIvbi0sdRrJ4uwUhBnpkAdtjNuiWWVy3ejI
   MM/G+AMFaCUp2xsoI4Iei1YilMG2D43E5S1G9o19g+pX1bQ+TN/3VWbvJ
   5WunFJAAGXLhQDuMWd/TwNjRVudlzyrsZsRBGwVMrX7bMu/rxCRke/uVs
   SaazVZFW2xtBK+TXbPZnzmPh9zijvWf6ZrJiaovdfNfZfrOo4Alz0rM7j
   g==;
X-CSE-ConnectionGUID: WhozwfZSSaeoATScpFzJjg==
X-CSE-MsgGUID: AWBYsTsIRhKLI6E4VwKxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86152198"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86152198"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:13:29 -0700
X-CSE-ConnectionGUID: 9QNNqc9jRg+assYOvWhulw==
X-CSE-MsgGUID: UIA0VlBLTs2lixJZAdl8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="220195768"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Mar 2026 01:13:28 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5JMj-000000006TN-1xPm;
	Wed, 25 Mar 2026 08:13:25 +0000
Date: Wed, 25 Mar 2026 16:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for
 function 'gunyah_gup_reclaim_parcel'
Message-ID: <202603251635.nmE3jxBx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 296cceed084451decfd348415b1db9c833443713 [1/1] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-randconfig-r054-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251635.nmE3jxBx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251635.nmE3jxBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251635.nmE3jxBx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
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
   drivers/virt/gunyah/vm_mgr.c:183:21: error: call to undeclared function 'module_refcount'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^
>> drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for function 'gunyah_gup_reclaim_parcel' [-Wmissing-prototypes]
     887 | int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
         |     ^
   drivers/virt/gunyah/vm_mgr.c:887:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     887 | int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
         | ^
         | static 
   7 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


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
