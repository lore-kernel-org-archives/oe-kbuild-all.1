Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCA2771D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 22:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690324357; x=1721860357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XakvSQPGxpVU/lj8l1po/DiI5kkBz4liRi7YzLJFR5o=;
  b=ZEQvX+BbbTOIsdoC4AhXuW6mCia4k9uGumt1wK+lz8ysW/7SsQGKFSOk
   C+BbgOoN1GtbP6I5RAdCr5lFFnbpVzM1/I4gttBhwb5r6g+MZz+eGMX6+
   1kT0fUzhm8luAHqI4kp0Ne3mN2bbyWRNULWKLtiHQmmaC8uwRK7HQMuCm
   JLfJTYDtaGmr+2aqqUmOYdRwgdiV4QQqbpbCPnUQIeBwOy+pPMmupLDW3
   sN4XxgAIJJRyvavaCES3g1HwPeKo/CQJwHeS7A6fw3v4BfsoZkYymbtEP
   1eie62KND+7U6LFT0NoSGOTtsRyv1CeJZ28UM2uIwZa/QriTPaBZZUesM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357865886"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="357865886"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 15:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1056943682"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="1056943682"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2023 15:32:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOQa2-0000Om-1Z;
	Tue, 25 Jul 2023 22:32:34 +0000
Date: Wed, 26 Jul 2023 06:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/4] vmlinux.o: warning: objtool:
 aesni_gcm_init_avx_gen2()+0x12: unsupported stack pointer realignment
Message-ID: <202307260622.TCdddWGZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   0f1298b513108857f083de27c14132caad1f1028
commit: feb89f3850e6b261347209b3b8329c32e8898229 [2/4] ANDROID: fix kernelci error in fs/fuse/dir.c
config: x86_64-buildonly-randconfig-r002-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260622.TCdddWGZ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260622.TCdddWGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260622.TCdddWGZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ftrace_caller()+0x7b: call without frame pointer save/setup
   vmlinux.o: warning: objtool: ftrace_regs_caller()+0xde: call without frame pointer save/setup
   vmlinux.o: warning: objtool: ftrace_graph_caller()+0x7c: call without frame pointer save/setup
>> vmlinux.o: warning: objtool: aesni_gcm_init_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_enc_update_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_dec_update_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_finalize_avx_gen2()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_init_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_enc_update_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_dec_update_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: aesni_gcm_finalize_avx_gen4()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: __x86_retpoline_rdi()+0x10: return with modified stack frame
   vmlinux.o: warning: objtool: __x86_retpoline_rdi()+0x0: stack state mismatch: cfa1=7+32 cfa2=7+8
   vmlinux.o: warning: objtool: __x86_retpoline_rdi()+0x0: stack state mismatch: cfa1=7+32 cfa2=-1+0


objdump-func vmlinux.o aesni_gcm_init_avx_gen2:
0000 000000000001e930 <aesni_gcm_init_avx_gen2>:
0000    1e930:	41 54                	push   %r12
0002    1e932:	41 55                	push   %r13
0004    1e934:	41 56                	push   %r14
0006    1e936:	41 57                	push   %r15
0008    1e938:	49 89 e6             	mov    %rsp,%r14
000b    1e93b:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
0012    1e942:	48 83 e4 c0          	and    $0xffffffffffffffc0,%rsp
0016    1e946:	4d 89 cb             	mov    %r9,%r11
0019    1e949:	4c 89 5e 10          	mov    %r11,0x10(%rsi)
001d    1e94d:	45 31 db             	xor    %r11d,%r11d
0020    1e950:	4c 89 5e 18          	mov    %r11,0x18(%rsi)
0024    1e954:	4c 89 5e 50          	mov    %r11,0x50(%rsi)
0028    1e958:	4c 89 5e 20          	mov    %r11,0x20(%rsi)
002c    1e95c:	48 89 d0             	mov    %rdx,%rax
002f    1e95f:	f3 0f 6f 00          	movdqu (%rax),%xmm0
0033    1e963:	f3 0f 7f 46 30       	movdqu %xmm0,0x30(%rsi)
0038    1e968:	c4 e2 79 00 05 00 00 00 00 	vpshufb 0x0(%rip),%xmm0,%xmm0        # 1e971 <aesni_gcm_init_avx_gen2+0x41>	1e96d: R_X86_64_PC32	SHUF_MASK-0x4
0041    1e971:	f3 0f 7f 46 40       	movdqu %xmm0,0x40(%rsi)
0046    1e976:	c5 fa 6f 31          	vmovdqu (%rcx),%xmm6
004a    1e97a:	c4 e2 49 00 35 00 00 00 00 	vpshufb 0x0(%rip),%xmm6,%xmm6        # 1e983 <aesni_gcm_init_avx_gen2+0x53>	1e97f: R_X86_64_PC32	SHUF_MASK-0x4
0053    1e983:	c5 f9 6f d6          	vmovdqa %xmm6,%xmm2
0057    1e987:	c5 c9 73 f6 01       	vpsllq $0x1,%xmm6,%xmm6
005c    1e98c:	c5 e9 73 d2 3f       	vpsrlq $0x3f,%xmm2,%xmm2
0061    1e991:	c5 f9 6f ca          	vmovdqa %xmm2,%xmm1
0065    1e995:	c5 e9 73 fa 08       	vpslldq $0x8,%xmm2,%xmm2
006a    1e99a:	c5 f1 73 d9 08       	vpsrldq $0x8,%xmm1,%xmm1
006f    1e99f:	c5 c9 eb f2          	vpor   %xmm2,%xmm6,%xmm6
0073    1e9a3:	c5 f9 70 d1 24       	vpshufd $0x24,%xmm1,%xmm2
0078    1e9a8:	c5 e9 76 15 00 00 00 00 	vpcmpeqd 0x0(%rip),%xmm2,%xmm2        # 1e9b0 <aesni_gcm_init_avx_gen2+0x80>	1e9ac: R_X86_64_PC32	TWOONE-0x4
0080    1e9b0:	c5 e9 db 15 00 00 00 00 	vpand  0x0(%rip),%xmm2,%xmm2        # 1e9b8 <aesni_gcm_init_avx_gen2+0x88>	1e9b4: R_X86_64_PC32	POLY-0x4
0088    1e9b8:	c5 c9 ef f2          	vpxor  %xmm2,%xmm6,%xmm6
008c    1e9bc:	c5 fa 7f 76 60       	vmovdqu %xmm6,0x60(%rsi)
0091    1e9c1:	4d 89 c2             	mov    %r8,%r10
0094    1e9c4:	4d 89 cc             	mov    %r9,%r12
0097    1e9c7:	4d 89 e3             	mov    %r12,%r11
009a    1e9ca:	c5 f9 ef c0          	vpxor  %xmm0,%xmm0,%xmm0
009e    1e9ce:	c5 f1 ef c9          	vpxor  %xmm1,%xmm1,%xmm1
00a2    1e9d2:	49 83 fb 10          	cmp    $0x10,%r11
00a6    1e9d6:	0f 8c bf 00 00 00    	jl     1ea9b <_get_AAD_rest82>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
