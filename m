Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2FC378D68
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 18:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363373; cv=none; b=gXZKKXNyYgfb3Csci9nyp9eK8zvxRozEk9EBMzCQPMv5sssGy1CSZjzARkaToyA4Owq4agdQ+0G6uoUwHTS4JTMZl0+2GF9BVtXtQ7d4OoI3ioESUTHjMxW9BuS03YN0gLVT8qe9TPNP2WaTuS9w/PWL8BHTvZsxDK2EG4s7XNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363373; c=relaxed/simple;
	bh=3AnG99AXLLMjWhNtOQ4S0VU5hbKeHjW3XUOMPEEizrQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tMRWBjEJLNg7N23rEZtKE7YGCifdjNJxbUJMuhiYZc9RHebt3LnVXWen5cO4aT6qX3JTUG6/bygGnUK52MpgIvZNNhM0D0Sqv/jQSPn/jUAtQWYNlhJCNeCy7nO11iB6VJqpZ2YjAovqk+ZPO2mU7l1kRJlnjZVs9v43ZXOVTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFBrQ0YM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFBrQ0YM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783363371; x=1814899371;
  h=date:from:to:cc:subject:message-id;
  bh=3AnG99AXLLMjWhNtOQ4S0VU5hbKeHjW3XUOMPEEizrQ=;
  b=VFBrQ0YM3w95M48dXs9YG0Roa0nCJLi3DY1fV0qGbDEAyOdbIbuTAfMw
   xxOZndzuBBIJ1nAMXJyEv5s+oEj02lyD2/9lXRRolpm60nrHiYVMEXUbJ
   EtnI+qgFrjMzngVBnJQfBhAE8pak37ViTgdQxS79jbOFQURBBkxrV7Xtg
   nuSydnCO75wowLSSqvJbAvNbpk+DMbPkFihEP/U9c8JCu/z2ojh5rw9C/
   roWgZaZzpdGo7JFWaeq8I6F/SHs2gtHP1ZxoGjWzQuMQGPTY39w7ObW2S
   FQKYkz0MwggwXxZwMSRphlhzocGkZXM8fB5ocmVHPeVIBRuvJ14iAN0bK
   A==;
X-CSE-ConnectionGUID: iGVSC1ReQXW1YWNuO367bA==
X-CSE-MsgGUID: ejAFcrwoQY6j9RI83zbfLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="86555265"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="86555265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 11:42:50 -0700
X-CSE-ConnectionGUID: yztMCe9sTDKHL2jQIEiz/A==
X-CSE-MsgGUID: MG+g/BtWQsWFZBLVn4fsaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="257657501"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Jul 2026 11:42:49 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgoHG-000000002Gn-1boW;
	Mon, 06 Jul 2026 18:42:46 +0000
Date: Mon, 06 Jul 2026 20:41:47 +0200
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:direct-map/v0 4/7]
 kernel/liveupdate/kexec_handover.c:1074:17: error: implicit declaration of
 function 'get_vm_area_page_order'; did you mean 'get_vm_area_caller'?
