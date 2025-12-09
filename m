Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47841212D7C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765251371; cv=none; b=g9hzFmOpN1WND5UsaLQmp+zCjY3dDW054JcGRdhQ6TxJrnOQRAkIM7PF4KMW38ClLiYU1xqg5p5OI57MfOvEl9NSLMvhsZrNXnowtj6qIy4Gonf6D7UCe9gbezDowjrsklmrrd8RLuqh2zdE4y9AQx3MLshKv8YueyJhsQ6qvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765251371; c=relaxed/simple;
	bh=W9ma+J4yOR69WaIiBNBnj/F6Bdd+V4wTxw1nFp+FcwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUeWmq8EDSwVlDzAA3S7JOuageGVNVkG4IkXpzacxWokvlyfrHgxhuycUXxiG/cqn8zTxkDfjoFlTpnN9ZzkdSsbQshsBiE3QTpefK+dYcXdGix8kkSnh5Fkg8TjdyiLFMUsv5bToG6T6z1hfjzEMM73RaE+cJqSmTaXs+JETf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTilXL7g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTilXL7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765251369; x=1796787369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9ma+J4yOR69WaIiBNBnj/F6Bdd+V4wTxw1nFp+FcwM=;
  b=LTilXL7gclsplNsQtJRkrkRULs3CEwpysIFySXnZugZTD40JCE8Lcr4X
   Rr8LiqFicsP7+EnOlah7lhEGL4KZwK1QA2F97J8Iev1ZJzfFUEaDHy0RN
   6QudyojsRc8gxiv7Zw50DID7BLmp92xllO70lhab8wdbFxfwQmc9k9mFW
   c8hLGWVYE2AU/RYsch86ZjFlj28V7dLSlApOFwWilGImMPUtG0JvVGE5q
   b2gwwuGbwYaFIt69dJo3WoboHW1e7AInPIXkRmyQz6ZNF3s+Cc7P9DPd7
   N7XYkpuHcN2bVL1tiBiFJQacW9z8askRp98F3n/BTrPcJRG0JFrPhwKW7
   g==;
X-CSE-ConnectionGUID: mNj/N7xQRoi+RV8WyET/zw==
X-CSE-MsgGUID: EVteLoVuSpm3YFDYdgw0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="69794278"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="69794278"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 19:36:08 -0800
X-CSE-ConnectionGUID: tVVLdRqaRTCVimrk3Vo90w==
X-CSE-MsgGUID: sJ5G5nkUQkCVZpQRvtFfOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195722354"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2025 19:36:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSoWD-000000001Gr-10VE;
	Tue, 09 Dec 2025 03:36:05 +0000
Date: Tue, 9 Dec 2025 11:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/mempolicy.c:1115:25: warning:
 variable 'vma' set but not used
Message-ID: <202512091141.r06Y9a5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d86ef4e1e96aa04c46e92dca30f98d069c1ad15a
commit: dba69db9a5fc7c2c9c0cda0f32bb3b5f3d73ef93 [3493/3493] mm/damon/vaddr: Add demotion interface for migrating cold pages to target nodemask
config: loongarch-randconfig-r111-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091141.r06Y9a5w-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091141.r06Y9a5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091141.r06Y9a5w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from mm/mempolicy.c:108:
   In file included from arch/loongarch/include/asm/tlb.h:140:
   include/asm-generic/tlb.h:632:10: warning: parameter 'ptep' set but not used [-Wunused-but-set-parameter]
     632 |                 pte_t *ptep, unsigned int nr, unsigned long address)
         |                        ^
   In file included from mm/mempolicy.c:108:
   arch/loongarch/include/asm/tlb.h:144:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
     144 |         struct vm_area_struct vma;
         |                               ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
>> mm/mempolicy.c:1115:25: warning: variable 'vma' set but not used [-Wunused-but-set-variable]
    1115 |         struct vm_area_struct *vma;
         |                                ^
   mm/mempolicy.c:2951:25: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    2951 |                 struct vm_area_struct pvma;
         |                                       ^
   include/linux/mm_types.h:659:20: note: member 'vm_flags' declared 'const' here
     659 |                 const vm_flags_t vm_flags;
         |                                  ^
   5 warnings generated.


vim +/vma +1115 mm/mempolicy.c

  1106	
  1107	/*
  1108	 * Migrate area pages from one node to a target node.
  1109	 * Returns error or the number of pages not migrated.
  1110	 */
  1111	static int migrate_area_to_node(struct mm_struct *mm, int source, int dest,
  1112				   unsigned long start, unsigned long end, int flags)
  1113	{
  1114		nodemask_t nmask;
> 1115		struct vm_area_struct *vma;
  1116		LIST_HEAD(pagelist);
  1117		int err = 0;
  1118		struct migration_target_control mtc = {
  1119			.nid = dest,
  1120			.gfp_mask = GFP_HIGHUSER_MOVABLE | __GFP_THISNODE,
  1121		};
  1122	
  1123		nodes_clear(nmask);
  1124		node_set(source, nmask);
  1125	
  1126		/*
  1127		 * This does not "check" the range but isolates all pages that
  1128		 * need migration.  Between passing in the full user address
  1129		 * space range and MPOL_MF_DISCONTIG_OK, this call can not fail.
  1130		 */
  1131		vma = find_vma(mm, 0);
  1132		VM_BUG_ON(!(flags & (MPOL_MF_MOVE | MPOL_MF_MOVE_ALL)));
  1133		queue_pages_range(mm, start, end, &nmask,
  1134				flags | MPOL_MF_DISCONTIG_OK, &pagelist, false);
  1135	
  1136		if (!list_empty(&pagelist)) {
  1137			err = migrate_pages(&pagelist, alloc_migration_target, NULL,
  1138					(unsigned long)&mtc, MIGRATE_SYNC, MR_DAMON_DEMOTION, NULL);
  1139			if (err)
  1140				putback_movable_pages(&pagelist);
  1141		}
  1142	
  1143		return err;
  1144	}
  1145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
