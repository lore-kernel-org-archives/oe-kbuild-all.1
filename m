Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624F43D4E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511540; cv=none; b=OBoTe5EfZB8/68r/+bQx1GRPFaI1Zn+3EJ+32sSysUFkzPB4Q2PEbbIgxX+n57wVYMAFfxQ3haFwJI11AQBj8C7WsTC64tyPDx4eBDv8SAu+7oKLSIHf4OKjgBSkWqdNS46JeEjak//kz64gRLaLe2XvlDs3nLOpirwcvNTxQao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511540; c=relaxed/simple;
	bh=tBIoEqDaw+yQdBVa1ypePFuVNwtDK1wweHuDsf9qBCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWj7xQs0vIJilnX7l41IbwnaNqW9DHrmuzg8IuSv9FWcKVFDmKWoOjZp+EVpmzb5Mfw+MOag43p3wplD1d6Z1wJkfG3qeN4COiYzfVvk1zpf3pd/nBvKZUnQDexW8+QbKtMYnmaF/8riblLG6FTKVoFZCnaengEzsj2Ml53OTkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlBs+/+z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlBs+/+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785511538; x=1817047538;
  h=date:from:to:cc:subject:message-id;
  bh=tBIoEqDaw+yQdBVa1ypePFuVNwtDK1wweHuDsf9qBCU=;
  b=XlBs+/+znQx6MGCxTBi8TEfthlrf0+kH9NpsYuPjDyZCvCuPVR5YMDqu
   wGST8AsBNpNtlhyBAXx1VB0HKGW4tlunN46jO/D9B06/n1oI1Ku/EvmDC
   AOzzQIAb2ZYvb+XJvs7MeEgZ2zJIh9g8RpVbUPAs6aJuK8Py6ygs/ToUQ
   rIZxo6BHa+8gEYgBDbwNBDTTbo8uQrMtAXzmwK/sf3Y2NlmL+dZLNkcKs
   i+WYioprkChM5WUBs31YzLFhiXuvbOv9A7gTylBsH6/uPCnHSddpG3dNC
   DgNLzPTdEr7L8hc0GnoK3t4hbWHY0zAYgUM+uTVd/1modUtHkKGPXQ8qY
   g==;
X-CSE-ConnectionGUID: CkWN9Mm9TKyn2B/YHxkjzw==
X-CSE-MsgGUID: qHJWDO8qT4KEGImR4+/Z4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96725693"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96725693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 08:25:36 -0700
X-CSE-ConnectionGUID: fvuRZJw8SGub/QJ07bmAbw==
X-CSE-MsgGUID: YrZxYD0vTDO4xXl02W8IQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298825372"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2026 08:25:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpp76-000000001O1-2Sf4;
	Fri, 31 Jul 2026 15:25:32 +0000
Date: Fri, 31 Jul 2026 23:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2] mm/swap.c:778: warning:
 Function parameter or member 'tail' not described in
 'mark_page_lazyfree_movetail'
Message-ID: <202607312302.NvrNuo1y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1290154c48656bd1012a837076a0fbe379330eb3
commit: 8011eb22150e5bb6eb1834ce9913f36081d48ab5 [2/2] ANDROID: mm: provision to add shmem pages to inactive file lru head
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607312302.NvrNuo1y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312302.NvrNuo1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312302.NvrNuo1y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/swap.c:502: warning: Function parameter or member 'vma_flags' not described in '__lru_cache_add_inactive_or_unevictable'
   mm/swap.c:502: warning: Excess function parameter 'vma' description in '__lru_cache_add_inactive_or_unevictable'
>> mm/swap.c:778: warning: Function parameter or member 'tail' not described in 'mark_page_lazyfree_movetail'


vim +778 mm/swap.c

10853a039208c4a Minchan Kim       2016-01-15  769  
9975da5f43bb72a Vinayak Menon     2021-03-18  770  /**
9975da5f43bb72a Vinayak Menon     2021-03-18  771   * mark_page_lazyfree_movetail - make a swapbacked page lazyfree
9975da5f43bb72a Vinayak Menon     2021-03-18  772   * @page: page to deactivate
9975da5f43bb72a Vinayak Menon     2021-03-18  773   *
9975da5f43bb72a Vinayak Menon     2021-03-18  774   * mark_page_lazyfree_movetail() moves @page to the tail of inactive file list.
9975da5f43bb72a Vinayak Menon     2021-03-18  775   * This is done to accelerate the reclaim of @page.
9975da5f43bb72a Vinayak Menon     2021-03-18  776   */
8011eb22150e5bb Charan Teja Reddy 2021-06-25  777  void mark_page_lazyfree_movetail(struct page *page, bool tail)
9975da5f43bb72a Vinayak Menon     2021-03-18 @778  {
9975da5f43bb72a Vinayak Menon     2021-03-18  779  	if (PageLRU(page) && !PageUnevictable(page) && PageSwapBacked(page) &&
9975da5f43bb72a Vinayak Menon     2021-03-18  780  		!PageSwapCache(page)) {
9975da5f43bb72a Vinayak Menon     2021-03-18  781  		struct pagevec *pvec;
9975da5f43bb72a Vinayak Menon     2021-03-18  782  
9975da5f43bb72a Vinayak Menon     2021-03-18  783  		local_lock(&lru_pvecs.lock);
9975da5f43bb72a Vinayak Menon     2021-03-18  784  		pvec = this_cpu_ptr(&lru_pvecs.lru_lazyfree_movetail);
9975da5f43bb72a Vinayak Menon     2021-03-18  785  		get_page(page);
9975da5f43bb72a Vinayak Menon     2021-03-18  786  		if (pagevec_add_and_need_flush(pvec, page))
9975da5f43bb72a Vinayak Menon     2021-03-18  787  			pagevec_lru_move_fn(pvec,
8011eb22150e5bb Charan Teja Reddy 2021-06-25  788  					lru_lazyfree_movetail_fn, &tail);
9975da5f43bb72a Vinayak Menon     2021-03-18  789  		local_unlock(&lru_pvecs.lock);
9975da5f43bb72a Vinayak Menon     2021-03-18  790  	}
9975da5f43bb72a Vinayak Menon     2021-03-18  791  }
9975da5f43bb72a Vinayak Menon     2021-03-18  792  

:::::: The code at line 778 was first introduced by commit
:::::: 9975da5f43bb72a37faf3981709fff766ab4ca15 ANDROID: mm: allow fast reclaim of shmem pages

:::::: TO: Vinayak Menon <vinmenon@codeaurora.org>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
