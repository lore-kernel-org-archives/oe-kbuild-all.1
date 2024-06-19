Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1993B15A846
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718836861; cv=none; b=JJCGFEXsSKAgehRLEbWccFjFFzfLNyRp0V/aNX0JwBv0GtMYXXSTyhNQ22ophpniCJwacfa9jaCe+r1/W9NcZkefCnL8sNb8IUZr9wG2YBvJDbH7uiRjKeJq60YpBdNMMb3oh12C1YbWrzD+Apk+tez4+oX1w4XXwl74M8uJPO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718836861; c=relaxed/simple;
	bh=rEFtywD1iQFPvL9P0IAHI2SCMYGHMYonL+j84xgKatU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8o0HYZlvTwJRDWkTGXrdHmZH7yKwsLnwEIhzC+z0hBe4eTCh5QBcL36nYE3Lh+ZZKzZM/wblngYrriWM0sr5Eb9htMIMFqpdJ8jsDkg1QuMqx+snSKbvF71ttLNsLXflQe27Bu7ZVST8wrOFNtsCHQIto1jG4Ohadv5cktDG0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XImvg14R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XImvg14R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718836859; x=1750372859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEFtywD1iQFPvL9P0IAHI2SCMYGHMYonL+j84xgKatU=;
  b=XImvg14RvXkNlcrW5iPKsCyVNR7aCgQdK+Le6ZpZguSGiwGYnnQ8EbKk
   LFbmOql9oq+cwR9o+6ovPpGSFiFNsFJEBp6em6Ij0E10C8hDpseiyvU6c
   jhALPmGUr73U6fz3PU2ks9dIS0hnReLFv9NIqLD2A7/sG/wfiJ9OyJOO/
   9rO89e4qK+xBp7mIU+YuLjCe82XDa6G1rWZZCwbqE0rUsX/ThSwvcdZm0
   xkSQL3GcX0aeMbn3UeUxzmN/r3q/XhfyafwPTOMNbD4bahjq3DVsnmoSn
   MFKMsplmr3LFvQkm99uhx0U72ZYOc5YSdj3JBJ8Kyg0ZhFhij2Biv7U9E
   w==;
X-CSE-ConnectionGUID: je2PNWcZRtGQJzDKLuSnfA==
X-CSE-MsgGUID: PJIDc0GFRfqk4lV46QYvzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15766951"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15766951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 15:40:59 -0700
X-CSE-ConnectionGUID: tce4aifwSweeJbbrbiOzHA==
X-CSE-MsgGUID: qPz+nF33SUi/XhUbuoM0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42710025"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 15:40:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK3z5-00073e-1C;
	Wed, 19 Jun 2024 22:40:55 +0000
Date: Thu, 20 Jun 2024 06:40:19 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/5] mm/gup: Add an option for obtaining an exclusive
 pin
Message-ID: <202406200837.kQUyuHHW-lkp@intel.com>
References: <20240618-exclusive-gup-v1-2-30472a19c5d1@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-exclusive-gup-v1-2-30472a19c5d1@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6ba59ff4227927d3a8530fc2973b80e94b54d58f]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/mm-gup-Move-GUP_PIN_COUNTING_BIAS-to-page_ref-h/20240619-080819
base:   6ba59ff4227927d3a8530fc2973b80e94b54d58f
patch link:    https://lore.kernel.org/r/20240618-exclusive-gup-v1-2-30472a19c5d1%40quicinc.com
patch subject: [PATCH RFC 2/5] mm/gup: Add an option for obtaining an exclusive pin
config: i386-buildonly-randconfig-004-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200837.kQUyuHHW-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200837.kQUyuHHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200837.kQUyuHHW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:492: warning: Function parameter or struct member 'flags' not described in '__unpin_user_pages_dirty_lock'
>> mm/gup.c:492: warning: expecting prototype for unpin_user_pages_dirty_lock(). Prototype was for __unpin_user_pages_dirty_lock() instead
>> mm/gup.c:619: warning: Function parameter or struct member 'flags' not described in '__unpin_user_pages'
>> mm/gup.c:619: warning: expecting prototype for unpin_user_pages(). Prototype was for __unpin_user_pages() instead


