Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B327C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674470348; x=1706006348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0jn7n/PGt9nrGIhLXDXsH3fPmxitjy5YA0LPxoRCgA=;
  b=NyYCXEvGBZixr+mEihvC7w5WxdSD46Qt7zK+3oJWze3c1peqvV6uibSa
   q0o59YFqT8B3CeUS74VQKHsL5smHuYkljSQg1I360z/5Qqzlm6z6iHKSb
   meFClqEtcV1K700+V3fBeZX4iZZvctuGK8+izOLv7rxuqipVMGao03dsC
   ICkPh8hp+j/hM7tJS9qc+M6MaLPoqS5BG8ccQR/5AEaVAx98U4r5NiMtx
   n/aHsKjphsSdGbdRnSumlp8bD4V5dEtSqGwedYPbNHiRxaDrjyIX0N59M
   DFpCXBsE0kIvFjjee5WfxII6cfqfnsZUSJl/dH2YQtpCk5m83RWpKZxg+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="309588884"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="309588884"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 02:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="804038769"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="804038769"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 02:39:04 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJuEB-0005a0-2K;
	Mon, 23 Jan 2023 10:39:03 +0000
Date: Mon, 23 Jan 2023 18:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] include/linux/mmzone.h:103:56: error:
 expected expression before ',' token
Message-ID: <202301231827.2EDBeLCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   2cb3404accfc161b66866cd03c42953f57700677
commit: 2cb3404accfc161b66866cd03c42953f57700677 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: alpha-randconfig-r022-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231827.2EDBeLCC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=2cb3404accfc161b66866cd03c42953f57700677
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 2cb3404accfc161b66866cd03c42953f57700677
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/mm.h: In function 'folio_pfn':
   include/linux/mm.h:1632:41: error: expected expression before ';' token
    1632 |         return page_to_pfn(&folio->page);
         |                                         ^
   include/linux/mm.h:1632:42: error: expected ';' before '}' token
    1632 |         return page_to_pfn(&folio->page);
         |                                          ^
         |                                          ;
    1633 | }
         | ~                                         
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mm.h: In function 'is_longterm_pinnable_page':
>> include/linux/mmzone.h:103:56: error: expected expression before ',' token
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:103:56: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                                        ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:49: error: expected ')' before ';' token
    1714 |         int mt = get_pageblock_migratetype(page);
         |                                                 ^
   include/linux/mmzone.h:103:32: note: to match this '('
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                ^
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:103:9: error: too few arguments to function 'get_pfnblock_flags_mask'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:1714:18: note: in expansion of macro 'get_pageblock_migratetype'
    1714 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:18:
   include/linux/pageblock-flags.h:64:15: note: declared here
      64 | unsigned long get_pfnblock_flags_mask(const struct page *page,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/alpha/kernel/asm-offsets.c:44:1: error: expected declaration or statement at end of input
      44 | }
         | ^
   include/linux/mm.h:1714:13: warning: unused variable 'mt' [-Wunused-variable]
    1714 |         int mt = get_pageblock_migratetype(page);
         |             ^~
   arch/alpha/kernel/asm-offsets.c:44:1: error: no return statement in function returning non-void [-Werror=return-type]
      44 | }
         | ^
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/alpha/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +103 include/linux/mmzone.h

e58469bafd0524 Mel Gorman 2014-06-04  101  
dc4b0caff24d9b Mel Gorman 2014-06-04  102  #define get_pageblock_migratetype(page)					\
535b81e209219e Wei Yang   2020-08-06 @103  	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
dc4b0caff24d9b Mel Gorman 2014-06-04  104  

:::::: The code at line 103 was first introduced by commit
:::::: 535b81e209219e03f815379746bfd1eeb82d68e5 mm/page_alloc.c: remove unnecessary end_bitidx for [set|get]_pfnblock_flags_mask()

:::::: TO: Wei Yang <richard.weiyang@linux.alibaba.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
