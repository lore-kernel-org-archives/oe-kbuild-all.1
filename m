Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D210780
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 23:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677800026; x=1709336026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+XhmyVKFIIJT9zQ9PE6pv9cKNxoIVBk6iFoFeCMNRg=;
  b=LRUgyxmHYdaCeLf3TAuRjhtkeDzqN0wl/u61vBCS/FIZPDhYyHlTyG9a
   uyP9ekpDXgVdtN0TGbyuNuwogszZqN9j0p7+tO5OdvDgZZ2a+2uCoWkTx
   kwioBEceJkyVrE+4yL2HxIZdodwcpV6eP8Xs+R1pd6bCSeElks7N0/nl9
   bVFS0bYxHR3rx07KXU4q7/ty6CmQkZhHeezB8FvFrFIAC8/VT8/O8XQUD
   0IWv6UuiJ6nADZ8wZzhrcZmmY9NqdEPY+4AqNZ/eLgPl1VA73oueAdlZX
   BFOsfXFKE5deFDAtw9TYH50PfEtN2BknE3tpcoSH4mfTgq9jzFbJlB0K0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362482272"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="362482272"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 15:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785042542"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="785042542"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2023 15:33:40 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXsQe-0000zO-0Q;
	Thu, 02 Mar 2023 23:33:40 +0000
Date: Fri, 3 Mar 2023 07:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-gs-raviole-5.10-android12-qpr1-d
 1711/8858] arch/arm64/mm/fault.c:492:31: sparse: sparse: incorrect type in
 return expression (different base types)
Message-ID: <202303030740.oUdcUwjp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-gs-raviole-5.10-android12-qpr1-d
head:   9771767708df4fcf51cd1642e041c804a86e740c
commit: 2fd69fa6bcab984b56ccfd4860b10f11f1966bed [1711/8858] FROMLIST: arm64/mm: add speculative page fault
config: arm64-randconfig-s032-20230302 (https://download.01.org/0day-ci/archive/20230303/202303030740.oUdcUwjp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/2fd69fa6bcab984b56ccfd4860b10f11f1966bed
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-gs-raviole-5.10-android12-qpr1-d
        git checkout 2fd69fa6bcab984b56ccfd4860b10f11f1966bed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/ arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030740.oUdcUwjp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/mm/fault.c:492:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted vm_fault_t @@
   arch/arm64/mm/fault.c:492:31: sparse:     expected int
   arch/arm64/mm/fault.c:492:31: sparse:     got restricted vm_fault_t
   arch/arm64/mm/fault.c:561:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] fault @@     got int @@
   arch/arm64/mm/fault.c:561:15: sparse:     expected restricted vm_fault_t [usertype] fault
   arch/arm64/mm/fault.c:561:15: sparse:     got int
   arch/arm64/mm/fault.c:591:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] fault @@     got int @@
   arch/arm64/mm/fault.c:591:15: sparse:     expected restricted vm_fault_t [usertype] fault
   arch/arm64/mm/fault.c:591:15: sparse:     got int
   arch/arm64/mm/fault.c:620:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:620:13: sparse: sparse: restricted vm_fault_t degrades to integer
   arch/arm64/mm/fault.c:665:39: sparse: sparse: restricted vm_fault_t degrades to integer

vim +492 arch/arm64/mm/fault.c

1d18c47c735e8a Catalin Marinas   2012-03-05  471  
1d18c47c735e8a Catalin Marinas   2012-03-05  472  	if (unlikely(!vma))
4745224b45097d Anshuman Khandual 2019-06-07  473  		return VM_FAULT_BADMAP;
1d18c47c735e8a Catalin Marinas   2012-03-05  474  
1d18c47c735e8a Catalin Marinas   2012-03-05  475  	/*
1d18c47c735e8a Catalin Marinas   2012-03-05  476  	 * Ok, we have a good vm_area for this memory access, so we can handle
1d18c47c735e8a Catalin Marinas   2012-03-05  477  	 * it.
1d18c47c735e8a Catalin Marinas   2012-03-05  478  	 */
4745224b45097d Anshuman Khandual 2019-06-07  479  	if (unlikely(vma->vm_start > addr)) {
4745224b45097d Anshuman Khandual 2019-06-07  480  		if (!(vma->vm_flags & VM_GROWSDOWN))
4745224b45097d Anshuman Khandual 2019-06-07  481  			return VM_FAULT_BADMAP;
4745224b45097d Anshuman Khandual 2019-06-07  482  		if (expand_stack(vma, addr))
4745224b45097d Anshuman Khandual 2019-06-07  483  			return VM_FAULT_BADMAP;
4745224b45097d Anshuman Khandual 2019-06-07  484  	}
4745224b45097d Anshuman Khandual 2019-06-07  485  
db6f41063cbdb5 Will Deacon       2013-07-19  486  	/*
db6f41063cbdb5 Will Deacon       2013-07-19  487  	 * Check that the permissions on the VMA allow for the fault which
cab15ce604e550 Catalin Marinas   2016-08-11  488  	 * occurred.
db6f41063cbdb5 Will Deacon       2013-07-19  489  	 */
4745224b45097d Anshuman Khandual 2019-06-07  490  	if (!(vma->vm_flags & vm_flags))
4745224b45097d Anshuman Khandual 2019-06-07  491  		return VM_FAULT_BADACCESS;
6a1bb025d28e10 Peter Xu          2020-08-11 @492  	return handle_mm_fault(vma, addr & PAGE_MASK, mm_flags, regs);
1d18c47c735e8a Catalin Marinas   2012-03-05  493  }
1d18c47c735e8a Catalin Marinas   2012-03-05  494  

:::::: The code at line 492 was first introduced by commit
:::::: 6a1bb025d28e1026fead73b7b33e2dfccba3f4d2 mm/arm64: use general page fault accounting

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
