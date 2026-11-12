Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492519;
	b=BMu55uBhvYawqkTBN2rdIz0BlzVDIYfqRg4bhamMhb4x6cQv5BwBwF1pLrvS1Q54b1fZ
	 D4I4o3BooOmtR0IPe/kHOWQL42hj5djthyn4Szpvwx82FkYVyCKnV+am0AUz9iyCjtREu
	 P6K4ZAoKAgYDjpuc0q/WFLamJriY3fCJv6CaZ5BL0/nRiADRAWC36viN6UWiE4pjxiSiW
	 l7dkE9WIMPhAFwWEy/yNLZc/HQOKIQjQCnpmPRgzsXHAEIkX/JDQR3s00KpL+2dpwFjjY
	 C6YoQtJ/d7JARXXRJsc1NYL6QGtCSlMr3qPpss7NMpdSPKPAs4ZLS3J4DyiKHTp0qHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492519;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u6hrnQlUFJ0j1Kt1QzD32SpNYGONMMRqGyVefSEDKHA=;
	b=4RbH08Izen9NmM+R1+X7ubAVjlAMdtBrpWbGNMFoQAI8q2kdCG26tl7iXP0o4pSzeZ31
	 XOIBZx2Q0FYixCkKYHZKqdp1G6qJH/AE/64qIDPdSsqD0LWspmz6PICJ6laaYdpYvS70v
	 n0GB0YMk4H3/bgxSAkjC8JNNhTebJr/fr/TQli89q5ZTaR5YzgCnNUfQX9+BB/4BPSGBS
	 B3Xj/sxdO4Y50nHTBkTIxog6Lo8ouNGlQF+tr5sAp1hP21/suvLcLcf3oGXWYLNUyh0mw
	 Pw2jgZcwBMxecF+dFxGq/JlNJaKuVTtbkJjrFhZphYZaafgdg0kVWn7sBNz6Is5/Yyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j11rphcu;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC1606A321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 14:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j11rphcu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794492518; x=1826028518;
  h=date:from:to:cc:subject:message-id;
  bh=xgHsCuGElqqM/ZC6QT/E2aUp6saRBdlkGKs5Ybpzps4=;
  b=j11rphcuazhQKx3E4fCTQ7TJSrm6H9VigSluESIuh1C8umys9eUCv5YK
   bYDWvc6Dx0g/amvtK9BdxqylvwYfJOZnJWPkJAAcLl3WYpAr4fe+UQH4I
   9ueC/KC2Nf+VQRMagbQqsrTcRHQR5gky7MXSpRuF+0GrxSlPvg4PtKFn5
   txShHaKb/3aku5cUwHTTYY29dsQCmkskka/ElVFh2kU8E8Q2Z0amglM2c
   uXttT+Hfm8kPLbaxs/v7gIdKloX9DbnNNexLyuQSsXpURDiiynystVvSB
   FDxtUo5nhD4N96j5WQf3O5+ZmTwGHqTiTCZBWXx7suwVtUs0OTEQN2hvQ
   w==;
X-CSE-ConnectionGUID: lPPkFOw4S06Qa9+l6o25xw==
X-CSE-MsgGUID: TdBNuVomS5mpCDe+izHT+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3278989"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3278989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:08:38 -0800
X-CSE-ConnectionGUID: QfkQO2NTRA2y9KJveIukXQ==
X-CSE-MsgGUID: +EmG/R8ZRKCjalIN6wWnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8997901"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2026 06:08:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRVTe-000000011Rt-2Aur;
	Thu, 12 Nov 2026 14:08:34 +0000
Date: Thu, 12 Nov 2026 22:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2] mm/swap.c:488: warning:
 Function parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202611122150.N0yw9vdi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   1fff066d713e51b675a78a9d50b68af5f108220d
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [2/2] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611122150.N0yw9vdi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122150.N0yw9vdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122150.N0yw9vdi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap.c:488: warning: Function parameter or member 'vma_flags' not described in '__lru_cache_add_inactive_or_unevictable'
>> mm/swap.c:488: warning: Excess function parameter 'vma' description in '__lru_cache_add_inactive_or_unevictable'


vim +488 mm/swap.c

^1da177e4c3f415 Linus Torvalds  2005-04-16  477  
00501b531c47239 Johannes Weiner 2014-08-08  478  /**
b518154e59aab3a Joonsoo Kim     2020-08-11  479   * lru_cache_add_inactive_or_unevictable
00501b531c47239 Johannes Weiner 2014-08-08  480   * @page:  the page to be added to LRU
00501b531c47239 Johannes Weiner 2014-08-08  481   * @vma:   vma in which page is mapped for determining reclaimability
00501b531c47239 Johannes Weiner 2014-08-08  482   *
b518154e59aab3a Joonsoo Kim     2020-08-11  483   * Place @page on the inactive or unevictable LRU list, depending on its
12eab4289d3203b Miaohe Lin      2020-10-13  484   * evictability.
00501b531c47239 Johannes Weiner 2014-08-08  485   */
cbff8f39079ffd6 Laurent Dufour  2018-04-17  486  void __lru_cache_add_inactive_or_unevictable(struct page *page,
cbff8f39079ffd6 Laurent Dufour  2018-04-17  487  					 unsigned long vma_flags)
00501b531c47239 Johannes Weiner 2014-08-08 @488  {
b518154e59aab3a Joonsoo Kim     2020-08-11  489  	bool unevictable;
b518154e59aab3a Joonsoo Kim     2020-08-11  490  
00501b531c47239 Johannes Weiner 2014-08-08  491  	VM_BUG_ON_PAGE(PageLRU(page), page);
00501b531c47239 Johannes Weiner 2014-08-08  492  
cbff8f39079ffd6 Laurent Dufour  2018-04-17  493  	unevictable = (vma_flags & (VM_LOCKED | VM_SPECIAL)) == VM_LOCKED;
b518154e59aab3a Joonsoo Kim     2020-08-11  494  	if (unlikely(unevictable) && !TestSetPageMlocked(page)) {
0964730bf46b4e2 Hugh Dickins    2020-09-18  495  		int nr_pages = thp_nr_pages(page);
00501b531c47239 Johannes Weiner 2014-08-08  496  		/*
00501b531c47239 Johannes Weiner 2014-08-08  497  		 * We use the irq-unsafe __mod_zone_page_stat because this
00501b531c47239 Johannes Weiner 2014-08-08  498  		 * counter is not modified from interrupt context, and the pte
00501b531c47239 Johannes Weiner 2014-08-08  499  		 * lock is held(spinlock), which implies preemption disabled.
00501b531c47239 Johannes Weiner 2014-08-08  500  		 */
0964730bf46b4e2 Hugh Dickins    2020-09-18  501  		__mod_zone_page_state(page_zone(page), NR_MLOCK, nr_pages);
0964730bf46b4e2 Hugh Dickins    2020-09-18  502  		count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
00501b531c47239 Johannes Weiner 2014-08-08  503  	}
9c4e6b1a7027f10 Shakeel Butt    2018-02-21  504  	lru_cache_add(page);
00501b531c47239 Johannes Weiner 2014-08-08  505  }
00501b531c47239 Johannes Weiner 2014-08-08  506  

:::::: The code at line 488 was first introduced by commit
:::::: 00501b531c4723972aa11d6d4ebcf8d6552007c8 mm: memcontrol: rewrite charge API

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
