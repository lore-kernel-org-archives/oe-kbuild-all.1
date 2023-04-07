Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E2EA8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 02:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680834327; x=1712370327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNRTf5VevjRN0XbHfH8eOBHC6+X8veeqcUyhMzYcIxU=;
  b=LV6KjHkDRNuceL633/yfBJfBkf80JE68lkozqjcxWjEZFZLd/biHrwqM
   aZtdPUW8OFHUNpnOu2Y5qsm2b2bb/YmvTGCfCz5zd6Yw9mCdQOJY8rUL+
   x6oESo95Nh/RwpZqob/PB0rcne8FY45AM7K6hnAJQ3AyAMmZPRZkIH9fp
   UL7tiRGNJnSVHc96obSZYZA1OUL48BDJtegrWUjnwH1pxOBUWXccuP7pb
   Qy1G2nf7TSpNkEu7sgZtyftW+vE7bZsMpls3sfBn5rl5iwvbNnxZm06FI
   aMpiCiuLtwt76tNTECbY7PThCYFRJtSW+/F3ed3MGuE3S9rGvYV7qnxGc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344676385"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344676385"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 19:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="689907845"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="689907845"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 19:25:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkbn1-000S2g-2R;
	Fri, 07 Apr 2023 02:25:23 +0000
Date: Fri, 7 Apr 2023 10:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Peter Gonda <pgonda@google.com>
Subject: [sean-jc:x86/sev_selftests_for_peter 5/8] lib/kvm_util.c:1322:28:
 warning: implicit declaration of function '_vm_phy_pages_alloc'; did you
 mean 'vm_phy_pages_alloc'?
Message-ID: <202304071011.cKVNSMMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

First bad commit (maybe != root cause):

tree:   https://github.com/sean-jc/linux x86/sev_selftests_for_peter
head:   d379d4355a226bc2fdbce995a5bd05b96cd21778
commit: f38f34c440d70139caba733fef36ec07aab6cb02 [5/8] KVM: selftests: add support for protected vm_vaddr_* allocations
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://github.com/sean-jc/linux/commit/f38f34c440d70139caba733fef36ec07aab6cb02
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/sev_selftests_for_peter
        git checkout f38f34c440d70139caba733fef36ec07aab6cb02
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071011.cKVNSMMd-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   lib/kvm_util.c: In function '____vm_vaddr_alloc':
>> lib/kvm_util.c:1322:28: warning: implicit declaration of function '_vm_phy_pages_alloc'; did you mean 'vm_phy_pages_alloc'? [-Wimplicit-function-declaration]
    1322 |         vm_paddr_t paddr = _vm_phy_pages_alloc(vm, pages,
         |                            ^~~~~~~~~~~~~~~~~~~
         |                            vm_phy_pages_alloc
   lib/kvm_util.c: In function 'addr_gpa2hva':
   lib/kvm_util.c:1477:32: error: 'gpa_tagged' undeclared (first use in this function)
    1477 |         gpa = vm_untag_gpa(vm, gpa_tagged);
         |                                ^~~~~~~~~~
   lib/kvm_util.c: At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
