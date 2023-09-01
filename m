Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B260F15A6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 02:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693536261; x=1725072261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JN+eL97Vo5rG02ORa9ckd8rD0PXvSUfH4/kId/TJqwQ=;
  b=nHjjaMyEdHCYDyZ3/1HCP600Q6E+D5dOpa2FhJQFQW+7PAW6ndhpg54M
   mWXYYxern9FzD+2uWrxDBrnDranZi2nLFaw2K2xv+21muuLsWTz/2o0G6
   qMtHLqzxg1kkJcav2zgO5VlM7ReQU+j4PbZQT27PPz2vSrahfIpuncjut
   klt7cWu35oSPJJDQPAl9kQyqcNTC4z1CfcdQMvP4F2tvZZWIC4Hr9Qpts
   9GZCvpSNOm68AyPCTuEErMRB5weDiYFhB1gg4bcWJdMv2vzeYzOJPtJVH
   8WcDCsz1R0/hxMKldgO71ttxVOer4bSUUMsKdSXBcKJfc5LFTJtcqH9gZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373515702"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="373515702"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 19:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070571293"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="1070571293"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2023 19:44:18 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbu8u-0000n5-37;
	Fri, 01 Sep 2023 02:44:16 +0000
Date: Fri, 1 Sep 2023 10:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/hide_kvm_details 2/3]
 arch/powerpc/include/asm/kvm_host.h:91:36: error: field 'generic' has
 incomplete type
Message-ID: <202309011039.Tz95xggx-lkp@intel.com>
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
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230901/202309011039.Tz95xggx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011039.Tz95xggx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011039.Tz95xggx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:45,
                    from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/kvm_host.h:91:36: error: field 'generic' has incomplete type
      91 |         struct kvm_vm_stat_generic generic;
         |                                    ^~~~~~~
   arch/powerpc/include/asm/kvm_host.h:97:38: error: field 'generic' has incomplete type
      97 |         struct kvm_vcpu_stat_generic generic;
         |                                      ^~~~~~~
   In file included from arch/powerpc/include/asm/kvm_ppc.h:22:
   arch/powerpc/include/asm/kvm_book3s.h: In function 'to_book3s':
>> arch/powerpc/include/asm/kvm_book3s.h:323:20: error: invalid use of undefined type 'struct kvm_vcpu'
     323 |         return vcpu->arch.book3s;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_gpr':
   arch/powerpc/include/asm/kvm_book3s.h:337:13: error: invalid use of undefined type 'struct kvm_vcpu'
     337 |         vcpu->arch.regs.gpr[num] = val;
         |             ^~
