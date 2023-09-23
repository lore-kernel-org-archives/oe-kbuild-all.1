Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935C2135E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695500390; x=1727036390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qr/75FL+n9EW60D1MdOXEEjrS8NKlQZXA3if0XjW6eE=;
  b=BW06BeMibbQ+npZht65RAJH7SHd85UexpZHVWmcvC0tcMe4pAtdsS0Bn
   6PngNO2GPOYJwEev9/kifHVVOoQv5U1q14mUQ7r9Q4mMB5Q2MgP7jDG3p
   kBBO7C/nF6F2oQTsr127A456kK6eWBMSe2qcZgoP0yYp8Xyp2TjZ+EYtQ
   xAAtXf+j7pXEIjGnCs//XxVmFnNSpo0RKd/VjUQtnnas6Ec6GnDvBpKM8
   yLE/D1BF0O3p98wYxpr0gvaYsB1WVPwp1oDvUibLHerkx4LuTKnrip8+J
   StXDXiG8vX+IqaGnI4iA1YB0uSjheUenciQJpEWcoN/pvMGk7B6dUDMA+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360439039"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360439039"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 13:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="1078768155"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="1078768155"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 23 Sep 2023 13:19:48 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk96P-0002nh-2s;
	Sat, 23 Sep 2023 20:19:45 +0000
Date: Sun, 24 Sep 2023 04:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter 29/34] arch/parisc/include/asm/io.h:128:22:
 error: called object is not a function or function pointer
Message-ID: <202309240418.UeOJedBL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   205bbdcce0e2be471018d939d81dae51d63b5bd5
commit: 7fe4861d7a94daeee2570ca50343ce449cf8f19c [29/34] asm/io.h: Add ioremap_cache_shared
config: parisc-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20230924/202309240418.UeOJedBL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240418.UeOJedBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240418.UeOJedBL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from lib/devres.c:3:
   arch/parisc/include/asm/io.h:143: warning: "ioremap_uc" redefined
     143 | #define ioremap_uc \
         | 
   arch/parisc/include/asm/io.h:135: note: this is the location of the previous definition
     135 | #define ioremap_uc(addr, size)  \
         | 
   lib/devres.c: In function '__devm_ioremap':
   arch/parisc/include/asm/io.h:144:22: warning: passing argument 1 of 'ioremap_prot' makes integer from pointer without a cast [-Wint-conversion]
     144 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |                      ^~~~~~
         |                      |
         |                      void *
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~
   In file included from arch/parisc/include/asm/io.h:286:
   include/asm-generic/io.h:1053:40: note: expected 'phys_addr_t' {aka 'unsigned int'} but argument is of type 'void *'
    1053 | void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
         |                            ~~~~~~~~~~~~^~~~~~~~~
>> arch/parisc/include/asm/io.h:128:22: error: called object is not a function or function pointer
     128 | #define ioremap_prot ioremap_prot
         |                      ^~~~~~~~~~~~
   arch/parisc/include/asm/io.h:144:9: note: in expansion of macro 'ioremap_prot'
     144 |         ioremap_prot((addr), (size), _PAGE_IOREMAP)
         |         ^~~~~~~~~~~~
   lib/devres.c:42:24: note: in expansion of macro 'ioremap_uc'
      42 |                 addr = ioremap_uc(offset, size);
         |                        ^~~~~~~~~~


vim +128 arch/parisc/include/asm/io.h

^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  124  
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  125  /*
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  126   * The standard PCI ioremap interfaces
^1da177e4c3f41 include/asm-parisc/io.h      Linus Torvalds 2005-04-16  127   */
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06 @128  #define ioremap_prot ioremap_prot
426b313f356a31 arch/parisc/include/asm/io.h Baoquan He     2023-07-06  129  

:::::: The code at line 128 was first introduced by commit
:::::: 426b313f356a314af335899c51250dc0f49cd4a7 parisc: mm: convert to GENERIC_IOREMAP

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
