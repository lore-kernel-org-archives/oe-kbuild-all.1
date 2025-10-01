Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB92257452
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759342715; cv=none; b=tlFo7ZHzmXc3S8VtVvDLU4JWEBZts8qm//bkflnSbp7MnDvkaCLyuO/7IO4j16ryVUtN4sowKvrs3H5vC4gEDlr9wAhxYVFBtwWv5Tl12N4AhmA/cj1P9OC5c+BHi2ArPgbaY7rkaZXAGzqM5i7j4ZgS9VgrGeirFVywc77tOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759342715; c=relaxed/simple;
	bh=zn+jPmjdci8CnEarqH6oG0iPrzln19BhynIXWtwFID0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z50fTMD/qpnl/OWXW3E9DugRaV7d8oyy35K+ekfvTOhdAdHBwpq3dXxIdsXYsFfsR0YuQsD7tcQlbjVyD++180o3+7TJp1Aqiwu+22aO5ib/Y+TiVENbs92tlBrHLPdpcacokuQv1h/Dr9i2tR3ITPqYThwFXCo3FiIrrUMIaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrBbJqN+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrBbJqN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759342713; x=1790878713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zn+jPmjdci8CnEarqH6oG0iPrzln19BhynIXWtwFID0=;
  b=DrBbJqN+NWBtZyNF8U4QCtEJqBuFtzyCSfWSO4zXp/+g53r2sqWIwvUZ
   EHJpUQ1r5JVvVqG/q5Sq5GoOm7DcMdiJ9Xlmz75OqG3xHUK2M5Rz06zc/
   g4f4yVVuEnPooCNlBkmF5W95sl/uMAFQ812rsZVHOHJkvzeesI4948y0m
   7F1pacScunuR9NSoeCs/+ithvQXobuhbq+z34IxhA/ZQCcD+tGTWf+Oky
   YUpkKNrUh9knNQN6b2vmLU4ajFqigkZ4jGs7cgfWy2RixVZEtztyq41r9
   uD6a9k7NGJtBbjMLI+M3ARsDqH4VMpOEerTThT2e9TZ0piD6DlS1z9Lm4
   Q==;
X-CSE-ConnectionGUID: YEfTQfPqT6+fH0ak0lAVYA==
X-CSE-MsgGUID: e1q95iq5TsuWY/OvM+76tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72296495"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="72296495"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 11:18:32 -0700
X-CSE-ConnectionGUID: BtUJt19qQbGlE+jWSN11Lw==
X-CSE-MsgGUID: VtTADIYOSoGj5ZfLxi1j1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; 
   d="scan'208";a="179619321"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2025 11:18:31 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v41PJ-0003G3-0Q;
	Wed, 01 Oct 2025 18:18:29 +0000
Date: Thu, 2 Oct 2025 02:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/sparse-vmemmap.c:310:8:
 warning: variable 'entry' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202510020250.oJgk2669-lkp@intel.com>
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
head:   6e46858a22077fce652e4757d5624bf5816c6639
commit: 39dbfa37de5e4321e403a48914319dc98efa260b [2/2] anolis: virtio-mem: make memmap on movable memory can be offlined
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251002/202510020250.oJgk2669-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510020250.oJgk2669-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510020250.oJgk2669-lkp@intel.com/

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
