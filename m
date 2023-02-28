Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37343D79
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677626579; x=1709162579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DiVob1n9cj1wgpeNSM39MnXADEqYXcFD42NmUYoOglQ=;
  b=VgKbWC3Wqy8iwng0MxHrgnUdxlWqjldhKB7iy+KyUQJw65/yyUsOOA9y
   KKKWZRAGTBrPCkHsuINQmW+uz5m9cDd/Nt+b1TmZCaaS/x+sA88iLD7uO
   6ennW+nYkZ05oEcoXEFNYD1nWvl/IOwOzElSfizxXEg6kSHHEtNgXMLeC
   qqfAEJ4Fv4SbTRKJLL4hpriYvQvjVX5EdMjuOqrrc8avNp+b2RDV3ij2T
   cljiKNIUQ6nthqba1w/S/3ZxzwENSibrGBxoDVKh6F2JcL+NDhZKueTd0
   yks/rZEDIv58cEmbMriZ37MjIl4J48YQBYVXSLTuf4HgC0pJ51/UQY1lA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="335763421"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="335763421"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 15:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="798216215"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="798216215"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Feb 2023 15:22:55 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX9J8-0005iF-1I;
	Tue, 28 Feb 2023 23:22:54 +0000
Date: Wed, 1 Mar 2023 07:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slab-remove-slob-v1 6/7] mm/slab.h:769:6: error: field
 'dump_unreclaimable_slab' declared as a function
Message-ID: <202303010735.Tws8Rww1-lkp@intel.com>
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
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230301/202303010735.Tws8Rww1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/commit/?id=61d6f1c8051ee45121060b42aa414cdee228fadd
        git remote add vbabka https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git
        git fetch --no-tags vbabka slab-remove-slob-v1
        git checkout 61d6f1c8051ee45121060b42aa414cdee228fadd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010735.Tws8Rww1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
>> mm/slab.h:769:6: error: field 'dump_unreclaimable_slab' declared as a function
     769 | void dump_unreclaimable_slab(void);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> mm/slab.h:776:6: error: field '___cache_free' declared as a function
     776 | void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr);
         |      ^~~~~~~~~~~~~
>> mm/slab.h:783:1: error: expected specifier-qualifier-list before 'static'
     783 | static inline int cache_random_seq_create(struct kmem_cache *cachep,
         | ^~~~~~


vim +/dump_unreclaimable_slab +769 mm/slab.h

44c5356fb46005 Christoph Lameter   2014-08-06  767  
852d8be0ad8511 Yang Shi            2017-11-15  768  #if defined(CONFIG_SLAB) || defined(CONFIG_SLUB_DEBUG)
852d8be0ad8511 Yang Shi            2017-11-15 @769  void dump_unreclaimable_slab(void);
852d8be0ad8511 Yang Shi            2017-11-15  770  #else
852d8be0ad8511 Yang Shi            2017-11-15  771  static inline void dump_unreclaimable_slab(void)
852d8be0ad8511 Yang Shi            2017-11-15  772  {
852d8be0ad8511 Yang Shi            2017-11-15  773  }
852d8be0ad8511 Yang Shi            2017-11-15  774  #endif
852d8be0ad8511 Yang Shi            2017-11-15  775  
55834c59098d0c Alexander Potapenko 2016-05-20 @776  void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr);
55834c59098d0c Alexander Potapenko 2016-05-20  777  
7c00fce98c3e15 Thomas Garnier      2016-07-26  778  #ifdef CONFIG_SLAB_FREELIST_RANDOM
7c00fce98c3e15 Thomas Garnier      2016-07-26  779  int cache_random_seq_create(struct kmem_cache *cachep, unsigned int count,
7c00fce98c3e15 Thomas Garnier      2016-07-26  780  			gfp_t gfp);
7c00fce98c3e15 Thomas Garnier      2016-07-26  781  void cache_random_seq_destroy(struct kmem_cache *cachep);
7c00fce98c3e15 Thomas Garnier      2016-07-26  782  #else
7c00fce98c3e15 Thomas Garnier      2016-07-26 @783  static inline int cache_random_seq_create(struct kmem_cache *cachep,
7c00fce98c3e15 Thomas Garnier      2016-07-26  784  					unsigned int count, gfp_t gfp)
7c00fce98c3e15 Thomas Garnier      2016-07-26  785  {
7c00fce98c3e15 Thomas Garnier      2016-07-26  786  	return 0;
7c00fce98c3e15 Thomas Garnier      2016-07-26  787  }
7c00fce98c3e15 Thomas Garnier      2016-07-26  788  static inline void cache_random_seq_destroy(struct kmem_cache *cachep) { }
7c00fce98c3e15 Thomas Garnier      2016-07-26  789  #endif /* CONFIG_SLAB_FREELIST_RANDOM */
7c00fce98c3e15 Thomas Garnier      2016-07-26  790  

:::::: The code at line 769 was first introduced by commit
:::::: 852d8be0ad8511611eff18f28dce11d25195b654 mm: oom: show unreclaimable slab info when unreclaimable slabs > user memory

:::::: TO: Yang Shi <yang.s@alibaba-inc.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
