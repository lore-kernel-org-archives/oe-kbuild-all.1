Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C9A93A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679587241; x=1711123241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4FFmVu2Ip5A9j9wOdKmv0/aNiOJO4azIB3rm+XKnoM=;
  b=h9Gg0WIEBf83H+sso6+8ktzuG0CSOVQwtKRjPPyFpl9jjpb+HTwk0Wg/
   Iop/lmrC+6xGwb6wvAM1Q9vH88ou02wVEaXgnjWf76/RJOL2X/tkj4dU8
   nfY1RXwZjZ1W4FcI/AUJMNpXZqO0WrL/jHGDSwBtR+NNXHXo1+YwpIryj
   nbscVWIS+eneDSuFZfoisX7IjNfoecrDtTj5JdgmGIXB3HkAK+KIom5y7
   upR8b+RIwgM030srj5f9dEIsP8H5RueD9CG7rBzKhrc5libWMivRoxDcr
   glIo2p+8JjR7IgrCGbATHNS2LSWWllrGwDoBAifiOBKXsW2zy2kHvtZ/h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402114775"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402114775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 09:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1011862104"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="1011862104"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 09:00:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfNMe-000EVM-1L;
	Thu, 23 Mar 2023 16:00:32 +0000
Date: Thu, 23 Mar 2023 23:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 7/8]
 drivers/tee/tee_shm.c:35:29: warning: passing argument 1 of 'virt_to_pfn'
 makes pointer from integer without a cast
Message-ID: <202303232342.tmKswNUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: 60f9989b35b939232c61e3e886c921b38584d834 [7/8] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303232342.tmKswNUK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=60f9989b35b939232c61e3e886c921b38584d834
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout 60f9989b35b939232c61e3e886c921b38584d834
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/infiniband/sw/rxe/ drivers/tee/ fs/cifs/ fs/netfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232342.tmKswNUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/memory.h:333,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from arch/arm64/include/asm/percpu.h:8,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/tee/tee_shm.c:6:
   drivers/tee/tee_shm.c: In function 'shm_get_kernel_pages':
>> drivers/tee/tee_shm.c:35:29: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      35 |         page = virt_to_page(start);
         |                             ^~~~~
         |                             |
         |                             long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/tee/tee_shm.c:35:16: note: in expansion of macro 'virt_to_page'
      35 |         page = virt_to_page(start);
         |                ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/arm64/include/asm/memory.h:333,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from arch/arm64/include/asm/stat.h:12,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:13,
                    from fs/cifs/smbdirect.c:7:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
   fs/cifs/cifsglob.h:2216:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2216 |                             virt_to_page(addr), buflen, off);
         |                                          ^~~~
         |                                          |
         |                                          long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   fs/cifs/cifsglob.h:2216:29: note: in expansion of macro 'virt_to_page'
    2216 |                             virt_to_page(addr), buflen, off);
         |                             ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   fs/cifs/smbdirect.c: In function 'smb_extract_kvec_to_rdma':
>> fs/cifs/smbdirect.c:2503:53: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2503 |                                 page = virt_to_page(kaddr);
         |                                                     ^~~~~
         |                                                     |
         |                                                     long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   fs/cifs/smbdirect.c:2503:40: note: in expansion of macro 'virt_to_page'
    2503 |                                 page = virt_to_page(kaddr);
         |                                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/arm64/include/asm/memory.h:333,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from fs/netfs/iterator.c:9:
   fs/netfs/iterator.c: In function 'netfs_extract_kvec_to_sg':
>> fs/netfs/iterator.c:243:53: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     243 |                                 page = virt_to_page(kaddr);
         |                                                     ^~~~~
         |                                                     |
         |                                                     long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   fs/netfs/iterator.c:243:40: note: in expansion of macro 'virt_to_page'
     243 |                                 page = virt_to_page(kaddr);
         |                                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/arm64/include/asm/memory.h:333,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/libnvdimm.h:13,
                    from drivers/infiniband/sw/rxe/rxe_mr.c:7:
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_set_page':
>> drivers/infiniband/sw/rxe/rxe_mr.c:216:47: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     216 |         struct page *page = virt_to_page(iova & mr->page_mask);
         |                                          ~~~~~^~~~~~~~~~~~~~~
         |                                               |
         |                                               u64 {aka long long unsigned int}
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/infiniband/sw/rxe/rxe_mr.c:216:29: note: in expansion of macro 'virt_to_page'
     216 |         struct page *page = virt_to_page(iova & mr->page_mask);
         |                             ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'u64' {aka 'long long unsigned int'}
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_copy_dma':
   drivers/infiniband/sw/rxe/rxe_mr.c:291:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     291 |                 page = virt_to_page(iova & mr->page_mask);
         |                                     ~~~~~^~~~~~~~~~~~~~~
         |                                          |
         |                                          u64 {aka long long unsigned int}
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/infiniband/sw/rxe/rxe_mr.c:291:24: note: in expansion of macro 'virt_to_page'
     291 |                 page = virt_to_page(iova & mr->page_mask);
         |                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'u64' {aka 'long long unsigned int'}
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_do_atomic_op':
   drivers/infiniband/sw/rxe/rxe_mr.c:491:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     491 |                 page = virt_to_page(iova & PAGE_MASK);
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/infiniband/sw/rxe/rxe_mr.c:491:24: note: in expansion of macro 'virt_to_page'
     491 |                 page = virt_to_page(iova & PAGE_MASK);
         |                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'long long unsigned int'
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   drivers/infiniband/sw/rxe/rxe_mr.c: In function 'rxe_mr_do_atomic_write':
   drivers/infiniband/sw/rxe/rxe_mr.c:548:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     548 |                 page = virt_to_page(iova & PAGE_MASK);
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   drivers/infiniband/sw/rxe/rxe_mr.c:548:24: note: in expansion of macro 'virt_to_page'
     548 |                 page = virt_to_page(iova & PAGE_MASK);
         |                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:335:53: note: expected 'const void *' but argument is of type 'long long unsigned int'
     335 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +35 drivers/tee/tee_shm.c

