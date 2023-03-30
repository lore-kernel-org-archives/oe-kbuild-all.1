Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388BA1FC4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680181154; x=1711717154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQBeR8EvU6sRJKbFhun1aO4JFuGfavqKillFTk/83uE=;
  b=e/MswVJ5kjb/3nEzgLlIpR0ld7ybelLEqS5UnRo5d/e/c6Kc3+dZD+ia
   GvOPHlWW2rkyxknMCRBPcKou+NPb89oOBwRUFuB7A8jfFCnTVDrWtHNzP
   MM43dO9X0uPGInz1y0ZS6r4ien7sFKXZrSynagEiHlLSmMwpWqodvNyZd
   rXSHNtc8+xoZTPMqYrGSa8mQsEJ5KU4v57Y/dPZhO1VooO80bhytbZ1WE
   nS6pfkNmfjbws5Dbsr3yAHHWRYSXmimGiwhY0eM4LVyhkMgwn6hd52X+I
   z28iu6228LbBJAQ0GPARX6gBAZuwl63+luNjcMsX+tknoQnA7Qf4yOR9c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="403812867"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="403812867"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 05:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="714964630"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714964630"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Mar 2023 05:58:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phrrh-000Kre-1x;
	Thu, 30 Mar 2023 12:58:53 +0000
Date: Thu, 30 Mar 2023 20:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 8/13]
 fs/cifs/cifsglob.h:2216:42: warning: passing argument 1 of 'virt_to_pfn'
 makes pointer from integer without a cast
Message-ID: <202303302020.S140nTS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   7d33661b279f9c364c4f70b3fee41a450afdadd1
commit: c0d397d78efcbc5a04a5a831f9ec5f355598ab76 [8/13] m68k/mm: Make pfn accessors static inlines
config: m68k-randconfig-r014-20230329 (https://download.01.org/0day-ci/archive/20230330/202303302020.S140nTS3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=c0d397d78efcbc5a04a5a831f9ec5f355598ab76
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout c0d397d78efcbc5a04a5a831f9ec5f355598ab76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302020.S140nTS3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:66,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/cifs/cifsfs.c:13:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2216:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2216 |                             virt_to_page(addr), buflen, off);
         |                                          ^~~~
         |                                          |
         |                                          long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2216:29: note: in expansion of macro 'virt_to_page'
    2216 |                             virt_to_page(addr), buflen, off);
         |                             ^~~~~~~~~~~~
   In file included from arch/m68k/include/asm/page.h:60:
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/m68k/include/asm/page.h:66,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/cifs/ioctl.c:11:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2216:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2216 |                             virt_to_page(addr), buflen, off);
         |                                          ^~~~
         |                                          |
         |                                          long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2216:29: note: in expansion of macro 'virt_to_page'
    2216 |                             virt_to_page(addr), buflen, off);
         |                             ^~~~~~~~~~~~
   In file included from arch/m68k/include/asm/page.h:60:
   arch/m68k/include/asm/page_mm.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   fs/cifs/ioctl.c: In function 'cifs_ioctl':
   fs/cifs/ioctl.c:324:17: warning: variable 'caps' set but not used [-Wunused-but-set-variable]
     324 |         __u64   caps;
         |                 ^~~~


vim +/virt_to_pfn +2216 fs/cifs/cifsglob.h

f7f291e14dde32a Paulo Alcantara 2022-12-11  2191  
f7f291e14dde32a Paulo Alcantara 2022-12-11  2192  /* We can not use the normal sg_set_buf() as we will sometimes pass a
f7f291e14dde32a Paulo Alcantara 2022-12-11  2193   * stack object as buf.
f7f291e14dde32a Paulo Alcantara 2022-12-11  2194   */
d08089f649a0cfb David Howells   2022-01-24  2195  static inline void cifs_sg_set_buf(struct sg_table *sgtable,
f7f291e14dde32a Paulo Alcantara 2022-12-11  2196  				   const void *buf,
f7f291e14dde32a Paulo Alcantara 2022-12-11  2197  				   unsigned int buflen)
f7f291e14dde32a Paulo Alcantara 2022-12-11  2198  {
f7f291e14dde32a Paulo Alcantara 2022-12-11  2199  	unsigned long addr = (unsigned long)buf;
f7f291e14dde32a Paulo Alcantara 2022-12-11  2200  	unsigned int off = offset_in_page(addr);
f7f291e14dde32a Paulo Alcantara 2022-12-11  2201  
f7f291e14dde32a Paulo Alcantara 2022-12-11  2202  	addr &= PAGE_MASK;
f7f291e14dde32a Paulo Alcantara 2022-12-11  2203  	if (unlikely(is_vmalloc_addr((void *)addr))) {
f7f291e14dde32a Paulo Alcantara 2022-12-11  2204  		do {
f7f291e14dde32a Paulo Alcantara 2022-12-11  2205  			unsigned int len = min_t(unsigned int, buflen, PAGE_SIZE - off);
f7f291e14dde32a Paulo Alcantara 2022-12-11  2206  
d08089f649a0cfb David Howells   2022-01-24  2207  			sg_set_page(&sgtable->sgl[sgtable->nents++],
d08089f649a0cfb David Howells   2022-01-24  2208  				    vmalloc_to_page((void *)addr), len, off);
f7f291e14dde32a Paulo Alcantara 2022-12-11  2209  
f7f291e14dde32a Paulo Alcantara 2022-12-11  2210  			off = 0;
f7f291e14dde32a Paulo Alcantara 2022-12-11  2211  			addr += PAGE_SIZE;
f7f291e14dde32a Paulo Alcantara 2022-12-11  2212  			buflen -= len;
f7f291e14dde32a Paulo Alcantara 2022-12-11  2213  		} while (buflen);
f7f291e14dde32a Paulo Alcantara 2022-12-11  2214  	} else {
d08089f649a0cfb David Howells   2022-01-24  2215  		sg_set_page(&sgtable->sgl[sgtable->nents++],
d08089f649a0cfb David Howells   2022-01-24 @2216  			    virt_to_page(addr), buflen, off);
f7f291e14dde32a Paulo Alcantara 2022-12-11  2217  	}
f7f291e14dde32a Paulo Alcantara 2022-12-11  2218  }
f7f291e14dde32a Paulo Alcantara 2022-12-11  2219  

:::::: The code at line 2216 was first introduced by commit
:::::: d08089f649a0cfb2099c8551ac47eef0cc23fdf2 cifs: Change the I/O paths to use an iterator rather than a page list

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
