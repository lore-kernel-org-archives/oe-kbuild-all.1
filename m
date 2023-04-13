Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D5E28F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681376159; x=1712912159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmTiimmWPFfCSOXkY4Z/VAHCChf8ShaHbegH+pOdm1U=;
  b=jsZQNvo+DPw1eYpO33EKlmiPAohMsMS1sQtBbwUoW5dLuttTl6XV8Utk
   L4ZZpLckRiEvcYMm1Rv1DFwnIewQqR/THp4Lg93NI5UB7gp5oCEj88Pbx
   p7kjSzZ8BLk1oPg2q7L4kSHVl98PWikFtHxcjr9gyqGibzmgyxt9FdyIp
   Vkup/iaRr/as6OOANyn5/TwD42eNFBmscnTtO4g7YD4oOVrBp3pkPzSce
   ilbyNSDq3DhG1ThlEGNTE7ZuQIYrgSCRJAJlSkckJ9wDOXXkjC/xzzQPf
   tBlOGmsAqxuyXwwg+EDg1NMETQCIqj0NMbx3cMCMw1b2o/2e9R4HKPaMY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332836306"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="332836306"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 01:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721963493"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="721963493"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Apr 2023 01:55:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmsk3-000YYi-2e;
	Thu, 13 Apr 2023 08:55:43 +0000
Date: Thu, 13 Apr 2023 16:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [sean-jc:x86/upm_base_support 15/30]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:811:9: error: expected ';' before
 'kvm'
Message-ID: <202304131606.CIoLumxX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/upm_base_support
head:   9c985077b313ff50af5393d0b2268486b8ac63af
commit: da9b31a7c2b32653d4a27cb5ffedca130d23ad40 [15/30] KVM: Use gfn instead of hva for mmu_notifier_retry
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230413/202304131606.CIoLumxX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/da9b31a7c2b32653d4a27cb5ffedca130d23ad40
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/upm_base_support
        git checkout da9b31a7c2b32653d4a27cb5ffedca130d23ad40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304131606.CIoLumxX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:256,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kvm_types.h:22,
                    from include/kvm/iodev.h:6,
                    from arch/x86/kvm/../../../virt/kvm/kvm_main.c:16:
   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_mmu_invalidate_end':
   include/asm-generic/bug.h:110:41: error: expected expression before ')' token
     110 |         int __ret_warn_on = !!(condition);                      \
         |                                         ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:804:9: note: in expansion of macro 'WARN_ON_ONCE'
     804 |         WARN_ON_ONCE()
         |         ^~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:811:9: error: expected ';' before 'kvm'
     811 |         kvm->mmu_invalidate_seq++;
         |         ^~~


vim +811 arch/x86/kvm/../../../virt/kvm/kvm_main.c

e930bffe95e1e8 Andrea Arcangeli    2008-07-25  801  
da9b31a7c2b326 Chao Peng           2022-12-02  802  void kvm_mmu_invalidate_end(struct kvm *kvm)
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  803  {
da9b31a7c2b326 Chao Peng           2022-12-02  804  	WARN_ON_ONCE()
da9b31a7c2b326 Chao Peng           2022-12-02  805  
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  806  	/*
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  807  	 * This sequence increase will notify the kvm page fault that
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  808  	 * the page that is going to be mapped in the spte could have
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  809  	 * been freed.
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  810  	 */
20ec3ebd707c77 Chao Peng           2022-08-16 @811  	kvm->mmu_invalidate_seq++;
a355aa54f1d25d Paul Mackerras      2011-12-12  812  	smp_wmb();
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  813  	/*
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  814  	 * The above sequence increase must be visible before the
a355aa54f1d25d Paul Mackerras      2011-12-12  815  	 * below count decrease, which is ensured by the smp_wmb above
20ec3ebd707c77 Chao Peng           2022-08-16  816  	 * in conjunction with the smp_rmb in mmu_invalidate_retry().
e930bffe95e1e8 Andrea Arcangeli    2008-07-25  817  	 */
20ec3ebd707c77 Chao Peng           2022-08-16  818  	kvm->mmu_invalidate_in_progress--;
da9b31a7c2b326 Chao Peng           2022-12-02  819  
da9b31a7c2b326 Chao Peng           2022-12-02  820  	/*
da9b31a7c2b326 Chao Peng           2022-12-02  821  	 * Assert that at least one range must be added between start() and
da9b31a7c2b326 Chao Peng           2022-12-02  822  	 * end().  Not adding a range isn't fatal, but it is a KVM bug.
da9b31a7c2b326 Chao Peng           2022-12-02  823  	 */
da9b31a7c2b326 Chao Peng           2022-12-02  824  	WARN_ON_ONCE(kvm->mmu_invalidate_in_progress &&
da9b31a7c2b326 Chao Peng           2022-12-02  825  		     kvm->mmu_invalidate_range_start == INVALID_GPA);
f922bd9bf33bd5 Sean Christopherson 2021-04-01  826  }
f922bd9bf33bd5 Sean Christopherson 2021-04-01  827  

:::::: The code at line 811 was first introduced by commit
:::::: 20ec3ebd707c77fb9b11b37193449193d4649f33 KVM: Rename mmu_notifier_* to mmu_invalidate_*

:::::: TO: Chao Peng <chao.p.peng@linux.intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
