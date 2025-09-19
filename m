Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741DC34BA33
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758249459; cv=none; b=tcOJ5Jzanwcr7lJMBPA3IQBx2i5Ko63/6Mc0+8oNzXoKWsV4l9ZnFwysDeAczzN/8W1oLV2XpY5KSXi3yQ5tDpFmT9ZxEEvhdBTyXjJsxbd2sB0DMQk8JSDBvdPYegTW+BONhwnFqvSVclLyX9Y94TYd6nXGmLKjyQRUEhVDzgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758249459; c=relaxed/simple;
	bh=h5TvndhgvzWQ0fKI5pe8nKg8uL509Wn5hzYwPG8DYIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZTBTNM/eDQxD8Qe/P5Sa2JNCVrpUvIvMacyiZGhMRiicfkuv4CIYvT7qnH3GKCVdc3D4YRTnPjQoba4t+vbW7ewer5GXJZ1qwfQheIpSC4aqdiUrhNKo4qcJ4Tp4xrCqHIymfT7A/Mifz2Otx3QiGCrOIFfYQxBwPCkCiNxgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc16PK7N; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc16PK7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758249457; x=1789785457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5TvndhgvzWQ0fKI5pe8nKg8uL509Wn5hzYwPG8DYIQ=;
  b=Pc16PK7NiVlYnR2owpTo8yUbWmBRYcfFY6e4o2dJguyAx2z16imyPNDZ
   4x+2r/zwbvLtESzvJLC/M8MsKW7pk/GT5LuTMRmWj/aHQWbchURzdQo6y
   FXlfMygygoOuWloO9J7xAKZVjO7V68BK0HRYl8fsVfAg9xQg4PiKUQyyC
   6yBOcH1AXMFethgCUXaIElcxMuVTUBA7qGR0ctuGG7sQjGCPcnZWQA+ix
   3ApS+/EaFpfTgGEE7kcttinXFGUMvEwNWM7Bq7sV6+HetCdyvQYCTGh7d
   9rlMts1YDKcFyMAEqyWz5aKcJKo0ONLSEB0FokXdbxHjytflFCPKCtGnv
   Q==;
X-CSE-ConnectionGUID: rUAb8q78QQO4U+Zc9lI8wQ==
X-CSE-MsgGUID: W5NEaPojSZKvtNh3n5c5Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78197325"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="78197325"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 19:37:36 -0700
X-CSE-ConnectionGUID: IZLqUNwjR7it8w3kD8lxdg==
X-CSE-MsgGUID: JF9OfBR1RL6vnkxS2ZwomQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="176522880"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2025 19:37:34 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzR07-0003vP-2G;
	Fri, 19 Sep 2025 02:37:31 +0000
Date: Fri, 19 Sep 2025 10:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-everything 254/254] kernel/kexec_handover.c:970:50:
 error: passing argument 1 of 'kho_restore_page' makes integer from pointer
 without a cast
Message-ID: <202509191034.SM82Oaij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
head:   46735c0743fed990d0ed8722a131ef54006c45a3
commit: 5369505b204b3fc65f839f7558640b6ecd675461 [254/254] foo
config: x86_64-randconfig-071-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191034.SM82Oaij-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191034.SM82Oaij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191034.SM82Oaij-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/kexec_handover.c: In function 'kho_restore_vmalloc':
>> kernel/kexec_handover.c:970:50: error: passing argument 1 of 'kho_restore_page' makes integer from pointer without a cast [-Wint-conversion]
     970 |                                 kho_restore_page(page, 0);
         |                                                  ^~~~
         |                                                  |
         |                                                  struct page *
   kernel/kexec_handover.c:229:50: note: expected 'phys_addr_t' {aka 'long long unsigned int'} but argument is of type 'struct page *'
     229 | static struct page *kho_restore_page(phys_addr_t phys)
         |                                      ~~~~~~~~~~~~^~~~
