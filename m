Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710551448ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 01:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726969456; cv=none; b=nD6Dt3rnUOKddnHTYdrkDTE2P+bae7mYvCOlKokJY4trqtPXkThDyhS1DD8yp/hUeiixl32v24OrMDZHnyqtUSZ8exGL5YOHZgPMmraJg0DbfYJF+IdlKtoq76wzorWAQhrmowHVZGRkSenNjMJydtEXACY6OJ/7vf++FXSJ7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726969456; c=relaxed/simple;
	bh=1k1iTtMqxL9uaEUCoFfxi85jalxvDlF9R00RHkCgv3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xr3dbl8jGtxz/n92QcK4TudPhSFORjhq6IxUW60nS2HIpFpPjskT+YZ4GN84jjAxtVto5MuunPqY9OwbA4SWWb2JM+4CBFs9z3njT2q8J723PIiA529+ni89Fb1M+kh6ZDhxwPPU7Pc04Mr/iNH1q1f3JfTa8dqTkP9nx4biEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaFvbhk2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaFvbhk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726969455; x=1758505455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1k1iTtMqxL9uaEUCoFfxi85jalxvDlF9R00RHkCgv3Y=;
  b=IaFvbhk2FCMx+8mej62VD3Ul4ye022JfYLAMJ6GMPNEBUSTG/Csy2i0M
   4SeA0BpBAlLNoIzGLEe/NBKytkt4XqkDykxYJuaerFT2wp9V6O3xkhzex
   C8mPxDRPgIFHbFlspcC5ZZwGlvx2l1BZ2BpROj6M4uSX93+AZKTll5uPl
   s7vQ0XXawlLsUl2bm5J+qKcIiu4p8Lvyn2ovKhDn7yxTNYqRZDha1hcmT
   UPnwpEgLYnyiJe6N90P/cCJRNplWAvu8MeB1chrzWgk91gYGOoWoE0U2k
   AGBtmv4+4CXbVWyOfIK7e4sgTL5NPpqle6dwp07Jojf36YaboOSREs1t1
   w==;
X-CSE-ConnectionGUID: XGToWjAqQIiY++nuFszsdA==
X-CSE-MsgGUID: wV8Ku/pvQfyCOx9gDBDQXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="51361655"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="51361655"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:44:14 -0700
X-CSE-ConnectionGUID: JplBwKGXTmiQeZhQxdqaFA==
X-CSE-MsgGUID: M3S/VnWCQdGBp/wsHkXxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75466869"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 18:44:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBdx-000Fx4-2T;
	Sun, 22 Sep 2024 01:44:09 +0000
Date: Sun, 22 Sep 2024 09:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6/11] arch/x86/pci/irq.o: warning:
 objtool: pirq_ite_get()+0xa0: unreachable instruction
Message-ID: <202409220932.2XfUAHHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7b9f6a0ecd235bca2b4329476f817a6182ea8d8a
commit: c2985e13ddc87258e98fad13e435129a210092b6 [6/11] UPSTREAM: ubsan: enable for all*config builds
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240922/202409220932.2XfUAHHO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220932.2XfUAHHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220932.2XfUAHHO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/pci/irq.o: warning: objtool: pirq_ite_get()+0xa0: unreachable instruction


