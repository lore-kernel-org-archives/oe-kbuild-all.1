Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6B18452C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 21:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387687; cv=none; b=kWVgYM9OjOKBFeQ6udw9Mn76OTWaA1KuMZuwfrM2GxS+gJdGOPnwxZzSRj5cnJN1oULUQGrS1WWGs0jYSIfZNQ5/PdfmZRljnRg8gL2lzmyX5gKu3IjbOWxtk53v9MEzoS+70E9A/NxyQSkWG8Pe3JPPCKLgtPrzlfvLH3S++bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387687; c=relaxed/simple;
	bh=IfKxZ5fn8/b1kdsVVwcC6+i3YPD/MHZ/mv6TL9mWdCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dowquCz1FpuChBd2pbdVLA2DkpOt5XJaWg7yjzmY9HUdzCIJVeMpq7VZHAT4UM3Zqeqq4pQC6anK9XTBCt6NqhaJlcnh0I3cODrm49yifv8sRgJCe7f0TUzLsG4AdxIIDvDKJ6imRFUWil/Q2N3MfFE5Fot9Oi7toFW4bhajeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsQi6Yhm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsQi6Yhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727387685; x=1758923685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfKxZ5fn8/b1kdsVVwcC6+i3YPD/MHZ/mv6TL9mWdCA=;
  b=MsQi6YhmTYhSYy5FJAZHERuNtiU9lEhK7DglJI9PYVJqJL9sPViZRD+A
   YREgKm9cJvO1B8XYP+iu2+qzYftvoqjPhT639/qgbSWPN37DoWEKnNZM5
   YPA7Ye7ly6NOi/lohDH6pTzB6ZCuZ1brDA4pdnpjs2UzLEEo9989M4lR0
   16m3+EsC3PaL5vN7VTG68rQUgQhle2N5OHiR1niu0sy1n8IlM+6B18W6f
   9BlsocDXibSplY+f2wweT0Qry0qQNs5A4x7li+EQoKFbvhKksTYysOKSp
   kcBQUgYIRKM6IGAevwpMsGw2ZJ5prb40Uh6+QKTkRpH71N2iNCALqaj1p
   g==;
X-CSE-ConnectionGUID: 0ls3ylbaTHKKZIWJkJuw6g==
X-CSE-MsgGUID: LejVLVWtTUyIU0KozVtDgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37083354"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="37083354"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 14:54:44 -0700
X-CSE-ConnectionGUID: 72NS/roMSwKVknTySLG3DQ==
X-CSE-MsgGUID: /2EaY826SpuuHvEjiNa23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="103121641"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2024 14:54:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stwRd-000LE3-1I;
	Thu, 26 Sep 2024 21:54:41 +0000
Date: Fri, 27 Sep 2024 05:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] vmlinux.o: warning: objtool:
 svm_vcpu_enter_exit+0x28: call to context_tracking_enabled_this_cpu.7027()
 leaves .noinstr.text section
