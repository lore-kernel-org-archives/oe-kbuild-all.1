Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554013403F9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 06:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972346; cv=none; b=Ctlb52M78uVF08gPAzmOjoi8RHjlPFRG/yoHn9mdAZi2iUCAZDXl/X20H6Te3bD5/3OeGlxKOpYQJpuW1+egxlNtyAOJwKdesiUrp2eA0aHdgjtLWtHa2jJg428ael0MmeAyRbRV5u+A8SrER+ZcXR92qKMsTiwdBPnODhRdybs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972346; c=relaxed/simple;
	bh=FAwC5mr6oM8cEP6OBPs8afvA/YHAJXWAkXtEh+XWsQk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nHuv/4BR9o1kdelxkZWaJquM4uJb2mS3dd1Isa1Pf9EtEFmLwBOIzQGYPpwnfB3Rjr6HzggHFqgYSEV+mFyYS3/L2fuLVDUFYjIosBb4V50i9hdYrvloOeLmFmto+GdUD3xqucduDGHdaORV8LbMLodNWGweAHWmIOttfiGTMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLGQFbAK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLGQFbAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782972345; x=1814508345;
  h=date:from:to:cc:subject:message-id;
  bh=FAwC5mr6oM8cEP6OBPs8afvA/YHAJXWAkXtEh+XWsQk=;
  b=YLGQFbAKK+0OWvuPaQnH6zQvrPqCDtj4Cdh8x2H5xmjNOVPvqA771Fl+
   ashs0EMRLz6jegef7hbqpICCy1wEWT/r7VGSj4QJq4CCkEpyUjiw2P3ma
   pSzk6UYsNDGHk2U4oL3exQ2OE93TNBJvPwfILuA4C+zV8s8eYhEsKY/Ep
   bSeUygwCAOpvxLVtUYiUxANVsEs8dQt0jsrjmfEeb50mLMudYqwnwuFty
   VSez+oqbDPrzR/JMrTMINlIJbhyKNUssfh74Z7i2QG/BMvax5ILI1Jv22
   JCqNFuq8LUXTpqSe3aHNlvgZ/iIRFWwtUTLRqLr9hYcr/r8yPqOAOKP9/
   A==;
X-CSE-ConnectionGUID: v3Nvx7sRSj6A2BTAYWB9ng==
X-CSE-MsgGUID: L1FiA+LzT12UQeCGWFOTOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94869854"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94869854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:05:44 -0700
X-CSE-ConnectionGUID: 9OkUbwFWSn62hHtcW6e0+w==
X-CSE-MsgGUID: jexpY8RpQRS0Dec0dJHDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256344021"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Jul 2026 23:05:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfAYI-00000000A4x-00iy;
	Thu, 02 Jul 2026 06:05:35 +0000
Date: Thu, 02 Jul 2026 14:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1] mm/vmscan.c:4613:6:
 warning: no previous prototype for 'isolate_page'
Message-ID: <202607021306.DnciwmmB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   757ec6fbfcf9797b300759b2398984c207875288
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [0/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021306.DnciwmmB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021306.DnciwmmB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021306.DnciwmmB-lkp@intel.com/

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
