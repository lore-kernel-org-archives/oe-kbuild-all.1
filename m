Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534BF16DED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726927915; cv=none; b=G9YLzZ240smLkxAXr3qc2IhAGLCaRQHkSSSMus4FNVApU5HwpkVTg11bPMxY1roLgm7deX5/1LscZ3LLZD2zD+PZG1+TNhXmRmqxKsA6usnG8hNYmsCuN4q2EgnFiEnfa5p584FgEWI811eXa7D+6l+nRh6UVNAC5isHWFIrp2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726927915; c=relaxed/simple;
	bh=+D7IOMj8AT6v4T+CwtzXwu2XvZUmqXq1nAPD3GDar+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IG3XkMxjHkecA58HYY1VgmseBnGXA9V+FlVvp3uSmt1WIMqSlZgVr4XiMqiosHYMkHd1a99iD7rq81ELgJ+FKU92HfL/P3uVDdtBItrYd4d4J37br7b8d18YVM10kt+4yOyuTcgow/ypsOZHXeaPFlpOwT3k0vSclJgrLUxVpOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbKQwtvs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbKQwtvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726927912; x=1758463912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+D7IOMj8AT6v4T+CwtzXwu2XvZUmqXq1nAPD3GDar+0=;
  b=fbKQwtvskOYbeuz5NdHGHjAI7cYib/WSYw4i4DpPzLo+en+dgS+Tmpxo
   1Qfve84LB7ZVOCAHklBHng2hgI7UmVk+StFnQvFlrYhsP980l5UU6RKxT
   QsQGEmvDJJDHfDuVH4rPwXD4J9HA0Tjx/RO+JKql5Jz7jgQ3nDBlWZlcW
   K8LN7WYr0ToCZCEvScrnmGMlxbBM8BoJ3/ZtVZHd0x5XNbUFxg0VgP2a5
   DuroHKOFnu5mxTs76mR8Y9nzRt1KrrWl55cLS3WkOqXHHP3M0UyEaDWag
   svp1HBnOTv/u4RpV1nZ6dE2vRX/IryiMXw7OnHAHsr7IWrt6CvM6NCl1m
   w==;
X-CSE-ConnectionGUID: m4HGqwhSS121Z/sE7FNJ1g==
X-CSE-MsgGUID: ooT3iwo+Szm8/CyYNpQn/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29713843"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="29713843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 07:11:51 -0700
X-CSE-ConnectionGUID: mME2GEzSTZSYH7gT5AAd6w==
X-CSE-MsgGUID: Cv9ntjvJTYqasq+8TltNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="75152107"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2024 07:11:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss0pv-000FTX-3C;
	Sat, 21 Sep 2024 14:11:47 +0000
Date: Sat, 21 Sep 2024 22:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 6/11]
 drivers/power/supply/da9052-battery.o: warning: objtool:
 da9052_bat_read_capacity()+0x1fd: unreachable instruction
Message-ID: <202409212207.0gCerwkE-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240921/202409212207.0gCerwkE-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409212207.0gCerwkE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409212207.0gCerwkE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/da9052-battery.o: warning: objtool: da9052_bat_read_capacity()+0x1fd: unreachable instruction
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.o: warning: objtool: nvkm_mmu_heap()+0x12f: unreachable instruction
--
>> drivers/fpga/dfl.o: warning: objtool: dfl_id_free()+0x5f: unreachable instruction
--
>> drivers/ssb/main.o: warning: objtool: ssb_devices_freeze()+0x2ea: unreachable instruction


