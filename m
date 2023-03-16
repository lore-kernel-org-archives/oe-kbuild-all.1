Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E49E37C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678932800; x=1710468800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4w3N0ZXf0bX5W4/Yzbp3dvW+PxeyaJiSYMntDqWBH6U=;
  b=TCqXgTOp8VbZaTmaXVuRts3DGyfNqDrYQKMcnK0yha2bBZfPTK6ZnPyZ
   Z2VhkmoIeuA4CnR9TtrckCgowykUzMBWh4R6RlH3lzo7G+1BBKSeq2aKh
   WHwkBlWX3xyyRD9nYwO5fe2Fuxz/tqHOAhUbYDQUIbNQwvYL8EnZqwN0E
   L90uXKR2pdPRLvnIRXgKmOhPPf0PtgTbJjrL06iNFmZWrqwIKplaF8vBB
   uaQp21gqTe7nQDpAiNSRCZhZtZsQo861IcHvSwIkB3PO/huAiuzMha9CV
   db6I96iHRoTP5gA2/+l9DyrHOgjsOkNImjgbWstbGEoXr8is4gaQsF5/N
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365555416"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="365555416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 19:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="768745364"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="768745364"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 19:13:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcd7F-0008FH-1m;
	Thu, 16 Mar 2023 02:13:17 +0000
Date: Thu, 16 Mar 2023 10:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-next 5/9] arch/x86/include/asm/pci.h:108:20: error:
 redefinition of 'pci_disable_early'
Message-ID: <202303161057.zO7nRFCp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-next
head:   2e1127685f89b30a441346a6cb731e2a54013e7c
commit: 50e3da113c473c65e33a73bac4d8d47f6654ffc7 [5/9] Merge remote-tracking branch 'origin/guest-hardening-disable-features' into guest-next
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230316/202303161057.zO7nRFCp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/50e3da113c473c65e33a73bac4d8d47f6654ffc7
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-next
        git checkout 50e3da113c473c65e33a73bac4d8d47f6654ffc7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/cpu/mtrr/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161057.zO7nRFCp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pci.h:1967,
                    from arch/x86/kernel/cpu/mtrr/mtrr.c:44:
>> arch/x86/include/asm/pci.h:108:20: error: redefinition of 'pci_disable_early'
     108 | static inline void pci_disable_early(void) { }
         |                    ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pci.h:100:20: note: previous definition of 'pci_disable_early' with type 'void(void)'
     100 | static inline void pci_disable_early(void) { }
         |                    ^~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/pci.h:109:20: error: redefinition of 'pci_disable_mmconf'
     109 | static inline void pci_disable_mmconf(void) { }
         |                    ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pci.h:101:20: note: previous definition of 'pci_disable_mmconf' with type 'void(void)'
     101 | static inline void pci_disable_mmconf(void) { }
         |                    ^~~~~~~~~~~~~~~~~~


vim +/pci_disable_early +108 arch/x86/include/asm/pci.h

f3e6f164c23898 include/asm-x86/pci.h      Greg Kroah-Hartman         2007-10-12  103  
236191ab4f4677 arch/x86/include/asm/pci.h Andi Kleen                 2021-06-30  104  #ifdef CONFIG_PCI
236191ab4f4677 arch/x86/include/asm/pci.h Andi Kleen                 2021-06-30  105  void pci_disable_early(void);
276648eb824909 arch/x86/include/asm/pci.h Kuppuswamy Sathyanarayanan 2021-11-10  106  void pci_disable_mmconf(void);
236191ab4f4677 arch/x86/include/asm/pci.h Andi Kleen                 2021-06-30  107  #else
236191ab4f4677 arch/x86/include/asm/pci.h Andi Kleen                 2021-06-30 @108  static inline void pci_disable_early(void) { }
276648eb824909 arch/x86/include/asm/pci.h Kuppuswamy Sathyanarayanan 2021-11-10 @109  static inline void pci_disable_mmconf(void) { }
236191ab4f4677 arch/x86/include/asm/pci.h Andi Kleen                 2021-06-30  110  #endif
236191ab4f4677 arch/x86/include/asm/pci.h Andi Kleen                 2021-06-30  111  

:::::: The code at line 108 was first introduced by commit
:::::: 236191ab4f46778b57e021b6efe07f08b0aa517d x86/tdx: Disable early PCI in TDX

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
