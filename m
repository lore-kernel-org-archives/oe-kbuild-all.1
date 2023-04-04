Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB63C07
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 23:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680650872; x=1712186872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZHGzr+SIRkXQLZc+6oMA0DKcFgjuL4PEhvsXwF47ag=;
  b=je2AlgmBb9fQPtvSBiKfDRN0IxUEEsRx/5yA+BJH5fDqn75KBn0I0x+4
   NuSO+YTmne5U+NPU6/+uVyO24zUCNIsgRwrbIl9Xes2f3MRn+o0iP87fw
   T2Yog29/0lYaMSTvzb2dfbzoVrd7T5kowS9CdxHxuCZtq0IeykrDHMvRS
   WhDbj5d17NyPs77+xyGSHN1ifwZm+fHSjRtkgL0qlN1IuAW71SN1Ex7YL
   S/7wip3brkH+WkyCEVwRQGBZbieM0yrfWioPPqyQULRB1fK9ntocs8KvO
   vlO1GZdHy6QzEbTQlWPtqcfyZjh5tWGLPZpBRWRk6gtOpeKBTFAg5gOyX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322713018"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="322713018"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 16:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751064989"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="751064989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Apr 2023 16:27:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjq45-000Q6Y-0I;
	Tue, 04 Apr 2023 23:27:49 +0000
Date: Wed, 5 Apr 2023 07:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 18/328] lib/kvm_util.c:990:32:
 error: 'struct kvm_userspace_memory_region2' has no member named
 'restricted_fd'; did you mean 'restrictedmem_fd'?
Message-ID: <202304050705.2Ix5Ur4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   694338d50183e3371330efb5291e044153c7c615
commit: 543aeefcc387b12a582fd06b7d6174d13aded51d [18/328] KVM: selftests: Add support for creating private memslots
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # https://github.com/intel/tdx/commit/543aeefcc387b12a582fd06b7d6174d13aded51d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 543aeefcc387b12a582fd06b7d6174d13aded51d
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050705.2Ix5Ur4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/kvm_util.c: In function 'vm_userspace_mem_region_add':
>> lib/kvm_util.c:990:32: error: 'struct kvm_userspace_memory_region2' has no member named 'restricted_fd'; did you mean 'restrictedmem_fd'?
     990 |                 region->region.restricted_fd = memfd_restricted(0);
         |                                ^~~~~~~~~~~~~
         |                                restrictedmem_fd
>> lib/kvm_util.c:991:32: error: 'struct kvm_userspace_memory_region2' has no member named 'restricted_offset'; did you mean 'restrictedmem_offset'?
     991 |                 region->region.restricted_offset = 0;
         |                                ^~~~~~~~~~~~~~~~~
         |                                restrictedmem_offset
   In file included from lib/kvm_util.c:9:
   lib/kvm_util.c:993:44: error: 'struct kvm_userspace_memory_region2' has no member named 'restricted_fd'; did you mean 'restrictedmem_fd'?
     993 |                 TEST_ASSERT(region->region.restricted_fd >= 0,
         |                                            ^~~~~~~~~~~~~
   include/test_util.h:54:22: note: in definition of macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                      ^
   lib/kvm_util.c:1012:32: error: 'struct kvm_userspace_memory_region2' has no member named 'restricted_fd'; did you mean 'restrictedmem_fd'?
    1012 |                 region->region.restricted_fd);
         |                                ^~~~~~~~~~~~~
   include/test_util.h:54:57: note: in definition of macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                         ^~~~~~~~~~~
   lib/kvm_util.c: At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