objdump-func vmlinux.o da9052_bat_read_capacity:
0000 0000000002cb2dc9 <da9052_bat_read_capacity>:
0000  2cb2dc9:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	2cb2dca: R_X86_64_NONE	__fentry__-0x4
0005  2cb2dce:	55                   	push   %rbp
0006  2cb2dcf:	48 89 e5             	mov    %rsp,%rbp
0009  2cb2dd2:	41 57                	push   %r15
000b  2cb2dd4:	41 56                	push   %r14
000d  2cb2dd6:	41 55                	push   %r13
000f  2cb2dd8:	41 54                	push   %r12
0011  2cb2dda:	53                   	push   %rbx
0012  2cb2ddb:	48 8d 64 24 d0       	lea    -0x30(%rsp),%rsp
0017  2cb2de0:	49 89 f4             	mov    %rsi,%r12
001a  2cb2de3:	49 89 ff             	mov    %rdi,%r15
001d  2cb2de6:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0027  2cb2df0:	e8 00 00 00 00       	call   2cb2df5 <da9052_bat_read_capacity+0x2c>	2cb2df1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002c  2cb2df5:	4c 89 fb             	mov    %r15,%rbx
002f  2cb2df8:	48 c1 eb 03          	shr    $0x3,%rbx
0033  2cb2dfc:	42 80 3c 33 00       	cmpb   $0x0,(%rbx,%r14,1)
0038  2cb2e01:	74 08                	je     2cb2e0b <da9052_bat_read_capacity+0x42>
003a  2cb2e03:	4c 89 ff             	mov    %r15,%rdi
003d  2cb2e06:	e8 00 00 00 00       	call   2cb2e0b <da9052_bat_read_capacity+0x42>	2cb2e07: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0042  2cb2e0b:	49 8b 3f             	mov    (%r15),%rdi
0045  2cb2e0e:	be 03 00 00 00       	mov    $0x3,%esi
004a  2cb2e13:	e8 00 00 00 00       	call   2cb2e18 <da9052_bat_read_capacity+0x4f>	2cb2e14: R_X86_64_PLT32	da9052_adc_manual_read-0x4
004f  2cb2e18:	41 89 c6             	mov    %eax,%r14d
0052  2cb2e1b:	85 c0                	test   %eax,%eax
0054  2cb2e1d:	78 55                	js     2cb2e74 <da9052_bat_read_capacity+0xab>
0056  2cb2e1f:	41 69 c6 e8 03 00 00 	imul   $0x3e8,%r14d,%eax
005d  2cb2e26:	44 8d a8 ff 01 00 00 	lea    0x1ff(%rax),%r13d
0064  2cb2e2d:	85 c0                	test   %eax,%eax
0066  2cb2e2f:	44 0f 49 e8          	cmovns %eax,%r13d
006a  2cb2e33:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0074  2cb2e3d:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
0078  2cb2e41:	74 08                	je     2cb2e4b <da9052_bat_read_capacity+0x82>
007a  2cb2e43:	4c 89 ff             	mov    %r15,%rdi
007d  2cb2e46:	e8 00 00 00 00       	call   2cb2e4b <da9052_bat_read_capacity+0x82>	2cb2e47: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0082  2cb2e4b:	49 8b 3f             	mov    (%r15),%rdi
0085  2cb2e4e:	e8 00 00 00 00       	call   2cb2e53 <da9052_bat_read_capacity+0x8a>	2cb2e4f: R_X86_64_PLT32	da9052_adc_read_temp-0x4
008a  2cb2e53:	41 89 c6             	mov    %eax,%r14d
008d  2cb2e56:	85 c0                	test   %eax,%eax
008f  2cb2e58:	78 24                	js     2cb2e7e <da9052_bat_read_capacity+0xb5>
0091  2cb2e5a:	41 c1 fd 09          	sar    $0x9,%r13d
0095  2cb2e5e:	41 80 fe 0a          	cmp    $0xa,%r14b
0099  2cb2e62:	44 89 6d d4          	mov    %r13d,-0x2c(%rbp)
009d  2cb2e66:	77 20                	ja     2cb2e88 <da9052_bat_read_capacity+0xbf>
009f  2cb2e68:	e8 00 00 00 00       	call   2cb2e6d <da9052_bat_read_capacity+0xa4>	2cb2e69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a4  2cb2e6d:	31 db                	xor    %ebx,%ebx
00a6  2cb2e6f:	e9 5f 01 00 00       	jmp    2cb2fd3 <da9052_bat_read_capacity+0x20a>
00ab  2cb2e74:	e8 00 00 00 00       	call   2cb2e79 <da9052_bat_read_capacity+0xb0>	2cb2e75: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b0  2cb2e79:	e9 dc 03 00 00       	jmp    2cb325a <da9052_bat_read_capacity+0x491>
00b5  2cb2e7e:	e8 00 00 00 00       	call   2cb2e83 <da9052_bat_read_capacity+0xba>	2cb2e7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ba  2cb2e83:	e9 d2 03 00 00       	jmp    2cb325a <da9052_bat_read_capacity+0x491>
00bf  2cb2e88:	41 80 fe 29          	cmp    $0x29,%r14b
00c3  2cb2e8c:	72 0f                	jb     2cb2e9d <da9052_bat_read_capacity+0xd4>
00c5  2cb2e8e:	e8 00 00 00 00       	call   2cb2e93 <da9052_bat_read_capacity+0xca>	2cb2e8f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ca  2cb2e93:	bb 02 00 00 00       	mov    $0x2,%ebx
00cf  2cb2e98:	e9 36 01 00 00       	jmp    2cb2fd3 <da9052_bat_read_capacity+0x20a>
00d4  2cb2e9d:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
00d8  2cb2ea1:	41 0f b6 c6          	movzbl %r14b,%eax
00dc  2cb2ea5:	45 0f b6 e6          	movzbl %r14b,%r12d
00e0  2cb2ea9:	41 b5 01             	mov    $0x1,%r13b
00e3  2cb2eac:	31 db                	xor    %ebx,%ebx
00e5  2cb2eae:	89 45 c0             	mov    %eax,-0x40(%rbp)
00e8  2cb2eb1:	4c 8d b4 1b 00 00 00 00 	lea    0x0(%rbx,%rbx,1),%r14	2cb2eb5: R_X86_64_32S	.rodata+0xd0b4a0
00f0  2cb2eb9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00fa  2cb2ec3:	4c 89 f0             	mov    %r14,%rax
00fd  2cb2ec6:	48 c1 e8 03          	shr    $0x3,%rax
0101  2cb2eca:	8a 04 08             	mov    (%rax,%rcx,1),%al
0104  2cb2ecd:	84 c0                	test   %al,%al
0106  2cb2ecf:	0f 85 90 00 00 00    	jne    2cb2f65 <da9052_bat_read_capacity+0x19c>
010c  2cb2ed5:	45 0f b7 3e          	movzwl (%r14),%r15d
0110  2cb2ed9:	4c 8d b4 1b 00 00 00 00 	lea    0x0(%rbx,%rbx,1),%r14	2cb2edd: R_X86_64_32S	.rodata+0xd0b4a2
0118  2cb2ee1:	66 45 39 e7          	cmp    %r12w,%r15w
011c  2cb2ee5:	73 35                	jae    2cb2f1c <da9052_bat_read_capacity+0x153>
011e  2cb2ee7:	4c 89 f0             	mov    %r14,%rax
0121  2cb2eea:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
012b  2cb2ef4:	48 c1 e8 03          	shr    $0x3,%rax
012f  2cb2ef8:	8a 04 08             	mov    (%rax,%rcx,1),%al
0132  2cb2efb:	84 c0                	test   %al,%al
0134  2cb2efd:	0f 85 95 00 00 00    	jne    2cb2f98 <da9052_bat_read_capacity+0x1cf>
013a  2cb2f03:	41 0f b7 06          	movzwl (%r14),%eax
013e  2cb2f07:	44 01 f8             	add    %r15d,%eax
0141  2cb2f0a:	d1 e8                	shr    %eax
0143  2cb2f0c:	3b 45 c0             	cmp    -0x40(%rbp),%eax
0146  2cb2f0f:	0f 83 b5 00 00 00    	jae    2cb2fca <da9052_bat_read_capacity+0x201>
014c  2cb2f15:	e8 00 00 00 00       	call   2cb2f1a <da9052_bat_read_capacity+0x151>	2cb2f16: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0151  2cb2f1a:	eb 05                	jmp    2cb2f21 <da9052_bat_read_capacity+0x158>
0153  2cb2f1c:	e8 00 00 00 00       	call   2cb2f21 <da9052_bat_read_capacity+0x158>	2cb2f1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0158  2cb2f21:	4c 89 f0             	mov    %r14,%rax
015b  2cb2f24:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0165  2cb2f2e:	48 c1 e8 03          	shr    $0x3,%rax
0169  2cb2f32:	8a 04 08             	mov    (%rax,%rcx,1),%al
016c  2cb2f35:	84 c0                	test   %al,%al
016e  2cb2f37:	75 49                	jne    2cb2f82 <da9052_bat_read_capacity+0x1b9>
0170  2cb2f39:	41 0f b7 06          	movzwl (%r14),%eax
0174  2cb2f3d:	44 01 f8             	add    %r15d,%eax
0177  2cb2f40:	d1 e8                	shr    %eax
0179  2cb2f42:	3b 45 c0             	cmp    -0x40(%rbp),%eax
017c  2cb2f45:	73 06                	jae    2cb2f4d <da9052_bat_read_capacity+0x184>
017e  2cb2f47:	66 45 39 e7          	cmp    %r12w,%r15w
0182  2cb2f4b:	73 68                	jae    2cb2fb5 <da9052_bat_read_capacity+0x1ec>
0184  2cb2f4d:	41 f6 c5 01          	test   $0x1,%r13b
0188  2cb2f51:	74 6c                	je     2cb2fbf <da9052_bat_read_capacity+0x1f6>
018a  2cb2f53:	e8 00 00 00 00       	call   2cb2f58 <da9052_bat_read_capacity+0x18f>	2cb2f54: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
018f  2cb2f58:	bb 01 00 00 00       	mov    $0x1,%ebx
0194  2cb2f5d:	45 31 ed             	xor    %r13d,%r13d
0197  2cb2f60:	e9 4c ff ff ff       	jmp    2cb2eb1 <da9052_bat_read_capacity+0xe8>
019c  2cb2f65:	44 89 f1             	mov    %r14d,%ecx
019f  2cb2f68:	80 e1 07             	and    $0x7,%cl
01a2  2cb2f6b:	fe c1                	inc    %cl
01a4  2cb2f6d:	38 c1                	cmp    %al,%cl
01a6  2cb2f6f:	0f 8c 60 ff ff ff    	jl     2cb2ed5 <da9052_bat_read_capacity+0x10c>
01ac  2cb2f75:	4c 89 f7             	mov    %r14,%rdi
01af  2cb2f78:	e8 00 00 00 00       	call   2cb2f7d <da9052_bat_read_capacity+0x1b4>	2cb2f79: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
01b4  2cb2f7d:	e9 53 ff ff ff       	jmp    2cb2ed5 <da9052_bat_read_capacity+0x10c>
01b9  2cb2f82:	44 89 f1             	mov    %r14d,%ecx
01bc  2cb2f85:	80 e1 07             	and    $0x7,%cl
01bf  2cb2f88:	fe c1                	inc    %cl
01c1  2cb2f8a:	38 c1                	cmp    %al,%cl
01c3  2cb2f8c:	7c ab                	jl     2cb2f39 <da9052_bat_read_capacity+0x170>
01c5  2cb2f8e:	4c 89 f7             	mov    %r14,%rdi
01c8  2cb2f91:	e8 00 00 00 00       	call   2cb2f96 <da9052_bat_read_capacity+0x1cd>	2cb2f92: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
01cd  2cb2f96:	eb a1                	jmp    2cb2f39 <da9052_bat_read_capacity+0x170>
01cf  2cb2f98:	44 89 f1             	mov    %r14d,%ecx
01d2  2cb2f9b:	80 e1 07             	and    $0x7,%cl
01d5  2cb2f9e:	fe c1                	inc    %cl
01d7  2cb2fa0:	38 c1                	cmp    %al,%cl
01d9  2cb2fa2:	0f 8c 5b ff ff ff    	jl     2cb2f03 <da9052_bat_read_capacity+0x13a>
01df  2cb2fa8:	4c 89 f7             	mov    %r14,%rdi
01e2  2cb2fab:	e8 00 00 00 00       	call   2cb2fb0 <da9052_bat_read_capacity+0x1e7>	2cb2fac: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
01e7  2cb2fb0:	e9 4e ff ff ff       	jmp    2cb2f03 <da9052_bat_read_capacity+0x13a>
01ec  2cb2fb5:	48 ff c3             	inc    %rbx
01ef  2cb2fb8:	e8 00 00 00 00       	call   2cb2fbd <da9052_bat_read_capacity+0x1f4>	2cb2fb9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01f4  2cb2fbd:	eb 10                	jmp    2cb2fcf <da9052_bat_read_capacity+0x206>
01f6  2cb2fbf:	e8 00 00 00 00       	call   2cb2fc4 <da9052_bat_read_capacity+0x1fb>	2cb2fc0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01fb  2cb2fc4:	0f 0b                	ud2
01fd  2cb2fc6:	31 db                	xor    %ebx,%ebx
01ff  2cb2fc8:	eb 05                	jmp    2cb2fcf <da9052_bat_read_capacity+0x206>
0201  2cb2fca:	e8 00 00 00 00       	call   2cb2fcf <da9052_bat_read_capacity+0x206>	2cb2fcb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0206  2cb2fcf:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
020a  2cb2fd3:	48 69 d3 20 02 00 00 	imul   $0x220,%rbx,%rdx
0211  2cb2fda:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
0214  2cb2fdd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
021e  2cb2fe7:	81 c3 c4 09 00 00    	add    $0x9c4,%ebx
0224  2cb2fed:	4c 8d aa 00 00 00 00 	lea    0x0(%rdx),%r13	2cb2ff0: R_X86_64_32S	.rodata+0xd0acc0
022b  2cb2ff4:	4d 89 ee             	mov    %r13,%r14
022e  2cb2ff7:	49 c1 ee 03          	shr    $0x3,%r14
0232  2cb2ffb:	41 8a 04 06          	mov    (%r14,%rax,1),%al
0236  2cb2fff:	84 c0                	test   %al,%al
0238  2cb3001:	0f 85 66 02 00 00    	jne    2cb326d <da9052_bat_read_capacity+0x4a4>
023e  2cb3007:	41 3b 5d 00          	cmp    0x0(%r13),%ebx
0242  2cb300b:	89 5d d4             	mov    %ebx,-0x2c(%rbp)
0245  2cb300e:	0f 83 63 01 00 00    	jae    2cb3177 <da9052_bat_read_capacity+0x3ae>
024b  2cb3014:	4c 8d ba 00 00 00 00 	lea    0x0(%rdx),%r15	2cb3017: R_X86_64_32S	.rodata+0xd0aed8
0252  2cb301b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
025c  2cb3025:	4c 89 f8             	mov    %r15,%rax
025f  2cb3028:	48 c1 e8 03          	shr    $0x3,%rax
0263  2cb302c:	8a 04 08             	mov    (%rax,%rcx,1),%al
0266  2cb302f:	84 c0                	test   %al,%al
0268  2cb3031:	0f 85 71 02 00 00    	jne    2cb32a8 <da9052_bat_read_capacity+0x4df>
026e  2cb3037:	8b 45 d4             	mov    -0x2c(%rbp),%eax
0271  2cb303a:	41 3b 07             	cmp    (%r15),%eax
0274  2cb303d:	0f 86 43 01 00 00    	jbe    2cb3186 <da9052_bat_read_capacity+0x3bd>
027a  2cb3043:	48 8d b2 00 00 00 00 	lea    0x0(%rdx),%rsi	2cb3046: R_X86_64_32S	.rodata+0xd0acc8
0281  2cb304a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
028b  2cb3054:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
028f  2cb3058:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
0293  2cb305c:	4c 8d 82 00 00 00 00 	lea    0x0(%rdx),%r8	2cb305f: R_X86_64_32S	.rodata+0xd0accc
029a  2cb3063:	49 bd 00 00 00 00 00 04 00 20 	movabs $0x2000040000000000,%r13
02a4  2cb306d:	45 31 e4             	xor    %r12d,%r12d
02a7  2cb3070:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
02ab  2cb3074:	48 c1 ee 03          	shr    $0x3,%rsi
02af  2cb3078:	49 01 c6             	add    %rax,%r14
02b2  2cb307b:	48 01 c6             	add    %rax,%rsi
02b5  2cb307e:	41 8a 06             	mov    (%r14),%al
02b8  2cb3081:	44 8b 55 d4          	mov    -0x2c(%rbp),%r10d
02bc  2cb3085:	84 c0                	test   %al,%al
02be  2cb3087:	75 7b                	jne    2cb3104 <da9052_bat_read_capacity+0x33b>
02c0  2cb3089:	43 8b 54 20 f4       	mov    -0xc(%r8,%r12,1),%edx
02c5  2cb308e:	41 39 d2             	cmp    %edx,%r10d
02c8  2cb3091:	76 10                	jbe    2cb30a3 <da9052_bat_read_capacity+0x2da>
02ca  2cb3093:	4d 89 f7             	mov    %r14,%r15
02cd  2cb3096:	4c 89 c3             	mov    %r8,%rbx
02d0  2cb3099:	49 89 f6             	mov    %rsi,%r14
02d3  2cb309c:	e8 00 00 00 00       	call   2cb30a1 <da9052_bat_read_capacity+0x2d8>	2cb309d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02d8  2cb30a1:	eb 34                	jmp    2cb30d7 <da9052_bat_read_capacity+0x30e>
02da  2cb30a3:	8a 06                	mov    (%rsi),%al
02dc  2cb30a5:	4c 89 6d c0          	mov    %r13,-0x40(%rbp)
02e0  2cb30a9:	45 89 d5             	mov    %r10d,%r13d
02e3  2cb30ac:	84 c0                	test   %al,%al
02e5  2cb30ae:	0f 85 88 00 00 00    	jne    2cb313c <da9052_bat_read_capacity+0x373>
02eb  2cb30b4:	4c 89 c3             	mov    %r8,%rbx
02ee  2cb30b7:	47 8b 44 20 fc       	mov    -0x4(%r8,%r12,1),%r8d
02f3  2cb30bc:	45 89 ef             	mov    %r13d,%r15d
02f6  2cb30bf:	45 29 c7             	sub    %r8d,%r15d
02f9  2cb30c2:	0f 83 da 00 00 00    	jae    2cb31a2 <da9052_bat_read_capacity+0x3d9>
02ff  2cb30c8:	4d 89 f7             	mov    %r14,%r15
0302  2cb30cb:	49 89 f6             	mov    %rsi,%r14
0305  2cb30ce:	e8 00 00 00 00       	call   2cb30d3 <da9052_bat_read_capacity+0x30a>	2cb30cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
030a  2cb30d3:	4c 8b 6d c0          	mov    -0x40(%rbp),%r13
030e  2cb30d7:	49 81 fc 10 02 00 00 	cmp    $0x210,%r12
0315  2cb30de:	0f 84 ae 00 00 00    	je     2cb3192 <da9052_bat_read_capacity+0x3c9>
031b  2cb30e4:	e8 00 00 00 00       	call   2cb30e9 <da9052_bat_read_capacity+0x320>	2cb30e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0320  2cb30e9:	4c 89 f6             	mov    %r14,%rsi
0323  2cb30ec:	4d 89 fe             	mov    %r15,%r14
0326  2cb30ef:	49 83 c4 08          	add    $0x8,%r12
032a  2cb30f3:	49 ff cd             	dec    %r13
032d  2cb30f6:	49 89 d8             	mov    %rbx,%r8
0330  2cb30f9:	48 ff c6             	inc    %rsi
0333  2cb30fc:	49 ff c6             	inc    %r14
0336  2cb30ff:	e9 7a ff ff ff       	jmp    2cb307e <da9052_bat_read_capacity+0x2b5>
033b  2cb3104:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
033f  2cb3108:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
0343  2cb310c:	89 f9                	mov    %edi,%ecx
0345  2cb310e:	80 e1 07             	and    $0x7,%cl
0348  2cb3111:	80 c1 03             	add    $0x3,%cl
034b  2cb3114:	38 c1                	cmp    %al,%cl
034d  2cb3116:	0f 8c 6d ff ff ff    	jl     2cb3089 <da9052_bat_read_capacity+0x2c0>
0353  2cb311c:	4d 89 f7             	mov    %r14,%r15
0356  2cb311f:	4c 89 c3             	mov    %r8,%rbx
0359  2cb3122:	49 89 f6             	mov    %rsi,%r14
035c  2cb3125:	e8 00 00 00 00       	call   2cb312a <da9052_bat_read_capacity+0x361>	2cb3126: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0361  2cb312a:	4c 89 f6             	mov    %r14,%rsi
0364  2cb312d:	4d 89 fe             	mov    %r15,%r14
0367  2cb3130:	49 89 d8             	mov    %rbx,%r8
036a  2cb3133:	44 8b 55 d4          	mov    -0x2c(%rbp),%r10d
036e  2cb3137:	e9 4d ff ff ff       	jmp    2cb3089 <da9052_bat_read_capacity+0x2c0>
0373  2cb313c:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
0377  2cb3140:	4a 8d 7c 21 08       	lea    0x8(%rcx,%r12,1),%rdi
037c  2cb3145:	89 f9                	mov    %edi,%ecx
037e  2cb3147:	80 e1 07             	and    $0x7,%cl
0381  2cb314a:	80 c1 03             	add    $0x3,%cl
0384  2cb314d:	38 c1                	cmp    %al,%cl
0386  2cb314f:	0f 8c 5f ff ff ff    	jl     2cb30b4 <da9052_bat_read_capacity+0x2eb>
038c  2cb3155:	4d 89 f7             	mov    %r14,%r15
038f  2cb3158:	89 d3                	mov    %edx,%ebx
0391  2cb315a:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
0395  2cb315e:	49 89 f6             	mov    %rsi,%r14
0398  2cb3161:	e8 00 00 00 00       	call   2cb3166 <da9052_bat_read_capacity+0x39d>	2cb3162: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
039d  2cb3166:	4c 89 f6             	mov    %r14,%rsi
03a0  2cb3169:	4d 89 fe             	mov    %r15,%r14
03a3  2cb316c:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
03a7  2cb3170:	89 da                	mov    %ebx,%edx
03a9  2cb3172:	e9 3d ff ff ff       	jmp    2cb30b4 <da9052_bat_read_capacity+0x2eb>
03ae  2cb3177:	e8 00 00 00 00       	call   2cb317c <da9052_bat_read_capacity+0x3b3>	2cb3178: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03b3  2cb317c:	bb 64 00 00 00       	mov    $0x64,%ebx
03b8  2cb3181:	e9 b5 00 00 00       	jmp    2cb323b <da9052_bat_read_capacity+0x472>
03bd  2cb3186:	e8 00 00 00 00       	call   2cb318b <da9052_bat_read_capacity+0x3c2>	2cb3187: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03c2  2cb318b:	31 db                	xor    %ebx,%ebx
03c4  2cb318d:	e9 a9 00 00 00       	jmp    2cb323b <da9052_bat_read_capacity+0x472>
03c9  2cb3192:	e8 00 00 00 00       	call   2cb3197 <da9052_bat_read_capacity+0x3ce>	2cb3193: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03ce  2cb3197:	41 be fb ff ff ff    	mov    $0xfffffffb,%r14d
03d4  2cb319d:	e9 b8 00 00 00       	jmp    2cb325a <da9052_bat_read_capacity+0x491>
03d9  2cb31a2:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
03dd  2cb31a6:	4c 8b 6d c0          	mov    -0x40(%rbp),%r13
03e1  2cb31aa:	48 8d 80 00 00 00 00 	lea    0x0(%rax),%rax	2cb31ad: R_X86_64_32S	.rodata+0xd0acc4
03e8  2cb31b1:	48 c1 e8 03          	shr    $0x3,%rax
03ec  2cb31b5:	4c 29 e8             	sub    %r13,%rax
03ef  2cb31b8:	8a 00                	mov    (%rax),%al
03f1  2cb31ba:	84 c0                	test   %al,%al
03f3  2cb31bc:	0f 85 12 01 00 00    	jne    2cb32d4 <da9052_bat_read_capacity+0x50b>
03f9  2cb31c2:	48 89 d8             	mov    %rbx,%rax
03fc  2cb31c5:	46 8b 74 23 f8       	mov    -0x8(%rbx,%r12,1),%r14d
0401  2cb31ca:	48 c1 e8 03          	shr    $0x3,%rax
0405  2cb31ce:	4c 29 e8             	sub    %r13,%rax
0408  2cb31d1:	8a 00                	mov    (%rax),%al
040a  2cb31d3:	84 c0                	test   %al,%al
040c  2cb31d5:	0f 85 2d 01 00 00    	jne    2cb3308 <da9052_bat_read_capacity+0x53f>
0412  2cb31db:	46 8b 24 23          	mov    (%rbx,%r12,1),%r12d
0416  2cb31df:	89 d0                	mov    %edx,%eax
0418  2cb31e1:	45 29 e6             	sub    %r12d,%r14d
041b  2cb31e4:	44 29 c0             	sub    %r8d,%eax
041e  2cb31e7:	45 69 f6 e8 03 00 00 	imul   $0x3e8,%r14d,%r14d
0425  2cb31ee:	f7 d0                	not    %eax
0427  2cb31f0:	41 8d 8e 00 00 00 80 	lea    -0x80000000(%r14),%ecx
042e  2cb31f7:	09 c8                	or     %ecx,%eax
0430  2cb31f9:	0f 95 c0             	setne  %al
0433  2cb31fc:	44 29 c2             	sub    %r8d,%edx
0436  2cb31ff:	89 d3                	mov    %edx,%ebx
0438  2cb3201:	0f 84 35 01 00 00    	je     2cb333c <da9052_bat_read_capacity+0x573>
043e  2cb3207:	84 c0                	test   %al,%al
0440  2cb3209:	0f 84 2d 01 00 00    	je     2cb333c <da9052_bat_read_capacity+0x573>
0446  2cb320f:	e8 00 00 00 00       	call   2cb3214 <da9052_bat_read_capacity+0x44b>	2cb3210: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
044b  2cb3214:	44 89 f0             	mov    %r14d,%eax
044e  2cb3217:	99                   	cltd
044f  2cb3218:	f7 fb                	idiv   %ebx
0451  2cb321a:	41 0f af c7          	imul   %r15d,%eax
0455  2cb321e:	48 98                	cltq
0457  2cb3220:	48 69 d8 d3 4d 62 10 	imul   $0x10624dd3,%rax,%rbx
045e  2cb3227:	48 89 d8             	mov    %rbx,%rax
0461  2cb322a:	48 c1 fb 26          	sar    $0x26,%rbx
0465  2cb322e:	48 c1 e8 3f          	shr    $0x3f,%rax
0469  2cb3232:	01 c3                	add    %eax,%ebx
046b  2cb3234:	44 01 e3             	add    %r12d,%ebx
046e  2cb3237:	4c 8b 65 c8          	mov    -0x38(%rbp),%r12
0472  2cb323b:	4c 89 e0             	mov    %r12,%rax
0475  2cb323e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
047f  2cb3248:	48 c1 e8 03          	shr    $0x3,%rax
0483  2cb324c:	8a 04 08             	mov    (%rax,%rcx,1),%al
0486  2cb324f:	84 c0                	test   %al,%al
0488  2cb3251:	75 3e                	jne    2cb3291 <da9052_bat_read_capacity+0x4c8>
048a  2cb3253:	45 31 f6             	xor    %r14d,%r14d
048d  2cb3256:	41 89 1c 24          	mov    %ebx,(%r12)
0491  2cb325a:	44 89 f0             	mov    %r14d,%eax
0494  2cb325d:	48 8d 64 24 30       	lea    0x30(%rsp),%rsp
0499  2cb3262:	5b                   	pop    %rbx
049a  2cb3263:	41 5c                	pop    %r12
049c  2cb3265:	41 5d                	pop    %r13
049e  2cb3267:	41 5e                	pop    %r14
04a0  2cb3269:	41 5f                	pop    %r15
04a2  2cb326b:	5d                   	pop    %rbp
04a3  2cb326c:	c3                   	ret
04a4  2cb326d:	44 89 e9             	mov    %r13d,%ecx
04a7  2cb3270:	80 e1 07             	and    $0x7,%cl
04aa  2cb3273:	80 c1 03             	add    $0x3,%cl
04ad  2cb3276:	38 c1                	cmp    %al,%cl
04af  2cb3278:	0f 8c 89 fd ff ff    	jl     2cb3007 <da9052_bat_read_capacity+0x23e>
04b5  2cb327e:	4c 89 ef             	mov    %r13,%rdi
04b8  2cb3281:	49 89 d7             	mov    %rdx,%r15
04bb  2cb3284:	e8 00 00 00 00       	call   2cb3289 <da9052_bat_read_capacity+0x4c0>	2cb3285: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
04c0  2cb3289:	4c 89 fa             	mov    %r15,%rdx
04c3  2cb328c:	e9 76 fd ff ff       	jmp    2cb3007 <da9052_bat_read_capacity+0x23e>
04c8  2cb3291:	44 89 e1             	mov    %r12d,%ecx
04cb  2cb3294:	80 e1 07             	and    $0x7,%cl
04ce  2cb3297:	80 c1 03             	add    $0x3,%cl
04d1  2cb329a:	38 c1                	cmp    %al,%cl
04d3  2cb329c:	7c b5                	jl     2cb3253 <da9052_bat_read_capacity+0x48a>
04d5  2cb329e:	4c 89 e7             	mov    %r12,%rdi
04d8  2cb32a1:	e8 00 00 00 00       	call   2cb32a6 <da9052_bat_read_capacity+0x4dd>	2cb32a2: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
04dd  2cb32a6:	eb ab                	jmp    2cb3253 <da9052_bat_read_capacity+0x48a>
04df  2cb32a8:	44 89 f9             	mov    %r15d,%ecx
04e2  2cb32ab:	80 e1 07             	and    $0x7,%cl
04e5  2cb32ae:	80 c1 03             	add    $0x3,%cl
04e8  2cb32b1:	38 c1                	cmp    %al,%cl
04ea  2cb32b3:	0f 8c 7e fd ff ff    	jl     2cb3037 <da9052_bat_read_capacity+0x26e>
04f0  2cb32b9:	4c 89 ff             	mov    %r15,%rdi
04f3  2cb32bc:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
04f7  2cb32c0:	49 89 d5             	mov    %rdx,%r13
04fa  2cb32c3:	e8 00 00 00 00       	call   2cb32c8 <da9052_bat_read_capacity+0x4ff>	2cb32c4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
04ff  2cb32c8:	4c 89 ea             	mov    %r13,%rdx
0502  2cb32cb:	4c 8b 6d b8          	mov    -0x48(%rbp),%r13
0506  2cb32cf:	e9 63 fd ff ff       	jmp    2cb3037 <da9052_bat_read_capacity+0x26e>
050b  2cb32d4:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
050f  2cb32d8:	4a 8d bc 21 00 00 00 00 	lea    0x0(%rcx,%r12,1),%rdi	2cb32dc: R_X86_64_32S	.rodata+0xd0acc4
0517  2cb32e0:	89 f9                	mov    %edi,%ecx
0519  2cb32e2:	80 e1 07             	and    $0x7,%cl
051c  2cb32e5:	80 c1 03             	add    $0x3,%cl
051f  2cb32e8:	38 c1                	cmp    %al,%cl
0521  2cb32ea:	0f 8c d2 fe ff ff    	jl     2cb31c2 <da9052_bat_read_capacity+0x3f9>
0527  2cb32f0:	41 89 d6             	mov    %edx,%r14d
052a  2cb32f3:	44 89 45 d4          	mov    %r8d,-0x2c(%rbp)
052e  2cb32f7:	e8 00 00 00 00       	call   2cb32fc <da9052_bat_read_capacity+0x533>	2cb32f8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0533  2cb32fc:	44 8b 45 d4          	mov    -0x2c(%rbp),%r8d
0537  2cb3300:	44 89 f2             	mov    %r14d,%edx
053a  2cb3303:	e9 ba fe ff ff       	jmp    2cb31c2 <da9052_bat_read_capacity+0x3f9>
053f  2cb3308:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
0543  2cb330c:	4a 8d bc 21 00 00 00 00 	lea    0x0(%rcx,%r12,1),%rdi	2cb3310: R_X86_64_32S	.rodata+0xd0accc
054b  2cb3314:	89 f9                	mov    %edi,%ecx
054d  2cb3316:	80 e1 07             	and    $0x7,%cl
0550  2cb3319:	80 c1 03             	add    $0x3,%cl
0553  2cb331c:	38 c1                	cmp    %al,%cl
0555  2cb331e:	0f 8c b7 fe ff ff    	jl     2cb31db <da9052_bat_read_capacity+0x412>
055b  2cb3324:	41 89 d5             	mov    %edx,%r13d
055e  2cb3327:	44 89 45 d4          	mov    %r8d,-0x2c(%rbp)
0562  2cb332b:	e8 00 00 00 00       	call   2cb3330 <da9052_bat_read_capacity+0x567>	2cb332c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0567  2cb3330:	44 8b 45 d4          	mov    -0x2c(%rbp),%r8d
056b  2cb3334:	44 89 ea             	mov    %r13d,%edx
056e  2cb3337:	e9 9f fe ff ff       	jmp    2cb31db <da9052_bat_read_capacity+0x412>
0573  2cb333c:	e8 00 00 00 00       	call   2cb3341 <da9052_bat_read_capacity+0x578>	2cb333d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0578  2cb3341:	44 89 f6             	mov    %r14d,%esi
057b  2cb3344:	89 da                	mov    %ebx,%edx
057d  2cb3346:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2cb3349: R_X86_64_32S	.data+0xe90dc0
0584  2cb334d:	e8 00 00 00 00       	call   2cb3352 <da9052_bat_read_capacity+0x589>	2cb334e: R_X86_64_PLT32	__ubsan_handle_divrem_overflow-0x4
0589  2cb3352:	e9 bd fe ff ff       	jmp    2cb3214 <da9052_bat_read_capacity+0x44b>
058e  2cb3357:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
