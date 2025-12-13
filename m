Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5E1D86DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765615221; cv=none; b=naFOWvnOU4fNu8cNRKUJx10n9wsmdh/PJq0lXBwWXMrbxHX+LdHCoOP3NR0h7CKdJD2n5pkSobLGDbrfd1ZH9Hy3kTNDGxSHU8it9V2Jll1fdWv6u6inA6eYPC7/aE2izt35amvG2bNaARpIcyQQYCig0AU4jBNFq5Pd73EhpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765615221; c=relaxed/simple;
	bh=Q4zFlWxxg2h7+rAJxne9yJUmqEY7mTY4FLNyrzbf/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmY9rmnpffLQwl+0wAlaw9WBRDaFuIjIqe4kFUo+5uPOHb5KtM4LUBtSiEvM79SoP4Ts/QYrd/rSE/8Fe3MozMAjIt5+kC7xBD++KUMmM4kGJ+eZ9xOYtkQaQUITVWTlF5behvkKRIIKbFIgj8J50GzqZkXZvXOk7C1HEYBngbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvMCdReP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvMCdReP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765615220; x=1797151220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4zFlWxxg2h7+rAJxne9yJUmqEY7mTY4FLNyrzbf/w8=;
  b=CvMCdRePgSRFMdYzHlYlzndPX9whgZdBydqdZHKmXjKNz5IHIEvVNLqr
   W/zcjRGRoTxBU/fbO4rgeELXdexnyTMNxcgzAuniZzTq3nHlDHLbZaGun
   aGeF6jyosboipOkFYPY0eGQcDpfZbpQ1In6jmIUYfeDsa+KOOwMG4Qwbg
   XnqaaeoQ+XfTXskXq5PfryTKy3g49qo64ysHWmw5Ipj8rQaKBsItr88lN
   3hHkYP0rkKe7tTC6R21yo5c222pRw7aeyKYkhYijhW2fHpOF4oOPd88us
   K4LkVyuheZz+JWYmyd8AMeDw+JgjsJqw4gdC6ymeOQTZGA+MXtrinBuKc
   A==;
X-CSE-ConnectionGUID: FGBQuo0kSaWPQ78C7uiemw==
X-CSE-MsgGUID: 94XkUM0WT+edp6dCckAcgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67482830"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67482830"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:40:20 -0800
X-CSE-ConnectionGUID: RvJQg1pPR1i1nFkaucVJ8w==
X-CSE-MsgGUID: 9sDKynN3RLW+07idLIBH/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="228340267"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 00:40:18 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULAm-000000007KT-1IGW;
	Sat, 13 Dec 2025 08:40:16 +0000
Date: Sat, 13 Dec 2025 16:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pgtable20251212 2/2] mm/huge_memory.c:2171:10: error:
 assignment to 'pgtable_t' {aka 'struct <anonymous> *'} from incompatible
 pointer type 'struct page *'
Message-ID: <202512131609.fFmMV9b1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git pgtable20251212
head:   e5288cc28febf288d2453ca3b4895a0bfd53f28a
commit: e5288cc28febf288d2453ca3b4895a0bfd53f28a [2/2] mm/pgtable: convert pgtable_trans_huge_withdraw to ptdesc
config: sparc-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131609.fFmMV9b1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131609.fFmMV9b1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131609.fFmMV9b1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/huge_memory.c:8:
   mm/huge_memory.c: In function '__do_huge_pmd_anonymous_page':
   include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1274:7: note: in expansion of macro 'page_ptdesc'
          page_ptdesc(pgtable));
          ^~~~~~~~~~~
   mm/huge_memory.c: In function 'set_huge_zero_folio':
   include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1335:38: note: in expansion of macro 'page_ptdesc'
     pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
                                         ^~~~~~~~~~~
   mm/huge_memory.c: In function 'insert_pmd':
   include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1461:39: note: in expansion of macro 'page_ptdesc'
      pgtable_trans_huge_deposit(mm, pmd, page_ptdesc(pgtable));
                                          ^~~~~~~~~~~
   mm/huge_memory.c: In function 'copy_huge_pmd':
   include/linux/mm_types.h:607:36: error: '_Generic' selector of type 'pte_t *' {aka 'struct <anonymous> *'} is not compatible with any association
    #define page_ptdesc(p)   (_Generic((p),   \
                                       ^
   mm/huge_memory.c:1766:46: note: in expansion of macro 'page_ptdesc'
     pgtable_trans_huge_deposit(dst_mm, dst_pmd, page_ptdesc(pgtable));
                                                 ^~~~~~~~~~~
   mm/huge_memory.c: In function 'zap_deposited_table':
>> mm/huge_memory.c:2171:10: error: assignment to 'pgtable_t' {aka 'struct <anonymous> *'} from incompatible pointer type 'struct page *' [-Werror=incompatible-pointer-types]
     pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
             ^
   mm/huge_memory.c: In function '__split_huge_zero_page_pmd':
   mm/huge_memory.c:2810:10: error: assignment to 'pgtable_t' {aka 'struct <anonymous> *'} from incompatible pointer type 'struct page *' [-Werror=incompatible-pointer-types]
     pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
             ^
   mm/huge_memory.c: In function '__split_huge_pmd_locked':
   mm/huge_memory.c:2983:10: error: assignment to 'pgtable_t' {aka 'struct <anonymous> *'} from incompatible pointer type 'struct page *' [-Werror=incompatible-pointer-types]
     pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
             ^
   cc1: some warnings being treated as errors


vim +2171 mm/huge_memory.c

  2166	
  2167	static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
  2168	{
  2169		pgtable_t pgtable;
  2170	
> 2171		pgtable = ptdesc_page(pgtable_trans_huge_withdraw(mm, pmd));
  2172		pte_free(mm, pgtable);
  2173		mm_dec_nr_ptes(mm);
  2174	}
  2175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
