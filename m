Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0218C3D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 01:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725846259; cv=none; b=UxEXPRJOqY4GvN46mFTy6Ed+gWOCOgG1Hi5ubXOp6qHI2wG1mGudDeUYGFlzHj0L8Yu6eXrBNK+RyTwU25FsbFVzrZBNU+iy0J42Yrpjiz1qdARgig+eQ4s8Jj+aifTWbihpqRHCalJr73e8HvaH5KptQQY2gKk/MA6hrVCulW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725846259; c=relaxed/simple;
	bh=EYOdmmhAo5jPN+R3viTypHyDdvcWSn7vllihxnpadHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvPK+KIKwk6N7BoOr/AFKJFaHC/CePJOPlS32cmYnvmBk06fA2h9hPqqt8ub7gpXDEh08JkNOdJaj/FJ2eWlF9K6JQ2gA5IId70RV/V+RKiMquXFsHwSLikVi9+6VtHRkA7lStL9WUb4725DB4j39ITrxUOQaqBYMkivBt2O2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/W444r4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/W444r4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725846258; x=1757382258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYOdmmhAo5jPN+R3viTypHyDdvcWSn7vllihxnpadHE=;
  b=M/W444r44N0rK1rPCNlLq4PQ5C8k1UmBzq7U48l8Mnzs5UJISEtNL6+c
   6C0pH451oFLy48t6/qNz1CrrqjcY380qk5ph3CaIX5z4e1SmHKD45axHZ
   yawbEj7OZTT5W44M6tVtzfcgq1sdZwCqxJha1ITEzuOCAS+XGV3EyafW8
   +HFcT+ZB3OlFHw2CtSfN6gfYuXKYPcUUbz/f8oTS5Da5jtPKCxHZYbB70
   O6UzvWpUitPT0pbkkTnheqzHIzf1OLqqC+1KgGEjopGTEfxQ/A9CDYS3g
   iWFh9o3Xc0Rg0TYkQyPzcgTj9omtetCOMqq1v5Z7WODcCVp9PTNNZrYl6
   g==;
X-CSE-ConnectionGUID: /ryuW8erSoKxkqDXHOcRDQ==
X-CSE-MsgGUID: CNc4eCrOQzyb+2OulIi6DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="28302478"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="28302478"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 18:44:17 -0700
X-CSE-ConnectionGUID: RtSb+v5bQXyvlcgCYkskAw==
X-CSE-MsgGUID: tGZwe6zeRvmKyKR7DKQPww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="70621651"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2024 18:44:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snTRt-000EAp-1Y;
	Mon, 09 Sep 2024 01:44:13 +0000
Date: Mon, 9 Sep 2024 09:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1/93] vmlinux.o: warning: objtool:
 svm_vcpu_enter_exit+0x1d: call to context_tracking_enabled_this_cpu.3516()
 leaves .noinstr.text section
Message-ID: <202409090938.w5ziDPQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9160bf23e2a5e493e48977aaf614963966e2784f
commit: e4006d68a8c40282eb2a9da4f5abe72f31721829 [1/93] UPSTREAM: mm: vmalloc: ensure vmap_block is initialised before adding to queue
config: x86_64-randconfig-123-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090938.w5ziDPQg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090938.w5ziDPQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090938.w5ziDPQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __svm_vcpu_run+0x141: BP used as a scratch register
   vmlinux.o: warning: objtool: __svm_sev_es_vcpu_run+0x36: BP used as a scratch register
   vmlinux.o: warning: objtool: do_int80_emulation+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x20: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x20: call to context_tracking_enabled_this_cpu() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_update_host_rsp+0x33: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x1d: call to context_tracking_enabled_this_cpu.3516() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x30: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x9a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x6e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x52: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x62: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x6e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x91: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x75: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x59: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x38: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x4e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x7b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter+0x52: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter+0x58: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_enter_state+0x48: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x54: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit+0x63: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_kernel_exit_state+0x44: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_exit+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_idle_enter+0x36: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_nmi_enter+0x4d: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_enter+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ct_irq_exit+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: check_preemption_disabled+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: .altinstr_replacement+0x2ef: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x32d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x561: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x5ae: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x5b9: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x5ec: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x60d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x619: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x632: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x674: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x68a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6ac: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6b8: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6c3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x6e7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xd50: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10da: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10fb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xed85: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0xedb1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10358: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10373: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x10c65: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x110ca: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x13a6d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x13a8a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x13fcb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x13fec: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x13ff7: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14522: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14548: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1458a: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14824: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1482f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14867: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14888: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x148ca: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x148df: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14949: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14c38: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14c5f: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14f07: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x14f51: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x15d2c: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x15d83: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x15d8e: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x15dad: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x15ed1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x166d4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x168a4: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x16cbb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x16cf2: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x16d3b: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x16dc3: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17169: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x176e5: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17735: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x177f1: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17884: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x178bb: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x178f0: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x178fc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x179e6: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x179fc: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x17a12: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x1801d: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x18028: redundant UACCESS disable
   vmlinux.o: warning: objtool: .altinstr_replacement+0x18033: redundant UACCESS disable


