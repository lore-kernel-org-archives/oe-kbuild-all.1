Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C3A31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 03:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674530618; x=1706066618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DlCNJ5UotSwpS/O67UymT8y2clmnDIFFBZFl26cMzv8=;
  b=hcfe2XvUG8dq4o4e4cDbAjh/55qtvB16tK5dyUWzFR5fxogsPuaEKr+R
   AvSI5j3sABDV3Kt0Djeymm8vh9NUSeJDLhiiIf+raWYEZaY3qNlEk0JAI
   GCUHfIhKU297wDoa3yfCJXrFTTplEfmZkl2rd7hjDRCVc3oqXlwub++LG
   8BKO1+gkh+7OZ8sJkemQm4SXQEBrI5FkDiNP162cJuYZwg7mk9ZyLWDsY
   VNEHFDXvUF3p+k7x3XSOh5h6BprhhF0BpbvkqG2FjWUKrchq5pA/mU9mN
   mB/OmS7VBccZSsh1pWEYxB2l8ZAVG/hPMDO/5I8rHpMIUd+J6EPpAGikn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305884415"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="305884415"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804430034"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="804430034"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 19:23:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK9uI-00065U-1u;
	Tue, 24 Jan 2023 03:23:34 +0000
Date: Tue, 24 Jan 2023 11:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH mm-unstable v2 1/6] mm: Add folio_estimated_mapcount()
Message-ID: <202301241100.GAjve4Wl-lkp@intel.com>
References: <20230124012210.13963-2-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124012210.13963-2-vishal.moola@gmail.com>

Hi Vishal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20230123]
[cannot apply to linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/mm-Add-folio_estimated_mapcount/20230124-092349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230124012210.13963-2-vishal.moola%40gmail.com
patch subject: [PATCH mm-unstable v2 1/6] mm: Add folio_estimated_mapcount()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301241100.GAjve4Wl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ec1fab96da69cd5e71330186987468d7d1a2595
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/mm-Add-folio_estimated_mapcount/20230124-092349
        git checkout 2ec1fab96da69cd5e71330186987468d7d1a2595
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/page.h:93,
                    from include/linux/shm.h:6,
                    from include/linux/sched.h:16,
                    from arch/alpha/kernel/asm-offsets.c:10:
   include/linux/mm.h: In function 'folio_estimated_mapcount':
>> include/asm-generic/memory_model.h:35:21: error: implicit declaration of function 'page_to_section'; did you mean 'present_section'? [-Werror=implicit-function-declaration]
      35 |         int __sec = page_to_section(__pg);                      \
         |                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:40:32: note: in definition of macro '__pfn_to_page'
      40 | ({      unsigned long __pfn = (pfn);                    \
         |                                ^~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:216:38: note: in expansion of macro 'page_to_pfn'
     216 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:286:33: note: in expansion of macro 'nth_page'
     286 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/mm.h:918:30: note: in expansion of macro 'folio_page'
     918 |         return page_mapcount(folio_page(folio, 0));
         |                              ^~~~~~~~~~
   In file included from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:11:
   include/linux/mm.h: At top level:
>> include/linux/mm.h:1626:29: error: conflicting types for 'page_to_section'; have 'long unsigned int(const struct page *)'
    1626 | static inline unsigned long page_to_section(const struct page *page)
         |                             ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:35:21: note: previous implicit declaration of 'page_to_section' with type 'int()'
      35 |         int __sec = page_to_section(__pg);                      \
         |                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:40:32: note: in definition of macro '__pfn_to_page'
      40 | ({      unsigned long __pfn = (pfn);                    \
         |                                ^~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:216:38: note: in expansion of macro 'page_to_pfn'
     216 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:286:33: note: in expansion of macro 'nth_page'
     286 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/mm.h:918:30: note: in expansion of macro 'folio_page'
     918 |         return page_mapcount(folio_page(folio, 0));
         |                              ^~~~~~~~~~
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/alpha/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1626 include/linux/mm.h

bf4e8902ee5080 Daniel Kiper      2011-05-24  1625  
aa462abe8aaf21 Ian Campbell      2011-08-17 @1626  static inline unsigned long page_to_section(const struct page *page)
d41dee369bff3b Andy Whitcroft    2005-06-23  1627  {
d41dee369bff3b Andy Whitcroft    2005-06-23  1628  	return (page->flags >> SECTIONS_PGSHIFT) & SECTIONS_MASK;
d41dee369bff3b Andy Whitcroft    2005-06-23  1629  }
308c05e35e3517 Christoph Lameter 2008-04-28  1630  #endif
d41dee369bff3b Andy Whitcroft    2005-06-23  1631  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
