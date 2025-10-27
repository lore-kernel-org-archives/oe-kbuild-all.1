Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1912D662D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 05:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544392; cv=none; b=beYoIK68hNoA4gU2uKmFuPXEzz1siqg5K8jU77vm2H9Vc3RBIlqnzlYv5I3YOhqmpYDGnhehr3SZsmb7F/H4Z2dSlZo9eIMjs+1C7JcvDGd1aS3kd3893N6sIn6v02lvpAFLWdBVKeilMptaUNLlDP4iUoe9/SLjldeS/piWhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544392; c=relaxed/simple;
	bh=bvOxGmJyaVx2xXh8KIXsuzfj+wxAfVmqA41XCR5coZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1QJW5fFr0JEBEUxCyCJTy59cbyX70ObZKJmXiW0YuR3HKqJqW+VTai/5mpH+EQ3TW9fNCWc4/Bh3Jwu2YdWSmd6lP6KUQ/rmfruha+8FmrxkZzh+wU+LIF/ku4q8uJcybXYebbieuEpaF9aq2KxGJLe+giAbRVCHUI3OJa+vf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLe20OEq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLe20OEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761544390; x=1793080390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvOxGmJyaVx2xXh8KIXsuzfj+wxAfVmqA41XCR5coZk=;
  b=KLe20OEqL7amh3AVHZZTvXZi0a7wEj5Z4dHRHIxbIBgyaR2/G+u7yKf+
   eNcfLP8apmlOGFiWawueCCSEWy7yoU3kezZiCoHaMQpIypyuA6+k/mnkW
   Aw68iL6P8OzZiUOVLV7I+1uLdoz0d5JYKuMP3Wf8JEHBkECFC0t4yjJJx
   pJJNqsxtu80+JzscVA5ICPrZIFmCki4fxWcq0llLPC6ekEWemNz9qnB5Z
   H67d8zuj5u8rjpaaXzItYYfcVhXjl5iBAA3F8eNrOeR36LUQXRpqzpkw/
   CW0Tuf5otw88LOhi1RbyUVT4puK/jtwpoZN3PNgiLvp1KG10gCkvmSM3W
   Q==;
X-CSE-ConnectionGUID: i71RSlBRRAqG9wXJqe+16Q==
X-CSE-MsgGUID: 7MHZEVHBQGWaOZ/gD7bmEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62825085"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="62825085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 22:53:06 -0700
X-CSE-ConnectionGUID: VcRV2vTMRv659ySMjMTPMA==
X-CSE-MsgGUID: LT2kODJ6TAaSGjlRF0DZvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="215852781"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2025 22:53:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDG9S-000GXx-2E;
	Mon, 27 Oct 2025 05:52:40 +0000
Date: Mon, 27 Oct 2025 13:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3045/3045] arch/x86/kvm/vmx/vmx.h:757:26: error:
 'struct kvm_vcpu_arch' has no member named 'hyperv_enabled'
Message-ID: <202510271331.Y6ayA7xV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9094437bec1ace7378abfe84597e722209d03f85
commit: 2a3cfce9a18a4b772f01830cbc95fe00125431d8 [3045/3045] KVM: x86: Make Hyper-V emulation optional
config: x86_64-buildonly-randconfig-002-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271331.Y6ayA7xV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271331.Y6ayA7xV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271331.Y6ayA7xV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/kvm-asm-offsets.c:10:
   arch/x86/kvm/vmx/vmx.h: In function 'guest_cpuid_has_evmcs':
>> arch/x86/kvm/vmx/vmx.h:757:26: error: 'struct kvm_vcpu_arch' has no member named 'hyperv_enabled'
     757 |         return vcpu->arch.hyperv_enabled &&
         |                          ^
--
   In file included from arch/x86/kvm/vmx/nested.h:8,
                    from arch/x86/kvm/vmx/nested.c:14:
   arch/x86/kvm/vmx/vmx.h: In function 'guest_cpuid_has_evmcs':
>> arch/x86/kvm/vmx/vmx.h:757:26: error: 'struct kvm_vcpu_arch' has no member named 'hyperv_enabled'
     757 |         return vcpu->arch.hyperv_enabled &&
         |                          ^
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from arch/x86/kvm/vmx/nested.c:5:
   arch/x86/kvm/vmx/nested.c: In function 'nested_vmx_transition_tlb_flush':
>> arch/x86/kvm/vmx/nested.c:1178:13: error: implicit declaration of function 'to_hv_vcpu' [-Wimplicit-function-declaration]
    1178 |         if (to_hv_vcpu(vcpu) && enable_ept)
         |             ^~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/vmx/nested.c:1178:9: note: in expansion of macro 'if'
    1178 |         if (to_hv_vcpu(vcpu) && enable_ept)
         |         ^~
--
   In file included from arch/x86/kvm/vmx/nested.h:8,
                    from arch/x86/kvm/vmx/vmx.c:60:
   arch/x86/kvm/vmx/vmx.h: In function 'guest_cpuid_has_evmcs':
>> arch/x86/kvm/vmx/vmx.h:757:26: error: 'struct kvm_vcpu_arch' has no member named 'hyperv_enabled'
     757 |         return vcpu->arch.hyperv_enabled &&
         |                          ^
   arch/x86/kvm/vmx/vmx.c: In function 'hv_enable_l2_tlb_flush':
