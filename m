Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864E361
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 02:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692153458; x=1723689458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CD7HNP6ZGSw1euu5hH9/nKUsxbFrUr+lKf5rvAuJVn0=;
  b=Ay4Ef2LtGDp5gTGZNybjUpe4TNc3p2nuuaxB2bfoWrkG6r1wild/6Jlu
   WiaFKLH/yxCNAfJ0Uc8YHtQl+48ICAPUvARsIZGgH2E9d8igmHZZXtqnB
   vffrU2C++JmvSs42HXJn2UAIPy4WfprdE5wgNWgpQ85WJ125Db93XwODk
   AixTp53xVLJFsJM4IKqJsVDVGYzO9WGIPtLhuGQHshzRx9+FAp2+UXB1i
   zU1XCN6r8tf+4E6e1DI2X08rsMAOneX87DDxryTav2EISrBwi5DrpnA1Y
   +a0ie64wsNlHpM5wEQ0NDxEuF2uEcRnIVoIn0UEdc1A2hlkPbVF47yzB8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375194842"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="375194842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 19:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="710950715"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="710950715"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Aug 2023 19:37:36 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW6Pf-0001QN-2X;
	Wed, 16 Aug 2023 02:37:35 +0000
Date: Wed, 16 Aug 2023 10:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/hyperv_no_range_flush 15/15]
 include/linux/kvm_host.h:1483:19: error: redefinition of
 'kvm_arch_flush_remote_tlbs'
Message-ID: <202308161050.GWpDtsLf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/hyperv_no_range_flush
head:   f9d65d9f4720ff9339b177fcc9af5a5d9bd43551
commit: f9d65d9f4720ff9339b177fcc9af5a5d9bd43551 [15/15] KVM: x86/mmu: Declare flush_remote_tlbs{_range}() hooks iff HYPERV!=n
config: x86_64-randconfig-x013-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161050.GWpDtsLf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161050.GWpDtsLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161050.GWpDtsLf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_main.c:20:
>> include/linux/kvm_host.h:1483:19: error: redefinition of 'kvm_arch_flush_remote_tlbs'
    1483 | static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kvm_host.h:45:
   arch/x86/include/asm/kvm_host.h:1801:19: note: previous definition of 'kvm_arch_flush_remote_tlbs' with type 'int(struct kvm *)'
    1801 | static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_arch_flush_remote_tlbs +1483 include/linux/kvm_host.h

d89f5eff70a312 Jan Kiszka             2010-11-09  1481  
51787fd509e7a7 David Matlack          2023-08-11  1482  #ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
51787fd509e7a7 David Matlack          2023-08-11 @1483  static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
b08660e59dbdb6 Tianyu Lan             2018-07-19  1484  {
b08660e59dbdb6 Tianyu Lan             2018-07-19  1485  	return -ENOTSUPP;
b08660e59dbdb6 Tianyu Lan             2018-07-19  1486  }
ccf9fdedfffe97 Raghavendra Rao Ananta 2023-08-11  1487  #else
ccf9fdedfffe97 Raghavendra Rao Ananta 2023-08-11  1488  int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
b08660e59dbdb6 Tianyu Lan             2018-07-19  1489  #endif
b08660e59dbdb6 Tianyu Lan             2018-07-19  1490  

:::::: The code at line 1483 was first introduced by commit
:::::: 51787fd509e7a7cee6f0336c173ed757225dcd9f KVM: Rename kvm_arch_flush_remote_tlb() to kvm_arch_flush_remote_tlbs()

:::::: TO: David Matlack <dmatlack@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