Message-ID: <202409270509.YoOdaVEW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d56bde2ef4c5a229e2aa085c916eddf87e2603cd
commit: 7818437b8371a7c39ca787af00fa77dfbf01eba5 [1/1] Merge 33c9de2960d3 ("Merge tag '6.11-rc-part1-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6") into android-mainline
config: x86_64-randconfig-072-20240920 (https://download.01.org/0day-ci/archive/20240927/202409270509.YoOdaVEW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270509.YoOdaVEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270509.YoOdaVEW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x28: call to context_tracking_enabled_this_cpu() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0x28: call to context_tracking_enabled_this_cpu.7027() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpuidle_enter_state+0x302: return with instrumentation enabled
   vmlinux.o: warning: objtool: .text.nvmet_ctrl_state_show: unexpected end of section

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


objdump-func vmlinux.o svm_vcpu_enter_exit:
0000 0000000000001190 <svm_vcpu_enter_exit>:
0000     1190:	55                   	push   %rbp
0001     1191:	41 56                	push   %r14
0003     1193:	53                   	push   %rbx
0004     1194:	89 f5                	mov    %esi,%ebp
0006     1196:	48 89 fb             	mov    %rdi,%rbx
0009     1199:	90                   	nop
000a     119a:	e8 00 00 00 00       	call   119f <svm_vcpu_enter_exit+0xf>	119b: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
000f     119f:	e8 00 00 00 00       	call   11a4 <svm_vcpu_enter_exit+0x14>	11a0: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
0014     11a4:	90                   	nop
0015     11a5:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 11ac <svm_vcpu_enter_exit+0x1c>	11a7: R_X86_64_PC32	context_tracking_key-0x5
001c     11ac:	7e 0a                	jle    11b8 <svm_vcpu_enter_exit+0x28>
001e     11ae:	bf 03 00 00 00       	mov    $0x3,%edi
0023     11b3:	e8 00 00 00 00       	call   11b8 <svm_vcpu_enter_exit+0x28>	11b4: R_X86_64_PLT32	__ct_user_enter-0x4
0028     11b8:	e8 00 00 00 00       	call   11bd <svm_vcpu_enter_exit+0x2d>	11b9: R_X86_64_PLT32	.text.context_tracking_enabled_this_cpu.7027-0x4
002d     11bd:	84 c0                	test   %al,%al
002f     11bf:	75 07                	jne    11c8 <svm_vcpu_enter_exit+0x38>
0031     11c1:	90                   	nop
0032     11c2:	e8 00 00 00 00       	call   11c7 <svm_vcpu_enter_exit+0x37>	11c3: R_X86_64_PLT32	.text.rcu_virt_note_context_switch.7028-0x4
0037     11c7:	90                   	nop
0038     11c8:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
003d     11cd:	4c 89 f7             	mov    %r14,%rdi
0040     11d0:	e8 00 00 00 00       	call   11d5 <svm_vcpu_enter_exit+0x45>	11d1: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
0045     11d5:	b9 01 00 00 00       	mov    $0x1,%ecx
004a     11da:	31 c0                	xor    %eax,%eax
004c     11dc:	31 d2                	xor    %edx,%edx
004e     11de:	90                   	nop
004f     11df:	90                   	nop
0050     11e0:	40 0f b6 f5          	movzbl %bpl,%esi
0054     11e4:	48 89 df             	mov    %rbx,%rdi
0057     11e7:	e8 00 00 00 00       	call   11ec <svm_vcpu_enter_exit+0x5c>	11e8: R_X86_64_PLT32	__svm_vcpu_run-0x4
005c     11ec:	4c 89 f7             	mov    %r14,%rdi
005f     11ef:	e8 00 00 00 00       	call   11f4 <svm_vcpu_enter_exit+0x64>	11f0: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
0064     11f4:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 11fb <svm_vcpu_enter_exit+0x6b>	11f6: R_X86_64_PC32	context_tracking_key-0x5
006b     11fb:	7e 0a                	jle    1207 <svm_vcpu_enter_exit+0x77>
006d     11fd:	bf 03 00 00 00       	mov    $0x3,%edi
0072     1202:	e8 00 00 00 00       	call   1207 <svm_vcpu_enter_exit+0x77>	1203: R_X86_64_PLT32	__ct_user_exit-0x4
0077     1207:	90                   	nop
0078     1208:	e8 00 00 00 00       	call   120d <svm_vcpu_enter_exit+0x7d>	1209: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
007d     120d:	90                   	nop
007e     120e:	5b                   	pop    %rbx
007f     120f:	41 5e                	pop    %r14
0081     1211:	5d                   	pop    %rbp
0082     1212:	31 c0                	xor    %eax,%eax
0084     1214:	31 c9                	xor    %ecx,%ecx
0086     1216:	31 ff                	xor    %edi,%edi
0088     1218:	31 d2                	xor    %edx,%edx
008a     121a:	31 f6                	xor    %esi,%esi
008c     121c:	c3                   	ret
008d     121d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