>> arch/powerpc/include/asm/kvm_book3s.h:335:62: warning: parameter 'num' set but not used [-Wunused-but-set-parameter]
     335 | static inline void kvmppc_set_gpr(struct kvm_vcpu *vcpu, int num, ulong val)
         |                                                          ~~~~^~~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_gpr':
   arch/powerpc/include/asm/kvm_book3s.h:342:20: error: invalid use of undefined type 'struct kvm_vcpu'
     342 |         return vcpu->arch.regs.gpr[num];
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h:340:63: warning: parameter 'num' set but not used [-Wunused-but-set-parameter]
     340 | static inline ulong kvmppc_get_gpr(struct kvm_vcpu *vcpu, int num)
         |                                                           ~~~~^~~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_cr':
   arch/powerpc/include/asm/kvm_book3s.h:347:13: error: invalid use of undefined type 'struct kvm_vcpu'
     347 |         vcpu->arch.regs.ccr = val;
         |             ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_cr':
   arch/powerpc/include/asm/kvm_book3s.h:352:20: error: invalid use of undefined type 'struct kvm_vcpu'
     352 |         return vcpu->arch.regs.ccr;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_xer':
   arch/powerpc/include/asm/kvm_book3s.h:357:13: error: invalid use of undefined type 'struct kvm_vcpu'
     357 |         vcpu->arch.regs.xer = val;
         |             ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_xer':
   arch/powerpc/include/asm/kvm_book3s.h:362:20: error: invalid use of undefined type 'struct kvm_vcpu'
     362 |         return vcpu->arch.regs.xer;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_ctr':
   arch/powerpc/include/asm/kvm_book3s.h:367:13: error: invalid use of undefined type 'struct kvm_vcpu'
     367 |         vcpu->arch.regs.ctr = val;
         |             ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_ctr':
   arch/powerpc/include/asm/kvm_book3s.h:372:20: error: invalid use of undefined type 'struct kvm_vcpu'
     372 |         return vcpu->arch.regs.ctr;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_lr':
   arch/powerpc/include/asm/kvm_book3s.h:377:13: error: invalid use of undefined type 'struct kvm_vcpu'
     377 |         vcpu->arch.regs.link = val;
         |             ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_lr':
   arch/powerpc/include/asm/kvm_book3s.h:382:20: error: invalid use of undefined type 'struct kvm_vcpu'
     382 |         return vcpu->arch.regs.link;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_pc':
   arch/powerpc/include/asm/kvm_book3s.h:387:13: error: invalid use of undefined type 'struct kvm_vcpu'
     387 |         vcpu->arch.regs.nip = val;
         |             ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_pc':
   arch/powerpc/include/asm/kvm_book3s.h:392:20: error: invalid use of undefined type 'struct kvm_vcpu'
     392 |         return vcpu->arch.regs.nip;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_fault_dar':
   arch/powerpc/include/asm/kvm_book3s.h:403:20: error: invalid use of undefined type 'struct kvm_vcpu'
     403 |         return vcpu->arch.fault_dar;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_dec_expires_host_tb':
   arch/powerpc/include/asm/kvm_book3s.h:409:20: error: invalid use of undefined type 'struct kvm_vcpu'
     409 |         return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
         |                    ^~
   arch/powerpc/include/asm/kvm_book3s.h:409:45: error: invalid use of undefined type 'struct kvm_vcpu'
     409 |         return vcpu->arch.dec_expires - vcpu->arch.vcore->tb_offset;
         |                                             ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_supports_magic_page':
   arch/powerpc/include/asm/kvm_book3s.h:421:42: error: invalid use of undefined type 'struct kvm_vcpu'
     421 |         return !is_kvmppc_hv_enabled(vcpu->kvm);
         |                                          ^~
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_pack_vcpu_id':
>> arch/powerpc/include/asm/kvm_book3s.h:474:25: error: invalid use of undefined type 'struct kvm'
     474 |         int stride = kvm->arch.emul_smt_mode;
         |                         ^~
   arch/powerpc/include/asm/kvm_ppc.h: At top level:
>> arch/powerpc/include/asm/kvm_ppc.h:287:57: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     287 |         bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                         ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:288:49: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:289:54: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     289 |         bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:290:54: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     290 |         bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_get_last_inst':
>> arch/powerpc/include/asm/kvm_ppc.h:336:17: error: invalid use of undefined type 'struct kvm_vcpu'
     336 |         if (vcpu->arch.last_inst == KVM_INST_FETCH_FAILED)
         |                 ^~
   arch/powerpc/include/asm/kvm_ppc.h:337:62: error: invalid use of undefined type 'struct kvm_vcpu'
     337 |                 ret = kvmppc_load_last_inst(vcpu, type, &vcpu->arch.last_inst);
         |                                                              ^~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/powerpc/include/asm/bitops.h:336,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/powerpc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/kvm_ppc.h:360:28: error: invalid use of undefined type 'struct kvm_vcpu'
     360 |                 swab32(vcpu->arch.last_inst) :
         |                            ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   arch/powerpc/include/asm/kvm_ppc.h:360:17: note: in expansion of macro 'swab32'
     360 |                 swab32(vcpu->arch.last_inst) :
         |                 ^~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:361:21: error: invalid use of undefined type 'struct kvm_vcpu'
     361 |                 vcpu->arch.last_inst;
         |                     ^~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'is_kvmppc_hv_enabled':
>> arch/powerpc/include/asm/kvm_ppc.h:368:19: error: invalid use of undefined type 'struct kvm'
     368 |         return kvm->arch.kvm_ops == kvmppc_hv_ops;
         |                   ^~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_fast_vcpu_kick':
>> arch/powerpc/include/asm/kvm_ppc.h:601:9: error: implicit declaration of function 'kvm_vcpu_kick' [-Werror=implicit-function-declaration]
     601 |         kvm_vcpu_kick(vcpu);
         |         ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: At top level:
