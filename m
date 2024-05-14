Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ED8B653
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715658680; cv=none; b=cxCwCYik6cPZENYNx9eRm/Q1GYDfXugFk0XkVybmN/t40oJqvBzaM1rKed52RYpA61OjgchdbWEJSA5xwSs8KB36QOO5vbAcBK35mctWlecCWB1yZejAdD0la5zDryq+HGWbTRHvxeJWjHccHbXmv/RBGIiB2ddYqrUySz0HzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715658680; c=relaxed/simple;
	bh=158G0kMQwznqRORSEOTLoCO4kbnJemZ/X63+Wp6uN1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/iBTb3lh4PLVY/u/EzT3ZXBP6owHckwiiD2hm+EM411IwR/x/sdNiLlc4a/+EW1FJ1ps0x5g21cBvvbQZi50imSI9gaIqLqW7/AIjWUlFVPUkMjXDJ3agsJLYgAXMZk9WrCCCmh4+wwv82TOToKpvh/zagLtT88fxbpojGUFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyxHrIuz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyxHrIuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715658678; x=1747194678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=158G0kMQwznqRORSEOTLoCO4kbnJemZ/X63+Wp6uN1Y=;
  b=KyxHrIuztzoSTq4SC2+jWl+KaV0M74aIRhz7RKAY+RerQjZMGTMDCZQe
   dH/rGoGuI5ZtP8sEjn1g5Ry43LZO6VidTO2gANZMYyHmNh3BcpmwmksAB
   2OC5iDsRyxtx0GbwDG1fS+IPlZ0fHj80RPyuofNK2kMvCPUV3pL2fCzUa
   vunHH6PpvbIBgYvlXpJ9GDv66znVPKTtfi2H/zMe7GwDeQ6nt6njdYB2g
   pmWxNrfo1VKGRfw5OnN9emG8zTSQxB8yJcFerxKyEuOIZLMHn+zfa9/DM
   0HZ6ZSkcIfNFHZXF8QYSy3SUnOnEh1lI95QbZCarT7eJryHBq1oawC0Fj
   Q==;
X-CSE-ConnectionGUID: Srgc+sgiQfuxxecsB2s2zQ==
X-CSE-MsgGUID: SLhksyFOQdWYCugnzJST0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11509377"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11509377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 20:51:17 -0700
X-CSE-ConnectionGUID: 7+1Af7QZS/6M7enR6BnF2w==
X-CSE-MsgGUID: ecfWlnAEQiWuJkZanuqsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30382448"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 May 2024 20:51:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6jC2-000B1r-1e;
	Tue, 14 May 2024 03:51:10 +0000
Date: Tue, 14 May 2024 11:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6278/6601] arch/x86/crypto/sm4-zhaoxin-gmi.o:
 warning: objtool: ecb_encrypt+0x162: return with modified stack frame
