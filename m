Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9211FB7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679468488; x=1711004488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Avj9n2J9P7pItA6ICL90FbsPbGu0nAOr+38s2Y7OrA=;
  b=MOglT8bhVtc/9mzLBFER/rkkiYiPh0wFSwQpRckkdFo+8UkH+wcOxIDw
   FfpZsgzCualbebayBacHFoZQFakHr1nNAiYa8Zdzr3uWBwW5v1NJkpfTL
   TRzlXO6nCAXUTcHqvVHPft3Bd2Ja1aCYHX1nO09ZaeUyuf+WWRxCB93EX
   c+R/zJ0Z0yLcVrnjlNdwvgOIQvBko0PGvYt0KohsizcEnuMKDcNGSwV2n
   ODcFTvkEdHfv6T7+cRJl4hOqd3pxdLlP5f+9LlwTtHs/T7iDg8zHRZBZS
   Q+NjLLWouRBfpf4mm/36UlsM7k6C6dIJOsa698qjjZTy7Shu/3k2aeWVm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="337868567"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="337868567"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 00:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="659085032"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="659085032"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 00:01:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pesTM-000D0u-0Y;
	Wed, 22 Mar 2023 07:01:24 +0000
Date: Wed, 22 Mar 2023 15:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 11/11] arch/x86/kvm/x86.c:9324:40:
 error: implicit declaration of function '__KVM_X86_OP'; did you mean
 'KVM_X86_OP'?
Message-ID: <202303221402.vwRH6w6X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   99a484ab8cf69008f50c0cc79d3ebec8d67ebc2d
commit: 41520dea84d189acacdfbfc27c86e2cf02cbb4db [11/11] static_call: Remove DEFINE_STATIC_CALL_RET0()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303221402.vwRH6w6X-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=41520dea84d189acacdfbfc27c86e2cf02cbb4db
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 41520dea84d189acacdfbfc27c86e2cf02cbb4db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221402.vwRH6w6X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/include/asm/kvm-x86-ops.h: In function 'kvm_ops_update':
>> arch/x86/kvm/x86.c:9324:40: error: implicit declaration of function '__KVM_X86_OP'; did you mean 'KVM_X86_OP'? [-Werror=implicit-function-declaration]
    9324 | #define KVM_X86_OP_OPTIONAL_RET0(func) __KVM_X86_OP
         |                                        ^~~~~~~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:23:1: note: in expansion of macro 'KVM_X86_OP_OPTIONAL_RET0'
      23 | KVM_X86_OP_OPTIONAL_RET0(vcpu_precreate)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.c:20:
>> include/asm-generic/bug.h:121:29: error: expected expression before '{' token
     121 | #define WARN_ON(condition) ({                                           \
         |                             ^
   arch/x86/kvm/x86.c:9322:9: note: in expansion of macro 'WARN_ON'
    9322 |         WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
         |         ^~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:24:1: note: in expansion of macro 'KVM_X86_OP'
      24 | KVM_X86_OP(vcpu_create)
         | ^~~~~~~~~~
   In file included from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.c:20:
>> include/linux/static_call.h:191:2: error: expected expression before '{' token
     191 | ({                                                                      \
         |  ^
   arch/x86/kvm/x86.c:9320:9: note: in expansion of macro 'static_call_update'
    9320 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func);
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:9323:29: note: in expansion of macro '__KVM_X86_OP'
    9323 | #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
         |                             ^~~~~~~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:82:1: note: in expansion of macro 'KVM_X86_OP_OPTIONAL'
      82 | KVM_X86_OP_OPTIONAL(load_eoi_exitmap)
         | ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:9324:40: warning: statement with no effect [-Wunused-value]
    9324 | #define KVM_X86_OP_OPTIONAL_RET0(func) __KVM_X86_OP
         |                                        ^~~~~~~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:87:1: note: in expansion of macro 'KVM_X86_OP_OPTIONAL_RET0'
      87 | KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:9324:40: error: expected ';' before '__KVM_X86_OP'
    9324 | #define KVM_X86_OP_OPTIONAL_RET0(func) __KVM_X86_OP
         |                                        ^~~~~~~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:88:1: note: in expansion of macro 'KVM_X86_OP_OPTIONAL_RET0'
      88 | KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.c:20:
>> include/linux/static_call.h:191:2: error: expected expression before '{' token
     191 | ({                                                                      \
         |  ^
   arch/x86/kvm/x86.c:9320:9: note: in expansion of macro 'static_call_update'
    9320 |         static_call_update(kvm_x86_##func, kvm_x86_ops.func);
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:9323:29: note: in expansion of macro '__KVM_X86_OP'
    9323 | #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
         |                             ^~~~~~~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:108:1: note: in expansion of macro 'KVM_X86_OP_OPTIONAL'
     108 | KVM_X86_OP_OPTIONAL(set_hv_timer)
         | ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:9324:40: warning: statement with no effect [-Wunused-value]
    9324 | #define KVM_X86_OP_OPTIONAL_RET0(func) __KVM_X86_OP
         |                                        ^~~~~~~~~~~~
   arch/x86/include/asm/kvm-x86-ops.h:131:1: note: in expansion of macro 'KVM_X86_OP_OPTIONAL_RET0'
     131 | KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/alternative.c: In function 'apply_returns':
>> arch/x86/kernel/alternative.c:613:23: warning: variable 'dest' set but not used [-Wunused-but-set-variable]
     613 |                 void *dest = NULL, *addr = (void *)s + *s;
         |                       ^~~~


vim +9324 arch/x86/kvm/x86.c

  9314	
  9315	static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
  9316	{
  9317		memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
  9318	
  9319	#define __KVM_X86_OP(func) \
  9320		static_call_update(kvm_x86_##func, kvm_x86_ops.func);
  9321	#define KVM_X86_OP(func) \
  9322		WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
  9323	#define KVM_X86_OP_OPTIONAL __KVM_X86_OP
> 9324	#define KVM_X86_OP_OPTIONAL_RET0(func) __KVM_X86_OP
  9325	#include <asm/kvm-x86-ops.h>
  9326	#undef __KVM_X86_OP
  9327	
  9328		kvm_pmu_ops_update(ops->pmu_ops);
  9329	}
  9330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