>> arch/powerpc/include/asm/kvm_ppc.h:731:51: warning: 'struct kvm_device' declared inside parameter list will not be visible outside of this definition or declaration
     731 | static inline int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
         |                                                   ^~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:749:58: warning: 'struct kvm_device' declared inside parameter list will not be visible outside of this definition or declaration
     749 | static inline int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
         |                                                          ^~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:873:51: warning: 'struct kvm_device' declared inside parameter list will not be visible outside of this definition or declaration
     873 | static inline int kvmppc_mpic_connect_vcpu(struct kvm_device *dev,
         |                                                   ^~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_get_critical':
   arch/powerpc/include/asm/kvm_ppc.h:946:45: error: invalid use of undefined type 'struct kvm_vcpu'
     946 |                return be##size##_to_cpu(vcpu->arch.shared->reg);        \
         |                                             ^~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: in definition of macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:980:1: note: in expansion of macro 'SHARED_WRAPPER'
     980 | SHARED_WRAPPER(critical, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:948:45: error: invalid use of undefined type 'struct kvm_vcpu'
     948 |                return le##size##_to_cpu(vcpu->arch.shared->reg);        \
         |                                             ^~
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:980:1: note: in expansion of macro 'SHARED_WRAPPER'
     980 | SHARED_WRAPPER(critical, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_set_critical':
   arch/powerpc/include/asm/kvm_ppc.h:955:20: error: invalid use of undefined type 'struct kvm_vcpu'
     955 |                vcpu->arch.shared->reg = cpu_to_be##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:980:1: note: in expansion of macro 'SHARED_WRAPPER'
     980 | SHARED_WRAPPER(critical, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:957:20: error: invalid use of undefined type 'struct kvm_vcpu'
     957 |                vcpu->arch.shared->reg = cpu_to_le##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:980:1: note: in expansion of macro 'SHARED_WRAPPER'
     980 | SHARED_WRAPPER(critical, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_get_sprg0':
   arch/powerpc/include/asm/kvm_ppc.h:946:45: error: invalid use of undefined type 'struct kvm_vcpu'
     946 |                return be##size##_to_cpu(vcpu->arch.shared->reg);        \
         |                                             ^~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: in definition of macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:976:9: note: in expansion of macro 'SHARED_WRAPPER'
     976 |         SHARED_WRAPPER(reg, size)                                       \
         |         ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:981:1: note: in expansion of macro 'SHARED_SPRNG_WRAPPER'
     981 | SHARED_SPRNG_WRAPPER(sprg0, 64, SPRN_GSPRG0)
         | ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:948:45: error: invalid use of undefined type 'struct kvm_vcpu'
     948 |                return le##size##_to_cpu(vcpu->arch.shared->reg);        \
         |                                             ^~
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:976:9: note: in expansion of macro 'SHARED_WRAPPER'
     976 |         SHARED_WRAPPER(reg, size)                                       \
         |         ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:981:1: note: in expansion of macro 'SHARED_SPRNG_WRAPPER'
     981 | SHARED_SPRNG_WRAPPER(sprg0, 64, SPRN_GSPRG0)
         | ^~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_set_sprg0':
   arch/powerpc/include/asm/kvm_ppc.h:955:20: error: invalid use of undefined type 'struct kvm_vcpu'
     955 |                vcpu->arch.shared->reg = cpu_to_be##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:976:9: note: in expansion of macro 'SHARED_WRAPPER'
     976 |         SHARED_WRAPPER(reg, size)                                       \
         |         ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:981:1: note: in expansion of macro 'SHARED_SPRNG_WRAPPER'
--
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1001:1: note: in expansion of macro 'SHARED_WRAPPER'
    1001 | SHARED_WRAPPER(sprg6, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_set_sprg6':
   arch/powerpc/include/asm/kvm_ppc.h:955:20: error: invalid use of undefined type 'struct kvm_vcpu'
     955 |                vcpu->arch.shared->reg = cpu_to_be##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1001:1: note: in expansion of macro 'SHARED_WRAPPER'
    1001 | SHARED_WRAPPER(sprg6, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:957:20: error: invalid use of undefined type 'struct kvm_vcpu'
     957 |                vcpu->arch.shared->reg = cpu_to_le##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1001:1: note: in expansion of macro 'SHARED_WRAPPER'
    1001 | SHARED_WRAPPER(sprg6, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_get_sprg7':
   arch/powerpc/include/asm/kvm_ppc.h:946:45: error: invalid use of undefined type 'struct kvm_vcpu'
     946 |                return be##size##_to_cpu(vcpu->arch.shared->reg);        \
         |                                             ^~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: in definition of macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1002:1: note: in expansion of macro 'SHARED_WRAPPER'
    1002 | SHARED_WRAPPER(sprg7, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:948:45: error: invalid use of undefined type 'struct kvm_vcpu'
     948 |                return le##size##_to_cpu(vcpu->arch.shared->reg);        \
         |                                             ^~
   include/uapi/linux/swab.h:128:54: note: in definition of macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:87:21: note: in expansion of macro '__le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:961:9: note: in expansion of macro 'SHARED_WRAPPER_GET'
     961 |         SHARED_WRAPPER_GET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1002:1: note: in expansion of macro 'SHARED_WRAPPER'
    1002 | SHARED_WRAPPER(sprg7, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_set_sprg7':
   arch/powerpc/include/asm/kvm_ppc.h:955:20: error: invalid use of undefined type 'struct kvm_vcpu'
     955 |                vcpu->arch.shared->reg = cpu_to_be##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1002:1: note: in expansion of macro 'SHARED_WRAPPER'
    1002 | SHARED_WRAPPER(sprg7, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:957:20: error: invalid use of undefined type 'struct kvm_vcpu'
     957 |                vcpu->arch.shared->reg = cpu_to_le##size(val);           \
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:962:9: note: in expansion of macro 'SHARED_WRAPPER_SET'
     962 |         SHARED_WRAPPER_SET(reg, size)                                   \
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1002:1: note: in expansion of macro 'SHARED_WRAPPER'
    1002 | SHARED_WRAPPER(sprg7, 64)
         | ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_get_sr':
   arch/powerpc/include/asm/kvm_ppc.h:1007:39: error: invalid use of undefined type 'struct kvm_vcpu'
    1007 |                return be32_to_cpu(vcpu->arch.shared->sr[nr]);
         |                                       ^~
   include/uapi/linux/byteorder/big_endian.h:41:51: note: in definition of macro '__be32_to_cpu'
      41 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   arch/powerpc/include/asm/kvm_ppc.h:1007:23: note: in expansion of macro 'be32_to_cpu'
    1007 |                return be32_to_cpu(vcpu->arch.shared->sr[nr]);
         |                       ^~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1009:39: error: invalid use of undefined type 'struct kvm_vcpu'
    1009 |                return le32_to_cpu(vcpu->arch.shared->sr[nr]);
         |                                       ^~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:89:21: note: in expansion of macro '__le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:1009:23: note: in expansion of macro 'le32_to_cpu'
    1009 |                return le32_to_cpu(vcpu->arch.shared->sr[nr]);
         |                       ^~~~~~~~~~~
>> arch/powerpc/include/asm/kvm_ppc.h:1004:60: warning: parameter 'nr' set but not used [-Wunused-but-set-parameter]
    1004 | static inline u32 kvmppc_get_sr(struct kvm_vcpu *vcpu, int nr)
         |                                                        ~~~~^~
   arch/powerpc/include/asm/kvm_ppc.h: In function 'kvmppc_set_sr':
   arch/powerpc/include/asm/kvm_ppc.h:1015:20: error: invalid use of undefined type 'struct kvm_vcpu'
    1015 |                vcpu->arch.shared->sr[nr] = cpu_to_be32(val);
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:1017:20: error: invalid use of undefined type 'struct kvm_vcpu'
    1017 |                vcpu->arch.shared->sr[nr] = cpu_to_le32(val);
         |                    ^~
   arch/powerpc/include/asm/kvm_ppc.h:1012:61: warning: parameter 'nr' set but not used [-Wunused-but-set-parameter]
    1012 | static inline void kvmppc_set_sr(struct kvm_vcpu *vcpu, int nr, u32 val)
         |                                                         ~~~~^~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/generic +91 arch/powerpc/include/asm/kvm_host.h

3ff955024d186c arch/powerpc/include/asm/kvm_host.h Paul Mackerras   2013-09-20  89  
bbf45ba57eaec5 include/asm-powerpc/kvm_host.h      Hollis Blanchard 2008-04-16  90  struct kvm_vm_stat {
0193cc908b5ae8 arch/powerpc/include/asm/kvm_host.h Jing Zhang       2021-06-18 @91  	struct kvm_vm_stat_generic generic;
e3cb6fa0e2bf4f arch/powerpc/include/asm/kvm_host.h Paolo Bonzini    2021-06-10  92  	u64 num_2M_pages;
e3cb6fa0e2bf4f arch/powerpc/include/asm/kvm_host.h Paolo Bonzini    2021-06-10  93  	u64 num_1G_pages;
bbf45ba57eaec5 include/asm-powerpc/kvm_host.h      Hollis Blanchard 2008-04-16  94  };
bbf45ba57eaec5 include/asm-powerpc/kvm_host.h      Hollis Blanchard 2008-04-16  95  

:::::: The code at line 91 was first introduced by commit
:::::: 0193cc908b5ae8aff2e2d2997ca5d4ae26ed24d4 KVM: stats: Separate generic stats from architecture specific ones

:::::: TO: Jing Zhang <jingzhangos@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
