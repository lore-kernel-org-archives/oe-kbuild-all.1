Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A461D50B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678378895; x=1709914895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AcBsEacDGxAiQhstxUG4Fg+evixR+arkyXPDqqldoj8=;
  b=Y8QxYk3KyomTo+AJICa+gD/2pa9jzleDiS7AQp0DFEKgCBgfYwRI3248
   pOCXuTT5D5ZvRdN9SlD3Z7/qsdhi9qucSt2e6gCVFBnsk/lbE1qw0nzih
   ysmO03JJsiUY02MlxyzRv5b9HR2NAeb7QUF1rpBf0bITtjCVltErV2+2M
   +fA1q4dY5YF9nBGfZ3O7DPh5Eb2lVj4r1ZgbAKxHb4+771ou+378G4JaL
   DMBTuvtk0tjmgkOF4hBNQPpYkThHMlBL625I4QJrucNBPcE1J4DLkqOBy
   ap+rdx4loXHNfXJQJA6jXan2yXG88WB1CKHzRPG6T0n0vzC4hd8pCPu/I
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="422758691"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="422758691"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 08:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="709900825"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="709900825"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2023 08:21:30 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paJ1F-00034T-2S;
	Thu, 09 Mar 2023 16:21:29 +0000
Date: Fri, 10 Mar 2023 00:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 182/189]
 drivers/parport/parport_pc.c:84:23: warning: initialization makes pointer
 from integer without a cast
Message-ID: <202303100022.KR7uGFB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   1f42d3904dec7843a6847cf8a1d9d48d9a12a28c
commit: 6641e948caf50bbaeb06547cfe851d1ded0e6893 [182/189] parport_pc: Set up mode and ECR masks for Oxford Semiconductor devices
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230310/202303100022.KR7uGFB8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=6641e948caf50bbaeb06547cfe851d1ded0e6893
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.14
        git checkout 6641e948caf50bbaeb06547cfe851d1ded0e6893
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/parport/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100022.KR7uGFB8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bug.h:5:0,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/parport/parport_pc.c:45:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   arch/powerpc/include/asm/page.h:146:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:77:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   arch/powerpc/include/asm/page.h:146:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:85:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   arch/powerpc/include/asm/page.h:146:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:141:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:77:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:85:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   include/linux/dma-mapping.h:327:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   In file included from include/linux/parport.h:18:0,
                    from drivers/parport/parport_pc.c:64:
   drivers/parport/parport_pc.c: At top level:
>> include/uapi/linux/parport.h:60:29: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define PARPORT_MODE_COMPAT (1<<4) /* Hardware 'printer protocol'. */
                                ^
   drivers/parport/parport_pc.c:2699:8: note: in expansion of macro 'PARPORT_MODE_COMPAT'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
           ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:60:29: note: (near initialization for 'cards[19].preinit_hook')
    #define PARPORT_MODE_COMPAT (1<<4) /* Hardware 'printer protocol'. */
                                ^
   drivers/parport/parport_pc.c:2699:8: note: in expansion of macro 'PARPORT_MODE_COMPAT'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
           ^~~~~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:84:23: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2699:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:84:23: note: (near initialization for 'cards[19].postinit_hook')
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2699:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   In file included from include/linux/parport.h:18:0,
                    from drivers/parport/parport_pc.c:64:
   include/uapi/linux/parport.h:59:26: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define PARPORT_MODE_ECP (1<<3) /* Hardware ECP. */
                             ^
   drivers/parport/parport_pc.c:2701:8: note: in expansion of macro 'PARPORT_MODE_ECP'
           PARPORT_MODE_ECP |
           ^~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:59:26: note: (near initialization for 'cards[20].preinit_hook')
    #define PARPORT_MODE_ECP (1<<3) /* Hardware ECP. */
                             ^
   drivers/parport/parport_pc.c:2701:8: note: in expansion of macro 'PARPORT_MODE_ECP'
           PARPORT_MODE_ECP |
           ^~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:84:23: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2702:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:84:23: note: (near initialization for 'cards[20].postinit_hook')
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2702:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   In file included from include/linux/parport.h:18:0,
                    from drivers/parport/parport_pc.c:64:
>> include/uapi/linux/parport.h:60:29: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define PARPORT_MODE_COMPAT (1<<4) /* Hardware 'printer protocol'. */
                                ^
   drivers/parport/parport_pc.c:2704:8: note: in expansion of macro 'PARPORT_MODE_COMPAT'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
           ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:60:29: note: (near initialization for 'cards[21].preinit_hook')
    #define PARPORT_MODE_COMPAT (1<<4) /* Hardware 'printer protocol'. */
                                ^
   drivers/parport/parport_pc.c:2704:8: note: in expansion of macro 'PARPORT_MODE_COMPAT'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
           ^~~~~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:84:23: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2704:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:84:23: note: (near initialization for 'cards[21].postinit_hook')
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2704:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   In file included from include/linux/parport.h:18:0,
                    from drivers/parport/parport_pc.c:64:
>> include/uapi/linux/parport.h:60:29: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define PARPORT_MODE_COMPAT (1<<4) /* Hardware 'printer protocol'. */
                                ^
   drivers/parport/parport_pc.c:2706:8: note: in expansion of macro 'PARPORT_MODE_COMPAT'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
           ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:60:29: note: (near initialization for 'cards[22].preinit_hook')
    #define PARPORT_MODE_COMPAT (1<<4) /* Hardware 'printer protocol'. */
                                ^
   drivers/parport/parport_pc.c:2706:8: note: in expansion of macro 'PARPORT_MODE_COMPAT'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
           ^~~~~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:84:23: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2706:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:84:23: note: (near initialization for 'cards[22].postinit_hook')
    #define ECR_MODE_MASK 0xe0
                          ^
   drivers/parport/parport_pc.c:2706:29: note: in expansion of macro 'ECR_MODE_MASK'
           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c: In function 'parport_ECP_supported':
   drivers/parport/parport_pc.c:1668:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
      printk(KERN_WARNING "0x%lx: Unknown implementation ID\n",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       pb->base);
       ~~~~~~~~~
   drivers/parport/parport_pc.c:1671:2: note: here
     case 1:
     ^~~~


vim +84 drivers/parport/parport_pc.c

7fbacd5213a03b Al Viro        2005-05-04  74  
^1da177e4c3f41 Linus Torvalds 2005-04-16  75  /* ECR modes */
^1da177e4c3f41 Linus Torvalds 2005-04-16  76  #define ECR_SPP 00
^1da177e4c3f41 Linus Torvalds 2005-04-16  77  #define ECR_PS2 01
^1da177e4c3f41 Linus Torvalds 2005-04-16  78  #define ECR_PPF 02
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  #define ECR_ECP 03
^1da177e4c3f41 Linus Torvalds 2005-04-16  80  #define ECR_EPP 04
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  #define ECR_VND 05
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  #define ECR_TST 06
^1da177e4c3f41 Linus Torvalds 2005-04-16  83  #define ECR_CNF 07
^1da177e4c3f41 Linus Torvalds 2005-04-16 @84  #define ECR_MODE_MASK 0xe0
^1da177e4c3f41 Linus Torvalds 2005-04-16  85  #define ECR_WRITE(p, v) frob_econtrol((p), 0xff, (v))
^1da177e4c3f41 Linus Torvalds 2005-04-16  86  

:::::: The code at line 84 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
