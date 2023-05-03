Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620ABED2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 10:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683108193; x=1714644193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiD3JR4WD7dsqDAQ/OjxB2k3EgZ/RPdzJru+c5bRFtU=;
  b=QHXT/nNM06plin//mJSjH+pT8z4nVX+xaDtrhHo9GbdB68Pm1NFVY2h9
   hK/PMbaetuCeThkzbMQLOhEt3zHLCBJXojkgN8+AfAo7WBNYb5nAUTFjM
   pcLc6elCWw4uDLnVJ0KimWDYN9TG6AtWw297PV0oMPinv3OMuNwZNxikF
   AIPUpVCJD8mV8bL3DTOFJqBbf+iCQaehY4wq9v4RaiNUjvNUVPuxRc4x2
   TEFB7PRng0j53u8MtmtImo6gNugxOQcHLEwsX+/dflosa2PpgroHMcqpf
   2tLtglrttiJiV1PJzlyXjhaUa56ivJdgT/SiYzUKoj74lBsRyappXLvaj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="328244741"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="328244741"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 03:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="761436823"
X-IronPort-AV: E=Sophos;i="5.99,246,1677571200"; 
   d="scan'208";a="761436823"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 May 2023 03:03:10 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu9KH-0001qq-2e;
	Wed, 03 May 2023 10:03:09 +0000
Date: Wed, 3 May 2023 18:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 10/12]
 arch/arm/include/asm/memory.h:384: warning: "ARCH_PFN_OFFSET" redefined
Message-ID: <202305031715.shjeag2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   042946296cd2b01e67500f6ca02c750fbd5d0046
commit: d2a5bf80564791da3b26d022633713c6e5838159 [10/12] ARM: mm: Make virt_to_pfn() a static inline
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230503/202305031715.shjeag2t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=d2a5bf80564791da3b26d022633713c6e5838159
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator b4/virt-to-pfn-v6-4-rc1
        git checkout d2a5bf80564791da3b26d022633713c6e5838159
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/usb/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031715.shjeag2t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/io.h:26,
                    from include/linux/io.h:13,
                    from drivers/usb/phy/phy-tahvo.c:15:
>> arch/arm/include/asm/memory.h:384: warning: "ARCH_PFN_OFFSET" redefined
     384 | #define ARCH_PFN_OFFSET         PHYS_PFN_OFFSET
         | 
   In file included from arch/arm/include/asm/page.h:171,
                    from arch/arm/include/asm/memory.h:18:
   include/asm-generic/memory_model.h:15: note: this is the location of the previous definition
      15 | #define ARCH_PFN_OFFSET         (0UL)
         | 


vim +/ARCH_PFN_OFFSET +384 arch/arm/include/asm/memory.h

4dc9a81715973c arch/arm/include/asm/memory.h Santosh Shilimkar 2013-07-31  374  
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  375  /*
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  376   * Conversion between a struct page and a physical address.
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  377   *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  378   *  page_to_pfn(page)	convert a struct page * to a PFN number
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  379   *  pfn_to_page(pfn)	convert a _valid_ PFN number to struct page *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  380   *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  381   *  virt_to_page(k)	convert a _valid_ virtual address to struct page *
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  382   *  virt_addr_valid(k)	indicates whether a virtual address is valid
^1da177e4c3f41 include/asm-arm/memory.h      Linus Torvalds    2005-04-16  383   */
7d12963757b917 include/asm-arm/memory.h      Russell King      2006-04-04 @384  #define ARCH_PFN_OFFSET		PHYS_PFN_OFFSET
05944d74bc28ff include/asm-arm/memory.h      Russell King      2006-11-30  385  

:::::: The code at line 384 was first introduced by commit
:::::: 7d12963757b9170f162f317b7461353c5fb574e8 [ARM] Remove unnecessary extra parens in include/asm-arm/memory.h

:::::: TO: Russell King <rmk@dyn-67.arm.linux.org.uk>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