objdump-func vmlinux.o svm_vcpu_enter_exit:
0000 0000000000001100 <svm_vcpu_enter_exit>:
0000     1100:	55                   	push   %rbp
0001     1101:	48 89 e5             	mov    %rsp,%rbp
0004     1104:	41 57                	push   %r15
0006     1106:	41 56                	push   %r14
0008     1108:	53                   	push   %rbx
0009     1109:	41 89 f6             	mov    %esi,%r14d
000c     110c:	48 89 fb             	mov    %rdi,%rbx
000f     110f:	90                   	nop
0010     1110:	e8 00 00 00 00       	call   1115 <svm_vcpu_enter_exit+0x15>	1111: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0015     1115:	e8 00 00 00 00       	call   111a <svm_vcpu_enter_exit+0x1a>	1116: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
001a     111a:	90                   	nop
001b     111b:	66 90                	xchg   %ax,%ax
001d     111d:	e8 00 00 00 00       	call   1122 <svm_vcpu_enter_exit+0x22>	111e: R_X86_64_PLT32	.text.context_tracking_enabled_this_cpu.3516-0x4
0022     1122:	84 c0                	test   %al,%al
0024     1124:	75 07                	jne    112d <svm_vcpu_enter_exit+0x2d>
0026     1126:	90                   	nop
0027     1127:	e8 00 00 00 00       	call   112c <svm_vcpu_enter_exit+0x2c>	1128: R_X86_64_PLT32	.text.rcu_virt_note_context_switch.3517-0x4
002c     112c:	90                   	nop
002d     112d:	4c 8b 7d 08          	mov    0x8(%rbp),%r15
0031     1131:	4c 89 ff             	mov    %r15,%rdi
0034     1134:	e8 00 00 00 00       	call   1139 <svm_vcpu_enter_exit+0x39>	1135: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
0039     1139:	e8 00 00 00 00       	call   113e <svm_vcpu_enter_exit+0x3e>	113a: R_X86_64_PLT32	amd_clear_divider-0x4
003e     113e:	41 0f b6 f6          	movzbl %r14b,%esi
0042     1142:	48 89 df             	mov    %rbx,%rdi
0045     1145:	e8 00 00 00 00       	call   114a <svm_vcpu_enter_exit+0x4a>	1146: R_X86_64_PLT32	__svm_vcpu_run-0x4
004a     114a:	4c 89 ff             	mov    %r15,%rdi
004d     114d:	e8 00 00 00 00       	call   1152 <svm_vcpu_enter_exit+0x52>	114e: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
0052     1152:	66 90                	xchg   %ax,%ax
0054     1154:	90                   	nop
0055     1155:	e8 00 00 00 00       	call   115a <svm_vcpu_enter_exit+0x5a>	1156: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
005a     115a:	90                   	nop
005b     115b:	5b                   	pop    %rbx
005c     115c:	41 5e                	pop    %r14
005e     115e:	41 5f                	pop    %r15
0060     1160:	5d                   	pop    %rbp
0061     1161:	c3                   	ret
0062     1162:	f3 0f 1e fa          	endbr64
0066     1166:	bf 03 00 00 00       	mov    $0x3,%edi
006b     116b:	e8 00 00 00 00       	call   1170 <svm_vcpu_enter_exit+0x70>	116c: R_X86_64_PLT32	__ct_user_enter-0x4
0070     1170:	eb ab                	jmp    111d <svm_vcpu_enter_exit+0x1d>
0072     1172:	f3 0f 1e fa          	endbr64
0076     1176:	bf 03 00 00 00       	mov    $0x3,%edi
007b     117b:	e8 00 00 00 00       	call   1180 <svm_vcpu_enter_exit+0x80>	117c: R_X86_64_PLT32	__ct_user_exit-0x4
0080     1180:	eb d2                	jmp    1154 <svm_vcpu_enter_exit+0x54>
0082     1182:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
008c     118c:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
