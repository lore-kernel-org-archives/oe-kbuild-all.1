Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAD212F5A5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628824; cv=none; b=nz8REyBLEY07TJm3alwDy3QWoR3jhMQJ8H2lwUxyz3k8UURiT09Og8oAoPpaI3goTnSbKtb209DDsl4gfp5mPDflvkNw4cQLv/3+kMhnUsGPeVA7J/mF/c2k/OQFVEoKPZD/syJe/ZOsUiSipxdjnhIa/wVHTOd09jlhodSoTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628824; c=relaxed/simple;
	bh=XAw4ja2bno9rHp+TBnD0Jeuz5rspo2vqAC1lYyD2Iu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mF4ul1mERM/CKGWJoP7CXIQhyy2Q1sR66yS0oakQNaiAom8kjREuu3xiu629GHB1Ah2rFjm9R4fCUIQBG78Zj0XzqhvXBFocVcYih6fz01H6TGGl1/c2Ncy51Q2Yoj0yKZDjFXTJmysu/wUKNzr4ot+y98xXMhnG3PUD8zZUvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gf78Q/qW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gf78Q/qW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725628822; x=1757164822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAw4ja2bno9rHp+TBnD0Jeuz5rspo2vqAC1lYyD2Iu4=;
  b=Gf78Q/qWpk++cZCUy/o9Fshz9+zysQ8Pbv13jEjK45Rj++xU1iIAfffX
   WG6sGiAuZDJG3Z5wOK/ALU/wHDa6b90Vvuyniq2OM19CcJ2/2RwiyMzjE
   ub/ErBw/pOoRW92Bem5b0c+sIeYc6NDic6eklwwAUm6IkfRmOb0BRs3ys
   25y7dExBeib0ppS6OPpxt1yZYRT6DfIuraNE5ZiCNijkXpXjq37gIdNDS
   dxZDaRnR8VModCfq08OJ6MuyPxT0cW0pwDplzx7h/ybkNHR81JQ961hcz
   SujtmISeWBpckpXzqmHSvxZe3cINASAEvFw5ty8WZj0anH84MSbwo+SIc
   w==;
X-CSE-ConnectionGUID: OTsLFf4VQAOU2JI+opAZrw==
X-CSE-MsgGUID: bMEsc2lkQGS2u6xOBDIw4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23943625"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="23943625"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 06:20:21 -0700
X-CSE-ConnectionGUID: D58vD4xdRwKIqMdcfBxu/A==
X-CSE-MsgGUID: Vaue+7zDTnSq/IqowPQyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="103427759"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Sep 2024 06:20:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smYss-000BHz-1n;
	Fri, 06 Sep 2024 13:20:18 +0000
Date: Fri, 6 Sep 2024 21:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 1/1] vmlinux.o: warning:
 objtool: exc_page_fault()+0x109: call to task_pid_nr() leaves .noinstr.text
 section
Message-ID: <202409062146.qslrgFBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   1e681c75dd11e34d417d6430042918fcf66ac8d2
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [1/1] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-buildonly-randconfig-003-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062146.qslrgFBP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409062146.qslrgFBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062146.qslrgFBP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x1f: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_page_fault()+0x109: call to task_pid_nr() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lock_is_held_type()+0xf4: call to native_restore_fl() leaves .noinstr.text section


