Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C303A1E67
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767194155; cv=none; b=haJ0G283YaBcCoOBpSdRqJgTgi53CwThHoVBL+QhBiHbambSmP90hF3sKHhjV2XEosolwQxskD3EIUSjTnVPUCWiW3gDlicx+TFQt8l2ZudrdaDCGjJpz1qpOFniLROI2bhUkQlgi3PlG2fKpbrJPzFX10hmTEiCnUjdq0PBM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767194155; c=relaxed/simple;
	bh=ZeY2Kb/E+Fensm1iTgEdC6E3n0LohNqLgIoeh2HDA8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qArWO1h9s1sMolwjerTbscPGQ/XR2v0lFOZK5ku7vlactbgATyYEyylaBluTxG54wmdEl+sVvHxYBJ+LFpYA77Mp6Ku1OE7BXlGEEvnafV1qbtJOLol8NQshPX+uk5RMo3MYrELFCsccqjUNB7S20C6j8by8acYelwh49wWQhHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrFZq0OW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrFZq0OW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767194154; x=1798730154;
  h=date:from:to:cc:subject:message-id;
  bh=ZeY2Kb/E+Fensm1iTgEdC6E3n0LohNqLgIoeh2HDA8Q=;
  b=KrFZq0OWufGMtbs7jztqrTEHYqQRDW4hbvO/BeOVK1xJye28jnBw9Jw3
   C0jJcuZDLXOCvt7yYWBi1/aNxJokl6F8C2Fir9yRDF+ZWCF5LjRKboFkg
   0CuMDE2UjqOHhWCMZ86mKDHGG3sSwLAMJkIu826Sx9NjWX3ateduH5Iiq
   9NOWBn4UnI9qt4G3ZONRzTH405CPOncR9MteHoa7tI5j/ml3U/RtWTMWw
   YDR3Zu3CsTw85wN8NpzOtBWoZvLbRGbF6R95987k9Qkdt7dEZI2o0s/Wu
   vHUjZ2Z9bH5cUk8jnyUlpxYEwQWooqY7Cp0P2XHzlCYCmTrgYecd+dbVQ
   A==;
X-CSE-ConnectionGUID: OwogmVghQry/OKpxsosmWQ==
X-CSE-MsgGUID: iYYzVhkdQrmIyl1X4171kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68663360"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="68663360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 07:15:53 -0800
X-CSE-ConnectionGUID: I8sFf6oESO+ncN3AV3sZ5A==
X-CSE-MsgGUID: p7wXj6akTh2bKJR6ViYhcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="202411651"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Dec 2025 07:15:51 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaxvR-000000001I5-2RzY;
	Wed, 31 Dec 2025 15:15:49 +0000
Date: Wed, 31 Dec 2025 23:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] mm/vmscan.c:4613:6:
 warning: no previous prototype for function 'isolate_page'
Message-ID: <202512312322.RLaJAoOw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   913096d07c824b4bc3fb781fc52d46fbf33dd00a
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [1/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251231/202512312322.RLaJAoOw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512312322.RLaJAoOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512312322.RLaJAoOw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   mm/vmscan.c:917:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
     917 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:917:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     917 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
   mm/vmscan.c:1391:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1391 |         int err;
         |             ^
>> mm/vmscan.c:4613:6: warning: no previous prototype for function 'isolate_page' [-Wmissing-prototypes]
    4613 | bool isolate_page(struct lruvec *lruvec, struct page *page, struct scan_control *sc)
         |      ^
   mm/vmscan.c:4613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4613 | bool isolate_page(struct lruvec *lruvec, struct page *page, struct scan_control *sc)
         | ^
         | static 
   4 warnings generated.


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
