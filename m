Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FFF2DF128
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727806; cv=none; b=sPNvOsliKsszV/5vaJKRNsjKIismWuMo+YikILsztk1YNp4ZLmeq9ANoYamT9ewf7oX2X1fbxEEQgqrcvbzbcwnl4CNLcLNF87Jjs9ZU075aetkiY/qWWpoIXKhe/XnWQ3WzQ7dqdyGIfYp7THA3q0DWIwuFm6SykPjBFX0bftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727806; c=relaxed/simple;
	bh=vfECC3Kf44hZIYLLeeQBKllX1cirUdrk9BUvUEfSvww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GegqZiByoo8AKbAj4SosIoEBaOLNUpBent0IgJUSrGhe9xw0QzkRD8xYElK5FESfUJ7p/KQPssVO5tYehTOmhMKURCCI70wMESdem7sQ3ozAb0flg/tm2Rg8xR66G0b/DM2bWkOMmY70Vag5zp+o9IdeEiPMnNy6Xmj1XOxBE5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWnqLSw3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWnqLSw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791727804; x=1823263804;
  h=date:from:to:cc:subject:message-id;
  bh=vfECC3Kf44hZIYLLeeQBKllX1cirUdrk9BUvUEfSvww=;
  b=OWnqLSw3gPD0Jits/6r2wzk//eaCgAG7pyDpextZrTMxrqIstXwUbhpd
   FkWpJZy2cttve0ifWUzX99bJLD7IIGhtFAy5dU8ZqM4Eoo20vg4iir4ci
   er5/3hcTBetYeW5MWjM4epUuBJFdw70sSJ50noZJvGpiY0nz83ChvzNF+
   /VFTJ57KY7tR1v3/NnyKgW6u4ezp5BBFG1bNAKE7R0MS+C0aif2y7A/UC
   v7bw2sZggx0DsygkX2zd8R33Om3cehu/tnKwdVpYGDhHdhf4dSd2vaqZ2
   h2db+5FYiyMEzPiZRBVmhE8W3rr8HjJWe/HqrdHCibc6HilcvmlMxkLwd
   g==;
X-CSE-ConnectionGUID: slK1mu+dSh2Tb/KP3eLtcw==
X-CSE-MsgGUID: qevXVumZTjOuMjN8Cf8j7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="336378"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="336378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 07:10:03 -0700
X-CSE-ConnectionGUID: mznZTAgCTlaQFJmgcAsjIA==
X-CSE-MsgGUID: /IYrtJtfReuPiSqdJMfesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="668961"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2026 07:10:02 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFuFT-000000009Zb-3Fwc;
	Sun, 11 Oct 2026 14:09:59 +0000
Date: Sun, 11 Oct 2026 16:09:27 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cpp-bpf 37/37] kernel/bpf/arena.c:1064:24:
 warning: variable 'pgoff' set but not used