vim +492 mm/gup.c

8745d7f6346ca1 Joao Martins            2021-04-29  467  
fc1d8e7cca2daa John Hubbard            2019-05-13  468  /**
f1f6a7dd9b53aa John Hubbard            2020-01-30  469   * unpin_user_pages_dirty_lock() - release and optionally dirty gup-pinned pages
2d15eb31b50a1b Andrew Morton           2019-09-23  470   * @pages:  array of pages to be maybe marked dirty, and definitely released.
fc1d8e7cca2daa John Hubbard            2019-05-13  471   * @npages: number of pages in the @pages array.
2d15eb31b50a1b Andrew Morton           2019-09-23  472   * @make_dirty: whether to mark the pages dirty
fc1d8e7cca2daa John Hubbard            2019-05-13  473   *
fc1d8e7cca2daa John Hubbard            2019-05-13  474   * "gup-pinned page" refers to a page that has had one of the get_user_pages()
fc1d8e7cca2daa John Hubbard            2019-05-13  475   * variants called on that page.
fc1d8e7cca2daa John Hubbard            2019-05-13  476   *
fc1d8e7cca2daa John Hubbard            2019-05-13  477   * For each page in the @pages array, make that page (or its head page, if a
2d15eb31b50a1b Andrew Morton           2019-09-23  478   * compound page) dirty, if @make_dirty is true, and if the page was previously
f1f6a7dd9b53aa John Hubbard            2020-01-30  479   * listed as clean. In any case, releases all pages using unpin_user_page(),
f1f6a7dd9b53aa John Hubbard            2020-01-30  480   * possibly via unpin_user_pages(), for the non-dirty case.
fc1d8e7cca2daa John Hubbard            2019-05-13  481   *
f1f6a7dd9b53aa John Hubbard            2020-01-30  482   * Please see the unpin_user_page() documentation for details.
fc1d8e7cca2daa John Hubbard            2019-05-13  483   *
2d15eb31b50a1b Andrew Morton           2019-09-23  484   * set_page_dirty_lock() is used internally. If instead, set_page_dirty() is
2d15eb31b50a1b Andrew Morton           2019-09-23  485   * required, then the caller should a) verify that this is really correct,
2d15eb31b50a1b Andrew Morton           2019-09-23  486   * because _lock() is usually required, and b) hand code it:
f1f6a7dd9b53aa John Hubbard            2020-01-30  487   * set_page_dirty_lock(), unpin_user_page().
fc1d8e7cca2daa John Hubbard            2019-05-13  488   *
fc1d8e7cca2daa John Hubbard            2019-05-13  489   */
38fc3ba85928be Fuad Tabba              2024-06-18  490  static void __unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
38fc3ba85928be Fuad Tabba              2024-06-18  491  					  bool make_dirty, unsigned int flags)
fc1d8e7cca2daa John Hubbard            2019-05-13 @492  {
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  493) 	unsigned long i;
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  494) 	struct folio *folio;
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  495) 	unsigned int nr;
2d15eb31b50a1b Andrew Morton           2019-09-23  496  
2d15eb31b50a1b Andrew Morton           2019-09-23  497  	if (!make_dirty) {
f1f6a7dd9b53aa John Hubbard            2020-01-30  498  		unpin_user_pages(pages, npages);
2d15eb31b50a1b Andrew Morton           2019-09-23  499  		return;
fc1d8e7cca2daa John Hubbard            2019-05-13  500  	}
fc1d8e7cca2daa John Hubbard            2019-05-13  501  
b6a2619c60b41a David Hildenbrand       2022-05-09  502  	sanity_check_pinned_pages(pages, npages);
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  503) 	for (i = 0; i < npages; i += nr) {
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  504) 		folio = gup_folio_next(pages, npages, i, &nr);
2d15eb31b50a1b Andrew Morton           2019-09-23  505  		/*
2d15eb31b50a1b Andrew Morton           2019-09-23  506  		 * Checking PageDirty at this point may race with
2d15eb31b50a1b Andrew Morton           2019-09-23  507  		 * clear_page_dirty_for_io(), but that's OK. Two key
2d15eb31b50a1b Andrew Morton           2019-09-23  508  		 * cases:
fc1d8e7cca2daa John Hubbard            2019-05-13  509  		 *
2d15eb31b50a1b Andrew Morton           2019-09-23  510  		 * 1) This code sees the page as already dirty, so it
2d15eb31b50a1b Andrew Morton           2019-09-23  511  		 * skips the call to set_page_dirty(). That could happen
2d15eb31b50a1b Andrew Morton           2019-09-23  512  		 * because clear_page_dirty_for_io() called
2d15eb31b50a1b Andrew Morton           2019-09-23  513  		 * page_mkclean(), followed by set_page_dirty().
2d15eb31b50a1b Andrew Morton           2019-09-23  514  		 * However, now the page is going to get written back,
2d15eb31b50a1b Andrew Morton           2019-09-23  515  		 * which meets the original intention of setting it
2d15eb31b50a1b Andrew Morton           2019-09-23  516  		 * dirty, so all is well: clear_page_dirty_for_io() goes
2d15eb31b50a1b Andrew Morton           2019-09-23  517  		 * on to call TestClearPageDirty(), and write the page
2d15eb31b50a1b Andrew Morton           2019-09-23  518  		 * back.
fc1d8e7cca2daa John Hubbard            2019-05-13  519  		 *
2d15eb31b50a1b Andrew Morton           2019-09-23  520  		 * 2) This code sees the page as clean, so it calls
2d15eb31b50a1b Andrew Morton           2019-09-23  521  		 * set_page_dirty(). The page stays dirty, despite being
2d15eb31b50a1b Andrew Morton           2019-09-23  522  		 * written back, so it gets written back again in the
2d15eb31b50a1b Andrew Morton           2019-09-23  523  		 * next writeback cycle. This is harmless.
fc1d8e7cca2daa John Hubbard            2019-05-13  524  		 */
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  525) 		if (!folio_test_dirty(folio)) {
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  526) 			folio_lock(folio);
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  527) 			folio_mark_dirty(folio);
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  528) 			folio_unlock(folio);
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  529) 		}
38fc3ba85928be Fuad Tabba              2024-06-18  530  		gup_put_folio(folio, nr, flags);
2d15eb31b50a1b Andrew Morton           2019-09-23  531  	}
fc1d8e7cca2daa John Hubbard            2019-05-13  532  }
38fc3ba85928be Fuad Tabba              2024-06-18  533  
38fc3ba85928be Fuad Tabba              2024-06-18  534  void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
38fc3ba85928be Fuad Tabba              2024-06-18  535  				 bool make_dirty)
38fc3ba85928be Fuad Tabba              2024-06-18  536  {
38fc3ba85928be Fuad Tabba              2024-06-18  537  	__unpin_user_pages_dirty_lock(pages, npages, make_dirty, FOLL_PIN);
38fc3ba85928be Fuad Tabba              2024-06-18  538  }
f1f6a7dd9b53aa John Hubbard            2020-01-30  539  EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
fc1d8e7cca2daa John Hubbard            2019-05-13  540  
38fc3ba85928be Fuad Tabba              2024-06-18  541  void unpin_exc_pages_dirty_lock(struct page **pages, unsigned long npages,
38fc3ba85928be Fuad Tabba              2024-06-18  542  				bool make_dirty)
38fc3ba85928be Fuad Tabba              2024-06-18  543  {
38fc3ba85928be Fuad Tabba              2024-06-18  544  	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_EXCLUSIVE_PIN)))
38fc3ba85928be Fuad Tabba              2024-06-18  545  		return;
38fc3ba85928be Fuad Tabba              2024-06-18  546  
38fc3ba85928be Fuad Tabba              2024-06-18  547  	__unpin_user_pages_dirty_lock(pages, npages, make_dirty,
38fc3ba85928be Fuad Tabba              2024-06-18  548  				      FOLL_PIN | FOLL_EXCLUSIVE);
38fc3ba85928be Fuad Tabba              2024-06-18  549  }
38fc3ba85928be Fuad Tabba              2024-06-18  550  EXPORT_SYMBOL(unpin_exc_pages_dirty_lock);
38fc3ba85928be Fuad Tabba              2024-06-18  551  
458a4f788f8602 Joao Martins            2021-04-29  552  /**
458a4f788f8602 Joao Martins            2021-04-29  553   * unpin_user_page_range_dirty_lock() - release and optionally dirty
458a4f788f8602 Joao Martins            2021-04-29  554   * gup-pinned page range
458a4f788f8602 Joao Martins            2021-04-29  555   *
458a4f788f8602 Joao Martins            2021-04-29  556   * @page:  the starting page of a range maybe marked dirty, and definitely released.
458a4f788f8602 Joao Martins            2021-04-29  557   * @npages: number of consecutive pages to release.
458a4f788f8602 Joao Martins            2021-04-29  558   * @make_dirty: whether to mark the pages dirty
458a4f788f8602 Joao Martins            2021-04-29  559   *
458a4f788f8602 Joao Martins            2021-04-29  560   * "gup-pinned page range" refers to a range of pages that has had one of the
458a4f788f8602 Joao Martins            2021-04-29  561   * pin_user_pages() variants called on that page.
458a4f788f8602 Joao Martins            2021-04-29  562   *
458a4f788f8602 Joao Martins            2021-04-29  563   * For the page ranges defined by [page .. page+npages], make that range (or
458a4f788f8602 Joao Martins            2021-04-29  564   * its head pages, if a compound page) dirty, if @make_dirty is true, and if the
458a4f788f8602 Joao Martins            2021-04-29  565   * page range was previously listed as clean.
458a4f788f8602 Joao Martins            2021-04-29  566   *
458a4f788f8602 Joao Martins            2021-04-29  567   * set_page_dirty_lock() is used internally. If instead, set_page_dirty() is
458a4f788f8602 Joao Martins            2021-04-29  568   * required, then the caller should a) verify that this is really correct,
458a4f788f8602 Joao Martins            2021-04-29  569   * because _lock() is usually required, and b) hand code it:
458a4f788f8602 Joao Martins            2021-04-29  570   * set_page_dirty_lock(), unpin_user_page().
458a4f788f8602 Joao Martins            2021-04-29  571   *
458a4f788f8602 Joao Martins            2021-04-29  572   */
458a4f788f8602 Joao Martins            2021-04-29  573  void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
458a4f788f8602 Joao Martins            2021-04-29  574  				      bool make_dirty)
458a4f788f8602 Joao Martins            2021-04-29  575  {
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  576) 	unsigned long i;
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  577) 	struct folio *folio;
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  578) 	unsigned int nr;
458a4f788f8602 Joao Martins            2021-04-29  579  
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  580) 	for (i = 0; i < npages; i += nr) {
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  581) 		folio = gup_folio_range_next(page, npages, i, &nr);
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  582) 		if (make_dirty && !folio_test_dirty(folio)) {
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  583) 			folio_lock(folio);
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  584) 			folio_mark_dirty(folio);
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  585) 			folio_unlock(folio);
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  586) 		}
659508f9c936aa Matthew Wilcox (Oracle  2021-12-23  587) 		gup_put_folio(folio, nr, FOLL_PIN);
458a4f788f8602 Joao Martins            2021-04-29  588  	}
458a4f788f8602 Joao Martins            2021-04-29  589  }
458a4f788f8602 Joao Martins            2021-04-29  590  EXPORT_SYMBOL(unpin_user_page_range_dirty_lock);
458a4f788f8602 Joao Martins            2021-04-29  591  
23babe1934d763 David Hildenbrand       2024-04-02  592  static void gup_fast_unpin_user_pages(struct page **pages, unsigned long npages)
b6a2619c60b41a David Hildenbrand       2022-05-09  593  {
b6a2619c60b41a David Hildenbrand       2022-05-09  594  	unsigned long i;
b6a2619c60b41a David Hildenbrand       2022-05-09  595  	struct folio *folio;
b6a2619c60b41a David Hildenbrand       2022-05-09  596  	unsigned int nr;
b6a2619c60b41a David Hildenbrand       2022-05-09  597  
b6a2619c60b41a David Hildenbrand       2022-05-09  598  	/*
b6a2619c60b41a David Hildenbrand       2022-05-09  599  	 * Don't perform any sanity checks because we might have raced with
b6a2619c60b41a David Hildenbrand       2022-05-09  600  	 * fork() and some anonymous pages might now actually be shared --
b6a2619c60b41a David Hildenbrand       2022-05-09  601  	 * which is why we're unpinning after all.
b6a2619c60b41a David Hildenbrand       2022-05-09  602  	 */
b6a2619c60b41a David Hildenbrand       2022-05-09  603  	for (i = 0; i < npages; i += nr) {
b6a2619c60b41a David Hildenbrand       2022-05-09  604  		folio = gup_folio_next(pages, npages, i, &nr);
b6a2619c60b41a David Hildenbrand       2022-05-09  605  		gup_put_folio(folio, nr, FOLL_PIN);
b6a2619c60b41a David Hildenbrand       2022-05-09  606  	}
b6a2619c60b41a David Hildenbrand       2022-05-09  607  }
b6a2619c60b41a David Hildenbrand       2022-05-09  608  
fc1d8e7cca2daa John Hubbard            2019-05-13  609  /**
f1f6a7dd9b53aa John Hubbard            2020-01-30  610   * unpin_user_pages() - release an array of gup-pinned pages.
fc1d8e7cca2daa John Hubbard            2019-05-13  611   * @pages:  array of pages to be marked dirty and released.
fc1d8e7cca2daa John Hubbard            2019-05-13  612   * @npages: number of pages in the @pages array.
fc1d8e7cca2daa John Hubbard            2019-05-13  613   *
f1f6a7dd9b53aa John Hubbard            2020-01-30  614   * For each page in the @pages array, release the page using unpin_user_page().
fc1d8e7cca2daa John Hubbard            2019-05-13  615   *
f1f6a7dd9b53aa John Hubbard            2020-01-30  616   * Please see the unpin_user_page() documentation for details.
fc1d8e7cca2daa John Hubbard            2019-05-13  617   */
38fc3ba85928be Fuad Tabba              2024-06-18  618  static void __unpin_user_pages(struct page **pages, unsigned long npages, unsigned int flags)
fc1d8e7cca2daa John Hubbard            2019-05-13 @619  {
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  620) 	unsigned long i;
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  621) 	struct folio *folio;
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  622) 	unsigned int nr;
fc1d8e7cca2daa John Hubbard            2019-05-13  623  
146608bb75e677 John Hubbard            2020-10-13  624  	/*
146608bb75e677 John Hubbard            2020-10-13  625  	 * If this WARN_ON() fires, then the system *might* be leaking pages (by
146608bb75e677 John Hubbard            2020-10-13  626  	 * leaving them pinned), but probably not. More likely, gup/pup returned
146608bb75e677 John Hubbard            2020-10-13  627  	 * a hard -ERRNO error to the caller, who erroneously passed it here.
146608bb75e677 John Hubbard            2020-10-13  628  	 */
146608bb75e677 John Hubbard            2020-10-13  629  	if (WARN_ON(IS_ERR_VALUE(npages)))
146608bb75e677 John Hubbard            2020-10-13  630  		return;
31b912de131664 Joao Martins            2021-04-29  631  
b6a2619c60b41a David Hildenbrand       2022-05-09  632  	sanity_check_pinned_pages(pages, npages);
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  633) 	for (i = 0; i < npages; i += nr) {
12521c7606b203 Matthew Wilcox (Oracle  2021-12-22  634) 		folio = gup_folio_next(pages, npages, i, &nr);
38fc3ba85928be Fuad Tabba              2024-06-18  635  		gup_put_folio(folio, nr, flags);
38fc3ba85928be Fuad Tabba              2024-06-18  636  	}
fc1d8e7cca2daa John Hubbard            2019-05-13  637  }
38fc3ba85928be Fuad Tabba              2024-06-18  638  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
