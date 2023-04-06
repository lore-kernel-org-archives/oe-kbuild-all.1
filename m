Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D215AD47
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680811517; x=1712347517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rb4OPx6QHSl68thLlEdCW9Bww9enxNpIv7r+pUvNSjo=;
  b=LiKSaXwpe0i7ujY3WSPlNqR+pChbTVRsZeHMGNibVFch0C1nyhpA5YXw
   EwhiyD2sVmmx8laNH4PUIp2SyA5Fd3AzkSpTiMhxVY2tZ2GGzM8LcQ1Xy
   MZnD9ijZUJJHlG/ScxuAb4+qM9KTbuMBBfNNwovI1bHsh74jXH8dvJn2Z
   lO2bakHSFYVLWFwgk2OpSpmFSRSnFVIFfinWvWxM1emhT63oVAlEA3kcf
   ihg0ceyXjwGNam9WIP7av7AqZ9Me3u6Xyqe4z2Ot7B6R3Rf56QbhISISy
   PYo0uMs3XPFdw6cf4aQKxdoO7wFn7OjU05YltLBnMBEOQgq7nplEWyHW6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="407953717"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="407953717"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687265845"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="687265845"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 13:05:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkVr2-000RiH-0V;
	Thu, 06 Apr 2023 20:05:08 +0000
Date: Fri, 7 Apr 2023 04:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Gonda <pgonda@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/sev_selftests_for_peter 4/8] lib/kvm_util.c:1464:32:
 error: 'gpa_tagged' undeclared
Message-ID: <202304070320.aN607BL0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/sev_selftests_for_peter
head:   d379d4355a226bc2fdbce995a5bd05b96cd21778
commit: 912f303e8cb3afb09951cf38ddb31449cb07d898 [4/8] KVM: selftests: Allow tagging protected memory in guest page tables
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://github.com/sean-jc/linux/commit/912f303e8cb3afb09951cf38ddb31449cb07d898
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/sev_selftests_for_peter
        git checkout 912f303e8cb3afb09951cf38ddb31449cb07d898
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070320.aN607BL0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/kvm_util.c:9:
   lib/kvm_util.c: In function '____vm_create':
   lib/kvm_util.c:223:46: error: 'nr_pages' undeclared (first use in this function)
     223 |                  vm_guest_mode_string(mode), nr_pages);
         |                                              ^~~~~~~~
   include/test_util.h:28:34: note: in definition of macro 'pr_debug'
      28 | #define pr_debug(...) _no_printf(__VA_ARGS__)
         |                                  ^~~~~~~~~~~
   lib/kvm_util.c:223:46: note: each undeclared identifier is reported only once for each function it appears in
     223 |                  vm_guest_mode_string(mode), nr_pages);
         |                                              ^~~~~~~~
   include/test_util.h:28:34: note: in definition of macro 'pr_debug'
      28 | #define pr_debug(...) _no_printf(__VA_ARGS__)
         |                                  ^~~~~~~~~~~
   lib/kvm_util.c: In function 'addr_gpa2hva':
>> lib/kvm_util.c:1464:32: error: 'gpa_tagged' undeclared (first use in this function)
    1464 |         gpa = vm_untag_gpa(vm, gpa_tagged);
         |                                ^~~~~~~~~~
   lib/kvm_util.c: At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
