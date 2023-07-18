Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FBC2F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689685670; x=1721221670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gJleaOWTGuTE3MU77NaJ02dbgkqBFW2G5NXnrsNmUQ=;
  b=S3pE5ezMavrr9PdQqNPToT/d5+raBKsuPDC78VtFlXidvh2vctxFd6Fc
   WjZprlOyVXu4y1yNmBNtFPPafHwTF5Aoh801Z18N/nst6dzD4L3Dxq9ZA
   mBbXWfM78P+87VSCOHx6jDqL8i5DJU9sH4TKacGmcIEJXrlHVIQukLTF+
   Wi6ugoikuAqUwDtfpXSY9SkuoDXfvwnkGvbHxV7Xyq1azLjl3UACB/4Wd
   HyYuNiTt3L/Ep4IImZY2nohaWRiq/vnhLfQjLM6FMuzHSfFB0YQsZSD8t
   62nWCsorkuUOApthfn5CvHSvQM1VWPuiFffTKYQexyZ/U6t5pb/mss1p6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397039738"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="397039738"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 06:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="700891569"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="700891569"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 06:07:44 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLkQZ-0000cJ-2j;
	Tue, 18 Jul 2023 13:07:43 +0000
Date: Tue, 18 Jul 2023 21:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: oe-kbuild-all@lists.linux.dev, Hu Haowen <src.res.211@gmail.com>
Subject: [srcres258-doc:next 1/1] mm/memory-failure.c:1891:6: error:
 redefinition of 'is_raw_hwpoison_page_in_hugepage'
Message-ID: <202307182103.snSzUhrN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/srcres258/linux-doc next
head:   1f94ea418de902796fa65b97c7138c5c6dff13dc
commit: 1f94ea418de902796fa65b97c7138c5c6dff13dc [1/1] Merge commit '899cbd7b84da84d430b58d3bab82314e7f41c71d' into next
config: arm64-randconfig-r002-20230718 (https://download.01.org/0day-ci/archive/20230718/202307182103.snSzUhrN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307182103.snSzUhrN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307182103.snSzUhrN-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory-failure.c: In function '__is_raw_hwp_subpage':
   mm/memory-failure.c:1845:24: error: implicit declaration of function 'raw_hwp_list_head' [-Werror=implicit-function-declaration]
    1845 |         raw_hwp_head = raw_hwp_list_head(folio);
         |                        ^~~~~~~~~~~~~~~~~
   mm/memory-failure.c:1845:22: warning: assignment to 'struct llist_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1845 |         raw_hwp_head = raw_hwp_list_head(folio);
         |                      ^
   mm/memory-failure.c: In function 'is_raw_hwpoison_page_in_hugepage':
   mm/memory-failure.c:1878:22: warning: assignment to 'struct llist_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1878 |         raw_hwp_head = raw_hwp_list_head(folio);
         |                      ^
   mm/memory-failure.c: At top level:
>> mm/memory-failure.c:1891:6: error: redefinition of 'is_raw_hwpoison_page_in_hugepage'
    1891 | bool is_raw_hwpoison_page_in_hugepage(struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-failure.c:1856:6: note: previous definition of 'is_raw_hwpoison_page_in_hugepage' with type 'bool(struct page *)' {aka '_Bool(struct page *)'}
    1856 | bool is_raw_hwpoison_page_in_hugepage(struct page *page)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-failure.c: In function 'is_raw_hwpoison_page_in_hugepage':
   mm/memory-failure.c:1913:22: warning: assignment to 'struct llist_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1913 |         raw_hwp_head = raw_hwp_list_head(folio);
         |                      ^
   mm/memory-failure.c: In function '__folio_free_raw_hwp':
   mm/memory-failure.c:1931:30: warning: passing argument 1 of 'llist_del_all' makes pointer from integer without a cast [-Wint-conversion]
    1931 |         head = llist_del_all(raw_hwp_list_head(folio));
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
         |                              |
         |                              int
   In file included from include/linux/smp_types.h:5,
                    from include/linux/smp.h:15,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/memory-failure.c:40:
   include/linux/llist.h:237:67: note: expected 'struct llist_head *' but argument is of type 'int'
     237 | static inline struct llist_node *llist_del_all(struct llist_head *head)
         |                                                ~~~~~~~~~~~~~~~~~~~^~~~
   mm/memory-failure.c: In function 'folio_set_hugetlb_hwpoison':
   mm/memory-failure.c:1959:14: warning: assignment to 'struct llist_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1959 |         head = raw_hwp_list_head(folio);
         |              ^
   cc1: some warnings being treated as errors


vim +/is_raw_hwpoison_page_in_hugepage +1891 mm/memory-failure.c

161df60e9e8965 Naoya Horiguchi 2022-07-14  1890  
6877d647d86cd0 Jiaqi Yan       2023-07-13 @1891  bool is_raw_hwpoison_page_in_hugepage(struct page *page)
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1892  {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1893  	struct llist_head *raw_hwp_head;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1894  	struct raw_hwp_page *p;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1895  	struct folio *folio = page_folio(page);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1896  	bool ret = false;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1897  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1898  	if (!folio_test_hwpoison(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1899  		return false;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1900  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1901  	if (!folio_test_hugetlb(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1902  		return PageHWPoison(page);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1903  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1904  	/*
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1905  	 * When RawHwpUnreliable is set, kernel lost track of which subpages
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1906  	 * are HWPOISON. So return as if ALL subpages are HWPOISONed.
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1907  	 */
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1908  	if (folio_test_hugetlb_raw_hwp_unreliable(folio))
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1909  		return true;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1910  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1911  	mutex_lock(&mf_mutex);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1912  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1913  	raw_hwp_head = raw_hwp_list_head(folio);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1914  	llist_for_each_entry(p, raw_hwp_head->first, node) {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1915  		if (page == p->page) {
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1916  			ret = true;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1917  			break;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1918  		}
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1919  	}
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1920  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1921  	mutex_unlock(&mf_mutex);
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1922  
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1923  	return ret;
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1924  }
14bdaafea3f2ec Jiaqi Yan       2023-07-13  1925  

:::::: The code at line 1891 was first introduced by commit
:::::: 6877d647d86cd0ed29687ce09f3a5787a6553c54 mm/hwpoison: check if a raw page in a hugetlb folio is raw HWPOISON

:::::: TO: Jiaqi Yan <jiaqiyan@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
