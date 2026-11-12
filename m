Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499584;
	b=mLMwxdSYm6SqVfbaLb5ea3LobOE2+A119nlV20EaxHy5wLL8ySymuovQHS4CanaDj61d
	 3V3ltdjBRD54XPHm4LpD8J2BYnr2XGzKtpiDD6h0wnL52Szo/iBNWmuWNVgypnhYgo/cZ
	 R7BbJlQOug4V5D4JlV9JcT7QBraMit/QqsXjOfQjW2YKQQLGNRVJcptaqv+zNmd5DY1tr
	 xkqZAfyLLK+riwQRrt9Siq45ktyakXIywSNMOWapZ/UQK3b8wCH0yrkEm7oqftGfbcQGK
	 +lO626kNgfMRqsTYgqYdWRX5d1zunJeXqriP4qfHDHbyNf93hGD5MbwHr16/GUHsJOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499584;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YYa6hocGbcNV+/TTDxhibnR9CUpcM61B3Sm/tMIUvlU=;
	b=OvyI8+XPTHYN0qzaoJrxO1dbt93tTMTmAZ6LejqvZOuQMQ51goxxkcFyazF8eWuruBE/
	 QqRish4eZeWfasa8UIJM2zDxdK6An/GLqEASy8Wo47XHBoaL7bBS4KGKjTA7lhj4hs/cp
	 AalK1Ewz/3aI/Jk3nhfkq/b2CqO+KJPec0Osgtw8mJ8Widh6EjO9ghMM4DHMJ2wooQCjU
	 Bj66BKNU4ziAUBcOkvBvsC8X7L2WaP/W9vk1ShvB4GuWKlPaSr+e9GvbXClKfWwhZsa8l
	 T/gacAAhIDSw2jUuxVP5+3udYLgpt98hCqzfbzZHDqbLtjWiKURGbshoo8CROH2Vo+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KWDBT1va;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ED0606A337
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 16:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8ED0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KWDBT1va
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794499584; x=1826035584;
  h=date:from:to:cc:subject:message-id;
  bh=TXj7JsbR9/ZMCD3eGa7r0U5Emf4YEC4UIKF2dcXxZ0c=;
  b=KWDBT1vaFPZNS14ZiKQToZ+r0XBv2EKZkC0FPsgkpp4ziZ4Kb1wHeRy1
   iYb4PGkjGEhMu395wkeLS3QyBLYJ9W5nF1BGqKcYwqOxeXtjQQFcrn9+I
   wLoB57OJv0hncF7C22t2SuUGdDZp9EEOuY2RMN/37ZH5+tyo1eNCzn8c8
   ZKcJLDtLleUP78MzMUGnoHdIkVvRgFOWxR7eLD/bPPYRAgIE4j6g1wJWS
   g4NioorA/K7UezWHYKGQ07KBXa3GOYyd8RsLK0z+OCdIXIPAGTx7WrXXr
   fkr7pJqliYH5p9DoV3snRs7xdS3b2K2aOTYsYgIO/B74Kcu04UQvWDTJf
   g==;
X-CSE-ConnectionGUID: xC8kyNudSDymRlEEV1OpzQ==
X-CSE-MsgGUID: aCeWGyasSAStHLv50OtDcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3287572"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3287572"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:06:24 -0800
X-CSE-ConnectionGUID: dtj1ixC1T+2VofuBFQXs1g==
X-CSE-MsgGUID: bxLN7kprTKyNPNhOuX3lWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8565471"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2026 08:06:22 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXJb-000000011gh-2owf;
	Thu, 12 Nov 2026 16:06:19 +0000
Date: Fri, 13 Nov 2026 00:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2] mm/swap.c:778: warning:
 Function parameter or member 'tail' not described in
 'mark_page_lazyfree_movetail'
Message-ID: <202611122331.s3eBSeDq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Charan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   1fff066d713e51b675a78a9d50b68af5f108220d
commit: 8011eb22150e5bb6eb1834ce9913f36081d48ab5 [2/2] ANDROID: mm: provision to add shmem pages to inactive file lru head
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611122331.s3eBSeDq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122331.s3eBSeDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122331.s3eBSeDq-lkp@intel.com/

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
