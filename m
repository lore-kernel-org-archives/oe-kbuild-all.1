Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E197963BC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680786900; x=1712322900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8xu7Qu3tgVaDQH8XIj5L5TjHct+m+CGhfrG1/V8ayOQ=;
  b=Oz5syCXWrf9V+FmYtwN92do5EX17PdWUrIHcBLUz2t6mhBDznrtTjony
   3ofg1BU9iSZTwrbCoHXk+/Ei9awTrRoNs0Z6tzP7vDIvybHFbjDp5dv/b
   ir5Ldu53gnrz/ifbeU4N2zAFdrLzumR+NuVzC4jF6TwLQ2RSTY1wvSwfx
   +iz1xVRw01zzjZ5Vbdb/tE15EjPC0kB3IDlroML5xOs2CAswoHxmK9nsv
   +t5CJMVx3Kn0GI7JMMan5RRZ6l5U1fgKNEQuzXMyzz9yb1elzLZWGur1X
   PJD5KppqVIKeI58lo28zxH+Jclmc9i0HHmCF8T5tf9RbHt/rm57q0LF0S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344476397"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344476397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="717439431"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="717439431"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Apr 2023 05:52:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkP6g-000RNY-2r;
	Thu, 06 Apr 2023 12:52:50 +0000
Date: Thu, 6 Apr 2023 20:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/sev_selftests_for_peter 1/8] lib/kvm_util.c:223:46:
 error: 'nr_pages' undeclared
Message-ID: <202304062040.uvpzE4yE-lkp@intel.com>
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
commit: 4eb4db55311832db7851f9a0a64c3202d248f59e [1/8] KVM: selftests: Extend VM creation's @mode to allow control of VM subtype
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://github.com/sean-jc/linux/commit/4eb4db55311832db7851f9a0a64c3202d248f59e
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc x86/sev_selftests_for_peter
        git checkout 4eb4db55311832db7851f9a0a64c3202d248f59e
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062040.uvpzE4yE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/kvm_util.c:9:
   lib/kvm_util.c: In function '____vm_create':
>> lib/kvm_util.c:223:46: error: 'nr_pages' undeclared (first use in this function)
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
   lib/kvm_util.c: At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
