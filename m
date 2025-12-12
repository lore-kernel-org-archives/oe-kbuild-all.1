Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5771459F6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 01:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765502339; cv=none; b=ABbeWw/qVd5Mz5zaopdurMun+0O0cYevEQkpzmgJXsQboZzDazhqnYYNpChHh0cc7fTMSTG0QXpYXKge+zR3B/BBA7/Ig4IxXViDLEpkJfW1PJ8vyaWIv/tfQGCGos1Y+w633LxIIi7Okry9OmjjfpGqRS+P9CBMjv0VJ+FLgFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765502339; c=relaxed/simple;
	bh=5yI3aJ+Ag1gs2DxHC8t1hGG7Ao5WK5s9bzknKX1ZSaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNexuAfci6jUoG27gjc7WO7vp1Mcyo/yn3gJkI0Au5/cfnR4BWHfE8JpmMPjCL34ks3EnKkOwceBLiayy7tkTTsi3igJxk6cGws5rqfVSoshNOrmZLVpG9H+bxiFgln/Cp/lsFODdowAKKLDVDjF1exNo+AQD+hS+hgQdMKSyiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYQ133v3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYQ133v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765502337; x=1797038337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yI3aJ+Ag1gs2DxHC8t1hGG7Ao5WK5s9bzknKX1ZSaQ=;
  b=cYQ133v32y6b1L427WRqzEVZ9WTADJv69X0B0XB9Fr6OclIL4pz8BD8A
   CyzHqP7JXmfD8OeCEsbiatJgZiMz2naCK9X7Ylr61+JmnsOj+/xR6eu3O
   5gt/AvjhNFnyo4Y2VhrqxFFWg6DDJgj5BT/toLbeLGJ9cvxapAnlJp8AV
   yDaT4Ld/N9xmHZvbJa/6TO3/C28+hJKGd1RZ76CiAWG5Pv3Wgh3iADyOc
   ZDtuVXFIEVu/nojt/JMepXQNh9tHDTEwh6oab6A+Vkw/SoXXuZd3u8HtP
   2nYKgQBGWMF8iwuwshS97dsOi4Pf6bhQYzMlTeKgglPFI2vGQWfrq8Mvi
   w==;
X-CSE-ConnectionGUID: kYYq/1amT/KVSM8DrOwPyg==
X-CSE-MsgGUID: itUQ8rpwTwCxe8Vv419hdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70075508"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70075508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 17:18:56 -0800
X-CSE-ConnectionGUID: COBGZvnCT/S6mxox2/RMog==
X-CSE-MsgGUID: ONsHh7E7Q+a6JNDh75XtzQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 17:18:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTro5-000000001GG-0xZj;
	Fri, 12 Dec 2025 01:18:53 +0000
Date: Fri, 12 Dec 2025 02:18:22 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 ./mm/balloon_compaction.c:199: warning: Function parameter or member
 'first_page' not described in 'balloon_page_list_dequeue_cont'
Message-ID: <202512120207.sL2q3yQU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: 1f23c7bc1279ef309af72e4ee3a93f78b9b7a05e [0/25] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512120207.sL2q3yQU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120207.sL2q3yQU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/page-flags.h
   Error: Cannot open file ./include/linux/mm.h
   Error: Cannot open file ./include/linux/mm.h
   Error: Cannot open file ./include/linux/page_ref.h
   Error: Cannot open file ./include/linux/mmzone.h
>> ./mm/balloon_compaction.c:199: warning: Function parameter or member 'first_page' not described in 'balloon_page_list_dequeue_cont'
   Error: Cannot open file ./include/linux/padata.h
   Error: Cannot open file ./include/linux/printk.h
   Error: Cannot open file ./include/linux/workqueue.h
   Error: Cannot open file ./include/linux/xarray.h
   Error: Cannot open file ./include/linux/crypto.h


vim +199 ./mm/balloon_compaction.c

   177	
   178	/**
   179	 * balloon_page_list_dequeue_cont() - removes continuous pages from balloon's page list
   180	 *				      and returns a list of the continuous pages.
   181	 * @b_dev_info: balloon device decriptor where we will grab a page from.
   182	 * @pages: pointer to the list of pages that would be returned to the caller.
   183	 * @max_req_pages: max number of requested pages.
   184	 *
   185	 * Driver must call this function to properly de-allocate a previous enlisted
   186	 * balloon pages before definitively releasing it back to the guest system.
   187	 * This function tries to remove @max_req_pages continuous pages from the ballooned
   188	 * pages and return them to the caller in the @pages list.
   189	 *
   190	 * Note that this function may fail to dequeue some pages even if the balloon
   191	 * isn't empty - since the page list can be temporarily empty due to compaction
   192	 * of isolated pages.
   193	 *
   194	 * Return: number of pages that were added to the @pages list.
   195	 */
   196	size_t balloon_page_list_dequeue_cont(struct balloon_dev_info *b_dev_info,
   197					      struct list_head *pages, struct page **first_page,
   198					      size_t max_req_pages)
 > 199	{
   200		struct page *page, *tmp;
   201		unsigned long flags, tail_pfn;
   202		size_t n_pages = 0;
   203		bool got_first = false;
   204	
   205		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
   206		list_for_each_entry_safe_reverse(page, tmp, &b_dev_info->pages, lru) {
   207			unsigned long pfn;
   208	
   209			if (n_pages == max_req_pages)
   210				break;
   211	
   212			pfn = page_to_pfn(page);
   213	
   214			if (got_first && pfn != tail_pfn + 1)
   215				break;
   216	
   217			/*
   218			 * Block others from accessing the 'page' while we get around to
   219			 * establishing additional references and preparing the 'page'
   220			 * to be released by the balloon driver.
   221			 */
   222			if (!trylock_page(page)) {
   223				if (!got_first)
   224					continue;
   225				else
   226					break;
   227			}
   228	
   229			if (IS_ENABLED(CONFIG_BALLOON_COMPACTION) && PageIsolated(page)) {
   230				/* raced with isolation */
   231				unlock_page(page);
   232				if (!got_first)
   233					continue;
   234				else
   235					break;
   236			}
   237			balloon_page_delete(page);
   238			__count_vm_event(BALLOON_DEFLATE);
   239			list_add(&page->lru, pages);
   240			unlock_page(page);
   241			n_pages++;
   242			tail_pfn = pfn;
   243			if (!got_first) {
   244				got_first = true;
   245				*first_page = page;
   246			}
   247		}
   248		spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
   249	
   250		return n_pages;
   251	}
   252	EXPORT_SYMBOL_GPL(balloon_page_list_dequeue_cont);
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
