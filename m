Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF14C84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 07:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721805864; cv=none; b=T2E6OIDAC+tOCIvVSMStmQVjC4d3BJX+fEqrGG6QDCsTid+59EWExedMzsBlQ+m+bWOiIuB8Po8oiugxKo9wK/VJPyMAO+u8NHLco4IdR7tp3BcacGoPZWSRkiBMi5HPF4ay72Ktx5GO/WxBL4D9+6fwh3hYLjZd2pYrbbHKiIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721805864; c=relaxed/simple;
	bh=RIhHgfJroKe6Mfcs5vXrAnocs66PZUvwmQcjPpyMdJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfLiFLyZHwc6O7EngRx+vHipW4Ou3vaTSMkzSy8KRq+j3wDB+XAd57237dQQsaEYZNS9NjUtqH0oeSasR36Hk4M7s7I9UfPxKVUvkz1NrtAPeH+2exAqzHatL3h0txCX/K3vcX0iMtcgd24IYDRyWhibxXYRyp9tjtv0aWHryRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hp4ESZUH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hp4ESZUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721805863; x=1753341863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RIhHgfJroKe6Mfcs5vXrAnocs66PZUvwmQcjPpyMdJo=;
  b=Hp4ESZUHdRsLTPpaoYTHaEGxwdHUXaQNM9RZc6jGr2oeGsk4nXByNILW
   JiINwq427QqW/9xn+wSczMz4I1rhSzxoDjCifrGipBwfiNbJ4LZHxdhbd
   Kr2fMhs0ot30JNi3lWplryiw0CdO6vlBkgJ7rbcPaw5u3wvoXH0xFBhdx
   hM8gdmKaHqup0XpklmDf11xyXjh37WV9Pd7B7X5J73HyphsSJ+pzSD6Z4
   O5Emycs07P4v9hSfdM/939lbYA6migthfmnh2xPF7xBBQO3N3Dn2ezxHK
   eO/dPtR03Tc/ZeO8AOxz4+mTwj1KZ+s6VVRPnQmT8QtvLD5+Uwj1+G+Eh
   Q==;
X-CSE-ConnectionGUID: DxzZIFEIQ5CE2bshHTxjCg==
X-CSE-MsgGUID: RmSpIi/NS1KaYukpUeIbzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="41993547"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="41993547"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 00:24:12 -0700
X-CSE-ConnectionGUID: hJtl0w8yQKaU+5S2w1LCgw==
X-CSE-MsgGUID: U5gOuR/LTfqEsK+Wrph9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52402923"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jul 2024 00:24:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWWM3-000mm1-2W;
	Wed, 24 Jul 2024 07:24:07 +0000
Date: Wed, 24 Jul 2024 15:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH 2/6] mm: Constify page_address_in_vma()
Message-ID: <202407241541.GgplaeTD-lkp@intel.com>
References: <20240723153503.1669586-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723153503.1669586-3-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20240724]
[cannot apply to tip/x86/mm dennis-percpu/for-next v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/bootmem-Stop-using-page-index/20240723-233932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240723153503.1669586-3-willy%40infradead.org
patch subject: [PATCH 2/6] mm: Constify page_address_in_vma()
config: sh-migor_defconfig (https://download.01.org/0day-ci/archive/20240724/202407241541.GgplaeTD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241541.GgplaeTD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241541.GgplaeTD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/rmap.c:56:
   mm/rmap.c: In function 'page_address_in_vma':
>> mm/rmap.c:796:47: warning: passing argument 1 of 'folio_pfn' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     796 |         pgoff = folio->index + folio_page_idx(folio, page);
         |                                               ^~~~~
   include/linux/mm.h:216:69: note: in definition of macro 'folio_page_idx'
     216 | #define folio_page_idx(folio, p)        (page_to_pfn(p) - folio_pfn(folio))
         |                                                                     ^~~~~
   include/linux/mm.h:1877:53: note: expected 'struct folio *' but argument is of type 'const struct folio *'
    1877 | static inline unsigned long folio_pfn(struct folio *folio)
         |                                       ~~~~~~~~~~~~~~^~~~~


vim +796 mm/rmap.c

72b252aed506b8 Mel Gorman              2015-09-04  769  
^1da177e4c3f41 Linus Torvalds          2005-04-16  770  /*
bf89c8c8673223 Huang Shijie            2009-10-01  771   * At what user virtual address is page expected in vma?
ab941e0fff3947 Naoya Horiguchi         2010-05-11  772   * Caller should check the page is actually part of the vma.
^1da177e4c3f41 Linus Torvalds          2005-04-16  773   */
eb7052fd71d991 Matthew Wilcox (Oracle  2024-07-23  774) unsigned long page_address_in_vma(const struct page *page,
eb7052fd71d991 Matthew Wilcox (Oracle  2024-07-23  775) 		struct vm_area_struct *vma)
^1da177e4c3f41 Linus Torvalds          2005-04-16  776  {
eb7052fd71d991 Matthew Wilcox (Oracle  2024-07-23  777) 	const struct folio *folio = page_folio(page);
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28  778) 	pgoff_t pgoff;
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28  779) 
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  780) 	if (folio_test_anon(folio)) {
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  781) 		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
4829b906cc063c Hugh Dickins            2010-10-02  782  		/*
4829b906cc063c Hugh Dickins            2010-10-02  783  		 * Note: swapoff's unuse_vma() is more efficient with this
4829b906cc063c Hugh Dickins            2010-10-02  784  		 * check, and needs it to match anon_vma when KSM is active.
4829b906cc063c Hugh Dickins            2010-10-02  785  		 */
4829b906cc063c Hugh Dickins            2010-10-02  786  		if (!vma->anon_vma || !page__anon_vma ||
4829b906cc063c Hugh Dickins            2010-10-02  787  		    vma->anon_vma->root != page__anon_vma->root)
21d0d443cdc165 Andrea Arcangeli        2010-08-09  788  			return -EFAULT;
31657170deaf1d Jue Wang                2021-06-15  789  	} else if (!vma->vm_file) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  790  		return -EFAULT;
e05b34539d008a Matthew Wilcox (Oracle  2022-01-29  791) 	} else if (vma->vm_file->f_mapping != folio->mapping) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  792  		return -EFAULT;
31657170deaf1d Jue Wang                2021-06-15  793  	}
494334e43c16d6 Hugh Dickins            2021-06-15  794  
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28  795) 	/* The !page__anon_vma above handles KSM folios */
412ad5fbe9285f Matthew Wilcox (Oracle  2024-03-28 @796) 	pgoff = folio->index + folio_page_idx(folio, page);
e0abfbb6714244 Matthew Wilcox (Oracle  2024-03-28  797) 	return vma_address(vma, pgoff, 1);
^1da177e4c3f41 Linus Torvalds          2005-04-16  798  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  799  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
