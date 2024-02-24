Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9013E2374B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708774736; cv=none; b=bJX/oQvnV7ekguezlnjQ/llXBbkGVUGmDY+1bqzi8Lr0VKh8n8msW3/af3zbWWR4wjRGnI2kzh6J/JLIyzGON703VgEZDS04fBXvlg2MljxFiY/WUQFot9A3Gjo9OLxzKvpWAeyjxXf5n22fDJ6veJZT9xMLbkmhr+7eO/O2WM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708774736; c=relaxed/simple;
	bh=8XUfF8/JMMWlYjptcBdIZdRmipFwCPVa71GzB0SjELw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i7tsMTzdn3BIZS8rGluH/I/sJHwUWFm/rBHBUn8W/EtKclbIE2QkABrl5kcRGD/aq5KDCXDdCHUYRygwbqsbz0CjR+ZwZeC30YTIH1sVhUCWM/nHdqDvflF4kdTrAoVCndrKj63GATQyiKc0K6wErrRPp7ZAXW5aIy85Wx7u3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWs+LOlo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWs+LOlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708774734; x=1740310734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8XUfF8/JMMWlYjptcBdIZdRmipFwCPVa71GzB0SjELw=;
  b=aWs+LOlo6+Veu6zhUqiT1CjQ5nrelBBZtBbxRKqWoc7dS21jP2qksSR6
   g9hX+ZIeCCeB2Bs29/Yb9aIKtzAX7TUmQiz6MdkDw+3KomCZ4yKBuYCLS
   Kd7WbabyNo1MZgUR4XtIZZ7OEMnrGOpdphwOx51QSDxt+qnGgPkWoYRxn
   UfLWkn4qHBwJPIctoGFC5ZqZgrDvGc0JGQsT78AKnea4KXDxcj8KhxM94
   CxQTrqst6ZQNsNqBVKN8S9iuo5xU27ZpK597q1nedpKC4KJmeI69ERYw/
   xiG/ivNtmEewVpZhAzrsYy2DOO5d9b3zyjxL2w3ASiyIgd2UpDk0eTYMT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="13802682"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="13802682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6664435"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Feb 2024 03:38:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqMk-0008VA-0f;
	Sat, 24 Feb 2024 11:38:50 +0000
Date: Sat, 24 Feb 2024 19:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/ro_memslot_snafu 2/2] ro_memslot_test.c:27:37: error:
 'KVM_MEM_READONLY' undeclared
Message-ID: <202402241944.7lxWQfY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/ro_memslot_snafu
head:   666538d29b9c5394d2545cb4052fd3df79e618c8
commit: 666538d29b9c5394d2545cb4052fd3df79e618c8 [2/2] KVM: selftests: Add test for RO memslots
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241944.7lxWQfY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241944.7lxWQfY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ro_memslot_test.c: In function 'guest_code':
   ro_memslot_test.c:6:24: warning: implicit declaration of function 'READ_ONCE' [-Wimplicit-function-declaration]
       6 |         uint64_t val = READ_ONCE(*mem);
         |                        ^~~~~~~~~
   ro_memslot_test.c:8:9: warning: implicit declaration of function 'GUEST_ASSERT'; did you mean 'TEST_ASSERT'? [-Wimplicit-function-declaration]
       8 |         GUEST_ASSERT(val == magic_val,
         |         ^~~~~~~~~~~~
         |         TEST_ASSERT
   ro_memslot_test.c:11:9: warning: implicit declaration of function 'WRITE_ONCE' [-Wimplicit-function-declaration]
      11 |         WRITE_ONCE(*mem, ~magic_val);
         |         ^~~~~~~~~~
   ro_memslot_test.c:12:9: warning: implicit declaration of function 'GUEST_DONE' [-Wimplicit-function-declaration]
      12 |         GUEST_DONE();
         |         ^~~~~~~~~~
   ro_memslot_test.c: In function 'main':
   ro_memslot_test.c:24:14: warning: implicit declaration of function 'vm_create_with_one_vcpu' [-Wimplicit-function-declaration]
      24 |         vm = vm_create_with_one_vcpu(&vcpu, guest_code);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   ro_memslot_test.c:24:12: warning: assignment to 'struct kvm_vm *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      24 |         vm = vm_create_with_one_vcpu(&vcpu, guest_code);
         |            ^
   ro_memslot_test.c:26:9: warning: implicit declaration of function 'vm_userspace_mem_region_add' [-Wimplicit-function-declaration]
      26 |         vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa, slot, 1,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ro_memslot_test.c:27:37: error: 'KVM_MEM_READONLY' undeclared (first use in this function)
      27 |                                     KVM_MEM_READONLY);
         |                                     ^~~~~~~~~~~~~~~~
   ro_memslot_test.c:27:37: note: each undeclared identifier is reported only once for each function it appears in
   ro_memslot_test.c:29:9: warning: implicit declaration of function 'virt_map' [-Wimplicit-function-declaration]
      29 |         virt_map(vm, gpa, gpa, 1);
         |         ^~~~~~~~
   ro_memslot_test.c:30:31: warning: implicit declaration of function 'addr_gpa2hva' [-Wimplicit-function-declaration]
      30 |         *(volatile uint64_t *)addr_gpa2hva(vm, gpa) = magic_val;
         |                               ^~~~~~~~~~~~
   ro_memslot_test.c:30:10: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      30 |         *(volatile uint64_t *)addr_gpa2hva(vm, gpa) = magic_val;
         |          ^
   ro_memslot_test.c:32:9: warning: implicit declaration of function 'vcpu_set_args' [-Wimplicit-function-declaration]
      32 |         vcpu_set_args(vcpu, 2, gpa, magic_val);
         |         ^~~~~~~~~~~~~
   ro_memslot_test.c:34:9: warning: implicit declaration of function 'vcpu_run' [-Wimplicit-function-declaration]
      34 |         vcpu_run(vcpu);
         |         ^~~~~~~~
   In file included from ro_memslot_test.c:2:
>> ro_memslot_test.c:35:28: error: invalid use of undefined type 'struct kvm_vcpu'
      35 |         TEST_ASSERT_EQ(vcpu->run->exit_reason, KVM_EXIT_MMIO);
         |                            ^~
   include/test_util.h:58:16: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                ^
>> ro_memslot_test.c:35:28: error: invalid use of undefined type 'struct kvm_vcpu'
      35 |         TEST_ASSERT_EQ(vcpu->run->exit_reason, KVM_EXIT_MMIO);
         |                            ^~
   include/test_util.h:58:26: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                          ^
>> ro_memslot_test.c:35:48: error: 'KVM_EXIT_MMIO' undeclared (first use in this function)
      35 |         TEST_ASSERT_EQ(vcpu->run->exit_reason, KVM_EXIT_MMIO);
         |                                                ^~~~~~~~~~~~~
   include/test_util.h:59:16: note: in definition of macro 'TEST_ASSERT_EQ'
      59 |         typeof(b) __b = (b);                                            \
         |                ^
   ro_memslot_test.c:36:28: error: invalid use of undefined type 'struct kvm_vcpu'
      36 |         TEST_ASSERT_EQ(vcpu->run->mmio.is_write, true);
         |                            ^~
   include/test_util.h:58:16: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                ^
   ro_memslot_test.c:36:28: error: invalid use of undefined type 'struct kvm_vcpu'
      36 |         TEST_ASSERT_EQ(vcpu->run->mmio.is_write, true);
         |                            ^~
   include/test_util.h:58:26: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                          ^
   ro_memslot_test.c:37:28: error: invalid use of undefined type 'struct kvm_vcpu'
      37 |         TEST_ASSERT_EQ(vcpu->run->mmio.len, 8);
         |                            ^~
   include/test_util.h:58:16: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                ^
   ro_memslot_test.c:37:28: error: invalid use of undefined type 'struct kvm_vcpu'
      37 |         TEST_ASSERT_EQ(vcpu->run->mmio.len, 8);
         |                            ^~
   include/test_util.h:58:26: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                          ^
   ro_memslot_test.c:38:28: error: invalid use of undefined type 'struct kvm_vcpu'
      38 |         TEST_ASSERT_EQ(vcpu->run->mmio.phys_addr, gpa);
         |                            ^~
   include/test_util.h:58:16: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                ^
   ro_memslot_test.c:38:28: error: invalid use of undefined type 'struct kvm_vcpu'
      38 |         TEST_ASSERT_EQ(vcpu->run->mmio.phys_addr, gpa);
         |                            ^~
   include/test_util.h:58:26: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                          ^
   ro_memslot_test.c:39:41: error: invalid use of undefined type 'struct kvm_vcpu'
      39 |         TEST_ASSERT_EQ(*(uint64_t *)vcpu->run->mmio.data, ~magic_val);
         |                                         ^~
   include/test_util.h:58:16: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                ^
   ro_memslot_test.c:39:41: error: invalid use of undefined type 'struct kvm_vcpu'
      39 |         TEST_ASSERT_EQ(*(uint64_t *)vcpu->run->mmio.data, ~magic_val);
         |                                         ^~
   include/test_util.h:58:26: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                          ^
   ro_memslot_test.c:42:24: warning: implicit declaration of function 'get_ucall' [-Wimplicit-function-declaration]
      42 |         TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
         |                        ^~~~~~~~~
   include/test_util.h:58:16: note: in definition of macro 'TEST_ASSERT_EQ'
      58 |         typeof(a) __a = (a);                                            \
         |                ^
>> ro_memslot_test.c:42:47: error: 'UCALL_DONE' undeclared (first use in this function)
      42 |         TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
         |                                               ^~~~~~~~~~
   include/test_util.h:59:16: note: in definition of macro 'TEST_ASSERT_EQ'
      59 |         typeof(b) __b = (b);                                            \
         |                ^
   ro_memslot_test.c:44:9: warning: implicit declaration of function 'kvm_vm_free' [-Wimplicit-function-declaration]
      44 |         kvm_vm_free(vm);
         |         ^~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