967c9cca2cc505 Jens Wiklander 2015-03-11  @6  #include <linux/device.h>
967c9cca2cc505 Jens Wiklander 2015-03-11   7  #include <linux/idr.h>
dfd0743f1d9ea7 Jens Wiklander 2021-12-09   8  #include <linux/mm.h>
967c9cca2cc505 Jens Wiklander 2015-03-11   9  #include <linux/sched.h>
967c9cca2cc505 Jens Wiklander 2015-03-11  10  #include <linux/slab.h>
967c9cca2cc505 Jens Wiklander 2015-03-11  11  #include <linux/tee_drv.h>
eccd7439709810 Jens Wiklander 2022-08-22  12  #include <linux/uaccess.h>
2a6ba3f794e892 Sumit Garg     2020-03-27  13  #include <linux/uio.h>
0249a75b365911 Ira Weiny      2023-02-03  14  #include <linux/highmem.h>
967c9cca2cc505 Jens Wiklander 2015-03-11  15  #include "tee_private.h"
967c9cca2cc505 Jens Wiklander 2015-03-11  16  
53e16519c2eccd Jens Wiklander 2022-02-04  17  static void shm_put_kernel_pages(struct page **pages, size_t page_count)
4300cd6374a519 John Hubbard   2020-08-24  18  {
4300cd6374a519 John Hubbard   2020-08-24  19  	size_t n;
4300cd6374a519 John Hubbard   2020-08-24  20  
53e16519c2eccd Jens Wiklander 2022-02-04  21  	for (n = 0; n < page_count; n++)
53e16519c2eccd Jens Wiklander 2022-02-04  22  		put_page(pages[n]);
53e16519c2eccd Jens Wiklander 2022-02-04  23  }
53e16519c2eccd Jens Wiklander 2022-02-04  24  
53e16519c2eccd Jens Wiklander 2022-02-04  25  static int shm_get_kernel_pages(unsigned long start, size_t page_count,
53e16519c2eccd Jens Wiklander 2022-02-04  26  				struct page **pages)
53e16519c2eccd Jens Wiklander 2022-02-04  27  {
0249a75b365911 Ira Weiny      2023-02-03  28  	struct page *page;
53e16519c2eccd Jens Wiklander 2022-02-04  29  	size_t n;
53e16519c2eccd Jens Wiklander 2022-02-04  30  
0249a75b365911 Ira Weiny      2023-02-03  31  	if (WARN_ON_ONCE(is_vmalloc_addr((void *)start) ||
0249a75b365911 Ira Weiny      2023-02-03  32  			 is_kmap_addr((void *)start)))
c83900393aa133 Ira Weiny      2023-02-03  33  		return -EINVAL;
3e47235eaee094 Phil Chang     2022-02-25  34  
0249a75b365911 Ira Weiny      2023-02-03 @35  	page = virt_to_page(start);
53e16519c2eccd Jens Wiklander 2022-02-04  36  	for (n = 0; n < page_count; n++) {
0249a75b365911 Ira Weiny      2023-02-03  37  		pages[n] = page + n;
0249a75b365911 Ira Weiny      2023-02-03  38  		get_page(pages[n]);
53e16519c2eccd Jens Wiklander 2022-02-04  39  	}
53e16519c2eccd Jens Wiklander 2022-02-04  40  
0249a75b365911 Ira Weiny      2023-02-03  41  	return page_count;
4300cd6374a519 John Hubbard   2020-08-24  42  }
4300cd6374a519 John Hubbard   2020-08-24  43  

:::::: The code at line 35 was first introduced by commit
:::::: 0249a75b365911f91b87935bc08a4795a6fa7dd0 tee: Remove call to get_kernel_pages()

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