Message-ID: <202610111635.lZFy4pw1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux cpp-bpf
head:   1c2c0dfe725b2315df201222f7232424c22c7c73
commit: bc72af644d86015b24dfb1fc3bb66b80131414b8 [37/37] bpf: Hand a freed arena range back only after its TLB flush
config: sparc64-randconfig-r2302-20261011 (https://download.01.org/0day-ci/archive/20261011/202610111635.lZFy4pw1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 762316e293d1db4f495bdbb545c31d588a1a2d62)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610111635.lZFy4pw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610111635.lZFy4pw1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/arena.c:1064:24: warning: variable 'pgoff' set but not used [-Wunused-but-set-variable]
    1064 |         long kaddr, page_cnt, pgoff;
         |                               ^
   1 warning generated.


vim +/pgoff +1064 kernel/bpf/arena.c

b8467290edab4ba Puranjay Mohan          2025-12-22  1052  
b8467290edab4ba Puranjay Mohan          2025-12-22  1053  static void arena_free_worker(struct work_struct *work)
b8467290edab4ba Puranjay Mohan          2025-12-22  1054  {
b8467290edab4ba Puranjay Mohan          2025-12-22  1055  	struct bpf_arena *arena = container_of(work, struct bpf_arena, free_work);
e66fe1bc6d25d6f Puranjay Mohan          2026-01-02  1056  	struct mem_cgroup *new_memcg, *old_memcg;
b8467290edab4ba Puranjay Mohan          2025-12-22  1057  	struct llist_node *list, *pos, *t;
b8467290edab4ba Puranjay Mohan          2025-12-22  1058  	struct arena_free_span *s;
b8467290edab4ba Puranjay Mohan          2025-12-22  1059  	u64 arena_vm_start, user_vm_start;
b8467290edab4ba Puranjay Mohan          2025-12-22  1060  	struct llist_head free_pages;
dc11a4dba2464e5 Kumar Kartikeya Dwivedi 2026-05-22  1061  	struct clear_range_data cdata;
b8467290edab4ba Puranjay Mohan          2025-12-22  1062  	struct page *page;
b8467290edab4ba Puranjay Mohan          2025-12-22  1063  	unsigned long full_uaddr;
b8467290edab4ba Puranjay Mohan          2025-12-22 @1064  	long kaddr, page_cnt, pgoff;
b8467290edab4ba Puranjay Mohan          2025-12-22  1065  	unsigned long flags;
b8467290edab4ba Puranjay Mohan          2025-12-22  1066  
b8467290edab4ba Puranjay Mohan          2025-12-22  1067  	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags)) {
b8467290edab4ba Puranjay Mohan          2025-12-22  1068  		schedule_work(work);
b8467290edab4ba Puranjay Mohan          2025-12-22  1069  		return;
b8467290edab4ba Puranjay Mohan          2025-12-22  1070  	}
b8467290edab4ba Puranjay Mohan          2025-12-22  1071  
e66fe1bc6d25d6f Puranjay Mohan          2026-01-02  1072  	bpf_map_memcg_enter(&arena->map, &old_memcg, &new_memcg);
e66fe1bc6d25d6f Puranjay Mohan          2026-01-02  1073  
b8467290edab4ba Puranjay Mohan          2025-12-22  1074  	init_llist_head(&free_pages);
f8248ac8f044ad3 Jiayuan Chen            2026-07-17  1075  	cdata.arena = arena;
dc11a4dba2464e5 Kumar Kartikeya Dwivedi 2026-05-22  1076  	cdata.free_pages = &free_pages;
b8467290edab4ba Puranjay Mohan          2025-12-22  1077  	arena_vm_start = bpf_arena_get_kern_vm_start(arena);
b8467290edab4ba Puranjay Mohan          2025-12-22  1078  	user_vm_start = bpf_arena_get_user_vm_start(arena);
b8467290edab4ba Puranjay Mohan          2025-12-22  1079  
b8467290edab4ba Puranjay Mohan          2025-12-22  1080  	list = llist_del_all(&arena->free_spans);
b8467290edab4ba Puranjay Mohan          2025-12-22  1081  	llist_for_each(pos, list) {
b8467290edab4ba Puranjay Mohan          2025-12-22  1082  		s = llist_entry(pos, struct arena_free_span, node);
b8467290edab4ba Puranjay Mohan          2025-12-22  1083  		page_cnt = s->page_cnt;
b8467290edab4ba Puranjay Mohan          2025-12-22  1084  		kaddr = arena_vm_start + s->uaddr;
b8467290edab4ba Puranjay Mohan          2025-12-22  1085  		pgoff = compute_pgoff(arena, s->uaddr);
b8467290edab4ba Puranjay Mohan          2025-12-22  1086  
b8467290edab4ba Puranjay Mohan          2025-12-22  1087  		/* clear ptes and collect pages in free_pages llist */
b8467290edab4ba Puranjay Mohan          2025-12-22  1088  		apply_to_existing_page_range(&init_mm, kaddr, page_cnt << PAGE_SHIFT,
dc11a4dba2464e5 Kumar Kartikeya Dwivedi 2026-05-22  1089  					     apply_range_clear_cb, &cdata);
b8467290edab4ba Puranjay Mohan          2025-12-22  1090  	}
b8467290edab4ba Puranjay Mohan          2025-12-22  1091  	raw_res_spin_unlock_irqrestore(&arena->spinlock, flags);
b8467290edab4ba Puranjay Mohan          2025-12-22  1092  
b8467290edab4ba Puranjay Mohan          2025-12-22  1093  	/* Iterate the list again without holding spinlock to do the tlb flush and zap_pages */
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1094  	llist_for_each(pos, list) {
b8467290edab4ba Puranjay Mohan          2025-12-22  1095  		s = llist_entry(pos, struct arena_free_span, node);
b8467290edab4ba Puranjay Mohan          2025-12-22  1096  		page_cnt = s->page_cnt;
b8467290edab4ba Puranjay Mohan          2025-12-22  1097  		full_uaddr = clear_lo32(user_vm_start) + s->uaddr;
b8467290edab4ba Puranjay Mohan          2025-12-22  1098  		kaddr = arena_vm_start + s->uaddr;
b8467290edab4ba Puranjay Mohan          2025-12-22  1099  
b8467290edab4ba Puranjay Mohan          2025-12-22  1100  		/* ensure no stale TLB entries */
b8467290edab4ba Puranjay Mohan          2025-12-22  1101  		flush_tlb_kernel_range(kaddr, kaddr + (page_cnt * PAGE_SIZE));
b8467290edab4ba Puranjay Mohan          2025-12-22  1102  
b8467290edab4ba Puranjay Mohan          2025-12-22  1103  		/* remove pages from user vmas */
b8467290edab4ba Puranjay Mohan          2025-12-22  1104  		zap_pages(arena, full_uaddr, page_cnt);
b8467290edab4ba Puranjay Mohan          2025-12-22  1105  	}
b8467290edab4ba Puranjay Mohan          2025-12-22  1106  
b8467290edab4ba Puranjay Mohan          2025-12-22  1107  	/* free all pages collected by apply_to_existing_page_range() in the first loop */
b8467290edab4ba Puranjay Mohan          2025-12-22  1108  	llist_for_each_safe(pos, t, __llist_del_all(&free_pages)) {
b8467290edab4ba Puranjay Mohan          2025-12-22  1109  		page = llist_entry(pos, struct page, pcp_llist);
b8467290edab4ba Puranjay Mohan          2025-12-22  1110  		__free_page(page);
b8467290edab4ba Puranjay Mohan          2025-12-22  1111  	}
e66fe1bc6d25d6f Puranjay Mohan          2026-01-02  1112  
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1113  	/*
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1114  	 * The ranges may be handed out again only now that no CPU holds a
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1115  	 * translation of the old pages: a range set free before the flush was
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1116  	 * reallocated and written through a stale translation. If the lock
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1117  	 * cannot be taken, put the spans back and try again later; clearing
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1118  	 * the already cleared ptes and flushing again is harmless.
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1119  	 */
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1120  	if (raw_res_spin_lock_irqsave(&arena->spinlock, flags)) {
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1121  		llist_for_each_safe(pos, t, list) {
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1122  			s = llist_entry(pos, struct arena_free_span, node);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1123  			llist_add(&s->node, &arena->free_spans);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1124  		}
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1125  		schedule_work(work);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1126  		bpf_map_memcg_exit(old_memcg, new_memcg);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1127  		return;
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1128  	}
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1129  	llist_for_each_safe(pos, t, list) {
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1130  		s = llist_entry(pos, struct arena_free_span, node);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1131  		range_tree_set(&arena->rt, compute_pgoff(arena, s->uaddr), s->page_cnt);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1132  		kfree_nolock(s);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1133  	}
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1134  	raw_res_spin_unlock_irqrestore(&arena->spinlock, flags);
bc72af644d86015 Kumar Kartikeya Dwivedi 2026-10-11  1135  
e66fe1bc6d25d6f Puranjay Mohan          2026-01-02  1136  	bpf_map_memcg_exit(old_memcg, new_memcg);
b8467290edab4ba Puranjay Mohan          2025-12-22  1137  }
b8467290edab4ba Puranjay Mohan          2025-12-22  1138  

:::::: The code at line 1064 was first introduced by commit
:::::: b8467290edab4bafae352bf3f317055669a1a458 bpf: arena: make arena kfuncs any context safe

:::::: TO: Puranjay Mohan <puranjay@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
