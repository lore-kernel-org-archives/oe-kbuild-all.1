Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340AC27466
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 09:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726911944; cv=none; b=rvoqYLpV+H8NeXAeIM+xr8zMafu3MwKp5hzv0w9JdoOaostJ3mIJQgyYM25fd9msCgeUKuhXvZmJY5PRPFX704lobK8bC8Z2i9VuM4hp4BrhiPdglx+njEQfAabMSuf2pWpD9ZPUhnyokULbP4BilN22jdrDhPQLbe1NkoKyddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726911944; c=relaxed/simple;
	bh=CotvbXnfe1szuEYiN1r9sSd9qz/J/OLVYrqp6zxEqv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YDmG98Nmcoq6LhxmEq86yCwNHUR7yLWIq6vi+Dq40rFCnrBo6n402xiyTmu+SwI7p58JFoAHa+QH1bUvePpUFgrC/9mEKRxcTKiGe0SgN32kAQ+dtTZZd9O0iWWOKiE98v7MNMjBVSw++gtVR51Ik9sKdgd10sSNq7XiuhxiNVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMlAIRg9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMlAIRg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726911942; x=1758447942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CotvbXnfe1szuEYiN1r9sSd9qz/J/OLVYrqp6zxEqv8=;
  b=eMlAIRg9Xb9EpGtRCfrBCtZlfc+v5UyRy5KpTE9cKdI5iDBK0ejNb/9I
   NuIrQVmM8D9A00S6wWyx8k6Ql5qkVhYengthWW4ryEwxvjgMNTY7dLztG
   2HZCU57+YUa57bsaazQFXlbWBZzftvje/ksyvpI64kUZ5IEDgx0jnlwUe
   f2MouyOlZRSO7TPc+xFhGLXktH9/3OArFCizmTC+/7KYTMiVyPip80BYg
   BeyOih4hUH8XIRNCKZ/X4MxFaY48RhwSqYywVNpNqwap6ThlZPUa7sbVq
   1Obj3FRKNP8aU7f0Ig7qfufJ8z+tcj7ChxuQBLx4LbTYcBk8V+cQ2pIEA
   w==;
X-CSE-ConnectionGUID: xxF7vf3lTaSrNU0Q/zDpkQ==
X-CSE-MsgGUID: YT8JOSQQSmeEq79PrJbBYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25786432"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="25786432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 02:45:41 -0700
X-CSE-ConnectionGUID: MfvSduEtT56KKMrfAXgeow==
X-CSE-MsgGUID: Fnr7vm8VTzu8R6W9vPcCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="101281038"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Sep 2024 02:45:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srwgL-000FKP-2L;
	Sat, 21 Sep 2024 09:45:37 +0000
Date: Sat, 21 Sep 2024 17:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2611/30000]
 drivers/iommu/io-pgtable-arm.o: warning: objtool:
 arm_lpae_map_pages()+0x195: unreachable instruction
Message-ID: <202409211753.nZVLgCph-lkp@intel.com>
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
commit: ac3994447c8a99437759c7da43c448914b5ac8b6 [2611/30000] FROMLIST: iommu/io-pgtable-arm: Implement arm_lpae_map_pages()
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240921/202409211753.nZVLgCph-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211753.nZVLgCph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211753.nZVLgCph-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm.o: warning: objtool: arm_lpae_map_pages()+0x195: unreachable instruction