Message-ID: <202405141155.yGozpDMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   d81cb5001089632941c86a366d0988c251f4e857
commit: 07428127920a146709701a1cc907ba297b9f4141 [6278/6601] Add support for Zhaoxin GMI SM4 Block Cipher algorithm
config: x86_64-randconfig-102-20240514 (https://download.01.org/0day-ci/archive/20240514/202405141155.yGozpDMv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141155.yGozpDMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141155.yGozpDMv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/crypto/sm4-zhaoxin-gmi.c:164:5: warning: no previous prototype for function 'gmi_sm4_set_key' [-Wmissing-prototypes]
     164 | int gmi_sm4_set_key(struct crypto_skcipher  *tfm, const u8 *in_key,
         |     ^
   arch/x86/crypto/sm4-zhaoxin-gmi.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | int gmi_sm4_set_key(struct crypto_skcipher  *tfm, const u8 *in_key,
         | ^
         | static 
   arch/x86/crypto/sm4-zhaoxin-gmi.c:189:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     189 |         u8 *iv;
         |             ^
   arch/x86/crypto/sm4-zhaoxin-gmi.c:269:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     269 |         u8 *iv, *dst, *src;
         |             ^
   arch/x86/crypto/sm4-zhaoxin-gmi.c:350:6: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     350 |         u8 *iv = NULL, *dst, *src;
         |             ^
   4 warnings generated.
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: ecb_encrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: ecb_decrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: cbc_encrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: cbc_decrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: ofb_encrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: ofb_decrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: cfb_encrypt+0x162: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: cfb_decrypt+0x162: return with modified stack frame
   arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: sm4_cipher_ctr+0x4a5: stack state mismatch: cfa1=5+16 cfa2=4+8
   arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: sm4_ctr_zxc+0x435: stack state mismatch: cfa1=5+16 cfa2=4+8
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: sm4_cfb_zxc+0x403: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: sm4_ofb_zxc+0x255: return with modified stack frame


objdump-func vmlinux.o ecb_encrypt:
0000 0000000000129c10 <ecb_encrypt>:
0000   129c10:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	129c11: R_X86_64_NONE	__fentry__-0x4
0005   129c15:	55                   	push   %rbp
0006   129c16:	48 89 e5             	mov    %rsp,%rbp
0009   129c19:	41 57                	push   %r15
000b   129c1b:	41 56                	push   %r14
000d   129c1d:	41 55                	push   %r13
000f   129c1f:	41 54                	push   %r12
0011   129c21:	53                   	push   %rbx
0012   129c22:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   129c26:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
001d   129c2d:	49 89 ff             	mov    %rdi,%r15
0020   129c30:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
002a   129c3a:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
002f   129c3f:	48 c7 44 24 20 b3 8a b5 41 	movq   $0x41b58ab3,0x20(%rsp)
0038   129c48:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)	129c4d: R_X86_64_32S	.rodata.str1.1+0xd0837
0041   129c51:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	129c56: R_X86_64_32S	.text+0x129c10
004a   129c5a:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
004f   129c5f:	48 c1 e9 03          	shr    $0x3,%rcx
0053   129c63:	42 c7 04 31 f1 f1 f1 f1 	movl   $0xf1f1f1f1,(%rcx,%r14,1)
005b   129c6b:	48 b8 f3 f3 f3 f3 f3 f3 f3 f3 	movabs $0xf3f3f3f3f3f3f3f3,%rax
0065   129c75:	4a 89 44 31 17       	mov    %rax,0x17(%rcx,%r14,1)
006a   129c7a:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
006f   129c7f:	42 c6 44 31 1f f3    	movb   $0xf3,0x1f(%rcx,%r14,1)
0075   129c85:	e8 00 00 00 00       	call   129c8a <ecb_encrypt+0x7a>	129c86: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
007a   129c8a:	49 8d 7f 40          	lea    0x40(%r15),%rdi
007e   129c8e:	48 89 f8             	mov    %rdi,%rax
0081   129c91:	48 c1 e8 03          	shr    $0x3,%rax
0085   129c95:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
008a   129c9a:	74 05                	je     129ca1 <ecb_encrypt+0x91>
008c   129c9c:	e8 00 00 00 00       	call   129ca1 <ecb_encrypt+0x91>	129c9d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0091   129ca1:	4d 8b 77 40          	mov    0x40(%r15),%r14
0095   129ca5:	ba 98 00 00 00       	mov    $0x98,%edx
009a   129caa:	48 89 df             	mov    %rbx,%rdi
009d   129cad:	31 f6                	xor    %esi,%esi
009f   129caf:	e8 00 00 00 00       	call   129cb4 <ecb_encrypt+0xa4>	129cb0: R_X86_64_PLT32	__asan_memset-0x4
00a4   129cb4:	48 89 df             	mov    %rbx,%rdi
00a7   129cb7:	4c 89 fe             	mov    %r15,%rsi
00aa   129cba:	31 d2                	xor    %edx,%edx
00ac   129cbc:	e8 00 00 00 00       	call   129cc1 <ecb_encrypt+0xb1>	129cbd: R_X86_64_PLT32	skcipher_walk_virt-0x4
00b1   129cc1:	41 89 c4             	mov    %eax,%r12d
00b4   129cc4:	44 8b 7c 24 70       	mov    0x70(%rsp),%r15d
00b9   129cc9:	31 ff                	xor    %edi,%edi
00bb   129ccb:	44 89 fe             	mov    %r15d,%esi
00be   129cce:	e8 00 00 00 00       	call   129cd3 <ecb_encrypt+0xc3>	129ccf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00c3   129cd3:	45 85 ff             	test   %r15d,%r15d
00c6   129cd6:	0f 84 c9 00 00 00    	je     129da5 <ecb_encrypt+0x195>
00cc   129cdc:	49 83 c6 20          	add    $0x20,%r14
00d0   129ce0:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
00d5   129ce5:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
00da   129cea:	bf 2f 00 00 00       	mov    $0x2f,%edi
00df   129cef:	44 89 fe             	mov    %r15d,%esi
00e2   129cf2:	e8 00 00 00 00       	call   129cf7 <ecb_encrypt+0xe7>	129cf3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00e7   129cf7:	41 83 ff 2f          	cmp    $0x2f,%r15d
00eb   129cfb:	77 14                	ja     129d11 <ecb_encrypt+0x101>
00ed   129cfd:	e8 00 00 00 00       	call   129d02 <ecb_encrypt+0xf2>	129cfe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f2   129d02:	eb 34                	jmp    129d38 <ecb_encrypt+0x128>
00f4   129d04:	49 83 c5 30          	add    $0x30,%r13
00f8   129d08:	49 83 c4 30          	add    $0x30,%r12
00fc   129d0c:	e8 00 00 00 00       	call   129d11 <ecb_encrypt+0x101>	129d0d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0101   129d11:	41 83 c7 d0          	add    $0xffffffd0,%r15d
0105   129d15:	4c 89 f7             	mov    %r14,%rdi
0108   129d18:	4c 89 ee             	mov    %r13,%rsi
010b   129d1b:	4c 89 e2             	mov    %r12,%rdx
010e   129d1e:	31 c9                	xor    %ecx,%ecx
0110   129d20:	e8 00 00 00 00       	call   129d25 <ecb_encrypt+0x115>	129d21: R_X86_64_PLT32	__twofish_enc_blk_3way-0x4
0115   129d25:	41 83 ff 2f          	cmp    $0x2f,%r15d
0119   129d29:	77 d9                	ja     129d04 <ecb_encrypt+0xf4>
011b   129d2b:	e8 00 00 00 00       	call   129d30 <ecb_encrypt+0x120>	129d2c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0120   129d30:	49 83 c5 30          	add    $0x30,%r13
0124   129d34:	49 83 c4 30          	add    $0x30,%r12
0128   129d38:	bf 0f 00 00 00       	mov    $0xf,%edi
012d   129d3d:	44 89 fe             	mov    %r15d,%esi
0130   129d40:	e8 00 00 00 00       	call   129d45 <ecb_encrypt+0x135>	129d41: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0135   129d45:	41 83 ff 0f          	cmp    $0xf,%r15d
0139   129d49:	77 14                	ja     129d5f <ecb_encrypt+0x14f>
013b   129d4b:	e8 00 00 00 00       	call   129d50 <ecb_encrypt+0x140>	129d4c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0140   129d50:	eb 2a                	jmp    129d7c <ecb_encrypt+0x16c>
0142   129d52:	49 83 c5 10          	add    $0x10,%r13
0146   129d56:	49 83 c4 10          	add    $0x10,%r12
014a   129d5a:	e8 00 00 00 00       	call   129d5f <ecb_encrypt+0x14f>	129d5b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
014f   129d5f:	41 83 c7 f0          	add    $0xfffffff0,%r15d
0153   129d63:	4c 89 f7             	mov    %r14,%rdi
0156   129d66:	4c 89 ee             	mov    %r13,%rsi
0159   129d69:	4c 89 e2             	mov    %r12,%rdx
015c   129d6c:	e8 00 00 00 00       	call   129d71 <ecb_encrypt+0x161>	129d6d: R_X86_64_PLT32	twofish_enc_blk-0x4
0161   129d71:	41 83 ff 0f          	cmp    $0xf,%r15d
0165   129d75:	77 db                	ja     129d52 <ecb_encrypt+0x142>
0167   129d77:	e8 00 00 00 00       	call   129d7c <ecb_encrypt+0x16c>	129d78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
016c   129d7c:	48 89 df             	mov    %rbx,%rdi
016f   129d7f:	44 89 fe             	mov    %r15d,%esi
0172   129d82:	e8 00 00 00 00       	call   129d87 <ecb_encrypt+0x177>	129d83: R_X86_64_PLT32	skcipher_walk_done-0x4
0177   129d87:	44 8b 7c 24 70       	mov    0x70(%rsp),%r15d
017c   129d8c:	45 85 ff             	test   %r15d,%r15d
017f   129d8f:	74 0a                	je     129d9b <ecb_encrypt+0x18b>
0181   129d91:	e8 00 00 00 00       	call   129d96 <ecb_encrypt+0x186>	129d92: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0186   129d96:	e9 45 ff ff ff       	jmp    129ce0 <ecb_encrypt+0xd0>
018b   129d9b:	41 89 c4             	mov    %eax,%r12d
018e   129d9e:	e8 00 00 00 00       	call   129da3 <ecb_encrypt+0x193>	129d9f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0193   129da3:	eb 05                	jmp    129daa <ecb_encrypt+0x19a>
0195   129da5:	e8 00 00 00 00       	call   129daa <ecb_encrypt+0x19a>	129da6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
019a   129daa:	48 c7 44 24 20 0e 36 e0 45 	movq   $0x45e0360e,0x20(%rsp)
01a3   129db3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01ad   129dbd:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
01b2   129dc2:	c7 04 01 00 00 00 00 	movl   $0x0,(%rcx,%rax,1)
01b9   129dc9:	48 c7 44 01 17 00 00 00 00 	movq   $0x0,0x17(%rcx,%rax,1)
01c2   129dd2:	c6 44 01 1f 00       	movb   $0x0,0x1f(%rcx,%rax,1)
01c7   129dd7:	44 89 e0             	mov    %r12d,%eax
01ca   129dda:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
01ce   129dde:	5b                   	pop    %rbx
01cf   129ddf:	41 5c                	pop    %r12
01d1   129de1:	41 5d                	pop    %r13
01d3   129de3:	41 5e                	pop    %r14
01d5   129de5:	41 5f                	pop    %r15
01d7   129de7:	5d                   	pop    %rbp
01d8   129de8:	c3                   	ret
01d9   129de9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
0000 0000000000134200 <ecb_encrypt>:
0000   134200:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	134201: R_X86_64_NONE	__fentry__-0x4
0005   134205:	55                   	push   %rbp
0006   134206:	48 89 e5             	mov    %rsp,%rbp
0009   134209:	41 57                	push   %r15
000b   13420b:	41 56                	push   %r14
000d   13420d:	41 55                	push   %r13
000f   13420f:	41 54                	push   %r12
0011   134211:	53                   	push   %rbx
0012   134212:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   134216:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
001d   13421d:	49 89 ff             	mov    %rdi,%r15
0020   134220:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
002a   13422a:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
002f   13422f:	48 c7 44 24 20 b3 8a b5 41 	movq   $0x41b58ab3,0x20(%rsp)
0038   134238:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)	13423d: R_X86_64_32S	.rodata.str1.1+0xd0837
0041   134241:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	134246: R_X86_64_32S	.text+0x134200
004a   13424a:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
004f   13424f:	48 c1 e9 03          	shr    $0x3,%rcx
0053   134253:	c7 04 19 f1 f1 f1 f1 	movl   $0xf1f1f1f1,(%rcx,%rbx,1)
005a   13425a:	48 b8 f3 f3 f3 f3 f3 f3 f3 f3 	movabs $0xf3f3f3f3f3f3f3f3,%rax
0064   134264:	48 89 44 19 17       	mov    %rax,0x17(%rcx,%rbx,1)
0069   134269:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
006e   13426e:	c6 44 19 1f f3       	movb   $0xf3,0x1f(%rcx,%rbx,1)
0073   134273:	e8 00 00 00 00       	call   134278 <ecb_encrypt+0x78>	134274: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0078   134278:	49 8d 7f 40          	lea    0x40(%r15),%rdi
007c   13427c:	48 89 f8             	mov    %rdi,%rax
007f   13427f:	48 c1 e8 03          	shr    $0x3,%rax
0083   134283:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0087   134287:	74 05                	je     13428e <ecb_encrypt+0x8e>
0089   134289:	e8 00 00 00 00       	call   13428e <ecb_encrypt+0x8e>	13428a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
008e   13428e:	4d 8b 77 40          	mov    0x40(%r15),%r14
0092   134292:	ba 98 00 00 00       	mov    $0x98,%edx
0097   134297:	4c 89 ef             	mov    %r13,%rdi
009a   13429a:	31 f6                	xor    %esi,%esi
009c   13429c:	e8 00 00 00 00       	call   1342a1 <ecb_encrypt+0xa1>	13429d: R_X86_64_PLT32	__asan_memset-0x4
00a1   1342a1:	4c 89 ef             	mov    %r13,%rdi
00a4   1342a4:	4c 89 fe             	mov    %r15,%rsi
00a7   1342a7:	31 d2                	xor    %edx,%edx
00a9   1342a9:	e8 00 00 00 00       	call   1342ae <ecb_encrypt+0xae>	1342aa: R_X86_64_PLT32	skcipher_walk_virt-0x4
00ae   1342ae:	89 c3                	mov    %eax,%ebx
00b0   1342b0:	44 8b 64 24 70       	mov    0x70(%rsp),%r12d
00b5   1342b5:	31 ff                	xor    %edi,%edi
00b7   1342b7:	44 89 e6             	mov    %r12d,%esi
00ba   1342ba:	e8 00 00 00 00       	call   1342bf <ecb_encrypt+0xbf>	1342bb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00bf   1342bf:	45 85 e4             	test   %r12d,%r12d
00c2   1342c2:	0f 84 7d 01 00 00    	je     134445 <ecb_encrypt+0x245>
00c8   1342c8:	49 83 c6 20          	add    $0x20,%r14
00cc   1342cc:	4d 89 f7             	mov    %r14,%r15
00cf   1342cf:	4c 89 34 24          	mov    %r14,(%rsp)
00d3   1342d3:	bf 7f 00 00 00       	mov    $0x7f,%edi
00d8   1342d8:	44 89 e6             	mov    %r12d,%esi
00db   1342db:	e8 00 00 00 00       	call   1342e0 <ecb_encrypt+0xe0>	1342dc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00e0   1342e0:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
00e5   1342e5:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
00ea   1342ea:	41 83 fc 7f          	cmp    $0x7f,%r12d
00ee   1342ee:	76 4d                	jbe    13433d <ecb_encrypt+0x13d>
00f0   1342f0:	bf 02 00 00 00       	mov    $0x2,%edi
00f5   1342f5:	e8 00 00 00 00       	call   1342fa <ecb_encrypt+0xfa>	1342f6: R_X86_64_PLT32	kernel_fpu_begin_mask-0x4
00fa   1342fa:	4d 89 e5             	mov    %r12,%r13
00fd   1342fd:	41 83 c4 80          	add    $0xffffff80,%r12d
0101   134301:	4c 89 ff             	mov    %r15,%rdi
0104   134304:	48 89 de             	mov    %rbx,%rsi
0107   134307:	4c 89 f2             	mov    %r14,%rdx
010a   13430a:	e8 00 00 00 00       	call   13430f <ecb_encrypt+0x10f>	13430b: R_X86_64_PLT32	twofish_ecb_enc_8way-0x4
010f   13430f:	48 83 eb 80          	sub    $0xffffffffffffff80,%rbx
0113   134313:	49 83 ee 80          	sub    $0xffffffffffffff80,%r14
0117   134317:	41 81 fc 80 00 00 00 	cmp    $0x80,%r12d
011e   13431e:	72 0b                	jb     13432b <ecb_encrypt+0x12b>
0120   134320:	e8 00 00 00 00       	call   134325 <ecb_encrypt+0x125>	134321: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0125   134325:	41 83 c4 80          	add    $0xffffff80,%r12d
0129   134329:	eb d6                	jmp    134301 <ecb_encrypt+0x101>
012b   13432b:	41 83 fd 7f          	cmp    $0x7f,%r13d
012f   13432f:	76 13                	jbe    134344 <ecb_encrypt+0x144>
0131   134331:	e8 00 00 00 00       	call   134336 <ecb_encrypt+0x136>	134332: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0136   134336:	e8 00 00 00 00       	call   13433b <ecb_encrypt+0x13b>	134337: R_X86_64_PLT32	kernel_fpu_end-0x4
013b   13433b:	eb 0c                	jmp    134349 <ecb_encrypt+0x149>
013d   13433d:	e8 00 00 00 00       	call   134342 <ecb_encrypt+0x142>	13433e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0142   134342:	eb 0a                	jmp    13434e <ecb_encrypt+0x14e>
0144   134344:	e8 00 00 00 00       	call   134349 <ecb_encrypt+0x149>	134345: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0149   134349:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
014e   13434e:	bf 2f 00 00 00       	mov    $0x2f,%edi
0153   134353:	44 89 e6             	mov    %r12d,%esi
0156   134356:	e8 00 00 00 00       	call   13435b <ecb_encrypt+0x15b>	134357: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
015b   13435b:	41 83 fc 2f          	cmp    $0x2f,%r12d
015f   13435f:	76 73                	jbe    1343d4 <ecb_encrypt+0x1d4>
0161   134361:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
0166   134366:	41 8d 44 24 d0       	lea    -0x30(%r12),%eax
016b   13436b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0170   134370:	45 31 ff             	xor    %r15d,%r15d
0173   134373:	49 89 dd             	mov    %rbx,%r13
0176   134376:	4d 89 f4             	mov    %r14,%r12
0179   134379:	48 8b 3c 24          	mov    (%rsp),%rdi
017d   13437d:	4c 89 ee             	mov    %r13,%rsi
0180   134380:	4c 89 e2             	mov    %r12,%rdx
0183   134383:	31 c9                	xor    %ecx,%ecx
0185   134385:	e8 00 00 00 00       	call   13438a <ecb_encrypt+0x18a>	134386: R_X86_64_PLT32	__twofish_enc_blk_3way-0x4
018a   13438a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
018f   13438f:	44 01 f8             	add    %r15d,%eax
0192   134392:	83 f8 2f             	cmp    $0x2f,%eax
0195   134395:	76 13                	jbe    1343aa <ecb_encrypt+0x1aa>
0197   134397:	49 83 c5 30          	add    $0x30,%r13
019b   13439b:	49 83 c4 30          	add    $0x30,%r12
019f   13439f:	e8 00 00 00 00       	call   1343a4 <ecb_encrypt+0x1a4>	1343a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a4   1343a4:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
01a8   1343a8:	eb cf                	jmp    134379 <ecb_encrypt+0x179>
01aa   1343aa:	e8 00 00 00 00       	call   1343af <ecb_encrypt+0x1af>	1343ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01af   1343af:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
01b4   1343b4:	45 01 fc             	add    %r15d,%r12d
01b7   1343b7:	41 83 c4 d0          	add    $0xffffffd0,%r12d
01bb   1343bb:	4c 29 fb             	sub    %r15,%rbx
01be   1343be:	48 83 c3 30          	add    $0x30,%rbx
01c2   1343c2:	4d 29 fe             	sub    %r15,%r14
01c5   1343c5:	49 83 c6 30          	add    $0x30,%r14
01c9   1343c9:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
01ce   1343ce:	4c 8b 3c 24          	mov    (%rsp),%r15
01d2   1343d2:	eb 05                	jmp    1343d9 <ecb_encrypt+0x1d9>
01d4   1343d4:	e8 00 00 00 00       	call   1343d9 <ecb_encrypt+0x1d9>	1343d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01d9   1343d9:	bf 0f 00 00 00       	mov    $0xf,%edi
01de   1343de:	44 89 e6             	mov    %r12d,%esi
01e1   1343e1:	e8 00 00 00 00       	call   1343e6 <ecb_encrypt+0x1e6>	1343e2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
01e6   1343e6:	41 83 fc 0f          	cmp    $0xf,%r12d
01ea   1343ea:	77 14                	ja     134400 <ecb_encrypt+0x200>
01ec   1343ec:	e8 00 00 00 00       	call   1343f1 <ecb_encrypt+0x1f1>	1343ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01f1   1343f1:	eb 2a                	jmp    13441d <ecb_encrypt+0x21d>
01f3   1343f3:	48 83 c3 10          	add    $0x10,%rbx
01f7   1343f7:	49 83 c6 10          	add    $0x10,%r14
01fb   1343fb:	e8 00 00 00 00       	call   134400 <ecb_encrypt+0x200>	1343fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0200   134400:	41 83 c4 f0          	add    $0xfffffff0,%r12d
0204   134404:	4c 89 ff             	mov    %r15,%rdi
0207   134407:	48 89 de             	mov    %rbx,%rsi
020a   13440a:	4c 89 f2             	mov    %r14,%rdx
020d   13440d:	e8 00 00 00 00       	call   134412 <ecb_encrypt+0x212>	13440e: R_X86_64_PLT32	twofish_enc_blk-0x4
0212   134412:	41 83 fc 0f          	cmp    $0xf,%r12d
0216   134416:	77 db                	ja     1343f3 <ecb_encrypt+0x1f3>
0218   134418:	e8 00 00 00 00       	call   13441d <ecb_encrypt+0x21d>	134419: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
021d   13441d:	4c 89 ef             	mov    %r13,%rdi
0220   134420:	44 89 e6             	mov    %r12d,%esi
0223   134423:	e8 00 00 00 00       	call   134428 <ecb_encrypt+0x228>	134424: R_X86_64_PLT32	skcipher_walk_done-0x4
0228   134428:	44 8b 64 24 70       	mov    0x70(%rsp),%r12d
022d   13442d:	45 85 e4             	test   %r12d,%r12d
0230   134430:	74 0a                	je     13443c <ecb_encrypt+0x23c>
0232   134432:	e8 00 00 00 00       	call   134437 <ecb_encrypt+0x237>	134433: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0237   134437:	e9 97 fe ff ff       	jmp    1342d3 <ecb_encrypt+0xd3>
023c   13443c:	89 c3                	mov    %eax,%ebx
023e   13443e:	e8 00 00 00 00       	call   134443 <ecb_encrypt+0x243>	13443f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0243   134443:	eb 05                	jmp    13444a <ecb_encrypt+0x24a>
0245   134445:	e8 00 00 00 00       	call   13444a <ecb_encrypt+0x24a>	134446: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
024a   13444a:	48 c7 44 24 20 0e 36 e0 45 	movq   $0x45e0360e,0x20(%rsp)
0253   134453:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
025d   13445d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0262   134462:	c7 04 01 00 00 00 00 	movl   $0x0,(%rcx,%rax,1)
0269   134469:	48 c7 44 01 17 00 00 00 00 	movq   $0x0,0x17(%rcx,%rax,1)
0272   134472:	c6 44 01 1f 00       	movb   $0x0,0x1f(%rcx,%rax,1)
0277   134477:	89 d8                	mov    %ebx,%eax
0279   134479:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
027d   13447d:	5b                   	pop    %rbx
027e   13447e:	41 5c                	pop    %r12
0280   134480:	41 5d                	pop    %r13
0282   134482:	41 5e                	pop    %r14
0284   134484:	41 5f                	pop    %r15
0286   134486:	5d                   	pop    %rbp
0287   134487:	c3                   	ret
0288   134488:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)
0000 000000000013f120 <ecb_encrypt>:
0000   13f120:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	13f121: R_X86_64_NONE	__fentry__-0x4
0005   13f125:	55                   	push   %rbp
0006   13f126:	48 89 e5             	mov    %rsp,%rbp
0009   13f129:	41 57                	push   %r15
000b   13f12b:	41 56                	push   %r14
000d   13f12d:	41 55                	push   %r13
000f   13f12f:	41 54                	push   %r12
0011   13f131:	53                   	push   %rbx
0012   13f132:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   13f136:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
001d   13f13d:	49 89 ff             	mov    %rdi,%r15
0020   13f140:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
002a   13f14a:	48 c7 44 24 20 b3 8a b5 41 	movq   $0x41b58ab3,0x20(%rsp)
0033   13f153:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)	13f158: R_X86_64_32S	.rodata.str1.1+0xd0837
003c   13f15c:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	13f161: R_X86_64_32S	.text+0x13f120
0045   13f165:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
004a   13f16a:	48 c1 e9 03          	shr    $0x3,%rcx
004e   13f16e:	c7 04 19 f1 f1 f1 f1 	movl   $0xf1f1f1f1,(%rcx,%rbx,1)
0055   13f175:	48 b8 f3 f3 f3 f3 f3 f3 f3 f3 	movabs $0xf3f3f3f3f3f3f3f3,%rax
005f   13f17f:	48 89 44 19 17       	mov    %rax,0x17(%rcx,%rbx,1)
0064   13f184:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0069   13f189:	c6 44 19 1f f3       	movb   $0xf3,0x1f(%rcx,%rbx,1)
006e   13f18e:	e8 00 00 00 00       	call   13f193 <ecb_encrypt+0x73>	13f18f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0073   13f193:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0077   13f197:	48 89 f8             	mov    %rdi,%rax
007a   13f19a:	48 c1 e8 03          	shr    $0x3,%rax
007e   13f19e:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0082   13f1a2:	74 05                	je     13f1a9 <ecb_encrypt+0x89>
0084   13f1a4:	e8 00 00 00 00       	call   13f1a9 <ecb_encrypt+0x89>	13f1a5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0089   13f1a9:	4d 8b 77 40          	mov    0x40(%r15),%r14
008d   13f1ad:	ba 98 00 00 00       	mov    $0x98,%edx
0092   13f1b2:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
0097   13f1b7:	48 89 df             	mov    %rbx,%rdi
009a   13f1ba:	31 f6                	xor    %esi,%esi
009c   13f1bc:	e8 00 00 00 00       	call   13f1c1 <ecb_encrypt+0xa1>	13f1bd: R_X86_64_PLT32	__asan_memset-0x4
00a1   13f1c1:	48 89 df             	mov    %rbx,%rdi
00a4   13f1c4:	4c 89 fe             	mov    %r15,%rsi
00a7   13f1c7:	31 d2                	xor    %edx,%edx
00a9   13f1c9:	e8 00 00 00 00       	call   13f1ce <ecb_encrypt+0xae>	13f1ca: R_X86_64_PLT32	skcipher_walk_virt-0x4
00ae   13f1ce:	41 89 c4             	mov    %eax,%r12d
00b1   13f1d1:	44 8b 7c 24 70       	mov    0x70(%rsp),%r15d
00b6   13f1d6:	31 ff                	xor    %edi,%edi
00b8   13f1d8:	44 89 fe             	mov    %r15d,%esi
00bb   13f1db:	e8 00 00 00 00       	call   13f1e0 <ecb_encrypt+0xc0>	13f1dc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00c0   13f1e0:	45 85 ff             	test   %r15d,%r15d
00c3   13f1e3:	0f 84 e9 00 00 00    	je     13f2d2 <ecb_encrypt+0x1b2>
00c9   13f1e9:	49 83 c6 20          	add    $0x20,%r14
00cd   13f1ed:	bf 7f 00 00 00       	mov    $0x7f,%edi
00d2   13f1f2:	44 89 fe             	mov    %r15d,%esi
00d5   13f1f5:	e8 00 00 00 00       	call   13f1fa <ecb_encrypt+0xda>	13f1f6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00da   13f1fa:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
00df   13f1ff:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
00e4   13f204:	41 83 ff 7f          	cmp    $0x7f,%r15d
00e8   13f208:	76 4a                	jbe    13f254 <ecb_encrypt+0x134>
00ea   13f20a:	bf 02 00 00 00       	mov    $0x2,%edi
00ef   13f20f:	e8 00 00 00 00       	call   13f214 <ecb_encrypt+0xf4>	13f210: R_X86_64_PLT32	kernel_fpu_begin_mask-0x4
00f4   13f214:	41 8d 5f 80          	lea    -0x80(%r15),%ebx
00f8   13f218:	4c 89 f7             	mov    %r14,%rdi
00fb   13f21b:	4c 89 ee             	mov    %r13,%rsi
00fe   13f21e:	4c 89 e2             	mov    %r12,%rdx
0101   13f221:	31 c9                	xor    %ecx,%ecx
0103   13f223:	e8 00 00 00 00       	call   13f228 <ecb_encrypt+0x108>	13f224: R_X86_64_PLT32	__serpent_enc_blk_8way-0x4
0108   13f228:	49 83 ed 80          	sub    $0xffffffffffffff80,%r13
010c   13f22c:	49 83 ec 80          	sub    $0xffffffffffffff80,%r12
0110   13f230:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
0116   13f236:	72 0a                	jb     13f242 <ecb_encrypt+0x122>
0118   13f238:	e8 00 00 00 00       	call   13f23d <ecb_encrypt+0x11d>	13f239: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011d   13f23d:	83 c3 80             	add    $0xffffff80,%ebx
0120   13f240:	eb d6                	jmp    13f218 <ecb_encrypt+0xf8>
0122   13f242:	41 83 ff 7f          	cmp    $0x7f,%r15d
0126   13f246:	76 13                	jbe    13f25b <ecb_encrypt+0x13b>
0128   13f248:	e8 00 00 00 00       	call   13f24d <ecb_encrypt+0x12d>	13f249: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
012d   13f24d:	e8 00 00 00 00       	call   13f252 <ecb_encrypt+0x132>	13f24e: R_X86_64_PLT32	kernel_fpu_end-0x4
0132   13f252:	eb 0c                	jmp    13f260 <ecb_encrypt+0x140>
0134   13f254:	e8 00 00 00 00       	call   13f259 <ecb_encrypt+0x139>	13f255: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0139   13f259:	eb 08                	jmp    13f263 <ecb_encrypt+0x143>
013b   13f25b:	e8 00 00 00 00       	call   13f260 <ecb_encrypt+0x140>	13f25c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0140   13f260:	41 89 df             	mov    %ebx,%r15d
0143   13f263:	bf 0f 00 00 00       	mov    $0xf,%edi
0148   13f268:	44 89 fe             	mov    %r15d,%esi
014b   13f26b:	e8 00 00 00 00       	call   13f270 <ecb_encrypt+0x150>	13f26c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0150   13f270:	41 83 ff 0f          	cmp    $0xf,%r15d
0154   13f274:	77 14                	ja     13f28a <ecb_encrypt+0x16a>
0156   13f276:	e8 00 00 00 00       	call   13f27b <ecb_encrypt+0x15b>	13f277: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
015b   13f27b:	eb 2a                	jmp    13f2a7 <ecb_encrypt+0x187>
015d   13f27d:	49 83 c5 10          	add    $0x10,%r13
0161   13f281:	49 83 c4 10          	add    $0x10,%r12
0165   13f285:	e8 00 00 00 00       	call   13f28a <ecb_encrypt+0x16a>	13f286: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
016a   13f28a:	41 83 c7 f0          	add    $0xfffffff0,%r15d
016e   13f28e:	4c 89 f7             	mov    %r14,%rdi
0171   13f291:	4c 89 ee             	mov    %r13,%rsi
0174   13f294:	4c 89 e2             	mov    %r12,%rdx
0177   13f297:	e8 00 00 00 00       	call   13f29c <ecb_encrypt+0x17c>	13f298: R_X86_64_PLT32	__serpent_encrypt-0x4
017c   13f29c:	41 83 ff 0f          	cmp    $0xf,%r15d
0180   13f2a0:	77 db                	ja     13f27d <ecb_encrypt+0x15d>
0182   13f2a2:	e8 00 00 00 00       	call   13f2a7 <ecb_encrypt+0x187>	13f2a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0187   13f2a7:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
018c   13f2ac:	44 89 fe             	mov    %r15d,%esi
018f   13f2af:	e8 00 00 00 00       	call   13f2b4 <ecb_encrypt+0x194>	13f2b0: R_X86_64_PLT32	skcipher_walk_done-0x4
0194   13f2b4:	44 8b 7c 24 70       	mov    0x70(%rsp),%r15d
0199   13f2b9:	45 85 ff             	test   %r15d,%r15d
019c   13f2bc:	74 0a                	je     13f2c8 <ecb_encrypt+0x1a8>
019e   13f2be:	e8 00 00 00 00       	call   13f2c3 <ecb_encrypt+0x1a3>	13f2bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a3   13f2c3:	e9 25 ff ff ff       	jmp    13f1ed <ecb_encrypt+0xcd>
01a8   13f2c8:	41 89 c4             	mov    %eax,%r12d
01ab   13f2cb:	e8 00 00 00 00       	call   13f2d0 <ecb_encrypt+0x1b0>	13f2cc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b0   13f2d0:	eb 05                	jmp    13f2d7 <ecb_encrypt+0x1b7>
01b2   13f2d2:	e8 00 00 00 00       	call   13f2d7 <ecb_encrypt+0x1b7>	13f2d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b7   13f2d7:	48 c7 44 24 20 0e 36 e0 45 	movq   $0x45e0360e,0x20(%rsp)
01c0   13f2e0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01ca   13f2ea:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
01cf   13f2ef:	c7 04 01 00 00 00 00 	movl   $0x0,(%rcx,%rax,1)
01d6   13f2f6:	48 c7 44 01 17 00 00 00 00 	movq   $0x0,0x17(%rcx,%rax,1)
01df   13f2ff:	c6 44 01 1f 00       	movb   $0x0,0x1f(%rcx,%rax,1)
01e4   13f304:	44 89 e0             	mov    %r12d,%eax
01e7   13f307:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
01eb   13f30b:	5b                   	pop    %rbx
01ec   13f30c:	41 5c                	pop    %r12
01ee   13f30e:	41 5d                	pop    %r13
01f0   13f310:	41 5e                	pop    %r14
01f2   13f312:	41 5f                	pop    %r15
01f4   13f314:	5d                   	pop    %rbp
01f5   13f315:	c3                   	ret
01f6   13f316:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0000 0000000000151640 <ecb_encrypt>:
0000   151640:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	151641: R_X86_64_NONE	__fentry__-0x4
0005   151645:	55                   	push   %rbp
0006   151646:	48 89 e5             	mov    %rsp,%rbp
0009   151649:	41 57                	push   %r15
000b   15164b:	41 56                	push   %r14
000d   15164d:	41 55                	push   %r13
000f   15164f:	41 54                	push   %r12
0011   151651:	53                   	push   %rbx
0012   151652:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   151656:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
001d   15165d:	49 89 ff             	mov    %rdi,%r15
0020   151660:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
002a   15166a:	48 c7 44 24 20 b3 8a b5 41 	movq   $0x41b58ab3,0x20(%rsp)
0033   151673:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)	151678: R_X86_64_32S	.rodata.str1.1+0xd0837
003c   15167c:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	151681: R_X86_64_32S	.text+0x151640
0045   151685:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
004a   15168a:	48 c1 e9 03          	shr    $0x3,%rcx
004e   15168e:	c7 04 19 f1 f1 f1 f1 	movl   $0xf1f1f1f1,(%rcx,%rbx,1)
0055   151695:	48 b8 f3 f3 f3 f3 f3 f3 f3 f3 	movabs $0xf3f3f3f3f3f3f3f3,%rax
005f   15169f:	48 89 44 19 17       	mov    %rax,0x17(%rcx,%rbx,1)
0064   1516a4:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0069   1516a9:	c6 44 19 1f f3       	movb   $0xf3,0x1f(%rcx,%rbx,1)
006e   1516ae:	e8 00 00 00 00       	call   1516b3 <ecb_encrypt+0x73>	1516af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0073   1516b3:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0077   1516b7:	48 89 f8             	mov    %rdi,%rax
007a   1516ba:	48 c1 e8 03          	shr    $0x3,%rax
007e   1516be:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0082   1516c2:	74 05                	je     1516c9 <ecb_encrypt+0x89>
0084   1516c4:	e8 00 00 00 00       	call   1516c9 <ecb_encrypt+0x89>	1516c5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0089   1516c9:	4d 8b 77 40          	mov    0x40(%r15),%r14
008d   1516cd:	ba 98 00 00 00       	mov    $0x98,%edx
0092   1516d2:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
0097   1516d7:	48 89 df             	mov    %rbx,%rdi
009a   1516da:	31 f6                	xor    %esi,%esi
009c   1516dc:	e8 00 00 00 00       	call   1516e1 <ecb_encrypt+0xa1>	1516dd: R_X86_64_PLT32	__asan_memset-0x4
00a1   1516e1:	48 89 df             	mov    %rbx,%rdi
00a4   1516e4:	4c 89 fe             	mov    %r15,%rsi
00a7   1516e7:	31 d2                	xor    %edx,%edx
00a9   1516e9:	e8 00 00 00 00       	call   1516ee <ecb_encrypt+0xae>	1516ea: R_X86_64_PLT32	skcipher_walk_virt-0x4
00ae   1516ee:	41 89 c4             	mov    %eax,%r12d
00b1   1516f1:	44 8b 7c 24 70       	mov    0x70(%rsp),%r15d
00b6   1516f6:	31 ff                	xor    %edi,%edi
00b8   1516f8:	44 89 fe             	mov    %r15d,%esi
00bb   1516fb:	e8 00 00 00 00       	call   151700 <ecb_encrypt+0xc0>	1516fc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00c0   151700:	45 85 ff             	test   %r15d,%r15d
00c3   151703:	0f 84 e7 00 00 00    	je     1517f0 <ecb_encrypt+0x1b0>
00c9   151709:	49 83 c6 20          	add    $0x20,%r14
00cd   15170d:	bf 7f 00 00 00       	mov    $0x7f,%edi
00d2   151712:	44 89 fe             	mov    %r15d,%esi
00d5   151715:	e8 00 00 00 00       	call   15171a <ecb_encrypt+0xda>	151716: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00da   15171a:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
00df   15171f:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
00e4   151724:	41 83 ff 7f          	cmp    $0x7f,%r15d
00e8   151728:	76 48                	jbe    151772 <ecb_encrypt+0x132>
00ea   15172a:	bf 02 00 00 00       	mov    $0x2,%edi
00ef   15172f:	e8 00 00 00 00       	call   151734 <ecb_encrypt+0xf4>	151730: R_X86_64_PLT32	kernel_fpu_begin_mask-0x4
00f4   151734:	41 8d 5f 80          	lea    -0x80(%r15),%ebx
00f8   151738:	4c 89 f7             	mov    %r14,%rdi
00fb   15173b:	4c 89 ee             	mov    %r13,%rsi
00fe   15173e:	4c 89 e2             	mov    %r12,%rdx
0101   151741:	e8 00 00 00 00       	call   151746 <ecb_encrypt+0x106>	151742: R_X86_64_PLT32	cast6_ecb_enc_8way-0x4
0106   151746:	49 83 ed 80          	sub    $0xffffffffffffff80,%r13
010a   15174a:	49 83 ec 80          	sub    $0xffffffffffffff80,%r12
010e   15174e:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
0114   151754:	72 0a                	jb     151760 <ecb_encrypt+0x120>
0116   151756:	e8 00 00 00 00       	call   15175b <ecb_encrypt+0x11b>	151757: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011b   15175b:	83 c3 80             	add    $0xffffff80,%ebx
011e   15175e:	eb d8                	jmp    151738 <ecb_encrypt+0xf8>
0120   151760:	41 83 ff 7f          	cmp    $0x7f,%r15d
0124   151764:	76 13                	jbe    151779 <ecb_encrypt+0x139>
0126   151766:	e8 00 00 00 00       	call   15176b <ecb_encrypt+0x12b>	151767: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
012b   15176b:	e8 00 00 00 00       	call   151770 <ecb_encrypt+0x130>	15176c: R_X86_64_PLT32	kernel_fpu_end-0x4
0130   151770:	eb 0c                	jmp    15177e <ecb_encrypt+0x13e>
0132   151772:	e8 00 00 00 00       	call   151777 <ecb_encrypt+0x137>	151773: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0137   151777:	eb 08                	jmp    151781 <ecb_encrypt+0x141>
0139   151779:	e8 00 00 00 00       	call   15177e <ecb_encrypt+0x13e>	15177a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
013e   15177e:	41 89 df             	mov    %ebx,%r15d
0141   151781:	bf 0f 00 00 00       	mov    $0xf,%edi
0146   151786:	44 89 fe             	mov    %r15d,%esi
0149   151789:	e8 00 00 00 00       	call   15178e <ecb_encrypt+0x14e>	15178a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
014e   15178e:	41 83 ff 0f          	cmp    $0xf,%r15d
0152   151792:	77 14                	ja     1517a8 <ecb_encrypt+0x168>
0154   151794:	e8 00 00 00 00       	call   151799 <ecb_encrypt+0x159>	151795: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0159   151799:	eb 2a                	jmp    1517c5 <ecb_encrypt+0x185>
015b   15179b:	49 83 c5 10          	add    $0x10,%r13
015f   15179f:	49 83 c4 10          	add    $0x10,%r12
0163   1517a3:	e8 00 00 00 00       	call   1517a8 <ecb_encrypt+0x168>	1517a4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0168   1517a8:	41 83 c7 f0          	add    $0xfffffff0,%r15d
016c   1517ac:	4c 89 f7             	mov    %r14,%rdi
016f   1517af:	4c 89 ee             	mov    %r13,%rsi
0172   1517b2:	4c 89 e2             	mov    %r12,%rdx
0175   1517b5:	e8 00 00 00 00       	call   1517ba <ecb_encrypt+0x17a>	1517b6: R_X86_64_PLT32	__cast6_encrypt-0x4
017a   1517ba:	41 83 ff 0f          	cmp    $0xf,%r15d
017e   1517be:	77 db                	ja     15179b <ecb_encrypt+0x15b>
0180   1517c0:	e8 00 00 00 00       	call   1517c5 <ecb_encrypt+0x185>	1517c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0185   1517c5:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
018a   1517ca:	44 89 fe             	mov    %r15d,%esi
018d   1517cd:	e8 00 00 00 00       	call   1517d2 <ecb_encrypt+0x192>	1517ce: R_X86_64_PLT32	skcipher_walk_done-0x4
0192   1517d2:	44 8b 7c 24 70       	mov    0x70(%rsp),%r15d
0197   1517d7:	45 85 ff             	test   %r15d,%r15d
019a   1517da:	74 0a                	je     1517e6 <ecb_encrypt+0x1a6>
019c   1517dc:	e8 00 00 00 00       	call   1517e1 <ecb_encrypt+0x1a1>	1517dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a1   1517e1:	e9 27 ff ff ff       	jmp    15170d <ecb_encrypt+0xcd>
01a6   1517e6:	41 89 c4             	mov    %eax,%r12d
01a9   1517e9:	e8 00 00 00 00       	call   1517ee <ecb_encrypt+0x1ae>	1517ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ae   1517ee:	eb 05                	jmp    1517f5 <ecb_encrypt+0x1b5>
01b0   1517f0:	e8 00 00 00 00       	call   1517f5 <ecb_encrypt+0x1b5>	1517f1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b5   1517f5:	48 c7 44 24 20 0e 36 e0 45 	movq   $0x45e0360e,0x20(%rsp)
01be   1517fe:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01c8   151808:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
01cd   15180d:	c7 04 01 00 00 00 00 	movl   $0x0,(%rcx,%rax,1)
01d4   151814:	48 c7 44 01 17 00 00 00 00 	movq   $0x0,0x17(%rcx,%rax,1)
01dd   15181d:	c6 44 01 1f 00       	movb   $0x0,0x1f(%rcx,%rax,1)
01e2   151822:	44 89 e0             	mov    %r12d,%eax
01e5   151825:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
01e9   151829:	5b                   	pop    %rbx
01ea   15182a:	41 5c                	pop    %r12
01ec   15182c:	41 5d                	pop    %r13
01ee   15182e:	41 5e                	pop    %r14
01f0   151830:	41 5f                	pop    %r15
01f2   151832:	5d                   	pop    %rbp
01f3   151833:	c3                   	ret
01f4   151834:	66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 cs nopw 0x0(%rax,%rax,1)
0000 0000000000162da0 <ecb_encrypt>:
0000   162da0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	162da1: R_X86_64_NONE	__fentry__-0x4
0005   162da5:	55                   	push   %rbp
0006   162da6:	48 89 e5             	mov    %rsp,%rbp
0009   162da9:	41 57                	push   %r15
000b   162dab:	41 56                	push   %r14
000d   162dad:	41 55                	push   %r13
000f   162daf:	41 54                	push   %r12
0011   162db1:	53                   	push   %rbx
0012   162db2:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   162db6:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
001d   162dbd:	49 89 ff             	mov    %rdi,%r15
0020   162dc0:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
002a   162dca:	48 8d 5c 24 20       	lea    0x20(%rsp),%rbx
002f   162dcf:	48 c7 04 24 b3 8a b5 41 	movq   $0x41b58ab3,(%rsp)
0037   162dd7:	48 c7 44 24 08 00 00 00 00 	movq   $0x0,0x8(%rsp)	162ddc: R_X86_64_32S	.rodata.str1.1+0xd0837
0040   162de0:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	162de5: R_X86_64_32S	.text+0x162da0
0049   162de9:	49 89 e5             	mov    %rsp,%r13
004c   162dec:	49 c1 ed 03          	shr    $0x3,%r13
0050   162df0:	43 c7 44 35 00 f1 f1 f1 f1 	movl   $0xf1f1f1f1,0x0(%r13,%r14,1)
0059   162df9:	48 b8 f3 f3 f3 f3 f3 f3 f3 f3 	movabs $0xf3f3f3f3f3f3f3f3,%rax
0063   162e03:	4b 89 44 35 17       	mov    %rax,0x17(%r13,%r14,1)
0068   162e08:	43 c6 44 35 1f f3    	movb   $0xf3,0x1f(%r13,%r14,1)
006e   162e0e:	e8 00 00 00 00       	call   162e13 <ecb_encrypt+0x73>	162e0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0073   162e13:	49 8d 7f 40          	lea    0x40(%r15),%rdi
0077   162e17:	48 89 f8             	mov    %rdi,%rax
007a   162e1a:	48 c1 e8 03          	shr    $0x3,%rax
007e   162e1e:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0083   162e23:	74 05                	je     162e2a <ecb_encrypt+0x8a>
0085   162e25:	e8 00 00 00 00       	call   162e2a <ecb_encrypt+0x8a>	162e26: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
008a   162e2a:	4d 8b 77 40          	mov    0x40(%r15),%r14
008e   162e2e:	ba 98 00 00 00       	mov    $0x98,%edx
0093   162e33:	48 89 df             	mov    %rbx,%rdi
0096   162e36:	31 f6                	xor    %esi,%esi
0098   162e38:	e8 00 00 00 00       	call   162e3d <ecb_encrypt+0x9d>	162e39: R_X86_64_PLT32	__asan_memset-0x4
009d   162e3d:	48 89 df             	mov    %rbx,%rdi
00a0   162e40:	4c 89 fe             	mov    %r15,%rsi
00a3   162e43:	31 d2                	xor    %edx,%edx
00a5   162e45:	e8 00 00 00 00       	call   162e4a <ecb_encrypt+0xaa>	162e46: R_X86_64_PLT32	skcipher_walk_virt-0x4
00aa   162e4a:	41 89 c4             	mov    %eax,%r12d
00ad   162e4d:	44 8b 7c 24 50       	mov    0x50(%rsp),%r15d
00b2   162e52:	31 ff                	xor    %edi,%edi
00b4   162e54:	44 89 fe             	mov    %r15d,%esi
00b7   162e57:	e8 00 00 00 00       	call   162e5c <ecb_encrypt+0xbc>	162e58: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00bc   162e5c:	45 85 ff             	test   %r15d,%r15d
00bf   162e5f:	74 59                	je     162eba <ecb_encrypt+0x11a>
00c1   162e61:	49 83 c6 2f          	add    $0x2f,%r14
00c5   162e65:	49 83 e6 f0          	and    $0xfffffffffffffff0,%r14
00c9   162e69:	bf 02 00 00 00       	mov    $0x2,%edi
00ce   162e6e:	e8 00 00 00 00       	call   162e73 <ecb_encrypt+0xd3>	162e6f: R_X86_64_PLT32	kernel_fpu_begin_mask-0x4
00d3   162e73:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
00d8   162e78:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
00dd   162e7d:	44 89 f9             	mov    %r15d,%ecx
00e0   162e80:	83 e1 f0             	and    $0xfffffff0,%ecx
00e3   162e83:	4c 89 f7             	mov    %r14,%rdi
00e6   162e86:	e8 00 00 00 00       	call   162e8b <ecb_encrypt+0xeb>	162e87: R_X86_64_PLT32	aesni_ecb_enc-0x4
00eb   162e8b:	e8 00 00 00 00       	call   162e90 <ecb_encrypt+0xf0>	162e8c: R_X86_64_PLT32	kernel_fpu_end-0x4
00f0   162e90:	41 83 e7 0f          	and    $0xf,%r15d
00f4   162e94:	48 89 df             	mov    %rbx,%rdi
00f7   162e97:	44 89 fe             	mov    %r15d,%esi
00fa   162e9a:	e8 00 00 00 00       	call   162e9f <ecb_encrypt+0xff>	162e9b: R_X86_64_PLT32	skcipher_walk_done-0x4
00ff   162e9f:	44 8b 7c 24 50       	mov    0x50(%rsp),%r15d
0104   162ea4:	45 85 ff             	test   %r15d,%r15d
0107   162ea7:	74 07                	je     162eb0 <ecb_encrypt+0x110>
0109   162ea9:	e8 00 00 00 00       	call   162eae <ecb_encrypt+0x10e>	162eaa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
010e   162eae:	eb b9                	jmp    162e69 <ecb_encrypt+0xc9>
0110   162eb0:	41 89 c4             	mov    %eax,%r12d
0113   162eb3:	e8 00 00 00 00       	call   162eb8 <ecb_encrypt+0x118>	162eb4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0118   162eb8:	eb 05                	jmp    162ebf <ecb_encrypt+0x11f>
011a   162eba:	e8 00 00 00 00       	call   162ebf <ecb_encrypt+0x11f>	162ebb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011f   162ebf:	48 c7 04 24 0e 36 e0 45 	movq   $0x45e0360e,(%rsp)
0127   162ec7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0131   162ed1:	41 c7 44 05 00 00 00 00 00 	movl   $0x0,0x0(%r13,%rax,1)
013a   162eda:	49 c7 44 05 17 00 00 00 00 	movq   $0x0,0x17(%r13,%rax,1)
0143   162ee3:	41 c6 44 05 1f 00    	movb   $0x0,0x1f(%r13,%rax,1)
0149   162ee9:	44 89 e0             	mov    %r12d,%eax
014c   162eec:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
0150   162ef0:	5b                   	pop    %rbx
0151   162ef1:	41 5c                	pop    %r12
0153   162ef3:	41 5d                	pop    %r13
0155   162ef5:	41 5e                	pop    %r14
0157   162ef7:	41 5f                	pop    %r15
0159   162ef9:	5d                   	pop    %rbp
015a   162efa:	c3                   	ret
015b   162efb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
