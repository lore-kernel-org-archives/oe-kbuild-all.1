Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2E23AF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677673580; x=1709209580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKvAdjz+47cZZqz8vhsJGQAYLSqrNTAq8hFcqorg3Fk=;
  b=C3fJW0dNu0kGMfn/63iOkxHcLSD17giNZUU/3zK+H5gtATeWMlTIJ19a
   wBOVv+F0135iM0y22wEVnv52zkETALqaWporVJmwqqsfq0+HMd4gzrdWC
   Ov5sUqSlWmn3zYvPL9eds6MbsBXZ3mZWwZUxfGNvQUypJLRvCLbXYk9lB
   38AoDpKXVEfV5WFFUvZL6+yBE7stOWeuqWiMsBrnl5GFd1UXtSVtHSqoH
   Q/viw7savsbUjMAMTETErtMb0Nl8wpLNKCPXnXy7NveMw5H+EVw48VKKU
   QAzK7rWRntS/62/JV8WY4Z3V5DInX1GXtcrPGz9oGpls4YnND2EkmtfFN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="318195076"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="318195076"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 04:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676738625"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="676738625"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2023 04:26:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXLXE-00068f-1p;
	Wed, 01 Mar 2023 12:26:16 +0000
Date: Wed, 1 Mar 2023 20:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slab-remove-slob-v1 6/7] mm/slab.h:779:5: error: field
 'cache_random_seq_create' declared as a function
Message-ID: <202303012059.QGSJHkWc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-remove-slob-v1
head:   e612d206dc6302016d027138e6857c4e2849dd27
commit: 61d6f1c8051ee45121060b42aa414cdee228fadd [6/7] mm/slab: remove CONFIG_SLOB code from slab common code
config: loongarch-randconfig-r005-20230227 (https://download.01.org/0day-ci/archive/20230301/202303012059.QGSJHkWc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/commit/?id=61d6f1c8051ee45121060b42aa414cdee228fadd
        git remote add vbabka https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git
        git fetch --no-tags vbabka slab-remove-slob-v1
        git checkout 61d6f1c8051ee45121060b42aa414cdee228fadd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012059.QGSJHkWc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slab_common.c:30:
   mm/slab.h:769:6: error: field 'dump_unreclaimable_slab' declared as a function
     769 | void dump_unreclaimable_slab(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:776:6: error: field '___cache_free' declared as a function
     776 | void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr);
         |      ^~~~~~~~~~~~~
>> mm/slab.h:779:5: error: field 'cache_random_seq_create' declared as a function
     779 | int cache_random_seq_create(struct kmem_cache *cachep, unsigned int count,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab.h:781:6: error: field 'cache_random_seq_destroy' declared as a function
     781 | void cache_random_seq_destroy(struct kmem_cache *cachep);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.h:791:1: error: expected specifier-qualifier-list before 'static'
     791 | static inline bool slab_want_init_on_alloc(gfp_t flags, struct kmem_cache *c)
         | ^~~~~~


vim +/cache_random_seq_create +779 mm/slab.h

55834c59098d0c Alexander Potapenko 2016-05-20  777  
7c00fce98c3e15 Thomas Garnier      2016-07-26  778  #ifdef CONFIG_SLAB_FREELIST_RANDOM
7c00fce98c3e15 Thomas Garnier      2016-07-26 @779  int cache_random_seq_create(struct kmem_cache *cachep, unsigned int count,
7c00fce98c3e15 Thomas Garnier      2016-07-26  780  			gfp_t gfp);
7c00fce98c3e15 Thomas Garnier      2016-07-26 @781  void cache_random_seq_destroy(struct kmem_cache *cachep);
7c00fce98c3e15 Thomas Garnier      2016-07-26  782  #else
7c00fce98c3e15 Thomas Garnier      2016-07-26  783  static inline int cache_random_seq_create(struct kmem_cache *cachep,
7c00fce98c3e15 Thomas Garnier      2016-07-26  784  					unsigned int count, gfp_t gfp)
7c00fce98c3e15 Thomas Garnier      2016-07-26  785  {
7c00fce98c3e15 Thomas Garnier      2016-07-26  786  	return 0;
7c00fce98c3e15 Thomas Garnier      2016-07-26  787  }
7c00fce98c3e15 Thomas Garnier      2016-07-26  788  static inline void cache_random_seq_destroy(struct kmem_cache *cachep) { }
7c00fce98c3e15 Thomas Garnier      2016-07-26  789  #endif /* CONFIG_SLAB_FREELIST_RANDOM */
7c00fce98c3e15 Thomas Garnier      2016-07-26  790  

:::::: The code at line 779 was first introduced by commit
:::::: 7c00fce98c3e15334a603925b41aa49f76e83227 mm: reorganize SLAB freelist randomization

:::::: TO: Thomas Garnier <thgarnie@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