objdump-func vmlinux.o arm_lpae_map_pages:
0000 00000000012f2ee1 <arm_lpae_map_pages>:
0000  12f2ee1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	12f2ee2: R_X86_64_NONE	__fentry__-0x4
0005  12f2ee6:	55                   	push   %rbp
0006  12f2ee7:	48 89 e5             	mov    %rsp,%rbp
0009  12f2eea:	41 57                	push   %r15
000b  12f2eec:	41 56                	push   %r14
000d  12f2eee:	41 55                	push   %r13
000f  12f2ef0:	41 54                	push   %r12
0011  12f2ef2:	53                   	push   %rbx
0012  12f2ef3:	48 8d 64 24 c0       	lea    -0x40(%rsp),%rsp
0017  12f2ef8:	44 89 4d d4          	mov    %r9d,-0x2c(%rbp)
001b  12f2efc:	4d 89 c6             	mov    %r8,%r14
001e  12f2eff:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
0022  12f2f03:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
0026  12f2f07:	48 89 f3             	mov    %rsi,%rbx
0029  12f2f0a:	49 89 fd             	mov    %rdi,%r13
002c  12f2f0d:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0036  12f2f17:	e8 00 00 00 00       	call   12f2f1c <arm_lpae_map_pages+0x3b>	12f2f18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
003b  12f2f1c:	49 8d 7d 40          	lea    0x40(%r13),%rdi
003f  12f2f20:	4c 89 fa             	mov    %r15,%rdx
0042  12f2f23:	48 89 f8             	mov    %rdi,%rax
0045  12f2f26:	48 c1 e8 03          	shr    $0x3,%rax
0049  12f2f2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
004e  12f2f2f:	74 0b                	je     12f2f3c <arm_lpae_map_pages+0x5b>
0050  12f2f31:	49 89 d7             	mov    %rdx,%r15
0053  12f2f34:	e8 00 00 00 00       	call   12f2f39 <arm_lpae_map_pages+0x58>	12f2f35: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0058  12f2f39:	4c 89 fa             	mov    %r15,%rdx
005b  12f2f3c:	49 8d 7d 34          	lea    0x34(%r13),%rdi
005f  12f2f40:	49 8b 4d 40          	mov    0x40(%r13),%rcx
0063  12f2f44:	48 89 f8             	mov    %rdi,%rax
0066  12f2f47:	48 89 4d a0          	mov    %rcx,-0x60(%rbp)
006a  12f2f4b:	48 c1 e8 03          	shr    $0x3,%rax
006e  12f2f4f:	8a 04 10             	mov    (%rax,%rdx,1),%al
0071  12f2f52:	84 c0                	test   %al,%al
0073  12f2f54:	0f 85 cc 02 00 00    	jne    12f3226 <arm_lpae_map_pages+0x345>
0079  12f2f5a:	4d 8d 7d c8          	lea    -0x38(%r13),%r15
007d  12f2f5e:	41 8b 4d 34          	mov    0x34(%r13),%ecx
0081  12f2f62:	4c 89 f8             	mov    %r15,%rax
0084  12f2f65:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
0088  12f2f69:	48 c1 e8 03          	shr    $0x3,%rax
008c  12f2f6d:	8a 04 10             	mov    (%rax,%rdx,1),%al
008f  12f2f70:	84 c0                	test   %al,%al
0091  12f2f72:	0f 85 ce 02 00 00    	jne    12f3246 <arm_lpae_map_pages+0x365>
0097  12f2f78:	41 8a 0f             	mov    (%r15),%cl
009a  12f2f7b:	49 89 df             	mov    %rbx,%r15
009d  12f2f7e:	48 89 5d 98          	mov    %rbx,-0x68(%rbp)
00a1  12f2f82:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
00a4  12f2f85:	49 d3 ff             	sar    %cl,%r15
00a7  12f2f88:	83 e3 03             	and    $0x3,%ebx
00aa  12f2f8b:	0f 84 d2 00 00 00    	je     12f3063 <arm_lpae_map_pages+0x182>
00b0  12f2f91:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
00b5  12f2f96:	0f 84 d3 00 00 00    	je     12f306f <arm_lpae_map_pages+0x18e>
00bb  12f2f9c:	4c 89 75 b0          	mov    %r14,-0x50(%rbp)
00bf  12f2fa0:	4d 8d 75 c0          	lea    -0x40(%r13),%r14
00c3  12f2fa4:	4c 89 f0             	mov    %r14,%rax
00c6  12f2fa7:	48 c1 e8 03          	shr    $0x3,%rax
00ca  12f2fab:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
00ce  12f2faf:	74 0e                	je     12f2fbf <arm_lpae_map_pages+0xde>
00d0  12f2fb1:	4c 89 f7             	mov    %r14,%rdi
00d3  12f2fb4:	49 89 d4             	mov    %rdx,%r12
00d6  12f2fb7:	e8 00 00 00 00       	call   12f2fbc <arm_lpae_map_pages+0xdb>	12f2fb8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00db  12f2fbc:	4c 89 e2             	mov    %r12,%rdx
00de  12f2fbf:	49 8b 06             	mov    (%r14),%rax
00e1  12f2fc2:	48 f7 d0             	not    %rax
00e4  12f2fc5:	48 85 45 c0          	test   %rax,-0x40(%rbp)
00e8  12f2fc9:	0f 85 43 02 00 00    	jne    12f3212 <arm_lpae_map_pages+0x331>
00ee  12f2fcf:	49 8d 7d b8          	lea    -0x48(%r13),%rdi
00f2  12f2fd3:	49 89 fc             	mov    %rdi,%r12
00f5  12f2fd6:	49 c1 ec 03          	shr    $0x3,%r12
00f9  12f2fda:	41 80 3c 14 00       	cmpb   $0x0,(%r12,%rdx,1)
00fe  12f2fdf:	74 19                	je     12f2ffa <arm_lpae_map_pages+0x119>
0100  12f2fe1:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
0104  12f2fe5:	49 89 fc             	mov    %rdi,%r12
0107  12f2fe8:	49 89 d6             	mov    %rdx,%r14
010a  12f2feb:	e8 00 00 00 00       	call   12f2ff0 <arm_lpae_map_pages+0x10f>	12f2fec: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
010f  12f2ff0:	4c 89 e7             	mov    %r12,%rdi
0112  12f2ff3:	4c 89 f2             	mov    %r14,%rdx
0115  12f2ff6:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
0119  12f2ffa:	48 8b 07             	mov    (%rdi),%rax
011c  12f2ffd:	48 c1 e0 3a          	shl    $0x3a,%rax
0120  12f3001:	48 c1 f8 3f          	sar    $0x3f,%rax
0124  12f3005:	49 39 c7             	cmp    %rax,%r15
0127  12f3008:	75 76                	jne    12f3080 <arm_lpae_map_pages+0x19f>
0129  12f300a:	4d 8d 75 cc          	lea    -0x34(%r13),%r14
012d  12f300e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
0131  12f3012:	4c 89 f0             	mov    %r14,%rax
0134  12f3015:	48 c1 e8 03          	shr    $0x3,%rax
0138  12f3019:	8a 04 10             	mov    (%rax,%rdx,1),%al
013b  12f301c:	84 c0                	test   %al,%al
013d  12f301e:	0f 85 4a 02 00 00    	jne    12f326e <arm_lpae_map_pages+0x38d>
0143  12f3024:	41 8a 0e             	mov    (%r14),%cl
0146  12f3027:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
014a  12f302b:	48 d3 e8             	shr    %cl,%rax
014d  12f302e:	48 85 c0             	test   %rax,%rax
0150  12f3031:	0f 85 e5 01 00 00    	jne    12f321c <arm_lpae_map_pages+0x33b>
0156  12f3037:	49 83 c5 a8          	add    $0xffffffffffffffa8,%r13
015a  12f303b:	4c 89 e8             	mov    %r13,%rax
015d  12f303e:	48 c1 e8 03          	shr    $0x3,%rax
0161  12f3042:	8a 04 10             	mov    (%rax,%rdx,1),%al
0164  12f3045:	84 c0                	test   %al,%al
0166  12f3047:	0f 85 45 02 00 00    	jne    12f3292 <arm_lpae_map_pages+0x3b1>
016c  12f304d:	45 8b 7d 00          	mov    0x0(%r13),%r15d
0170  12f3051:	41 83 ff 02          	cmp    $0x2,%r15d
0174  12f3055:	74 3a                	je     12f3091 <arm_lpae_map_pages+0x1b0>
0176  12f3057:	45 85 ff             	test   %r15d,%r15d
0179  12f305a:	75 60                	jne    12f30bc <arm_lpae_map_pages+0x1db>
017b  12f305c:	e8 00 00 00 00       	call   12f3061 <arm_lpae_map_pages+0x180>	12f305d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0180  12f3061:	eb 33                	jmp    12f3096 <arm_lpae_map_pages+0x1b5>
0182  12f3063:	e8 00 00 00 00       	call   12f3068 <arm_lpae_map_pages+0x187>	12f3064: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0187  12f3068:	31 c0                	xor    %eax,%eax
0189  12f306a:	e9 7a 01 00 00       	jmp    12f31e9 <arm_lpae_map_pages+0x308>
018e  12f306f:	e8 00 00 00 00       	call   12f3074 <arm_lpae_map_pages+0x193>	12f3070: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0193  12f3074:	0f 0b                	ud2
0195  12f3076:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
019a  12f307b:	e9 69 01 00 00       	jmp    12f31e9 <arm_lpae_map_pages+0x308>
019f  12f3080:	e8 00 00 00 00       	call   12f3085 <arm_lpae_map_pages+0x1a4>	12f3081: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a4  12f3085:	0f 0b                	ud2
01a6  12f3087:	b8 de ff ff ff       	mov    $0xffffffde,%eax
01ab  12f308c:	e9 58 01 00 00       	jmp    12f31e9 <arm_lpae_map_pages+0x308>
01b0  12f3091:	e8 00 00 00 00       	call   12f3096 <arm_lpae_map_pages+0x1b5>	12f3092: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b5  12f3096:	31 c0                	xor    %eax,%eax
01b7  12f3098:	83 fb 01             	cmp    $0x1,%ebx
01ba  12f309b:	0f 94 c0             	sete   %al
01bd  12f309e:	45 31 f6             	xor    %r14d,%r14d
01c0  12f30a1:	c1 e0 07             	shl    $0x7,%eax
01c3  12f30a4:	f6 45 d4 20          	testb  $0x20,-0x2c(%rbp)
01c7  12f30a8:	41 0f 94 c6          	sete   %r14b
01cb  12f30ac:	41 c1 e6 06          	shl    $0x6,%r14d
01cf  12f30b0:	41 09 c6             	or     %eax,%r14d
01d2  12f30b3:	49 81 ce 00 08 00 00 	or     $0x800,%r14
01d9  12f30ba:	eb 0f                	jmp    12f30cb <arm_lpae_map_pages+0x1ea>
01db  12f30bc:	e8 00 00 00 00       	call   12f30c1 <arm_lpae_map_pages+0x1e0>	12f30bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01e0  12f30c1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
01e3  12f30c4:	c1 e0 06             	shl    $0x6,%eax
01e6  12f30c7:	44 0f b6 f0          	movzbl %al,%r14d
01ea  12f30cb:	41 83 ff 03          	cmp    $0x3,%r15d
01ee  12f30cf:	74 0d                	je     12f30de <arm_lpae_map_pages+0x1fd>
01f0  12f30d1:	41 83 ff 01          	cmp    $0x1,%r15d
01f4  12f30d5:	75 37                	jne    12f310e <arm_lpae_map_pages+0x22d>
01f6  12f30d7:	e8 00 00 00 00       	call   12f30dc <arm_lpae_map_pages+0x1fb>	12f30d8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01fb  12f30dc:	eb 05                	jmp    12f30e3 <arm_lpae_map_pages+0x202>
01fd  12f30de:	e8 00 00 00 00       	call   12f30e3 <arm_lpae_map_pages+0x202>	12f30df: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0202  12f30e3:	f6 45 d4 10          	testb  $0x10,-0x2c(%rbp)
0206  12f30e7:	75 19                	jne    12f3102 <arm_lpae_map_pages+0x221>
0208  12f30e9:	e8 00 00 00 00       	call   12f30ee <arm_lpae_map_pages+0x20d>	12f30ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
020d  12f30ee:	f6 45 d4 04          	testb  $0x4,-0x2c(%rbp)
0211  12f30f2:	b9 14 00 00 00       	mov    $0x14,%ecx
0216  12f30f7:	b8 3c 00 00 00       	mov    $0x3c,%eax
021b  12f30fc:	48 0f 44 c1          	cmove  %rcx,%rax
021f  12f3100:	eb 40                	jmp    12f3142 <arm_lpae_map_pages+0x261>
0221  12f3102:	e8 00 00 00 00       	call   12f3107 <arm_lpae_map_pages+0x226>	12f3103: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0226  12f3107:	b8 04 00 00 00       	mov    $0x4,%eax
022b  12f310c:	eb 34                	jmp    12f3142 <arm_lpae_map_pages+0x261>
022d  12f310e:	f6 45 d4 10          	testb  $0x10,-0x2c(%rbp)
0231  12f3112:	75 24                	jne    12f3138 <arm_lpae_map_pages+0x257>
0233  12f3114:	f6 45 d4 04          	testb  $0x4,-0x2c(%rbp)
0237  12f3118:	0f 85 db 00 00 00    	jne    12f31f9 <arm_lpae_map_pages+0x318>
023d  12f311e:	f6 45 d4 40          	testb  $0x40,-0x2c(%rbp)
0241  12f3122:	0f 85 db 00 00 00    	jne    12f3203 <arm_lpae_map_pages+0x322>
0247  12f3128:	e8 00 00 00 00       	call   12f312d <arm_lpae_map_pages+0x24c>	12f3129: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
024c  12f312d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
024f  12f3130:	c1 e8 03             	shr    $0x3,%eax
0252  12f3133:	83 e0 10             	and    $0x10,%eax
0255  12f3136:	eb 0a                	jmp    12f3142 <arm_lpae_map_pages+0x261>
0257  12f3138:	e8 00 00 00 00       	call   12f313d <arm_lpae_map_pages+0x25c>	12f3139: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
025c  12f313d:	b8 08 00 00 00       	mov    $0x8,%eax
0261  12f3142:	31 c9                	xor    %ecx,%ecx
0263  12f3144:	ba 00 02 00 00       	mov    $0x200,%edx
0268  12f3149:	8b 75 d4             	mov    -0x2c(%rbp),%esi
026b  12f314c:	44 89 fb             	mov    %r15d,%ebx
026e  12f314f:	41 83 ff 05          	cmp    $0x5,%r15d
0272  12f3153:	49 bf 00 00 00 00 00 00 60 00 	movabs $0x60000000000000,%r15
027c  12f315d:	0f 95 c1             	setne  %cl
027f  12f3160:	c1 e1 08             	shl    $0x8,%ecx
0282  12f3163:	48 09 d1             	or     %rdx,%rcx
0285  12f3166:	40 f6 c6 04          	test   $0x4,%sil
0289  12f316a:	48 0f 44 ca          	cmove  %rdx,%rcx
028d  12f316e:	49 09 c6             	or     %rax,%r14
0290  12f3171:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
029a  12f317b:	49 09 ce             	or     %rcx,%r14
029d  12f317e:	4d 09 f7             	or     %r14,%r15
02a0  12f3181:	40 f6 c6 08          	test   $0x8,%sil
02a4  12f3185:	4d 0f 44 fe          	cmove  %r14,%r15
02a8  12f3189:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
02ad  12f318e:	44 8b 65 10          	mov    0x10(%rbp),%r12d
02b1  12f3192:	4c 8b 75 c8          	mov    -0x38(%rbp),%r14
02b5  12f3196:	74 08                	je     12f31a0 <arm_lpae_map_pages+0x2bf>
02b7  12f3198:	4c 89 f7             	mov    %r14,%rdi
02ba  12f319b:	e8 00 00 00 00       	call   12f31a0 <arm_lpae_map_pages+0x2bf>	12f319c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02bf  12f31a0:	41 8b 06             	mov    (%r14),%eax
02c2  12f31a3:	4c 89 ef             	mov    %r13,%rdi
02c5  12f31a6:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
02c9  12f31aa:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
02cd  12f31ae:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
02d1  12f31b2:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
02d5  12f31b6:	c1 e0 05             	shl    $0x5,%eax
02d8  12f31b9:	83 e0 20             	and    $0x20,%eax
02db  12f31bc:	49 09 c7             	or     %rax,%r15
02de  12f31bf:	4d 89 f9             	mov    %r15,%r9
02e1  12f31c2:	49 81 c9 00 04 00 00 	or     $0x400,%r9
02e8  12f31c9:	83 fb 05             	cmp    $0x5,%ebx
02eb  12f31cc:	4d 0f 44 cf          	cmove  %r15,%r9
02ef  12f31d0:	41 54                	push   %r12
02f1  12f31d2:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
02f5  12f31d6:	50                   	push   %rax
02f6  12f31d7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
02fa  12f31db:	50                   	push   %rax
02fb  12f31dc:	e8 05 06 00 00       	call   12f37e6 <__arm_lpae_map>
0300  12f31e1:	48 8d 64 24 18       	lea    0x18(%rsp),%rsp
0305  12f31e6:	0f ae f8             	sfence
0308  12f31e9:	48 8d 64 24 40       	lea    0x40(%rsp),%rsp
030d  12f31ee:	5b                   	pop    %rbx
030e  12f31ef:	41 5c                	pop    %r12
0310  12f31f1:	41 5d                	pop    %r13
0312  12f31f3:	41 5e                	pop    %r14
0314  12f31f5:	41 5f                	pop    %r15
0316  12f31f7:	5d                   	pop    %rbp
0317  12f31f8:	c3                   	ret
0318  12f31f9:	e8 00 00 00 00       	call   12f31fe <arm_lpae_map_pages+0x31d>	12f31fa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
031d  12f31fe:	e9 04 ff ff ff       	jmp    12f3107 <arm_lpae_map_pages+0x226>
0322  12f3203:	e8 00 00 00 00       	call   12f3208 <arm_lpae_map_pages+0x327>	12f3204: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0327  12f3208:	b8 0c 00 00 00       	mov    $0xc,%eax
032c  12f320d:	e9 30 ff ff ff       	jmp    12f3142 <arm_lpae_map_pages+0x261>
0331  12f3212:	e8 00 00 00 00       	call   12f3217 <arm_lpae_map_pages+0x336>	12f3213: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0336  12f3217:	e9 58 fe ff ff       	jmp    12f3074 <arm_lpae_map_pages+0x193>
033b  12f321c:	e8 00 00 00 00       	call   12f3221 <arm_lpae_map_pages+0x340>	12f321d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0340  12f3221:	e9 5f fe ff ff       	jmp    12f3085 <arm_lpae_map_pages+0x1a4>
0345  12f3226:	89 f9                	mov    %edi,%ecx
0347  12f3228:	80 e1 07             	and    $0x7,%cl
034a  12f322b:	80 c1 03             	add    $0x3,%cl
034d  12f322e:	38 c1                	cmp    %al,%cl
034f  12f3230:	0f 8c 24 fd ff ff    	jl     12f2f5a <arm_lpae_map_pages+0x79>
0355  12f3236:	49 89 d7             	mov    %rdx,%r15
0358  12f3239:	e8 00 00 00 00       	call   12f323e <arm_lpae_map_pages+0x35d>	12f323a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
035d  12f323e:	4c 89 fa             	mov    %r15,%rdx
0360  12f3241:	e9 14 fd ff ff       	jmp    12f2f5a <arm_lpae_map_pages+0x79>
0365  12f3246:	44 89 f9             	mov    %r15d,%ecx
0368  12f3249:	80 e1 07             	and    $0x7,%cl
036b  12f324c:	80 c1 03             	add    $0x3,%cl
036e  12f324f:	38 c1                	cmp    %al,%cl
0370  12f3251:	0f 8c 21 fd ff ff    	jl     12f2f78 <arm_lpae_map_pages+0x97>
0376  12f3257:	4c 89 ff             	mov    %r15,%rdi
0379  12f325a:	e8 00 00 00 00       	call   12f325f <arm_lpae_map_pages+0x37e>	12f325b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
037e  12f325f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0388  12f3269:	e9 0a fd ff ff       	jmp    12f2f78 <arm_lpae_map_pages+0x97>
038d  12f326e:	44 89 f1             	mov    %r14d,%ecx
0390  12f3271:	80 e1 07             	and    $0x7,%cl
0393  12f3274:	80 c1 03             	add    $0x3,%cl
0396  12f3277:	38 c1                	cmp    %al,%cl
0398  12f3279:	0f 8c a5 fd ff ff    	jl     12f3024 <arm_lpae_map_pages+0x143>
039e  12f327f:	4c 89 f7             	mov    %r14,%rdi
03a1  12f3282:	49 89 d7             	mov    %rdx,%r15
03a4  12f3285:	e8 00 00 00 00       	call   12f328a <arm_lpae_map_pages+0x3a9>	12f3286: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03a9  12f328a:	4c 89 fa             	mov    %r15,%rdx
03ac  12f328d:	e9 92 fd ff ff       	jmp    12f3024 <arm_lpae_map_pages+0x143>
03b1  12f3292:	44 89 e9             	mov    %r13d,%ecx
03b4  12f3295:	80 e1 07             	and    $0x7,%cl
03b7  12f3298:	80 c1 03             	add    $0x3,%cl
03ba  12f329b:	38 c1                	cmp    %al,%cl
03bc  12f329d:	0f 8c aa fd ff ff    	jl     12f304d <arm_lpae_map_pages+0x16c>
03c2  12f32a3:	4c 89 ef             	mov    %r13,%rdi
03c5  12f32a6:	e8 00 00 00 00       	call   12f32ab <arm_lpae_map_pages+0x3ca>	12f32a7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03ca  12f32ab:	e9 9d fd ff ff       	jmp    12f304d <arm_lpae_map_pages+0x16c>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
