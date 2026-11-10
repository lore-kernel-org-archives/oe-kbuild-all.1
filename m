Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272403;
	b=x0D5eWKkVEX+c1IzwOqXlpZHRtiqfwx9G+d3RlzmXumQ3O238nrhNKKj5IwNQZymHqih
	 13BucGS2fqWpvQcTh5+wMxGQIvLD0Xu9o+e7nmP7fypu2g7GrNHbCBzmYpI2BTLnVbxQo
	 NHNdW8m/iuG9oxVhw3tD0EJgfJBDerePALdfhLsd9uTb4uzzRpYCg3smI5rbE5XUAqHhS
	 D2lzQtvtjlN1XHyj7yDRVWsf+UXdWu+dw3P/Ecz8rSby1s8AkXMsDVlOE15fidqIbFteD
	 LxGz1f9rxYwZe3eGumxBAq5ZydQjxgJ0aAbEm3m0YdVY7bNYBLOblFyb3M+JJJ/fE+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272403;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hsPZOAtu45VxH523UYKhhTxrsFgVf6mgJiyFE4P3qtw=;
	b=F3NAnnLC2nY/0jnSIH0042rArB9dCoONdBdzg1dNJjqaQM8SNnaVtlWVWtqiXRwQPbqg
	 kMS3Wc/vyozk0Y4zruKeJGi/V2gVoQbuPA1EO/OmdNXIvgFv47VyJYDyIW9WXNI8Mp3mX
	 WKL3t3wYzGz4Rmip/sHy01H7Hztd3JVQT1Xb3wFnZfHSR8TPMJuNIhvPmRZ3RpyFOG677
	 7IZOd0AK5JZdgDkXES05lhAPJKDS5GDy/pLurWbojU0hWTfRE47zKg7rpNJ0WHKuIdJre
	 x3Z+HhAO/+2odN//6Rna9vHSGmQP6kG1oZmI0L+3/mFuT4VTIEk1Nfh2IPTDZC1nDmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBGOIc+D;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2983606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 00:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2983606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBGOIc+D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794272400; x=1825808400;
  h=date:from:to:cc:subject:message-id;
  bh=QzdUpnpDT5+MH/vsrvIsmqRPb0Kg+BmeYqsxABOag+Y=;
  b=hBGOIc+DA6lReOVrI46eZlv3pj7wJPE4rZPKv8b3ylOhtamwzS079Poz
   akGSSsyVQbtpXqrj7XNFIzesx1wDR6wyQEP+oItKKkQbc1XekJyqh9W4Z
   +T/EuVxb9QC/TJWV9Q6upu/eCFGuuooVtFBoxxOruxSPGmEy2MAvvDE/M
   M8V5F9DAuJl+go/SJqbTE4kF1dSyvg2qRwCuHIM3DqRW+9MT/vSUg/w5V
   mMEVowhpTQerVz4oUNBX1upaglhQBqgsyE8J28+BC0DlgTunn2u6b26wP
   UR5TEHDZaiuLxBGO1DPYXCPdMcZWutJYw8nNYYCjHSkTP+AxB3zU/59dB
   A==;
X-CSE-ConnectionGUID: fezHr+hHT1Shny1tvZz9PQ==
X-CSE-MsgGUID: PeRQyiUFRGKq4fvytyJ72A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3094713"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3094713"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:59:59 -0800
X-CSE-ConnectionGUID: 5NBdP3Z6QTWD6bsNr1C15g==
X-CSE-MsgGUID: zWnS3mEsT5me+RPVRSEH2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9759307"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 09 Nov 2026 16:59:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQaDL-00000000vfl-0Fhc;
	Tue, 10 Nov 2026 00:59:55 +0000
Date: Tue, 10 Nov 2026 08:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 54/54] mm/vmscan.c:4613:6:
 warning: no previous prototype for function 'isolate_page'
Message-ID: <202611100829.s2QldOZg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi yipeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3f0fd7f6624d7b99bd8d93cbcfe0241bc92d6448
commit: 54677afc8eb1da47f2eebb6f5c810cd4b6db23dc [54/54] ANDROID: mm: export isolate_folio and reclaim_pages
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261110/202611100829.s2QldOZg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100829.s2QldOZg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100829.s2QldOZg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
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
