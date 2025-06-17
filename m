Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F861F5847
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202253; cv=none; b=kmRusDRHn1BvUJGNjDJa7UoV4S7RIbuZw72KK8BxLzRtfBD9a14YQvGNo1PCxrI8PUZfgPgOvBE1L5LeDJbsnhAJHRAv+zuNDsgubQWiDZPvfhZKA/Y41g4aatWNostndm9GSIeUbTJgNlaOoKd06mQhpoSWsN9RjG9vhUrWEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202253; c=relaxed/simple;
	bh=eqy5vkNuKiMT0FjGDb+C48tVO2f7Wf3ehk9j/21WLvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6FAEHuVO9zxCENuFrxVNF54UqUUbWqDIjFrWGcv4nQxhwe9WUPW8sm1RlTpwsSsTFSwqVBzQqGwTkIWslGNLu3sQQ625kGcGilPWVVpF0yKHXVykbSwpL+SVot+ymwN+C46xXUi3jiqzk61gEXurRiItClH34f3cYstmXKfUUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ4fz2qE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ4fz2qE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750202251; x=1781738251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eqy5vkNuKiMT0FjGDb+C48tVO2f7Wf3ehk9j/21WLvA=;
  b=jZ4fz2qEYIS1xLBS+PV01zETD6OVRMp8p1IaXY/iQF0q8rz1VR1cWIwG
   XtwZkGSr8PIQscf4w1+yXhsX2gCSvz5OODChv7GmzR5pd96cuG2wYR2Gj
   /BFGWoAXh+Fs8I0EgXA72QcnoPE9OQyjHEUqhWmj/80u/+1a+lIsynNHB
   IIkz8myupa3TAODiCTBjjR6KUtSPd9YnvvY9BgADb94EhUK6IoA9AK8pJ
   qmx3IxHilc4hz1YLu2EnWknTD2NL5zYr2UkPLUWgho6kcNiYJyIIe1yS0
   8mlJ8bz12pTvW/yro17tgVuPfIp1U7XvZvQ8YLG8/mLOTtOUFp3XI3fpK
   w==;
X-CSE-ConnectionGUID: woQNlaLATJKckvrsT4j3Nw==
X-CSE-MsgGUID: MzrLyzc8RFm96MtdYqdO4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51630903"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="51630903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 16:17:30 -0700
X-CSE-ConnectionGUID: Ub24vw79RmyORL1KfCCLng==
X-CSE-MsgGUID: dN8G0wSeTt66USDbHx4LhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="149529632"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2025 16:17:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRfYU-000JD4-2Z;
	Tue, 17 Jun 2025 23:17:26 +0000
Date: Wed, 18 Jun 2025 07:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 102/102] mm/sparse-vmemmap.c:310:8:
 warning: variable 'entry' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202506180705.wzn96ice-lkp@intel.com>
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
head:   182e47fd81e1f2341328ae1ae465ff25a83ca7a4
commit: 39dbfa37de5e4321e403a48914319dc98efa260b [102/102] anolis: virtio-mem: make memmap on movable memory can be offlined
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250618/202506180705.wzn96ice-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180705.wzn96ice-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180705.wzn96ice-lkp@intel.com/

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
