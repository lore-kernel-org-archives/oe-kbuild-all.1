Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7FB27714
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676377570; x=1707913570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TEZ8ZruzG5z4qsOkoN+mJnsZy0t8aJXZHm6sbFL6D+E=;
  b=WTTcnv2DTQT6ojyQC2akfx3WBoeVVb+rxlpAlRptT6ntTOtcPH95QqPn
   Wuxj2VoLbbgy7N08gZj1Xpi6KhMsfJgfyN1EOPkk0486eJJoVUzb5GK+W
   yo1uXvWoEBVUFqjDB7dYsOOUO9O4w/PCHRB4CfouBO03fnAyinPFndGXg
   j+D2PDzeP7aGvEX0cjofktYUgaL3lQVaa0u6dxzaYONoi/XvH1T8gvLO0
   D/+yKUgtusA/De0U5FJeX6SlP7TxVfIif4Ym5d/ejLiHWn8NHXDEXz0PH
   GVdroqozrk818llxo18BkzhPNCDN8zPzxS9sL//PpIKI48Kh+A0d3YlHM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310780774"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="310780774"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 04:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669149502"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="669149502"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Feb 2023 04:26:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRuNr-0008UP-1b;
	Tue, 14 Feb 2023 12:26:07 +0000
Date: Tue, 14 Feb 2023 20:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kmo_codetags_v1 10/53] mm/page_alloc.c:5827: warning:
 expecting prototype for alloc_pages_exact(). Prototype was for
 _alloc_pages_exact() instead
Message-ID: <202302142025.y13WLbl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kmo_codetags_v1
head:   509acf710b1445f183ccb7aabc1ecedce6ca8ddb
commit: 8c8e05a83bbb2ad1590bc8ac280f2ab1572b7344 [10/53] mm: enable page allocation tagging
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230214/202302142025.y13WLbl7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=8c8e05a83bbb2ad1590bc8ac280f2ab1572b7344
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt kmo_codetags_v1
        git checkout 8c8e05a83bbb2ad1590bc8ac280f2ab1572b7344
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142025.y13WLbl7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:5827: warning: expecting prototype for alloc_pages_exact(). Prototype was for _alloc_pages_exact() instead
>> mm/page_alloc.c:9270: warning: expecting prototype for alloc_contig_range(). Prototype was for _alloc_contig_range() instead
>> mm/page_alloc.c:9454: warning: expecting prototype for alloc_contig_pages(). Prototype was for _alloc_contig_pages() instead
--
>> mm/mempolicy.c:2169: warning: expecting prototype for vma_alloc_folio(). Prototype was for _vma_alloc_folio() instead
>> mm/mempolicy.c:2269: warning: expecting prototype for alloc_pages(). Prototype was for _alloc_pages() instead


vim +5827 mm/page_alloc.c

ee85c2e1454603 Andi Kleen         2011-05-11  5810  
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5811  /**
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5812   * alloc_pages_exact - allocate an exact number physically-contiguous pages.
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5813   * @size: the number of bytes to allocate
63931eb97508cd Vlastimil Babka    2019-05-13  5814   * @gfp_mask: GFP flags for the allocation, must not contain __GFP_COMP
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5815   *
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5816   * This function is similar to alloc_pages(), except that it allocates the
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5817   * minimum number of pages to satisfy the request.  alloc_pages() can only
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5818   * allocate memory in power-of-two pages.
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5819   *
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5820   * This function is also limited by MAX_ORDER.
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5821   *
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5822   * Memory allocated by this function must be released by free_pages_exact().
a862f68a8b3600 Mike Rapoport      2019-03-05  5823   *
a862f68a8b3600 Mike Rapoport      2019-03-05  5824   * Return: pointer to the allocated area or %NULL in case of error.
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5825   */
8c8e05a83bbb2a Suren Baghdasaryan 2022-07-31  5826  void *_alloc_pages_exact(size_t size, gfp_t gfp_mask)
2be0ffe2b29bd3 Timur Tabi         2008-07-23 @5827  {
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5828  	unsigned int order = get_order(size);
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5829  	unsigned long addr;
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5830  
ba7f1b9e3fd9a2 Miaohe Lin         2021-11-05  5831  	if (WARN_ON_ONCE(gfp_mask & (__GFP_COMP | __GFP_HIGHMEM)))
ba7f1b9e3fd9a2 Miaohe Lin         2021-11-05  5832  		gfp_mask &= ~(__GFP_COMP | __GFP_HIGHMEM);
63931eb97508cd Vlastimil Babka    2019-05-13  5833  
8c8e05a83bbb2a Suren Baghdasaryan 2022-07-31  5834  	addr = _get_free_pages(gfp_mask, order);
ee85c2e1454603 Andi Kleen         2011-05-11  5835  	return make_alloc_exact(addr, order, size);
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5836  }
8c8e05a83bbb2a Suren Baghdasaryan 2022-07-31  5837  EXPORT_SYMBOL(_alloc_pages_exact);
2be0ffe2b29bd3 Timur Tabi         2008-07-23  5838  

:::::: The code at line 5827 was first introduced by commit
:::::: 2be0ffe2b29bd31d3debd0877797892ff2d91f4c mm: add alloc_pages_exact() and free_pages_exact()

:::::: TO: Timur Tabi <timur@freescale.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