>> kernel/kexec_handover.c:970:33: error: too many arguments to function 'kho_restore_page'
     970 |                                 kho_restore_page(page, 0);
         |                                 ^~~~~~~~~~~~~~~~
   kernel/kexec_handover.c:229:21: note: declared here
     229 | static struct page *kho_restore_page(phys_addr_t phys)
         |                     ^~~~~~~~~~~~~~~~
   kernel/kexec_handover.c:978:34: error: passing argument 1 of 'kho_restore_page' makes integer from pointer without a cast [-Wint-conversion]
     978 |                 kho_restore_page(page, 0);
         |                                  ^~~~
         |                                  |
         |                                  struct page *
   kernel/kexec_handover.c:229:50: note: expected 'phys_addr_t' {aka 'long long unsigned int'} but argument is of type 'struct page *'
     229 | static struct page *kho_restore_page(phys_addr_t phys)
         |                                      ~~~~~~~~~~~~^~~~
   kernel/kexec_handover.c:978:17: error: too many arguments to function 'kho_restore_page'
     978 |                 kho_restore_page(page, 0);
         |                 ^~~~~~~~~~~~~~~~
   kernel/kexec_handover.c:229:21: note: declared here
     229 | static struct page *kho_restore_page(phys_addr_t phys)
         |                     ^~~~~~~~~~~~~~~~


vim +/kho_restore_page +970 kernel/kexec_handover.c

1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   926) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   927) /**
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   928)  * kho_restore_vmalloc - recreates and populates an area in vmalloc address
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   929)  * space from the preserved memory.
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   930)  * @preservation: preservation metadata.
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   931)  *
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   932)  * Recreates an area in vmalloc address space and populates it with memory that
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   933)  * was preserved using kho_preserve_vmalloc().
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   934)  *
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   935)  * Return: pointer to the area in the vmalloc address space, NULL on failure.
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   936)  */
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   937) void *kho_restore_vmalloc(const struct kho_vmalloc *preservation)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   938) {
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   939) 	struct kho_vmalloc_chunk *chunk = KHOSER_LOAD_PTR(preservation->first);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   940) 	unsigned int align, order, shift, vm_flags;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   941) 	unsigned int idx = 0, nr;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   942) 	unsigned long addr, size;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   943) 	struct vm_struct *area;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   944) 	struct page **pages;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   945) 	int err;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   946) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   947) 	vm_flags = kho_flags_to_vmalloc(preservation->flags);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   948) 	if (vm_flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   949) 		return NULL;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   950) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   951) 	nr = preservation->total_pages;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   952) 	pages = kvmalloc_array(nr, sizeof(*pages), GFP_KERNEL);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   953) 	if (!pages)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   954) 		return NULL;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   955) 	order = preservation->order;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   956) 	shift = PAGE_SHIFT + order;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   957) 	align = 1 << shift;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   958) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   959) 	while (chunk) {
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   960) 		struct page *page;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   961) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   962) 		for (int i = 0; chunk->phys[i]; i++) {
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   963) 			phys_addr_t phys = chunk->phys[i];
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   964) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   965) 			if (idx + (1 << order) > nr)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   966) 				goto err_free_pages_array;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   967) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   968) 			for (int j = 0; j < (1 << order); j++) {
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   969) 				page = phys_to_page(phys);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  @970) 				kho_restore_page(page, 0);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   971) 				pages[idx++] = page;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   972) 				phys += PAGE_SIZE;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   973) 			}
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   974) 		}
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   975) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   976) 		page = virt_to_page(chunk);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   977) 		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   978) 		kho_restore_page(page, 0);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   979) 		__free_page(page);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   980) 	}
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   981) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   982) 	if (idx != nr)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   983) 		goto err_free_pages_array;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   984) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   985) 	area = __get_vm_area_node(nr * PAGE_SIZE, align, shift, vm_flags,
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   986) 				  VMALLOC_START, VMALLOC_END, NUMA_NO_NODE,
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   987) 				  GFP_KERNEL, __builtin_return_address(0));
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   988) 	if (!area)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   989) 		goto err_free_pages_array;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   990) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   991) 	addr = (unsigned long)area->addr;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   992) 	size = get_vm_area_size(area);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   993) 	err = vmap_pages_range(addr, addr + size, PAGE_KERNEL, pages, shift);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   994) 	if (err)
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   995) 		goto err_free_vm_area;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   996) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   997) 	area->pages = pages;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   998) 	area->nr_pages = nr;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17   999) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1000) 	return area->addr;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1001) 
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1002) err_free_vm_area:
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1003) 	free_vm_area(area);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1004) err_free_pages_array:
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1005) 	kvfree(pages);
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1006) 	return NULL;
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1007) }
1e0bdd5d414970 Mike Rapoport (Microsoft  2025-09-17  1008) EXPORT_SYMBOL_GPL(kho_restore_vmalloc);
fc33e4b44b2717 Mike Rapoport (Microsoft  2025-05-09  1009) 

:::::: The code at line 970 was first introduced by commit
:::::: 1e0bdd5d4149706f75f7f3bcc952bc963f352e2b kho: add support for preserving vmalloc allocations

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
