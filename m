Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DA21C163
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767548786; cv=none; b=seAN2wf4DEiuLYx93YliwxfNNlF9WthrNrDSDQc56S6QukMWaiGWyOs5pyNpNB0BKKhkbxCrpxOFHRD3nQuP/KWryArH1EqWcwLoUIISI0AuxB22nHUckl30WcoUrXNp/xRSw21QCwt0thWEQ4ltE8V+jtenqbFWoIGIBvTShJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767548786; c=relaxed/simple;
	bh=axv1eLEkbhQPG//krLW21BldoJIrL2BpD7st439SWRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l942GXIJqBaj4ToZlMi08OPrdnPHiIBg2k8LIygILZyceWujoi1ltM5BeofJWMt15MwoVylDRuLZkEQJkWK+1q9QdO+NrOKtlA9GWj/ifOYwlsY09uhhmVKakNYRt0yagGp8UGrA8X9BOAwyZ+pPMTUPM5wGgIHcjimwgGD5QIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0h40DIv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0h40DIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767548785; x=1799084785;
  h=date:from:to:cc:subject:message-id;
  bh=axv1eLEkbhQPG//krLW21BldoJIrL2BpD7st439SWRQ=;
  b=f0h40DIvGuI7o8XZ/E+2K498n0kzJaRrMztfG5SRb7Vk7tLT/q5RaPwS
   VRcECQoh2gp/TO3pNuGbma4ZD6S8ABzUfeFwhzgdYJ/ru3HTFDGNK7Ey/
   M0ZnBPDB5JJRNpNH4v4YfdTSKmFRZkrtDGPuq3TiKV9savTE0xcwVF2P6
   BLfWO4YRRGuN95DhiDhd2maS/tpbWh+9Kg04xY2CQ5SnNrNDxBD/nG47q
   5zyTGkKpA560Vv2obGxfG9YYXtYdxJ0+4a3J/YdixcJu4CSijz32T4Rj1
   4FSN1SpdAv+G5lecfOynKW0d1wlU/34r8nmFLWyA/4yGh7gVC1oqADyNI
   g==;
X-CSE-ConnectionGUID: St7T6nvZTTScYpoMD+/xmA==
X-CSE-MsgGUID: S5Drg0ahTYKrRe3Ct/gjtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68841048"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="68841048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 09:46:22 -0800
X-CSE-ConnectionGUID: L6Wd+QsWRP2DAxhHw1lOSQ==
X-CSE-MsgGUID: JQtRODj0RLaaEvFq4QV+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="201852666"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jan 2026 09:46:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcSBF-000000000hp-3wwD;
	Sun, 04 Jan 2026 17:46:17 +0000
Date: Mon, 05 Jan 2026 01:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 190/190] mm/swap.c:778:
 warning: Function parameter or member 'tail' not described in
 'mark_page_lazyfree_movetail'
Message-ID: <202601050139.WedoG8PV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   c9b5876b7945ef9caec188f04f7125b1c01d5a1d
commit: 8011eb22150e5bb6eb1834ce9913f36081d48ab5 [190/190] ANDROID: mm: provision to add shmem pages to inactive file lru head
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260105/202601050139.WedoG8PV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050139.WedoG8PV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050139.WedoG8PV-lkp@intel.com/

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
