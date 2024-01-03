Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641C71100
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 01:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2rDoPcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704245071; x=1735781071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90Mu628H6Q7CfM2ieymANMknu0zfNTaMBCy/+SAYwyI=;
  b=h2rDoPcGj/GsPS/Fex44ERjHBfLaaMTN9bYeEfQIJJc01oomfMWVKiGD
   SLK8rKhvkEPDefGcX7qRzhaD1e/iPP+9vxEi3HEnvVLiWxShcCMPyg8J7
   6bjL8vYV/5vxXpyRhXO4y1D0bNqx98wWEE5fcEqj52zSXQsEZdtdLD/wK
   hONWL14Fw7Xng7LCz38sP23As+QPXAx7S7XX8Lepn5t9ZllOPtOCcOeLq
   b+9frWku2/P7BI4KI2PPru03lgyjZv7w28xiEda7JFMg62bIvooqvQAyo
   BIrHlRohGyAH8pXtC0QX6fw+SQHNsRD4yOQVGVmN0GtmXkQEw3pthO54G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3758401"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="3758401"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 17:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="903268848"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="903268848"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Jan 2024 17:24:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKpzf-000LbI-0H;
	Wed, 03 Jan 2024 01:24:27 +0000
Date: Wed, 3 Jan 2024 09:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xfile-diet 6/15] mm/shmem.c:2135: warning: Function
 parameter or member 'sgp' not described in 'shmem_get_folio'
Message-ID: <202401030939.Qav4ieQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git xfile-diet
head:   df297669abac94d13df69f75e10209c26af361ec
commit: 17a4e396244e9d0b691e88cad95a33e2bf9af14b [6/15] shmem: export shmem_get_folio
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240103/202401030939.Qav4ieQi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401030939.Qav4ieQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401030939.Qav4ieQi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:2135: warning: Function parameter or member 'sgp' not described in 'shmem_get_folio'
>> mm/shmem.c:2135: warning: Excess function parameter 'sgp_flags' description in 'shmem_get_folio'


vim +2135 mm/shmem.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  2118  
17a4e396244e9d Christoph Hellwig       2024-01-02  2119  /**
17a4e396244e9d Christoph Hellwig       2024-01-02  2120   * shmem_get_folio - find and get a reference to a shmem folio.
17a4e396244e9d Christoph Hellwig       2024-01-02  2121   * @inode:	inode to search
17a4e396244e9d Christoph Hellwig       2024-01-02  2122   * @index:	the page index.
17a4e396244e9d Christoph Hellwig       2024-01-02  2123   * @foliop:	pointer to the found folio if one was found
17a4e396244e9d Christoph Hellwig       2024-01-02  2124   * @sgp_flags:	SGP_* flags to control behavior
17a4e396244e9d Christoph Hellwig       2024-01-02  2125   *
17a4e396244e9d Christoph Hellwig       2024-01-02  2126   * Looks up the page cache entry at @inode & @index.
17a4e396244e9d Christoph Hellwig       2024-01-02  2127   *
17a4e396244e9d Christoph Hellwig       2024-01-02  2128   * If this function returns a folio, it is returned with an increased refcount.
17a4e396244e9d Christoph Hellwig       2024-01-02  2129   *
17a4e396244e9d Christoph Hellwig       2024-01-02  2130   * Return: The found folio, %NULL if SGP_READ or SGP_NOALLOC was passed in @sgp
17a4e396244e9d Christoph Hellwig       2024-01-02  2131   * and no folio was found at @index, or an ERR_PTR() otherwise.
17a4e396244e9d Christoph Hellwig       2024-01-02  2132   */
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2133) int shmem_get_folio(struct inode *inode, pgoff_t index, struct folio **foliop,
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2134) 		enum sgp_type sgp)
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02 @2135) {
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2136) 	return shmem_get_folio_gfp(inode, index, foliop, sgp,
e3e1a5067fd2f1 Hugh Dickins            2023-09-29  2137  			mapping_gfp_mask(inode->i_mapping), NULL, NULL);
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2138) }
17a4e396244e9d Christoph Hellwig       2024-01-02  2139  EXPORT_SYMBOL_GPL(shmem_get_folio);
4e1fc793ad9892 Matthew Wilcox (Oracle  2022-09-02  2140) 

:::::: The code at line 2135 was first introduced by commit
:::::: 4e1fc793ad9892cec67b40c9f67583160e08f695 shmem: add shmem_get_folio()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
