Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8A33BBD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776319473; cv=none; b=pSLCsAoHV5vUKGqNzUsBvkn1f2/cGaeEBpy4buG3TZgMCZGKPZlhsQeFsNQZPxk/WmzrQXNngVozsF5dCl9HMdpBJjumGKVpxmg1FCXM3AWHluYT1x3aCVqEBxudSFNM9F378y5YTinmaRnyZOYWryUj/wtrexKk1MVKwNkfmxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776319473; c=relaxed/simple;
	bh=HMYDdWbuhaHyR559JfJ+7ch7Ofv9LFK5dRRmS5vX2cs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SOdS11s1gFc/iBWgNYFYvoRyhx4X2gcWFtQXwtP98KTlEBdmOZwRhSCMAyvM6GOyUmRXhyIRD0x41WEqIPp2kmwdn6qVIsRBz+x9Gu7e22HqNTklH1lP9DzmIJu0JYmX5dZ22+drJBHDmf38mMqaQJ7BNp8uFMu0DMX3l0NtuS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM7jK4uh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM7jK4uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776319471; x=1807855471;
  h=date:from:to:cc:subject:message-id;
  bh=HMYDdWbuhaHyR559JfJ+7ch7Ofv9LFK5dRRmS5vX2cs=;
  b=BM7jK4uh7c/fLTSqiw8ryn7yq93/wfSfWylF4Kw9VZW0nT9XU99uLNqS
   zYVeRTH6THdLdKmcv3Z5RBcuu/kV1fxIQawjqW/77sV3Gj7NOQFB3tWSz
   dk+8j6cVqEyp/SE0vA8GxmylHMV9hzRIycBsqkFFaRqEqA1g55T4PLe1K
   /akhcMfCzpaL6YRjgqP1enF429SEdGmdEyFdRGB2txlGE/TBWzE/DycAF
   K90iaJzB+e/nEqSA4QfVxjGPzom5/ThQyfIJvbbWReRAGbhzdSamhaMqM
   E9UmD6TEkea6T2o8NWtuQcQodopo3AN2rgwlo7AO/nIKCLde6asnDlA4S
   g==;
X-CSE-ConnectionGUID: 6MR9XKlSSy+rXlRB0NZeEA==
X-CSE-MsgGUID: pRBijz9fTua0lki8Jfk+Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77382177"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77382177"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 23:04:30 -0700
X-CSE-ConnectionGUID: Wp5giA7GQ5G0ucQDvkHmtA==
X-CSE-MsgGUID: bGyL8uykQW+01TNKQlZ9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="226309449"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2026 23:04:28 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDFpy-000000001L4-3074;
	Thu, 16 Apr 2026 06:04:26 +0000
Date: Thu, 16 Apr 2026 14:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-04 1/1] mm/swap.c:778:
 warning: Function parameter or member 'tail' not described in
 'mark_page_lazyfree_movetail'
Message-ID: <202604161418.0yJ7wCET-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-04
head:   f782563dd4b9e9f005d55d232946ffaa340a1f61
commit: 8011eb22150e5bb6eb1834ce9913f36081d48ab5 [1/1] ANDROID: mm: provision to add shmem pages to inactive file lru head
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260416/202604161418.0yJ7wCET-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161418.0yJ7wCET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161418.0yJ7wCET-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swap.c:502: warning: Function parameter or member 'vma_flags' not described in '__lru_cache_add_inactive_or_unevictable'
   mm/swap.c:502: warning: Excess function parameter 'vma' description in '__lru_cache_add_inactive_or_unevictable'
>> mm/swap.c:778: warning: Function parameter or member 'tail' not described in 'mark_page_lazyfree_movetail'


vim +778 mm/swap.c

10853a039208c4 Minchan Kim       2016-01-15  769  
9975da5f43bb72 Vinayak Menon     2021-03-18  770  /**
9975da5f43bb72 Vinayak Menon     2021-03-18  771   * mark_page_lazyfree_movetail - make a swapbacked page lazyfree
9975da5f43bb72 Vinayak Menon     2021-03-18  772   * @page: page to deactivate
9975da5f43bb72 Vinayak Menon     2021-03-18  773   *
9975da5f43bb72 Vinayak Menon     2021-03-18  774   * mark_page_lazyfree_movetail() moves @page to the tail of inactive file list.
9975da5f43bb72 Vinayak Menon     2021-03-18  775   * This is done to accelerate the reclaim of @page.
9975da5f43bb72 Vinayak Menon     2021-03-18  776   */
8011eb22150e5b Charan Teja Reddy 2021-06-25  777  void mark_page_lazyfree_movetail(struct page *page, bool tail)
9975da5f43bb72 Vinayak Menon     2021-03-18 @778  {
9975da5f43bb72 Vinayak Menon     2021-03-18  779  	if (PageLRU(page) && !PageUnevictable(page) && PageSwapBacked(page) &&
9975da5f43bb72 Vinayak Menon     2021-03-18  780  		!PageSwapCache(page)) {
9975da5f43bb72 Vinayak Menon     2021-03-18  781  		struct pagevec *pvec;
9975da5f43bb72 Vinayak Menon     2021-03-18  782  
9975da5f43bb72 Vinayak Menon     2021-03-18  783  		local_lock(&lru_pvecs.lock);
9975da5f43bb72 Vinayak Menon     2021-03-18  784  		pvec = this_cpu_ptr(&lru_pvecs.lru_lazyfree_movetail);
9975da5f43bb72 Vinayak Menon     2021-03-18  785  		get_page(page);
9975da5f43bb72 Vinayak Menon     2021-03-18  786  		if (pagevec_add_and_need_flush(pvec, page))
9975da5f43bb72 Vinayak Menon     2021-03-18  787  			pagevec_lru_move_fn(pvec,
8011eb22150e5b Charan Teja Reddy 2021-06-25  788  					lru_lazyfree_movetail_fn, &tail);
9975da5f43bb72 Vinayak Menon     2021-03-18  789  		local_unlock(&lru_pvecs.lock);
9975da5f43bb72 Vinayak Menon     2021-03-18  790  	}
9975da5f43bb72 Vinayak Menon     2021-03-18  791  }
9975da5f43bb72 Vinayak Menon     2021-03-18  792  

:::::: The code at line 778 was first introduced by commit
:::::: 9975da5f43bb72a37faf3981709fff766ab4ca15 ANDROID: mm: allow fast reclaim of shmem pages

:::::: TO: Vinayak Menon <vinmenon@codeaurora.org>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