objdump-func vmlinux.o exc_page_fault:
0000 0000000000001df0 <exc_page_fault>:
0000     1df0:	55                   	push   %rbp
0001     1df1:	41 57                	push   %r15
0003     1df3:	41 56                	push   %r14
0005     1df5:	41 54                	push   %r12
0007     1df7:	53                   	push   %rbx
0008     1df8:	50                   	push   %rax
0009     1df9:	41 0f 20 d6          	mov    %cr2,%r14
000d     1dfd:	44 0f b6 25 00 00 00 00 	movzbl 0x0(%rip),%r12d        # 1e05 <exc_page_fault+0x15>	1e01: R_X86_64_PC32	kiwi_fault_logging-0x4
0015     1e05:	49 89 f7             	mov    %rsi,%r15
0018     1e08:	48 89 fb             	mov    %rdi,%rbx
001b     1e0b:	49 83 fc 02          	cmp    $0x2,%r12
001f     1e0f:	0f 83 bc 00 00 00    	jae    1ed1 <exc_page_fault+0xe1>
0025     1e15:	41 f6 c4 01          	test   $0x1,%r12b
0029     1e19:	0f 85 cb 00 00 00    	jne    1eea <exc_page_fault+0xfa>
002f     1e1f:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1e27 <exc_page_fault+0x37>	1e23: R_X86_64_PC32	current_task-0x4
0037     1e27:	48 89 df             	mov    %rbx,%rdi
003a     1e2a:	48 8b 80 00 03 00 00 	mov    0x300(%rax),%rax
0041     1e31:	0f 18 88 c0 00 00 00 	prefetcht0 0xc0(%rax)
0048     1e38:	e8 00 00 00 00       	call   1e3d <exc_page_fault+0x4d>	1e39: R_X86_64_PLT32	irqentry_enter-0x4
004d     1e3d:	90                   	nop
004e     1e3e:	89 c5                	mov    %eax,%ebp
0050     1e40:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 1e47 <exc_page_fault+0x57>	1e42: R_X86_64_PC32	trace_pagefault_key-0x5
0057     1e47:	7f 55                	jg     1e9e <exc_page_fault+0xae>
0059     1e49:	4c 89 f7             	mov    %r14,%rdi
005c     1e4c:	e8 00 00 00 00       	call   1e51 <exc_page_fault+0x61>	1e4d: R_X86_64_PLT32	fault_in_kernel_space-0x4
0061     1e51:	48 89 df             	mov    %rbx,%rdi
0064     1e54:	4c 89 fe             	mov    %r15,%rsi
0067     1e57:	4c 89 f2             	mov    %r14,%rdx
006a     1e5a:	84 c0                	test   %al,%al
006c     1e5c:	75 59                	jne    1eb7 <exc_page_fault+0xc7>
006e     1e5e:	e8 00 00 00 00       	call   1e63 <exc_page_fault+0x73>	1e5f: R_X86_64_PC32	.text+0x6c79c
0073     1e63:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)
007b     1e6b:	9c                   	pushf
007c     1e6c:	8f 04 24             	pop    (%rsp)
007f     1e6f:	8b 04 24             	mov    (%rsp),%eax
0082     1e72:	fa                   	cli
0083     1e73:	a9 00 02 00 00       	test   $0x200,%eax
0088     1e78:	74 05                	je     1e7f <exc_page_fault+0x8f>
008a     1e7a:	e8 00 00 00 00       	call   1e7f <exc_page_fault+0x8f>	1e7b: R_X86_64_PLT32	trace_hardirqs_off-0x4
008f     1e7f:	90                   	nop
0090     1e80:	40 0f b6 f5          	movzbl %bpl,%esi
0094     1e84:	48 89 df             	mov    %rbx,%rdi
0097     1e87:	e8 00 00 00 00       	call   1e8c <exc_page_fault+0x9c>	1e88: R_X86_64_PLT32	irqentry_exit-0x4
009c     1e8c:	48 8d 64 24 08       	lea    0x8(%rsp),%rsp
00a1     1e91:	5b                   	pop    %rbx
00a2     1e92:	41 5c                	pop    %r12
00a4     1e94:	41 5e                	pop    %r14
00a6     1e96:	41 5f                	pop    %r15
00a8     1e98:	5d                   	pop    %rbp
00a9     1e99:	e9 00 00 00 00       	jmp    1e9e <exc_page_fault+0xae>	1e9a: R_X86_64_PLT32	__x86_return_thunk-0x4
00ae     1e9e:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
00b5     1ea5:	74 17                	je     1ebe <exc_page_fault+0xce>
00b7     1ea7:	4c 89 f7             	mov    %r14,%rdi
00ba     1eaa:	48 89 de             	mov    %rbx,%rsi
00bd     1ead:	4c 89 fa             	mov    %r15,%rdx
00c0     1eb0:	e8 00 00 00 00       	call   1eb5 <exc_page_fault+0xc5>	1eb1: R_X86_64_PC32	.text+0x6cbcc
00c5     1eb5:	eb 92                	jmp    1e49 <exc_page_fault+0x59>
00c7     1eb7:	e8 00 00 00 00       	call   1ebc <exc_page_fault+0xcc>	1eb8: R_X86_64_PC32	.text+0x6c74c
00cc     1ebc:	eb c1                	jmp    1e7f <exc_page_fault+0x8f>
00ce     1ebe:	4c 89 f7             	mov    %r14,%rdi
00d1     1ec1:	48 89 de             	mov    %rbx,%rsi
00d4     1ec4:	4c 89 fa             	mov    %r15,%rdx
00d7     1ec7:	e8 00 00 00 00       	call   1ecc <exc_page_fault+0xdc>	1ec8: R_X86_64_PC32	.text+0x6ccac
00dc     1ecc:	e9 78 ff ff ff       	jmp    1e49 <exc_page_fault+0x59>
00e1     1ed1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1ed4: R_X86_64_32S	.data+0x58a20
00e8     1ed8:	4c 89 e6             	mov    %r12,%rsi
00eb     1edb:	e8 00 00 00 00       	call   1ee0 <exc_page_fault+0xf0>	1edc: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
00f0     1ee0:	41 f6 c4 01          	test   $0x1,%r12b
00f4     1ee4:	0f 84 35 ff ff ff    	je     1e1f <exc_page_fault+0x2f>
00fa     1eea:	65 48 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%rdi        # 1ef2 <exc_page_fault+0x102>	1eee: R_X86_64_PC32	current_task-0x4
0102     1ef2:	4c 8d a7 c0 06 00 00 	lea    0x6c0(%rdi),%r12
0109     1ef9:	e8 00 00 00 00       	call   1efe <exc_page_fault+0x10e>	1efa: R_X86_64_PC32	.text+0x6c68c
010e     1efe:	4c 8b 83 80 00 00 00 	mov    0x80(%rbx),%r8
0115     1f05:	4c 8b 8b 98 00 00 00 	mov    0x98(%rbx),%r9
011c     1f0c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1f0f: R_X86_64_32S	.rodata+0x31d40
0123     1f13:	4c 89 e6             	mov    %r12,%rsi
0126     1f16:	89 c2                	mov    %eax,%edx
0128     1f18:	4c 89 f1             	mov    %r14,%rcx
012b     1f1b:	41 57                	push   %r15
012d     1f1d:	e8 00 00 00 00       	call   1f22 <exc_page_fault+0x132>	1f1e: R_X86_64_PLT32	printk-0x4
0132     1f22:	48 8d 64 24 08       	lea    0x8(%rsp),%rsp
0137     1f27:	e9 f3 fe ff ff       	jmp    1e1f <exc_page_fault+0x2f>
013c     1f2c:	cc                   	int3
013d     1f2d:	cc                   	int3
013e     1f2e:	cc                   	int3
013f     1f2f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
