Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA2136D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686554943; x=1718090943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0h7eNs882HvCVUQrfIphzZsmYxlnGcfDW2+Oqdq+6Y=;
  b=VNM8m/VhVnXLHWF8uC7r6Dmgc9ENSHYZ2ivm4SRk8Df9Zl1cnVJR0z2r
   uMV+/mYQA/6FnAuvJqmSwEYBvI+0v4fh7MNvm3qNnjUdSR0Csx6poDDM7
   2+T3dRzap7kDb0WEPV7xyMrk03+UVPoGGGcAMaq3I6WOUE2/M0wd5ptcm
   ibBHOal38S4pgZ44zt+AgFGWKCGitJCLQzfsKK2ukbfSUM85f3NbDZb92
   MRFwzaAfJDtz1SruNpfGdGdMXAKEwt/8GIUjWIw8DYwajNaILXh4NMEZF
   +xeYZ5C9INcYiGdBRg3PWqr/sTwOLIxfuTsckfwiIcIHJ7cfKesEmOVvX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="444342231"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="444342231"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 00:29:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="855503153"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="855503153"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2023 00:29:01 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8bz2-00007E-1Y;
	Mon, 12 Jun 2023 07:29:00 +0000
Date: Mon, 12 Jun 2023 15:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 384/8740]
 drivers/staging/comedi/drivers/comedi_isadma.c:31:9: error: implicit
 declaration of function 'release_dma_lock'
Message-ID: <202306121518.ORgjlsR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   f568a20f058fa1e37069cff4aac4187c1650a0e9
commit: 53a72858bcae7eaa7df8d167dbf60682d70f82a6 [384/8740] m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch
config: m68k-randconfig-r035-20230612 (https://download.01.org/0day-ci/archive/20230612/202306121518.ORgjlsR5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=53a72858bcae7eaa7df8d167dbf60682d70f82a6
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 53a72858bcae7eaa7df8d167dbf60682d70f82a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/staging/comedi/drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306121518.ORgjlsR5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/staging/comedi/drivers/comedi_isadma.c:7:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:182:32: note: in definition of macro 'WARN_ON'
     182 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/dma-mapping.h:355:13: note: in expansion of macro 'WARN_ON_ONCE'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |             ^~~~~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/staging/comedi/drivers/comedi_isadma.c: In function 'comedi_isadma_program':
   drivers/staging/comedi/drivers/comedi_isadma.c:25:17: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
      25 |         flags = claim_dma_lock();
         |                 ^~~~~~~~~~~~~~
>> drivers/staging/comedi/drivers/comedi_isadma.c:31:9: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
      31 |         release_dma_lock(flags);
         |         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/release_dma_lock +31 drivers/staging/comedi/drivers/comedi_isadma.c

20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  16  
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  17  /**
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  18   * comedi_isadma_program - program and enable an ISA DMA transfer
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  19   * @desc:	the ISA DMA cookie to program and enable
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  20   */
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  21  void comedi_isadma_program(struct comedi_isadma_desc *desc)
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  22  {
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  23  	unsigned long flags;
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  24  
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  25  	flags = claim_dma_lock();
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  26  	clear_dma_ff(desc->chan);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  27  	set_dma_mode(desc->chan, desc->mode);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  28  	set_dma_addr(desc->chan, desc->hw_addr);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  29  	set_dma_count(desc->chan, desc->size);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  30  	enable_dma(desc->chan);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14 @31  	release_dma_lock(flags);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  32  }
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  33  EXPORT_SYMBOL_GPL(comedi_isadma_program);
20a1ea7d6ba184 H Hartley Sweeten 2015-01-14  34  

:::::: The code at line 31 was first introduced by commit
:::::: 20a1ea7d6ba184a1f6e25e85786738003387cada staging: comedi: comedi_isadma: introduce helper module for ISA DMA

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
