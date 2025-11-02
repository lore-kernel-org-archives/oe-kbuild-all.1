Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE481E521E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762122332; cv=none; b=B/o5ipAJWh+bG71Qs6XZ/uapoKn3EKk+ISXfI4MoJ3VKqQ0GyampzOIdd6mu1hCg00Ae4FD0ovAwfmxqT8NUvMaLafExiAElxEpXucGm65TJ14DIX0G+y8VsfQPr8/rA0ML07s31SsoI3fNdH3kHA4leGeG7BYRUi7retQ934VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762122332; c=relaxed/simple;
	bh=MetGgYgNO0jqdYLqX+Y8H1E6tW5XqTaHGPkIQ5WnU+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H34S+gaA9FTfmnwReqnXrW5+v2TGZbl+90Ku1Cw6fcC2iTNc6PW4w8xXIciQTXG4KlqnUxC6n00mL6/iWDCAXiAd5ieiayH2QH9W2sEw+wVrO4MYACXyrSVrO+LeyumCn3C3voBivhmIlfWLKiWQOMtAJRaRsc4a9dZQUQQMrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5SYD9uJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5SYD9uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762122331; x=1793658331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MetGgYgNO0jqdYLqX+Y8H1E6tW5XqTaHGPkIQ5WnU+c=;
  b=j5SYD9uJd1hJZTfvKrOpwbdSQxImSOjqdsmnbz4pFLJ+Y/hggwspXSO5
   RAl53Yqs0/fokMT12/YT2xrZFYt580yLG+ULJekZJYlP/12gmKaXU/4h7
   yF7Oa5pQe/BVlMAHXDrwVCF8ma0EpQ3b54GUL9xnUPPk8tUyoJB7YjV9l
   dCXkU3LaFWPO+UaWHW1cUbuvx8XCShy4PAyOaOSRTNqp54t+rJfCtIEbg
   pcvUzJ0Dg4fidABi71PF1P03L87Al2cYrRJRET7+6nqdn6LHqS82GL6fr
   +qyYWdPBZPwKuWK0zjm5cEDPzOFU7Oz8MDeA16piL9qSsobqvAwBwNHZW
   w==;
X-CSE-ConnectionGUID: E/Zu7oURTBO9QsogLnB9zA==
X-CSE-MsgGUID: NPb9VaUMSBC/PT/vob/stA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="51771572"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="51771572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 14:25:30 -0800
X-CSE-ConnectionGUID: xE/nNwuBQd2CXMF8fV4NZA==
X-CSE-MsgGUID: wldMIri9SG61x685nbCQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="186392503"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2025 14:25:29 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFgVq-000PcF-1t;
	Sun, 02 Nov 2025 22:25:26 +0000
Date: Mon, 3 Nov 2025 06:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 16/16] mm/sparse-vmemmap.c:310:8:
 warning: variable 'entry' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202511030653.hwNBcVYQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhongjiang-ali,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7103f9d5c75b142fc88eb149bc55d2e8c8ed76f3
commit: 39dbfa37de5e4321e403a48914319dc98efa260b [16/16] anolis: virtio-mem: make memmap on movable memory can be offlined
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251103/202511030653.hwNBcVYQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030653.hwNBcVYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030653.hwNBcVYQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/sparse-vmemmap.c:310:8: warning: variable 'entry' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     310 |                         if (virtio_memmap_copy(walk->reuse_addr)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:328:34: note: uninitialized use occurs here
     328 |         set_pte_at(&init_mm, addr, pte, entry);
         |                                         ^~~~~
   mm/sparse-vmemmap.c:310:4: note: remove the 'if' if its condition is always true
     310 |                         if (virtio_memmap_copy(walk->reuse_addr)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:293:2: note: variable 'entry' is declared here
     293 |         pte_t entry;
         |         ^
   1 warning generated.


vim +310 mm/sparse-vmemmap.c

   285	
   286	static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
   287					struct vmemmap_remap_walk *walk)
   288	{
   289		pgprot_t pgprot = PAGE_KERNEL;
   290		struct page *page;
   291		void *to, *src;
   292		unsigned long pfn;
   293		pte_t entry;
   294	
   295		if (!virtio_is_use_memmap(walk->reuse_addr))
   296			BUG_ON(pte_page(*pte) != walk->reuse_page);
   297	
   298		page = list_first_entry(walk->vmemmap_pages, struct page, lru);
   299		list_del(&page->lru);
   300		to = page_to_virt(page);
   301		if (!virtio_is_use_memmap(walk->reuse_addr)) {
   302			copy_page(to, (void *)walk->reuse_addr);
   303			reset_struct_pages(to);
   304			entry = mk_pte(page, pgprot);
   305		} else {
   306			if (virtio_memmap_restore(walk->reuse_addr)) {
   307				pfn = __pa(to) >> PAGE_SHIFT;
   308				entry = pfn_pte(pfn, pgprot);
   309			} else {
 > 310				if (virtio_memmap_copy(walk->reuse_addr)) {
   311					pfn = pte_pfn(*pte);
   312					src = __va(__pfn_to_phys(pfn));
   313	
   314					copy_page(to, src);
   315					list_add_tail(&page->lru, walk->vmemmap_pages);
   316					return;
   317				}
   318				/* trigger an warnning when walk in here now */
   319				WARN_ON(1);
   320			}
   321		}
   322	
   323		/*
   324		 * Makes sure that preceding stores to the page contents become visible
   325		 * before the set_pte_at() write.
   326		 */
   327		smp_wmb();
   328		set_pte_at(&init_mm, addr, pte, entry);
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
