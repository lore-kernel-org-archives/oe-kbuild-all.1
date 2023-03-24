Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A68525F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679660898; x=1711196898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bj2wGLDUkyzJKrD5t65t2ML1HC1u4hulruUloRKcFZo=;
  b=MdB7GhovjjcCnwupLAPfpf3IUspSEewy+Ovb8SHPU0UYRVJ6q2YPhqd3
   G3WBddviEy/IVo1EbqOI0PMVI8YLW1qP/W3ylKusK6jOucWD2qrC5fGt6
   SJoyLovGTCiaxSTseG6eRh6WyLon3wQmR+Oj6X1f/culKSyPs5zHoohom
   Z3wwkOdWNTddt3vH7Hfvgzjj1X4RdkeJIz3LR4NB8BELR0Ww9D8jC9rTJ
   Bc7FQyprd1PlV7pkAqxVU495mzPhNFiLmydal1KRmPDns8IpG0bqRMijk
   nydyQXaUa0aUe9yrE/ZxJR37lVKAykk0AfaDVi/z+2vxrFlKW8yeYgRmM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338486323"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="338486323"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 05:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682685074"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="682685074"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Mar 2023 05:28:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfgWk-000FIq-24;
	Fri, 24 Mar 2023 12:28:14 +0000
Date: Fri, 24 Mar 2023 20:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Bernard Metzler <BMT@zurich.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-rdma@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RDMA/rxe: Pass a pointer to virt_to_page()
Message-ID: <202303242000.HmTaa6yB-lkp@intel.com>
References: <20230324103252.712107-1-linus.walleij@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324103252.712107-1-linus.walleij@linaro.org>

Hi Linus,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/RDMA-rxe-Pass-a-pointer-to-virt_to_page/20230324-183329
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20230324103252.712107-1-linus.walleij%40linaro.org
patch subject: [PATCH] RDMA/rxe: Pass a pointer to virt_to_page()
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230324/202303242000.HmTaa6yB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f162d87e28eb5241d1a0e2085b80bfc70f626536
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linus-Walleij/RDMA-rxe-Pass-a-pointer-to-virt_to_page/20230324-183329
        git checkout f162d87e28eb5241d1a0e2085b80bfc70f626536
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/infiniband/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242000.HmTaa6yB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/page.h:181,
                    from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from include/linux/libnvdimm.h:14,
                    from drivers/infiniband/sw/rxe/rxe_mr.c:7:
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_set_page':
>> drivers/infiniband/sw/rxe/rxe_mr.c:216:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     216 |         struct page *page = virt_to_page((void *)(iova & mr->page_mask));
         |                                          ^
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/parisc/include/asm/page.h:179:45: note: in expansion of macro '__pa'
     179 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   drivers/infiniband/sw/rxe/rxe_mr.c:216:29: note: in expansion of macro 'virt_to_page'
     216 |         struct page *page = virt_to_page((void *)(iova & mr->page_mask));
         |                             ^~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_copy_dma':
   drivers/infiniband/sw/rxe/rxe_mr.c:291:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     291 |                 page = virt_to_page((void *)(iova & mr->page_mask));
         |                                     ^
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/parisc/include/asm/page.h:179:45: note: in expansion of macro '__pa'
     179 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   drivers/infiniband/sw/rxe/rxe_mr.c:291:24: note: in expansion of macro 'virt_to_page'
     291 |                 page = virt_to_page((void *)(iova & mr->page_mask));
         |                        ^~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_do_atomic_op':
   drivers/infiniband/sw/rxe/rxe_mr.c:491:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     491 |                 page = virt_to_page((void *)(iova & PAGE_MASK));
         |                                     ^
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/parisc/include/asm/page.h:179:45: note: in expansion of macro '__pa'
     179 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   drivers/infiniband/sw/rxe/rxe_mr.c:491:24: note: in expansion of macro 'virt_to_page'
     491 |                 page = virt_to_page((void *)(iova & PAGE_MASK));
         |                        ^~~~~~~~~~~~


vim +216 drivers/infiniband/sw/rxe/rxe_mr.c

   212	
   213	static int rxe_set_page(struct ib_mr *ibmr, u64 iova)
   214	{
   215		struct rxe_mr *mr = to_rmr(ibmr);
 > 216		struct page *page = virt_to_page((void *)(iova & mr->page_mask));
   217		bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);
   218		int err;
   219	
   220		if (persistent && !is_pmem_page(page)) {
   221			rxe_dbg_mr(mr, "Page cannot be persistent\n");
   222			return -EINVAL;
   223		}
   224	
   225		if (unlikely(mr->nbuf == mr->num_buf))
   226			return -ENOMEM;
   227	
   228		err = xa_err(xa_store(&mr->page_list, mr->nbuf, page, GFP_KERNEL));
   229		if (err)
   230			return err;
   231	
   232		mr->nbuf++;
   233		return 0;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
