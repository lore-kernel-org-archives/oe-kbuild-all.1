Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBFF79E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683213474; x=1714749474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hd5K+aul1oh3E4gE+nggWyzUdVKTQlYIqGOfccIHdtc=;
  b=H0kprD/5E0R5lI1RhH+WJFhbCJvFfYfqStxmBARPkNSOnyJsYYTUvuB+
   iKlVuJEVObTcJD8JZHQTWWgRLqR8vu9SYK4dA9GqYCtGLWo9h7onvm1xL
   o/cUD2UP5kBBbyLPO/Mlp9XX64Sd9IXSeKa+UJcoOqOWcblbFm4YLPXw3
   AsdG9vPc9cC5xUGpTJtw0/AbwoDcolPsZiDDYgcH4mKxaPA4gnKqVaITm
   tN/pN84CsdYj4UvHX/GbV/OBmZsYwA17EYzpt5Opz0En8r8QE+jWDUxRY
   is9+poWs0JBaSDJSP1iez6AK63yoy3frtI4KUOEW52nMN8HO+0VEJueZ3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="329321873"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="329321873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 08:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="727625533"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="727625533"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 May 2023 08:16:45 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puahI-000012-0C;
	Thu, 04 May 2023 15:16:44 +0000
Date: Thu, 4 May 2023 23:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>
Subject: [linux-next:master 14552/14714] mm/gup.c:2813:14: error: implicit
 declaration of function 'folio_fast_pin_allowed'; did you mean
 'folio_test_pinned'?
Message-ID: <202305042329.Gyk53keD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
commit: 848839c209785a44524fdafa04b0464cd453da1f [14552/14714] mm-gup-disallow-foll_longterm-gup-fast-writing-to-file-backed-mappings-fix
config: mips-maltaup_xpa_defconfig (https://download.01.org/0day-ci/archive/20230504/202305042329.Gyk53keD-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=848839c209785a44524fdafa04b0464cd453da1f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 848839c209785a44524fdafa04b0464cd453da1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042329.Gyk53keD-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/gup.c: In function 'gup_huge_pmd':
>> mm/gup.c:2813:14: error: implicit declaration of function 'folio_fast_pin_allowed'; did you mean 'folio_test_pinned'? [-Werror=implicit-function-declaration]
    2813 |         if (!folio_fast_pin_allowed(folio, flags)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~
         |              folio_test_pinned
   cc1: some warnings being treated as errors


vim +2813 mm/gup.c

cbd34da7dc9afd Christoph Hellwig       2019-07-11  2782  
2667f50e8b8145 Steve Capper            2014-10-09  2783  static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
0cd22afdcea21f John Hubbard            2019-10-18  2784  			unsigned long end, unsigned int flags,
0cd22afdcea21f John Hubbard            2019-10-18  2785  			struct page **pages, int *nr)
2667f50e8b8145 Steve Capper            2014-10-09  2786  {
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2787) 	struct page *page;
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2788) 	struct folio *folio;
2667f50e8b8145 Steve Capper            2014-10-09  2789  	int refs;
2667f50e8b8145 Steve Capper            2014-10-09  2790  
b798bec4741bdd Ira Weiny               2019-05-13  2791  	if (!pmd_access_permitted(orig, flags & FOLL_WRITE))
2667f50e8b8145 Steve Capper            2014-10-09  2792  		return 0;
2667f50e8b8145 Steve Capper            2014-10-09  2793  
7af75561e17132 Ira Weiny               2019-05-13  2794  	if (pmd_devmap(orig)) {
7af75561e17132 Ira Weiny               2019-05-13  2795  		if (unlikely(flags & FOLL_LONGTERM))
7af75561e17132 Ira Weiny               2019-05-13  2796  			return 0;
86dfbed49f88fd John Hubbard            2020-04-01  2797  		return __gup_device_huge_pmd(orig, pmdp, addr, end, flags,
86dfbed49f88fd John Hubbard            2020-04-01  2798  					     pages, nr);
7af75561e17132 Ira Weiny               2019-05-13  2799  	}
b59f65fa076a8e Kirill A. Shutemov      2017-03-16  2800  
c228afb11ac693 Matthew Wilcox (Oracle  2022-01-07  2801) 	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
a43e982082c24c John Hubbard            2020-01-30  2802  	refs = record_subpages(page, addr, end, pages + *nr);
2667f50e8b8145 Steve Capper            2014-10-09  2803  
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2804) 	folio = try_grab_folio(page, refs, flags);
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2805) 	if (!folio)
2667f50e8b8145 Steve Capper            2014-10-09  2806  		return 0;
2667f50e8b8145 Steve Capper            2014-10-09  2807  
2667f50e8b8145 Steve Capper            2014-10-09  2808  	if (unlikely(pmd_val(orig) != pmd_val(*pmdp))) {
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2809) 		gup_put_folio(folio, refs, flags);
2667f50e8b8145 Steve Capper            2014-10-09  2810  		return 0;
2667f50e8b8145 Steve Capper            2014-10-09  2811  	}
2667f50e8b8145 Steve Capper            2014-10-09  2812  
369dd755eb2530 Lorenzo Stoakes         2023-05-02 @2813  	if (!folio_fast_pin_allowed(folio, flags)) {
369dd755eb2530 Lorenzo Stoakes         2023-05-02  2814  		gup_put_folio(folio, refs, flags);
369dd755eb2530 Lorenzo Stoakes         2023-05-02  2815  		return 0;
369dd755eb2530 Lorenzo Stoakes         2023-05-02  2816  	}
84209e87c6963f David Hildenbrand       2022-11-16  2817  	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
a7f226604170ac David Hildenbrand       2022-05-09  2818  		gup_put_folio(folio, refs, flags);
a7f226604170ac David Hildenbrand       2022-05-09  2819  		return 0;
a7f226604170ac David Hildenbrand       2022-05-09  2820  	}
a7f226604170ac David Hildenbrand       2022-05-09  2821  
a43e982082c24c John Hubbard            2020-01-30  2822  	*nr += refs;
667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2823) 	folio_set_referenced(folio);
2667f50e8b8145 Steve Capper            2014-10-09  2824  	return 1;
2667f50e8b8145 Steve Capper            2014-10-09  2825  }
2667f50e8b8145 Steve Capper            2014-10-09  2826  

:::::: The code at line 2813 was first introduced by commit
:::::: 369dd755eb25309495d67de7cd85b77e0bc0f948 mm/gup: disallow FOLL_LONGTERM GUP-fast writing to file-backed mappings

:::::: TO: Lorenzo Stoakes <lstoakes@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