objdump-func vmlinux.o pirq_ite_get:
0000 0000000003364976 <pirq_ite_get>:
0000  3364976:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	3364977: R_X86_64_NONE	__fentry__-0x4
0005  336497b:	55                   	push   %rbp
0006  336497c:	48 89 e5             	mov    %rsp,%rbp
0009  336497f:	41 57                	push   %r15
000b  3364981:	41 56                	push   %r14
000d  3364983:	53                   	push   %rbx
000e  3364984:	50                   	push   %rax
000f  3364985:	41 89 d6             	mov    %edx,%r14d
0012  3364988:	48 89 fb             	mov    %rdi,%rbx
0015  336498b:	e8 00 00 00 00       	call   3364990 <pirq_ite_get+0x1a>	336498c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001a  3364990:	41 83 fe 05          	cmp    $0x5,%r14d
001e  3364994:	7d 79                	jge    3364a0f <pirq_ite_get+0x99>
0020  3364996:	41 ff ce             	dec    %r14d
0023  3364999:	4d 63 fe             	movslq %r14d,%r15
0026  336499c:	41 83 ff 03          	cmp    $0x3,%r15d
002a  33649a0:	0f 87 9e 00 00 00    	ja     3364a44 <pirq_ite_get+0xce>
0030  33649a6:	e8 00 00 00 00       	call   33649ab <pirq_ite_get+0x35>	33649a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0035  33649ab:	4d 8d b7 00 00 00 00 	lea    0x0(%r15),%r14	33649ae: R_X86_64_32S	.rodata+0xea8920
003c  33649b2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0046  33649bc:	4c 89 f0             	mov    %r14,%rax
0049  33649bf:	48 c1 e8 03          	shr    $0x3,%rax
004d  33649c3:	8a 04 08             	mov    (%rax,%rcx,1),%al
0050  33649c6:	84 c0                	test   %al,%al
0052  33649c8:	75 66                	jne    3364a30 <pirq_ite_get+0xba>
0054  33649ca:	45 0f b6 3e          	movzbl (%r14),%r15d
0058  33649ce:	4c 8d 75 e7          	lea    -0x19(%rbp),%r14
005c  33649d2:	48 89 df             	mov    %rbx,%rdi
005f  33649d5:	44 89 fe             	mov    %r15d,%esi
0062  33649d8:	4c 89 f2             	mov    %r14,%rdx
0065  33649db:	41 c6 06 aa          	movb   $0xaa,(%r14)
0069  33649df:	d1 ee                	shr    %esi
006b  33649e1:	83 c6 43             	add    $0x43,%esi
006e  33649e4:	e8 00 00 00 00       	call   33649e9 <pirq_ite_get+0x73>	33649e5: R_X86_64_PLT32	pci_read_config_byte-0x4
0073  33649e9:	41 8a 06             	mov    (%r14),%al
0076  33649ec:	89 c1                	mov    %eax,%ecx
0078  33649ee:	24 0f                	and    $0xf,%al
007a  33649f0:	c0 e9 04             	shr    $0x4,%cl
007d  33649f3:	0f b6 c0             	movzbl %al,%eax
0080  33649f6:	41 f6 c7 01          	test   $0x1,%r15b
0084  33649fa:	0f b6 c9             	movzbl %cl,%ecx
0087  33649fd:	0f 44 c8             	cmove  %eax,%ecx
008a  3364a00:	0f b6 c1             	movzbl %cl,%eax
008d  3364a03:	48 8d 64 24 08       	lea    0x8(%rsp),%rsp
0092  3364a08:	5b                   	pop    %rbx
0093  3364a09:	41 5e                	pop    %r14
0095  3364a0b:	41 5f                	pop    %r15
0097  3364a0d:	5d                   	pop    %rbp
0098  3364a0e:	c3                   	ret
0099  3364a0f:	e8 00 00 00 00       	call   3364a14 <pirq_ite_get+0x9e>	3364a10: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
009e  3364a14:	0f 0b                	ud2
00a0  3364a16:	41 ff ce             	dec    %r14d
00a3  3364a19:	4d 89 f7             	mov    %r14,%r15
00a6  3364a1c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3364a1f: R_X86_64_32S	.data+0x112a200
00ad  3364a23:	4c 89 f6             	mov    %r14,%rsi
00b0  3364a26:	e8 00 00 00 00       	call   3364a2b <pirq_ite_get+0xb5>	3364a27: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
00b5  3364a2b:	e9 7b ff ff ff       	jmp    33649ab <pirq_ite_get+0x35>
00ba  3364a30:	44 89 f1             	mov    %r14d,%ecx
00bd  3364a33:	80 e1 07             	and    $0x7,%cl
00c0  3364a36:	38 c1                	cmp    %al,%cl
00c2  3364a38:	7c 90                	jl     33649ca <pirq_ite_get+0x54>
00c4  3364a3a:	4c 89 f7             	mov    %r14,%rdi
00c7  3364a3d:	e8 00 00 00 00       	call   3364a42 <pirq_ite_get+0xcc>	3364a3e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
00cc  3364a42:	eb 86                	jmp    33649ca <pirq_ite_get+0x54>
00ce  3364a44:	e8 00 00 00 00       	call   3364a49 <pirq_ite_get+0xd3>	3364a45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00d3  3364a49:	45 89 f6             	mov    %r14d,%r14d
00d6  3364a4c:	eb ce                	jmp    3364a1c <pirq_ite_get+0xa6>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
