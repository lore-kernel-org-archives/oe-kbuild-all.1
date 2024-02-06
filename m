Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE61BDD9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707256405; cv=none; b=PmedzBnXdOxPdbEM8H8cBK3dE1Fg2gM+zlsF1PVHrXdwn7GHjhYXsmezqsYXpRUkexmZaKQ0PcKaOO+K8rfYeo6bdyXxMt6i0L1uSN305AQ99l87OorhJQuX/J4dsT49PJceluivsgnGte630Alv/OgUBQqrXjiAoCTkYmYfhMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707256405; c=relaxed/simple;
	bh=rPLwAShfqSYglh11kXyiT/05bFHEp31jbN2WGqklEBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hR8ICtOE1sho7URP/YKfHMb+3FtzYpn1yU7P3zMPPhdbZb29oAkEdBElDFCJH5aCtJzaoXZTToFAskOvoimzcUzoa6AVJsdduNM/RrQDh/n/q5xysS9tdbp9862O2XJ+cPZ20bP4jAfBrDXaZxBG8QJL9/Lk8NSyVaSd5XixHQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edKrH3K5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edKrH3K5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707256402; x=1738792402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rPLwAShfqSYglh11kXyiT/05bFHEp31jbN2WGqklEBw=;
  b=edKrH3K5RSzB9Yzq5iyCVT9gB+q93pcL5IBAn8ipl98t3ZIy8rK+ReLs
   6TT5AsRo7H81YSzpiXiDNBuBq1b8QoPYTVIwAbP5BfOxNYbENChJ+5Cr6
   n5aT2sHykLztSRxAY6b/7vm8AdsOb1FrdOZI9id3nlWMO9ZMaoWxj1tII
   63vq6Iq765564XjchFhG6ckuoZCH6ENsVsGdOKhGjmHO6L4UTSvcjEg2J
   4VTPSSS87QEC24B++GiQ5QSHvX0wI2rDQh4rZ/CRSnzmh/bY12mNP9btB
   cFwzXnoIgUurO10yJ+dmAIWkcT/AIe3qfsK+y36Zaqt6QTlN8AA7MEIjT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="761822"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="761822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 13:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1487427"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2024 13:53:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXTNW-0001od-1I;
	Tue, 06 Feb 2024 21:53:18 +0000
Date: Wed, 7 Feb 2024 05:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 311/376]
 include/linux/compiler_types.h:435:45: error: call to
 '__compiletime_assert_599' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(attrs->attributes) != sizeof(unsigned long)
Message-ID: <202402070531.a2HFdlz2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   e7a7b1f2a1c28403511e71538d30888c9e1425ef
commit: c31cc15694db5786e00039aef9864df6dfc60a2d [311/376] x86/virt/tdx: Boot-time tdx module loading
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240207/202402070531.a2HFdlz2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070531.a2HFdlz2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070531.a2HFdlz2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'kvm_vm_ioctl_set_mem_attributes',
       inlined from 'kvm_vm_ioctl' at arch/x86/kvm/../../../virt/kvm/kvm_main.c:5346:7:
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_599' declared with attribute error: BUILD_BUG_ON failed: sizeof(attrs->attributes) != sizeof(unsigned long)
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:2657:9: note: in expansion of macro 'BUILD_BUG_ON'
    2657 |         BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_bind':
>> include/linux/compiler_types.h:435:45: error: call to '__compiletime_assert_353' declared with attribute error: BUILD_BUG_ON failed: sizeof(gfn_t) != sizeof(slot->gmem.pgoff)
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:416:25: note: in definition of macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:453:9: note: in expansion of macro 'BUILD_BUG_ON'
     453 |         BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
         |         ^~~~~~~~~~~~
