Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F13B15A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 02:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693536921; x=1725072921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jL2o9w15lJB4f+H2V+7eDQn+o1BdkpQwer1fccOhq+8=;
  b=extTT5WwpbD6z7fQloYIbBlGm4Pk50JFD59wG0LMC7Dxv23cFqS3BruY
   wt15InszbgOsT31pfFq6aBBduVPFkmHAMV3zOcMW5FP43tp/uOBYuzCNu
   chxIKiHR3BoiiWJRHxebqbrs0zntj+l6nRVEFiOazajmG42CbWRUHxnb3
   wJH8Z053+yp75EEyCy+Gb18AieiUClXJpBmYX1EgLMI8WrTXtpD6iMMb5
   NkzEF32DF32OBitpeusFFGyDI01KWl2WUZwZ2JmQkomc7V2wr0NVnIsrx
   RX5pg1UOoRcpqJTGPXcVTqRynAfHJtRrlLx9FCVcF+sV5nIMvoqhU5zpH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407115779"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="407115779"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 19:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854530323"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="854530323"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2023 19:55:19 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbuJZ-0000nn-1a;
	Fri, 01 Sep 2023 02:55:17 +0000
Date: Fri, 1 Sep 2023 10:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/hide_kvm_details 2/3]
 arch/mips/include/asm/kvm_host.h:111:36: error: field 'generic' has
 incomplete type
Message-ID: <202309011033.zDY2QgBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/hide_kvm_details
head:   f2de177a2d8f1b545e0c199bf68cf80d7727c2f5
commit: 7938af1de637beb7f630b385bd36ef9be8fc894e [2/3] KVM: Hide
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20230901/202309011033.zDY2QgBg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011033.zDY2QgBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011033.zDY2QgBg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45,
                    from arch/mips/kernel/asm-offsets.c:24:
>> arch/mips/include/asm/kvm_host.h:111:36: error: field 'generic' has incomplete type
     111 |         struct kvm_vm_stat_generic generic;
         |                                    ^~~~~~~
   arch/mips/include/asm/kvm_host.h:115:38: error: field 'generic' has incomplete type
     115 |         struct kvm_vcpu_stat_generic generic;
         |                                      ^~~~~~~
>> arch/mips/include/asm/kvm_host.h:348:37: error: field 'mmu_page_cache' has incomplete type
     348 |         struct kvm_mmu_memory_cache mmu_page_cache;
         |                                     ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/generic +111 arch/mips/include/asm/kvm_host.h

f6f7017192ad62 James Hogan 2016-08-01  109  
740765ce45689a Sanjay Lal  2012-11-21  110  struct kvm_vm_stat {
0193cc908b5ae8 Jing Zhang  2021-06-18 @111  	struct kvm_vm_stat_generic generic;
740765ce45689a Sanjay Lal  2012-11-21  112  };
740765ce45689a Sanjay Lal  2012-11-21  113  

:::::: The code at line 111 was first introduced by commit
:::::: 0193cc908b5ae8aff2e2d2997ca5d4ae26ed24d4 KVM: stats: Separate generic stats from architecture specific ones

:::::: TO: Jing Zhang <jingzhangos@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
