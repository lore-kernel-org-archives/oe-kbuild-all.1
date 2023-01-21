Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0079D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674322900; x=1705858900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OkTQuZJQS1+H0LXKoogAmFeBQG5pRKnAXzI+8uOiaEQ=;
  b=cCFF54ybt218GLCnKfs22LscKNavMQyZpwl9tzdJV+KcLKZrQ5JFhG+Q
   7/HV1oPIxFWXYqbR0khmxg6mJG87b8+72IuBWZ3wLO3KVCaGI0PptWUUJ
   MrW2JbQBU2Kgo6FOlvpLX+FMNEo/i0xTg9FjpGycPozXkLWtjzfCDvmyw
   Q1iWiaVlyohK9YSXiWRsien73p9sQ2nD6mbWBuKzuuBq1cIy4YQuhBMRp
   EEs1mtuFL8N6B3llrIOwiAZhsA4pzEKvbx0kLn5aigWTRtyySfxkAQB9i
   9HNVF/MZozVTdgyPUDatMiR/76xqFblqplurwE93TgZwwMvRqkIhmlQ0W
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="327897564"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="327897564"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 09:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="769077723"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="769077723"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2023 09:41:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJHs1-0004K6-0V;
	Sat, 21 Jan 2023 17:41:37 +0000
Date: Sun, 22 Jan 2023 01:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 3/5] vmlinux.o: warning: objtool:
 vmware_sched_clock+0x21: call to mul_u64_u32_shr() leaves .noinstr.text
 section
Message-ID: <202301220150.sIueVWId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2f4db18052727418ff37088ea7b08d5380aa91ad
commit: 60b4bbc6b378aeb9625a39f0afc9dcaee6f78589 [3/5] x86: Mark sched_clock() noinstr
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230122/202301220150.sIueVWId-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=60b4bbc6b378aeb9625a39f0afc9dcaee6f78589
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 60b4bbc6b378aeb9625a39f0afc9dcaee6f78589
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x164: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x85: call to context_tracking_guest_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0xb1e: call to pentium_machine_check.constprop.0() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: vmware_sched_clock+0x21: call to mul_u64_u32_shr() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pvclock_clocksource_read+0xc4: call to touch_softlockup_watchdog_sync() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_stackleak_irqoff+0x2b: call to end_of_stack.isra.0() leaves .noinstr.text section


objdump-func vmlinux.o vmware_sched_clock:
0000 0000000000009880 <vmware_sched_clock>:
0000     9880:	f3 0f 1e fa          	endbr64
0004     9884:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	9885: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0009     9889:	0f 31                	rdtsc
000b     988b:	48 c1 e2 20          	shl    $0x20,%rdx
000f     988f:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 9895 <vmware_sched_clock+0x15>	9891: R_X86_64_PC32	.data..ro_after_init+0x8a8c
0015     9895:	48 89 d7             	mov    %rdx,%rdi
0018     9898:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 989e <vmware_sched_clock+0x1e>	989a: R_X86_64_PC32	.data..ro_after_init+0x8a90
001e     989e:	48 09 c7             	or     %rax,%rdi
0021     98a1:	e8 00 00 00 00       	call   98a6 <vmware_sched_clock+0x26>	98a2: R_X86_64_PC32	.text+0x34933c
0026     98a6:	48 2b 05 00 00 00 00 	sub    0x0(%rip),%rax        # 98ad <vmware_sched_clock+0x2d>	98a9: R_X86_64_PC32	.data..ro_after_init+0x8a94
002d     98ad:	31 d2                	xor    %edx,%edx
002f     98af:	31 f6                	xor    %esi,%esi
0031     98b1:	31 ff                	xor    %edi,%edi
0033     98b3:	e9 00 00 00 00       	jmp    98b8 <vmware_sched_clock+0x38>	98b4: R_X86_64_PLT32	__x86_return_thunk-0x4
0038     98b8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
