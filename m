Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E98479
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 18:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674496817; x=1706032817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bIGEk1/sEcosBDYz09ZMNIwpzyCxZ7R7pHNIWyWKFuo=;
  b=HZf+DGnwYOgC05r+YsmB+6GGhpeOnZy9HgxeA/1ZQGt5bKH4zJY0d0jb
   WqtL2fsguiAc9i7MDSgn/fvQmUCkV52SFq8xr5H68pzLhv8uKkCYjeGYL
   N0kDNWmcqWHMhRNZxq4jqXx8TGNldbJkab3AJQs25uUlbPlTRZPFBcRAJ
   pLD3LuwU5bM3CK4vDE4lavrNBbh3uOHdL60/SgnInE0eyqmgw5dtpsSHE
   QoVdGNgkUvkOobXk5CK/k1CLNQGEmqtqFeq2l5c7jjjh8irCDLGPQZbs+
   Yi+qgJmtxMo8293LnMz9V6q5RkK0vUMk6YpeKLwL+5mXsk1MVL2azCLTi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388457608"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="388457608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663757698"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="663757698"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 10:00:15 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK178-0005no-2y;
	Mon, 23 Jan 2023 18:00:14 +0000
Date: Tue, 24 Jan 2023 01:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:misc/pfn_valid/v0 1/1] kernel/iomem.c:36:13: error: implicit
 declaration of function 'pfn_valid'; did you mean 'pfn_folio'?
Message-ID: <202301240130.eWbFucf0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git misc/pfn_valid/v0
head:   80b44d294c92a4d3645936e12178b4d2c475a641
commit: 80b44d294c92a4d3645936e12178b4d2c475a641 [1/1] mm, arch: add generic implementation of pfn_valid() for FLATMEM
config: m68k-randconfig-r031-20230123 (https://download.01.org/0day-ci/archive/20230124/202301240130.eWbFucf0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/commit/?id=80b44d294c92a4d3645936e12178b4d2c475a641
        git remote add rppt https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git
        git fetch --no-tags rppt misc/pfn_valid/v0
        git checkout 80b44d294c92a4d3645936e12178b4d2c475a641
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/dax/ drivers/media/common/videobuf2/ kernel/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/iomem.c:9:22: warning: no previous prototype for 'ioremap_cache' [-Wmissing-prototypes]
       9 | __weak void __iomem *ioremap_cache(resource_size_t offset, unsigned long size)
         |                      ^~~~~~~~~~~~~
   kernel/iomem.c: In function 'try_ram_remap':
>> kernel/iomem.c:36:13: error: implicit declaration of function 'pfn_valid'; did you mean 'pfn_folio'? [-Werror=implicit-function-declaration]
      36 |         if (pfn_valid(pfn) && !PageHighMem(pfn_to_page(pfn)) &&
         |             ^~~~~~~~~
         |             pfn_folio
   cc1: some warnings being treated as errors
--
   In file included from include/linux/mmzone.h:1269,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from mm/vmstat.c:13:
   mm/vmstat.c: In function 'pagetypeinfo_showblockcount_print':
>> include/linux/memory_hotplug.h:230:13: error: implicit declaration of function 'pfn_valid'; did you mean 'pfn_folio'? [-Werror=implicit-function-declaration]
     230 |         if (pfn_valid(pfn))                     \
         |             ^~~~~~~~~
   mm/vmstat.c:1553:24: note: in expansion of macro 'pfn_to_online_page'
    1553 |                 page = pfn_to_online_page(pfn);
         |                        ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   mm/page_alloc.c: In function 'reserve_bootmem_region':
>> mm/page_alloc.c:1676:21: error: implicit declaration of function 'pfn_valid'; did you mean 'pfn_folio'? [-Werror=implicit-function-declaration]
    1676 |                 if (pfn_valid(start_pfn)) {
         |                     ^~~~~~~~~
         |                     pfn_folio
   cc1: some warnings being treated as errors
--
   In file included from include/linux/mmzone.h:1269,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/shuffle.c:4:
   mm/shuffle.c: In function 'shuffle_valid_page':
>> include/linux/memory_hotplug.h:230:13: error: implicit declaration of function 'pfn_valid'; did you mean 'pfn_folio'? [-Werror=implicit-function-declaration]
     230 |         if (pfn_valid(pfn))                     \
         |             ^~~~~~~~~
   mm/shuffle.c:39:29: note: in expansion of macro 'pfn_to_online_page'
      39 |         struct page *page = pfn_to_online_page(pfn);
         |                             ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/dax/super.c:10:
   include/linux/pfn_t.h: In function 'pfn_t_valid':
>> include/linux/pfn_t.h:76:16: error: implicit declaration of function 'pfn_valid'; did you mean 'pfn_t_valid'? [-Werror=implicit-function-declaration]
      76 |         return pfn_valid(pfn_t_to_pfn(pfn));
         |                ^~~~~~~~~
         |                pfn_t_valid
   drivers/dax/super.c: At top level:
   drivers/dax/super.c:337:6: warning: no previous prototype for 'run_dax' [-Wmissing-prototypes]
     337 | void run_dax(struct dax_device *dax_dev)
         |      ^~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/common/videobuf2/frame_vector.c: In function 'frame_vector_to_pages':
>> drivers/media/common/videobuf2/frame_vector.c:118:22: error: implicit declaration of function 'pfn_valid'; did you mean 'pfn_folio'? [-Werror=implicit-function-declaration]
     118 |                 if (!pfn_valid(nums[i]))
         |                      ^~~~~~~~~
         |                      pfn_folio
   cc1: some warnings being treated as errors


vim +36 kernel/iomem.c

5981690ddb8f72 Dan Williams 2018-03-29  29  
5981690ddb8f72 Dan Williams 2018-03-29  30  static void *try_ram_remap(resource_size_t offset, size_t size,
5981690ddb8f72 Dan Williams 2018-03-29  31  			   unsigned long flags)
5981690ddb8f72 Dan Williams 2018-03-29  32  {
5981690ddb8f72 Dan Williams 2018-03-29  33  	unsigned long pfn = PHYS_PFN(offset);
5981690ddb8f72 Dan Williams 2018-03-29  34  
5981690ddb8f72 Dan Williams 2018-03-29  35  	/* In the simple case just return the existing linear address */
5981690ddb8f72 Dan Williams 2018-03-29 @36  	if (pfn_valid(pfn) && !PageHighMem(pfn_to_page(pfn)) &&
5981690ddb8f72 Dan Williams 2018-03-29  37  	    arch_memremap_can_ram_remap(offset, size, flags))
5981690ddb8f72 Dan Williams 2018-03-29  38  		return __va(offset);
5981690ddb8f72 Dan Williams 2018-03-29  39  
5981690ddb8f72 Dan Williams 2018-03-29  40  	return NULL; /* fallback to arch_memremap_wb */
5981690ddb8f72 Dan Williams 2018-03-29  41  }
5981690ddb8f72 Dan Williams 2018-03-29  42  

:::::: The code at line 36 was first introduced by commit
:::::: 5981690ddb8f72f9546a2d017a914cf56095fc1f memremap: split devm_memremap_pages() and memremap() infrastructure

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