Message-ID: <202607062004.YM0OrOer-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git direct-map/v0
head:   21effbca0418e549e468c2141da5ba1ef83f06fb
commit: 5990078704982cce2dc9a952fb328771a7e7d991 [4/7] mm: split out vmalloc declarations from internal.h
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260706/202607062004.YM0OrOer-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607062004.YM0OrOer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607062004.YM0OrOer-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/liveupdate/kexec_handover.c: In function 'kho_preserve_vmalloc':
>> kernel/liveupdate/kexec_handover.c:1074:17: error: implicit declaration of function 'get_vm_area_page_order'; did you mean 'get_vm_area_caller'? [-Wimplicit-function-declaration]
    1074 |         order = get_vm_area_page_order(vm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 get_vm_area_caller
   kernel/liveupdate/kexec_handover.c: In function 'kho_restore_vmalloc':
>> kernel/liveupdate/kexec_handover.c:1220:9: error: implicit declaration of function 'clear_vm_uninitialized_flag' [-Wimplicit-function-declaration]
    1220 |         clear_vm_uninitialized_flag(area);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1074 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1043) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1044) /**
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1045)  * kho_preserve_vmalloc - preserve memory allocated with vmalloc() across kexec
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1046)  * @ptr: pointer to the area in vmalloc address space
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1047)  * @preservation: placeholder for preservation metadata
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1048)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1049)  * Instructs KHO to preserve the area in vmalloc address space at @ptr. The
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1050)  * physical pages mapped at @ptr will be preserved and on successful return
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1051)  * @preservation will hold the physical address of a structure that describes
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1052)  * the preservation.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1053)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1054)  * NOTE: The memory allocated with vmalloc_node() variants cannot be reliably
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1055)  * restored on the same node
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1056)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1057)  * Return: 0 on success, error code on failure
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1058)  */
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1059) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1060) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1061) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1062) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1063) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1064) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1065) 	int err;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1066) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1067) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1068) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1069) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1070) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1071) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1072) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1073) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21 @1074) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1075) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1076) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1077) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1078) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1079) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1080) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1081) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1082) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1083) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1084) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1085) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1086) 		if (err)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1087) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1088) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1089) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1090) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1091) 			chunk = new_vmalloc_chunk(chunk);
412a32f0e53f4a kernel/liveupdate/kexec_handover.c Andrew Morton             2026-01-21  1092  			if (!chunk) {
412a32f0e53f4a kernel/liveupdate/kexec_handover.c Andrew Morton             2026-01-21  1093  				err = -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1094) 				goto err_free;
412a32f0e53f4a kernel/liveupdate/kexec_handover.c Andrew Morton             2026-01-21  1095  			}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1096) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1097) 		}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1098) 	}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1099) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1100) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1101) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1102) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1103) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1104) 	return 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1105) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1106) err_free:
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1107  	kho_unpreserve_vmalloc(preservation);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1108) 	return err;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1109) }
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1110) EXPORT_SYMBOL_GPL(kho_preserve_vmalloc);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1111) 
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1112  /**
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1113   * kho_unpreserve_vmalloc - unpreserve memory allocated with vmalloc()
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1114   * @preservation: preservation metadata returned by kho_preserve_vmalloc()
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1115   *
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1116   * Instructs KHO to unpreserve the area in vmalloc address space that was
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1117   * previously preserved with kho_preserve_vmalloc().
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1118   */
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1119  void kho_unpreserve_vmalloc(struct kho_vmalloc *preservation)
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1120  {
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1121  	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1122  
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1123  	while (chunk) {
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1124  		struct kho_vmalloc_chunk *tmp = chunk;
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1125  
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1126  		kho_vmalloc_unpreserve_chunk(chunk, preservation->order);
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1127  
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1128  		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1129  		free_page((unsigned long)tmp);
de51999e687c70 kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1130  	}
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1131  }
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1132  EXPORT_SYMBOL_GPL(kho_unpreserve_vmalloc);
36f8f7ef7fd2f2 kernel/kexec_handover.c            Pasha Tatashin            2025-11-01  1133  
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1134) /**
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1135)  * kho_restore_vmalloc - recreates and populates an area in vmalloc address
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1136)  * space from the preserved memory.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1137)  * @preservation: preservation metadata.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1138)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1139)  * Recreates an area in vmalloc address space and populates it with memory that
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1140)  * was preserved using kho_preserve_vmalloc().
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1141)  *
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1142)  * Return: pointer to the area in the vmalloc address space, NULL on failure.
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1143)  */
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1144) void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1145) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1146) 	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1147  	kasan_vmalloc_flags_t kasan_flags = KASAN_VMALLOC_PROT_NORMAL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1148) 	unsigned int align, order, shift, vm_flags;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1149) 	unsigned long total_pages, contig_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1150) 	unsigned long addr, size;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1151) 	struct vm_struct *area;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1152) 	struct page **pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1153) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1154) 	int err;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1155) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1156) 	vm_flags = kho_flags_to_vmalloc(preservation->flags);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1157) 	if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1158) 		return NULL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1159) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1160) 	total_pages = preservation->total_pages;
bf4afc53b77aea kernel/liveupdate/kexec_handover.c Linus Torvalds            2026-02-21  1161  	pages = kvmalloc_objs(*pages, total_pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1162) 	if (!pages)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1163) 		return NULL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1164) 	order = preservation->order;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1165) 	contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1166) 	shift = PAGE_SHIFT + order;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1167) 	align = 1 << shift;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1168) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1169) 	while (chunk) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1170) 		struct page *page;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1171) 
0b07092d09e54e kernel/kexec_handover.c            Pratyush Yadav            2025-11-03  1172  		for (int i = 0; i < ARRAY_SIZE(chunk->phys) && chunk->phys[i]; i++) {
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1173) 			phys_addr_t phys = chunk->phys[i];
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1174) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1175) 			if (idx + contig_pages > total_pages)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1176) 				goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1177) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1178) 			page = kho_restore_pages(phys, contig_pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1179) 			if (!page)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1180) 				goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1181) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1182) 			for (int j = 0; j < contig_pages; j++)
4bc84cd539dff1 kernel/liveupdate/kexec_handover.c Mike Rapoport (Microsoft  2025-11-25  1183) 				pages[idx++] = page + j;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1184) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1185) 			phys += contig_pages * PAGE_SIZE;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1186) 		}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1187) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1188) 		page = kho_restore_pages(virt_to_phys(chunk), 1);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1189) 		if (!page)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1190) 			goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1191) 		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1192) 		__free_page(page);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1193) 	}
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1194) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1195) 	if (idx != total_pages)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1196) 		goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1197) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1198) 	area = __get_vm_area_node(total_pages * PAGE_SIZE, align, shift,
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1199  				  vm_flags | VM_UNINITIALIZED,
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1200  				  VMALLOC_START, VMALLOC_END,
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1201) 				  NUMA_NO_NODE, GFP_KERNEL,
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1202) 				  __builtin_return_address(0));
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1203) 	if (!area)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1204) 		goto err_free_pages_array;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1205) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1206) 	addr = (unsigned long)area->addr;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1207) 	size = get_vm_area_size(area);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1208) 	err = vmap_pages_range(addr, addr + size, PAGE_KERNEL, pages, shift);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1209) 	if (err)
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1210) 		goto err_free_vm_area;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1211) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1212) 	area->nr_pages = total_pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1213) 	area->pages = pages;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1214) 
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1215  	if (vm_flags & VM_ALLOC)
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1216  		kasan_flags |= KASAN_VMALLOC_VM_ALLOC;
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1217  
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1218  	area->addr = kasan_unpoison_vmalloc(area->addr, total_pages * PAGE_SIZE,
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1219  					    kasan_flags);
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25 @1220  	clear_vm_uninitialized_flag(area);
019fc36872374d kernel/liveupdate/kexec_handover.c Pasha Tatashin            2026-02-25  1221  
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1222) 	return area->addr;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1223) 
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1224) err_free_vm_area:
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1225) 	free_vm_area(area);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1226) err_free_pages_array:
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1227) 	kvfree(pages);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1228) 	return NULL;
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1229) }
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1230) EXPORT_SYMBOL_GPL(kho_restore_vmalloc);
a667300bd53f27 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-09-21  1231) 

:::::: The code at line 1074 was first introduced by commit
:::::: a667300bd53f272a3055238bcefe108f88836270 kho: add support for preserving vmalloc allocations

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
