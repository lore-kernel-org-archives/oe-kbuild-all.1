Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF33C870C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830427; cv=none; b=UK4aTCjwC4ZCYbFxmz912Fe5ur3dxtSGC3ofWygMCPDKwnAzS3GCQfvQubldXhk2t9Ha3C/kf/vTWq6WYTVLJYHUEHWFShVHgaZv9PqqRY1UC+KWciIgBNLdBcSIkVpw9qyICpdyQRhQJeRcGWDaPu4+XKbgoMaPF8GHPHVetN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830427; c=relaxed/simple;
	bh=XpG8KemYNEHXLgE7YuV8yLiahIb0/P20nNBk/Eyn6ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f8V5qwJJc0jFUtiriaEDSyOCJNyW4GroZoJD6DMUC/1hBrrwBshwvmVg9sTIr27zcQlqkE+ohlStgXsV9jZpw8QJcq4Jl9kQe1lIBn14d3Bd+EZAe+i7AoYS8JBMgnE7P3rcvQPPXvlYpdlt0r9ttYSTfx4RE91BXK7OjUGNECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itQrZJ6C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itQrZJ6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775830425; x=1807366425;
  h=date:from:to:cc:subject:message-id;
  bh=XpG8KemYNEHXLgE7YuV8yLiahIb0/P20nNBk/Eyn6ko=;
  b=itQrZJ6CjwoUcvYq2c8YZlBHcNTsQ8rla+KAIfBSyngdXIxeAbTlKB/U
   XfnKhddOyr38yWA7kPLTvNWp6Z8/Lr+Uk6+hxQChpJDyEZ8qy4PGweOIr
   zmEeYVebn0bpEdDg+U5vezLVR+gTUbHkHd3PaFhQN4cNz+ZX3iOY4vUGC
   pFA9R4Jno62QX4Y5J+XZgB/6CpybzD5MlvRxlKLGH84QfILNe0Az1V5Ib
   IraK2XATpQLUeSY8sE9MASIH/Eq9pmEt6AnNcdNy8JxXI12gze4sg7MVg
   ixokGT8J19TkBwzY3mdZyKSqEcB76FTLfgBNM1bWPfWP+ll6F4a/bP9Zk
   A==;
X-CSE-ConnectionGUID: dGTekHvNT7u2uM5VBrZQvA==
X-CSE-MsgGUID: ckyGJc3sQTuK6oiQlqdSoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88233643"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="88233643"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:13:45 -0700
X-CSE-ConnectionGUID: qHXmkcxoSB+VcEMw5O8GiA==
X-CSE-MsgGUID: MVHwb6/9QN6dMPfqokNQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228981123"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Apr 2026 07:13:44 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBCc8-000000003o1-3L59;
	Fri, 10 Apr 2026 14:13:40 +0000
Date: Fri, 10 Apr 2026 22:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for
 'gunyah_gup_reclaim_parcel'
Message-ID: <202604102238.jxXTvKSh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   0792a77e96ce87272523eb10c99ab57df6631293
commit: 296cceed084451decfd348415b1db9c833443713 [1/1] ANDROID: virt: gunyah: Add gup based demand paging support
config: arm64-randconfig-r064-20260410 (https://download.01.org/0day-ci/archive/20260410/202604102238.jxXTvKSh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102238.jxXTvKSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102238.jxXTvKSh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:23,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from drivers/virt/gunyah/vm_mgr.c:9:
   drivers/virt/gunyah/vm_mgr.c: In function 'gunyah_vm_function_unregister':
   drivers/virt/gunyah/vm_mgr.c:183:28: error: implicit declaration of function 'module_refcount' [-Werror=implicit-function-declaration]
     183 |         WARN_ON(fn->mod && module_refcount(fn->mod));
         |                            ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/virt/gunyah/vm_mgr.c: At top level:
>> drivers/virt/gunyah/vm_mgr.c:887:5: warning: no previous prototype for 'gunyah_gup_reclaim_parcel' [-Wmissing-prototypes]
     887 | int gunyah_gup_reclaim_parcel(struct gunyah_vm *ghvm,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


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
