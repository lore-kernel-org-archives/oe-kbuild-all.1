Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5419CD0A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 13:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173866; cv=none; b=aom4Dic1Fy4vA0wOOF4vzRS7B6iPzDwMzZDKuix3xzONtFLCLI7kbx2ZtjF3GE4/J7bSyyzjZbhGthsaBMeKwnsbqbBfQQIXXAJl+Na/dwKMop65Ym9Th7ayii1jjtmj3QPv2aio5zd1pfmZJ8MotooFQbUjFao/alKMHuBcSZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173866; c=relaxed/simple;
	bh=P4iYofFF0OoQJWoLSi5wONQHqVlK1WEkj6ROfecfIPE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NcS96C+ixZ5rNS0bguwvHDPXEhripisF+EJulQx06mNFNEnATDuDEEBqSdYqpdMs2bYqdRnKOye3iDdeKEq3Qax2jAmwZ1ZCFeQbBxvCUX+clOk9UagaoHz5gBtC0ThHcvuEj5acrgSDCfneYzo8NLk0v8O9JAEXF28ccjav08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YW1yYpwt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YW1yYpwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776173865; x=1807709865;
  h=date:from:to:cc:subject:message-id;
  bh=P4iYofFF0OoQJWoLSi5wONQHqVlK1WEkj6ROfecfIPE=;
  b=YW1yYpwtUt3q4KbJ0PJkMyoiQbbDPjuEi77Q8UBJTzdvHqEIYeBqRiMS
   c5B1U2MN+8umcf1fps2C+UXmEUyw3ELU8yl3Y0njhgcS4yOvhEWknrnnw
   Czge9vAjUIfPh1QsriA1IFSGOPVQdIAlIqn9ilw+ye2S4o42B+XNZ+Prn
   cmX1/uAASc3rfGk23+Arxot2GSSVnruZFAbt+dQI2m7l1YBvgASlJZQ5U
   zwoHo/beDv1Ht4G04zKm6v4nXNbQGp83vQa9k8y9Rabhz/W8F2C2NLkQC
   V34pACeFmW1cPSTLppXI3w/ipKLej2kNnOlXIcxywkKeM2GhzxMPIOWOx
   g==;
X-CSE-ConnectionGUID: ucHdj7fNSba7fWzXNCC4dA==
X-CSE-MsgGUID: WauxfkPFRwOxKBpH5HyO6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77201938"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77201938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:37:44 -0700
X-CSE-ConnectionGUID: g1h82DadTKCNWh0Hy+izSw==
X-CSE-MsgGUID: eA9UEahnRoemTSOplRrI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235032994"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2026 06:37:42 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCdxU-000000001UH-02vx;
	Tue, 14 Apr 2026 13:37:40 +0000
Date: Tue, 14 Apr 2026 21:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 3/3] mm/vmscan.c:4613:6:
 warning: no previous prototype for function 'isolate_page'
Message-ID: <202604142115.XMMAoGFt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b1b609b1c10aeb69f25a224bce818978474f4eec
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [3/3] ANDROID: mm: export isolate_folio and reclaim_pages
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604142115.XMMAoGFt-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142115.XMMAoGFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142115.XMMAoGFt-lkp@intel.com/

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