>> arch/x86/kvm/vmx/vmx.c:540:26: error: implicit declaration of function 'to_kvm_hv'; did you mean 'to_kvm_vmx'? [-Wimplicit-function-declaration]
     540 |                         &to_kvm_hv(vcpu->kvm)->hv_pa_pg;
         |                          ^~~~~~~~~
         |                          to_kvm_vmx
   arch/x86/kvm/vmx/vmx.c:540:46: error: invalid type argument of '->' (have 'int')
     540 |                         &to_kvm_hv(vcpu->kvm)->hv_pa_pg;
         |                                              ^~
--
   arch/x86/kvm/x86.c: In function 'kvm_arch_free_vm':
>> arch/x86/kvm/x86.c:12528:15: error: implicit declaration of function 'to_kvm_hv' [-Wimplicit-function-declaration]
   12528 |         kfree(to_kvm_hv(kvm)->hv_pa_pg);
         |               ^~~~~~~~~
>> arch/x86/kvm/x86.c:12528:29: error: invalid type argument of '->' (have 'int')
   12528 |         kfree(to_kvm_hv(kvm)->hv_pa_pg);
         |                             ^~
--
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:99,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/lapic.c:20:
   arch/x86/kvm/lapic.c: In function 'apic_set_eoi':
>> arch/x86/kvm/lapic.c:1479:13: error: implicit declaration of function 'to_hv_vcpu' [-Wimplicit-function-declaration]
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |             ^~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
>> arch/x86/kvm/lapic.c:1480:30: error: implicit declaration of function 'to_hv_synic' [-Wimplicit-function-declaration]
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                              ^~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
>> arch/x86/kvm/lapic.c:1480:53: error: invalid type argument of '->' (have 'int')
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |                                                     ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1479:9: note: in expansion of macro 'if'
    1479 |         if (to_hv_vcpu(apic->vcpu) &&
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:1480:13: note: in expansion of macro 'test_bit'
    1480 |             test_bit(vector, to_hv_synic(apic->vcpu)->vec_bitmap))
         |             ^~~~~~~~
   arch/x86/kvm/lapic.c: In function 'kvm_get_apic_interrupt':
   arch/x86/kvm/lapic.c:2954:67: error: invalid type argument of '->' (have 'int')
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                                   ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:2954:9: note: in expansion of macro 'if'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:2954:33: note: in expansion of macro 'test_bit'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                 ^~~~~~~~
   arch/x86/kvm/lapic.c:2954:67: error: invalid type argument of '->' (have 'int')
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                                   ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:2954:9: note: in expansion of macro 'if'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:2954:33: note: in expansion of macro 'test_bit'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                 ^~~~~~~~
   arch/x86/kvm/lapic.c:2954:67: error: invalid type argument of '->' (have 'int')
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                                   ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:2954:9: note: in expansion of macro 'if'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:2954:33: note: in expansion of macro 'test_bit'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                 ^~~~~~~~
   arch/x86/kvm/lapic.c:2954:67: error: invalid type argument of '->' (have 'int')
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                                   ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:2954:9: note: in expansion of macro 'if'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:2954:33: note: in expansion of macro 'test_bit'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                 ^~~~~~~~
   arch/x86/kvm/lapic.c:2954:67: error: invalid type argument of '->' (have 'int')
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                                   ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/lapic.c:2954:9: note: in expansion of macro 'if'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |         ^~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                         ^~~~~
   arch/x86/kvm/lapic.c:2954:33: note: in expansion of macro 'test_bit'
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                 ^~~~~~~~
   arch/x86/kvm/lapic.c:2954:67: error: invalid type argument of '->' (have 'int')
    2954 |         if (to_hv_vcpu(vcpu) && test_bit(vector, to_hv_synic(vcpu)->auto_eoi_bitmap)) {
         |                                                                   ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/x86/kvm/lapic.c:2954:9: note: in expansion of macro 'if'
..


vim +757 arch/x86/kvm/vmx/vmx.h

d588bb9be1da6a Chao Gao            2022-04-19  750  
85ab071af83952 Sean Christopherson 2022-08-30  751  static inline bool guest_cpuid_has_evmcs(struct kvm_vcpu *vcpu)
85ab071af83952 Sean Christopherson 2022-08-30  752  {
85ab071af83952 Sean Christopherson 2022-08-30  753  	/*
85ab071af83952 Sean Christopherson 2022-08-30  754  	 * eVMCS is exposed to the guest if Hyper-V is enabled in CPUID and
85ab071af83952 Sean Christopherson 2022-08-30  755  	 * eVMCS has been explicitly enabled by userspace.
85ab071af83952 Sean Christopherson 2022-08-30  756  	 */
85ab071af83952 Sean Christopherson 2022-08-30 @757  	return vcpu->arch.hyperv_enabled &&
85ab071af83952 Sean Christopherson 2022-08-30  758  	       to_vmx(vcpu)->nested.enlightened_vmcs_enabled;
85ab071af83952 Sean Christopherson 2022-08-30  759  }
85ab071af83952 Sean Christopherson 2022-08-30  760  

:::::: The code at line 757 was first introduced by commit
:::::: 85ab071af83952a44473e3d02304c17053ade2f4 KVM: nVMX: Treat eVMCS as enabled for guest iff Hyper-V is also enabled

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
