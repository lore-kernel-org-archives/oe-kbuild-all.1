Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52343101B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758612610; cv=none; b=f1Cz23IJ6zagRM6Uwu0IbuSPYmzFRzlexUWtX8LX7/FdVpuyqlT9jgeEJ1OnZ/uT6Z+zSN3krjLvESWULeljr6twtAuSq/9UfM5f9EP6qXwnTKFpRtjEx+if7pN4uOLkj6w3vNlaaNbHTw2cHsC2ET0n7ifmC4adWKl1DfdT+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758612610; c=relaxed/simple;
	bh=ZGTRiuXTNanko1zvYG1vhKCm28IHONDygyVeKmZkRrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGHLvUcRiS+Ib2l7r7NMOXBnAaraROJcj5wK4N8sVaJDHg4jo9eAkzGe1MVl8lnoPBXx6OkbAqLjO3gnJFHC+a576iXS0oRUMW/DpvHPaWrSctOk+aF4vtG4cppseE6QEu965FqsGY53mDS3CjuNwqSeC+7slav3VnpCsaiE7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqrHAN39; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqrHAN39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758612609; x=1790148609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZGTRiuXTNanko1zvYG1vhKCm28IHONDygyVeKmZkRrY=;
  b=BqrHAN39XR1Vn4iyLEQGSAbTWuGngr5rs2SdLjK/g/4jT0UYNG0cCMZN
   uPpkOAm0DD4C3Zw5S9KwSl4wvEkEaxZ1VV7UJHq/66hk9LLa1LPp6X+cy
   7hJZxFK31uKn+VS04Jn+Zzx/30GSfSLSaRM0hkBnjWfmAr9p6mNx8P+C0
   xdtttdtgsgCr+AVsIjC36S3dsZUSMJR1vPA7TbX+DyV4GaWfAyG8GeP4m
   sujzoUeKJOQrCh//p3XwHxuWpE9nbAnIsG/+vVe2a0SUJL3EatzMiyq8R
   bshm6wWnD0pmD3ai89s7CN3Gk0f/zgVnlI266Ash/7d6ZO7dXQD1if1UC
   w==;
X-CSE-ConnectionGUID: z/8n+8NIS5aKRXWHqfBFPw==
X-CSE-MsgGUID: PJQHGwivS5OQ41dYsWy3vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72311389"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="72311389"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 00:30:08 -0700
X-CSE-ConnectionGUID: VRlfDS35TSanyNGf5hBPVg==
X-CSE-MsgGUID: KP3FAcpmT/y5F23KA/5uDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181081228"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2025 00:30:07 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0xTR-0002rb-0F;
	Tue, 23 Sep 2025 07:30:05 +0000
Date: Tue, 23 Sep 2025 15:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] mm/swap.c:778: warning: Function
 parameter or member 'tail' not described in 'mark_page_lazyfree_movetail'
Message-ID: <202509231528.QSrOWsra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   bd0e4cef233d7f95e320d36ced31a23b952ab0cd
commit: 8011eb22150e5bb6eb1834ce9913f36081d48ab5 [1/1] ANDROID: mm: provision to add shmem pages to inactive file lru head
config: i386-buildonly-randconfig-001-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231528.QSrOWsra-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231528.QSrOWsra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231528.QSrOWsra-lkp@intel.com/

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