--
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a0_read':
>> arch/x86/kvm/vmx/tdx.c:221:16: error: implicit declaration of function 'kvm_r12_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
     221 |         return kvm_##gpr##_read(vcpu);                                  \
         |                ^~~~
   arch/x86/kvm/vmx/tdx.c:228:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     228 | BUILD_TDVMCALL_ACCESSORS(a0, r12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a0_write':
>> arch/x86/kvm/vmx/tdx.c:226:9: error: implicit declaration of function 'kvm_r12_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
     226 |         kvm_##gpr##_write(vcpu, val);                                   \
         |         ^~~~
   arch/x86/kvm/vmx/tdx.c:228:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     228 | BUILD_TDVMCALL_ACCESSORS(a0, r12);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a1_read':
>> arch/x86/kvm/vmx/tdx.c:221:16: error: implicit declaration of function 'kvm_r13_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
     221 |         return kvm_##gpr##_read(vcpu);                                  \
         |                ^~~~
   arch/x86/kvm/vmx/tdx.c:229:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     229 | BUILD_TDVMCALL_ACCESSORS(a1, r13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a1_write':
>> arch/x86/kvm/vmx/tdx.c:226:9: error: implicit declaration of function 'kvm_r13_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
     226 |         kvm_##gpr##_write(vcpu, val);                                   \
         |         ^~~~
   arch/x86/kvm/vmx/tdx.c:229:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     229 | BUILD_TDVMCALL_ACCESSORS(a1, r13);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a2_read':
>> arch/x86/kvm/vmx/tdx.c:221:16: error: implicit declaration of function 'kvm_r14_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
     221 |         return kvm_##gpr##_read(vcpu);                                  \
         |                ^~~~
   arch/x86/kvm/vmx/tdx.c:230:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     230 | BUILD_TDVMCALL_ACCESSORS(a2, r14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a2_write':
>> arch/x86/kvm/vmx/tdx.c:226:9: error: implicit declaration of function 'kvm_r14_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
     226 |         kvm_##gpr##_write(vcpu, val);                                   \
         |         ^~~~
   arch/x86/kvm/vmx/tdx.c:230:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     230 | BUILD_TDVMCALL_ACCESSORS(a2, r14);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a3_read':
>> arch/x86/kvm/vmx/tdx.c:221:16: error: implicit declaration of function 'kvm_r15_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
     221 |         return kvm_##gpr##_read(vcpu);                                  \
         |                ^~~~
   arch/x86/kvm/vmx/tdx.c:231:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     231 | BUILD_TDVMCALL_ACCESSORS(a3, r15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_a3_write':
>> arch/x86/kvm/vmx/tdx.c:226:9: error: implicit declaration of function 'kvm_r15_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
     226 |         kvm_##gpr##_write(vcpu, val);                                   \
         |         ^~~~
   arch/x86/kvm/vmx/tdx.c:231:1: note: in expansion of macro 'BUILD_TDVMCALL_ACCESSORS'
     231 | BUILD_TDVMCALL_ACCESSORS(a3, r15);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_exit_type':
>> arch/x86/kvm/vmx/tdx.c:235:16: error: implicit declaration of function 'kvm_r10_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
     235 |         return kvm_r10_read(vcpu);
         |                ^~~~~~~~~~~~
         |                kvm_rsp_read
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_leaf':
>> arch/x86/kvm/vmx/tdx.c:239:16: error: implicit declaration of function 'kvm_r11_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
     239 |         return kvm_r11_read(vcpu);
         |                ^~~~~~~~~~~~
         |                kvm_rsp_read
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_set_return_code':
>> arch/x86/kvm/vmx/tdx.c:244:9: error: implicit declaration of function 'kvm_r10_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
     244 |         kvm_r10_write(vcpu, val);
         |         ^~~~~~~~~~~~~
         |         kvm_rsp_write
   arch/x86/kvm/vmx/tdx.c: In function 'tdvmcall_set_return_val':
>> arch/x86/kvm/vmx/tdx.c:249:9: error: implicit declaration of function 'kvm_r11_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
     249 |         kvm_r11_write(vcpu, val);
         |         ^~~~~~~~~~~~~
         |         kvm_rsp_write
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_clear_page':
>> arch/x86/kvm/vmx/tdx.c:334:9: error: implicit declaration of function '__mb' [-Werror=implicit-function-declaration]
     334 |         __mb();
         |         ^~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_prepare_switch_to_guest':
>> arch/x86/kvm/vmx/tdx.c:859:63: error: 'struct thread_struct' has no member named 'gsbase'
     859 |                 tdx->msr_host_kernel_gs_base = current->thread.gsbase;
         |                                                               ^
>> arch/x86/kvm/vmx/tdx.c:861:48: error: implicit declaration of function 'read_msr'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
     861 |                 tdx->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
         |                                                ^~~~~~~~
         |                                                readsl
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_vcpu_enter_exit':
>> arch/x86/kvm/vmx/tdx.c:1100:20: error: implicit declaration of function 'kvm_r9_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
    1100 |             is_nmi(kvm_r9_read(vcpu))) {
         |                    ^~~~~~~~~~~
         |                    kvm_rsp_read
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_vcpu_run':
>> arch/x86/kvm/vmx/tdx.c:1189:25: error: implicit declaration of function 'kvm_r8_read'; did you mean 'kvm_rsp_read'? [-Werror=implicit-function-declaration]
    1189 |         tdx->exit_gpa = kvm_r8_read(vcpu);
         |                         ^~~~~~~~~~~
         |                         kvm_rsp_read
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_complete_vp_vmcall':
>> arch/x86/kvm/vmx/tdx.c:1422:25: error: implicit declaration of function 'kvm_r8_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
    1422 |                         kvm_## REG ## _write(vcpu, tdx_vmcall->out_ ## REG);    \
         |                         ^~~~
   arch/x86/kvm/vmx/tdx.c:1435:9: note: in expansion of macro 'COPY_REG'
    1435 |         COPY_REG(R8, r8);
         |         ^~~~~~~~
>> arch/x86/kvm/vmx/tdx.c:1422:25: error: implicit declaration of function 'kvm_r9_write'; did you mean 'kvm_rsp_write'? [-Werror=implicit-function-declaration]
    1422 |                         kvm_## REG ## _write(vcpu, tdx_vmcall->out_ ## REG);    \
         |                         ^~~~
   arch/x86/kvm/vmx/tdx.c:1436:9: note: in expansion of macro 'COPY_REG'
    1436 |         COPY_REG(R9, r9);
         |         ^~~~~~~~
   In file included from arch/x86/kvm/vmx/tdx_ops.h:18,
                    from arch/x86/kvm/vmx/tdx.h:9,
                    from arch/x86/kvm/vmx/common.h:14,
                    from arch/x86/kvm/vmx/tdx.c:11:
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_emulate_io':
>> arch/x86/kvm/vmx/tdx_errno.h:110:49: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '9223372036854775808' to '0' [-Woverflow]
     110 | #define TDG_VP_VMCALL_INVALID_OPERAND           0x8000000000000000ULL
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:1557:48: note: in expansion of macro 'TDG_VP_VMCALL_INVALID_OPERAND'
    1557 |                 tdvmcall_set_return_code(vcpu, TDG_VP_VMCALL_INVALID_OPERAND);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_emulate_mmio':
   arch/x86/kvm/vmx/tdx_errno.h:110:49: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '9223372036854775808' to '0' [-Woverflow]
     110 | #define TDG_VP_VMCALL_INVALID_OPERAND           0x8000000000000000ULL
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:1690:40: note: in expansion of macro 'TDG_VP_VMCALL_INVALID_OPERAND'
    1690 |         tdvmcall_set_return_code(vcpu, TDG_VP_VMCALL_INVALID_OPERAND);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_emulate_rdmsr':
   arch/x86/kvm/vmx/tdx_errno.h:110:49: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '9223372036854775808' to '0' [-Woverflow]
     110 | #define TDG_VP_VMCALL_INVALID_OPERAND           0x8000000000000000ULL
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:1702:48: note: in expansion of macro 'TDG_VP_VMCALL_INVALID_OPERAND'
    1702 |                 tdvmcall_set_return_code(vcpu, TDG_VP_VMCALL_INVALID_OPERAND);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_emulate_wrmsr':
   arch/x86/kvm/vmx/tdx_errno.h:110:49: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '9223372036854775808' to '0' [-Woverflow]
     110 | #define TDG_VP_VMCALL_INVALID_OPERAND           0x8000000000000000ULL
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:1720:48: note: in expansion of macro 'TDG_VP_VMCALL_INVALID_OPERAND'
    1720 |                 tdvmcall_set_return_code(vcpu, TDG_VP_VMCALL_INVALID_OPERAND);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_get_td_vm_call_info':
   arch/x86/kvm/vmx/tdx_errno.h:110:49: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '9223372036854775808' to '0' [-Woverflow]
     110 | #define TDG_VP_VMCALL_INVALID_OPERAND           0x8000000000000000ULL
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:1732:48: note: in expansion of macro 'TDG_VP_VMCALL_INVALID_OPERAND'
    1732 |                 tdvmcall_set_return_code(vcpu, TDG_VP_VMCALL_INVALID_OPERAND);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_cache_reg':
   arch/x86/kvm/vmx/tdx.c:2938:57: warning: left shift count >= width of type [-Wshift-count-overflow]
    2938 |                         vcpu->arch.regs[reg] = 0xdeadul << 48;
         |                                                         ^~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_get_capabilities':
   arch/x86/kvm/vmx/tdx.c:3314:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3314 |         user_caps = (void __user *)cmd->data;
         |                     ^
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_td_init':
   arch/x86/kvm/vmx/tdx.c:3744:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3744 |         if (copy_from_user(init_vm, (void __user *)cmd->data, sizeof(*init_vm))) {
         |                                     ^
   arch/x86/kvm/vmx/tdx.c:3753:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3753 |                            (void __user *)cmd->data + sizeof(*init_vm),
         |                            ^
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_init_mem_region':
   arch/x86/kvm/vmx/tdx.c:3859:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3859 |         if (copy_from_user(&region, (void __user *)cmd->data, sizeof(region)))
         |                                     ^
   arch/x86/kvm/vmx/tdx.c:3925:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    3925 |         if (copy_to_user((void __user *)cmd->data, &region, sizeof(region)))
         |                          ^
   In file included from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/x86/kvm/vmx/tdx.c:2:
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_read_write_memory':
   arch/x86/kvm/vmx/tdx.c:4540:19: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    4540 |         free_page((u64)tmp_buf);
         |                   ^
   include/linux/gfp.h:328:37: note: in definition of macro 'free_page'
     328 | #define free_page(addr) free_pages((addr), 0)
         |                                     ^~~~
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_read_guest_memory':
   arch/x86/kvm/vmx/tdx.c:4650:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    4650 |                                             (void __user *)rw_memory->ubuf,
         |                                             ^
   arch/x86/kvm/vmx/tdx.c: In function 'tdx_write_guest_memory':
   arch/x86/kvm/vmx/tdx.c:4731:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    4731 |                                             (void __user *)rw_memory->ubuf,
         |                                             ^
   cc1: some warnings being treated as errors
--
   arch/x86/kvm/vmx/vmenter.S: Assembler messages:
>> arch/x86/kvm/vmx/vmenter.S:87: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:88: Error: bad register name `%rsp'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:94: Error: bad register name `%rdi'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/vmenter.S:97: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:98: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:99: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:100: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:101: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:102: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:111: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:112: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:113: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:114: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:115: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:117: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:118: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:119: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:120: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:121: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:125: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:128: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/vmenter.S:130: Error: bad register name `%rsi)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:173: Error: `pushq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:174: Error: bad register name `%rsp)'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:175: Error: bad register name `%rsi'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:176: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:177: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:180: Error: bad register name `%r12'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:181: Error: bad register name `%r13'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:182: Error: bad register name `%r14'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:183: Error: bad register name `%r15'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:184: Error: bad register name `%rbx'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:185: Error: bad register name `%rdi'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:189: Error: bad register name `%rcx'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:190: Error: bad register name `%rdx'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:191: Error: bad register name `%r8'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:192: Error: bad register name `%r9'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:193: Error: bad register name `%r10'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
>> arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:194: Error: bad register name `%r11'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:215: Error: bad register name `%r8d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:216: Error: bad register name `%r9d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:217: Error: bad register name `%r10d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:218: Error: bad register name `%r11d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:219: Error: bad register name `%r12d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:220: Error: bad register name `%r13d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:221: Error: bad register name `%r14d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:222: Error: bad register name `%r15d'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:233: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:234: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:235: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:236: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:237: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:241: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:249: Error: bad register name `%rax'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:261: Error: bad register name `%rdi'
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:262: Error: `orq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
   arch/x86/kvm/vmx/../../virt/vmx/tdx/tdxcall.S:267: Error: `popq' is only supported in 64-bit mode
   arch/x86/kvm/vmx/vmenter.S:400:  Info: macro invoked from here
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_TDX_HOST
   Depends on [n]: CPU_SUP_INTEL [=y] && X86_64 [=n] && KVM_INTEL [=m] && X86_X2APIC [=n] && CONTIG_ALLOC [=y] && !KEXEC_CORE [=y] && X86_MCE [=y]
   Selected by [y]:
   - INTEL_TDX_MODULE_LOADER_OLD [=y] && SYSFS [=y]
   WARNING: unmet direct dependencies detected for KVM_SW_PROTECTED_VM
   Depends on [n]: VIRTUALIZATION [=y] && KVM [=m] && X86_64 [=n]
   Selected by [m]:
   - KVM_INTEL [=m] && VIRTUALIZATION [=y] && KVM [=m] && IA32_FEAT_CTL [=y] && INTEL_TDX_HOST [=y]


vim +/__compiletime_assert_599 +435 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  421  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  422  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  423  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  424  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  425  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  426   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  427   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  428   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  429   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  430   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  431   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  432   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  433   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  434  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @435  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436  

:::::: The code at line 435 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
