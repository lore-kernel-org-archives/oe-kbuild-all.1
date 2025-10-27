Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE72DE6F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761606948; cv=none; b=Zr4phVGzYGTi3DxXHWiqlMLL8NVIPJdID/6CkB/F/TEtwPOY2sDc9ljxg1x5Od7x83T89i+pw6oj/Hq9hvi9cRPBpyXrjVKXYa91UvqkClBF9lf+mvc1zyam8IVmdzzW/PfHk8JhadZ+fPObWHDtdPCKKLo6BhCAMZh+i3rQh6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761606948; c=relaxed/simple;
	bh=eZ4qeanQ9eDJBJSqvN2wWRl6HZyVgvqwhwZdFIIE9CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0q/DfKOlrzn3nACktWLHRORkkO0EuS4ejnjzWK3glysk/RR4KoF2ERxnIYFBz6TOxTLZMucIbBkVDeRmXE3KJ05AeZotMl9nSZKjTTU9uYCdlLujGjwJZvCeFYcD3tOvxeTXmBbhcrH/NqITOh8MKALzRtZh5cz1YP4N0toLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsnaNR87; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsnaNR87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761606946; x=1793142946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZ4qeanQ9eDJBJSqvN2wWRl6HZyVgvqwhwZdFIIE9CE=;
  b=lsnaNR87aUxfSOduo4klUdmUNW6RVL/4qTqer+0kLq2KEho2UhEh7Jbd
   3ikJiKq+H5V9rvNcyZ99Qtd+gHYyH9F+MxXwunnFNTlWNF/Zbwmzg8sOF
   kVvE26UzDpiwxX8E2XywAlJWSfNzKYyRYL3DXx0IkVRo6XcwA46p84okJ
   OPoYQrwcDAAXs/4savupacAP8BRs58HJf1Hfiy4y6fhiXadM1RBfcCYT0
   /g3EPVFcAs277hn4Qfu01fcYWe5PXxoLomgb3+DVNrHsDqCGerS+kULTG
   qPJQmCPcBsE5dd4x5A/L3lGwlCjAU1AyhDT+1wVqxoLkHZXwF7CIWI+lo
   g==;
X-CSE-ConnectionGUID: AgMrpJnATH6ORBQ/GmLUmQ==
X-CSE-MsgGUID: 06cuA1ASQFW4zni7C1uWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63794165"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63794165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 16:15:45 -0700
X-CSE-ConnectionGUID: NmNQi+0USWSX94DFbslGRw==
X-CSE-MsgGUID: P3osgdyPSYyT/d5zkrgtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="215840100"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2025 16:15:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDWRC-000IZ9-0I;
	Mon, 27 Oct 2025 23:15:42 +0000
Date: Tue, 28 Oct 2025 07:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1] mm/vmscan.c:4613:6: warning: no
 previous prototype for 'isolate_page'
Message-ID: <202510280704.pdXNntpF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   7ccbbf3815f7dd6c3225a9ab6e6597d0595849be
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [0/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-buildonly-randconfig-004-20251028 (https://download.01.org/0day-ci/archive/20251028/202510280704.pdXNntpF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280704.pdXNntpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280704.pdXNntpF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:917:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     917 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1391:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1391 |         int err;
         |             ^~~
   mm/vmscan.c: At top level:
>> mm/vmscan.c:4613:6: warning: no previous prototype for 'isolate_page' [-Wmissing-prototypes]
    4613 | bool isolate_page(struct lruvec *lruvec, struct page *page, struct scan_control *sc)
         |      ^~~~~~~~~~~~


vim +/isolate_page +4613 mm/vmscan.c

  4612	
> 4613	bool isolate_page(struct lruvec *lruvec, struct page *page, struct scan_control *sc)
  4614	{
  4615		bool success;
  4616	
  4617		/* unmapping inhibited */
  4618		if (!sc->may_unmap && page_mapped(page))
  4619			return false;
  4620	
  4621		/* swapping inhibited */
  4622		if (!(sc->may_writepage && (sc->gfp_mask & __GFP_IO)) &&
  4623		    (PageDirty(page) ||
  4624		     (PageAnon(page) && !PageSwapCache(page))))
  4625			return false;
  4626	
  4627		/* raced with release_pages() */
  4628		if (!get_page_unless_zero(page))
  4629			return false;
  4630	
  4631		/* raced with another isolation */
  4632		if (!TestClearPageLRU(page)) {
  4633			put_page(page);
  4634			return false;
  4635		}
  4636	
  4637		/* see the comment on MAX_NR_TIERS */
  4638		if (!PageReferenced(page))
  4639			set_mask_bits(&page->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  4640	
  4641		/* for shrink_page_list() */
  4642		ClearPageReclaim(page);
  4643		ClearPageReferenced(page);
  4644	
  4645		success = lru_gen_del_page(lruvec, page, true);
  4646		VM_WARN_ON_ONCE_PAGE(!success, page);
  4647	
  4648		return true;
  4649	}
  4650	EXPORT_SYMBOL_GPL(isolate_page);
  4651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
