Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9B11946DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 20:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739564110; cv=none; b=N7RtM3qQP+1fU/7sGstEpVTzeAH6oCifdBcHlcdk4KEdpJ8fPrEtUPkEZJO0zzizrormM9hK/Y0xquYB3jUeuYR5uoO23eD/sZmbJhq8IUHqGIF3oPyT3BXC5j2Y38XhDDgT0ABnkbGGdRmq5v6iCXWR4oBF2fMedWR+qMIprEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739564110; c=relaxed/simple;
	bh=WsOktwPwKA4MEFWqRYk7toqHsh4lvhFiocGv2fbEeUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X61iuRIuwuIjwnxSZAM8fuX9GJpAoA/kiqcb4/SWEmP/cgfNvp9DLCfNF7XP2gjLAeo+j95LqiIBghHZjXQ+8y730FYbJNafn4Bj3U0FAig9oWqRwHuxmJqNawmy4zzVZHLkpyfURa9FizHQfJfmOTMWMP8je1+kICtVCGZl5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Br5b2Tio; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Br5b2Tio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739564109; x=1771100109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WsOktwPwKA4MEFWqRYk7toqHsh4lvhFiocGv2fbEeUw=;
  b=Br5b2Tio1itHGwBw0ETkseuj5x2UL3uF+umkaSJZpm8O0+kaFVYngLm6
   zy8Mqsn3mp4+TIij0ryL3sfJOzj58D2T26rFSar1LLKOd+ZiS45xcydQl
   XtJPXJoaAoQ68w/Z1Mod0KYJnMkJ85NotdhLOJ60sGVfz+uRqVdhjbKzG
   PSNGAZeywJC6Xg7DpvcVOeSld3sLVgpgdFgyheAbLecqAgvWwDDMyOsWs
   nJqBbqvO068j4ZcQRbYcl6gJRoliXy9Ss660J1q8zMqfxmbFV8dFLXa30
   MeaCzTzEoYWGHKMe+viGG/WgY7UezEVoT30D5cdFW/Z7meeETbCdqkxv0
   g==;
X-CSE-ConnectionGUID: 7BZSd3aJRfKdNoA79G6/mA==
X-CSE-MsgGUID: dgc+5q+cTaq2oNJoRFG82w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40443032"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40443032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 12:15:09 -0800
X-CSE-ConnectionGUID: X1dq1rtRS3C0edEb2iZFfg==
X-CSE-MsgGUID: 0bNtfyprTAyNYBT2kn1vow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114037706"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Feb 2025 12:15:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj25Z-001A71-09;
	Fri, 14 Feb 2025 20:15:05 +0000
Date: Sat, 15 Feb 2025 04:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/swap.c:778: warning: Function
 parameter or member 'tail' not described in 'mark_page_lazyfree_movetail'
Message-ID: <202502150431.p6pIpGvt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   6b7c856caf89f4b82af7af2bb7d09b8c1112730b
commit: 8011eb22150e5bb6eb1834ce9913f36081d48ab5 [1/1] ANDROID: mm: provision to add shmem pages to inactive file lru head
config: arm-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150431.p6pIpGvt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150431.p6pIpGvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150431.p6pIpGvt-lkp@intel.com/

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
