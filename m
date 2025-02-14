Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC25266F19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547818; cv=none; b=azgE5KCUh07KKpwq2h5vyEjN9aEA3s2hh+1TkIfH405hn7M5l3tAIrK6X5v31GRgIucfM5JvW6UN4XAjTJqyXLIlOYpwllu1hwbV5DCJaJRlX1WSm4rEdnvSi5cDLAGZdZhfprHjKyOhaVkUn43Mb6JWoo+7ty2xJVo+Iq26pfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547818; c=relaxed/simple;
	bh=KltGkB9TtXKE2r+Bq9fxzoh/zTYv2xuo++SpBz3qOXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSnQgBnZUS4AJYCVLsUoljEbq7V2sIO/7WtM4pA/9hBwRz8Nm4QSG9gSFWiaCDoCnmtlkVnTkhkabHr9fMViF6EnZXTejSRkFZkE3vRjUoRqf6l2JNM5nYYXDgM5O0cl5hKtIHcf+7JV1OGVcnUaoPgePMwQAL6U+lD5spoLEiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jx8Avfrq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx8Avfrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739547817; x=1771083817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KltGkB9TtXKE2r+Bq9fxzoh/zTYv2xuo++SpBz3qOXA=;
  b=jx8AvfrqCDuPR9YbGqKHgjW7NSNo9SZJ6MqbIVRe2Gdbe8DTJNbG5cGr
   CiwVDOnVMw43X278OVLXs2+JrWsiFCadRHI3decII3C0164lR9CmpDXjO
   KQydEhbHRc4fqVyblsy/XeBWPlpAsXs8bkbeSvKU1oslRFEBiECpnW8sR
   ftBgZtgCa6iHtiPSIKHLj7MWFhnzF28uPmWs6T2KP5+iObhTvPlro+XKr
   +9U2QFX90Ne7klsRkARonLZ88jBNwqlPjANSRs8SrX+2tq4cA88Eo/fYN
   0jwia45OKPP6YXg41aVISJjJfMyn1PSYf4AqVLXRTNobY88iGQshBH9hK
   Q==;
X-CSE-ConnectionGUID: Yod12WDFTH+Ly9A97HIgnQ==
X-CSE-MsgGUID: aEM9zcylSyWbG3bk5sg+GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40225766"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40225766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 07:43:36 -0800
X-CSE-ConnectionGUID: nnttX+/bT6aC46YeHmVboA==
X-CSE-MsgGUID: 4ndhhaFiQN+KYDGkzAXXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113685186"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 07:43:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tixqn-0019nc-02;
	Fri, 14 Feb 2025 15:43:33 +0000
Date: Fri, 14 Feb 2025 23:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/swap.c:488: warning: Function
 parameter or member 'vma_flags' not described in
 '__lru_cache_add_inactive_or_unevictable'
Message-ID: <202502142334.yjABZDws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   6b7c856caf89f4b82af7af2bb7d09b8c1112730b
commit: cbff8f39079ffd607e894aede8590d69cb6ba803 [1/1] FROMLIST: mm: introduce __lru_cache_add_active_or_unevictable
config: arm-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142334.yjABZDws-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142334.yjABZDws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142334.yjABZDws-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap.c:488: warning: Function parameter or member 'vma_flags' not described in '__lru_cache_add_inactive_or_unevictable'
>> mm/swap.c:488: warning: Excess function parameter 'vma' description in '__lru_cache_add_inactive_or_unevictable'


vim +488 mm/swap.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  477  
00501b531c4723 Johannes Weiner 2014-08-08  478  /**
b518154e59aab3 Joonsoo Kim     2020-08-11  479   * lru_cache_add_inactive_or_unevictable
00501b531c4723 Johannes Weiner 2014-08-08  480   * @page:  the page to be added to LRU
00501b531c4723 Johannes Weiner 2014-08-08  481   * @vma:   vma in which page is mapped for determining reclaimability
00501b531c4723 Johannes Weiner 2014-08-08  482   *
b518154e59aab3 Joonsoo Kim     2020-08-11  483   * Place @page on the inactive or unevictable LRU list, depending on its
12eab4289d3203 Miaohe Lin      2020-10-13  484   * evictability.
00501b531c4723 Johannes Weiner 2014-08-08  485   */
cbff8f39079ffd Laurent Dufour  2018-04-17  486  void __lru_cache_add_inactive_or_unevictable(struct page *page,
cbff8f39079ffd Laurent Dufour  2018-04-17  487  					 unsigned long vma_flags)
00501b531c4723 Johannes Weiner 2014-08-08 @488  {
b518154e59aab3 Joonsoo Kim     2020-08-11  489  	bool unevictable;
b518154e59aab3 Joonsoo Kim     2020-08-11  490  
00501b531c4723 Johannes Weiner 2014-08-08  491  	VM_BUG_ON_PAGE(PageLRU(page), page);
00501b531c4723 Johannes Weiner 2014-08-08  492  
cbff8f39079ffd Laurent Dufour  2018-04-17  493  	unevictable = (vma_flags & (VM_LOCKED | VM_SPECIAL)) == VM_LOCKED;
b518154e59aab3 Joonsoo Kim     2020-08-11  494  	if (unlikely(unevictable) && !TestSetPageMlocked(page)) {
0964730bf46b4e Hugh Dickins    2020-09-18  495  		int nr_pages = thp_nr_pages(page);
00501b531c4723 Johannes Weiner 2014-08-08  496  		/*
00501b531c4723 Johannes Weiner 2014-08-08  497  		 * We use the irq-unsafe __mod_zone_page_stat because this
00501b531c4723 Johannes Weiner 2014-08-08  498  		 * counter is not modified from interrupt context, and the pte
00501b531c4723 Johannes Weiner 2014-08-08  499  		 * lock is held(spinlock), which implies preemption disabled.
00501b531c4723 Johannes Weiner 2014-08-08  500  		 */
0964730bf46b4e Hugh Dickins    2020-09-18  501  		__mod_zone_page_state(page_zone(page), NR_MLOCK, nr_pages);
0964730bf46b4e Hugh Dickins    2020-09-18  502  		count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
00501b531c4723 Johannes Weiner 2014-08-08  503  	}
9c4e6b1a7027f1 Shakeel Butt    2018-02-21  504  	lru_cache_add(page);
00501b531c4723 Johannes Weiner 2014-08-08  505  }
00501b531c4723 Johannes Weiner 2014-08-08  506  

:::::: The code at line 488 was first introduced by commit
:::::: 00501b531c4723972aa11d6d4ebcf8d6552007c8 mm: memcontrol: rewrite charge API

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
