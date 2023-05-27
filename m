Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7527E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685173620; x=1716709620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUmfcFGX4pvDsNOhcjXPrNYRTu2zbWnaxPBGgEJfLf0=;
  b=lVhnJmvVAEqVXgDiKKzYJwQRMZpwqBQhClK7iGW39UZxN2t538PYDSGH
   NqSLZzmXt8xadXPsfhwiiAbTaFbN12UR/tpzYMumtxy1n6qPnhmHGStB7
   BAYZBTJVBbJBgvtkbsEnshw8yAZDgcpyaZ1zaKIyqLO0Enm/nEGFvS57q
   c3QrZtSTOwjPRn1ehg88jAMjjfQ8UJ5OnARtdJYGY9foCKNfIg83Jrt1J
   KGYbvatICKIjkk8TrwvifGt/TPKYui9sE4XgtJHZY4JVU0t06O1IwTwZg
   9SeLgk661+5ocWUUjHpWoxtCucV1T8DuTIwt+YarzglFChe6lbH7l8poB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="417856792"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="417856792"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:46:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="817791894"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="817791894"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 00:46:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2odb-000JqU-20;
	Sat, 27 May 2023 07:46:55 +0000
Date: Sat, 27 May 2023 15:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diet 28/34] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x84: can't find switch jump table
Message-ID: <202305271512.GWx5paAa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diet
head:   1fb92a891c743ef5c818c251189f5be7af66fbf9
commit: c1b7445d6401048b2db2bf927f192c316ce304fb [28/34] objtool: Get rid of reloc->jump_table_start
config: x86_64-randconfig-a004-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271512.GWx5paAa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=c1b7445d6401048b2db2bf927f192c316ce304fb
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-diet
        git checkout c1b7445d6401048b2db2bf927f192c316ce304fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271512.GWx5paAa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x84: can't find switch jump table


objdump-func vmlinux.o ___bpf_prog_run:
0000 00000000005d3eb0 <___bpf_prog_run>:
0000   5d3eb0:	e8 00 00 00 00       	call   5d3eb5 <___bpf_prog_run+0x5>	5d3eb1: R_X86_64_PLT32	__fentry__-0x4
0005   5d3eb5:	55                   	push   %rbp
0006   5d3eb6:	48 8d 47 10          	lea    0x10(%rdi),%rax
000a   5d3eba:	48 89 e5             	mov    %rsp,%rbp
000d   5d3ebd:	41 57                	push   %r15
000f   5d3ebf:	41 56                	push   %r14
0011   5d3ec1:	49 89 fe             	mov    %rdi,%r14
0014   5d3ec4:	41 55                	push   %r13
0016   5d3ec6:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0020   5d3ed0:	41 54                	push   %r12
0022   5d3ed2:	49 89 c4             	mov    %rax,%r12
0025   5d3ed5:	53                   	push   %rbx
0026   5d3ed6:	49 c1 ec 03          	shr    $0x3,%r12
002a   5d3eda:	48 89 f3             	mov    %rsi,%rbx
002d   5d3edd:	4d 01 ec             	add    %r13,%r12
0030   5d3ee0:	48 83 ec 38          	sub    $0x38,%rsp
0034   5d3ee4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
003b   5d3eeb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
003f   5d3eef:	48 89 d8             	mov    %rbx,%rax
0042   5d3ef2:	48 89 da             	mov    %rbx,%rdx
0045   5d3ef5:	48 c1 e8 03          	shr    $0x3,%rax
0049   5d3ef9:	83 e2 07             	and    $0x7,%edx
004c   5d3efc:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0051   5d3f01:	38 d0                	cmp    %dl,%al
0053   5d3f03:	7f 08                	jg     5d3f0d <___bpf_prog_run+0x5d>
0055   5d3f05:	84 c0                	test   %al,%al
0057   5d3f07:	0f 85 69 56 00 00    	jne    5d9576 <___bpf_prog_run+0x56c6>
005d   5d3f0d:	44 0f b6 3b          	movzbl (%rbx),%r15d
0061   5d3f11:	49 63 d7             	movslq %r15d,%rdx
0064   5d3f14:	44 89 f8             	mov    %r15d,%eax
0067   5d3f17:	48 8d 3c d5 00 00 00 00 	lea    0x0(,%rdx,8),%rdi	5d3f1b: R_X86_64_32S	.rodata..c_jump_table
006f   5d3f1f:	48 89 fa             	mov    %rdi,%rdx
0072   5d3f22:	48 c1 ea 03          	shr    $0x3,%rdx
0076   5d3f26:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
007b   5d3f2b:	0f 85 2d 56 00 00    	jne    5d955e <___bpf_prog_run+0x56ae>
0081   5d3f31:	49 63 d7             	movslq %r15d,%rdx
0084   5d3f34:	ff 24 d5 00 00 00 00 	jmp    *0x0(,%rdx,8)	5d3f37: R_X86_64_32S	.rodata..c_jump_table
008b   5d3f3b:	cc                   	int3
008c   5d3f3c:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0090   5d3f40:	48 89 fa             	mov    %rdi,%rdx
0093   5d3f43:	48 c1 ea 03          	shr    $0x3,%rdx
0097   5d3f47:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
009c   5d3f4c:	48 89 fa             	mov    %rdi,%rdx
009f   5d3f4f:	83 e2 07             	and    $0x7,%edx
00a2   5d3f52:	83 c2 03             	add    $0x3,%edx
00a5   5d3f55:	38 ca                	cmp    %cl,%dl
00a7   5d3f57:	7c 08                	jl     5d3f61 <___bpf_prog_run+0xb1>
00a9   5d3f59:	84 c9                	test   %cl,%cl
00ab   5d3f5b:	0f 85 4c 6b 00 00    	jne    5daaad <___bpf_prog_run+0x6bfd>
00b1   5d3f61:	8b 53 04             	mov    0x4(%rbx),%edx
00b4   5d3f64:	83 fa 51             	cmp    $0x51,%edx
00b7   5d3f67:	0f 84 b3 50 00 00    	je     5d9020 <___bpf_prog_run+0x5170>
00bd   5d3f6d:	0f 8f 1c 47 00 00    	jg     5d868f <___bpf_prog_run+0x47df>
00c3   5d3f73:	83 fa 40             	cmp    $0x40,%edx
00c6   5d3f76:	0f 84 fc 51 00 00    	je     5d9178 <___bpf_prog_run+0x52c8>
00cc   5d3f7c:	0f 8e 46 46 00 00    	jle    5d85c8 <___bpf_prog_run+0x4718>
00d2   5d3f82:	83 fa 41             	cmp    $0x41,%edx
00d5   5d3f85:	0f 85 75 45 00 00    	jne    5d8500 <___bpf_prog_run+0x4650>
00db   5d3f8b:	83 e0 18             	and    $0x18,%eax
00de   5d3f8e:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
00e2   5d3f92:	88 45 b8             	mov    %al,-0x48(%rbp)
00e5   5d3f95:	4c 89 f8             	mov    %r15,%rax
00e8   5d3f98:	4c 89 fa             	mov    %r15,%rdx
00eb   5d3f9b:	48 c1 e8 03          	shr    $0x3,%rax
00ef   5d3f9f:	83 e2 07             	and    $0x7,%edx
00f2   5d3fa2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
00f7   5d3fa7:	38 d0                	cmp    %dl,%al
00f9   5d3fa9:	7f 08                	jg     5d3fb3 <___bpf_prog_run+0x103>
00fb   5d3fab:	84 c0                	test   %al,%al
00fd   5d3fad:	0f 85 77 56 00 00    	jne    5d962a <___bpf_prog_run+0x577a>
0103   5d3fb3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0107   5d3fb7:	c0 e8 04             	shr    $0x4,%al
010a   5d3fba:	0f b6 c0             	movzbl %al,%eax
010d   5d3fbd:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0111   5d3fc1:	48 89 c2             	mov    %rax,%rdx
0114   5d3fc4:	48 c1 ea 03          	shr    $0x3,%rdx
0118   5d3fc8:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
011d   5d3fcd:	0f 85 aa 57 00 00    	jne    5d977d <___bpf_prog_run+0x58cd>
0123   5d3fd3:	48 8b 00             	mov    (%rax),%rax
0126   5d3fd6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
012a   5d3fda:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
012e   5d3fde:	83 e0 0f             	and    $0xf,%eax
0131   5d3fe1:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0135   5d3fe5:	48 89 c2             	mov    %rax,%rdx
0138   5d3fe8:	48 c1 ea 03          	shr    $0x3,%rdx
013c   5d3fec:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0141   5d3ff1:	0f 85 71 57 00 00    	jne    5d9768 <___bpf_prog_run+0x58b8>
0147   5d3ff7:	48 8b 00             	mov    (%rax),%rax
014a   5d3ffa:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
014e   5d3ffe:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
0152   5d4002:	48 89 f8             	mov    %rdi,%rax
0155   5d4005:	48 c1 e8 03          	shr    $0x3,%rax
0159   5d4009:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
015e   5d400e:	48 89 f8             	mov    %rdi,%rax
0161   5d4011:	83 e0 07             	and    $0x7,%eax
0164   5d4014:	83 c0 01             	add    $0x1,%eax
0167   5d4017:	38 d0                	cmp    %dl,%al
0169   5d4019:	7c 08                	jl     5d4023 <___bpf_prog_run+0x173>
016b   5d401b:	84 d2                	test   %dl,%dl
016d   5d401d:	0f 85 bd 57 00 00    	jne    5d97e0 <___bpf_prog_run+0x5930>
0173   5d4023:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0178   5d4028:	48 03 55 b0          	add    -0x50(%rbp),%rdx
017c   5d402c:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
0180   5d4030:	0f 85 01 52 00 00    	jne    5d9237 <___bpf_prog_run+0x5387>
0186   5d4036:	48 89 d7             	mov    %rdx,%rdi
0189   5d4039:	be 04 00 00 00       	mov    $0x4,%esi
018e   5d403e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
0192   5d4042:	e8 00 00 00 00       	call   5d4047 <___bpf_prog_run+0x197>	5d4043: R_X86_64_PLT32	__kasan_check_write-0x4
0197   5d4047:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
019b   5d404b:	48 89 d0             	mov    %rdx,%rax
019e   5d404e:	48 c1 e8 03          	shr    $0x3,%rax
01a2   5d4052:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
01a7   5d4057:	48 89 d0             	mov    %rdx,%rax
01aa   5d405a:	83 e0 07             	and    $0x7,%eax
01ad   5d405d:	83 c0 03             	add    $0x3,%eax
01b0   5d4060:	38 c8                	cmp    %cl,%al
01b2   5d4062:	7c 10                	jl     5d4074 <___bpf_prog_run+0x1c4>
01b4   5d4064:	84 c9                	test   %cl,%cl
01b6   5d4066:	74 0c                	je     5d4074 <___bpf_prog_run+0x1c4>
01b8   5d4068:	48 89 d7             	mov    %rdx,%rdi
01bb   5d406b:	e8 00 00 00 00       	call   5d4070 <___bpf_prog_run+0x1c0>	5d406c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
01c0   5d4070:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
01c4   5d4074:	8b 02                	mov    (%rdx),%eax
01c6   5d4076:	8b 75 c0             	mov    -0x40(%rbp),%esi
01c9   5d4079:	89 c1                	mov    %eax,%ecx
01cb   5d407b:	09 c6                	or     %eax,%esi
01cd   5d407d:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
01d1   5d4081:	75 f3                	jne    5d4076 <___bpf_prog_run+0x1c6>
01d3   5d4083:	4c 89 f8             	mov    %r15,%rax
01d6   5d4086:	4c 89 fa             	mov    %r15,%rdx
01d9   5d4089:	48 c1 e8 03          	shr    $0x3,%rax
01dd   5d408d:	83 e2 07             	and    $0x7,%edx
01e0   5d4090:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
01e5   5d4095:	38 d0                	cmp    %dl,%al
01e7   5d4097:	7f 12                	jg     5d40ab <___bpf_prog_run+0x1fb>
01e9   5d4099:	84 c0                	test   %al,%al
01eb   5d409b:	74 0e                	je     5d40ab <___bpf_prog_run+0x1fb>
01ed   5d409d:	4c 89 ff             	mov    %r15,%rdi
01f0   5d40a0:	89 4d c0             	mov    %ecx,-0x40(%rbp)
01f3   5d40a3:	e8 00 00 00 00       	call   5d40a8 <___bpf_prog_run+0x1f8>	5d40a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01f8   5d40a8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
01fb   5d40ab:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
01ff   5d40af:	41 89 cf             	mov    %ecx,%r15d
0202   5d40b2:	c0 e8 04             	shr    $0x4,%al
0205   5d40b5:	0f b6 c0             	movzbl %al,%eax
0208   5d40b8:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
020c   5d40bc:	48 89 c2             	mov    %rax,%rdx
020f   5d40bf:	48 c1 ea 03          	shr    $0x3,%rdx
0213   5d40c3:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0218   5d40c8:	0f 84 14 4a 00 00    	je     5d8ae2 <___bpf_prog_run+0x4c32>
021e   5d40ce:	48 89 c7             	mov    %rax,%rdi
0221   5d40d1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0225   5d40d5:	e8 00 00 00 00       	call   5d40da <___bpf_prog_run+0x22a>	5d40d6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
022a   5d40da:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
022e   5d40de:	e9 ff 49 00 00       	jmp    5d8ae2 <___bpf_prog_run+0x4c32>
0233   5d40e3:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0237   5d40e7:	48 89 f8             	mov    %rdi,%rax
023a   5d40ea:	48 89 fa             	mov    %rdi,%rdx
023d   5d40ed:	48 c1 e8 03          	shr    $0x3,%rax
0241   5d40f1:	83 e2 07             	and    $0x7,%edx
0244   5d40f4:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0249   5d40f9:	38 d0                	cmp    %dl,%al
024b   5d40fb:	7f 08                	jg     5d4105 <___bpf_prog_run+0x255>
024d   5d40fd:	84 c0                	test   %al,%al
024f   5d40ff:	0f 85 93 64 00 00    	jne    5da598 <___bpf_prog_run+0x66e8>
0255   5d4105:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0259   5d4109:	c0 e8 04             	shr    $0x4,%al
025c   5d410c:	0f b6 c0             	movzbl %al,%eax
025f   5d410f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0263   5d4113:	4c 89 f8             	mov    %r15,%rax
0266   5d4116:	48 c1 e8 03          	shr    $0x3,%rax
026a   5d411a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
026f   5d411f:	0f 85 17 71 00 00    	jne    5db23c <___bpf_prog_run+0x738c>
0275   5d4125:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0279   5d4129:	49 8b 0f             	mov    (%r15),%rcx
027c   5d412c:	48 89 f8             	mov    %rdi,%rax
027f   5d412f:	48 c1 e8 03          	shr    $0x3,%rax
0283   5d4133:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0288   5d4138:	48 89 f8             	mov    %rdi,%rax
028b   5d413b:	83 e0 07             	and    $0x7,%eax
028e   5d413e:	83 c0 01             	add    $0x1,%eax
0291   5d4141:	38 d0                	cmp    %dl,%al
0293   5d4143:	7c 08                	jl     5d414d <___bpf_prog_run+0x29d>
0295   5d4145:	84 d2                	test   %dl,%dl
0297   5d4147:	0f 85 e1 5d 00 00    	jne    5d9f2e <___bpf_prog_run+0x607e>
029d   5d414d:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
02a2   5d4152:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
02a6   5d4156:	49 01 cf             	add    %rcx,%r15
02a9   5d4159:	83 e0 0f             	and    $0xf,%eax
02ac   5d415c:	4c 89 fa             	mov    %r15,%rdx
02af   5d415f:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
02b3   5d4163:	48 c1 ea 03          	shr    $0x3,%rdx
02b7   5d4167:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
02bc   5d416c:	0f 85 38 71 00 00    	jne    5db2aa <___bpf_prog_run+0x73fa>
02c2   5d4172:	48 89 c2             	mov    %rax,%rdx
02c5   5d4175:	4d 8b 3f             	mov    (%r15),%r15
02c8   5d4178:	48 c1 ea 03          	shr    $0x3,%rdx
02cc   5d417c:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
02d1   5d4181:	0f 85 0e 71 00 00    	jne    5db295 <___bpf_prog_run+0x73e5>
02d7   5d4187:	4c 89 38             	mov    %r15,(%rax)
02da   5d418a:	48 83 c3 08          	add    $0x8,%rbx
02de   5d418e:	e9 5c fd ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
02e3   5d4193:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
02e7   5d4197:	48 89 f8             	mov    %rdi,%rax
02ea   5d419a:	48 c1 e8 03          	shr    $0x3,%rax
02ee   5d419e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
02f3   5d41a3:	48 89 f8             	mov    %rdi,%rax
02f6   5d41a6:	83 e0 07             	and    $0x7,%eax
02f9   5d41a9:	83 c0 03             	add    $0x3,%eax
02fc   5d41ac:	38 d0                	cmp    %dl,%al
02fe   5d41ae:	7c 08                	jl     5d41b8 <___bpf_prog_run+0x308>
0300   5d41b0:	84 d2                	test   %dl,%dl
0302   5d41b2:	0f 85 ad 62 00 00    	jne    5da465 <___bpf_prog_run+0x65b5>
0308   5d41b8:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
030c   5d41bc:	48 63 43 04          	movslq 0x4(%rbx),%rax
0310   5d41c0:	48 89 fa             	mov    %rdi,%rdx
0313   5d41c3:	48 89 f9             	mov    %rdi,%rcx
0316   5d41c6:	48 c1 ea 03          	shr    $0x3,%rdx
031a   5d41ca:	83 e1 07             	and    $0x7,%ecx
031d   5d41cd:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
0322   5d41d2:	38 ca                	cmp    %cl,%dl
0324   5d41d4:	7f 08                	jg     5d41de <___bpf_prog_run+0x32e>
0326   5d41d6:	84 d2                	test   %dl,%dl
0328   5d41d8:	0f 85 4d 57 00 00    	jne    5d992b <___bpf_prog_run+0x5a7b>
032e   5d41de:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0332   5d41e2:	83 e2 0f             	and    $0xf,%edx
0335   5d41e5:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
0339   5d41e9:	4c 89 fa             	mov    %r15,%rdx
033c   5d41ec:	48 c1 ea 03          	shr    $0x3,%rdx
0340   5d41f0:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0345   5d41f5:	0f 85 94 6d 00 00    	jne    5daf8f <___bpf_prog_run+0x70df>
034b   5d41fb:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
034f   5d41ff:	49 8b 37             	mov    (%r15),%rsi
0352   5d4202:	48 89 fa             	mov    %rdi,%rdx
0355   5d4205:	48 c1 ea 03          	shr    $0x3,%rdx
0359   5d4209:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
035e   5d420e:	48 89 fa             	mov    %rdi,%rdx
0361   5d4211:	83 e2 07             	and    $0x7,%edx
0364   5d4214:	83 c2 01             	add    $0x1,%edx
0367   5d4217:	38 ca                	cmp    %cl,%dl
0369   5d4219:	7c 08                	jl     5d4223 <___bpf_prog_run+0x373>
036b   5d421b:	84 c9                	test   %cl,%cl
036d   5d421d:	0f 85 ef 56 00 00    	jne    5d9912 <___bpf_prog_run+0x5a62>
0373   5d4223:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0378   5d4228:	49 01 f7             	add    %rsi,%r15
037b   5d422b:	4c 89 fa             	mov    %r15,%rdx
037e   5d422e:	48 c1 ea 03          	shr    $0x3,%rdx
0382   5d4232:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0387   5d4237:	0f 85 3d 6d 00 00    	jne    5daf7a <___bpf_prog_run+0x70ca>
038d   5d423d:	49 89 07             	mov    %rax,(%r15)
0390   5d4240:	48 83 c3 08          	add    $0x8,%rbx
0394   5d4244:	e9 a6 fc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0399   5d4249:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
039d   5d424d:	48 89 f8             	mov    %rdi,%rax
03a0   5d4250:	48 89 fa             	mov    %rdi,%rdx
03a3   5d4253:	48 c1 e8 03          	shr    $0x3,%rax
03a7   5d4257:	83 e2 07             	and    $0x7,%edx
03aa   5d425a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
03af   5d425f:	38 d0                	cmp    %dl,%al
03b1   5d4261:	7f 08                	jg     5d426b <___bpf_prog_run+0x3bb>
03b3   5d4263:	84 c0                	test   %al,%al
03b5   5d4265:	0f 85 f0 61 00 00    	jne    5da45b <___bpf_prog_run+0x65ab>
03bb   5d426b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
03bf   5d426f:	89 c2                	mov    %eax,%edx
03c1   5d4271:	83 e0 0f             	and    $0xf,%eax
03c4   5d4274:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
03c8   5d4278:	c0 ea 04             	shr    $0x4,%dl
03cb   5d427b:	4c 89 f8             	mov    %r15,%rax
03ce   5d427e:	0f b6 d2             	movzbl %dl,%edx
03d1   5d4281:	48 c1 e8 03          	shr    $0x3,%rax
03d5   5d4285:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
03d9   5d4289:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
03de   5d428e:	0f 85 a2 6c 00 00    	jne    5daf36 <___bpf_prog_run+0x7086>
03e4   5d4294:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
03e8   5d4298:	49 8b 37             	mov    (%r15),%rsi
03eb   5d429b:	48 89 f8             	mov    %rdi,%rax
03ee   5d429e:	48 c1 e8 03          	shr    $0x3,%rax
03f2   5d42a2:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
03f7   5d42a7:	48 89 f8             	mov    %rdi,%rax
03fa   5d42aa:	83 e0 07             	and    $0x7,%eax
03fd   5d42ad:	83 c0 01             	add    $0x1,%eax
0400   5d42b0:	38 c8                	cmp    %cl,%al
0402   5d42b2:	7c 08                	jl     5d42bc <___bpf_prog_run+0x40c>
0404   5d42b4:	84 c9                	test   %cl,%cl
0406   5d42b6:	0f 85 80 56 00 00    	jne    5d993c <___bpf_prog_run+0x5a8c>
040c   5d42bc:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0411   5d42c1:	48 89 d0             	mov    %rdx,%rax
0414   5d42c4:	48 c1 e8 03          	shr    $0x3,%rax
0418   5d42c8:	49 01 f7             	add    %rsi,%r15
041b   5d42cb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0420   5d42d0:	0f 85 e2 6c 00 00    	jne    5dafb8 <___bpf_prog_run+0x7108>
0426   5d42d6:	48 8b 02             	mov    (%rdx),%rax
0429   5d42d9:	4c 89 fa             	mov    %r15,%rdx
042c   5d42dc:	48 c1 ea 03          	shr    $0x3,%rdx
0430   5d42e0:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0435   5d42e5:	0f 85 b8 6c 00 00    	jne    5dafa3 <___bpf_prog_run+0x70f3>
043b   5d42eb:	49 89 07             	mov    %rax,(%r15)
043e   5d42ee:	48 83 c3 08          	add    $0x8,%rbx
0442   5d42f2:	e9 f8 fb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0447   5d42f7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
044b   5d42fb:	48 89 f8             	mov    %rdi,%rax
044e   5d42fe:	48 89 fa             	mov    %rdi,%rdx
0451   5d4301:	48 c1 e8 03          	shr    $0x3,%rax
0455   5d4305:	83 e2 07             	and    $0x7,%edx
0458   5d4308:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
045d   5d430d:	38 d0                	cmp    %dl,%al
045f   5d430f:	7f 08                	jg     5d4319 <___bpf_prog_run+0x469>
0461   5d4311:	84 c0                	test   %al,%al
0463   5d4313:	0f 85 38 61 00 00    	jne    5da451 <___bpf_prog_run+0x65a1>
0469   5d4319:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
046d   5d431d:	c0 e8 04             	shr    $0x4,%al
0470   5d4320:	0f b6 c0             	movzbl %al,%eax
0473   5d4323:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0477   5d4327:	4c 89 f8             	mov    %r15,%rax
047a   5d432a:	48 c1 e8 03          	shr    $0x3,%rax
047e   5d432e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0483   5d4333:	0f 85 7d 65 00 00    	jne    5da8b6 <___bpf_prog_run+0x6a06>
0489   5d4339:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
048d   5d433d:	4d 8b 3f             	mov    (%r15),%r15
0490   5d4340:	48 89 f8             	mov    %rdi,%rax
0493   5d4343:	48 c1 e8 03          	shr    $0x3,%rax
0497   5d4347:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
049c   5d434c:	48 89 f8             	mov    %rdi,%rax
049f   5d434f:	83 e0 07             	and    $0x7,%eax
04a2   5d4352:	83 c0 01             	add    $0x1,%eax
04a5   5d4355:	38 d0                	cmp    %dl,%al
04a7   5d4357:	7c 08                	jl     5d4361 <___bpf_prog_run+0x4b1>
04a9   5d4359:	84 d2                	test   %dl,%dl
04ab   5d435b:	0f 85 14 53 00 00    	jne    5d9675 <___bpf_prog_run+0x57c5>
04b1   5d4361:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
04b5   5d4365:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
04ba   5d436a:	be 08 00 00 00       	mov    $0x8,%esi
04bf   5d436f:	48 83 c3 08          	add    $0x8,%rbx
04c3   5d4373:	83 e0 0f             	and    $0xf,%eax
04c6   5d4376:	4c 01 fa             	add    %r15,%rdx
04c9   5d4379:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
04cd   5d437d:	e8 00 00 00 00       	call   5d4382 <___bpf_prog_run+0x4d2>	5d437e: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
04d2   5d4382:	e9 68 fb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
04d7   5d4387:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
04db   5d438b:	48 89 f8             	mov    %rdi,%rax
04de   5d438e:	48 89 fa             	mov    %rdi,%rdx
04e1   5d4391:	48 c1 e8 03          	shr    $0x3,%rax
04e5   5d4395:	83 e2 07             	and    $0x7,%edx
04e8   5d4398:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
04ed   5d439d:	38 d0                	cmp    %dl,%al
04ef   5d439f:	7f 08                	jg     5d43a9 <___bpf_prog_run+0x4f9>
04f1   5d43a1:	84 c0                	test   %al,%al
04f3   5d43a3:	0f 85 9e 60 00 00    	jne    5da447 <___bpf_prog_run+0x6597>
04f9   5d43a9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
04fd   5d43ad:	c0 e8 04             	shr    $0x4,%al
0500   5d43b0:	0f b6 c0             	movzbl %al,%eax
0503   5d43b3:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0507   5d43b7:	4c 89 f8             	mov    %r15,%rax
050a   5d43ba:	48 c1 e8 03          	shr    $0x3,%rax
050e   5d43be:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0513   5d43c3:	0f 85 52 6c 00 00    	jne    5db01b <___bpf_prog_run+0x716b>
0519   5d43c9:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
051d   5d43cd:	49 8b 0f             	mov    (%r15),%rcx
0520   5d43d0:	48 89 f8             	mov    %rdi,%rax
0523   5d43d3:	48 c1 e8 03          	shr    $0x3,%rax
0527   5d43d7:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
052c   5d43dc:	48 89 f8             	mov    %rdi,%rax
052f   5d43df:	83 e0 07             	and    $0x7,%eax
0532   5d43e2:	83 c0 01             	add    $0x1,%eax
0535   5d43e5:	38 d0                	cmp    %dl,%al
0537   5d43e7:	7c 08                	jl     5d43f1 <___bpf_prog_run+0x541>
0539   5d43e9:	84 d2                	test   %dl,%dl
053b   5d43eb:	0f 85 0f 55 00 00    	jne    5d9900 <___bpf_prog_run+0x5a50>
0541   5d43f1:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0546   5d43f6:	49 01 cf             	add    %rcx,%r15
0549   5d43f9:	4c 89 f8             	mov    %r15,%rax
054c   5d43fc:	48 c1 e8 03          	shr    $0x3,%rax
0550   5d4400:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0555   5d4405:	4c 89 f8             	mov    %r15,%rax
0558   5d4408:	83 e0 07             	and    $0x7,%eax
055b   5d440b:	83 c0 03             	add    $0x3,%eax
055e   5d440e:	38 d0                	cmp    %dl,%al
0560   5d4410:	7c 08                	jl     5d441a <___bpf_prog_run+0x56a>
0562   5d4412:	84 d2                	test   %dl,%dl
0564   5d4414:	0f 85 65 52 00 00    	jne    5d967f <___bpf_prog_run+0x57cf>
056a   5d441a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
056e   5d441e:	45 8b 3f             	mov    (%r15),%r15d
0571   5d4421:	83 e0 0f             	and    $0xf,%eax
0574   5d4424:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0578   5d4428:	48 89 c2             	mov    %rax,%rdx
057b   5d442b:	48 c1 ea 03          	shr    $0x3,%rdx
057f   5d442f:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0584   5d4434:	0f 85 89 64 00 00    	jne    5da8c3 <___bpf_prog_run+0x6a13>
058a   5d443a:	4c 89 38             	mov    %r15,(%rax)
058d   5d443d:	48 83 c3 08          	add    $0x8,%rbx
0591   5d4441:	e9 a9 fa ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0596   5d4446:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
059a   5d444a:	4c 89 f8             	mov    %r15,%rax
059d   5d444d:	4c 89 fa             	mov    %r15,%rdx
05a0   5d4450:	48 c1 e8 03          	shr    $0x3,%rax
05a4   5d4454:	83 e2 07             	and    $0x7,%edx
05a7   5d4457:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
05ac   5d445c:	38 d0                	cmp    %dl,%al
05ae   5d445e:	7f 08                	jg     5d4468 <___bpf_prog_run+0x5b8>
05b0   5d4460:	84 c0                	test   %al,%al
05b2   5d4462:	0f 85 d2 5f 00 00    	jne    5da43a <___bpf_prog_run+0x658a>
05b8   5d4468:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
05bc   5d446c:	c0 e8 04             	shr    $0x4,%al
05bf   5d446f:	0f b6 c0             	movzbl %al,%eax
05c2   5d4472:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
05c6   5d4476:	48 89 c2             	mov    %rax,%rdx
05c9   5d4479:	48 c1 ea 03          	shr    $0x3,%rdx
05cd   5d447d:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
05d2   5d4482:	0f 85 65 64 00 00    	jne    5da8ed <___bpf_prog_run+0x6a3d>
05d8   5d4488:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
05dc   5d448c:	48 8b 08             	mov    (%rax),%rcx
05df   5d448f:	48 89 f8             	mov    %rdi,%rax
05e2   5d4492:	48 c1 e8 03          	shr    $0x3,%rax
05e6   5d4496:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
05eb   5d449b:	48 89 f8             	mov    %rdi,%rax
05ee   5d449e:	83 e0 07             	and    $0x7,%eax
05f1   5d44a1:	83 c0 01             	add    $0x1,%eax
05f4   5d44a4:	38 d0                	cmp    %dl,%al
05f6   5d44a6:	7c 08                	jl     5d44b0 <___bpf_prog_run+0x600>
05f8   5d44a8:	84 d2                	test   %dl,%dl
05fa   5d44aa:	0f 85 b3 51 00 00    	jne    5d9663 <___bpf_prog_run+0x57b3>
0600   5d44b0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0604   5d44b4:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0609   5d44b9:	be 04 00 00 00       	mov    $0x4,%esi
060e   5d44be:	83 e0 0f             	and    $0xf,%eax
0611   5d44c1:	48 01 ca             	add    %rcx,%rdx
0614   5d44c4:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
0618   5d44c8:	e8 00 00 00 00       	call   5d44cd <___bpf_prog_run+0x61d>	5d44c9: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
061d   5d44cd:	4c 89 f8             	mov    %r15,%rax
0620   5d44d0:	4c 89 fa             	mov    %r15,%rdx
0623   5d44d3:	48 c1 e8 03          	shr    $0x3,%rax
0627   5d44d7:	83 e2 07             	and    $0x7,%edx
062a   5d44da:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
062f   5d44df:	38 d0                	cmp    %dl,%al
0631   5d44e1:	7f 08                	jg     5d44eb <___bpf_prog_run+0x63b>
0633   5d44e3:	84 c0                	test   %al,%al
0635   5d44e5:	0f 85 6b 51 00 00    	jne    5d9656 <___bpf_prog_run+0x57a6>
063b   5d44eb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
063f   5d44ef:	83 e0 0f             	and    $0xf,%eax
0642   5d44f2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0646   5d44f6:	4c 89 f8             	mov    %r15,%rax
0649   5d44f9:	48 c1 e8 03          	shr    $0x3,%rax
064d   5d44fd:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0652   5d4502:	84 c0                	test   %al,%al
0654   5d4504:	74 08                	je     5d450e <___bpf_prog_run+0x65e>
0656   5d4506:	3c 03                	cmp    $0x3,%al
0658   5d4508:	0f 8e 3b 51 00 00    	jle    5d9649 <___bpf_prog_run+0x5799>
065e   5d450e:	4c 89 fa             	mov    %r15,%rdx
0661   5d4511:	41 8b 07             	mov    (%r15),%eax
0664   5d4514:	48 c1 ea 03          	shr    $0x3,%rdx
0668   5d4518:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
066d   5d451d:	0f 85 32 60 00 00    	jne    5da555 <___bpf_prog_run+0x66a5>
0673   5d4523:	49 89 07             	mov    %rax,(%r15)
0676   5d4526:	48 83 c3 08          	add    $0x8,%rbx
067a   5d452a:	e9 c0 f9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
067f   5d452f:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0683   5d4533:	48 89 f8             	mov    %rdi,%rax
0686   5d4536:	48 c1 e8 03          	shr    $0x3,%rax
068a   5d453a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
068f   5d453f:	48 89 f8             	mov    %rdi,%rax
0692   5d4542:	83 e0 07             	and    $0x7,%eax
0695   5d4545:	83 c0 03             	add    $0x3,%eax
0698   5d4548:	38 d0                	cmp    %dl,%al
069a   5d454a:	7c 08                	jl     5d4554 <___bpf_prog_run+0x6a4>
069c   5d454c:	84 d2                	test   %dl,%dl
069e   5d454e:	0f 85 dc 5e 00 00    	jne    5da430 <___bpf_prog_run+0x6580>
06a4   5d4554:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
06a8   5d4558:	8b 53 04             	mov    0x4(%rbx),%edx
06ab   5d455b:	48 89 f8             	mov    %rdi,%rax
06ae   5d455e:	48 89 f9             	mov    %rdi,%rcx
06b1   5d4561:	48 c1 e8 03          	shr    $0x3,%rax
06b5   5d4565:	83 e1 07             	and    $0x7,%ecx
06b8   5d4568:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
06bd   5d456d:	38 c8                	cmp    %cl,%al
06bf   5d456f:	7f 08                	jg     5d4579 <___bpf_prog_run+0x6c9>
06c1   5d4571:	84 c0                	test   %al,%al
06c3   5d4573:	0f 85 36 59 00 00    	jne    5d9eaf <___bpf_prog_run+0x5fff>
06c9   5d4579:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
06cd   5d457d:	83 e0 0f             	and    $0xf,%eax
06d0   5d4580:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
06d4   5d4584:	4c 89 f8             	mov    %r15,%rax
06d7   5d4587:	48 c1 e8 03          	shr    $0x3,%rax
06db   5d458b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
06e0   5d4590:	0f 85 87 6d 00 00    	jne    5db31d <___bpf_prog_run+0x746d>
06e6   5d4596:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
06ea   5d459a:	49 8b 37             	mov    (%r15),%rsi
06ed   5d459d:	48 89 f8             	mov    %rdi,%rax
06f0   5d45a0:	48 c1 e8 03          	shr    $0x3,%rax
06f4   5d45a4:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
06f9   5d45a9:	48 89 f8             	mov    %rdi,%rax
06fc   5d45ac:	83 e0 07             	and    $0x7,%eax
06ff   5d45af:	83 c0 01             	add    $0x1,%eax
0702   5d45b2:	38 c8                	cmp    %cl,%al
0704   5d45b4:	7c 08                	jl     5d45be <___bpf_prog_run+0x70e>
0706   5d45b6:	84 c9                	test   %cl,%cl
0708   5d45b8:	0f 85 d9 58 00 00    	jne    5d9e97 <___bpf_prog_run+0x5fe7>
070e   5d45be:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0713   5d45c3:	49 01 f7             	add    %rsi,%r15
0716   5d45c6:	4c 89 f8             	mov    %r15,%rax
0719   5d45c9:	48 c1 e8 03          	shr    $0x3,%rax
071d   5d45cd:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0722   5d45d2:	4c 89 f8             	mov    %r15,%rax
0725   5d45d5:	83 e0 07             	and    $0x7,%eax
0728   5d45d8:	83 c0 03             	add    $0x3,%eax
072b   5d45db:	38 c8                	cmp    %cl,%al
072d   5d45dd:	7c 08                	jl     5d45e7 <___bpf_prog_run+0x737>
072f   5d45df:	84 c9                	test   %cl,%cl
0731   5d45e1:	0f 85 9d 58 00 00    	jne    5d9e84 <___bpf_prog_run+0x5fd4>
0737   5d45e7:	41 89 17             	mov    %edx,(%r15)
073a   5d45ea:	48 83 c3 08          	add    $0x8,%rbx
073e   5d45ee:	e9 fc f8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0743   5d45f3:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0747   5d45f7:	48 89 f8             	mov    %rdi,%rax
074a   5d45fa:	48 89 fa             	mov    %rdi,%rdx
074d   5d45fd:	48 c1 e8 03          	shr    $0x3,%rax
0751   5d4601:	83 e2 07             	and    $0x7,%edx
0754   5d4604:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0759   5d4609:	38 d0                	cmp    %dl,%al
075b   5d460b:	7f 08                	jg     5d4615 <___bpf_prog_run+0x765>
075d   5d460d:	84 c0                	test   %al,%al
075f   5d460f:	0f 85 11 5e 00 00    	jne    5da426 <___bpf_prog_run+0x6576>
0765   5d4615:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0769   5d4619:	c0 e8 04             	shr    $0x4,%al
076c   5d461c:	0f b6 c0             	movzbl %al,%eax
076f   5d461f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0773   5d4623:	4c 89 f8             	mov    %r15,%rax
0776   5d4626:	48 c1 e8 03          	shr    $0x3,%rax
077a   5d462a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
077f   5d462f:	0f 85 1d 6b 00 00    	jne    5db152 <___bpf_prog_run+0x72a2>
0785   5d4635:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0789   5d4639:	49 8b 17             	mov    (%r15),%rdx
078c   5d463c:	83 e0 0f             	and    $0xf,%eax
078f   5d463f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0793   5d4643:	4c 89 f8             	mov    %r15,%rax
0796   5d4646:	48 c1 e8 03          	shr    $0x3,%rax
079a   5d464a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
079f   5d464f:	0f 85 e8 6a 00 00    	jne    5db13d <___bpf_prog_run+0x728d>
07a5   5d4655:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
07a9   5d4659:	49 8b 37             	mov    (%r15),%rsi
07ac   5d465c:	48 89 f8             	mov    %rdi,%rax
07af   5d465f:	48 c1 e8 03          	shr    $0x3,%rax
07b3   5d4663:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
07b8   5d4668:	48 89 f8             	mov    %rdi,%rax
07bb   5d466b:	83 e0 07             	and    $0x7,%eax
07be   5d466e:	83 c0 01             	add    $0x1,%eax
07c1   5d4671:	38 c8                	cmp    %cl,%al
07c3   5d4673:	7c 08                	jl     5d467d <___bpf_prog_run+0x7cd>
07c5   5d4675:	84 c9                	test   %cl,%cl
07c7   5d4677:	0f 85 c5 57 00 00    	jne    5d9e42 <___bpf_prog_run+0x5f92>
07cd   5d467d:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
07d2   5d4682:	49 01 f7             	add    %rsi,%r15
07d5   5d4685:	4c 89 f8             	mov    %r15,%rax
07d8   5d4688:	48 c1 e8 03          	shr    $0x3,%rax
07dc   5d468c:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
07e1   5d4691:	4c 89 f8             	mov    %r15,%rax
07e4   5d4694:	83 e0 07             	and    $0x7,%eax
07e7   5d4697:	83 c0 03             	add    $0x3,%eax
07ea   5d469a:	38 c8                	cmp    %cl,%al
07ec   5d469c:	7c 08                	jl     5d46a6 <___bpf_prog_run+0x7f6>
07ee   5d469e:	84 c9                	test   %cl,%cl
07f0   5d46a0:	0f 85 87 57 00 00    	jne    5d9e2d <___bpf_prog_run+0x5f7d>
07f6   5d46a6:	41 89 17             	mov    %edx,(%r15)
07f9   5d46a9:	48 83 c3 08          	add    $0x8,%rbx
07fd   5d46ad:	e9 3d f8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0802   5d46b2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0806   5d46b6:	48 89 f8             	mov    %rdi,%rax
0809   5d46b9:	48 89 fa             	mov    %rdi,%rdx
080c   5d46bc:	48 c1 e8 03          	shr    $0x3,%rax
0810   5d46c0:	83 e2 07             	and    $0x7,%edx
0813   5d46c3:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0818   5d46c8:	38 d0                	cmp    %dl,%al
081a   5d46ca:	7f 08                	jg     5d46d4 <___bpf_prog_run+0x824>
081c   5d46cc:	84 c0                	test   %al,%al
081e   5d46ce:	0f 85 48 5d 00 00    	jne    5da41c <___bpf_prog_run+0x656c>
0824   5d46d4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0828   5d46d8:	c0 e8 04             	shr    $0x4,%al
082b   5d46db:	0f b6 c0             	movzbl %al,%eax
082e   5d46de:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0832   5d46e2:	4c 89 f8             	mov    %r15,%rax
0835   5d46e5:	48 c1 e8 03          	shr    $0x3,%rax
0839   5d46e9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
083e   5d46ee:	0f 85 94 6b 00 00    	jne    5db288 <___bpf_prog_run+0x73d8>
0844   5d46f4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0848   5d46f8:	49 8b 17             	mov    (%r15),%rdx
084b   5d46fb:	83 e0 0f             	and    $0xf,%eax
084e   5d46fe:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0852   5d4702:	4c 89 f8             	mov    %r15,%rax
0855   5d4705:	48 c1 e8 03          	shr    $0x3,%rax
0859   5d4709:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
085e   5d470e:	0f 85 5f 6b 00 00    	jne    5db273 <___bpf_prog_run+0x73c3>
0864   5d4714:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0868   5d4718:	49 8b 37             	mov    (%r15),%rsi
086b   5d471b:	48 89 f8             	mov    %rdi,%rax
086e   5d471e:	48 c1 e8 03          	shr    $0x3,%rax
0872   5d4722:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0877   5d4727:	48 89 f8             	mov    %rdi,%rax
087a   5d472a:	83 e0 07             	and    $0x7,%eax
087d   5d472d:	83 c0 01             	add    $0x1,%eax
0880   5d4730:	38 c8                	cmp    %cl,%al
0882   5d4732:	7c 08                	jl     5d473c <___bpf_prog_run+0x88c>
0884   5d4734:	84 c9                	test   %cl,%cl
0886   5d4736:	0f 85 d8 57 00 00    	jne    5d9f14 <___bpf_prog_run+0x6064>
088c   5d473c:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0891   5d4741:	49 01 f7             	add    %rsi,%r15
0894   5d4744:	4c 89 f8             	mov    %r15,%rax
0897   5d4747:	4c 89 f9             	mov    %r15,%rcx
089a   5d474a:	48 c1 e8 03          	shr    $0x3,%rax
089e   5d474e:	83 e1 07             	and    $0x7,%ecx
08a1   5d4751:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08a6   5d4756:	38 c8                	cmp    %cl,%al
08a8   5d4758:	7f 08                	jg     5d4762 <___bpf_prog_run+0x8b2>
08aa   5d475a:	84 c0                	test   %al,%al
08ac   5d475c:	0f 85 9d 57 00 00    	jne    5d9eff <___bpf_prog_run+0x604f>
08b2   5d4762:	41 88 17             	mov    %dl,(%r15)
08b5   5d4765:	48 83 c3 08          	add    $0x8,%rbx
08b9   5d4769:	e9 81 f7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
08be   5d476e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
08c2   5d4772:	48 89 f8             	mov    %rdi,%rax
08c5   5d4775:	48 89 fa             	mov    %rdi,%rdx
08c8   5d4778:	48 c1 e8 03          	shr    $0x3,%rax
08cc   5d477c:	83 e2 07             	and    $0x7,%edx
08cf   5d477f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08d4   5d4784:	38 d0                	cmp    %dl,%al
08d6   5d4786:	7f 08                	jg     5d4790 <___bpf_prog_run+0x8e0>
08d8   5d4788:	84 c0                	test   %al,%al
08da   5d478a:	0f 85 82 5c 00 00    	jne    5da412 <___bpf_prog_run+0x6562>
08e0   5d4790:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
08e4   5d4794:	c0 e8 04             	shr    $0x4,%al
08e7   5d4797:	0f b6 c0             	movzbl %al,%eax
08ea   5d479a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
08ee   5d479e:	4c 89 f8             	mov    %r15,%rax
08f1   5d47a1:	48 c1 e8 03          	shr    $0x3,%rax
08f5   5d47a5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
08fa   5d47aa:	0f 85 7f 6a 00 00    	jne    5db22f <___bpf_prog_run+0x737f>
0900   5d47b0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0904   5d47b4:	49 8b 17             	mov    (%r15),%rdx
0907   5d47b7:	83 e0 0f             	and    $0xf,%eax
090a   5d47ba:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
090e   5d47be:	4c 89 f8             	mov    %r15,%rax
0911   5d47c1:	48 c1 e8 03          	shr    $0x3,%rax
0915   5d47c5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
091a   5d47ca:	0f 85 4a 6a 00 00    	jne    5db21a <___bpf_prog_run+0x736a>
0920   5d47d0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0924   5d47d4:	49 8b 37             	mov    (%r15),%rsi
0927   5d47d7:	48 89 f8             	mov    %rdi,%rax
092a   5d47da:	48 c1 e8 03          	shr    $0x3,%rax
092e   5d47de:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0933   5d47e3:	48 89 f8             	mov    %rdi,%rax
0936   5d47e6:	83 e0 07             	and    $0x7,%eax
0939   5d47e9:	83 c0 01             	add    $0x1,%eax
093c   5d47ec:	38 c8                	cmp    %cl,%al
093e   5d47ee:	7c 08                	jl     5d47f8 <___bpf_prog_run+0x948>
0940   5d47f0:	84 c9                	test   %cl,%cl
0942   5d47f2:	0f 85 95 55 00 00    	jne    5d9d8d <___bpf_prog_run+0x5edd>
0948   5d47f8:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
094d   5d47fd:	49 01 f7             	add    %rsi,%r15
0950   5d4800:	4c 89 f8             	mov    %r15,%rax
0953   5d4803:	48 c1 e8 03          	shr    $0x3,%rax
0957   5d4807:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
095c   5d480c:	4c 89 f8             	mov    %r15,%rax
095f   5d480f:	83 e0 07             	and    $0x7,%eax
0962   5d4812:	83 c0 01             	add    $0x1,%eax
0965   5d4815:	38 c8                	cmp    %cl,%al
0967   5d4817:	7c 08                	jl     5d4821 <___bpf_prog_run+0x971>
0969   5d4819:	84 c9                	test   %cl,%cl
096b   5d481b:	0f 85 57 55 00 00    	jne    5d9d78 <___bpf_prog_run+0x5ec8>
0971   5d4821:	66 41 89 17          	mov    %dx,(%r15)
0975   5d4825:	48 83 c3 08          	add    $0x8,%rbx
0979   5d4829:	e9 c1 f6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
097e   5d482e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0982   5d4832:	48 89 f8             	mov    %rdi,%rax
0985   5d4835:	48 89 fa             	mov    %rdi,%rdx
0988   5d4838:	48 c1 e8 03          	shr    $0x3,%rax
098c   5d483c:	83 e2 07             	and    $0x7,%edx
098f   5d483f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0994   5d4844:	38 d0                	cmp    %dl,%al
0996   5d4846:	7f 08                	jg     5d4850 <___bpf_prog_run+0x9a0>
0998   5d4848:	84 c0                	test   %al,%al
099a   5d484a:	0f 85 b8 5b 00 00    	jne    5da408 <___bpf_prog_run+0x6558>
09a0   5d4850:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
09a4   5d4854:	83 e0 0f             	and    $0xf,%eax
09a7   5d4857:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
09ab   5d485b:	4c 89 f8             	mov    %r15,%rax
09ae   5d485e:	48 c1 e8 03          	shr    $0x3,%rax
09b2   5d4862:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09b7   5d4867:	0f 85 52 6a 00 00    	jne    5db2bf <___bpf_prog_run+0x740f>
09bd   5d486d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
09c1   5d4871:	49 8b 17             	mov    (%r15),%rdx
09c4   5d4874:	c0 e8 04             	shr    $0x4,%al
09c7   5d4877:	0f b6 c0             	movzbl %al,%eax
09ca   5d487a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
09ce   5d487e:	4c 89 f8             	mov    %r15,%rax
09d1   5d4881:	48 c1 e8 03          	shr    $0x3,%rax
09d5   5d4885:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09da   5d488a:	0f 85 56 6a 00 00    	jne    5db2e6 <___bpf_prog_run+0x7436>
09e0   5d4890:	41 39 17             	cmp    %edx,(%r15)
09e3   5d4893:	0f 8c 7a 43 00 00    	jl     5d8c13 <___bpf_prog_run+0x4d63>
09e9   5d4899:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
09ed   5d489d:	48 89 f8             	mov    %rdi,%rax
09f0   5d48a0:	48 c1 e8 03          	shr    $0x3,%rax
09f4   5d48a4:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
09f9   5d48a9:	48 89 f8             	mov    %rdi,%rax
09fc   5d48ac:	83 e0 07             	and    $0x7,%eax
09ff   5d48af:	83 c0 01             	add    $0x1,%eax
0a02   5d48b2:	38 d0                	cmp    %dl,%al
0a04   5d48b4:	7c 08                	jl     5d48be <___bpf_prog_run+0xa0e>
0a06   5d48b6:	84 d2                	test   %dl,%dl
0a08   5d48b8:	0f 85 a8 55 00 00    	jne    5d9e66 <___bpf_prog_run+0x5fb6>
0a0e   5d48be:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
0a13   5d48c3:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
0a18   5d48c8:	e9 22 f6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0a1d   5d48cd:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0a21   5d48d1:	48 89 f8             	mov    %rdi,%rax
0a24   5d48d4:	48 89 fa             	mov    %rdi,%rdx
0a27   5d48d7:	48 c1 e8 03          	shr    $0x3,%rax
0a2b   5d48db:	83 e2 07             	and    $0x7,%edx
0a2e   5d48de:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0a33   5d48e3:	38 d0                	cmp    %dl,%al
0a35   5d48e5:	7f 08                	jg     5d48ef <___bpf_prog_run+0xa3f>
0a37   5d48e7:	84 c0                	test   %al,%al
0a39   5d48e9:	0f 85 0f 5b 00 00    	jne    5da3fe <___bpf_prog_run+0x654e>
0a3f   5d48ef:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0a43   5d48f3:	c0 e8 04             	shr    $0x4,%al
0a46   5d48f6:	0f b6 c0             	movzbl %al,%eax
0a49   5d48f9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0a4d   5d48fd:	4c 89 f8             	mov    %r15,%rax
0a50   5d4900:	48 c1 e8 03          	shr    $0x3,%rax
0a54   5d4904:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0a59   5d4909:	0f 85 65 68 00 00    	jne    5db174 <___bpf_prog_run+0x72c4>
0a5f   5d490f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0a63   5d4913:	49 8b 0f             	mov    (%r15),%rcx
0a66   5d4916:	48 89 f8             	mov    %rdi,%rax
0a69   5d4919:	48 c1 e8 03          	shr    $0x3,%rax
0a6d   5d491d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0a72   5d4922:	48 89 f8             	mov    %rdi,%rax
0a75   5d4925:	83 e0 07             	and    $0x7,%eax
0a78   5d4928:	83 c0 01             	add    $0x1,%eax
0a7b   5d492b:	38 d0                	cmp    %dl,%al
0a7d   5d492d:	7c 08                	jl     5d4937 <___bpf_prog_run+0xa87>
0a7f   5d492f:	84 d2                	test   %dl,%dl
0a81   5d4931:	0f 85 b8 54 00 00    	jne    5d9def <___bpf_prog_run+0x5f3f>
0a87   5d4937:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0a8c   5d493c:	49 01 cf             	add    %rcx,%r15
0a8f   5d493f:	4c 89 f8             	mov    %r15,%rax
0a92   5d4942:	48 c1 e8 03          	shr    $0x3,%rax
0a96   5d4946:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0a9b   5d494b:	4c 89 f8             	mov    %r15,%rax
0a9e   5d494e:	83 e0 07             	and    $0x7,%eax
0aa1   5d4951:	83 c0 01             	add    $0x1,%eax
0aa4   5d4954:	38 d0                	cmp    %dl,%al
0aa6   5d4956:	7c 08                	jl     5d4960 <___bpf_prog_run+0xab0>
0aa8   5d4958:	84 d2                	test   %dl,%dl
0aaa   5d495a:	0f 85 82 54 00 00    	jne    5d9de2 <___bpf_prog_run+0x5f32>
0ab0   5d4960:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0ab4   5d4964:	45 0f b7 3f          	movzwl (%r15),%r15d
0ab8   5d4968:	83 e0 0f             	and    $0xf,%eax
0abb   5d496b:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0abf   5d496f:	48 89 c2             	mov    %rax,%rdx
0ac2   5d4972:	48 c1 ea 03          	shr    $0x3,%rdx
0ac6   5d4976:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0acb   5d497b:	0f 85 28 68 00 00    	jne    5db1a9 <___bpf_prog_run+0x72f9>
0ad1   5d4981:	4c 89 38             	mov    %r15,(%rax)
0ad4   5d4984:	48 83 c3 08          	add    $0x8,%rbx
0ad8   5d4988:	e9 62 f5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0add   5d498d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0ae1   5d4991:	48 89 f8             	mov    %rdi,%rax
0ae4   5d4994:	48 89 fa             	mov    %rdi,%rdx
0ae7   5d4997:	48 c1 e8 03          	shr    $0x3,%rax
0aeb   5d499b:	83 e2 07             	and    $0x7,%edx
0aee   5d499e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0af3   5d49a3:	38 d0                	cmp    %dl,%al
0af5   5d49a5:	7f 08                	jg     5d49af <___bpf_prog_run+0xaff>
0af7   5d49a7:	84 c0                	test   %al,%al
0af9   5d49a9:	0f 85 45 5a 00 00    	jne    5da3f4 <___bpf_prog_run+0x6544>
0aff   5d49af:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0b03   5d49b3:	83 e0 0f             	and    $0xf,%eax
0b06   5d49b6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0b0a   5d49ba:	4c 89 f8             	mov    %r15,%rax
0b0d   5d49bd:	48 c1 e8 03          	shr    $0x3,%rax
0b11   5d49c1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0b16   5d49c6:	0f 85 44 69 00 00    	jne    5db310 <___bpf_prog_run+0x7460>
0b1c   5d49cc:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0b20   5d49d0:	4d 8b 3f             	mov    (%r15),%r15
0b23   5d49d3:	48 89 f8             	mov    %rdi,%rax
0b26   5d49d6:	48 c1 e8 03          	shr    $0x3,%rax
0b2a   5d49da:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0b2f   5d49df:	48 89 f8             	mov    %rdi,%rax
0b32   5d49e2:	83 e0 07             	and    $0x7,%eax
0b35   5d49e5:	83 c0 03             	add    $0x3,%eax
0b38   5d49e8:	38 d0                	cmp    %dl,%al
0b3a   5d49ea:	7c 08                	jl     5d49f4 <___bpf_prog_run+0xb44>
0b3c   5d49ec:	84 d2                	test   %dl,%dl
0b3e   5d49ee:	0f 85 01 55 00 00    	jne    5d9ef5 <___bpf_prog_run+0x6045>
0b44   5d49f4:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
0b48   5d49f8:	0f 8f 27 42 00 00    	jg     5d8c25 <___bpf_prog_run+0x4d75>
0b4e   5d49fe:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0b52   5d4a02:	48 89 f8             	mov    %rdi,%rax
0b55   5d4a05:	48 c1 e8 03          	shr    $0x3,%rax
0b59   5d4a09:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0b5e   5d4a0e:	48 89 f8             	mov    %rdi,%rax
0b61   5d4a11:	83 e0 07             	and    $0x7,%eax
0b64   5d4a14:	83 c0 01             	add    $0x1,%eax
0b67   5d4a17:	38 d0                	cmp    %dl,%al
0b69   5d4a19:	7c 08                	jl     5d4a23 <___bpf_prog_run+0xb73>
0b6b   5d4a1b:	84 d2                	test   %dl,%dl
0b6d   5d4a1d:	0f 85 c8 54 00 00    	jne    5d9eeb <___bpf_prog_run+0x603b>
0b73   5d4a23:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
0b78   5d4a28:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
0b7d   5d4a2d:	e9 bd f4 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0b82   5d4a32:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0b86   5d4a36:	48 89 f8             	mov    %rdi,%rax
0b89   5d4a39:	48 89 fa             	mov    %rdi,%rdx
0b8c   5d4a3c:	48 c1 e8 03          	shr    $0x3,%rax
0b90   5d4a40:	83 e2 07             	and    $0x7,%edx
0b93   5d4a43:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0b98   5d4a48:	38 d0                	cmp    %dl,%al
0b9a   5d4a4a:	7f 08                	jg     5d4a54 <___bpf_prog_run+0xba4>
0b9c   5d4a4c:	84 c0                	test   %al,%al
0b9e   5d4a4e:	0f 85 96 59 00 00    	jne    5da3ea <___bpf_prog_run+0x653a>
0ba4   5d4a54:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0ba8   5d4a58:	c0 e8 04             	shr    $0x4,%al
0bab   5d4a5b:	0f b6 c0             	movzbl %al,%eax
0bae   5d4a5e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0bb2   5d4a62:	4c 89 f8             	mov    %r15,%rax
0bb5   5d4a65:	48 c1 e8 03          	shr    $0x3,%rax
0bb9   5d4a69:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0bbe   5d4a6e:	0f 85 86 67 00 00    	jne    5db1fa <___bpf_prog_run+0x734a>
0bc4   5d4a74:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0bc8   5d4a78:	49 8b 0f             	mov    (%r15),%rcx
0bcb   5d4a7b:	48 89 f8             	mov    %rdi,%rax
0bce   5d4a7e:	48 c1 e8 03          	shr    $0x3,%rax
0bd2   5d4a82:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0bd7   5d4a87:	48 89 f8             	mov    %rdi,%rax
0bda   5d4a8a:	83 e0 07             	and    $0x7,%eax
0bdd   5d4a8d:	83 c0 01             	add    $0x1,%eax
0be0   5d4a90:	38 d0                	cmp    %dl,%al
0be2   5d4a92:	7c 08                	jl     5d4a9c <___bpf_prog_run+0xbec>
0be4   5d4a94:	84 d2                	test   %dl,%dl
0be6   5d4a96:	0f 85 8f 52 00 00    	jne    5d9d2b <___bpf_prog_run+0x5e7b>
0bec   5d4a9c:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0bf1   5d4aa1:	49 01 cf             	add    %rcx,%r15
0bf4   5d4aa4:	4c 89 f8             	mov    %r15,%rax
0bf7   5d4aa7:	4c 89 fa             	mov    %r15,%rdx
0bfa   5d4aaa:	48 c1 e8 03          	shr    $0x3,%rax
0bfe   5d4aae:	83 e2 07             	and    $0x7,%edx
0c01   5d4ab1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0c06   5d4ab6:	38 d0                	cmp    %dl,%al
0c08   5d4ab8:	7f 08                	jg     5d4ac2 <___bpf_prog_run+0xc12>
0c0a   5d4aba:	84 c0                	test   %al,%al
0c0c   5d4abc:	0f 85 5c 52 00 00    	jne    5d9d1e <___bpf_prog_run+0x5e6e>
0c12   5d4ac2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0c16   5d4ac6:	45 0f b6 3f          	movzbl (%r15),%r15d
0c1a   5d4aca:	83 e0 0f             	and    $0xf,%eax
0c1d   5d4acd:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0c21   5d4ad1:	48 89 c2             	mov    %rax,%rdx
0c24   5d4ad4:	48 c1 ea 03          	shr    $0x3,%rdx
0c28   5d4ad8:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0c2d   5d4add:	0f 85 e8 66 00 00    	jne    5db1cb <___bpf_prog_run+0x731b>
0c33   5d4ae3:	4c 89 38             	mov    %r15,(%rax)
0c36   5d4ae6:	48 83 c3 08          	add    $0x8,%rbx
0c3a   5d4aea:	e9 00 f4 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0c3f   5d4aef:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0c43   5d4af3:	48 89 f8             	mov    %rdi,%rax
0c46   5d4af6:	48 89 fa             	mov    %rdi,%rdx
0c49   5d4af9:	48 c1 e8 03          	shr    $0x3,%rax
0c4d   5d4afd:	83 e2 07             	and    $0x7,%edx
0c50   5d4b00:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0c55   5d4b05:	38 d0                	cmp    %dl,%al
0c57   5d4b07:	7f 08                	jg     5d4b11 <___bpf_prog_run+0xc61>
0c59   5d4b09:	84 c0                	test   %al,%al
0c5b   5d4b0b:	0f 85 cf 58 00 00    	jne    5da3e0 <___bpf_prog_run+0x6530>
0c61   5d4b11:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0c65   5d4b15:	83 e0 0f             	and    $0xf,%eax
0c68   5d4b18:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0c6c   5d4b1c:	4c 89 f8             	mov    %r15,%rax
0c6f   5d4b1f:	48 c1 e8 03          	shr    $0x3,%rax
0c73   5d4b23:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0c78   5d4b28:	0f 85 9e 67 00 00    	jne    5db2cc <___bpf_prog_run+0x741c>
0c7e   5d4b2e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0c82   5d4b32:	4d 8b 3f             	mov    (%r15),%r15
0c85   5d4b35:	48 89 f8             	mov    %rdi,%rax
0c88   5d4b38:	48 c1 e8 03          	shr    $0x3,%rax
0c8c   5d4b3c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0c91   5d4b41:	48 89 f8             	mov    %rdi,%rax
0c94   5d4b44:	83 e0 07             	and    $0x7,%eax
0c97   5d4b47:	83 c0 03             	add    $0x3,%eax
0c9a   5d4b4a:	38 d0                	cmp    %dl,%al
0c9c   5d4b4c:	7c 08                	jl     5d4b56 <___bpf_prog_run+0xca6>
0c9e   5d4b4e:	84 d2                	test   %dl,%dl
0ca0   5d4b50:	0f 85 24 53 00 00    	jne    5d9e7a <___bpf_prog_run+0x5fca>
0ca6   5d4b56:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
0caa   5d4b5a:	0f 8c bc 40 00 00    	jl     5d8c1c <___bpf_prog_run+0x4d6c>
0cb0   5d4b60:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0cb4   5d4b64:	48 89 f8             	mov    %rdi,%rax
0cb7   5d4b67:	48 c1 e8 03          	shr    $0x3,%rax
0cbb   5d4b6b:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0cc0   5d4b70:	48 89 f8             	mov    %rdi,%rax
0cc3   5d4b73:	83 e0 07             	and    $0x7,%eax
0cc6   5d4b76:	83 c0 01             	add    $0x1,%eax
0cc9   5d4b79:	38 d0                	cmp    %dl,%al
0ccb   5d4b7b:	7c 08                	jl     5d4b85 <___bpf_prog_run+0xcd5>
0ccd   5d4b7d:	84 d2                	test   %dl,%dl
0ccf   5d4b7f:	0f 85 eb 52 00 00    	jne    5d9e70 <___bpf_prog_run+0x5fc0>
0cd5   5d4b85:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
0cda   5d4b8a:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
0cdf   5d4b8f:	e9 5b f3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0ce4   5d4b94:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
0ce8   5d4b98:	4c 89 f8             	mov    %r15,%rax
0ceb   5d4b9b:	4c 89 fa             	mov    %r15,%rdx
0cee   5d4b9e:	48 c1 e8 03          	shr    $0x3,%rax
0cf2   5d4ba2:	83 e2 07             	and    $0x7,%edx
0cf5   5d4ba5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0cfa   5d4baa:	38 d0                	cmp    %dl,%al
0cfc   5d4bac:	7f 08                	jg     5d4bb6 <___bpf_prog_run+0xd06>
0cfe   5d4bae:	84 c0                	test   %al,%al
0d00   5d4bb0:	0f 85 1d 58 00 00    	jne    5da3d3 <___bpf_prog_run+0x6523>
0d06   5d4bb6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0d0a   5d4bba:	c0 e8 04             	shr    $0x4,%al
0d0d   5d4bbd:	0f b6 c0             	movzbl %al,%eax
0d10   5d4bc0:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0d14   5d4bc4:	48 89 c2             	mov    %rax,%rdx
0d17   5d4bc7:	48 c1 ea 03          	shr    $0x3,%rdx
0d1b   5d4bcb:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0d20   5d4bd0:	0f 85 52 65 00 00    	jne    5db128 <___bpf_prog_run+0x7278>
0d26   5d4bd6:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0d2a   5d4bda:	48 8b 08             	mov    (%rax),%rcx
0d2d   5d4bdd:	48 89 f8             	mov    %rdi,%rax
0d30   5d4be0:	48 c1 e8 03          	shr    $0x3,%rax
0d34   5d4be4:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0d39   5d4be9:	48 89 f8             	mov    %rdi,%rax
0d3c   5d4bec:	83 e0 07             	and    $0x7,%eax
0d3f   5d4bef:	83 c0 01             	add    $0x1,%eax
0d42   5d4bf2:	38 d0                	cmp    %dl,%al
0d44   5d4bf4:	7c 08                	jl     5d4bfe <___bpf_prog_run+0xd4e>
0d46   5d4bf6:	84 d2                	test   %dl,%dl
0d48   5d4bf8:	0f 85 1d 52 00 00    	jne    5d9e1b <___bpf_prog_run+0x5f6b>
0d4e   5d4bfe:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0d52   5d4c02:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0d57   5d4c07:	be 02 00 00 00       	mov    $0x2,%esi
0d5c   5d4c0c:	83 e0 0f             	and    $0xf,%eax
0d5f   5d4c0f:	48 01 ca             	add    %rcx,%rdx
0d62   5d4c12:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
0d66   5d4c16:	e8 00 00 00 00       	call   5d4c1b <___bpf_prog_run+0xd6b>	5d4c17: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
0d6b   5d4c1b:	4c 89 f8             	mov    %r15,%rax
0d6e   5d4c1e:	4c 89 fa             	mov    %r15,%rdx
0d71   5d4c21:	48 c1 e8 03          	shr    $0x3,%rax
0d75   5d4c25:	83 e2 07             	and    $0x7,%edx
0d78   5d4c28:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0d7d   5d4c2d:	38 d0                	cmp    %dl,%al
0d7f   5d4c2f:	7f 08                	jg     5d4c39 <___bpf_prog_run+0xd89>
0d81   5d4c31:	84 c0                	test   %al,%al
0d83   5d4c33:	0f 85 d5 51 00 00    	jne    5d9e0e <___bpf_prog_run+0x5f5e>
0d89   5d4c39:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0d8d   5d4c3d:	83 e0 0f             	and    $0xf,%eax
0d90   5d4c40:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0d94   5d4c44:	4c 89 f8             	mov    %r15,%rax
0d97   5d4c47:	48 c1 e8 03          	shr    $0x3,%rax
0d9b   5d4c4b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0da0   5d4c50:	84 c0                	test   %al,%al
0da2   5d4c52:	74 08                	je     5d4c5c <___bpf_prog_run+0xdac>
0da4   5d4c54:	3c 01                	cmp    $0x1,%al
0da6   5d4c56:	0f 8e a5 51 00 00    	jle    5d9e01 <___bpf_prog_run+0x5f51>
0dac   5d4c5c:	4c 89 fa             	mov    %r15,%rdx
0daf   5d4c5f:	41 0f b7 07          	movzwl (%r15),%eax
0db3   5d4c63:	48 c1 ea 03          	shr    $0x3,%rdx
0db7   5d4c67:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0dbc   5d4c6c:	0f 85 0f 65 00 00    	jne    5db181 <___bpf_prog_run+0x72d1>
0dc2   5d4c72:	49 89 07             	mov    %rax,(%r15)
0dc5   5d4c75:	48 83 c3 08          	add    $0x8,%rbx
0dc9   5d4c79:	e9 71 f2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0dce   5d4c7e:	90                   	nop
0dcf   5d4c7f:	90                   	nop
0dd0   5d4c80:	90                   	nop
0dd1   5d4c81:	48 83 c3 08          	add    $0x8,%rbx
0dd5   5d4c85:	e9 65 f2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0dda   5d4c8a:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
0dde   5d4c8e:	4c 89 f8             	mov    %r15,%rax
0de1   5d4c91:	4c 89 fa             	mov    %r15,%rdx
0de4   5d4c94:	48 c1 e8 03          	shr    $0x3,%rax
0de8   5d4c98:	83 e2 07             	and    $0x7,%edx
0deb   5d4c9b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0df0   5d4ca0:	38 d0                	cmp    %dl,%al
0df2   5d4ca2:	7f 08                	jg     5d4cac <___bpf_prog_run+0xdfc>
0df4   5d4ca4:	84 c0                	test   %al,%al
0df6   5d4ca6:	0f 85 1a 57 00 00    	jne    5da3c6 <___bpf_prog_run+0x6516>
0dfc   5d4cac:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0e00   5d4cb0:	c0 e8 04             	shr    $0x4,%al
0e03   5d4cb3:	0f b6 c0             	movzbl %al,%eax
0e06   5d4cb6:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
0e0a   5d4cba:	48 89 c2             	mov    %rax,%rdx
0e0d   5d4cbd:	48 c1 ea 03          	shr    $0x3,%rdx
0e11   5d4cc1:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0e16   5d4cc6:	0f 85 2f 66 00 00    	jne    5db2fb <___bpf_prog_run+0x744b>
0e1c   5d4ccc:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0e20   5d4cd0:	48 8b 08             	mov    (%rax),%rcx
0e23   5d4cd3:	48 89 f8             	mov    %rdi,%rax
0e26   5d4cd6:	48 c1 e8 03          	shr    $0x3,%rax
0e2a   5d4cda:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0e2f   5d4cdf:	48 89 f8             	mov    %rdi,%rax
0e32   5d4ce2:	83 e0 07             	and    $0x7,%eax
0e35   5d4ce5:	83 c0 01             	add    $0x1,%eax
0e38   5d4ce8:	38 d0                	cmp    %dl,%al
0e3a   5d4cea:	7c 08                	jl     5d4cf4 <___bpf_prog_run+0xe44>
0e3c   5d4cec:	84 d2                	test   %dl,%dl
0e3e   5d4cee:	0f 85 e5 51 00 00    	jne    5d9ed9 <___bpf_prog_run+0x6029>
0e44   5d4cf4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0e48   5d4cf8:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
0e4d   5d4cfd:	be 01 00 00 00       	mov    $0x1,%esi
0e52   5d4d02:	83 e0 0f             	and    $0xf,%eax
0e55   5d4d05:	48 01 ca             	add    %rcx,%rdx
0e58   5d4d08:	49 8d 3c c6          	lea    (%r14,%rax,8),%rdi
0e5c   5d4d0c:	e8 00 00 00 00       	call   5d4d11 <___bpf_prog_run+0xe61>	5d4d0d: R_X86_64_PLT32	bpf_probe_read_kernel-0x4
0e61   5d4d11:	4c 89 f8             	mov    %r15,%rax
0e64   5d4d14:	4c 89 fa             	mov    %r15,%rdx
0e67   5d4d17:	48 c1 e8 03          	shr    $0x3,%rax
0e6b   5d4d1b:	83 e2 07             	and    $0x7,%edx
0e6e   5d4d1e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0e73   5d4d23:	38 d0                	cmp    %dl,%al
0e75   5d4d25:	7f 08                	jg     5d4d2f <___bpf_prog_run+0xe7f>
0e77   5d4d27:	84 c0                	test   %al,%al
0e79   5d4d29:	0f 85 9d 51 00 00    	jne    5d9ecc <___bpf_prog_run+0x601c>
0e7f   5d4d2f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0e83   5d4d33:	83 e0 0f             	and    $0xf,%eax
0e86   5d4d36:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0e8a   5d4d3a:	4c 89 f8             	mov    %r15,%rax
0e8d   5d4d3d:	48 c1 e8 03          	shr    $0x3,%rax
0e91   5d4d41:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0e96   5d4d46:	84 c0                	test   %al,%al
0e98   5d4d48:	74 06                	je     5d4d50 <___bpf_prog_run+0xea0>
0e9a   5d4d4a:	0f 8e 6f 51 00 00    	jle    5d9ebf <___bpf_prog_run+0x600f>
0ea0   5d4d50:	4c 89 fa             	mov    %r15,%rdx
0ea3   5d4d53:	41 0f b6 07          	movzbl (%r15),%eax
0ea7   5d4d57:	48 c1 ea 03          	shr    $0x3,%rdx
0eab   5d4d5b:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
0eb0   5d4d60:	0f 85 1a 5f 00 00    	jne    5dac80 <___bpf_prog_run+0x6dd0>
0eb6   5d4d66:	49 89 07             	mov    %rax,(%r15)
0eb9   5d4d69:	48 83 c3 08          	add    $0x8,%rbx
0ebd   5d4d6d:	e9 7d f1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0ec2   5d4d72:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0ec6   5d4d76:	48 89 f8             	mov    %rdi,%rax
0ec9   5d4d79:	48 c1 e8 03          	shr    $0x3,%rax
0ecd   5d4d7d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0ed2   5d4d82:	48 89 f8             	mov    %rdi,%rax
0ed5   5d4d85:	83 e0 07             	and    $0x7,%eax
0ed8   5d4d88:	83 c0 03             	add    $0x3,%eax
0edb   5d4d8b:	38 d0                	cmp    %dl,%al
0edd   5d4d8d:	7c 08                	jl     5d4d97 <___bpf_prog_run+0xee7>
0edf   5d4d8f:	84 d2                	test   %dl,%dl
0ee1   5d4d91:	0f 85 25 56 00 00    	jne    5da3bc <___bpf_prog_run+0x650c>
0ee7   5d4d97:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0eeb   5d4d9b:	8b 53 04             	mov    0x4(%rbx),%edx
0eee   5d4d9e:	48 89 f8             	mov    %rdi,%rax
0ef1   5d4da1:	48 89 f9             	mov    %rdi,%rcx
0ef4   5d4da4:	48 c1 e8 03          	shr    $0x3,%rax
0ef8   5d4da8:	83 e1 07             	and    $0x7,%ecx
0efb   5d4dab:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0f00   5d4db0:	38 c8                	cmp    %cl,%al
0f02   5d4db2:	7f 08                	jg     5d4dbc <___bpf_prog_run+0xf0c>
0f04   5d4db4:	84 c0                	test   %al,%al
0f06   5d4db6:	0f 85 ac 4f 00 00    	jne    5d9d68 <___bpf_prog_run+0x5eb8>
0f0c   5d4dbc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0f10   5d4dc0:	83 e0 0f             	and    $0xf,%eax
0f13   5d4dc3:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0f17   5d4dc7:	4c 89 f8             	mov    %r15,%rax
0f1a   5d4dca:	48 c1 e8 03          	shr    $0x3,%rax
0f1e   5d4dce:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0f23   5d4dd3:	0f 85 2e 64 00 00    	jne    5db207 <___bpf_prog_run+0x7357>
0f29   5d4dd9:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0f2d   5d4ddd:	49 8b 37             	mov    (%r15),%rsi
0f30   5d4de0:	48 89 f8             	mov    %rdi,%rax
0f33   5d4de3:	48 c1 e8 03          	shr    $0x3,%rax
0f37   5d4de7:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
0f3c   5d4dec:	48 89 f8             	mov    %rdi,%rax
0f3f   5d4def:	83 e0 07             	and    $0x7,%eax
0f42   5d4df2:	83 c0 01             	add    $0x1,%eax
0f45   5d4df5:	38 c8                	cmp    %cl,%al
0f47   5d4df7:	7c 08                	jl     5d4e01 <___bpf_prog_run+0xf51>
0f49   5d4df9:	84 c9                	test   %cl,%cl
0f4b   5d4dfb:	0f 85 4f 4f 00 00    	jne    5d9d50 <___bpf_prog_run+0x5ea0>
0f51   5d4e01:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
0f56   5d4e06:	49 01 f7             	add    %rsi,%r15
0f59   5d4e09:	4c 89 f8             	mov    %r15,%rax
0f5c   5d4e0c:	4c 89 f9             	mov    %r15,%rcx
0f5f   5d4e0f:	48 c1 e8 03          	shr    $0x3,%rax
0f63   5d4e13:	83 e1 07             	and    $0x7,%ecx
0f66   5d4e16:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0f6b   5d4e1b:	38 c8                	cmp    %cl,%al
0f6d   5d4e1d:	7f 08                	jg     5d4e27 <___bpf_prog_run+0xf77>
0f6f   5d4e1f:	84 c0                	test   %al,%al
0f71   5d4e21:	0f 85 16 4f 00 00    	jne    5d9d3d <___bpf_prog_run+0x5e8d>
0f77   5d4e27:	41 88 17             	mov    %dl,(%r15)
0f7a   5d4e2a:	48 83 c3 08          	add    $0x8,%rbx
0f7e   5d4e2e:	e9 bc f0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
0f83   5d4e33:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
0f87   5d4e37:	48 89 f8             	mov    %rdi,%rax
0f8a   5d4e3a:	48 89 fa             	mov    %rdi,%rdx
0f8d   5d4e3d:	48 c1 e8 03          	shr    $0x3,%rax
0f91   5d4e41:	83 e2 07             	and    $0x7,%edx
0f94   5d4e44:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0f99   5d4e49:	38 d0                	cmp    %dl,%al
0f9b   5d4e4b:	7f 08                	jg     5d4e55 <___bpf_prog_run+0xfa5>
0f9d   5d4e4d:	84 c0                	test   %al,%al
0f9f   5d4e4f:	0f 85 5d 55 00 00    	jne    5da3b2 <___bpf_prog_run+0x6502>
0fa5   5d4e55:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0fa9   5d4e59:	83 e0 0f             	and    $0xf,%eax
0fac   5d4e5c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0fb0   5d4e60:	4c 89 f8             	mov    %r15,%rax
0fb3   5d4e63:	48 c1 e8 03          	shr    $0x3,%rax
0fb7   5d4e67:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0fbc   5d4e6c:	0f 85 67 64 00 00    	jne    5db2d9 <___bpf_prog_run+0x7429>
0fc2   5d4e72:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
0fc6   5d4e76:	49 8b 17             	mov    (%r15),%rdx
0fc9   5d4e79:	c0 e8 04             	shr    $0x4,%al
0fcc   5d4e7c:	0f b6 c0             	movzbl %al,%eax
0fcf   5d4e7f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
0fd3   5d4e83:	4c 89 f8             	mov    %r15,%rax
0fd6   5d4e86:	48 c1 e8 03          	shr    $0x3,%rax
0fda   5d4e8a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0fdf   5d4e8f:	0f 85 ca 62 00 00    	jne    5db15f <___bpf_prog_run+0x72af>
0fe5   5d4e95:	49 3b 17             	cmp    (%r15),%rdx
0fe8   5d4e98:	0f 8f 6c 3d 00 00    	jg     5d8c0a <___bpf_prog_run+0x4d5a>
0fee   5d4e9e:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
0ff2   5d4ea2:	48 89 f8             	mov    %rdi,%rax
0ff5   5d4ea5:	48 c1 e8 03          	shr    $0x3,%rax
0ff9   5d4ea9:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
0ffe   5d4eae:	48 89 f8             	mov    %rdi,%rax
1001   5d4eb1:	83 e0 07             	and    $0x7,%eax
1004   5d4eb4:	83 c0 01             	add    $0x1,%eax
1007   5d4eb7:	38 d0                	cmp    %dl,%al
1009   5d4eb9:	7c 08                	jl     5d4ec3 <___bpf_prog_run+0x1013>
100b   5d4ebb:	84 d2                	test   %dl,%dl
100d   5d4ebd:	0f 85 99 4f 00 00    	jne    5d9e5c <___bpf_prog_run+0x5fac>
1013   5d4ec3:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1018   5d4ec8:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
101d   5d4ecd:	e9 1d f0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1022   5d4ed2:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1026   5d4ed6:	48 89 f8             	mov    %rdi,%rax
1029   5d4ed9:	48 c1 e8 03          	shr    $0x3,%rax
102d   5d4edd:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1032   5d4ee2:	48 89 f8             	mov    %rdi,%rax
1035   5d4ee5:	83 e0 07             	and    $0x7,%eax
1038   5d4ee8:	83 c0 03             	add    $0x3,%eax
103b   5d4eeb:	38 d0                	cmp    %dl,%al
103d   5d4eed:	7c 08                	jl     5d4ef7 <___bpf_prog_run+0x1047>
103f   5d4eef:	84 d2                	test   %dl,%dl
1041   5d4ef1:	0f 85 b1 54 00 00    	jne    5da3a8 <___bpf_prog_run+0x64f8>
1047   5d4ef7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
104b   5d4efb:	8b 53 04             	mov    0x4(%rbx),%edx
104e   5d4efe:	48 89 f8             	mov    %rdi,%rax
1051   5d4f01:	48 89 f9             	mov    %rdi,%rcx
1054   5d4f04:	48 c1 e8 03          	shr    $0x3,%rax
1058   5d4f08:	83 e1 07             	and    $0x7,%ecx
105b   5d4f0b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1060   5d4f10:	38 c8                	cmp    %cl,%al
1062   5d4f12:	7f 08                	jg     5d4f1c <___bpf_prog_run+0x106c>
1064   5d4f14:	84 c0                	test   %al,%al
1066   5d4f16:	0f 85 b6 4e 00 00    	jne    5d9dd2 <___bpf_prog_run+0x5f22>
106c   5d4f1c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1070   5d4f20:	83 e0 0f             	and    $0xf,%eax
1073   5d4f23:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1077   5d4f27:	4c 89 f8             	mov    %r15,%rax
107a   5d4f2a:	48 c1 e8 03          	shr    $0x3,%rax
107e   5d4f2e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1083   5d4f33:	0f 85 5d 62 00 00    	jne    5db196 <___bpf_prog_run+0x72e6>
1089   5d4f39:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
108d   5d4f3d:	49 8b 37             	mov    (%r15),%rsi
1090   5d4f40:	48 89 f8             	mov    %rdi,%rax
1093   5d4f43:	48 c1 e8 03          	shr    $0x3,%rax
1097   5d4f47:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
109c   5d4f4c:	48 89 f8             	mov    %rdi,%rax
109f   5d4f4f:	83 e0 07             	and    $0x7,%eax
10a2   5d4f52:	83 c0 01             	add    $0x1,%eax
10a5   5d4f55:	38 c8                	cmp    %cl,%al
10a7   5d4f57:	7c 08                	jl     5d4f61 <___bpf_prog_run+0x10b1>
10a9   5d4f59:	84 c9                	test   %cl,%cl
10ab   5d4f5b:	0f 85 59 4e 00 00    	jne    5d9dba <___bpf_prog_run+0x5f0a>
10b1   5d4f61:	4c 0f bf 7b 02       	movswq 0x2(%rbx),%r15
10b6   5d4f66:	49 01 f7             	add    %rsi,%r15
10b9   5d4f69:	4c 89 f8             	mov    %r15,%rax
10bc   5d4f6c:	48 c1 e8 03          	shr    $0x3,%rax
10c0   5d4f70:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
10c5   5d4f75:	4c 89 f8             	mov    %r15,%rax
10c8   5d4f78:	83 e0 07             	and    $0x7,%eax
10cb   5d4f7b:	83 c0 01             	add    $0x1,%eax
10ce   5d4f7e:	38 c8                	cmp    %cl,%al
10d0   5d4f80:	7c 08                	jl     5d4f8a <___bpf_prog_run+0x10da>
10d2   5d4f82:	84 c9                	test   %cl,%cl
10d4   5d4f84:	0f 85 1d 4e 00 00    	jne    5d9da7 <___bpf_prog_run+0x5ef7>
10da   5d4f8a:	66 41 89 17          	mov    %dx,(%r15)
10de   5d4f8e:	48 83 c3 08          	add    $0x8,%rbx
10e2   5d4f92:	e9 58 ef ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
10e7   5d4f97:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
10eb   5d4f9b:	48 89 f8             	mov    %rdi,%rax
10ee   5d4f9e:	48 89 fa             	mov    %rdi,%rdx
10f1   5d4fa1:	48 c1 e8 03          	shr    $0x3,%rax
10f5   5d4fa5:	83 e2 07             	and    $0x7,%edx
10f8   5d4fa8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
10fd   5d4fad:	38 d0                	cmp    %dl,%al
10ff   5d4faf:	7f 08                	jg     5d4fb9 <___bpf_prog_run+0x1109>
1101   5d4fb1:	84 c0                	test   %al,%al
1103   5d4fb3:	0f 85 e5 53 00 00    	jne    5da39e <___bpf_prog_run+0x64ee>
1109   5d4fb9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
110d   5d4fbd:	83 e0 0f             	and    $0xf,%eax
1110   5d4fc0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1114   5d4fc4:	4c 89 f8             	mov    %r15,%rax
1117   5d4fc7:	48 c1 e8 03          	shr    $0x3,%rax
111b   5d4fcb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1120   5d4fd0:	0f 85 e8 61 00 00    	jne    5db1be <___bpf_prog_run+0x730e>
1126   5d4fd6:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
112a   5d4fda:	4d 8b 3f             	mov    (%r15),%r15
112d   5d4fdd:	48 89 f8             	mov    %rdi,%rax
1130   5d4fe0:	48 c1 e8 03          	shr    $0x3,%rax
1134   5d4fe4:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1139   5d4fe9:	48 89 f8             	mov    %rdi,%rax
113c   5d4fec:	83 e0 07             	and    $0x7,%eax
113f   5d4fef:	83 c0 03             	add    $0x3,%eax
1142   5d4ff2:	38 d0                	cmp    %dl,%al
1144   5d4ff4:	7c 08                	jl     5d4ffe <___bpf_prog_run+0x114e>
1146   5d4ff6:	84 d2                	test   %dl,%dl
1148   5d4ff8:	0f 85 16 4d 00 00    	jne    5d9d14 <___bpf_prog_run+0x5e64>
114e   5d4ffe:	48 63 43 04          	movslq 0x4(%rbx),%rax
1152   5d5002:	49 39 c7             	cmp    %rax,%r15
1155   5d5005:	0f 8f f6 3b 00 00    	jg     5d8c01 <___bpf_prog_run+0x4d51>
115b   5d500b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
115f   5d500f:	48 89 f8             	mov    %rdi,%rax
1162   5d5012:	48 c1 e8 03          	shr    $0x3,%rax
1166   5d5016:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
116b   5d501b:	48 89 f8             	mov    %rdi,%rax
116e   5d501e:	83 e0 07             	and    $0x7,%eax
1171   5d5021:	83 c0 01             	add    $0x1,%eax
1174   5d5024:	38 d0                	cmp    %dl,%al
1176   5d5026:	7c 08                	jl     5d5030 <___bpf_prog_run+0x1180>
1178   5d5028:	84 d2                	test   %dl,%dl
117a   5d502a:	0f 85 da 4c 00 00    	jne    5d9d0a <___bpf_prog_run+0x5e5a>
1180   5d5030:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1185   5d5035:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
118a   5d503a:	e9 b0 ee ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
118f   5d503f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1193   5d5043:	48 89 f8             	mov    %rdi,%rax
1196   5d5046:	48 89 fa             	mov    %rdi,%rdx
1199   5d5049:	48 c1 e8 03          	shr    $0x3,%rax
119d   5d504d:	83 e2 07             	and    $0x7,%edx
11a0   5d5050:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
11a5   5d5055:	38 d0                	cmp    %dl,%al
11a7   5d5057:	7f 08                	jg     5d5061 <___bpf_prog_run+0x11b1>
11a9   5d5059:	84 c0                	test   %al,%al
11ab   5d505b:	0f 85 33 53 00 00    	jne    5da394 <___bpf_prog_run+0x64e4>
11b1   5d5061:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
11b5   5d5065:	83 e0 0f             	and    $0xf,%eax
11b8   5d5068:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
11bc   5d506c:	4c 89 f8             	mov    %r15,%rax
11bf   5d506f:	48 c1 e8 03          	shr    $0x3,%rax
11c3   5d5073:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
11c8   5d5078:	0f 85 6f 61 00 00    	jne    5db1ed <___bpf_prog_run+0x733d>
11ce   5d507e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
11d2   5d5082:	4d 8b 3f             	mov    (%r15),%r15
11d5   5d5085:	48 89 f8             	mov    %rdi,%rax
11d8   5d5088:	48 c1 e8 03          	shr    $0x3,%rax
11dc   5d508c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
11e1   5d5091:	48 89 f8             	mov    %rdi,%rax
11e4   5d5094:	83 e0 07             	and    $0x7,%eax
11e7   5d5097:	83 c0 03             	add    $0x3,%eax
11ea   5d509a:	38 d0                	cmp    %dl,%al
11ec   5d509c:	7c 08                	jl     5d50a6 <___bpf_prog_run+0x11f6>
11ee   5d509e:	84 d2                	test   %dl,%dl
11f0   5d50a0:	0f 85 5a 4c 00 00    	jne    5d9d00 <___bpf_prog_run+0x5e50>
11f6   5d50a6:	48 63 43 04          	movslq 0x4(%rbx),%rax
11fa   5d50aa:	49 39 c7             	cmp    %rax,%r15
11fd   5d50ad:	0f 8c 45 3b 00 00    	jl     5d8bf8 <___bpf_prog_run+0x4d48>
1203   5d50b3:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1207   5d50b7:	48 89 f8             	mov    %rdi,%rax
120a   5d50ba:	48 c1 e8 03          	shr    $0x3,%rax
120e   5d50be:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1213   5d50c3:	48 89 f8             	mov    %rdi,%rax
1216   5d50c6:	83 e0 07             	and    $0x7,%eax
1219   5d50c9:	83 c0 01             	add    $0x1,%eax
121c   5d50cc:	38 d0                	cmp    %dl,%al
121e   5d50ce:	7c 08                	jl     5d50d8 <___bpf_prog_run+0x1228>
1220   5d50d0:	84 d2                	test   %dl,%dl
1222   5d50d2:	0f 85 1e 4c 00 00    	jne    5d9cf6 <___bpf_prog_run+0x5e46>
1228   5d50d8:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
122d   5d50dd:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1232   5d50e2:	e9 08 ee ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1237   5d50e7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
123b   5d50eb:	48 89 f8             	mov    %rdi,%rax
123e   5d50ee:	48 89 fa             	mov    %rdi,%rdx
1241   5d50f1:	48 c1 e8 03          	shr    $0x3,%rax
1245   5d50f5:	83 e2 07             	and    $0x7,%edx
1248   5d50f8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
124d   5d50fd:	38 d0                	cmp    %dl,%al
124f   5d50ff:	7f 08                	jg     5d5109 <___bpf_prog_run+0x1259>
1251   5d5101:	84 c0                	test   %al,%al
1253   5d5103:	0f 85 81 52 00 00    	jne    5da38a <___bpf_prog_run+0x64da>
1259   5d5109:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
125d   5d510d:	83 e0 0f             	and    $0xf,%eax
1260   5d5110:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1264   5d5114:	4c 89 f8             	mov    %r15,%rax
1267   5d5117:	48 c1 e8 03          	shr    $0x3,%rax
126b   5d511b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1270   5d5120:	0f 85 75 5f 00 00    	jne    5db09b <___bpf_prog_run+0x71eb>
1276   5d5126:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
127a   5d512a:	49 8b 17             	mov    (%r15),%rdx
127d   5d512d:	c0 e8 04             	shr    $0x4,%al
1280   5d5130:	0f b6 c0             	movzbl %al,%eax
1283   5d5133:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1287   5d5137:	4c 89 f8             	mov    %r15,%rax
128a   5d513a:	48 c1 e8 03          	shr    $0x3,%rax
128e   5d513e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1293   5d5143:	0f 85 3d 5f 00 00    	jne    5db086 <___bpf_prog_run+0x71d6>
1299   5d5149:	41 39 17             	cmp    %edx,(%r15)
129c   5d514c:	0f 8f 1f 3a 00 00    	jg     5d8b71 <___bpf_prog_run+0x4cc1>
12a2   5d5152:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
12a6   5d5156:	48 89 f8             	mov    %rdi,%rax
12a9   5d5159:	48 c1 e8 03          	shr    $0x3,%rax
12ad   5d515d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
12b2   5d5162:	48 89 f8             	mov    %rdi,%rax
12b5   5d5165:	83 e0 07             	and    $0x7,%eax
12b8   5d5168:	83 c0 01             	add    $0x1,%eax
12bb   5d516b:	38 d0                	cmp    %dl,%al
12bd   5d516d:	7c 08                	jl     5d5177 <___bpf_prog_run+0x12c7>
12bf   5d516f:	84 d2                	test   %dl,%dl
12c1   5d5171:	0f 85 c5 48 00 00    	jne    5d9a3c <___bpf_prog_run+0x5b8c>
12c7   5d5177:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
12cc   5d517c:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
12d1   5d5181:	e9 69 ed ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
12d6   5d5186:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
12da   5d518a:	48 89 f8             	mov    %rdi,%rax
12dd   5d518d:	48 89 fa             	mov    %rdi,%rdx
12e0   5d5190:	48 c1 e8 03          	shr    $0x3,%rax
12e4   5d5194:	83 e2 07             	and    $0x7,%edx
12e7   5d5197:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
12ec   5d519c:	38 d0                	cmp    %dl,%al
12ee   5d519e:	7f 08                	jg     5d51a8 <___bpf_prog_run+0x12f8>
12f0   5d51a0:	84 c0                	test   %al,%al
12f2   5d51a2:	0f 85 d8 51 00 00    	jne    5da380 <___bpf_prog_run+0x64d0>
12f8   5d51a8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
12fc   5d51ac:	83 e0 0f             	and    $0xf,%eax
12ff   5d51af:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1303   5d51b3:	4c 89 f8             	mov    %r15,%rax
1306   5d51b6:	48 c1 e8 03          	shr    $0x3,%rax
130a   5d51ba:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
130f   5d51bf:	0f 85 e4 59 00 00    	jne    5daba9 <___bpf_prog_run+0x6cf9>
1315   5d51c5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1319   5d51c9:	49 8b 17             	mov    (%r15),%rdx
131c   5d51cc:	c0 e8 04             	shr    $0x4,%al
131f   5d51cf:	0f b6 c0             	movzbl %al,%eax
1322   5d51d2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1326   5d51d6:	4c 89 f8             	mov    %r15,%rax
1329   5d51d9:	48 c1 e8 03          	shr    $0x3,%rax
132d   5d51dd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1332   5d51e2:	0f 85 ac 59 00 00    	jne    5dab94 <___bpf_prog_run+0x6ce4>
1338   5d51e8:	41 39 17             	cmp    %edx,(%r15)
133b   5d51eb:	0f 82 c8 39 00 00    	jb     5d8bb9 <___bpf_prog_run+0x4d09>
1341   5d51f1:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1345   5d51f5:	48 89 f8             	mov    %rdi,%rax
1348   5d51f8:	48 c1 e8 03          	shr    $0x3,%rax
134c   5d51fc:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1351   5d5201:	48 89 f8             	mov    %rdi,%rax
1354   5d5204:	83 e0 07             	and    $0x7,%eax
1357   5d5207:	83 c0 01             	add    $0x1,%eax
135a   5d520a:	38 d0                	cmp    %dl,%al
135c   5d520c:	7c 08                	jl     5d5216 <___bpf_prog_run+0x1366>
135e   5d520e:	84 d2                	test   %dl,%dl
1360   5d5210:	0f 85 7c 4a 00 00    	jne    5d9c92 <___bpf_prog_run+0x5de2>
1366   5d5216:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
136b   5d521b:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1370   5d5220:	e9 ca ec ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1375   5d5225:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1379   5d5229:	48 89 f8             	mov    %rdi,%rax
137c   5d522c:	48 89 fa             	mov    %rdi,%rdx
137f   5d522f:	48 c1 e8 03          	shr    $0x3,%rax
1383   5d5233:	83 e2 07             	and    $0x7,%edx
1386   5d5236:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
138b   5d523b:	38 d0                	cmp    %dl,%al
138d   5d523d:	7f 08                	jg     5d5247 <___bpf_prog_run+0x1397>
138f   5d523f:	84 c0                	test   %al,%al
1391   5d5241:	0f 85 2f 51 00 00    	jne    5da376 <___bpf_prog_run+0x64c6>
1397   5d5247:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
139b   5d524b:	83 e0 0f             	and    $0xf,%eax
139e   5d524e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
13a2   5d5252:	4c 89 f8             	mov    %r15,%rax
13a5   5d5255:	48 c1 e8 03          	shr    $0x3,%rax
13a9   5d5259:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
13ae   5d525e:	0f 85 b7 5e 00 00    	jne    5db11b <___bpf_prog_run+0x726b>
13b4   5d5264:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
13b8   5d5268:	49 8b 17             	mov    (%r15),%rdx
13bb   5d526b:	c0 e8 04             	shr    $0x4,%al
13be   5d526e:	0f b6 c0             	movzbl %al,%eax
13c1   5d5271:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
13c5   5d5275:	4c 89 f8             	mov    %r15,%rax
13c8   5d5278:	48 c1 e8 03          	shr    $0x3,%rax
13cc   5d527c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
13d1   5d5281:	0f 85 7f 5e 00 00    	jne    5db106 <___bpf_prog_run+0x7256>
13d7   5d5287:	41 39 17             	cmp    %edx,(%r15)
13da   5d528a:	0f 8d 99 38 00 00    	jge    5d8b29 <___bpf_prog_run+0x4c79>
13e0   5d5290:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
13e4   5d5294:	48 89 f8             	mov    %rdi,%rax
13e7   5d5297:	48 c1 e8 03          	shr    $0x3,%rax
13eb   5d529b:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
13f0   5d52a0:	48 89 f8             	mov    %rdi,%rax
13f3   5d52a3:	83 e0 07             	and    $0x7,%eax
13f6   5d52a6:	83 c0 01             	add    $0x1,%eax
13f9   5d52a9:	38 d0                	cmp    %dl,%al
13fb   5d52ab:	7c 08                	jl     5d52b5 <___bpf_prog_run+0x1405>
13fd   5d52ad:	84 d2                	test   %dl,%dl
13ff   5d52af:	0f 85 0f 47 00 00    	jne    5d99c4 <___bpf_prog_run+0x5b14>
1405   5d52b5:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
140a   5d52ba:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
140f   5d52bf:	e9 2b ec ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1414   5d52c4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1418   5d52c8:	48 89 f8             	mov    %rdi,%rax
141b   5d52cb:	48 89 fa             	mov    %rdi,%rdx
141e   5d52ce:	48 c1 e8 03          	shr    $0x3,%rax
1422   5d52d2:	83 e2 07             	and    $0x7,%edx
1425   5d52d5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
142a   5d52da:	38 d0                	cmp    %dl,%al
142c   5d52dc:	7f 08                	jg     5d52e6 <___bpf_prog_run+0x1436>
142e   5d52de:	84 c0                	test   %al,%al
1430   5d52e0:	0f 85 86 50 00 00    	jne    5da36c <___bpf_prog_run+0x64bc>
1436   5d52e6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
143a   5d52ea:	83 e0 0f             	and    $0xf,%eax
143d   5d52ed:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1441   5d52f1:	4c 89 f8             	mov    %r15,%rax
1444   5d52f4:	48 c1 e8 03          	shr    $0x3,%rax
1448   5d52f8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
144d   5d52fd:	0f 85 04 58 00 00    	jne    5dab07 <___bpf_prog_run+0x6c57>
1453   5d5303:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1457   5d5307:	49 8b 17             	mov    (%r15),%rdx
145a   5d530a:	c0 e8 04             	shr    $0x4,%al
145d   5d530d:	0f b6 c0             	movzbl %al,%eax
1460   5d5310:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1464   5d5314:	4c 89 f8             	mov    %r15,%rax
1467   5d5317:	48 c1 e8 03          	shr    $0x3,%rax
146b   5d531b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1470   5d5320:	0f 85 cc 57 00 00    	jne    5daaf2 <___bpf_prog_run+0x6c42>
1476   5d5326:	41 39 17             	cmp    %edx,(%r15)
1479   5d5329:	0f 86 ae 38 00 00    	jbe    5d8bdd <___bpf_prog_run+0x4d2d>
147f   5d532f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1483   5d5333:	48 89 f8             	mov    %rdi,%rax
1486   5d5336:	48 c1 e8 03          	shr    $0x3,%rax
148a   5d533a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
148f   5d533f:	48 89 f8             	mov    %rdi,%rax
1492   5d5342:	83 e0 07             	and    $0x7,%eax
1495   5d5345:	83 c0 01             	add    $0x1,%eax
1498   5d5348:	38 d0                	cmp    %dl,%al
149a   5d534a:	7c 08                	jl     5d5354 <___bpf_prog_run+0x14a4>
149c   5d534c:	84 d2                	test   %dl,%dl
149e   5d534e:	0f 85 7a 49 00 00    	jne    5d9cce <___bpf_prog_run+0x5e1e>
14a4   5d5354:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
14a9   5d5359:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
14ae   5d535e:	e9 8c eb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
14b3   5d5363:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
14b7   5d5367:	48 89 f8             	mov    %rdi,%rax
14ba   5d536a:	48 89 fa             	mov    %rdi,%rdx
14bd   5d536d:	48 c1 e8 03          	shr    $0x3,%rax
14c1   5d5371:	83 e2 07             	and    $0x7,%edx
14c4   5d5374:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
14c9   5d5379:	38 d0                	cmp    %dl,%al
14cb   5d537b:	7f 08                	jg     5d5385 <___bpf_prog_run+0x14d5>
14cd   5d537d:	84 c0                	test   %al,%al
14cf   5d537f:	0f 85 dd 4f 00 00    	jne    5da362 <___bpf_prog_run+0x64b2>
14d5   5d5385:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
14d9   5d5389:	83 e0 0f             	and    $0xf,%eax
14dc   5d538c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
14e0   5d5390:	4c 89 f8             	mov    %r15,%rax
14e3   5d5393:	48 c1 e8 03          	shr    $0x3,%rax
14e7   5d5397:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
14ec   5d539c:	0f 85 9b 5c 00 00    	jne    5db03d <___bpf_prog_run+0x718d>
14f2   5d53a2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
14f6   5d53a6:	49 8b 17             	mov    (%r15),%rdx
14f9   5d53a9:	c0 e8 04             	shr    $0x4,%al
14fc   5d53ac:	0f b6 c0             	movzbl %al,%eax
14ff   5d53af:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1503   5d53b3:	4c 89 f8             	mov    %r15,%rax
1506   5d53b6:	48 c1 e8 03          	shr    $0x3,%rax
150a   5d53ba:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
150f   5d53bf:	0f 85 63 5c 00 00    	jne    5db028 <___bpf_prog_run+0x7178>
1515   5d53c5:	41 39 17             	cmp    %edx,(%r15)
1518   5d53c8:	0f 8e 7f 37 00 00    	jle    5d8b4d <___bpf_prog_run+0x4c9d>
151e   5d53ce:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1522   5d53d2:	48 89 f8             	mov    %rdi,%rax
1525   5d53d5:	48 c1 e8 03          	shr    $0x3,%rax
1529   5d53d9:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
152e   5d53de:	48 89 f8             	mov    %rdi,%rax
1531   5d53e1:	83 e0 07             	and    $0x7,%eax
1534   5d53e4:	83 c0 01             	add    $0x1,%eax
1537   5d53e7:	38 d0                	cmp    %dl,%al
1539   5d53e9:	7c 08                	jl     5d53f3 <___bpf_prog_run+0x1543>
153b   5d53eb:	84 d2                	test   %dl,%dl
153d   5d53ed:	0f 85 0d 46 00 00    	jne    5d9a00 <___bpf_prog_run+0x5b50>
1543   5d53f3:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1548   5d53f8:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
154d   5d53fd:	e9 ed ea ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1552   5d5402:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1556   5d5406:	48 89 f8             	mov    %rdi,%rax
1559   5d5409:	48 89 fa             	mov    %rdi,%rdx
155c   5d540c:	48 c1 e8 03          	shr    $0x3,%rax
1560   5d5410:	83 e2 07             	and    $0x7,%edx
1563   5d5413:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1568   5d5418:	38 d0                	cmp    %dl,%al
156a   5d541a:	7f 08                	jg     5d5424 <___bpf_prog_run+0x1574>
156c   5d541c:	84 c0                	test   %al,%al
156e   5d541e:	0f 85 34 4f 00 00    	jne    5da358 <___bpf_prog_run+0x64a8>
1574   5d5424:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1578   5d5428:	83 e0 0f             	and    $0xf,%eax
157b   5d542b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
157f   5d542f:	4c 89 f8             	mov    %r15,%rax
1582   5d5432:	48 c1 e8 03          	shr    $0x3,%rax
1586   5d5436:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
158b   5d543b:	0f 85 29 52 00 00    	jne    5da66a <___bpf_prog_run+0x67ba>
1591   5d5441:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1595   5d5445:	49 8b 17             	mov    (%r15),%rdx
1598   5d5448:	c0 e8 04             	shr    $0x4,%al
159b   5d544b:	0f b6 c0             	movzbl %al,%eax
159e   5d544e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
15a2   5d5452:	4c 89 f8             	mov    %r15,%rax
15a5   5d5455:	48 c1 e8 03          	shr    $0x3,%rax
15a9   5d5459:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
15ae   5d545e:	0f 85 f1 51 00 00    	jne    5da655 <___bpf_prog_run+0x67a5>
15b4   5d5464:	41 39 17             	cmp    %edx,(%r15)
15b7   5d5467:	0f 87 28 37 00 00    	ja     5d8b95 <___bpf_prog_run+0x4ce5>
15bd   5d546d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
15c1   5d5471:	48 89 f8             	mov    %rdi,%rax
15c4   5d5474:	48 c1 e8 03          	shr    $0x3,%rax
15c8   5d5478:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
15cd   5d547d:	48 89 f8             	mov    %rdi,%rax
15d0   5d5480:	83 e0 07             	and    $0x7,%eax
15d3   5d5483:	83 c0 01             	add    $0x1,%eax
15d6   5d5486:	38 d0                	cmp    %dl,%al
15d8   5d5488:	7c 08                	jl     5d5492 <___bpf_prog_run+0x15e2>
15da   5d548a:	84 d2                	test   %dl,%dl
15dc   5d548c:	0f 85 e6 45 00 00    	jne    5d9a78 <___bpf_prog_run+0x5bc8>
15e2   5d5492:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
15e7   5d5497:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
15ec   5d549c:	e9 4e ea ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
15f1   5d54a1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
15f5   5d54a5:	48 89 f8             	mov    %rdi,%rax
15f8   5d54a8:	48 89 fa             	mov    %rdi,%rdx
15fb   5d54ab:	48 c1 e8 03          	shr    $0x3,%rax
15ff   5d54af:	83 e2 07             	and    $0x7,%edx
1602   5d54b2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1607   5d54b7:	38 d0                	cmp    %dl,%al
1609   5d54b9:	7f 08                	jg     5d54c3 <___bpf_prog_run+0x1613>
160b   5d54bb:	84 c0                	test   %al,%al
160d   5d54bd:	0f 85 8b 4e 00 00    	jne    5da34e <___bpf_prog_run+0x649e>
1613   5d54c3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1617   5d54c7:	83 e0 0f             	and    $0xf,%eax
161a   5d54ca:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
161e   5d54ce:	4c 89 f8             	mov    %r15,%rax
1621   5d54d1:	48 c1 e8 03          	shr    $0x3,%rax
1625   5d54d5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
162a   5d54da:	0f 85 2f 5a 00 00    	jne    5daf0f <___bpf_prog_run+0x705f>
1630   5d54e0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1634   5d54e4:	49 8b 17             	mov    (%r15),%rdx
1637   5d54e7:	c0 e8 04             	shr    $0x4,%al
163a   5d54ea:	0f b6 c0             	movzbl %al,%eax
163d   5d54ed:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1641   5d54f1:	4c 89 f8             	mov    %r15,%rax
1644   5d54f4:	48 c1 e8 03          	shr    $0x3,%rax
1648   5d54f8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
164d   5d54fd:	0f 85 f7 59 00 00    	jne    5daefa <___bpf_prog_run+0x704a>
1653   5d5503:	41 85 17             	test   %edx,(%r15)
1656   5d5506:	0f 84 f9 35 00 00    	je     5d8b05 <___bpf_prog_run+0x4c55>
165c   5d550c:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1660   5d5510:	48 89 f8             	mov    %rdi,%rax
1663   5d5513:	48 c1 e8 03          	shr    $0x3,%rax
1667   5d5517:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
166c   5d551c:	48 89 f8             	mov    %rdi,%rax
166f   5d551f:	83 e0 07             	and    $0x7,%eax
1672   5d5522:	83 c0 01             	add    $0x1,%eax
1675   5d5525:	38 d0                	cmp    %dl,%al
1677   5d5527:	7c 08                	jl     5d5531 <___bpf_prog_run+0x1681>
1679   5d5529:	84 d2                	test   %dl,%dl
167b   5d552b:	0f 85 57 44 00 00    	jne    5d9988 <___bpf_prog_run+0x5ad8>
1681   5d5531:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1686   5d5536:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
168b   5d553b:	e9 af e9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1690   5d5540:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1694   5d5544:	48 89 f8             	mov    %rdi,%rax
1697   5d5547:	48 89 fa             	mov    %rdi,%rdx
169a   5d554a:	48 c1 e8 03          	shr    $0x3,%rax
169e   5d554e:	83 e2 07             	and    $0x7,%edx
16a1   5d5551:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
16a6   5d5556:	38 d0                	cmp    %dl,%al
16a8   5d5558:	7f 08                	jg     5d5562 <___bpf_prog_run+0x16b2>
16aa   5d555a:	84 c0                	test   %al,%al
16ac   5d555c:	0f 85 e2 4d 00 00    	jne    5da344 <___bpf_prog_run+0x6494>
16b2   5d5562:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
16b6   5d5566:	83 e0 0f             	and    $0xf,%eax
16b9   5d5569:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
16bd   5d556d:	4c 89 f8             	mov    %r15,%rax
16c0   5d5570:	48 c1 e8 03          	shr    $0x3,%rax
16c4   5d5574:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
16c9   5d5579:	0f 85 66 55 00 00    	jne    5daae5 <___bpf_prog_run+0x6c35>
16cf   5d557f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
16d3   5d5583:	49 8b 17             	mov    (%r15),%rdx
16d6   5d5586:	c0 e8 04             	shr    $0x4,%al
16d9   5d5589:	0f b6 c0             	movzbl %al,%eax
16dc   5d558c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
16e0   5d5590:	4c 89 f8             	mov    %r15,%rax
16e3   5d5593:	48 c1 e8 03          	shr    $0x3,%rax
16e7   5d5597:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
16ec   5d559c:	0f 85 2e 55 00 00    	jne    5daad0 <___bpf_prog_run+0x6c20>
16f2   5d55a2:	41 39 17             	cmp    %edx,(%r15)
16f5   5d55a5:	0f 83 44 36 00 00    	jae    5d8bef <___bpf_prog_run+0x4d3f>
16fb   5d55ab:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
16ff   5d55af:	48 89 f8             	mov    %rdi,%rax
1702   5d55b2:	48 c1 e8 03          	shr    $0x3,%rax
1706   5d55b6:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
170b   5d55bb:	48 89 f8             	mov    %rdi,%rax
170e   5d55be:	83 e0 07             	and    $0x7,%eax
1711   5d55c1:	83 c0 01             	add    $0x1,%eax
1714   5d55c4:	38 d0                	cmp    %dl,%al
1716   5d55c6:	7c 08                	jl     5d55d0 <___bpf_prog_run+0x1720>
1718   5d55c8:	84 d2                	test   %dl,%dl
171a   5d55ca:	0f 85 12 47 00 00    	jne    5d9ce2 <___bpf_prog_run+0x5e32>
1720   5d55d0:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1725   5d55d5:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
172a   5d55da:	e9 10 e9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
172f   5d55df:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1733   5d55e3:	48 89 f8             	mov    %rdi,%rax
1736   5d55e6:	48 89 fa             	mov    %rdi,%rdx
1739   5d55e9:	48 c1 e8 03          	shr    $0x3,%rax
173d   5d55ed:	83 e2 07             	and    $0x7,%edx
1740   5d55f0:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1745   5d55f5:	38 d0                	cmp    %dl,%al
1747   5d55f7:	7f 08                	jg     5d5601 <___bpf_prog_run+0x1751>
1749   5d55f9:	84 c0                	test   %al,%al
174b   5d55fb:	0f 85 39 4d 00 00    	jne    5da33a <___bpf_prog_run+0x648a>
1751   5d5601:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1755   5d5605:	83 e0 0f             	and    $0xf,%eax
1758   5d5608:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
175c   5d560c:	4c 89 f8             	mov    %r15,%rax
175f   5d560f:	48 c1 e8 03          	shr    $0x3,%rax
1763   5d5613:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1768   5d5618:	0f 85 73 50 00 00    	jne    5da691 <___bpf_prog_run+0x67e1>
176e   5d561e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1772   5d5622:	4d 8b 3f             	mov    (%r15),%r15
1775   5d5625:	48 89 f8             	mov    %rdi,%rax
1778   5d5628:	48 c1 e8 03          	shr    $0x3,%rax
177c   5d562c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1781   5d5631:	48 89 f8             	mov    %rdi,%rax
1784   5d5634:	83 e0 07             	and    $0x7,%eax
1787   5d5637:	83 c0 03             	add    $0x3,%eax
178a   5d563a:	38 d0                	cmp    %dl,%al
178c   5d563c:	7c 08                	jl     5d5646 <___bpf_prog_run+0x1796>
178e   5d563e:	84 d2                	test   %dl,%dl
1790   5d5640:	0f 85 e2 43 00 00    	jne    5d9a28 <___bpf_prog_run+0x5b78>
1796   5d5646:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
179a   5d564a:	0f 8d 0f 35 00 00    	jge    5d8b5f <___bpf_prog_run+0x4caf>
17a0   5d5650:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
17a4   5d5654:	48 89 f8             	mov    %rdi,%rax
17a7   5d5657:	48 c1 e8 03          	shr    $0x3,%rax
17ab   5d565b:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
17b0   5d5660:	48 89 f8             	mov    %rdi,%rax
17b3   5d5663:	83 e0 07             	and    $0x7,%eax
17b6   5d5666:	83 c0 01             	add    $0x1,%eax
17b9   5d5669:	38 d0                	cmp    %dl,%al
17bb   5d566b:	7c 08                	jl     5d5675 <___bpf_prog_run+0x17c5>
17bd   5d566d:	84 d2                	test   %dl,%dl
17bf   5d566f:	0f 85 a9 43 00 00    	jne    5d9a1e <___bpf_prog_run+0x5b6e>
17c5   5d5675:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
17ca   5d567a:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
17cf   5d567f:	e9 6b e8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
17d4   5d5684:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
17d8   5d5688:	48 89 f8             	mov    %rdi,%rax
17db   5d568b:	48 89 fa             	mov    %rdi,%rdx
17de   5d568e:	48 c1 e8 03          	shr    $0x3,%rax
17e2   5d5692:	83 e2 07             	and    $0x7,%edx
17e5   5d5695:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
17ea   5d569a:	38 d0                	cmp    %dl,%al
17ec   5d569c:	7f 08                	jg     5d56a6 <___bpf_prog_run+0x17f6>
17ee   5d569e:	84 c0                	test   %al,%al
17f0   5d56a0:	0f 85 8a 4c 00 00    	jne    5da330 <___bpf_prog_run+0x6480>
17f6   5d56a6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
17fa   5d56aa:	83 e0 0f             	and    $0xf,%eax
17fd   5d56ad:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1801   5d56b1:	4c 89 f8             	mov    %r15,%rax
1804   5d56b4:	48 c1 e8 03          	shr    $0x3,%rax
1808   5d56b8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
180d   5d56bd:	0f 85 06 4f 00 00    	jne    5da5c9 <___bpf_prog_run+0x6719>
1813   5d56c3:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1817   5d56c7:	4d 8b 3f             	mov    (%r15),%r15
181a   5d56ca:	48 89 f8             	mov    %rdi,%rax
181d   5d56cd:	48 c1 e8 03          	shr    $0x3,%rax
1821   5d56d1:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1826   5d56d6:	48 89 f8             	mov    %rdi,%rax
1829   5d56d9:	83 e0 07             	and    $0x7,%eax
182c   5d56dc:	83 c0 03             	add    $0x3,%eax
182f   5d56df:	38 d0                	cmp    %dl,%al
1831   5d56e1:	7c 08                	jl     5d56eb <___bpf_prog_run+0x183b>
1833   5d56e3:	84 d2                	test   %dl,%dl
1835   5d56e5:	0f 85 93 45 00 00    	jne    5d9c7e <___bpf_prog_run+0x5dce>
183b   5d56eb:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
183f   5d56ef:	0f 82 b2 34 00 00    	jb     5d8ba7 <___bpf_prog_run+0x4cf7>
1845   5d56f5:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1849   5d56f9:	48 89 f8             	mov    %rdi,%rax
184c   5d56fc:	48 c1 e8 03          	shr    $0x3,%rax
1850   5d5700:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1855   5d5705:	48 89 f8             	mov    %rdi,%rax
1858   5d5708:	83 e0 07             	and    $0x7,%eax
185b   5d570b:	83 c0 01             	add    $0x1,%eax
185e   5d570e:	38 d0                	cmp    %dl,%al
1860   5d5710:	7c 08                	jl     5d571a <___bpf_prog_run+0x186a>
1862   5d5712:	84 d2                	test   %dl,%dl
1864   5d5714:	0f 85 7c 43 00 00    	jne    5d9a96 <___bpf_prog_run+0x5be6>
186a   5d571a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
186f   5d571f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1874   5d5724:	e9 c6 e7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1879   5d5729:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
187d   5d572d:	48 89 f8             	mov    %rdi,%rax
1880   5d5730:	48 89 fa             	mov    %rdi,%rdx
1883   5d5733:	48 c1 e8 03          	shr    $0x3,%rax
1887   5d5737:	83 e2 07             	and    $0x7,%edx
188a   5d573a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
188f   5d573f:	38 d0                	cmp    %dl,%al
1891   5d5741:	7f 08                	jg     5d574b <___bpf_prog_run+0x189b>
1893   5d5743:	84 c0                	test   %al,%al
1895   5d5745:	0f 85 db 4b 00 00    	jne    5da326 <___bpf_prog_run+0x6476>
189b   5d574b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
189f   5d574f:	83 e0 0f             	and    $0xf,%eax
18a2   5d5752:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
18a6   5d5756:	4c 89 f8             	mov    %r15,%rax
18a9   5d5759:	48 c1 e8 03          	shr    $0x3,%rax
18ad   5d575d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
18b2   5d5762:	0f 85 40 59 00 00    	jne    5db0a8 <___bpf_prog_run+0x71f8>
18b8   5d5768:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
18bc   5d576c:	4d 8b 3f             	mov    (%r15),%r15
18bf   5d576f:	48 89 f8             	mov    %rdi,%rax
18c2   5d5772:	48 c1 e8 03          	shr    $0x3,%rax
18c6   5d5776:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
18cb   5d577b:	48 89 f8             	mov    %rdi,%rax
18ce   5d577e:	83 e0 07             	and    $0x7,%eax
18d1   5d5781:	83 c0 03             	add    $0x3,%eax
18d4   5d5784:	38 d0                	cmp    %dl,%al
18d6   5d5786:	7c 08                	jl     5d5790 <___bpf_prog_run+0x18e0>
18d8   5d5788:	84 d2                	test   %dl,%dl
18da   5d578a:	0f 85 20 42 00 00    	jne    5d99b0 <___bpf_prog_run+0x5b00>
18e0   5d5790:	44 85 7b 04          	test   %r15d,0x4(%rbx)
18e4   5d5794:	0f 84 7d 33 00 00    	je     5d8b17 <___bpf_prog_run+0x4c67>
18ea   5d579a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
18ee   5d579e:	48 89 f8             	mov    %rdi,%rax
18f1   5d57a1:	48 c1 e8 03          	shr    $0x3,%rax
18f5   5d57a5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
18fa   5d57aa:	48 89 f8             	mov    %rdi,%rax
18fd   5d57ad:	83 e0 07             	and    $0x7,%eax
1900   5d57b0:	83 c0 01             	add    $0x1,%eax
1903   5d57b3:	38 d0                	cmp    %dl,%al
1905   5d57b5:	7c 08                	jl     5d57bf <___bpf_prog_run+0x190f>
1907   5d57b7:	84 d2                	test   %dl,%dl
1909   5d57b9:	0f 85 e7 41 00 00    	jne    5d99a6 <___bpf_prog_run+0x5af6>
190f   5d57bf:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1914   5d57c4:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1919   5d57c9:	e9 21 e7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
191e   5d57ce:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1922   5d57d2:	48 89 f8             	mov    %rdi,%rax
1925   5d57d5:	48 89 fa             	mov    %rdi,%rdx
1928   5d57d8:	48 c1 e8 03          	shr    $0x3,%rax
192c   5d57dc:	83 e2 07             	and    $0x7,%edx
192f   5d57df:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1934   5d57e4:	38 d0                	cmp    %dl,%al
1936   5d57e6:	7f 08                	jg     5d57f0 <___bpf_prog_run+0x1940>
1938   5d57e8:	84 c0                	test   %al,%al
193a   5d57ea:	0f 85 2c 4b 00 00    	jne    5da31c <___bpf_prog_run+0x646c>
1940   5d57f0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1944   5d57f4:	83 e0 0f             	and    $0xf,%eax
1947   5d57f7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
194b   5d57fb:	4c 89 f8             	mov    %r15,%rax
194e   5d57fe:	48 c1 e8 03          	shr    $0x3,%rax
1952   5d5802:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1957   5d5807:	0f 85 36 53 00 00    	jne    5dab43 <___bpf_prog_run+0x6c93>
195d   5d580d:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1961   5d5811:	4d 8b 3f             	mov    (%r15),%r15
1964   5d5814:	48 89 f8             	mov    %rdi,%rax
1967   5d5817:	48 c1 e8 03          	shr    $0x3,%rax
196b   5d581b:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1970   5d5820:	48 89 f8             	mov    %rdi,%rax
1973   5d5823:	83 e0 07             	and    $0x7,%eax
1976   5d5826:	83 c0 03             	add    $0x3,%eax
1979   5d5829:	38 d0                	cmp    %dl,%al
197b   5d582b:	7c 08                	jl     5d5835 <___bpf_prog_run+0x1985>
197d   5d582d:	84 d2                	test   %dl,%dl
197f   5d582f:	0f 85 85 44 00 00    	jne    5d9cba <___bpf_prog_run+0x5e0a>
1985   5d5835:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1989   5d5839:	0f 86 8c 33 00 00    	jbe    5d8bcb <___bpf_prog_run+0x4d1b>
198f   5d583f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1993   5d5843:	48 89 f8             	mov    %rdi,%rax
1996   5d5846:	48 c1 e8 03          	shr    $0x3,%rax
199a   5d584a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
199f   5d584f:	48 89 f8             	mov    %rdi,%rax
19a2   5d5852:	83 e0 07             	and    $0x7,%eax
19a5   5d5855:	83 c0 01             	add    $0x1,%eax
19a8   5d5858:	38 d0                	cmp    %dl,%al
19aa   5d585a:	7c 08                	jl     5d5864 <___bpf_prog_run+0x19b4>
19ac   5d585c:	84 d2                	test   %dl,%dl
19ae   5d585e:	0f 85 4c 44 00 00    	jne    5d9cb0 <___bpf_prog_run+0x5e00>
19b4   5d5864:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
19b9   5d5869:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
19be   5d586e:	e9 7c e6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
19c3   5d5873:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
19c7   5d5877:	48 89 f8             	mov    %rdi,%rax
19ca   5d587a:	48 89 fa             	mov    %rdi,%rdx
19cd   5d587d:	48 c1 e8 03          	shr    $0x3,%rax
19d1   5d5881:	83 e2 07             	and    $0x7,%edx
19d4   5d5884:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
19d9   5d5889:	38 d0                	cmp    %dl,%al
19db   5d588b:	7f 08                	jg     5d5895 <___bpf_prog_run+0x19e5>
19dd   5d588d:	84 c0                	test   %al,%al
19df   5d588f:	0f 85 7d 4a 00 00    	jne    5da312 <___bpf_prog_run+0x6462>
19e5   5d5895:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
19e9   5d5899:	83 e0 0f             	and    $0xf,%eax
19ec   5d589c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
19f0   5d58a0:	4c 89 f8             	mov    %r15,%rax
19f3   5d58a3:	48 c1 e8 03          	shr    $0x3,%rax
19f7   5d58a7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
19fc   5d58ac:	0f 85 98 57 00 00    	jne    5db04a <___bpf_prog_run+0x719a>
1a02   5d58b2:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1a06   5d58b6:	4d 8b 3f             	mov    (%r15),%r15
1a09   5d58b9:	48 89 f8             	mov    %rdi,%rax
1a0c   5d58bc:	48 c1 e8 03          	shr    $0x3,%rax
1a10   5d58c0:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1a15   5d58c5:	48 89 f8             	mov    %rdi,%rax
1a18   5d58c8:	83 e0 07             	and    $0x7,%eax
1a1b   5d58cb:	83 c0 03             	add    $0x3,%eax
1a1e   5d58ce:	38 d0                	cmp    %dl,%al
1a20   5d58d0:	7c 08                	jl     5d58da <___bpf_prog_run+0x1a2a>
1a22   5d58d2:	84 d2                	test   %dl,%dl
1a24   5d58d4:	0f 85 12 41 00 00    	jne    5d99ec <___bpf_prog_run+0x5b3c>
1a2a   5d58da:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1a2e   5d58de:	0f 8e 57 32 00 00    	jle    5d8b3b <___bpf_prog_run+0x4c8b>
1a34   5d58e4:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1a38   5d58e8:	48 89 f8             	mov    %rdi,%rax
1a3b   5d58eb:	48 c1 e8 03          	shr    $0x3,%rax
1a3f   5d58ef:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1a44   5d58f4:	48 89 f8             	mov    %rdi,%rax
1a47   5d58f7:	83 e0 07             	and    $0x7,%eax
1a4a   5d58fa:	83 c0 01             	add    $0x1,%eax
1a4d   5d58fd:	38 d0                	cmp    %dl,%al
1a4f   5d58ff:	7c 08                	jl     5d5909 <___bpf_prog_run+0x1a59>
1a51   5d5901:	84 d2                	test   %dl,%dl
1a53   5d5903:	0f 85 d9 40 00 00    	jne    5d99e2 <___bpf_prog_run+0x5b32>
1a59   5d5909:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1a5e   5d590e:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1a63   5d5913:	e9 d7 e5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1a68   5d5918:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1a6c   5d591c:	48 89 f8             	mov    %rdi,%rax
1a6f   5d591f:	48 89 fa             	mov    %rdi,%rdx
1a72   5d5922:	48 c1 e8 03          	shr    $0x3,%rax
1a76   5d5926:	83 e2 07             	and    $0x7,%edx
1a79   5d5929:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1a7e   5d592e:	38 d0                	cmp    %dl,%al
1a80   5d5930:	7f 08                	jg     5d593a <___bpf_prog_run+0x1a8a>
1a82   5d5932:	84 c0                	test   %al,%al
1a84   5d5934:	0f 85 ce 49 00 00    	jne    5da308 <___bpf_prog_run+0x6458>
1a8a   5d593a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1a8e   5d593e:	83 e0 0f             	and    $0xf,%eax
1a91   5d5941:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1a95   5d5945:	4c 89 f8             	mov    %r15,%rax
1a98   5d5948:	48 c1 e8 03          	shr    $0x3,%rax
1a9c   5d594c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1aa1   5d5951:	0f 85 20 4d 00 00    	jne    5da677 <___bpf_prog_run+0x67c7>
1aa7   5d5957:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1aab   5d595b:	4d 8b 3f             	mov    (%r15),%r15
1aae   5d595e:	48 89 f8             	mov    %rdi,%rax
1ab1   5d5961:	48 c1 e8 03          	shr    $0x3,%rax
1ab5   5d5965:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1aba   5d596a:	48 89 f8             	mov    %rdi,%rax
1abd   5d596d:	83 e0 07             	and    $0x7,%eax
1ac0   5d5970:	83 c0 03             	add    $0x3,%eax
1ac3   5d5973:	38 d0                	cmp    %dl,%al
1ac5   5d5975:	7c 08                	jl     5d597f <___bpf_prog_run+0x1acf>
1ac7   5d5977:	84 d2                	test   %dl,%dl
1ac9   5d5979:	0f 85 e5 40 00 00    	jne    5d9a64 <___bpf_prog_run+0x5bb4>
1acf   5d597f:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1ad3   5d5983:	0f 83 fa 31 00 00    	jae    5d8b83 <___bpf_prog_run+0x4cd3>
1ad9   5d5989:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1add   5d598d:	48 89 f8             	mov    %rdi,%rax
1ae0   5d5990:	48 c1 e8 03          	shr    $0x3,%rax
1ae4   5d5994:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1ae9   5d5999:	48 89 f8             	mov    %rdi,%rax
1aec   5d599c:	83 e0 07             	and    $0x7,%eax
1aef   5d599f:	83 c0 01             	add    $0x1,%eax
1af2   5d59a2:	38 d0                	cmp    %dl,%al
1af4   5d59a4:	7c 08                	jl     5d59ae <___bpf_prog_run+0x1afe>
1af6   5d59a6:	84 d2                	test   %dl,%dl
1af8   5d59a8:	0f 85 ac 40 00 00    	jne    5d9a5a <___bpf_prog_run+0x5baa>
1afe   5d59ae:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1b03   5d59b3:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1b08   5d59b8:	e9 32 e5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1b0d   5d59bd:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1b11   5d59c1:	48 89 f8             	mov    %rdi,%rax
1b14   5d59c4:	48 89 fa             	mov    %rdi,%rdx
1b17   5d59c7:	48 c1 e8 03          	shr    $0x3,%rax
1b1b   5d59cb:	83 e2 07             	and    $0x7,%edx
1b1e   5d59ce:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1b23   5d59d3:	38 d0                	cmp    %dl,%al
1b25   5d59d5:	7f 08                	jg     5d59df <___bpf_prog_run+0x1b2f>
1b27   5d59d7:	84 c0                	test   %al,%al
1b29   5d59d9:	0f 85 1f 49 00 00    	jne    5da2fe <___bpf_prog_run+0x644e>
1b2f   5d59df:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1b33   5d59e3:	83 e0 0f             	and    $0xf,%eax
1b36   5d59e6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1b3a   5d59ea:	4c 89 f8             	mov    %r15,%rax
1b3d   5d59ed:	48 c1 e8 03          	shr    $0x3,%rax
1b41   5d59f1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1b46   5d59f6:	0f 85 20 55 00 00    	jne    5daf1c <___bpf_prog_run+0x706c>
1b4c   5d59fc:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1b50   5d5a00:	4d 8b 3f             	mov    (%r15),%r15
1b53   5d5a03:	48 89 f8             	mov    %rdi,%rax
1b56   5d5a06:	48 c1 e8 03          	shr    $0x3,%rax
1b5a   5d5a0a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1b5f   5d5a0f:	48 89 f8             	mov    %rdi,%rax
1b62   5d5a12:	83 e0 07             	and    $0x7,%eax
1b65   5d5a15:	83 c0 03             	add    $0x3,%eax
1b68   5d5a18:	38 d0                	cmp    %dl,%al
1b6a   5d5a1a:	7c 08                	jl     5d5a24 <___bpf_prog_run+0x1b74>
1b6c   5d5a1c:	84 d2                	test   %dl,%dl
1b6e   5d5a1e:	0f 85 50 3f 00 00    	jne    5d9974 <___bpf_prog_run+0x5ac4>
1b74   5d5a24:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1b78   5d5a28:	0f 87 c5 30 00 00    	ja     5d8af3 <___bpf_prog_run+0x4c43>
1b7e   5d5a2e:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1b82   5d5a32:	48 89 f8             	mov    %rdi,%rax
1b85   5d5a35:	48 c1 e8 03          	shr    $0x3,%rax
1b89   5d5a39:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1b8e   5d5a3e:	48 89 f8             	mov    %rdi,%rax
1b91   5d5a41:	83 e0 07             	and    $0x7,%eax
1b94   5d5a44:	83 c0 01             	add    $0x1,%eax
1b97   5d5a47:	38 d0                	cmp    %dl,%al
1b99   5d5a49:	7c 08                	jl     5d5a53 <___bpf_prog_run+0x1ba3>
1b9b   5d5a4b:	84 d2                	test   %dl,%dl
1b9d   5d5a4d:	0f 85 17 3f 00 00    	jne    5d996a <___bpf_prog_run+0x5aba>
1ba3   5d5a53:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1ba8   5d5a58:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1bad   5d5a5d:	e9 8d e4 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1bb2   5d5a62:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1bb6   5d5a66:	48 89 f8             	mov    %rdi,%rax
1bb9   5d5a69:	48 89 fa             	mov    %rdi,%rdx
1bbc   5d5a6c:	48 c1 e8 03          	shr    $0x3,%rax
1bc0   5d5a70:	83 e2 07             	and    $0x7,%edx
1bc3   5d5a73:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1bc8   5d5a78:	38 d0                	cmp    %dl,%al
1bca   5d5a7a:	7f 08                	jg     5d5a84 <___bpf_prog_run+0x1bd4>
1bcc   5d5a7c:	84 c0                	test   %al,%al
1bce   5d5a7e:	0f 85 70 48 00 00    	jne    5da2f4 <___bpf_prog_run+0x6444>
1bd4   5d5a84:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1bd8   5d5a88:	83 e0 0f             	and    $0xf,%eax
1bdb   5d5a8b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1bdf   5d5a8f:	4c 89 f8             	mov    %r15,%rax
1be2   5d5a92:	48 c1 e8 03          	shr    $0x3,%rax
1be6   5d5a96:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1beb   5d5a9b:	0f 85 3f 57 00 00    	jne    5db1e0 <___bpf_prog_run+0x7330>
1bf1   5d5aa1:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
1bf5   5d5aa5:	4d 8b 3f             	mov    (%r15),%r15
1bf8   5d5aa8:	48 89 f8             	mov    %rdi,%rax
1bfb   5d5aab:	48 c1 e8 03          	shr    $0x3,%rax
1bff   5d5aaf:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1c04   5d5ab4:	48 89 f8             	mov    %rdi,%rax
1c07   5d5ab7:	83 e0 07             	and    $0x7,%eax
1c0a   5d5aba:	83 c0 03             	add    $0x3,%eax
1c0d   5d5abd:	38 d0                	cmp    %dl,%al
1c0f   5d5abf:	7c 08                	jl     5d5ac9 <___bpf_prog_run+0x1c19>
1c11   5d5ac1:	84 d2                	test   %dl,%dl
1c13   5d5ac3:	0f 85 23 42 00 00    	jne    5d9cec <___bpf_prog_run+0x5e3c>
1c19   5d5ac9:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
1c1d   5d5acd:	0f 84 15 32 00 00    	je     5d8ce8 <___bpf_prog_run+0x4e38>
1c23   5d5ad3:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1c27   5d5ad7:	48 89 f8             	mov    %rdi,%rax
1c2a   5d5ada:	48 c1 e8 03          	shr    $0x3,%rax
1c2e   5d5ade:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1c33   5d5ae3:	48 89 f8             	mov    %rdi,%rax
1c36   5d5ae6:	83 e0 07             	and    $0x7,%eax
1c39   5d5ae9:	83 c0 01             	add    $0x1,%eax
1c3c   5d5aec:	38 d0                	cmp    %dl,%al
1c3e   5d5aee:	7c 08                	jl     5d5af8 <___bpf_prog_run+0x1c48>
1c40   5d5af0:	84 d2                	test   %dl,%dl
1c42   5d5af2:	0f 85 7f 4a 00 00    	jne    5da577 <___bpf_prog_run+0x66c7>
1c48   5d5af8:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1c4d   5d5afd:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1c52   5d5b02:	e9 e8 e3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1c57   5d5b07:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1c5b   5d5b0b:	48 89 f8             	mov    %rdi,%rax
1c5e   5d5b0e:	48 89 fa             	mov    %rdi,%rdx
1c61   5d5b11:	48 c1 e8 03          	shr    $0x3,%rax
1c65   5d5b15:	83 e2 07             	and    $0x7,%edx
1c68   5d5b18:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1c6d   5d5b1d:	38 d0                	cmp    %dl,%al
1c6f   5d5b1f:	7f 08                	jg     5d5b29 <___bpf_prog_run+0x1c79>
1c71   5d5b21:	84 c0                	test   %al,%al
1c73   5d5b23:	0f 85 c1 47 00 00    	jne    5da2ea <___bpf_prog_run+0x643a>
1c79   5d5b29:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1c7d   5d5b2d:	83 e0 0f             	and    $0xf,%eax
1c80   5d5b30:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1c84   5d5b34:	4c 89 f8             	mov    %r15,%rax
1c87   5d5b37:	48 c1 e8 03          	shr    $0x3,%rax
1c8b   5d5b3b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1c90   5d5b40:	0f 85 33 55 00 00    	jne    5db079 <___bpf_prog_run+0x71c9>
1c96   5d5b46:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1c9a   5d5b4a:	49 8b 17             	mov    (%r15),%rdx
1c9d   5d5b4d:	c0 e8 04             	shr    $0x4,%al
1ca0   5d5b50:	0f b6 c0             	movzbl %al,%eax
1ca3   5d5b53:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1ca7   5d5b57:	4c 89 f8             	mov    %r15,%rax
1caa   5d5b5a:	48 c1 e8 03          	shr    $0x3,%rax
1cae   5d5b5e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1cb3   5d5b63:	0f 85 fb 54 00 00    	jne    5db064 <___bpf_prog_run+0x71b4>
1cb9   5d5b69:	49 3b 17             	cmp    (%r15),%rdx
1cbc   5d5b6c:	0f 8c f6 2f 00 00    	jl     5d8b68 <___bpf_prog_run+0x4cb8>
1cc2   5d5b72:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1cc6   5d5b76:	48 89 f8             	mov    %rdi,%rax
1cc9   5d5b79:	48 c1 e8 03          	shr    $0x3,%rax
1ccd   5d5b7d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1cd2   5d5b82:	48 89 f8             	mov    %rdi,%rax
1cd5   5d5b85:	83 e0 07             	and    $0x7,%eax
1cd8   5d5b88:	83 c0 01             	add    $0x1,%eax
1cdb   5d5b8b:	38 d0                	cmp    %dl,%al
1cdd   5d5b8d:	7c 08                	jl     5d5b97 <___bpf_prog_run+0x1ce7>
1cdf   5d5b8f:	84 d2                	test   %dl,%dl
1ce1   5d5b91:	0f 85 9b 3e 00 00    	jne    5d9a32 <___bpf_prog_run+0x5b82>
1ce7   5d5b97:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1cec   5d5b9c:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1cf1   5d5ba1:	e9 49 e3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1cf6   5d5ba6:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1cfa   5d5baa:	48 89 f8             	mov    %rdi,%rax
1cfd   5d5bad:	48 89 fa             	mov    %rdi,%rdx
1d00   5d5bb0:	48 c1 e8 03          	shr    $0x3,%rax
1d04   5d5bb4:	83 e2 07             	and    $0x7,%edx
1d07   5d5bb7:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1d0c   5d5bbc:	38 d0                	cmp    %dl,%al
1d0e   5d5bbe:	7f 08                	jg     5d5bc8 <___bpf_prog_run+0x1d18>
1d10   5d5bc0:	84 c0                	test   %al,%al
1d12   5d5bc2:	0f 85 18 47 00 00    	jne    5da2e0 <___bpf_prog_run+0x6430>
1d18   5d5bc8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1d1c   5d5bcc:	83 e0 0f             	and    $0xf,%eax
1d1f   5d5bcf:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1d23   5d5bd3:	4c 89 f8             	mov    %r15,%rax
1d26   5d5bd6:	48 c1 e8 03          	shr    $0x3,%rax
1d2a   5d5bda:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1d2f   5d5bdf:	0f 85 a2 4f 00 00    	jne    5dab87 <___bpf_prog_run+0x6cd7>
1d35   5d5be5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1d39   5d5be9:	49 8b 17             	mov    (%r15),%rdx
1d3c   5d5bec:	c0 e8 04             	shr    $0x4,%al
1d3f   5d5bef:	0f b6 c0             	movzbl %al,%eax
1d42   5d5bf2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1d46   5d5bf6:	4c 89 f8             	mov    %r15,%rax
1d49   5d5bf9:	48 c1 e8 03          	shr    $0x3,%rax
1d4d   5d5bfd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1d52   5d5c02:	0f 85 6a 4f 00 00    	jne    5dab72 <___bpf_prog_run+0x6cc2>
1d58   5d5c08:	49 3b 17             	cmp    (%r15),%rdx
1d5b   5d5c0b:	0f 87 9f 2f 00 00    	ja     5d8bb0 <___bpf_prog_run+0x4d00>
1d61   5d5c11:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1d65   5d5c15:	48 89 f8             	mov    %rdi,%rax
1d68   5d5c18:	48 c1 e8 03          	shr    $0x3,%rax
1d6c   5d5c1c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1d71   5d5c21:	48 89 f8             	mov    %rdi,%rax
1d74   5d5c24:	83 e0 07             	and    $0x7,%eax
1d77   5d5c27:	83 c0 01             	add    $0x1,%eax
1d7a   5d5c2a:	38 d0                	cmp    %dl,%al
1d7c   5d5c2c:	7c 08                	jl     5d5c36 <___bpf_prog_run+0x1d86>
1d7e   5d5c2e:	84 d2                	test   %dl,%dl
1d80   5d5c30:	0f 85 52 40 00 00    	jne    5d9c88 <___bpf_prog_run+0x5dd8>
1d86   5d5c36:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1d8b   5d5c3b:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1d90   5d5c40:	e9 aa e2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1d95   5d5c45:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1d99   5d5c49:	48 89 f8             	mov    %rdi,%rax
1d9c   5d5c4c:	48 89 fa             	mov    %rdi,%rdx
1d9f   5d5c4f:	48 c1 e8 03          	shr    $0x3,%rax
1da3   5d5c53:	83 e2 07             	and    $0x7,%edx
1da6   5d5c56:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1dab   5d5c5b:	38 d0                	cmp    %dl,%al
1dad   5d5c5d:	7f 08                	jg     5d5c67 <___bpf_prog_run+0x1db7>
1daf   5d5c5f:	84 c0                	test   %al,%al
1db1   5d5c61:	0f 85 6f 46 00 00    	jne    5da2d6 <___bpf_prog_run+0x6426>
1db7   5d5c67:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1dbb   5d5c6b:	83 e0 0f             	and    $0xf,%eax
1dbe   5d5c6e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1dc2   5d5c72:	4c 89 f8             	mov    %r15,%rax
1dc5   5d5c75:	48 c1 e8 03          	shr    $0x3,%rax
1dc9   5d5c79:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1dce   5d5c7e:	0f 85 75 54 00 00    	jne    5db0f9 <___bpf_prog_run+0x7249>
1dd4   5d5c84:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1dd8   5d5c88:	49 8b 17             	mov    (%r15),%rdx
1ddb   5d5c8b:	c0 e8 04             	shr    $0x4,%al
1dde   5d5c8e:	0f b6 c0             	movzbl %al,%eax
1de1   5d5c91:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1de5   5d5c95:	4c 89 f8             	mov    %r15,%rax
1de8   5d5c98:	48 c1 e8 03          	shr    $0x3,%rax
1dec   5d5c9c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1df1   5d5ca1:	0f 85 3d 54 00 00    	jne    5db0e4 <___bpf_prog_run+0x7234>
1df7   5d5ca7:	49 3b 17             	cmp    (%r15),%rdx
1dfa   5d5caa:	0f 8e 70 2e 00 00    	jle    5d8b20 <___bpf_prog_run+0x4c70>
1e00   5d5cb0:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1e04   5d5cb4:	48 89 f8             	mov    %rdi,%rax
1e07   5d5cb7:	48 c1 e8 03          	shr    $0x3,%rax
1e0b   5d5cbb:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1e10   5d5cc0:	48 89 f8             	mov    %rdi,%rax
1e13   5d5cc3:	83 e0 07             	and    $0x7,%eax
1e16   5d5cc6:	83 c0 01             	add    $0x1,%eax
1e19   5d5cc9:	38 d0                	cmp    %dl,%al
1e1b   5d5ccb:	7c 08                	jl     5d5cd5 <___bpf_prog_run+0x1e25>
1e1d   5d5ccd:	84 d2                	test   %dl,%dl
1e1f   5d5ccf:	0f 85 e5 3c 00 00    	jne    5d99ba <___bpf_prog_run+0x5b0a>
1e25   5d5cd5:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1e2a   5d5cda:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1e2f   5d5cdf:	e9 0b e2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1e34   5d5ce4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1e38   5d5ce8:	48 89 f8             	mov    %rdi,%rax
1e3b   5d5ceb:	48 89 fa             	mov    %rdi,%rdx
1e3e   5d5cee:	48 c1 e8 03          	shr    $0x3,%rax
1e42   5d5cf2:	83 e2 07             	and    $0x7,%edx
1e45   5d5cf5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1e4a   5d5cfa:	38 d0                	cmp    %dl,%al
1e4c   5d5cfc:	7f 08                	jg     5d5d06 <___bpf_prog_run+0x1e56>
1e4e   5d5cfe:	84 c0                	test   %al,%al
1e50   5d5d00:	0f 85 c6 45 00 00    	jne    5da2cc <___bpf_prog_run+0x641c>
1e56   5d5d06:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1e5a   5d5d0a:	83 e0 0f             	and    $0xf,%eax
1e5d   5d5d0d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1e61   5d5d11:	4c 89 f8             	mov    %r15,%rax
1e64   5d5d14:	48 c1 e8 03          	shr    $0x3,%rax
1e68   5d5d18:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1e6d   5d5d1d:	0f 85 42 4e 00 00    	jne    5dab65 <___bpf_prog_run+0x6cb5>
1e73   5d5d23:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1e77   5d5d27:	49 8b 17             	mov    (%r15),%rdx
1e7a   5d5d2a:	c0 e8 04             	shr    $0x4,%al
1e7d   5d5d2d:	0f b6 c0             	movzbl %al,%eax
1e80   5d5d30:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1e84   5d5d34:	4c 89 f8             	mov    %r15,%rax
1e87   5d5d37:	48 c1 e8 03          	shr    $0x3,%rax
1e8b   5d5d3b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1e90   5d5d40:	0f 85 0a 4e 00 00    	jne    5dab50 <___bpf_prog_run+0x6ca0>
1e96   5d5d46:	49 3b 17             	cmp    (%r15),%rdx
1e99   5d5d49:	0f 83 85 2e 00 00    	jae    5d8bd4 <___bpf_prog_run+0x4d24>
1e9f   5d5d4f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1ea3   5d5d53:	48 89 f8             	mov    %rdi,%rax
1ea6   5d5d56:	48 c1 e8 03          	shr    $0x3,%rax
1eaa   5d5d5a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1eaf   5d5d5f:	48 89 f8             	mov    %rdi,%rax
1eb2   5d5d62:	83 e0 07             	and    $0x7,%eax
1eb5   5d5d65:	83 c0 01             	add    $0x1,%eax
1eb8   5d5d68:	38 d0                	cmp    %dl,%al
1eba   5d5d6a:	7c 08                	jl     5d5d74 <___bpf_prog_run+0x1ec4>
1ebc   5d5d6c:	84 d2                	test   %dl,%dl
1ebe   5d5d6e:	0f 85 50 3f 00 00    	jne    5d9cc4 <___bpf_prog_run+0x5e14>
1ec4   5d5d74:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1ec9   5d5d79:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1ece   5d5d7e:	e9 6c e1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1ed3   5d5d83:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1ed7   5d5d87:	48 89 f8             	mov    %rdi,%rax
1eda   5d5d8a:	48 89 fa             	mov    %rdi,%rdx
1edd   5d5d8d:	48 c1 e8 03          	shr    $0x3,%rax
1ee1   5d5d91:	83 e2 07             	and    $0x7,%edx
1ee4   5d5d94:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1ee9   5d5d99:	38 d0                	cmp    %dl,%al
1eeb   5d5d9b:	7f 08                	jg     5d5da5 <___bpf_prog_run+0x1ef5>
1eed   5d5d9d:	84 c0                	test   %al,%al
1eef   5d5d9f:	0f 85 1d 45 00 00    	jne    5da2c2 <___bpf_prog_run+0x6412>
1ef5   5d5da5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1ef9   5d5da9:	83 e0 0f             	and    $0xf,%eax
1efc   5d5dac:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1f00   5d5db0:	4c 89 f8             	mov    %r15,%rax
1f03   5d5db3:	48 c1 e8 03          	shr    $0x3,%rax
1f07   5d5db7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1f0c   5d5dbc:	0f 85 15 53 00 00    	jne    5db0d7 <___bpf_prog_run+0x7227>
1f12   5d5dc2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1f16   5d5dc6:	49 8b 17             	mov    (%r15),%rdx
1f19   5d5dc9:	c0 e8 04             	shr    $0x4,%al
1f1c   5d5dcc:	0f b6 c0             	movzbl %al,%eax
1f1f   5d5dcf:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1f23   5d5dd3:	4c 89 f8             	mov    %r15,%rax
1f26   5d5dd6:	48 c1 e8 03          	shr    $0x3,%rax
1f2a   5d5dda:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1f2f   5d5ddf:	0f 85 dd 52 00 00    	jne    5db0c2 <___bpf_prog_run+0x7212>
1f35   5d5de5:	49 3b 17             	cmp    (%r15),%rdx
1f38   5d5de8:	0f 8d 56 2d 00 00    	jge    5d8b44 <___bpf_prog_run+0x4c94>
1f3e   5d5dee:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1f42   5d5df2:	48 89 f8             	mov    %rdi,%rax
1f45   5d5df5:	48 c1 e8 03          	shr    $0x3,%rax
1f49   5d5df9:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1f4e   5d5dfe:	48 89 f8             	mov    %rdi,%rax
1f51   5d5e01:	83 e0 07             	and    $0x7,%eax
1f54   5d5e04:	83 c0 01             	add    $0x1,%eax
1f57   5d5e07:	38 d0                	cmp    %dl,%al
1f59   5d5e09:	7c 08                	jl     5d5e13 <___bpf_prog_run+0x1f63>
1f5b   5d5e0b:	84 d2                	test   %dl,%dl
1f5d   5d5e0d:	0f 85 e3 3b 00 00    	jne    5d99f6 <___bpf_prog_run+0x5b46>
1f63   5d5e13:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
1f68   5d5e18:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
1f6d   5d5e1d:	e9 cd e0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
1f72   5d5e22:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
1f76   5d5e26:	48 89 f8             	mov    %rdi,%rax
1f79   5d5e29:	48 89 fa             	mov    %rdi,%rdx
1f7c   5d5e2c:	48 c1 e8 03          	shr    $0x3,%rax
1f80   5d5e30:	83 e2 07             	and    $0x7,%edx
1f83   5d5e33:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
1f88   5d5e38:	38 d0                	cmp    %dl,%al
1f8a   5d5e3a:	7f 08                	jg     5d5e44 <___bpf_prog_run+0x1f94>
1f8c   5d5e3c:	84 c0                	test   %al,%al
1f8e   5d5e3e:	0f 85 74 44 00 00    	jne    5da2b8 <___bpf_prog_run+0x6408>
1f94   5d5e44:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1f98   5d5e48:	83 e0 0f             	and    $0xf,%eax
1f9b   5d5e4b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1f9f   5d5e4f:	4c 89 f8             	mov    %r15,%rax
1fa2   5d5e52:	48 c1 e8 03          	shr    $0x3,%rax
1fa6   5d5e56:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1fab   5d5e5b:	0f 85 5f 48 00 00    	jne    5da6c0 <___bpf_prog_run+0x6810>
1fb1   5d5e61:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
1fb5   5d5e65:	49 8b 17             	mov    (%r15),%rdx
1fb8   5d5e68:	c0 e8 04             	shr    $0x4,%al
1fbb   5d5e6b:	0f b6 c0             	movzbl %al,%eax
1fbe   5d5e6e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
1fc2   5d5e72:	4c 89 f8             	mov    %r15,%rax
1fc5   5d5e75:	48 c1 e8 03          	shr    $0x3,%rax
1fc9   5d5e79:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1fce   5d5e7e:	0f 85 27 48 00 00    	jne    5da6ab <___bpf_prog_run+0x67fb>
1fd4   5d5e84:	49 3b 17             	cmp    (%r15),%rdx
1fd7   5d5e87:	0f 82 ff 2c 00 00    	jb     5d8b8c <___bpf_prog_run+0x4cdc>
1fdd   5d5e8d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
1fe1   5d5e91:	48 89 f8             	mov    %rdi,%rax
1fe4   5d5e94:	48 c1 e8 03          	shr    $0x3,%rax
1fe8   5d5e98:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
1fed   5d5e9d:	48 89 f8             	mov    %rdi,%rax
1ff0   5d5ea0:	83 e0 07             	and    $0x7,%eax
1ff3   5d5ea3:	83 c0 01             	add    $0x1,%eax
1ff6   5d5ea6:	38 d0                	cmp    %dl,%al
1ff8   5d5ea8:	7c 08                	jl     5d5eb2 <___bpf_prog_run+0x2002>
1ffa   5d5eaa:	84 d2                	test   %dl,%dl
1ffc   5d5eac:	0f 85 bc 3b 00 00    	jne    5d9a6e <___bpf_prog_run+0x5bbe>
2002   5d5eb2:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2007   5d5eb7:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
200c   5d5ebc:	e9 2e e0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2011   5d5ec1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2015   5d5ec5:	48 89 f8             	mov    %rdi,%rax
2018   5d5ec8:	48 89 fa             	mov    %rdi,%rdx
201b   5d5ecb:	48 c1 e8 03          	shr    $0x3,%rax
201f   5d5ecf:	83 e2 07             	and    $0x7,%edx
2022   5d5ed2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2027   5d5ed7:	38 d0                	cmp    %dl,%al
2029   5d5ed9:	7f 08                	jg     5d5ee3 <___bpf_prog_run+0x2033>
202b   5d5edb:	84 c0                	test   %al,%al
202d   5d5edd:	0f 85 cb 43 00 00    	jne    5da2ae <___bpf_prog_run+0x63fe>
2033   5d5ee3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2037   5d5ee7:	83 e0 0f             	and    $0xf,%eax
203a   5d5eea:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
203e   5d5eee:	4c 89 f8             	mov    %r15,%rax
2041   5d5ef1:	48 c1 e8 03          	shr    $0x3,%rax
2045   5d5ef5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
204a   5d5efa:	0f 85 6d 50 00 00    	jne    5daf6d <___bpf_prog_run+0x70bd>
2050   5d5f00:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2054   5d5f04:	4d 8b 3f             	mov    (%r15),%r15
2057   5d5f07:	c0 e8 04             	shr    $0x4,%al
205a   5d5f0a:	0f b6 c0             	movzbl %al,%eax
205d   5d5f0d:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
2061   5d5f11:	48 89 c2             	mov    %rax,%rdx
2064   5d5f14:	48 c1 ea 03          	shr    $0x3,%rdx
2068   5d5f18:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
206d   5d5f1d:	0f 85 35 50 00 00    	jne    5daf58 <___bpf_prog_run+0x70a8>
2073   5d5f23:	4c 23 38             	and    (%rax),%r15
2076   5d5f26:	0f 84 d0 2b 00 00    	je     5d8afc <___bpf_prog_run+0x4c4c>
207c   5d5f2c:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2080   5d5f30:	48 89 f8             	mov    %rdi,%rax
2083   5d5f33:	48 c1 e8 03          	shr    $0x3,%rax
2087   5d5f37:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
208c   5d5f3c:	48 89 f8             	mov    %rdi,%rax
208f   5d5f3f:	83 e0 07             	and    $0x7,%eax
2092   5d5f42:	83 c0 01             	add    $0x1,%eax
2095   5d5f45:	38 d0                	cmp    %dl,%al
2097   5d5f47:	7c 08                	jl     5d5f51 <___bpf_prog_run+0x20a1>
2099   5d5f49:	84 d2                	test   %dl,%dl
209b   5d5f4b:	0f 85 2d 3a 00 00    	jne    5d997e <___bpf_prog_run+0x5ace>
20a1   5d5f51:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
20a6   5d5f56:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
20ab   5d5f5b:	e9 8f df ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
20b0   5d5f60:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
20b4   5d5f64:	48 89 f8             	mov    %rdi,%rax
20b7   5d5f67:	48 89 fa             	mov    %rdi,%rdx
20ba   5d5f6a:	48 c1 e8 03          	shr    $0x3,%rax
20be   5d5f6e:	83 e2 07             	and    $0x7,%edx
20c1   5d5f71:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
20c6   5d5f76:	38 d0                	cmp    %dl,%al
20c8   5d5f78:	7f 08                	jg     5d5f82 <___bpf_prog_run+0x20d2>
20ca   5d5f7a:	84 c0                	test   %al,%al
20cc   5d5f7c:	0f 85 22 43 00 00    	jne    5da2a4 <___bpf_prog_run+0x63f4>
20d2   5d5f82:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
20d6   5d5f86:	83 e0 0f             	and    $0xf,%eax
20d9   5d5f89:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
20dd   5d5f8d:	4c 89 f8             	mov    %r15,%rax
20e0   5d5f90:	48 c1 e8 03          	shr    $0x3,%rax
20e4   5d5f94:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
20e9   5d5f99:	0f 85 8a 4b 00 00    	jne    5dab29 <___bpf_prog_run+0x6c79>
20ef   5d5f9f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
20f3   5d5fa3:	49 8b 17             	mov    (%r15),%rdx
20f6   5d5fa6:	c0 e8 04             	shr    $0x4,%al
20f9   5d5fa9:	0f b6 c0             	movzbl %al,%eax
20fc   5d5fac:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2100   5d5fb0:	4c 89 f8             	mov    %r15,%rax
2103   5d5fb3:	48 c1 e8 03          	shr    $0x3,%rax
2107   5d5fb7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
210c   5d5fbc:	0f 85 52 4b 00 00    	jne    5dab14 <___bpf_prog_run+0x6c64>
2112   5d5fc2:	49 3b 17             	cmp    (%r15),%rdx
2115   5d5fc5:	0f 86 1b 2c 00 00    	jbe    5d8be6 <___bpf_prog_run+0x4d36>
211b   5d5fcb:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
211f   5d5fcf:	48 89 f8             	mov    %rdi,%rax
2122   5d5fd2:	48 c1 e8 03          	shr    $0x3,%rax
2126   5d5fd6:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
212b   5d5fdb:	48 89 f8             	mov    %rdi,%rax
212e   5d5fde:	83 e0 07             	and    $0x7,%eax
2131   5d5fe1:	83 c0 01             	add    $0x1,%eax
2134   5d5fe4:	38 d0                	cmp    %dl,%al
2136   5d5fe6:	7c 08                	jl     5d5ff0 <___bpf_prog_run+0x2140>
2138   5d5fe8:	84 d2                	test   %dl,%dl
213a   5d5fea:	0f 85 e8 3c 00 00    	jne    5d9cd8 <___bpf_prog_run+0x5e28>
2140   5d5ff0:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2145   5d5ff5:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
214a   5d5ffa:	e9 f0 de ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
214f   5d5fff:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2153   5d6003:	48 89 f8             	mov    %rdi,%rax
2156   5d6006:	48 89 fa             	mov    %rdi,%rdx
2159   5d6009:	48 c1 e8 03          	shr    $0x3,%rax
215d   5d600d:	83 e2 07             	and    $0x7,%edx
2160   5d6010:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2165   5d6015:	38 d0                	cmp    %dl,%al
2167   5d6017:	7f 08                	jg     5d6021 <___bpf_prog_run+0x2171>
2169   5d6019:	84 c0                	test   %al,%al
216b   5d601b:	0f 85 79 42 00 00    	jne    5da29a <___bpf_prog_run+0x63ea>
2171   5d6021:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2175   5d6025:	83 e0 0f             	and    $0xf,%eax
2178   5d6028:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
217c   5d602c:	4c 89 f8             	mov    %r15,%rax
217f   5d602f:	48 c1 e8 03          	shr    $0x3,%rax
2183   5d6033:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2188   5d6038:	0f 85 19 50 00 00    	jne    5db057 <___bpf_prog_run+0x71a7>
218e   5d603e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2192   5d6042:	4d 8b 3f             	mov    (%r15),%r15
2195   5d6045:	48 89 f8             	mov    %rdi,%rax
2198   5d6048:	48 c1 e8 03          	shr    $0x3,%rax
219c   5d604c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
21a1   5d6051:	48 89 f8             	mov    %rdi,%rax
21a4   5d6054:	83 e0 07             	and    $0x7,%eax
21a7   5d6057:	83 c0 03             	add    $0x3,%eax
21aa   5d605a:	38 d0                	cmp    %dl,%al
21ac   5d605c:	7c 08                	jl     5d6066 <___bpf_prog_run+0x21b6>
21ae   5d605e:	84 d2                	test   %dl,%dl
21b0   5d6060:	0f 85 ae 39 00 00    	jne    5d9a14 <___bpf_prog_run+0x5b64>
21b6   5d6066:	48 63 43 04          	movslq 0x4(%rbx),%rax
21ba   5d606a:	49 39 c7             	cmp    %rax,%r15
21bd   5d606d:	0f 8d e3 2a 00 00    	jge    5d8b56 <___bpf_prog_run+0x4ca6>
21c3   5d6073:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
21c7   5d6077:	48 89 f8             	mov    %rdi,%rax
21ca   5d607a:	48 c1 e8 03          	shr    $0x3,%rax
21ce   5d607e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
21d3   5d6083:	48 89 f8             	mov    %rdi,%rax
21d6   5d6086:	83 e0 07             	and    $0x7,%eax
21d9   5d6089:	83 c0 01             	add    $0x1,%eax
21dc   5d608c:	38 d0                	cmp    %dl,%al
21de   5d608e:	7c 08                	jl     5d6098 <___bpf_prog_run+0x21e8>
21e0   5d6090:	84 d2                	test   %dl,%dl
21e2   5d6092:	0f 85 72 39 00 00    	jne    5d9a0a <___bpf_prog_run+0x5b5a>
21e8   5d6098:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
21ed   5d609d:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
21f2   5d60a2:	e9 48 de ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
21f7   5d60a7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
21fb   5d60ab:	48 89 f8             	mov    %rdi,%rax
21fe   5d60ae:	48 89 fa             	mov    %rdi,%rdx
2201   5d60b1:	48 c1 e8 03          	shr    $0x3,%rax
2205   5d60b5:	83 e2 07             	and    $0x7,%edx
2208   5d60b8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
220d   5d60bd:	38 d0                	cmp    %dl,%al
220f   5d60bf:	7f 08                	jg     5d60c9 <___bpf_prog_run+0x2219>
2211   5d60c1:	84 c0                	test   %al,%al
2213   5d60c3:	0f 85 c7 41 00 00    	jne    5da290 <___bpf_prog_run+0x63e0>
2219   5d60c9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
221d   5d60cd:	83 e0 0f             	and    $0xf,%eax
2220   5d60d0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2224   5d60d4:	4c 89 f8             	mov    %r15,%rax
2227   5d60d7:	48 c1 e8 03          	shr    $0x3,%rax
222b   5d60db:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2230   5d60e0:	0f 85 9e 45 00 00    	jne    5da684 <___bpf_prog_run+0x67d4>
2236   5d60e6:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
223a   5d60ea:	4d 8b 3f             	mov    (%r15),%r15
223d   5d60ed:	48 89 f8             	mov    %rdi,%rax
2240   5d60f0:	48 c1 e8 03          	shr    $0x3,%rax
2244   5d60f4:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2249   5d60f9:	48 89 f8             	mov    %rdi,%rax
224c   5d60fc:	83 e0 07             	and    $0x7,%eax
224f   5d60ff:	83 c0 03             	add    $0x3,%eax
2252   5d6102:	38 d0                	cmp    %dl,%al
2254   5d6104:	7c 08                	jl     5d610e <___bpf_prog_run+0x225e>
2256   5d6106:	84 d2                	test   %dl,%dl
2258   5d6108:	0f 85 7e 39 00 00    	jne    5d9a8c <___bpf_prog_run+0x5bdc>
225e   5d610e:	48 63 43 04          	movslq 0x4(%rbx),%rax
2262   5d6112:	49 39 c7             	cmp    %rax,%r15
2265   5d6115:	0f 82 83 2a 00 00    	jb     5d8b9e <___bpf_prog_run+0x4cee>
226b   5d611b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
226f   5d611f:	48 89 f8             	mov    %rdi,%rax
2272   5d6122:	48 c1 e8 03          	shr    $0x3,%rax
2276   5d6126:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
227b   5d612b:	48 89 f8             	mov    %rdi,%rax
227e   5d612e:	83 e0 07             	and    $0x7,%eax
2281   5d6131:	83 c0 01             	add    $0x1,%eax
2284   5d6134:	38 d0                	cmp    %dl,%al
2286   5d6136:	7c 08                	jl     5d6140 <___bpf_prog_run+0x2290>
2288   5d6138:	84 d2                	test   %dl,%dl
228a   5d613a:	0f 85 42 39 00 00    	jne    5d9a82 <___bpf_prog_run+0x5bd2>
2290   5d6140:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2295   5d6145:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
229a   5d614a:	e9 a0 dd ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
229f   5d614f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
22a3   5d6153:	48 89 f8             	mov    %rdi,%rax
22a6   5d6156:	48 89 fa             	mov    %rdi,%rdx
22a9   5d6159:	48 c1 e8 03          	shr    $0x3,%rax
22ad   5d615d:	83 e2 07             	and    $0x7,%edx
22b0   5d6160:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
22b5   5d6165:	38 d0                	cmp    %dl,%al
22b7   5d6167:	7f 08                	jg     5d6171 <___bpf_prog_run+0x22c1>
22b9   5d6169:	84 c0                	test   %al,%al
22bb   5d616b:	0f 85 15 41 00 00    	jne    5da286 <___bpf_prog_run+0x63d6>
22c1   5d6171:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
22c5   5d6175:	83 e0 0f             	and    $0xf,%eax
22c8   5d6178:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
22cc   5d617c:	4c 89 f8             	mov    %r15,%rax
22cf   5d617f:	48 c1 e8 03          	shr    $0x3,%rax
22d3   5d6183:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
22d8   5d6188:	0f 85 9b 4d 00 00    	jne    5daf29 <___bpf_prog_run+0x7079>
22de   5d618e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
22e2   5d6192:	4d 8b 3f             	mov    (%r15),%r15
22e5   5d6195:	48 89 f8             	mov    %rdi,%rax
22e8   5d6198:	48 c1 e8 03          	shr    $0x3,%rax
22ec   5d619c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
22f1   5d61a1:	48 89 f8             	mov    %rdi,%rax
22f4   5d61a4:	83 e0 07             	and    $0x7,%eax
22f7   5d61a7:	83 c0 03             	add    $0x3,%eax
22fa   5d61aa:	38 d0                	cmp    %dl,%al
22fc   5d61ac:	7c 08                	jl     5d61b6 <___bpf_prog_run+0x2306>
22fe   5d61ae:	84 d2                	test   %dl,%dl
2300   5d61b0:	0f 85 e6 37 00 00    	jne    5d999c <___bpf_prog_run+0x5aec>
2306   5d61b6:	48 63 43 04          	movslq 0x4(%rbx),%rax
230a   5d61ba:	4c 85 f8             	test   %r15,%rax
230d   5d61bd:	0f 84 4b 29 00 00    	je     5d8b0e <___bpf_prog_run+0x4c5e>
2313   5d61c3:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2317   5d61c7:	48 89 f8             	mov    %rdi,%rax
231a   5d61ca:	48 c1 e8 03          	shr    $0x3,%rax
231e   5d61ce:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2323   5d61d3:	48 89 f8             	mov    %rdi,%rax
2326   5d61d6:	83 e0 07             	and    $0x7,%eax
2329   5d61d9:	83 c0 01             	add    $0x1,%eax
232c   5d61dc:	38 d0                	cmp    %dl,%al
232e   5d61de:	7c 08                	jl     5d61e8 <___bpf_prog_run+0x2338>
2330   5d61e0:	84 d2                	test   %dl,%dl
2332   5d61e2:	0f 85 aa 37 00 00    	jne    5d9992 <___bpf_prog_run+0x5ae2>
2338   5d61e8:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
233d   5d61ed:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2342   5d61f2:	e9 f8 dc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2347   5d61f7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
234b   5d61fb:	48 89 f8             	mov    %rdi,%rax
234e   5d61fe:	48 89 fa             	mov    %rdi,%rdx
2351   5d6201:	48 c1 e8 03          	shr    $0x3,%rax
2355   5d6205:	83 e2 07             	and    $0x7,%edx
2358   5d6208:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
235d   5d620d:	38 d0                	cmp    %dl,%al
235f   5d620f:	7f 08                	jg     5d6219 <___bpf_prog_run+0x2369>
2361   5d6211:	84 c0                	test   %al,%al
2363   5d6213:	0f 85 63 40 00 00    	jne    5da27c <___bpf_prog_run+0x63cc>
2369   5d6219:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
236d   5d621d:	83 e0 0f             	and    $0xf,%eax
2370   5d6220:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2374   5d6224:	4c 89 f8             	mov    %r15,%rax
2377   5d6227:	48 c1 e8 03          	shr    $0x3,%rax
237b   5d622b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2380   5d6230:	0f 85 00 49 00 00    	jne    5dab36 <___bpf_prog_run+0x6c86>
2386   5d6236:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
238a   5d623a:	4d 8b 3f             	mov    (%r15),%r15
238d   5d623d:	48 89 f8             	mov    %rdi,%rax
2390   5d6240:	48 c1 e8 03          	shr    $0x3,%rax
2394   5d6244:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2399   5d6249:	48 89 f8             	mov    %rdi,%rax
239c   5d624c:	83 e0 07             	and    $0x7,%eax
239f   5d624f:	83 c0 03             	add    $0x3,%eax
23a2   5d6252:	38 d0                	cmp    %dl,%al
23a4   5d6254:	7c 08                	jl     5d625e <___bpf_prog_run+0x23ae>
23a6   5d6256:	84 d2                	test   %dl,%dl
23a8   5d6258:	0f 85 48 3a 00 00    	jne    5d9ca6 <___bpf_prog_run+0x5df6>
23ae   5d625e:	48 63 43 04          	movslq 0x4(%rbx),%rax
23b2   5d6262:	49 39 c7             	cmp    %rax,%r15
23b5   5d6265:	0f 86 57 29 00 00    	jbe    5d8bc2 <___bpf_prog_run+0x4d12>
23bb   5d626b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
23bf   5d626f:	48 89 f8             	mov    %rdi,%rax
23c2   5d6272:	48 c1 e8 03          	shr    $0x3,%rax
23c6   5d6276:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
23cb   5d627b:	48 89 f8             	mov    %rdi,%rax
23ce   5d627e:	83 e0 07             	and    $0x7,%eax
23d1   5d6281:	83 c0 01             	add    $0x1,%eax
23d4   5d6284:	38 d0                	cmp    %dl,%al
23d6   5d6286:	7c 08                	jl     5d6290 <___bpf_prog_run+0x23e0>
23d8   5d6288:	84 d2                	test   %dl,%dl
23da   5d628a:	0f 85 0c 3a 00 00    	jne    5d9c9c <___bpf_prog_run+0x5dec>
23e0   5d6290:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
23e5   5d6295:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
23ea   5d629a:	e9 50 dc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
23ef   5d629f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
23f3   5d62a3:	48 89 f8             	mov    %rdi,%rax
23f6   5d62a6:	48 89 fa             	mov    %rdi,%rdx
23f9   5d62a9:	48 c1 e8 03          	shr    $0x3,%rax
23fd   5d62ad:	83 e2 07             	and    $0x7,%edx
2400   5d62b0:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2405   5d62b5:	38 d0                	cmp    %dl,%al
2407   5d62b7:	7f 08                	jg     5d62c1 <___bpf_prog_run+0x2411>
2409   5d62b9:	84 c0                	test   %al,%al
240b   5d62bb:	0f 85 b1 3f 00 00    	jne    5da272 <___bpf_prog_run+0x63c2>
2411   5d62c1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2415   5d62c5:	83 e0 0f             	and    $0xf,%eax
2418   5d62c8:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
241c   5d62cc:	4c 89 f8             	mov    %r15,%rax
241f   5d62cf:	48 c1 e8 03          	shr    $0x3,%rax
2423   5d62d3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2428   5d62d8:	0f 85 d7 4d 00 00    	jne    5db0b5 <___bpf_prog_run+0x7205>
242e   5d62de:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2432   5d62e2:	4d 8b 3f             	mov    (%r15),%r15
2435   5d62e5:	48 89 f8             	mov    %rdi,%rax
2438   5d62e8:	48 c1 e8 03          	shr    $0x3,%rax
243c   5d62ec:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2441   5d62f1:	48 89 f8             	mov    %rdi,%rax
2444   5d62f4:	83 e0 07             	and    $0x7,%eax
2447   5d62f7:	83 c0 03             	add    $0x3,%eax
244a   5d62fa:	38 d0                	cmp    %dl,%al
244c   5d62fc:	7c 08                	jl     5d6306 <___bpf_prog_run+0x2456>
244e   5d62fe:	84 d2                	test   %dl,%dl
2450   5d6300:	0f 85 d2 36 00 00    	jne    5d99d8 <___bpf_prog_run+0x5b28>
2456   5d6306:	48 63 43 04          	movslq 0x4(%rbx),%rax
245a   5d630a:	49 39 c7             	cmp    %rax,%r15
245d   5d630d:	0f 8e 1f 28 00 00    	jle    5d8b32 <___bpf_prog_run+0x4c82>
2463   5d6313:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
2467   5d6317:	48 89 f8             	mov    %rdi,%rax
246a   5d631a:	48 c1 e8 03          	shr    $0x3,%rax
246e   5d631e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2473   5d6323:	48 89 f8             	mov    %rdi,%rax
2476   5d6326:	83 e0 07             	and    $0x7,%eax
2479   5d6329:	83 c0 01             	add    $0x1,%eax
247c   5d632c:	38 d0                	cmp    %dl,%al
247e   5d632e:	7c 08                	jl     5d6338 <___bpf_prog_run+0x2488>
2480   5d6330:	84 d2                	test   %dl,%dl
2482   5d6332:	0f 85 96 36 00 00    	jne    5d99ce <___bpf_prog_run+0x5b1e>
2488   5d6338:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
248d   5d633d:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2492   5d6342:	e9 a8 db ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2497   5d6347:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
249b   5d634b:	48 89 f8             	mov    %rdi,%rax
249e   5d634e:	48 89 fa             	mov    %rdi,%rdx
24a1   5d6351:	48 c1 e8 03          	shr    $0x3,%rax
24a5   5d6355:	83 e2 07             	and    $0x7,%edx
24a8   5d6358:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
24ad   5d635d:	38 d0                	cmp    %dl,%al
24af   5d635f:	7f 08                	jg     5d6369 <___bpf_prog_run+0x24b9>
24b1   5d6361:	84 c0                	test   %al,%al
24b3   5d6363:	0f 85 ff 3e 00 00    	jne    5da268 <___bpf_prog_run+0x63b8>
24b9   5d6369:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
24bd   5d636d:	83 e0 0f             	and    $0xf,%eax
24c0   5d6370:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
24c4   5d6374:	4c 89 f8             	mov    %r15,%rax
24c7   5d6377:	48 c1 e8 03          	shr    $0x3,%rax
24cb   5d637b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
24d0   5d6380:	0f 85 18 43 00 00    	jne    5da69e <___bpf_prog_run+0x67ee>
24d6   5d6386:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
24da   5d638a:	4d 8b 3f             	mov    (%r15),%r15
24dd   5d638d:	48 89 f8             	mov    %rdi,%rax
24e0   5d6390:	48 c1 e8 03          	shr    $0x3,%rax
24e4   5d6394:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
24e9   5d6399:	48 89 f8             	mov    %rdi,%rax
24ec   5d639c:	83 e0 07             	and    $0x7,%eax
24ef   5d639f:	83 c0 03             	add    $0x3,%eax
24f2   5d63a2:	38 d0                	cmp    %dl,%al
24f4   5d63a4:	7c 08                	jl     5d63ae <___bpf_prog_run+0x24fe>
24f6   5d63a6:	84 d2                	test   %dl,%dl
24f8   5d63a8:	0f 85 a2 36 00 00    	jne    5d9a50 <___bpf_prog_run+0x5ba0>
24fe   5d63ae:	48 63 43 04          	movslq 0x4(%rbx),%rax
2502   5d63b2:	49 39 c7             	cmp    %rax,%r15
2505   5d63b5:	0f 83 bf 27 00 00    	jae    5d8b7a <___bpf_prog_run+0x4cca>
250b   5d63bb:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
250f   5d63bf:	48 89 f8             	mov    %rdi,%rax
2512   5d63c2:	48 c1 e8 03          	shr    $0x3,%rax
2516   5d63c6:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
251b   5d63cb:	48 89 f8             	mov    %rdi,%rax
251e   5d63ce:	83 e0 07             	and    $0x7,%eax
2521   5d63d1:	83 c0 01             	add    $0x1,%eax
2524   5d63d4:	38 d0                	cmp    %dl,%al
2526   5d63d6:	7c 08                	jl     5d63e0 <___bpf_prog_run+0x2530>
2528   5d63d8:	84 d2                	test   %dl,%dl
252a   5d63da:	0f 85 66 36 00 00    	jne    5d9a46 <___bpf_prog_run+0x5b96>
2530   5d63e0:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2535   5d63e5:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
253a   5d63ea:	e9 00 db ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
253f   5d63ef:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2543   5d63f3:	48 89 f8             	mov    %rdi,%rax
2546   5d63f6:	48 89 fa             	mov    %rdi,%rdx
2549   5d63f9:	48 c1 e8 03          	shr    $0x3,%rax
254d   5d63fd:	83 e2 07             	and    $0x7,%edx
2550   5d6400:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2555   5d6405:	38 d0                	cmp    %dl,%al
2557   5d6407:	7f 08                	jg     5d6411 <___bpf_prog_run+0x2561>
2559   5d6409:	84 c0                	test   %al,%al
255b   5d640b:	0f 85 4d 3e 00 00    	jne    5da25e <___bpf_prog_run+0x63ae>
2561   5d6411:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2565   5d6415:	83 e0 0f             	and    $0xf,%eax
2568   5d6418:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
256c   5d641c:	4c 89 f8             	mov    %r15,%rax
256f   5d641f:	48 c1 e8 03          	shr    $0x3,%rax
2573   5d6423:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2578   5d6428:	0f 85 1d 4b 00 00    	jne    5daf4b <___bpf_prog_run+0x709b>
257e   5d642e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2582   5d6432:	4d 8b 3f             	mov    (%r15),%r15
2585   5d6435:	48 89 f8             	mov    %rdi,%rax
2588   5d6438:	48 c1 e8 03          	shr    $0x3,%rax
258c   5d643c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2591   5d6441:	48 89 f8             	mov    %rdi,%rax
2594   5d6444:	83 e0 07             	and    $0x7,%eax
2597   5d6447:	83 c0 03             	add    $0x3,%eax
259a   5d644a:	38 d0                	cmp    %dl,%al
259c   5d644c:	7c 08                	jl     5d6456 <___bpf_prog_run+0x25a6>
259e   5d644e:	84 d2                	test   %dl,%dl
25a0   5d6450:	0f 85 0a 35 00 00    	jne    5d9960 <___bpf_prog_run+0x5ab0>
25a6   5d6456:	48 63 43 04          	movslq 0x4(%rbx),%rax
25aa   5d645a:	49 39 c7             	cmp    %rax,%r15
25ad   5d645d:	0f 87 87 26 00 00    	ja     5d8aea <___bpf_prog_run+0x4c3a>
25b3   5d6463:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
25b7   5d6467:	48 89 f8             	mov    %rdi,%rax
25ba   5d646a:	48 c1 e8 03          	shr    $0x3,%rax
25be   5d646e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
25c3   5d6473:	48 89 f8             	mov    %rdi,%rax
25c6   5d6476:	83 e0 07             	and    $0x7,%eax
25c9   5d6479:	83 c0 01             	add    $0x1,%eax
25cc   5d647c:	38 d0                	cmp    %dl,%al
25ce   5d647e:	7c 08                	jl     5d6488 <___bpf_prog_run+0x25d8>
25d0   5d6480:	84 d2                	test   %dl,%dl
25d2   5d6482:	0f 85 ce 34 00 00    	jne    5d9956 <___bpf_prog_run+0x5aa6>
25d8   5d6488:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
25dd   5d648d:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
25e2   5d6492:	e9 58 da ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
25e7   5d6497:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
25eb   5d649b:	48 89 f8             	mov    %rdi,%rax
25ee   5d649e:	48 89 fa             	mov    %rdi,%rdx
25f1   5d64a1:	48 c1 e8 03          	shr    $0x3,%rax
25f5   5d64a5:	83 e2 07             	and    $0x7,%edx
25f8   5d64a8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
25fd   5d64ad:	38 d0                	cmp    %dl,%al
25ff   5d64af:	7f 08                	jg     5d64b9 <___bpf_prog_run+0x2609>
2601   5d64b1:	84 c0                	test   %al,%al
2603   5d64b3:	0f 85 9b 3d 00 00    	jne    5da254 <___bpf_prog_run+0x63a4>
2609   5d64b9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
260d   5d64bd:	83 e0 0f             	and    $0xf,%eax
2610   5d64c0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2614   5d64c4:	4c 89 f8             	mov    %r15,%rax
2617   5d64c7:	48 c1 e8 03          	shr    $0x3,%rax
261b   5d64cb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2620   5d64d0:	0f 85 0b 40 00 00    	jne    5da4e1 <___bpf_prog_run+0x6631>
2626   5d64d6:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
262a   5d64da:	4d 8b 3f             	mov    (%r15),%r15
262d   5d64dd:	48 89 f8             	mov    %rdi,%rax
2630   5d64e0:	48 c1 e8 03          	shr    $0x3,%rax
2634   5d64e4:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2639   5d64e9:	48 89 f8             	mov    %rdi,%rax
263c   5d64ec:	83 e0 07             	and    $0x7,%eax
263f   5d64ef:	83 c0 03             	add    $0x3,%eax
2642   5d64f2:	38 d0                	cmp    %dl,%al
2644   5d64f4:	7c 08                	jl     5d64fe <___bpf_prog_run+0x264e>
2646   5d64f6:	84 d2                	test   %dl,%dl
2648   5d64f8:	0f 85 e9 36 00 00    	jne    5d9be7 <___bpf_prog_run+0x5d37>
264e   5d64fe:	48 63 43 04          	movslq 0x4(%rbx),%rax
2652   5d6502:	49 39 c7             	cmp    %rax,%r15
2655   5d6505:	0f 84 cb 27 00 00    	je     5d8cd6 <___bpf_prog_run+0x4e26>
265b   5d650b:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
265f   5d650f:	48 89 f8             	mov    %rdi,%rax
2662   5d6512:	48 c1 e8 03          	shr    $0x3,%rax
2666   5d6516:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
266b   5d651b:	48 89 f8             	mov    %rdi,%rax
266e   5d651e:	83 e0 07             	and    $0x7,%eax
2671   5d6521:	83 c0 01             	add    $0x1,%eax
2674   5d6524:	38 d0                	cmp    %dl,%al
2676   5d6526:	7c 08                	jl     5d6530 <___bpf_prog_run+0x2680>
2678   5d6528:	84 d2                	test   %dl,%dl
267a   5d652a:	0f 85 51 40 00 00    	jne    5da581 <___bpf_prog_run+0x66d1>
2680   5d6530:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2685   5d6535:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
268a   5d653a:	e9 b0 d9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
268f   5d653f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2693   5d6543:	48 89 f8             	mov    %rdi,%rax
2696   5d6546:	48 89 fa             	mov    %rdi,%rdx
2699   5d6549:	48 c1 e8 03          	shr    $0x3,%rax
269d   5d654d:	83 e2 07             	and    $0x7,%edx
26a0   5d6550:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
26a5   5d6555:	38 d0                	cmp    %dl,%al
26a7   5d6557:	7f 08                	jg     5d6561 <___bpf_prog_run+0x26b1>
26a9   5d6559:	84 c0                	test   %al,%al
26ab   5d655b:	0f 85 e9 3c 00 00    	jne    5da24a <___bpf_prog_run+0x639a>
26b1   5d6561:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
26b5   5d6565:	83 e0 0f             	and    $0xf,%eax
26b8   5d6568:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
26bc   5d656c:	4c 89 f8             	mov    %r15,%rax
26bf   5d656f:	48 c1 e8 03          	shr    $0x3,%rax
26c3   5d6573:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
26c8   5d6578:	0f 85 61 44 00 00    	jne    5da9df <___bpf_prog_run+0x6b2f>
26ce   5d657e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
26d2   5d6582:	49 8b 17             	mov    (%r15),%rdx
26d5   5d6585:	c0 e8 04             	shr    $0x4,%al
26d8   5d6588:	0f b6 c0             	movzbl %al,%eax
26db   5d658b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
26df   5d658f:	4c 89 f8             	mov    %r15,%rax
26e2   5d6592:	48 c1 e8 03          	shr    $0x3,%rax
26e6   5d6596:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
26eb   5d659b:	0f 85 d8 43 00 00    	jne    5da979 <___bpf_prog_run+0x6ac9>
26f1   5d65a1:	41 39 17             	cmp    %edx,(%r15)
26f4   5d65a4:	0f 84 e3 27 00 00    	je     5d8d8d <___bpf_prog_run+0x4edd>
26fa   5d65aa:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
26fe   5d65ae:	48 89 f8             	mov    %rdi,%rax
2701   5d65b1:	48 c1 e8 03          	shr    $0x3,%rax
2705   5d65b5:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
270a   5d65ba:	48 89 f8             	mov    %rdi,%rax
270d   5d65bd:	83 e0 07             	and    $0x7,%eax
2710   5d65c0:	83 c0 01             	add    $0x1,%eax
2713   5d65c3:	38 d0                	cmp    %dl,%al
2715   5d65c5:	7c 08                	jl     5d65cf <___bpf_prog_run+0x271f>
2717   5d65c7:	84 d2                	test   %dl,%dl
2719   5d65c9:	0f 85 a0 3e 00 00    	jne    5da46f <___bpf_prog_run+0x65bf>
271f   5d65cf:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
2724   5d65d4:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
2729   5d65d9:	e9 11 d9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
272e   5d65de:	4c 8d 43 01          	lea    0x1(%rbx),%r8
2732   5d65e2:	4c 89 c0             	mov    %r8,%rax
2735   5d65e5:	4c 89 c2             	mov    %r8,%rdx
2738   5d65e8:	48 c1 e8 03          	shr    $0x3,%rax
273c   5d65ec:	83 e2 07             	and    $0x7,%edx
273f   5d65ef:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2744   5d65f4:	38 d0                	cmp    %dl,%al
2746   5d65f6:	7f 08                	jg     5d6600 <___bpf_prog_run+0x2750>
2748   5d65f8:	84 c0                	test   %al,%al
274a   5d65fa:	0f 85 35 3c 00 00    	jne    5da235 <___bpf_prog_run+0x6385>
2750   5d6600:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2754   5d6604:	83 e0 0f             	and    $0xf,%eax
2757   5d6607:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
275b   5d660b:	4c 89 f8             	mov    %r15,%rax
275e   5d660e:	48 c1 e8 03          	shr    $0x3,%rax
2762   5d6612:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2767   5d6617:	0f 85 78 46 00 00    	jne    5dac95 <___bpf_prog_run+0x6de5>
276d   5d661d:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
2771   5d6621:	49 8b 07             	mov    (%r15),%rax
2774   5d6624:	4c 89 ca             	mov    %r9,%rdx
2777   5d6627:	48 c1 ea 03          	shr    $0x3,%rdx
277b   5d662b:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2780   5d6630:	4c 89 ca             	mov    %r9,%rdx
2783   5d6633:	83 e2 07             	and    $0x7,%edx
2786   5d6636:	83 c2 03             	add    $0x3,%edx
2789   5d6639:	38 ca                	cmp    %cl,%dl
278b   5d663b:	7c 08                	jl     5d6645 <___bpf_prog_run+0x2795>
278d   5d663d:	84 c9                	test   %cl,%cl
278f   5d663f:	0f 85 da 34 00 00    	jne    5d9b1f <___bpf_prog_run+0x5c6f>
2795   5d6645:	8b 4b 04             	mov    0x4(%rbx),%ecx
2798   5d6648:	83 f9 1f             	cmp    $0x1f,%ecx
279b   5d664b:	0f 87 00 00 00 00    	ja     5d6651 <___bpf_prog_run+0x27a1>	5d664d: R_X86_64_PC32	.text.unlikely+0x6cf9
27a1   5d6651:	4c 89 fa             	mov    %r15,%rdx
27a4   5d6654:	d3 e8                	shr    %cl,%eax
27a6   5d6656:	48 c1 ea 03          	shr    $0x3,%rdx
27aa   5d665a:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
27af   5d665f:	0f 85 7b 45 00 00    	jne    5dabe0 <___bpf_prog_run+0x6d30>
27b5   5d6665:	49 89 07             	mov    %rax,(%r15)
27b8   5d6668:	48 83 c3 08          	add    $0x8,%rbx
27bc   5d666c:	e9 7e d8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
27c1   5d6671:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
27c5   5d6675:	48 89 f8             	mov    %rdi,%rax
27c8   5d6678:	48 89 fa             	mov    %rdi,%rdx
27cb   5d667b:	48 c1 e8 03          	shr    $0x3,%rax
27cf   5d667f:	83 e2 07             	and    $0x7,%edx
27d2   5d6682:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
27d7   5d6687:	38 d0                	cmp    %dl,%al
27d9   5d6689:	7f 08                	jg     5d6693 <___bpf_prog_run+0x27e3>
27db   5d668b:	84 c0                	test   %al,%al
27dd   5d668d:	0f 85 98 3b 00 00    	jne    5da22b <___bpf_prog_run+0x637b>
27e3   5d6693:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
27e7   5d6697:	c0 e8 04             	shr    $0x4,%al
27ea   5d669a:	0f b6 c0             	movzbl %al,%eax
27ed   5d669d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
27f1   5d66a1:	4c 89 f8             	mov    %r15,%rax
27f4   5d66a4:	48 c1 e8 03          	shr    $0x3,%rax
27f8   5d66a8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
27fd   5d66ad:	0f 85 58 43 00 00    	jne    5daa0b <___bpf_prog_run+0x6b5b>
2803   5d66b3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2807   5d66b7:	49 8b 0f             	mov    (%r15),%rcx
280a   5d66ba:	83 e0 0f             	and    $0xf,%eax
280d   5d66bd:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2811   5d66c1:	4c 89 f8             	mov    %r15,%rax
2814   5d66c4:	48 c1 e8 03          	shr    $0x3,%rax
2818   5d66c8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
281d   5d66cd:	0f 85 cf 3e 00 00    	jne    5da5a2 <___bpf_prog_run+0x66f2>
2823   5d66d3:	49 8b 07             	mov    (%r15),%rax
2826   5d66d6:	31 d2                	xor    %edx,%edx
2828   5d66d8:	48 83 c3 08          	add    $0x8,%rbx
282c   5d66dc:	48 f7 f1             	div    %rcx
282f   5d66df:	49 89 07             	mov    %rax,(%r15)
2832   5d66e2:	e9 08 d8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2837   5d66e7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
283b   5d66eb:	48 89 f8             	mov    %rdi,%rax
283e   5d66ee:	48 89 fa             	mov    %rdi,%rdx
2841   5d66f1:	48 c1 e8 03          	shr    $0x3,%rax
2845   5d66f5:	83 e2 07             	and    $0x7,%edx
2848   5d66f8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
284d   5d66fd:	38 d0                	cmp    %dl,%al
284f   5d66ff:	7f 08                	jg     5d6709 <___bpf_prog_run+0x2859>
2851   5d6701:	84 c0                	test   %al,%al
2853   5d6703:	0f 85 18 3b 00 00    	jne    5da221 <___bpf_prog_run+0x6371>
2859   5d6709:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
285d   5d670d:	83 e0 0f             	and    $0xf,%eax
2860   5d6710:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2864   5d6714:	4c 89 f8             	mov    %r15,%rax
2867   5d6717:	48 c1 e8 03          	shr    $0x3,%rax
286b   5d671b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2870   5d6720:	0f 85 bb 45 00 00    	jne    5dace1 <___bpf_prog_run+0x6e31>
2876   5d6726:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
287a   5d672a:	49 8b 07             	mov    (%r15),%rax
287d   5d672d:	48 89 fa             	mov    %rdi,%rdx
2880   5d6730:	48 c1 ea 03          	shr    $0x3,%rdx
2884   5d6734:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2889   5d6739:	48 89 fa             	mov    %rdi,%rdx
288c   5d673c:	83 e2 07             	and    $0x7,%edx
288f   5d673f:	83 c2 03             	add    $0x3,%edx
2892   5d6742:	38 ca                	cmp    %cl,%dl
2894   5d6744:	7c 08                	jl     5d674e <___bpf_prog_run+0x289e>
2896   5d6746:	84 c9                	test   %cl,%cl
2898   5d6748:	0f 85 51 34 00 00    	jne    5d9b9f <___bpf_prog_run+0x5cef>
289e   5d674e:	0b 43 04             	or     0x4(%rbx),%eax
28a1   5d6751:	48 83 c3 08          	add    $0x8,%rbx
28a5   5d6755:	49 89 07             	mov    %rax,(%r15)
28a8   5d6758:	e9 92 d7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
28ad   5d675d:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
28b2   5d6762:	0f 85 df 3d 00 00    	jne    5da547 <___bpf_prog_run+0x6697>
28b8   5d6768:	49 8d 7e 18          	lea    0x18(%r14),%rdi
28bc   5d676c:	49 8b 56 10          	mov    0x10(%r14),%rdx
28c0   5d6770:	48 89 f8             	mov    %rdi,%rax
28c3   5d6773:	48 c1 e8 03          	shr    $0x3,%rax
28c7   5d6777:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
28cc   5d677c:	0f 85 b3 3d 00 00    	jne    5da535 <___bpf_prog_run+0x6685>
28d2   5d6782:	48 8d 7a 24          	lea    0x24(%rdx),%rdi
28d6   5d6786:	4d 8b 7e 18          	mov    0x18(%r14),%r15
28da   5d678a:	48 89 f8             	mov    %rdi,%rax
28dd   5d678d:	48 c1 e8 03          	shr    $0x3,%rax
28e1   5d6791:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
28e6   5d6796:	48 89 f8             	mov    %rdi,%rax
28e9   5d6799:	83 e0 07             	and    $0x7,%eax
28ec   5d679c:	83 c0 03             	add    $0x3,%eax
28ef   5d679f:	38 c8                	cmp    %cl,%al
28f1   5d67a1:	7c 08                	jl     5d67ab <___bpf_prog_run+0x28fb>
28f3   5d67a3:	84 c9                	test   %cl,%cl
28f5   5d67a5:	0f 85 64 3a 00 00    	jne    5da20f <___bpf_prog_run+0x635f>
28fb   5d67ab:	44 39 7a 24          	cmp    %r15d,0x24(%rdx)
28ff   5d67af:	0f 86 c9 24 00 00    	jbe    5d8c7e <___bpf_prog_run+0x4dce>
2905   5d67b5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
2908   5d67b8:	83 f8 20             	cmp    $0x20,%eax
290b   5d67bb:	0f 87 bd 24 00 00    	ja     5d8c7e <___bpf_prog_run+0x4dce>
2911   5d67c1:	83 c0 01             	add    $0x1,%eax
2914   5d67c4:	89 45 d4             	mov    %eax,-0x2c(%rbp)
2917   5d67c7:	44 89 f8             	mov    %r15d,%eax
291a   5d67ca:	48 8d bc c2 d0 01 00 00 	lea    0x1d0(%rdx,%rax,8),%rdi
2922   5d67d2:	48 89 f8             	mov    %rdi,%rax
2925   5d67d5:	48 c1 e8 03          	shr    $0x3,%rax
2929   5d67d9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
292e   5d67de:	0f 85 da 42 00 00    	jne    5daabe <___bpf_prog_run+0x6c0e>
2934   5d67e4:	44 89 f8             	mov    %r15d,%eax
2937   5d67e7:	48 83 c0 3a          	add    $0x3a,%rax
293b   5d67eb:	48 8b 04 c2          	mov    (%rdx,%rax,8),%rax
293f   5d67ef:	48 85 c0             	test   %rax,%rax
2942   5d67f2:	0f 84 86 24 00 00    	je     5d8c7e <___bpf_prog_run+0x4dce>
2948   5d67f8:	48 8d 58 48          	lea    0x48(%rax),%rbx
294c   5d67fc:	e9 ee d6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2951   5d6801:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2955   5d6805:	48 89 f8             	mov    %rdi,%rax
2958   5d6808:	48 89 fa             	mov    %rdi,%rdx
295b   5d680b:	48 c1 e8 03          	shr    $0x3,%rax
295f   5d680f:	83 e2 07             	and    $0x7,%edx
2962   5d6812:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2967   5d6817:	38 d0                	cmp    %dl,%al
2969   5d6819:	7f 08                	jg     5d6823 <___bpf_prog_run+0x2973>
296b   5d681b:	84 c0                	test   %al,%al
296d   5d681d:	0f 85 e2 39 00 00    	jne    5da205 <___bpf_prog_run+0x6355>
2973   5d6823:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2977   5d6827:	83 e0 0f             	and    $0xf,%eax
297a   5d682a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
297e   5d682e:	4c 89 f8             	mov    %r15,%rax
2981   5d6831:	48 c1 e8 03          	shr    $0x3,%rax
2985   5d6835:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
298a   5d683a:	0f 85 1d 3f 00 00    	jne    5da75d <___bpf_prog_run+0x68ad>
2990   5d6840:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2994   5d6844:	49 8b 07             	mov    (%r15),%rax
2997   5d6847:	48 89 fa             	mov    %rdi,%rdx
299a   5d684a:	48 c1 ea 03          	shr    $0x3,%rdx
299e   5d684e:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
29a3   5d6853:	48 89 fa             	mov    %rdi,%rdx
29a6   5d6856:	83 e2 07             	and    $0x7,%edx
29a9   5d6859:	83 c2 03             	add    $0x3,%edx
29ac   5d685c:	38 ca                	cmp    %cl,%dl
29ae   5d685e:	7c 08                	jl     5d6868 <___bpf_prog_run+0x29b8>
29b0   5d6860:	84 c9                	test   %cl,%cl
29b2   5d6862:	0f 85 6e 32 00 00    	jne    5d9ad6 <___bpf_prog_run+0x5c26>
29b8   5d6868:	0f af 43 04          	imul   0x4(%rbx),%eax
29bc   5d686c:	48 83 c3 08          	add    $0x8,%rbx
29c0   5d6870:	49 89 07             	mov    %rax,(%r15)
29c3   5d6873:	e9 77 d6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
29c8   5d6878:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
29cc   5d687c:	48 89 f8             	mov    %rdi,%rax
29cf   5d687f:	48 89 fa             	mov    %rdi,%rdx
29d2   5d6882:	48 c1 e8 03          	shr    $0x3,%rax
29d6   5d6886:	83 e2 07             	and    $0x7,%edx
29d9   5d6889:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
29de   5d688e:	38 d0                	cmp    %dl,%al
29e0   5d6890:	7f 08                	jg     5d689a <___bpf_prog_run+0x29ea>
29e2   5d6892:	84 c0                	test   %al,%al
29e4   5d6894:	0f 85 61 39 00 00    	jne    5da1fb <___bpf_prog_run+0x634b>
29ea   5d689a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
29ee   5d689e:	c0 e8 04             	shr    $0x4,%al
29f1   5d68a1:	0f b6 c0             	movzbl %al,%eax
29f4   5d68a4:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
29f8   5d68a8:	4c 89 f8             	mov    %r15,%rax
29fb   5d68ab:	48 c1 e8 03          	shr    $0x3,%rax
29ff   5d68af:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2a04   5d68b4:	0f 85 da 3f 00 00    	jne    5da894 <___bpf_prog_run+0x69e4>
2a0a   5d68ba:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2a0e   5d68be:	49 8b 0f             	mov    (%r15),%rcx
2a11   5d68c1:	83 e0 0f             	and    $0xf,%eax
2a14   5d68c4:	83 e1 1f             	and    $0x1f,%ecx
2a17   5d68c7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2a1b   5d68cb:	4c 89 f8             	mov    %r15,%rax
2a1e   5d68ce:	48 c1 e8 03          	shr    $0x3,%rax
2a22   5d68d2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2a27   5d68d7:	0f 85 a2 3f 00 00    	jne    5da87f <___bpf_prog_run+0x69cf>
2a2d   5d68dd:	41 8b 07             	mov    (%r15),%eax
2a30   5d68e0:	48 83 c3 08          	add    $0x8,%rbx
2a34   5d68e4:	d3 f8                	sar    %cl,%eax
2a36   5d68e6:	49 89 07             	mov    %rax,(%r15)
2a39   5d68e9:	e9 01 d6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2a3e   5d68ee:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2a42   5d68f2:	48 89 f8             	mov    %rdi,%rax
2a45   5d68f5:	48 89 fa             	mov    %rdi,%rdx
2a48   5d68f8:	48 c1 e8 03          	shr    $0x3,%rax
2a4c   5d68fc:	83 e2 07             	and    $0x7,%edx
2a4f   5d68ff:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2a54   5d6904:	38 d0                	cmp    %dl,%al
2a56   5d6906:	7f 08                	jg     5d6910 <___bpf_prog_run+0x2a60>
2a58   5d6908:	84 c0                	test   %al,%al
2a5a   5d690a:	0f 85 e1 38 00 00    	jne    5da1f1 <___bpf_prog_run+0x6341>
2a60   5d6910:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2a64   5d6914:	83 e0 0f             	and    $0xf,%eax
2a67   5d6917:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2a6b   5d691b:	4c 89 f8             	mov    %r15,%rax
2a6e   5d691e:	48 c1 e8 03          	shr    $0x3,%rax
2a72   5d6922:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2a77   5d6927:	0f 85 49 41 00 00    	jne    5daa76 <___bpf_prog_run+0x6bc6>
2a7d   5d692d:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2a81   5d6931:	49 8b 07             	mov    (%r15),%rax
2a84   5d6934:	48 89 fa             	mov    %rdi,%rdx
2a87   5d6937:	48 c1 ea 03          	shr    $0x3,%rdx
2a8b   5d693b:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2a90   5d6940:	48 89 fa             	mov    %rdi,%rdx
2a93   5d6943:	83 e2 07             	and    $0x7,%edx
2a96   5d6946:	83 c2 03             	add    $0x3,%edx
2a99   5d6949:	38 ca                	cmp    %cl,%dl
2a9b   5d694b:	7c 08                	jl     5d6955 <___bpf_prog_run+0x2aa5>
2a9d   5d694d:	84 c9                	test   %cl,%cl
2a9f   5d694f:	0f 85 6e 32 00 00    	jne    5d9bc3 <___bpf_prog_run+0x5d13>
2aa5   5d6955:	2b 43 04             	sub    0x4(%rbx),%eax
2aa8   5d6958:	48 83 c3 08          	add    $0x8,%rbx
2aac   5d695c:	49 89 07             	mov    %rax,(%r15)
2aaf   5d695f:	e9 8b d5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2ab4   5d6964:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2ab8   5d6968:	48 89 f8             	mov    %rdi,%rax
2abb   5d696b:	48 89 fa             	mov    %rdi,%rdx
2abe   5d696e:	48 c1 e8 03          	shr    $0x3,%rax
2ac2   5d6972:	83 e2 07             	and    $0x7,%edx
2ac5   5d6975:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2aca   5d697a:	38 d0                	cmp    %dl,%al
2acc   5d697c:	7f 08                	jg     5d6986 <___bpf_prog_run+0x2ad6>
2ace   5d697e:	84 c0                	test   %al,%al
2ad0   5d6980:	0f 85 61 38 00 00    	jne    5da1e7 <___bpf_prog_run+0x6337>
2ad6   5d6986:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2ada   5d698a:	83 e0 0f             	and    $0xf,%eax
2add   5d698d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2ae1   5d6991:	4c 89 f8             	mov    %r15,%rax
2ae4   5d6994:	48 c1 e8 03          	shr    $0x3,%rax
2ae8   5d6998:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2aed   5d699d:	0f 85 0d 40 00 00    	jne    5da9b0 <___bpf_prog_run+0x6b00>
2af3   5d69a3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2af7   5d69a7:	49 8b 17             	mov    (%r15),%rdx
2afa   5d69aa:	c0 e8 04             	shr    $0x4,%al
2afd   5d69ad:	0f b6 c0             	movzbl %al,%eax
2b00   5d69b0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2b04   5d69b4:	4c 89 f8             	mov    %r15,%rax
2b07   5d69b7:	48 c1 e8 03          	shr    $0x3,%rax
2b0b   5d69bb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2b10   5d69c0:	0f 85 d5 3f 00 00    	jne    5da99b <___bpf_prog_run+0x6aeb>
2b16   5d69c6:	41 39 17             	cmp    %edx,(%r15)
2b19   5d69c9:	0f 84 c7 23 00 00    	je     5d8d96 <___bpf_prog_run+0x4ee6>
2b1f   5d69cf:	48 83 c3 08          	add    $0x8,%rbx
2b23   5d69d3:	e9 17 d5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2b28   5d69d8:	4c 8d 43 01          	lea    0x1(%rbx),%r8
2b2c   5d69dc:	4c 89 c0             	mov    %r8,%rax
2b2f   5d69df:	4c 89 c2             	mov    %r8,%rdx
2b32   5d69e2:	48 c1 e8 03          	shr    $0x3,%rax
2b36   5d69e6:	83 e2 07             	and    $0x7,%edx
2b39   5d69e9:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2b3e   5d69ee:	38 d0                	cmp    %dl,%al
2b40   5d69f0:	7f 08                	jg     5d69fa <___bpf_prog_run+0x2b4a>
2b42   5d69f2:	84 c0                	test   %al,%al
2b44   5d69f4:	0f 85 d8 37 00 00    	jne    5da1d2 <___bpf_prog_run+0x6322>
2b4a   5d69fa:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2b4e   5d69fe:	83 e0 0f             	and    $0xf,%eax
2b51   5d6a01:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2b55   5d6a05:	4c 89 f8             	mov    %r15,%rax
2b58   5d6a08:	48 c1 e8 03          	shr    $0x3,%rax
2b5c   5d6a0c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2b61   5d6a11:	0f 85 de 41 00 00    	jne    5dabf5 <___bpf_prog_run+0x6d45>
2b67   5d6a17:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
2b6b   5d6a1b:	49 8b 07             	mov    (%r15),%rax
2b6e   5d6a1e:	4c 89 ca             	mov    %r9,%rdx
2b71   5d6a21:	48 c1 ea 03          	shr    $0x3,%rdx
2b75   5d6a25:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2b7a   5d6a2a:	4c 89 ca             	mov    %r9,%rdx
2b7d   5d6a2d:	83 e2 07             	and    $0x7,%edx
2b80   5d6a30:	83 c2 03             	add    $0x3,%edx
2b83   5d6a33:	38 ca                	cmp    %cl,%dl
2b85   5d6a35:	7c 08                	jl     5d6a3f <___bpf_prog_run+0x2b8f>
2b87   5d6a37:	84 c9                	test   %cl,%cl
2b89   5d6a39:	0f 85 a9 30 00 00    	jne    5d9ae8 <___bpf_prog_run+0x5c38>
2b8f   5d6a3f:	8b 4b 04             	mov    0x4(%rbx),%ecx
2b92   5d6a42:	83 f9 1f             	cmp    $0x1f,%ecx
2b95   5d6a45:	0f 87 00 00 00 00    	ja     5d6a4b <___bpf_prog_run+0x2b9b>	5d6a47: R_X86_64_PC32	.text.unlikely+0x6f7d
2b9b   5d6a4b:	4c 89 fa             	mov    %r15,%rdx
2b9e   5d6a4e:	d3 e0                	shl    %cl,%eax
2ba0   5d6a50:	48 c1 ea 03          	shr    $0x3,%rdx
2ba4   5d6a54:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
2ba9   5d6a59:	0f 85 dc 3c 00 00    	jne    5da73b <___bpf_prog_run+0x688b>
2baf   5d6a5f:	49 89 07             	mov    %rax,(%r15)
2bb2   5d6a62:	48 83 c3 08          	add    $0x8,%rbx
2bb6   5d6a66:	e9 84 d4 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2bbb   5d6a6b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2bbf   5d6a6f:	48 89 f8             	mov    %rdi,%rax
2bc2   5d6a72:	48 89 fa             	mov    %rdi,%rdx
2bc5   5d6a75:	48 c1 e8 03          	shr    $0x3,%rax
2bc9   5d6a79:	83 e2 07             	and    $0x7,%edx
2bcc   5d6a7c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2bd1   5d6a81:	38 d0                	cmp    %dl,%al
2bd3   5d6a83:	7f 08                	jg     5d6a8d <___bpf_prog_run+0x2bdd>
2bd5   5d6a85:	84 c0                	test   %al,%al
2bd7   5d6a87:	0f 85 3b 37 00 00    	jne    5da1c8 <___bpf_prog_run+0x6318>
2bdd   5d6a8d:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2be1   5d6a91:	c0 e8 04             	shr    $0x4,%al
2be4   5d6a94:	0f b6 c0             	movzbl %al,%eax
2be7   5d6a97:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2beb   5d6a9b:	4c 89 f8             	mov    %r15,%rax
2bee   5d6a9e:	48 c1 e8 03          	shr    $0x3,%rax
2bf2   5d6aa2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2bf7   5d6aa7:	0f 85 e1 43 00 00    	jne    5dae8e <___bpf_prog_run+0x6fde>
2bfd   5d6aad:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2c01   5d6ab1:	49 8b 0f             	mov    (%r15),%rcx
2c04   5d6ab4:	83 e0 0f             	and    $0xf,%eax
2c07   5d6ab7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2c0b   5d6abb:	4c 89 f8             	mov    %r15,%rax
2c0e   5d6abe:	48 c1 e8 03          	shr    $0x3,%rax
2c12   5d6ac2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c17   5d6ac7:	0f 85 ac 43 00 00    	jne    5dae79 <___bpf_prog_run+0x6fc9>
2c1d   5d6acd:	49 8b 07             	mov    (%r15),%rax
2c20   5d6ad0:	31 d2                	xor    %edx,%edx
2c22   5d6ad2:	49 8d 7e 58          	lea    0x58(%r14),%rdi
2c26   5d6ad6:	48 f7 f1             	div    %rcx
2c29   5d6ad9:	48 89 f8             	mov    %rdi,%rax
2c2c   5d6adc:	48 c1 e8 03          	shr    $0x3,%rax
2c30   5d6ae0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c35   5d6ae5:	0f 85 7c 43 00 00    	jne    5dae67 <___bpf_prog_run+0x6fb7>
2c3b   5d6aeb:	49 89 56 58          	mov    %rdx,0x58(%r14)
2c3f   5d6aef:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2c43   5d6af3:	83 e0 0f             	and    $0xf,%eax
2c46   5d6af6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2c4a   5d6afa:	4c 89 f8             	mov    %r15,%rax
2c4d   5d6afd:	48 c1 e8 03          	shr    $0x3,%rax
2c51   5d6b01:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2c56   5d6b06:	0f 85 46 43 00 00    	jne    5dae52 <___bpf_prog_run+0x6fa2>
2c5c   5d6b0c:	49 89 17             	mov    %rdx,(%r15)
2c5f   5d6b0f:	48 83 c3 08          	add    $0x8,%rbx
2c63   5d6b13:	e9 d7 d3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2c68   5d6b18:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2c6c   5d6b1c:	48 89 f8             	mov    %rdi,%rax
2c6f   5d6b1f:	48 89 fa             	mov    %rdi,%rdx
2c72   5d6b22:	48 c1 e8 03          	shr    $0x3,%rax
2c76   5d6b26:	83 e2 07             	and    $0x7,%edx
2c79   5d6b29:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2c7e   5d6b2e:	38 d0                	cmp    %dl,%al
2c80   5d6b30:	7f 08                	jg     5d6b3a <___bpf_prog_run+0x2c8a>
2c82   5d6b32:	84 c0                	test   %al,%al
2c84   5d6b34:	0f 85 84 36 00 00    	jne    5da1be <___bpf_prog_run+0x630e>
2c8a   5d6b3a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2c8e   5d6b3e:	83 e0 0f             	and    $0xf,%eax
2c91   5d6b41:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2c95   5d6b45:	4c 89 f8             	mov    %r15,%rax
2c98   5d6b48:	48 c1 e8 03          	shr    $0x3,%rax
2c9c   5d6b4c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2ca1   5d6b51:	0f 85 22 42 00 00    	jne    5dad79 <___bpf_prog_run+0x6ec9>
2ca7   5d6b57:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2cab   5d6b5b:	49 8b 07             	mov    (%r15),%rax
2cae   5d6b5e:	48 89 fa             	mov    %rdi,%rdx
2cb1   5d6b61:	48 c1 ea 03          	shr    $0x3,%rdx
2cb5   5d6b65:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2cba   5d6b6a:	48 89 fa             	mov    %rdi,%rdx
2cbd   5d6b6d:	83 e2 07             	and    $0x7,%edx
2cc0   5d6b70:	83 c2 03             	add    $0x3,%edx
2cc3   5d6b73:	38 ca                	cmp    %cl,%dl
2cc5   5d6b75:	7c 08                	jl     5d6b7f <___bpf_prog_run+0x2ccf>
2cc7   5d6b77:	84 c9                	test   %cl,%cl
2cc9   5d6b79:	0f 85 fc 2f 00 00    	jne    5d9b7b <___bpf_prog_run+0x5ccb>
2ccf   5d6b7f:	23 43 04             	and    0x4(%rbx),%eax
2cd2   5d6b82:	48 83 c3 08          	add    $0x8,%rbx
2cd6   5d6b86:	49 89 07             	mov    %rax,(%r15)
2cd9   5d6b89:	e9 61 d3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2cde   5d6b8e:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2ce2   5d6b92:	48 89 f8             	mov    %rdi,%rax
2ce5   5d6b95:	48 c1 e8 03          	shr    $0x3,%rax
2ce9   5d6b99:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2cee   5d6b9e:	48 89 f8             	mov    %rdi,%rax
2cf1   5d6ba1:	83 e0 07             	and    $0x7,%eax
2cf4   5d6ba4:	83 c0 03             	add    $0x3,%eax
2cf7   5d6ba7:	38 d0                	cmp    %dl,%al
2cf9   5d6ba9:	7c 08                	jl     5d6bb3 <___bpf_prog_run+0x2d03>
2cfb   5d6bab:	84 d2                	test   %dl,%dl
2cfd   5d6bad:	0f 85 01 36 00 00    	jne    5da1b4 <___bpf_prog_run+0x6304>
2d03   5d6bb3:	8b 43 04             	mov    0x4(%rbx),%eax
2d06   5d6bb6:	83 f8 20             	cmp    $0x20,%eax
2d09   5d6bb9:	0f 84 aa 22 00 00    	je     5d8e69 <___bpf_prog_run+0x4fb9>
2d0f   5d6bbf:	83 f8 40             	cmp    $0x40,%eax
2d12   5d6bc2:	0f 84 54 22 00 00    	je     5d8e1c <___bpf_prog_run+0x4f6c>
2d18   5d6bc8:	83 f8 10             	cmp    $0x10,%eax
2d1b   5d6bcb:	0f 84 f9 21 00 00    	je     5d8dca <___bpf_prog_run+0x4f1a>
2d21   5d6bd1:	48 83 c3 08          	add    $0x8,%rbx
2d25   5d6bd5:	e9 15 d3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2d2a   5d6bda:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2d2e   5d6bde:	48 89 f8             	mov    %rdi,%rax
2d31   5d6be1:	48 89 fa             	mov    %rdi,%rdx
2d34   5d6be4:	48 c1 e8 03          	shr    $0x3,%rax
2d38   5d6be8:	83 e2 07             	and    $0x7,%edx
2d3b   5d6beb:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2d40   5d6bf0:	38 d0                	cmp    %dl,%al
2d42   5d6bf2:	7f 08                	jg     5d6bfc <___bpf_prog_run+0x2d4c>
2d44   5d6bf4:	84 c0                	test   %al,%al
2d46   5d6bf6:	0f 85 ae 35 00 00    	jne    5da1aa <___bpf_prog_run+0x62fa>
2d4c   5d6bfc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2d50   5d6c00:	83 e0 0f             	and    $0xf,%eax
2d53   5d6c03:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2d57   5d6c07:	4c 89 f8             	mov    %r15,%rax
2d5a   5d6c0a:	48 c1 e8 03          	shr    $0x3,%rax
2d5e   5d6c0e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2d63   5d6c13:	0f 85 37 3b 00 00    	jne    5da750 <___bpf_prog_run+0x68a0>
2d69   5d6c19:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2d6d   5d6c1d:	49 8b 07             	mov    (%r15),%rax
2d70   5d6c20:	48 89 fa             	mov    %rdi,%rdx
2d73   5d6c23:	48 c1 ea 03          	shr    $0x3,%rdx
2d77   5d6c27:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2d7c   5d6c2c:	48 89 fa             	mov    %rdi,%rdx
2d7f   5d6c2f:	83 e2 07             	and    $0x7,%edx
2d82   5d6c32:	83 c2 03             	add    $0x3,%edx
2d85   5d6c35:	38 ca                	cmp    %cl,%dl
2d87   5d6c37:	7c 08                	jl     5d6c41 <___bpf_prog_run+0x2d91>
2d89   5d6c39:	84 c9                	test   %cl,%cl
2d8b   5d6c3b:	0f 85 83 2e 00 00    	jne    5d9ac4 <___bpf_prog_run+0x5c14>
2d91   5d6c41:	33 43 04             	xor    0x4(%rbx),%eax
2d94   5d6c44:	48 83 c3 08          	add    $0x8,%rbx
2d98   5d6c48:	49 89 07             	mov    %rax,(%r15)
2d9b   5d6c4b:	e9 9f d2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2da0   5d6c50:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2da4   5d6c54:	48 89 f8             	mov    %rdi,%rax
2da7   5d6c57:	48 c1 e8 03          	shr    $0x3,%rax
2dab   5d6c5b:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2db0   5d6c60:	48 89 f8             	mov    %rdi,%rax
2db3   5d6c63:	83 e0 07             	and    $0x7,%eax
2db6   5d6c66:	83 c0 03             	add    $0x3,%eax
2db9   5d6c69:	38 d0                	cmp    %dl,%al
2dbb   5d6c6b:	7c 08                	jl     5d6c75 <___bpf_prog_run+0x2dc5>
2dbd   5d6c6d:	84 d2                	test   %dl,%dl
2dbf   5d6c6f:	0f 85 2b 35 00 00    	jne    5da1a0 <___bpf_prog_run+0x62f0>
2dc5   5d6c75:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2dc9   5d6c79:	44 8b 7b 04          	mov    0x4(%rbx),%r15d
2dcd   5d6c7d:	48 89 f8             	mov    %rdi,%rax
2dd0   5d6c80:	48 89 fa             	mov    %rdi,%rdx
2dd3   5d6c83:	48 c1 e8 03          	shr    $0x3,%rax
2dd7   5d6c87:	83 e2 07             	and    $0x7,%edx
2dda   5d6c8a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2ddf   5d6c8f:	38 d0                	cmp    %dl,%al
2de1   5d6c91:	7f 08                	jg     5d6c9b <___bpf_prog_run+0x2deb>
2de3   5d6c93:	84 c0                	test   %al,%al
2de5   5d6c95:	0f 85 60 2f 00 00    	jne    5d9bfb <___bpf_prog_run+0x5d4b>
2deb   5d6c9b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2def   5d6c9f:	83 e0 0f             	and    $0xf,%eax
2df2   5d6ca2:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
2df6   5d6ca6:	48 89 c2             	mov    %rax,%rdx
2df9   5d6ca9:	48 c1 ea 03          	shr    $0x3,%rdx
2dfd   5d6cad:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
2e02   5d6cb2:	0f 85 12 3d 00 00    	jne    5da9ca <___bpf_prog_run+0x6b1a>
2e08   5d6cb8:	4c 89 38             	mov    %r15,(%rax)
2e0b   5d6cbb:	48 83 c3 08          	add    $0x8,%rbx
2e0f   5d6cbf:	e9 2b d2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2e14   5d6cc4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2e18   5d6cc8:	48 89 f8             	mov    %rdi,%rax
2e1b   5d6ccb:	48 89 fa             	mov    %rdi,%rdx
2e1e   5d6cce:	48 c1 e8 03          	shr    $0x3,%rax
2e22   5d6cd2:	83 e2 07             	and    $0x7,%edx
2e25   5d6cd5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2e2a   5d6cda:	38 d0                	cmp    %dl,%al
2e2c   5d6cdc:	7f 08                	jg     5d6ce6 <___bpf_prog_run+0x2e36>
2e2e   5d6cde:	84 c0                	test   %al,%al
2e30   5d6ce0:	0f 85 b0 34 00 00    	jne    5da196 <___bpf_prog_run+0x62e6>
2e36   5d6ce6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2e3a   5d6cea:	83 e0 0f             	and    $0xf,%eax
2e3d   5d6ced:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2e41   5d6cf1:	4c 89 f8             	mov    %r15,%rax
2e44   5d6cf4:	48 c1 e8 03          	shr    $0x3,%rax
2e48   5d6cf8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2e4d   5d6cfd:	0f 85 d1 37 00 00    	jne    5da4d4 <___bpf_prog_run+0x6624>
2e53   5d6d03:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2e57   5d6d07:	49 8b 07             	mov    (%r15),%rax
2e5a   5d6d0a:	48 89 fa             	mov    %rdi,%rdx
2e5d   5d6d0d:	48 c1 ea 03          	shr    $0x3,%rdx
2e61   5d6d11:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
2e66   5d6d16:	48 89 fa             	mov    %rdi,%rdx
2e69   5d6d19:	83 e2 07             	and    $0x7,%edx
2e6c   5d6d1c:	83 c2 03             	add    $0x3,%edx
2e6f   5d6d1f:	38 ca                	cmp    %cl,%dl
2e71   5d6d21:	7c 08                	jl     5d6d2b <___bpf_prog_run+0x2e7b>
2e73   5d6d23:	84 c9                	test   %cl,%cl
2e75   5d6d25:	0f 85 aa 2e 00 00    	jne    5d9bd5 <___bpf_prog_run+0x5d25>
2e7b   5d6d2b:	03 43 04             	add    0x4(%rbx),%eax
2e7e   5d6d2e:	48 83 c3 08          	add    $0x8,%rbx
2e82   5d6d32:	49 89 07             	mov    %rax,(%r15)
2e85   5d6d35:	e9 b5 d1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2e8a   5d6d3a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2e8e   5d6d3e:	48 89 f8             	mov    %rdi,%rax
2e91   5d6d41:	48 89 fa             	mov    %rdi,%rdx
2e94   5d6d44:	48 c1 e8 03          	shr    $0x3,%rax
2e98   5d6d48:	83 e2 07             	and    $0x7,%edx
2e9b   5d6d4b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2ea0   5d6d50:	38 d0                	cmp    %dl,%al
2ea2   5d6d52:	7f 08                	jg     5d6d5c <___bpf_prog_run+0x2eac>
2ea4   5d6d54:	84 c0                	test   %al,%al
2ea6   5d6d56:	0f 85 30 34 00 00    	jne    5da18c <___bpf_prog_run+0x62dc>
2eac   5d6d5c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2eb0   5d6d60:	83 e0 0f             	and    $0xf,%eax
2eb3   5d6d63:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2eb7   5d6d67:	4c 89 f8             	mov    %r15,%rax
2eba   5d6d6a:	48 c1 e8 03          	shr    $0x3,%rax
2ebe   5d6d6e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2ec3   5d6d73:	0f 85 c1 3c 00 00    	jne    5daa3a <___bpf_prog_run+0x6b8a>
2ec9   5d6d79:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2ecd   5d6d7d:	4d 8b 3f             	mov    (%r15),%r15
2ed0   5d6d80:	48 89 f8             	mov    %rdi,%rax
2ed3   5d6d83:	48 c1 e8 03          	shr    $0x3,%rax
2ed7   5d6d87:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2edc   5d6d8c:	48 89 f8             	mov    %rdi,%rax
2edf   5d6d8f:	83 e0 07             	and    $0x7,%eax
2ee2   5d6d92:	83 c0 03             	add    $0x3,%eax
2ee5   5d6d95:	38 d0                	cmp    %dl,%al
2ee7   5d6d97:	7c 08                	jl     5d6da1 <___bpf_prog_run+0x2ef1>
2ee9   5d6d99:	84 d2                	test   %dl,%dl
2eeb   5d6d9b:	0f 85 c4 31 00 00    	jne    5d9f65 <___bpf_prog_run+0x60b5>
2ef1   5d6da1:	44 3b 7b 04          	cmp    0x4(%rbx),%r15d
2ef5   5d6da5:	0f 84 46 1f 00 00    	je     5d8cf1 <___bpf_prog_run+0x4e41>
2efb   5d6dab:	48 83 c3 08          	add    $0x8,%rbx
2eff   5d6daf:	e9 3b d1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2f04   5d6db4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2f08   5d6db8:	48 89 f8             	mov    %rdi,%rax
2f0b   5d6dbb:	48 89 fa             	mov    %rdi,%rdx
2f0e   5d6dbe:	48 c1 e8 03          	shr    $0x3,%rax
2f12   5d6dc2:	83 e2 07             	and    $0x7,%edx
2f15   5d6dc5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2f1a   5d6dca:	38 d0                	cmp    %dl,%al
2f1c   5d6dcc:	7f 08                	jg     5d6dd6 <___bpf_prog_run+0x2f26>
2f1e   5d6dce:	84 c0                	test   %al,%al
2f20   5d6dd0:	0f 85 ac 33 00 00    	jne    5da182 <___bpf_prog_run+0x62d2>
2f26   5d6dd6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2f2a   5d6dda:	c0 e8 04             	shr    $0x4,%al
2f2d   5d6ddd:	0f b6 c0             	movzbl %al,%eax
2f30   5d6de0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2f34   5d6de4:	4c 89 f8             	mov    %r15,%rax
2f37   5d6de7:	48 c1 e8 03          	shr    $0x3,%rax
2f3b   5d6deb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2f40   5d6df0:	0f 85 34 3e 00 00    	jne    5dac2a <___bpf_prog_run+0x6d7a>
2f46   5d6df6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2f4a   5d6dfa:	49 8b 0f             	mov    (%r15),%rcx
2f4d   5d6dfd:	83 e0 0f             	and    $0xf,%eax
2f50   5d6e00:	83 e1 1f             	and    $0x1f,%ecx
2f53   5d6e03:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2f57   5d6e07:	4c 89 f8             	mov    %r15,%rax
2f5a   5d6e0a:	48 c1 e8 03          	shr    $0x3,%rax
2f5e   5d6e0e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2f63   5d6e13:	0f 85 fe 3d 00 00    	jne    5dac17 <___bpf_prog_run+0x6d67>
2f69   5d6e19:	41 8b 07             	mov    (%r15),%eax
2f6c   5d6e1c:	48 83 c3 08          	add    $0x8,%rbx
2f70   5d6e20:	d3 e8                	shr    %cl,%eax
2f72   5d6e22:	49 89 07             	mov    %rax,(%r15)
2f75   5d6e25:	e9 c5 d0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
2f7a   5d6e2a:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
2f7e   5d6e2e:	48 89 f8             	mov    %rdi,%rax
2f81   5d6e31:	48 c1 e8 03          	shr    $0x3,%rax
2f85   5d6e35:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
2f8a   5d6e3a:	48 89 f8             	mov    %rdi,%rax
2f8d   5d6e3d:	83 e0 07             	and    $0x7,%eax
2f90   5d6e40:	83 c0 03             	add    $0x3,%eax
2f93   5d6e43:	38 d0                	cmp    %dl,%al
2f95   5d6e45:	7c 08                	jl     5d6e4f <___bpf_prog_run+0x2f9f>
2f97   5d6e47:	84 d2                	test   %dl,%dl
2f99   5d6e49:	0f 85 29 33 00 00    	jne    5da178 <___bpf_prog_run+0x62c8>
2f9f   5d6e4f:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
2fa3   5d6e53:	48 63 4b 04          	movslq 0x4(%rbx),%rcx
2fa7   5d6e57:	48 89 f8             	mov    %rdi,%rax
2faa   5d6e5a:	48 89 fa             	mov    %rdi,%rdx
2fad   5d6e5d:	48 c1 e8 03          	shr    $0x3,%rax
2fb1   5d6e61:	83 e2 07             	and    $0x7,%edx
2fb4   5d6e64:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
2fb9   5d6e69:	38 d0                	cmp    %dl,%al
2fbb   5d6e6b:	7f 08                	jg     5d6e75 <___bpf_prog_run+0x2fc5>
2fbd   5d6e6d:	84 c0                	test   %al,%al
2fbf   5d6e6f:	0f 85 e5 2d 00 00    	jne    5d9c5a <___bpf_prog_run+0x5daa>
2fc5   5d6e75:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
2fc9   5d6e79:	83 e0 0f             	and    $0xf,%eax
2fcc   5d6e7c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
2fd0   5d6e80:	4c 89 f8             	mov    %r15,%rax
2fd3   5d6e83:	48 c1 e8 03          	shr    $0x3,%rax
2fd7   5d6e87:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2fdc   5d6e8c:	0f 85 cc 3d 00 00    	jne    5dac5e <___bpf_prog_run+0x6dae>
2fe2   5d6e92:	49 8b 07             	mov    (%r15),%rax
2fe5   5d6e95:	31 d2                	xor    %edx,%edx
2fe7   5d6e97:	49 8d 7e 58          	lea    0x58(%r14),%rdi
2feb   5d6e9b:	48 f7 f1             	div    %rcx
2fee   5d6e9e:	48 89 f8             	mov    %rdi,%rax
2ff1   5d6ea1:	48 c1 e8 03          	shr    $0x3,%rax
2ff5   5d6ea5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2ffa   5d6eaa:	0f 85 9c 3d 00 00    	jne    5dac4c <___bpf_prog_run+0x6d9c>
3000   5d6eb0:	49 89 56 58          	mov    %rdx,0x58(%r14)
3004   5d6eb4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3008   5d6eb8:	83 e0 0f             	and    $0xf,%eax
300b   5d6ebb:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
300f   5d6ebf:	4c 89 f8             	mov    %r15,%rax
3012   5d6ec2:	48 c1 e8 03          	shr    $0x3,%rax
3016   5d6ec6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
301b   5d6ecb:	0f 85 f4 3f 00 00    	jne    5daec5 <___bpf_prog_run+0x7015>
3021   5d6ed1:	49 89 17             	mov    %rdx,(%r15)
3024   5d6ed4:	48 83 c3 08          	add    $0x8,%rbx
3028   5d6ed8:	e9 12 d0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
302d   5d6edd:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3031   5d6ee1:	48 89 f8             	mov    %rdi,%rax
3034   5d6ee4:	48 89 fa             	mov    %rdi,%rdx
3037   5d6ee7:	48 c1 e8 03          	shr    $0x3,%rax
303b   5d6eeb:	83 e2 07             	and    $0x7,%edx
303e   5d6eee:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3043   5d6ef3:	38 d0                	cmp    %dl,%al
3045   5d6ef5:	7f 08                	jg     5d6eff <___bpf_prog_run+0x304f>
3047   5d6ef7:	84 c0                	test   %al,%al
3049   5d6ef9:	0f 85 6f 32 00 00    	jne    5da16e <___bpf_prog_run+0x62be>
304f   5d6eff:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3053   5d6f03:	83 e0 0f             	and    $0xf,%eax
3056   5d6f06:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
305a   5d6f0a:	4c 89 f8             	mov    %r15,%rax
305d   5d6f0d:	48 c1 e8 03          	shr    $0x3,%rax
3061   5d6f11:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3066   5d6f16:	0f 85 43 3e 00 00    	jne    5dad5f <___bpf_prog_run+0x6eaf>
306c   5d6f1c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3070   5d6f20:	49 8b 17             	mov    (%r15),%rdx
3073   5d6f23:	c0 e8 04             	shr    $0x4,%al
3076   5d6f26:	0f b6 c0             	movzbl %al,%eax
3079   5d6f29:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
307d   5d6f2d:	48 89 c1             	mov    %rax,%rcx
3080   5d6f30:	48 c1 e9 03          	shr    $0x3,%rcx
3084   5d6f34:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3089   5d6f39:	0f 85 03 3e 00 00    	jne    5dad42 <___bpf_prog_run+0x6e92>
308f   5d6f3f:	0b 10                	or     (%rax),%edx
3091   5d6f41:	48 83 c3 08          	add    $0x8,%rbx
3095   5d6f45:	89 d0                	mov    %edx,%eax
3097   5d6f47:	49 89 07             	mov    %rax,(%r15)
309a   5d6f4a:	e9 a0 cf ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
309f   5d6f4f:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
30a3   5d6f53:	48 89 f8             	mov    %rdi,%rax
30a6   5d6f56:	48 c1 e8 03          	shr    $0x3,%rax
30aa   5d6f5a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
30af   5d6f5f:	48 89 f8             	mov    %rdi,%rax
30b2   5d6f62:	83 e0 07             	and    $0x7,%eax
30b5   5d6f65:	83 c0 03             	add    $0x3,%eax
30b8   5d6f68:	38 d0                	cmp    %dl,%al
30ba   5d6f6a:	7c 08                	jl     5d6f74 <___bpf_prog_run+0x30c4>
30bc   5d6f6c:	84 d2                	test   %dl,%dl
30be   5d6f6e:	0f 85 f0 31 00 00    	jne    5da164 <___bpf_prog_run+0x62b4>
30c4   5d6f74:	49 8d 7e 28          	lea    0x28(%r14),%rdi
30c8   5d6f78:	4c 63 7b 04          	movslq 0x4(%rbx),%r15
30cc   5d6f7c:	48 89 f8             	mov    %rdi,%rax
30cf   5d6f7f:	48 c1 e8 03          	shr    $0x3,%rax
30d3   5d6f83:	49 81 c7 00 00 00 00 	add    $0x0,%r15	5d6f86: R_X86_64_32S	__bpf_call_base
30da   5d6f8a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
30df   5d6f8f:	0f 85 75 36 00 00    	jne    5da60a <___bpf_prog_run+0x675a>
30e5   5d6f95:	49 8d 7e 20          	lea    0x20(%r14),%rdi
30e9   5d6f99:	4d 8b 46 28          	mov    0x28(%r14),%r8
30ed   5d6f9d:	48 89 f8             	mov    %rdi,%rax
30f0   5d6fa0:	48 c1 e8 03          	shr    $0x3,%rax
30f4   5d6fa4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
30f9   5d6fa9:	0f 85 49 36 00 00    	jne    5da5f8 <___bpf_prog_run+0x6748>
30ff   5d6faf:	49 8d 7e 18          	lea    0x18(%r14),%rdi
3103   5d6fb3:	49 8b 4e 20          	mov    0x20(%r14),%rcx
3107   5d6fb7:	48 89 f8             	mov    %rdi,%rax
310a   5d6fba:	48 c1 e8 03          	shr    $0x3,%rax
310e   5d6fbe:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3113   5d6fc3:	0f 85 96 39 00 00    	jne    5da95f <___bpf_prog_run+0x6aaf>
3119   5d6fc9:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
311e   5d6fce:	49 8b 56 18          	mov    0x18(%r14),%rdx
3122   5d6fd2:	0f 85 61 39 00 00    	jne    5da939 <___bpf_prog_run+0x6a89>
3128   5d6fd8:	49 8d 7e 08          	lea    0x8(%r14),%rdi
312c   5d6fdc:	49 8b 76 10          	mov    0x10(%r14),%rsi
3130   5d6fe0:	48 89 f8             	mov    %rdi,%rax
3133   5d6fe3:	48 c1 e8 03          	shr    $0x3,%rax
3137   5d6fe7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
313c   5d6fec:	0f 85 1d 39 00 00    	jne    5da90f <___bpf_prog_run+0x6a5f>
3142   5d6ff2:	49 8b 7e 08          	mov    0x8(%r14),%rdi
3146   5d6ff6:	41 ff d7             	call   *%r15
3149   5d6ff9:	49 89 c7             	mov    %rax,%r15
314c   5d6ffc:	4c 89 f0             	mov    %r14,%rax
314f   5d6fff:	48 c1 e8 03          	shr    $0x3,%rax
3153   5d7003:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3158   5d7008:	0f 85 f4 38 00 00    	jne    5da902 <___bpf_prog_run+0x6a52>
315e   5d700e:	4d 89 3e             	mov    %r15,(%r14)
3161   5d7011:	48 83 c3 08          	add    $0x8,%rbx
3165   5d7015:	e9 d5 ce ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
316a   5d701a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
316e   5d701e:	48 89 f8             	mov    %rdi,%rax
3171   5d7021:	48 89 fa             	mov    %rdi,%rdx
3174   5d7024:	48 c1 e8 03          	shr    $0x3,%rax
3178   5d7028:	83 e2 07             	and    $0x7,%edx
317b   5d702b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3180   5d7030:	38 d0                	cmp    %dl,%al
3182   5d7032:	7f 08                	jg     5d703c <___bpf_prog_run+0x318c>
3184   5d7034:	84 c0                	test   %al,%al
3186   5d7036:	0f 85 1e 31 00 00    	jne    5da15a <___bpf_prog_run+0x62aa>
318c   5d703c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3190   5d7040:	83 e0 0f             	and    $0xf,%eax
3193   5d7043:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3197   5d7047:	4c 89 f8             	mov    %r15,%rax
319a   5d704a:	48 c1 e8 03          	shr    $0x3,%rax
319e   5d704e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
31a3   5d7053:	0f 85 58 37 00 00    	jne    5da7b1 <___bpf_prog_run+0x6901>
31a9   5d7059:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
31ad   5d705d:	49 8b 17             	mov    (%r15),%rdx
31b0   5d7060:	c0 e8 04             	shr    $0x4,%al
31b3   5d7063:	0f b6 c0             	movzbl %al,%eax
31b6   5d7066:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
31ba   5d706a:	48 89 c1             	mov    %rax,%rcx
31bd   5d706d:	48 c1 e9 03          	shr    $0x3,%rcx
31c1   5d7071:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
31c6   5d7076:	0f 85 18 37 00 00    	jne    5da794 <___bpf_prog_run+0x68e4>
31cc   5d707c:	0f af 10             	imul   (%rax),%edx
31cf   5d707f:	48 83 c3 08          	add    $0x8,%rbx
31d3   5d7083:	89 d0                	mov    %edx,%eax
31d5   5d7085:	49 89 07             	mov    %rax,(%r15)
31d8   5d7088:	e9 62 ce ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
31dd   5d708d:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
31e1   5d7091:	48 89 f8             	mov    %rdi,%rax
31e4   5d7094:	48 c1 e8 03          	shr    $0x3,%rax
31e8   5d7098:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
31ed   5d709d:	48 89 f8             	mov    %rdi,%rax
31f0   5d70a0:	83 e0 07             	and    $0x7,%eax
31f3   5d70a3:	83 c0 03             	add    $0x3,%eax
31f6   5d70a6:	38 d0                	cmp    %dl,%al
31f8   5d70a8:	7c 08                	jl     5d70b2 <___bpf_prog_run+0x3202>
31fa   5d70aa:	84 d2                	test   %dl,%dl
31fc   5d70ac:	0f 85 9e 30 00 00    	jne    5da150 <___bpf_prog_run+0x62a0>
3202   5d70b2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3206   5d70b6:	4c 63 7b 04          	movslq 0x4(%rbx),%r15
320a   5d70ba:	48 89 f8             	mov    %rdi,%rax
320d   5d70bd:	48 89 fa             	mov    %rdi,%rdx
3210   5d70c0:	48 c1 e8 03          	shr    $0x3,%rax
3214   5d70c4:	83 e2 07             	and    $0x7,%edx
3217   5d70c7:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
321c   5d70cc:	38 d0                	cmp    %dl,%al
321e   5d70ce:	7f 08                	jg     5d70d8 <___bpf_prog_run+0x3228>
3220   5d70d0:	84 c0                	test   %al,%al
3222   5d70d2:	0f 85 37 2b 00 00    	jne    5d9c0f <___bpf_prog_run+0x5d5f>
3228   5d70d8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
322c   5d70dc:	83 e0 0f             	and    $0xf,%eax
322f   5d70df:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3233   5d70e3:	48 89 c2             	mov    %rax,%rdx
3236   5d70e6:	48 c1 ea 03          	shr    $0x3,%rdx
323a   5d70ea:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
323f   5d70ef:	0f 85 c8 3c 00 00    	jne    5dadbd <___bpf_prog_run+0x6f0d>
3245   5d70f5:	4c 89 38             	mov    %r15,(%rax)
3248   5d70f8:	48 83 c3 08          	add    $0x8,%rbx
324c   5d70fc:	e9 ee cd ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3251   5d7101:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3255   5d7105:	48 89 f8             	mov    %rdi,%rax
3258   5d7108:	48 89 fa             	mov    %rdi,%rdx
325b   5d710b:	48 c1 e8 03          	shr    $0x3,%rax
325f   5d710f:	83 e2 07             	and    $0x7,%edx
3262   5d7112:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3267   5d7117:	38 d0                	cmp    %dl,%al
3269   5d7119:	7f 08                	jg     5d7123 <___bpf_prog_run+0x3273>
326b   5d711b:	84 c0                	test   %al,%al
326d   5d711d:	0f 85 23 30 00 00    	jne    5da146 <___bpf_prog_run+0x6296>
3273   5d7123:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3277   5d7127:	83 e0 0f             	and    $0xf,%eax
327a   5d712a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
327e   5d712e:	4c 89 f8             	mov    %r15,%rax
3281   5d7131:	48 c1 e8 03          	shr    $0x3,%rax
3285   5d7135:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
328a   5d713a:	0f 85 cb 33 00 00    	jne    5da50b <___bpf_prog_run+0x665b>
3290   5d7140:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3294   5d7144:	49 8b 17             	mov    (%r15),%rdx
3297   5d7147:	c0 e8 04             	shr    $0x4,%al
329a   5d714a:	0f b6 c0             	movzbl %al,%eax
329d   5d714d:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
32a1   5d7151:	48 89 c1             	mov    %rax,%rcx
32a4   5d7154:	48 c1 e9 03          	shr    $0x3,%rcx
32a8   5d7158:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
32ad   5d715d:	0f 85 8b 33 00 00    	jne    5da4ee <___bpf_prog_run+0x663e>
32b3   5d7163:	2b 10                	sub    (%rax),%edx
32b5   5d7165:	48 83 c3 08          	add    $0x8,%rbx
32b9   5d7169:	89 d0                	mov    %edx,%eax
32bb   5d716b:	49 89 07             	mov    %rax,(%r15)
32be   5d716e:	e9 7c cd ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
32c3   5d7173:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
32cd   5d717d:	4c 89 f2             	mov    %r14,%rdx
32d0   5d7180:	48 c1 ea 03          	shr    $0x3,%rdx
32d4   5d7184:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
32d8   5d7188:	0f 85 c9 41 00 00    	jne    5db357 <___bpf_prog_run+0x74a7>
32de   5d718e:	49 8b 06             	mov    (%r14),%rax
32e1   5d7191:	48 83 c4 38          	add    $0x38,%rsp
32e5   5d7195:	5b                   	pop    %rbx
32e6   5d7196:	41 5c                	pop    %r12
32e8   5d7198:	41 5d                	pop    %r13
32ea   5d719a:	41 5e                	pop    %r14
32ec   5d719c:	41 5f                	pop    %r15
32ee   5d719e:	5d                   	pop    %rbp
32ef   5d719f:	c3                   	ret
32f0   5d71a0:	cc                   	int3
32f1   5d71a1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
32f5   5d71a5:	48 89 f8             	mov    %rdi,%rax
32f8   5d71a8:	48 89 fa             	mov    %rdi,%rdx
32fb   5d71ab:	48 c1 e8 03          	shr    $0x3,%rax
32ff   5d71af:	83 e2 07             	and    $0x7,%edx
3302   5d71b2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3307   5d71b7:	38 d0                	cmp    %dl,%al
3309   5d71b9:	7f 08                	jg     5d71c3 <___bpf_prog_run+0x3313>
330b   5d71bb:	84 c0                	test   %al,%al
330d   5d71bd:	0f 85 79 2f 00 00    	jne    5da13c <___bpf_prog_run+0x628c>
3313   5d71c3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3317   5d71c7:	c0 e8 04             	shr    $0x4,%al
331a   5d71ca:	0f b6 c0             	movzbl %al,%eax
331d   5d71cd:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3321   5d71d1:	4c 89 f8             	mov    %r15,%rax
3324   5d71d4:	48 c1 e8 03          	shr    $0x3,%rax
3328   5d71d8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
332d   5d71dd:	0f 85 0a 3d 00 00    	jne    5daeed <___bpf_prog_run+0x703d>
3333   5d71e3:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3337   5d71e7:	49 8b 0f             	mov    (%r15),%rcx
333a   5d71ea:	83 e0 0f             	and    $0xf,%eax
333d   5d71ed:	83 e1 1f             	and    $0x1f,%ecx
3340   5d71f0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3344   5d71f4:	4c 89 f8             	mov    %r15,%rax
3347   5d71f7:	48 c1 e8 03          	shr    $0x3,%rax
334b   5d71fb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3350   5d7200:	0f 85 d4 3c 00 00    	jne    5daeda <___bpf_prog_run+0x702a>
3356   5d7206:	41 8b 07             	mov    (%r15),%eax
3359   5d7209:	48 83 c3 08          	add    $0x8,%rbx
335d   5d720d:	d3 e0                	shl    %cl,%eax
335f   5d720f:	49 89 07             	mov    %rax,(%r15)
3362   5d7212:	e9 d8 cc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3367   5d7217:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
336b   5d721b:	48 89 f8             	mov    %rdi,%rax
336e   5d721e:	48 89 fa             	mov    %rdi,%rdx
3371   5d7221:	48 c1 e8 03          	shr    $0x3,%rax
3375   5d7225:	83 e2 07             	and    $0x7,%edx
3378   5d7228:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
337d   5d722d:	38 d0                	cmp    %dl,%al
337f   5d722f:	7f 08                	jg     5d7239 <___bpf_prog_run+0x3389>
3381   5d7231:	84 c0                	test   %al,%al
3383   5d7233:	0f 85 f9 2e 00 00    	jne    5da132 <___bpf_prog_run+0x6282>
3389   5d7239:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
338d   5d723d:	c0 e8 04             	shr    $0x4,%al
3390   5d7240:	0f b6 c0             	movzbl %al,%eax
3393   5d7243:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3397   5d7247:	4c 89 f8             	mov    %r15,%rax
339a   5d724a:	48 c1 e8 03          	shr    $0x3,%rax
339e   5d724e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
33a3   5d7253:	0f 85 35 37 00 00    	jne    5da98e <___bpf_prog_run+0x6ade>
33a9   5d7259:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
33ad   5d725d:	49 8b 0f             	mov    (%r15),%rcx
33b0   5d7260:	83 e0 0f             	and    $0xf,%eax
33b3   5d7263:	83 e1 3f             	and    $0x3f,%ecx
33b6   5d7266:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
33ba   5d726a:	4c 89 f8             	mov    %r15,%rax
33bd   5d726d:	48 c1 e8 03          	shr    $0x3,%rax
33c1   5d7271:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
33c6   5d7276:	0f 85 70 37 00 00    	jne    5da9ec <___bpf_prog_run+0x6b3c>
33cc   5d727c:	49 d3 27             	shlq   %cl,(%r15)
33cf   5d727f:	48 83 c3 08          	add    $0x8,%rbx
33d3   5d7283:	e9 67 cc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
33d8   5d7288:	4c 8d 43 01          	lea    0x1(%rbx),%r8
33dc   5d728c:	4c 89 c0             	mov    %r8,%rax
33df   5d728f:	4c 89 c2             	mov    %r8,%rdx
33e2   5d7292:	48 c1 e8 03          	shr    $0x3,%rax
33e6   5d7296:	83 e2 07             	and    $0x7,%edx
33e9   5d7299:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
33ee   5d729e:	38 d0                	cmp    %dl,%al
33f0   5d72a0:	7f 08                	jg     5d72aa <___bpf_prog_run+0x33fa>
33f2   5d72a2:	84 c0                	test   %al,%al
33f4   5d72a4:	0f 85 73 2e 00 00    	jne    5da11d <___bpf_prog_run+0x626d>
33fa   5d72aa:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
33fe   5d72ae:	83 e0 0f             	and    $0xf,%eax
3401   5d72b1:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3405   5d72b5:	4c 89 f8             	mov    %r15,%rax
3408   5d72b8:	48 c1 e8 03          	shr    $0x3,%rax
340c   5d72bc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3411   5d72c1:	0f 85 1c 33 00 00    	jne    5da5e3 <___bpf_prog_run+0x6733>
3417   5d72c7:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
341b   5d72cb:	49 8b 07             	mov    (%r15),%rax
341e   5d72ce:	4c 89 ca             	mov    %r9,%rdx
3421   5d72d1:	48 c1 ea 03          	shr    $0x3,%rdx
3425   5d72d5:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
342a   5d72da:	4c 89 ca             	mov    %r9,%rdx
342d   5d72dd:	83 e2 07             	and    $0x7,%edx
3430   5d72e0:	83 c2 03             	add    $0x3,%edx
3433   5d72e3:	38 ca                	cmp    %cl,%dl
3435   5d72e5:	7c 08                	jl     5d72ef <___bpf_prog_run+0x343f>
3437   5d72e7:	84 c9                	test   %cl,%cl
3439   5d72e9:	0f 85 80 2c 00 00    	jne    5d9f6f <___bpf_prog_run+0x60bf>
343f   5d72ef:	8b 4b 04             	mov    0x4(%rbx),%ecx
3442   5d72f2:	83 f9 3f             	cmp    $0x3f,%ecx
3445   5d72f5:	0f 87 00 00 00 00    	ja     5d72fb <___bpf_prog_run+0x344b>	5d72f7: R_X86_64_PC32	.text.unlikely+0x6c7c
344b   5d72fb:	4c 89 fa             	mov    %r15,%rdx
344e   5d72fe:	48 d3 e0             	shl    %cl,%rax
3451   5d7301:	48 c1 ea 03          	shr    $0x3,%rdx
3455   5d7305:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
345a   5d730a:	0f 85 37 37 00 00    	jne    5daa47 <___bpf_prog_run+0x6b97>
3460   5d7310:	49 89 07             	mov    %rax,(%r15)
3463   5d7313:	48 83 c3 08          	add    $0x8,%rbx
3467   5d7317:	e9 d3 cb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
346c   5d731c:	4c 8d 43 01          	lea    0x1(%rbx),%r8
3470   5d7320:	4c 89 c0             	mov    %r8,%rax
3473   5d7323:	4c 89 c2             	mov    %r8,%rdx
3476   5d7326:	48 c1 e8 03          	shr    $0x3,%rax
347a   5d732a:	83 e2 07             	and    $0x7,%edx
347d   5d732d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3482   5d7332:	38 d0                	cmp    %dl,%al
3484   5d7334:	7f 08                	jg     5d733e <___bpf_prog_run+0x348e>
3486   5d7336:	84 c0                	test   %al,%al
3488   5d7338:	0f 85 ca 2d 00 00    	jne    5da108 <___bpf_prog_run+0x6258>
348e   5d733e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3492   5d7342:	83 e0 0f             	and    $0xf,%eax
3495   5d7345:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3499   5d7349:	4c 89 f8             	mov    %r15,%rax
349c   5d734c:	48 c1 e8 03          	shr    $0x3,%rax
34a0   5d7350:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
34a5   5d7355:	0f 85 ee 3e 00 00    	jne    5db249 <___bpf_prog_run+0x7399>
34ab   5d735b:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
34af   5d735f:	49 8b 07             	mov    (%r15),%rax
34b2   5d7362:	4c 89 ca             	mov    %r9,%rdx
34b5   5d7365:	48 c1 ea 03          	shr    $0x3,%rdx
34b9   5d7369:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
34be   5d736e:	4c 89 ca             	mov    %r9,%rdx
34c1   5d7371:	83 e2 07             	and    $0x7,%edx
34c4   5d7374:	83 c2 03             	add    $0x3,%edx
34c7   5d7377:	38 ca                	cmp    %cl,%dl
34c9   5d7379:	7c 08                	jl     5d7383 <___bpf_prog_run+0x34d3>
34cb   5d737b:	84 c9                	test   %cl,%cl
34cd   5d737d:	0f 85 bd 2b 00 00    	jne    5d9f40 <___bpf_prog_run+0x6090>
34d3   5d7383:	8b 4b 04             	mov    0x4(%rbx),%ecx
34d6   5d7386:	83 f9 3f             	cmp    $0x3f,%ecx
34d9   5d7389:	0f 87 00 00 00 00    	ja     5d738f <___bpf_prog_run+0x34df>	5d738b: R_X86_64_PC32	.text.unlikely+0x6dd2
34df   5d738f:	4c 89 fa             	mov    %r15,%rdx
34e2   5d7392:	48 d3 e8             	shr    %cl,%rax
34e5   5d7395:	48 c1 ea 03          	shr    $0x3,%rdx
34e9   5d7399:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
34ee   5d739e:	0f 85 ba 3e 00 00    	jne    5db25e <___bpf_prog_run+0x73ae>
34f4   5d73a4:	49 89 07             	mov    %rax,(%r15)
34f7   5d73a7:	48 83 c3 08          	add    $0x8,%rbx
34fb   5d73ab:	e9 3f cb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3500   5d73b0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3504   5d73b4:	48 89 f8             	mov    %rdi,%rax
3507   5d73b7:	48 89 fa             	mov    %rdi,%rdx
350a   5d73ba:	48 c1 e8 03          	shr    $0x3,%rax
350e   5d73be:	83 e2 07             	and    $0x7,%edx
3511   5d73c1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3516   5d73c6:	38 d0                	cmp    %dl,%al
3518   5d73c8:	7f 08                	jg     5d73d2 <___bpf_prog_run+0x3522>
351a   5d73ca:	84 c0                	test   %al,%al
351c   5d73cc:	0f 85 2c 2d 00 00    	jne    5da0fe <___bpf_prog_run+0x624e>
3522   5d73d2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3526   5d73d6:	c0 e8 04             	shr    $0x4,%al
3529   5d73d9:	0f b6 c0             	movzbl %al,%eax
352c   5d73dc:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3530   5d73e0:	4c 89 f8             	mov    %r15,%rax
3533   5d73e3:	48 c1 e8 03          	shr    $0x3,%rax
3537   5d73e7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
353c   5d73ec:	0f 85 d5 30 00 00    	jne    5da4c7 <___bpf_prog_run+0x6617>
3542   5d73f2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3546   5d73f6:	49 8b 0f             	mov    (%r15),%rcx
3549   5d73f9:	83 e0 0f             	and    $0xf,%eax
354c   5d73fc:	83 e1 3f             	and    $0x3f,%ecx
354f   5d73ff:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3553   5d7403:	4c 89 f8             	mov    %r15,%rax
3556   5d7406:	48 c1 e8 03          	shr    $0x3,%rax
355a   5d740a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
355f   5d740f:	0f 85 9d 30 00 00    	jne    5da4b2 <___bpf_prog_run+0x6602>
3565   5d7415:	49 d3 2f             	shrq   %cl,(%r15)
3568   5d7418:	48 83 c3 08          	add    $0x8,%rbx
356c   5d741c:	e9 ce ca ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3571   5d7421:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3575   5d7425:	48 89 f8             	mov    %rdi,%rax
3578   5d7428:	48 89 fa             	mov    %rdi,%rdx
357b   5d742b:	48 c1 e8 03          	shr    $0x3,%rax
357f   5d742f:	83 e2 07             	and    $0x7,%edx
3582   5d7432:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3587   5d7437:	38 d0                	cmp    %dl,%al
3589   5d7439:	7f 08                	jg     5d7443 <___bpf_prog_run+0x3593>
358b   5d743b:	84 c0                	test   %al,%al
358d   5d743d:	0f 85 b1 2c 00 00    	jne    5da0f4 <___bpf_prog_run+0x6244>
3593   5d7443:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3597   5d7447:	83 e0 0f             	and    $0xf,%eax
359a   5d744a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
359e   5d744e:	4c 89 f8             	mov    %r15,%rax
35a1   5d7451:	48 c1 e8 03          	shr    $0x3,%rax
35a5   5d7455:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
35aa   5d745a:	0f 85 27 33 00 00    	jne    5da787 <___bpf_prog_run+0x68d7>
35b0   5d7460:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
35b4   5d7464:	49 8b 17             	mov    (%r15),%rdx
35b7   5d7467:	c0 e8 04             	shr    $0x4,%al
35ba   5d746a:	0f b6 c0             	movzbl %al,%eax
35bd   5d746d:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
35c1   5d7471:	48 89 c1             	mov    %rax,%rcx
35c4   5d7474:	48 c1 e9 03          	shr    $0x3,%rcx
35c8   5d7478:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
35cd   5d747d:	0f 85 e7 32 00 00    	jne    5da76a <___bpf_prog_run+0x68ba>
35d3   5d7483:	33 10                	xor    (%rax),%edx
35d5   5d7485:	48 83 c3 08          	add    $0x8,%rbx
35d9   5d7489:	89 d0                	mov    %edx,%eax
35db   5d748b:	49 89 07             	mov    %rax,(%r15)
35de   5d748e:	e9 5c ca ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
35e3   5d7493:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
35e7   5d7497:	48 89 f8             	mov    %rdi,%rax
35ea   5d749a:	48 89 fa             	mov    %rdi,%rdx
35ed   5d749d:	48 c1 e8 03          	shr    $0x3,%rax
35f1   5d74a1:	83 e2 07             	and    $0x7,%edx
35f4   5d74a4:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
35f9   5d74a9:	38 d0                	cmp    %dl,%al
35fb   5d74ab:	7f 08                	jg     5d74b5 <___bpf_prog_run+0x3605>
35fd   5d74ad:	84 c0                	test   %al,%al
35ff   5d74af:	0f 85 35 2c 00 00    	jne    5da0ea <___bpf_prog_run+0x623a>
3605   5d74b5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3609   5d74b9:	c0 e8 04             	shr    $0x4,%al
360c   5d74bc:	0f b6 c0             	movzbl %al,%eax
360f   5d74bf:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3613   5d74c3:	4c 89 f8             	mov    %r15,%rax
3616   5d74c6:	48 c1 e8 03          	shr    $0x3,%rax
361a   5d74ca:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
361f   5d74cf:	0f 85 fd 38 00 00    	jne    5dadd2 <___bpf_prog_run+0x6f22>
3625   5d74d5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3629   5d74d9:	49 8b 0f             	mov    (%r15),%rcx
362c   5d74dc:	83 e0 0f             	and    $0xf,%eax
362f   5d74df:	83 e1 3f             	and    $0x3f,%ecx
3632   5d74e2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3636   5d74e6:	4c 89 f8             	mov    %r15,%rax
3639   5d74e9:	48 c1 e8 03          	shr    $0x3,%rax
363d   5d74ed:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3642   5d74f2:	0f 85 30 39 00 00    	jne    5dae28 <___bpf_prog_run+0x6f78>
3648   5d74f8:	49 d3 3f             	sarq   %cl,(%r15)
364b   5d74fb:	48 83 c3 08          	add    $0x8,%rbx
364f   5d74ff:	e9 eb c9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3654   5d7504:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3658   5d7508:	48 89 f8             	mov    %rdi,%rax
365b   5d750b:	48 89 fa             	mov    %rdi,%rdx
365e   5d750e:	48 c1 e8 03          	shr    $0x3,%rax
3662   5d7512:	83 e2 07             	and    $0x7,%edx
3665   5d7515:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
366a   5d751a:	38 d0                	cmp    %dl,%al
366c   5d751c:	7f 08                	jg     5d7526 <___bpf_prog_run+0x3676>
366e   5d751e:	84 c0                	test   %al,%al
3670   5d7520:	0f 85 ba 2b 00 00    	jne    5da0e0 <___bpf_prog_run+0x6230>
3676   5d7526:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
367a   5d752a:	83 e0 0f             	and    $0xf,%eax
367d   5d752d:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3681   5d7531:	4c 89 f8             	mov    %r15,%rax
3684   5d7534:	48 c1 e8 03          	shr    $0x3,%rax
3688   5d7538:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
368d   5d753d:	0f 85 f2 37 00 00    	jne    5dad35 <___bpf_prog_run+0x6e85>
3693   5d7543:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3697   5d7547:	49 8b 17             	mov    (%r15),%rdx
369a   5d754a:	c0 e8 04             	shr    $0x4,%al
369d   5d754d:	0f b6 c0             	movzbl %al,%eax
36a0   5d7550:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
36a4   5d7554:	48 89 c1             	mov    %rax,%rcx
36a7   5d7557:	48 c1 e9 03          	shr    $0x3,%rcx
36ab   5d755b:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
36b0   5d7560:	0f 85 b2 37 00 00    	jne    5dad18 <___bpf_prog_run+0x6e68>
36b6   5d7566:	23 10                	and    (%rax),%edx
36b8   5d7568:	48 83 c3 08          	add    $0x8,%rbx
36bc   5d756c:	89 d0                	mov    %edx,%eax
36be   5d756e:	49 89 07             	mov    %rax,(%r15)
36c1   5d7571:	e9 79 c9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
36c6   5d7576:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
36ca   5d757a:	48 89 f8             	mov    %rdi,%rax
36cd   5d757d:	48 c1 e8 03          	shr    $0x3,%rax
36d1   5d7581:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
36d6   5d7586:	48 89 f8             	mov    %rdi,%rax
36d9   5d7589:	83 e0 07             	and    $0x7,%eax
36dc   5d758c:	83 c0 03             	add    $0x3,%eax
36df   5d758f:	38 d0                	cmp    %dl,%al
36e1   5d7591:	7c 08                	jl     5d759b <___bpf_prog_run+0x36eb>
36e3   5d7593:	84 d2                	test   %dl,%dl
36e5   5d7595:	0f 85 3b 2b 00 00    	jne    5da0d6 <___bpf_prog_run+0x6226>
36eb   5d759b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
36ef   5d759f:	48 63 4b 04          	movslq 0x4(%rbx),%rcx
36f3   5d75a3:	48 89 f8             	mov    %rdi,%rax
36f6   5d75a6:	48 89 fa             	mov    %rdi,%rdx
36f9   5d75a9:	48 c1 e8 03          	shr    $0x3,%rax
36fd   5d75ad:	83 e2 07             	and    $0x7,%edx
3700   5d75b0:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3705   5d75b5:	38 d0                	cmp    %dl,%al
3707   5d75b7:	7f 08                	jg     5d75c1 <___bpf_prog_run+0x3711>
3709   5d75b9:	84 c0                	test   %al,%al
370b   5d75bb:	0f 85 76 20 00 00    	jne    5d9637 <___bpf_prog_run+0x5787>
3711   5d75c1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3715   5d75c5:	83 e0 0f             	and    $0xf,%eax
3718   5d75c8:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
371c   5d75cc:	4c 89 f8             	mov    %r15,%rax
371f   5d75cf:	48 c1 e8 03          	shr    $0x3,%rax
3723   5d75d3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3728   5d75d8:	0f 85 fa 32 00 00    	jne    5da8d8 <___bpf_prog_run+0x6a28>
372e   5d75de:	49 8b 07             	mov    (%r15),%rax
3731   5d75e1:	31 d2                	xor    %edx,%edx
3733   5d75e3:	48 83 c3 08          	add    $0x8,%rbx
3737   5d75e7:	48 f7 f1             	div    %rcx
373a   5d75ea:	49 89 07             	mov    %rax,(%r15)
373d   5d75ed:	e9 fd c8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3742   5d75f2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3746   5d75f6:	48 89 f8             	mov    %rdi,%rax
3749   5d75f9:	48 89 fa             	mov    %rdi,%rdx
374c   5d75fc:	48 c1 e8 03          	shr    $0x3,%rax
3750   5d7600:	83 e2 07             	and    $0x7,%edx
3753   5d7603:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3758   5d7608:	38 d0                	cmp    %dl,%al
375a   5d760a:	7f 08                	jg     5d7614 <___bpf_prog_run+0x3764>
375c   5d760c:	84 c0                	test   %al,%al
375e   5d760e:	0f 85 b8 2a 00 00    	jne    5da0cc <___bpf_prog_run+0x621c>
3764   5d7614:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3768   5d7618:	83 e0 0f             	and    $0xf,%eax
376b   5d761b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
376f   5d761f:	4c 89 f8             	mov    %r15,%rax
3772   5d7622:	48 c1 e8 03          	shr    $0x3,%rax
3776   5d7626:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
377b   5d762b:	0f 85 9c 30 00 00    	jne    5da6cd <___bpf_prog_run+0x681d>
3781   5d7631:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3785   5d7635:	49 8b 0f             	mov    (%r15),%rcx
3788   5d7638:	48 89 f8             	mov    %rdi,%rax
378b   5d763b:	48 c1 e8 03          	shr    $0x3,%rax
378f   5d763f:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3794   5d7644:	48 89 f8             	mov    %rdi,%rax
3797   5d7647:	83 e0 07             	and    $0x7,%eax
379a   5d764a:	83 c0 03             	add    $0x3,%eax
379d   5d764d:	38 d0                	cmp    %dl,%al
379f   5d764f:	7c 08                	jl     5d7659 <___bpf_prog_run+0x37a9>
37a1   5d7651:	84 d2                	test   %dl,%dl
37a3   5d7653:	0f 85 47 24 00 00    	jne    5d9aa0 <___bpf_prog_run+0x5bf0>
37a9   5d7659:	48 63 43 04          	movslq 0x4(%rbx),%rax
37ad   5d765d:	48 83 c3 08          	add    $0x8,%rbx
37b1   5d7661:	48 0f af c1          	imul   %rcx,%rax
37b5   5d7665:	49 89 07             	mov    %rax,(%r15)
37b8   5d7668:	e9 82 c8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
37bd   5d766d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
37c1   5d7671:	48 89 f8             	mov    %rdi,%rax
37c4   5d7674:	48 89 fa             	mov    %rdi,%rdx
37c7   5d7677:	48 c1 e8 03          	shr    $0x3,%rax
37cb   5d767b:	83 e2 07             	and    $0x7,%edx
37ce   5d767e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
37d3   5d7683:	38 d0                	cmp    %dl,%al
37d5   5d7685:	7f 08                	jg     5d768f <___bpf_prog_run+0x37df>
37d7   5d7687:	84 c0                	test   %al,%al
37d9   5d7689:	0f 85 33 2a 00 00    	jne    5da0c2 <___bpf_prog_run+0x6212>
37df   5d768f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
37e3   5d7693:	83 e0 0f             	and    $0xf,%eax
37e6   5d7696:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
37ea   5d769a:	4c 89 f8             	mov    %r15,%rax
37ed   5d769d:	48 c1 e8 03          	shr    $0x3,%rax
37f1   5d76a1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
37f6   5d76a6:	0f 85 be 2e 00 00    	jne    5da56a <___bpf_prog_run+0x66ba>
37fc   5d76ac:	49 f7 1f             	negq   (%r15)
37ff   5d76af:	48 83 c3 08          	add    $0x8,%rbx
3803   5d76b3:	e9 37 c8 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3808   5d76b8:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
380c   5d76bc:	48 89 f8             	mov    %rdi,%rax
380f   5d76bf:	48 89 fa             	mov    %rdi,%rdx
3812   5d76c2:	48 c1 e8 03          	shr    $0x3,%rax
3816   5d76c6:	83 e2 07             	and    $0x7,%edx
3819   5d76c9:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
381e   5d76ce:	38 d0                	cmp    %dl,%al
3820   5d76d0:	7f 08                	jg     5d76da <___bpf_prog_run+0x382a>
3822   5d76d2:	84 c0                	test   %al,%al
3824   5d76d4:	0f 85 de 29 00 00    	jne    5da0b8 <___bpf_prog_run+0x6208>
382a   5d76da:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
382e   5d76de:	83 e0 0f             	and    $0xf,%eax
3831   5d76e1:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3835   5d76e5:	4c 89 f8             	mov    %r15,%rax
3838   5d76e8:	48 c1 e8 03          	shr    $0x3,%rax
383c   5d76ec:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3841   5d76f1:	0f 85 65 33 00 00    	jne    5daa5c <___bpf_prog_run+0x6bac>
3847   5d76f7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
384b   5d76fb:	49 8b 17             	mov    (%r15),%rdx
384e   5d76fe:	c0 e8 04             	shr    $0x4,%al
3851   5d7701:	0f b6 c0             	movzbl %al,%eax
3854   5d7704:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3858   5d7708:	48 89 c1             	mov    %rax,%rcx
385b   5d770b:	48 c1 e9 03          	shr    $0x3,%rcx
385f   5d770f:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3864   5d7714:	0f 85 fe 2d 00 00    	jne    5da518 <___bpf_prog_run+0x6668>
386a   5d771a:	03 10                	add    (%rax),%edx
386c   5d771c:	48 83 c3 08          	add    $0x8,%rbx
3870   5d7720:	89 d0                	mov    %edx,%eax
3872   5d7722:	49 89 07             	mov    %rax,(%r15)
3875   5d7725:	e9 c5 c7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
387a   5d772a:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
387e   5d772e:	48 89 f8             	mov    %rdi,%rax
3881   5d7731:	48 89 fa             	mov    %rdi,%rdx
3884   5d7734:	48 c1 e8 03          	shr    $0x3,%rax
3888   5d7738:	83 e2 07             	and    $0x7,%edx
388b   5d773b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3890   5d7740:	38 d0                	cmp    %dl,%al
3892   5d7742:	7f 08                	jg     5d774c <___bpf_prog_run+0x389c>
3894   5d7744:	84 c0                	test   %al,%al
3896   5d7746:	0f 85 62 29 00 00    	jne    5da0ae <___bpf_prog_run+0x61fe>
389c   5d774c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
38a0   5d7750:	83 e0 0f             	and    $0xf,%eax
38a3   5d7753:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
38a7   5d7757:	4c 89 f8             	mov    %r15,%rax
38aa   5d775a:	48 c1 e8 03          	shr    $0x3,%rax
38ae   5d775e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
38b3   5d7763:	0f 85 94 30 00 00    	jne    5da7fd <___bpf_prog_run+0x694d>
38b9   5d7769:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
38bd   5d776d:	49 8b 17             	mov    (%r15),%rdx
38c0   5d7770:	c0 e8 04             	shr    $0x4,%al
38c3   5d7773:	0f b6 c0             	movzbl %al,%eax
38c6   5d7776:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
38ca   5d777a:	4c 89 f8             	mov    %r15,%rax
38cd   5d777d:	48 c1 e8 03          	shr    $0x3,%rax
38d1   5d7781:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
38d6   5d7786:	0f 85 5c 30 00 00    	jne    5da7e8 <___bpf_prog_run+0x6938>
38dc   5d778c:	49 3b 17             	cmp    (%r15),%rdx
38df   5d778f:	0f 84 4a 15 00 00    	je     5d8cdf <___bpf_prog_run+0x4e2f>
38e5   5d7795:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
38e9   5d7799:	48 89 f8             	mov    %rdi,%rax
38ec   5d779c:	48 c1 e8 03          	shr    $0x3,%rax
38f0   5d77a0:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
38f5   5d77a5:	48 89 f8             	mov    %rdi,%rax
38f8   5d77a8:	83 e0 07             	and    $0x7,%eax
38fb   5d77ab:	83 c0 01             	add    $0x1,%eax
38fe   5d77ae:	38 d0                	cmp    %dl,%al
3900   5d77b0:	7c 08                	jl     5d77ba <___bpf_prog_run+0x390a>
3902   5d77b2:	84 d2                	test   %dl,%dl
3904   5d77b4:	0f 85 bf 2c 00 00    	jne    5da479 <___bpf_prog_run+0x65c9>
390a   5d77ba:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
390f   5d77bf:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
3914   5d77c4:	e9 26 c7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3919   5d77c9:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
391d   5d77cd:	48 89 f8             	mov    %rdi,%rax
3920   5d77d0:	48 89 fa             	mov    %rdi,%rdx
3923   5d77d3:	48 c1 e8 03          	shr    $0x3,%rax
3927   5d77d7:	83 e2 07             	and    $0x7,%edx
392a   5d77da:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
392f   5d77df:	38 d0                	cmp    %dl,%al
3931   5d77e1:	7f 08                	jg     5d77eb <___bpf_prog_run+0x393b>
3933   5d77e3:	84 c0                	test   %al,%al
3935   5d77e5:	0f 85 b9 28 00 00    	jne    5da0a4 <___bpf_prog_run+0x61f4>
393b   5d77eb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
393f   5d77ef:	83 e0 0f             	and    $0xf,%eax
3942   5d77f2:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3946   5d77f6:	4c 89 f8             	mov    %r15,%rax
3949   5d77f9:	48 c1 e8 03          	shr    $0x3,%rax
394d   5d77fd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3952   5d7802:	0f 85 02 34 00 00    	jne    5dac0a <___bpf_prog_run+0x6d5a>
3958   5d7808:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
395c   5d780c:	49 8b 0f             	mov    (%r15),%rcx
395f   5d780f:	48 89 f8             	mov    %rdi,%rax
3962   5d7812:	48 c1 e8 03          	shr    $0x3,%rax
3966   5d7816:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
396b   5d781b:	48 89 f8             	mov    %rdi,%rax
396e   5d781e:	83 e0 07             	and    $0x7,%eax
3971   5d7821:	83 c0 03             	add    $0x3,%eax
3974   5d7824:	38 d0                	cmp    %dl,%al
3976   5d7826:	7c 08                	jl     5d7830 <___bpf_prog_run+0x3980>
3978   5d7828:	84 d2                	test   %dl,%dl
397a   5d782a:	0f 85 dd 22 00 00    	jne    5d9b0d <___bpf_prog_run+0x5c5d>
3980   5d7830:	48 63 43 04          	movslq 0x4(%rbx),%rax
3984   5d7834:	48 83 c3 08          	add    $0x8,%rbx
3988   5d7838:	48 31 c8             	xor    %rcx,%rax
398b   5d783b:	49 89 07             	mov    %rax,(%r15)
398e   5d783e:	e9 ac c6 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3993   5d7843:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3997   5d7847:	48 89 f8             	mov    %rdi,%rax
399a   5d784a:	48 89 fa             	mov    %rdi,%rdx
399d   5d784d:	48 c1 e8 03          	shr    $0x3,%rax
39a1   5d7851:	83 e2 07             	and    $0x7,%edx
39a4   5d7854:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
39a9   5d7859:	38 d0                	cmp    %dl,%al
39ab   5d785b:	7f 08                	jg     5d7865 <___bpf_prog_run+0x39b5>
39ad   5d785d:	84 c0                	test   %al,%al
39af   5d785f:	0f 85 35 28 00 00    	jne    5da09a <___bpf_prog_run+0x61ea>
39b5   5d7865:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
39b9   5d7869:	83 e0 0f             	and    $0xf,%eax
39bc   5d786c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
39c0   5d7870:	4c 89 f8             	mov    %r15,%rax
39c3   5d7873:	48 c1 e8 03          	shr    $0x3,%rax
39c7   5d7877:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
39cc   5d787c:	0f 85 f1 33 00 00    	jne    5dac73 <___bpf_prog_run+0x6dc3>
39d2   5d7882:	49 8d 7e 58          	lea    0x58(%r14),%rdi
39d6   5d7886:	41 8b 07             	mov    (%r15),%eax
39d9   5d7889:	48 89 fa             	mov    %rdi,%rdx
39dc   5d788c:	48 c1 ea 03          	shr    $0x3,%rdx
39e0   5d7890:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
39e5   5d7895:	0f 85 1c 2d 00 00    	jne    5da5b7 <___bpf_prog_run+0x6707>
39eb   5d789b:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
39ef   5d789f:	49 89 46 58          	mov    %rax,0x58(%r14)
39f3   5d78a3:	48 89 fa             	mov    %rdi,%rdx
39f6   5d78a6:	48 c1 ea 03          	shr    $0x3,%rdx
39fa   5d78aa:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
39ff   5d78af:	48 89 fa             	mov    %rdi,%rdx
3a02   5d78b2:	83 e2 07             	and    $0x7,%edx
3a05   5d78b5:	83 c2 03             	add    $0x3,%edx
3a08   5d78b8:	38 ca                	cmp    %cl,%dl
3a0a   5d78ba:	7c 08                	jl     5d78c4 <___bpf_prog_run+0x3a14>
3a0c   5d78bc:	84 c9                	test   %cl,%cl
3a0e   5d78be:	0f 85 a8 23 00 00    	jne    5d9c6c <___bpf_prog_run+0x5dbc>
3a14   5d78c4:	8b 4b 04             	mov    0x4(%rbx),%ecx
3a17   5d78c7:	31 d2                	xor    %edx,%edx
3a19   5d78c9:	48 f7 f1             	div    %rcx
3a1c   5d78cc:	49 89 46 58          	mov    %rax,0x58(%r14)
3a20   5d78d0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3a24   5d78d4:	83 e0 0f             	and    $0xf,%eax
3a27   5d78d7:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3a2b   5d78db:	4c 89 f8             	mov    %r15,%rax
3a2e   5d78de:	48 c1 e8 03          	shr    $0x3,%rax
3a32   5d78e2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a37   5d78e7:	0f 85 4a 33 00 00    	jne    5dac37 <___bpf_prog_run+0x6d87>
3a3d   5d78ed:	49 89 17             	mov    %rdx,(%r15)
3a40   5d78f0:	48 83 c3 08          	add    $0x8,%rbx
3a44   5d78f4:	e9 f6 c5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3a49   5d78f9:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3a4d   5d78fd:	48 89 f8             	mov    %rdi,%rax
3a50   5d7900:	48 89 fa             	mov    %rdi,%rdx
3a53   5d7903:	48 c1 e8 03          	shr    $0x3,%rax
3a57   5d7907:	83 e2 07             	and    $0x7,%edx
3a5a   5d790a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3a5f   5d790f:	38 d0                	cmp    %dl,%al
3a61   5d7911:	7f 08                	jg     5d791b <___bpf_prog_run+0x3a6b>
3a63   5d7913:	84 c0                	test   %al,%al
3a65   5d7915:	0f 85 75 27 00 00    	jne    5da090 <___bpf_prog_run+0x61e0>
3a6b   5d791b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3a6f   5d791f:	83 e0 0f             	and    $0xf,%eax
3a72   5d7922:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3a76   5d7926:	4c 89 f8             	mov    %r15,%rax
3a79   5d7929:	48 c1 e8 03          	shr    $0x3,%rax
3a7d   5d792d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a82   5d7932:	0f 85 9c 33 00 00    	jne    5dacd4 <___bpf_prog_run+0x6e24>
3a88   5d7938:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3a8c   5d793c:	49 8b 0f             	mov    (%r15),%rcx
3a8f   5d793f:	48 89 f8             	mov    %rdi,%rax
3a92   5d7942:	48 c1 e8 03          	shr    $0x3,%rax
3a96   5d7946:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3a9b   5d794b:	48 89 f8             	mov    %rdi,%rax
3a9e   5d794e:	83 e0 07             	and    $0x7,%eax
3aa1   5d7951:	83 c0 03             	add    $0x3,%eax
3aa4   5d7954:	38 d0                	cmp    %dl,%al
3aa6   5d7956:	7c 08                	jl     5d7960 <___bpf_prog_run+0x3ab0>
3aa8   5d7958:	84 d2                	test   %dl,%dl
3aaa   5d795a:	0f 85 2d 22 00 00    	jne    5d9b8d <___bpf_prog_run+0x5cdd>
3ab0   5d7960:	48 63 43 04          	movslq 0x4(%rbx),%rax
3ab4   5d7964:	48 83 c3 08          	add    $0x8,%rbx
3ab8   5d7968:	48 09 c8             	or     %rcx,%rax
3abb   5d796b:	49 89 07             	mov    %rax,(%r15)
3abe   5d796e:	e9 7c c5 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3ac3   5d7973:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3ac7   5d7977:	48 89 f8             	mov    %rdi,%rax
3aca   5d797a:	48 c1 e8 03          	shr    $0x3,%rax
3ace   5d797e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3ad3   5d7983:	48 89 f8             	mov    %rdi,%rax
3ad6   5d7986:	83 e0 07             	and    $0x7,%eax
3ad9   5d7989:	83 c0 03             	add    $0x3,%eax
3adc   5d798c:	38 d0                	cmp    %dl,%al
3ade   5d798e:	7c 08                	jl     5d7998 <___bpf_prog_run+0x3ae8>
3ae0   5d7990:	84 d2                	test   %dl,%dl
3ae2   5d7992:	0f 85 ee 26 00 00    	jne    5da086 <___bpf_prog_run+0x61d6>
3ae8   5d7998:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
3aec   5d799c:	4c 63 7b 04          	movslq 0x4(%rbx),%r15
3af0   5d79a0:	48 89 f8             	mov    %rdi,%rax
3af3   5d79a3:	48 c1 e8 03          	shr    $0x3,%rax
3af7   5d79a7:	49 81 c7 00 00 00 00 	add    $0x0,%r15	5d79aa: R_X86_64_32S	__bpf_call_base
3afe   5d79ae:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3b03   5d79b3:	48 89 f8             	mov    %rdi,%rax
3b06   5d79b6:	83 e0 07             	and    $0x7,%eax
3b09   5d79b9:	83 c0 01             	add    $0x1,%eax
3b0c   5d79bc:	38 d0                	cmp    %dl,%al
3b0e   5d79be:	7c 08                	jl     5d79c8 <___bpf_prog_run+0x3b18>
3b10   5d79c0:	84 d2                	test   %dl,%dl
3b12   5d79c2:	0f 85 2e 1f 00 00    	jne    5d98f6 <___bpf_prog_run+0x5a46>
3b18   5d79c8:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
3b1d   5d79cd:	49 8d 7e 28          	lea    0x28(%r14),%rdi
3b21   5d79d1:	4c 8d 4c c3 08       	lea    0x8(%rbx,%rax,8),%r9
3b26   5d79d6:	48 89 f8             	mov    %rdi,%rax
3b29   5d79d9:	48 c1 e8 03          	shr    $0x3,%rax
3b2d   5d79dd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b32   5d79e2:	0f 85 21 36 00 00    	jne    5db009 <___bpf_prog_run+0x7159>
3b38   5d79e8:	49 8d 7e 20          	lea    0x20(%r14),%rdi
3b3c   5d79ec:	4d 8b 46 28          	mov    0x28(%r14),%r8
3b40   5d79f0:	48 89 f8             	mov    %rdi,%rax
3b43   5d79f3:	48 c1 e8 03          	shr    $0x3,%rax
3b47   5d79f7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b4c   5d79fc:	0f 85 ed 35 00 00    	jne    5dafef <___bpf_prog_run+0x713f>
3b52   5d7a02:	49 8d 7e 18          	lea    0x18(%r14),%rdi
3b56   5d7a06:	49 8b 4e 20          	mov    0x20(%r14),%rcx
3b5a   5d7a0a:	48 89 f8             	mov    %rdi,%rax
3b5d   5d7a0d:	48 c1 e8 03          	shr    $0x3,%rax
3b61   5d7a11:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b66   5d7a16:	0f 85 b1 35 00 00    	jne    5dafcd <___bpf_prog_run+0x711d>
3b6c   5d7a1c:	41 80 3c 24 00       	cmpb   $0x0,(%r12)
3b71   5d7a21:	49 8b 56 18          	mov    0x18(%r14),%rdx
3b75   5d7a25:	0f 85 11 2e 00 00    	jne    5da83c <___bpf_prog_run+0x698c>
3b7b   5d7a2b:	49 8d 7e 08          	lea    0x8(%r14),%rdi
3b7f   5d7a2f:	49 8b 76 10          	mov    0x10(%r14),%rsi
3b83   5d7a33:	48 89 f8             	mov    %rdi,%rax
3b86   5d7a36:	48 c1 e8 03          	shr    $0x3,%rax
3b8a   5d7a3a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b8f   5d7a3f:	0f 85 c5 2d 00 00    	jne    5da80a <___bpf_prog_run+0x695a>
3b95   5d7a45:	49 8b 7e 08          	mov    0x8(%r14),%rdi
3b99   5d7a49:	41 ff d7             	call   *%r15
3b9c   5d7a4c:	49 89 c7             	mov    %rax,%r15
3b9f   5d7a4f:	4c 89 f0             	mov    %r14,%rax
3ba2   5d7a52:	48 c1 e8 03          	shr    $0x3,%rax
3ba6   5d7a56:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3bab   5d7a5b:	0f 85 75 2b 00 00    	jne    5da5d6 <___bpf_prog_run+0x6726>
3bb1   5d7a61:	4d 89 3e             	mov    %r15,(%r14)
3bb4   5d7a64:	48 83 c3 08          	add    $0x8,%rbx
3bb8   5d7a68:	e9 82 c4 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3bbd   5d7a6d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3bc1   5d7a71:	48 89 f8             	mov    %rdi,%rax
3bc4   5d7a74:	48 89 fa             	mov    %rdi,%rdx
3bc7   5d7a77:	48 c1 e8 03          	shr    $0x3,%rax
3bcb   5d7a7b:	83 e2 07             	and    $0x7,%edx
3bce   5d7a7e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3bd3   5d7a83:	38 d0                	cmp    %dl,%al
3bd5   5d7a85:	7f 08                	jg     5d7a8f <___bpf_prog_run+0x3bdf>
3bd7   5d7a87:	84 c0                	test   %al,%al
3bd9   5d7a89:	0f 85 ed 25 00 00    	jne    5da07c <___bpf_prog_run+0x61cc>
3bdf   5d7a8f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3be3   5d7a93:	83 e0 0f             	and    $0xf,%eax
3be6   5d7a96:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3bea   5d7a9a:	4c 89 f8             	mov    %r15,%rax
3bed   5d7a9d:	48 c1 e8 03          	shr    $0x3,%rax
3bf1   5d7aa1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3bf6   5d7aa6:	0f 85 2f 2d 00 00    	jne    5da7db <___bpf_prog_run+0x692b>
3bfc   5d7aac:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3c00   5d7ab0:	49 8b 17             	mov    (%r15),%rdx
3c03   5d7ab3:	c0 e8 04             	shr    $0x4,%al
3c06   5d7ab6:	0f b6 c0             	movzbl %al,%eax
3c09   5d7ab9:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3c0d   5d7abd:	48 89 c1             	mov    %rax,%rcx
3c10   5d7ac0:	48 c1 e9 03          	shr    $0x3,%rcx
3c14   5d7ac4:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3c19   5d7ac9:	0f 85 ef 2c 00 00    	jne    5da7be <___bpf_prog_run+0x690e>
3c1f   5d7acf:	48 0f af 10          	imul   (%rax),%rdx
3c23   5d7ad3:	48 83 c3 08          	add    $0x8,%rbx
3c27   5d7ad7:	49 89 17             	mov    %rdx,(%r15)
3c2a   5d7ada:	e9 10 c4 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3c2f   5d7adf:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3c33   5d7ae3:	48 89 f8             	mov    %rdi,%rax
3c36   5d7ae6:	48 c1 e8 03          	shr    $0x3,%rax
3c3a   5d7aea:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3c3f   5d7aef:	48 89 f8             	mov    %rdi,%rax
3c42   5d7af2:	83 e0 07             	and    $0x7,%eax
3c45   5d7af5:	83 c0 03             	add    $0x3,%eax
3c48   5d7af8:	38 d0                	cmp    %dl,%al
3c4a   5d7afa:	7c 08                	jl     5d7b04 <___bpf_prog_run+0x3c54>
3c4c   5d7afc:	84 d2                	test   %dl,%dl
3c4e   5d7afe:	0f 85 6e 25 00 00    	jne    5da072 <___bpf_prog_run+0x61c2>
3c54   5d7b04:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
3c58   5d7b08:	44 8b 7b 04          	mov    0x4(%rbx),%r15d
3c5c   5d7b0c:	48 89 f8             	mov    %rdi,%rax
3c5f   5d7b0f:	48 c1 e8 03          	shr    $0x3,%rax
3c63   5d7b13:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3c68   5d7b18:	48 89 f8             	mov    %rdi,%rax
3c6b   5d7b1b:	83 e0 07             	and    $0x7,%eax
3c6e   5d7b1e:	83 c0 03             	add    $0x3,%eax
3c71   5d7b21:	38 d0                	cmp    %dl,%al
3c73   5d7b23:	7c 08                	jl     5d7b2d <___bpf_prog_run+0x3c7d>
3c75   5d7b25:	84 d2                	test   %dl,%dl
3c77   5d7b27:	0f 85 fe 20 00 00    	jne    5d9c2b <___bpf_prog_run+0x5d7b>
3c7d   5d7b2d:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3c81   5d7b31:	8b 43 0c             	mov    0xc(%rbx),%eax
3c84   5d7b34:	48 89 fa             	mov    %rdi,%rdx
3c87   5d7b37:	48 89 f9             	mov    %rdi,%rcx
3c8a   5d7b3a:	48 c1 ea 03          	shr    $0x3,%rdx
3c8e   5d7b3e:	83 e1 07             	and    $0x7,%ecx
3c91   5d7b41:	48 c1 e0 20          	shl    $0x20,%rax
3c95   5d7b45:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
3c9a   5d7b4a:	38 ca                	cmp    %cl,%dl
3c9c   5d7b4c:	7f 08                	jg     5d7b56 <___bpf_prog_run+0x3ca6>
3c9e   5d7b4e:	84 d2                	test   %dl,%dl
3ca0   5d7b50:	0f 85 c3 20 00 00    	jne    5d9c19 <___bpf_prog_run+0x5d69>
3ca6   5d7b56:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
3caa   5d7b5a:	49 09 c7             	or     %rax,%r15
3cad   5d7b5d:	83 e2 0f             	and    $0xf,%edx
3cb0   5d7b60:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
3cb4   5d7b64:	48 89 d0             	mov    %rdx,%rax
3cb7   5d7b67:	48 c1 e8 03          	shr    $0x3,%rax
3cbb   5d7b6b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3cc0   5d7b70:	0f 85 f4 2c 00 00    	jne    5da86a <___bpf_prog_run+0x69ba>
3cc6   5d7b76:	4c 89 3a             	mov    %r15,(%rdx)
3cc9   5d7b79:	48 83 c3 10          	add    $0x10,%rbx
3ccd   5d7b7d:	e9 6d c3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3cd2   5d7b82:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3cd6   5d7b86:	48 89 f8             	mov    %rdi,%rax
3cd9   5d7b89:	48 89 fa             	mov    %rdi,%rdx
3cdc   5d7b8c:	48 c1 e8 03          	shr    $0x3,%rax
3ce0   5d7b90:	83 e2 07             	and    $0x7,%edx
3ce3   5d7b93:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3ce8   5d7b98:	38 d0                	cmp    %dl,%al
3cea   5d7b9a:	7f 08                	jg     5d7ba4 <___bpf_prog_run+0x3cf4>
3cec   5d7b9c:	84 c0                	test   %al,%al
3cee   5d7b9e:	0f 85 c4 24 00 00    	jne    5da068 <___bpf_prog_run+0x61b8>
3cf4   5d7ba4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3cf8   5d7ba8:	83 e0 0f             	and    $0xf,%eax
3cfb   5d7bab:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3cff   5d7baf:	4c 89 f8             	mov    %r15,%rax
3d02   5d7bb2:	48 c1 e8 03          	shr    $0x3,%rax
3d06   5d7bb6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3d0b   5d7bbb:	0f 85 a8 2e 00 00    	jne    5daa69 <___bpf_prog_run+0x6bb9>
3d11   5d7bc1:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3d15   5d7bc5:	49 8b 07             	mov    (%r15),%rax
3d18   5d7bc8:	48 89 fa             	mov    %rdi,%rdx
3d1b   5d7bcb:	48 c1 ea 03          	shr    $0x3,%rdx
3d1f   5d7bcf:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
3d24   5d7bd4:	48 89 fa             	mov    %rdi,%rdx
3d27   5d7bd7:	83 e2 07             	and    $0x7,%edx
3d2a   5d7bda:	83 c2 03             	add    $0x3,%edx
3d2d   5d7bdd:	38 ca                	cmp    %cl,%dl
3d2f   5d7bdf:	7c 08                	jl     5d7be9 <___bpf_prog_run+0x3d39>
3d31   5d7be1:	84 c9                	test   %cl,%cl
3d33   5d7be3:	0f 85 c8 1f 00 00    	jne    5d9bb1 <___bpf_prog_run+0x5d01>
3d39   5d7be9:	48 63 53 04          	movslq 0x4(%rbx),%rdx
3d3d   5d7bed:	48 83 c3 08          	add    $0x8,%rbx
3d41   5d7bf1:	48 29 d0             	sub    %rdx,%rax
3d44   5d7bf4:	49 89 07             	mov    %rax,(%r15)
3d47   5d7bf7:	e9 f3 c2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3d4c   5d7bfc:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3d50   5d7c00:	48 89 f8             	mov    %rdi,%rax
3d53   5d7c03:	48 89 fa             	mov    %rdi,%rdx
3d56   5d7c06:	48 c1 e8 03          	shr    $0x3,%rax
3d5a   5d7c0a:	83 e2 07             	and    $0x7,%edx
3d5d   5d7c0d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3d62   5d7c12:	38 d0                	cmp    %dl,%al
3d64   5d7c14:	7f 08                	jg     5d7c1e <___bpf_prog_run+0x3d6e>
3d66   5d7c16:	84 c0                	test   %al,%al
3d68   5d7c18:	0f 85 40 24 00 00    	jne    5da05e <___bpf_prog_run+0x61ae>
3d6e   5d7c1e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3d72   5d7c22:	83 e0 0f             	and    $0xf,%eax
3d75   5d7c25:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3d79   5d7c29:	4c 89 f8             	mov    %r15,%rax
3d7c   5d7c2c:	48 c1 e8 03          	shr    $0x3,%rax
3d80   5d7c30:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3d85   5d7c35:	0f 85 f2 2d 00 00    	jne    5daa2d <___bpf_prog_run+0x6b7d>
3d8b   5d7c3b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3d8f   5d7c3f:	49 8b 17             	mov    (%r15),%rdx
3d92   5d7c42:	c0 e8 04             	shr    $0x4,%al
3d95   5d7c45:	0f b6 c0             	movzbl %al,%eax
3d98   5d7c48:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3d9c   5d7c4c:	4c 89 f8             	mov    %r15,%rax
3d9f   5d7c4f:	48 c1 e8 03          	shr    $0x3,%rax
3da3   5d7c53:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3da8   5d7c58:	0f 85 ba 2d 00 00    	jne    5daa18 <___bpf_prog_run+0x6b68>
3dae   5d7c5e:	49 3b 17             	cmp    (%r15),%rdx
3db1   5d7c61:	0f 84 f2 10 00 00    	je     5d8d59 <___bpf_prog_run+0x4ea9>
3db7   5d7c67:	48 83 c3 08          	add    $0x8,%rbx
3dbb   5d7c6b:	e9 7f c2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3dc0   5d7c70:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3dc4   5d7c74:	48 89 f8             	mov    %rdi,%rax
3dc7   5d7c77:	48 89 fa             	mov    %rdi,%rdx
3dca   5d7c7a:	48 c1 e8 03          	shr    $0x3,%rax
3dce   5d7c7e:	83 e2 07             	and    $0x7,%edx
3dd1   5d7c81:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3dd6   5d7c86:	38 d0                	cmp    %dl,%al
3dd8   5d7c88:	7f 08                	jg     5d7c92 <___bpf_prog_run+0x3de2>
3dda   5d7c8a:	84 c0                	test   %al,%al
3ddc   5d7c8c:	0f 85 c2 23 00 00    	jne    5da054 <___bpf_prog_run+0x61a4>
3de2   5d7c92:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3de6   5d7c96:	83 e0 0f             	and    $0xf,%eax
3de9   5d7c99:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3ded   5d7c9d:	4c 89 f8             	mov    %r15,%rax
3df0   5d7ca0:	48 c1 e8 03          	shr    $0x3,%rax
3df4   5d7ca4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3df9   5d7ca9:	0f 85 7f 2a 00 00    	jne    5da72e <___bpf_prog_run+0x687e>
3dff   5d7caf:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3e03   5d7cb3:	49 8b 17             	mov    (%r15),%rdx
3e06   5d7cb6:	c0 e8 04             	shr    $0x4,%al
3e09   5d7cb9:	0f b6 c0             	movzbl %al,%eax
3e0c   5d7cbc:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3e10   5d7cc0:	48 89 c1             	mov    %rax,%rcx
3e13   5d7cc3:	48 c1 e9 03          	shr    $0x3,%rcx
3e17   5d7cc7:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
3e1c   5d7ccc:	0f 85 3f 2a 00 00    	jne    5da711 <___bpf_prog_run+0x6861>
3e22   5d7cd2:	48 33 10             	xor    (%rax),%rdx
3e25   5d7cd5:	48 83 c3 08          	add    $0x8,%rbx
3e29   5d7cd9:	49 89 17             	mov    %rdx,(%r15)
3e2c   5d7cdc:	e9 0e c2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3e31   5d7ce1:	4c 8d 43 01          	lea    0x1(%rbx),%r8
3e35   5d7ce5:	4c 89 c0             	mov    %r8,%rax
3e38   5d7ce8:	4c 89 c2             	mov    %r8,%rdx
3e3b   5d7ceb:	48 c1 e8 03          	shr    $0x3,%rax
3e3f   5d7cef:	83 e2 07             	and    $0x7,%edx
3e42   5d7cf2:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3e47   5d7cf7:	38 d0                	cmp    %dl,%al
3e49   5d7cf9:	7f 08                	jg     5d7d03 <___bpf_prog_run+0x3e53>
3e4b   5d7cfb:	84 c0                	test   %al,%al
3e4d   5d7cfd:	0f 85 3c 23 00 00    	jne    5da03f <___bpf_prog_run+0x618f>
3e53   5d7d03:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3e57   5d7d07:	83 e0 0f             	and    $0xf,%eax
3e5a   5d7d0a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3e5e   5d7d0e:	4c 89 f8             	mov    %r15,%rax
3e61   5d7d11:	48 c1 e8 03          	shr    $0x3,%rax
3e65   5d7d15:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3e6a   5d7d1a:	0f 85 1d 31 00 00    	jne    5dae3d <___bpf_prog_run+0x6f8d>
3e70   5d7d20:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
3e74   5d7d24:	49 8b 07             	mov    (%r15),%rax
3e77   5d7d27:	4c 89 ca             	mov    %r9,%rdx
3e7a   5d7d2a:	48 c1 ea 03          	shr    $0x3,%rdx
3e7e   5d7d2e:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
3e83   5d7d33:	4c 89 ca             	mov    %r9,%rdx
3e86   5d7d36:	83 e2 07             	and    $0x7,%edx
3e89   5d7d39:	83 c2 03             	add    $0x3,%edx
3e8c   5d7d3c:	38 ca                	cmp    %cl,%dl
3e8e   5d7d3e:	7c 08                	jl     5d7d48 <___bpf_prog_run+0x3e98>
3e90   5d7d40:	84 c9                	test   %cl,%cl
3e92   5d7d42:	0f 85 ed 1e 00 00    	jne    5d9c35 <___bpf_prog_run+0x5d85>
3e98   5d7d48:	8b 4b 04             	mov    0x4(%rbx),%ecx
3e9b   5d7d4b:	83 f9 3f             	cmp    $0x3f,%ecx
3e9e   5d7d4e:	0f 87 00 00 00 00    	ja     5d7d54 <___bpf_prog_run+0x3ea4>	5d7d50: R_X86_64_PC32	.text.unlikely+0x6f00
3ea4   5d7d54:	4c 89 fa             	mov    %r15,%rdx
3ea7   5d7d57:	48 d3 f8             	sar    %cl,%rax
3eaa   5d7d5a:	48 c1 ea 03          	shr    $0x3,%rdx
3eae   5d7d5e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
3eb3   5d7d63:	0f 85 76 30 00 00    	jne    5daddf <___bpf_prog_run+0x6f2f>
3eb9   5d7d69:	49 89 07             	mov    %rax,(%r15)
3ebc   5d7d6c:	48 83 c3 08          	add    $0x8,%rbx
3ec0   5d7d70:	e9 7a c1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3ec5   5d7d75:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3ec9   5d7d79:	48 89 f8             	mov    %rdi,%rax
3ecc   5d7d7c:	48 89 fa             	mov    %rdi,%rdx
3ecf   5d7d7f:	48 c1 e8 03          	shr    $0x3,%rax
3ed3   5d7d83:	83 e2 07             	and    $0x7,%edx
3ed6   5d7d86:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3edb   5d7d8b:	38 d0                	cmp    %dl,%al
3edd   5d7d8d:	7f 08                	jg     5d7d97 <___bpf_prog_run+0x3ee7>
3edf   5d7d8f:	84 c0                	test   %al,%al
3ee1   5d7d91:	0f 85 9e 22 00 00    	jne    5da035 <___bpf_prog_run+0x6185>
3ee7   5d7d97:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3eeb   5d7d9b:	83 e0 0f             	and    $0xf,%eax
3eee   5d7d9e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3ef2   5d7da2:	4c 89 f8             	mov    %r15,%rax
3ef5   5d7da5:	48 c1 e8 03          	shr    $0x3,%rax
3ef9   5d7da9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3efe   5d7dae:	0f 85 b8 2f 00 00    	jne    5dad6c <___bpf_prog_run+0x6ebc>
3f04   5d7db4:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3f08   5d7db8:	49 8b 0f             	mov    (%r15),%rcx
3f0b   5d7dbb:	48 89 f8             	mov    %rdi,%rax
3f0e   5d7dbe:	48 c1 e8 03          	shr    $0x3,%rax
3f12   5d7dc2:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3f17   5d7dc7:	48 89 f8             	mov    %rdi,%rax
3f1a   5d7dca:	83 e0 07             	and    $0x7,%eax
3f1d   5d7dcd:	83 c0 03             	add    $0x3,%eax
3f20   5d7dd0:	38 d0                	cmp    %dl,%al
3f22   5d7dd2:	7c 08                	jl     5d7ddc <___bpf_prog_run+0x3f2c>
3f24   5d7dd4:	84 d2                	test   %dl,%dl
3f26   5d7dd6:	0f 85 8d 1d 00 00    	jne    5d9b69 <___bpf_prog_run+0x5cb9>
3f2c   5d7ddc:	48 63 43 04          	movslq 0x4(%rbx),%rax
3f30   5d7de0:	48 83 c3 08          	add    $0x8,%rbx
3f34   5d7de4:	48 21 c8             	and    %rcx,%rax
3f37   5d7de7:	49 89 07             	mov    %rax,(%r15)
3f3a   5d7dea:	e9 00 c1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3f3f   5d7def:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3f43   5d7df3:	48 89 f8             	mov    %rdi,%rax
3f46   5d7df6:	48 89 fa             	mov    %rdi,%rdx
3f49   5d7df9:	48 c1 e8 03          	shr    $0x3,%rax
3f4d   5d7dfd:	83 e2 07             	and    $0x7,%edx
3f50   5d7e00:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
3f55   5d7e05:	38 d0                	cmp    %dl,%al
3f57   5d7e07:	7f 08                	jg     5d7e11 <___bpf_prog_run+0x3f61>
3f59   5d7e09:	84 c0                	test   %al,%al
3f5b   5d7e0b:	0f 85 1a 22 00 00    	jne    5da02b <___bpf_prog_run+0x617b>
3f61   5d7e11:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3f65   5d7e15:	83 e0 0f             	and    $0xf,%eax
3f68   5d7e18:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
3f6c   5d7e1c:	4c 89 f8             	mov    %r15,%rax
3f6f   5d7e1f:	48 c1 e8 03          	shr    $0x3,%rax
3f73   5d7e23:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f78   5d7e28:	0f 85 8f 2b 00 00    	jne    5da9bd <___bpf_prog_run+0x6b0d>
3f7e   5d7e2e:	49 8d 7e 58          	lea    0x58(%r14),%rdi
3f82   5d7e32:	45 8b 3f             	mov    (%r15),%r15d
3f85   5d7e35:	48 89 f8             	mov    %rdi,%rax
3f88   5d7e38:	48 c1 e8 03          	shr    $0x3,%rax
3f8c   5d7e3c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f91   5d7e41:	0f 85 ba 2b 00 00    	jne    5daa01 <___bpf_prog_run+0x6b51>
3f97   5d7e47:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
3f9b   5d7e4b:	4d 89 7e 58          	mov    %r15,0x58(%r14)
3f9f   5d7e4f:	48 89 f8             	mov    %rdi,%rax
3fa2   5d7e52:	48 c1 e8 03          	shr    $0x3,%rax
3fa6   5d7e56:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
3fab   5d7e5b:	48 89 f8             	mov    %rdi,%rax
3fae   5d7e5e:	83 e0 07             	and    $0x7,%eax
3fb1   5d7e61:	83 c0 03             	add    $0x3,%eax
3fb4   5d7e64:	38 d0                	cmp    %dl,%al
3fb6   5d7e66:	7c 08                	jl     5d7e70 <___bpf_prog_run+0x3fc0>
3fb8   5d7e68:	84 d2                	test   %dl,%dl
3fba   5d7e6a:	0f 85 81 1d 00 00    	jne    5d9bf1 <___bpf_prog_run+0x5d41>
3fc0   5d7e70:	8b 4b 04             	mov    0x4(%rbx),%ecx
3fc3   5d7e73:	4c 89 f8             	mov    %r15,%rax
3fc6   5d7e76:	31 d2                	xor    %edx,%edx
3fc8   5d7e78:	48 f7 f1             	div    %rcx
3fcb   5d7e7b:	49 89 46 58          	mov    %rax,0x58(%r14)
3fcf   5d7e7f:	49 89 c7             	mov    %rax,%r15
3fd2   5d7e82:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
3fd6   5d7e86:	83 e0 0f             	and    $0xf,%eax
3fd9   5d7e89:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
3fdd   5d7e8d:	48 89 c2             	mov    %rax,%rdx
3fe0   5d7e90:	48 c1 ea 03          	shr    $0x3,%rdx
3fe4   5d7e94:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
3fe9   5d7e99:	0f 85 fe 25 00 00    	jne    5da49d <___bpf_prog_run+0x65ed>
3fef   5d7e9f:	4c 89 38             	mov    %r15,(%rax)
3ff2   5d7ea2:	48 83 c3 08          	add    $0x8,%rbx
3ff6   5d7ea6:	e9 44 c0 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
3ffb   5d7eab:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
3fff   5d7eaf:	48 89 f8             	mov    %rdi,%rax
4002   5d7eb2:	48 89 fa             	mov    %rdi,%rdx
4005   5d7eb5:	48 c1 e8 03          	shr    $0x3,%rax
4009   5d7eb9:	83 e2 07             	and    $0x7,%edx
400c   5d7ebc:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4011   5d7ec1:	38 d0                	cmp    %dl,%al
4013   5d7ec3:	7f 08                	jg     5d7ecd <___bpf_prog_run+0x401d>
4015   5d7ec5:	84 c0                	test   %al,%al
4017   5d7ec7:	0f 85 54 21 00 00    	jne    5da021 <___bpf_prog_run+0x6171>
401d   5d7ecd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4021   5d7ed1:	83 e0 0f             	and    $0xf,%eax
4024   5d7ed4:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4028   5d7ed8:	4c 89 f8             	mov    %r15,%rax
402b   5d7edb:	48 c1 e8 03          	shr    $0x3,%rax
402f   5d7edf:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4034   5d7ee4:	0f 85 f0 27 00 00    	jne    5da6da <___bpf_prog_run+0x682a>
403a   5d7eea:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
403e   5d7eee:	49 8b 0f             	mov    (%r15),%rcx
4041   5d7ef1:	48 89 f8             	mov    %rdi,%rax
4044   5d7ef4:	48 c1 e8 03          	shr    $0x3,%rax
4048   5d7ef8:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
404d   5d7efd:	48 89 f8             	mov    %rdi,%rax
4050   5d7f00:	83 e0 07             	and    $0x7,%eax
4053   5d7f03:	83 c0 03             	add    $0x3,%eax
4056   5d7f06:	38 d0                	cmp    %dl,%al
4058   5d7f08:	7c 08                	jl     5d7f12 <___bpf_prog_run+0x4062>
405a   5d7f0a:	84 d2                	test   %dl,%dl
405c   5d7f0c:	0f 85 a0 1b 00 00    	jne    5d9ab2 <___bpf_prog_run+0x5c02>
4062   5d7f12:	48 63 43 04          	movslq 0x4(%rbx),%rax
4066   5d7f16:	48 83 c3 08          	add    $0x8,%rbx
406a   5d7f1a:	48 01 c8             	add    %rcx,%rax
406d   5d7f1d:	49 89 07             	mov    %rax,(%r15)
4070   5d7f20:	e9 ca bf ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4075   5d7f25:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4079   5d7f29:	48 89 f8             	mov    %rdi,%rax
407c   5d7f2c:	48 89 fa             	mov    %rdi,%rdx
407f   5d7f2f:	48 c1 e8 03          	shr    $0x3,%rax
4083   5d7f33:	83 e2 07             	and    $0x7,%edx
4086   5d7f36:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
408b   5d7f3b:	38 d0                	cmp    %dl,%al
408d   5d7f3d:	7f 08                	jg     5d7f47 <___bpf_prog_run+0x4097>
408f   5d7f3f:	84 c0                	test   %al,%al
4091   5d7f41:	0f 85 d0 20 00 00    	jne    5da017 <___bpf_prog_run+0x6167>
4097   5d7f47:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
409b   5d7f4b:	c0 e8 04             	shr    $0x4,%al
409e   5d7f4e:	0f b6 c0             	movzbl %al,%eax
40a1   5d7f51:	49 8d 14 c6          	lea    (%r14,%rax,8),%rdx
40a5   5d7f55:	48 89 d0             	mov    %rdx,%rax
40a8   5d7f58:	48 c1 e8 03          	shr    $0x3,%rax
40ac   5d7f5c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
40b1   5d7f61:	0f 85 49 2f 00 00    	jne    5daeb0 <___bpf_prog_run+0x7000>
40b7   5d7f67:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
40bb   5d7f6b:	83 e0 0f             	and    $0xf,%eax
40be   5d7f6e:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
40c2   5d7f72:	8b 02                	mov    (%rdx),%eax
40c4   5d7f74:	4c 89 fa             	mov    %r15,%rdx
40c7   5d7f77:	48 c1 ea 03          	shr    $0x3,%rdx
40cb   5d7f7b:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
40d0   5d7f80:	0f 85 15 2f 00 00    	jne    5dae9b <___bpf_prog_run+0x6feb>
40d6   5d7f86:	49 89 07             	mov    %rax,(%r15)
40d9   5d7f89:	48 83 c3 08          	add    $0x8,%rbx
40dd   5d7f8d:	e9 5d bf ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
40e2   5d7f92:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
40e6   5d7f96:	48 89 f8             	mov    %rdi,%rax
40e9   5d7f99:	48 89 fa             	mov    %rdi,%rdx
40ec   5d7f9c:	48 c1 e8 03          	shr    $0x3,%rax
40f0   5d7fa0:	83 e2 07             	and    $0x7,%edx
40f3   5d7fa3:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
40f8   5d7fa8:	38 d0                	cmp    %dl,%al
40fa   5d7faa:	7f 08                	jg     5d7fb4 <___bpf_prog_run+0x4104>
40fc   5d7fac:	84 c0                	test   %al,%al
40fe   5d7fae:	0f 85 59 20 00 00    	jne    5da00d <___bpf_prog_run+0x615d>
4104   5d7fb4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4108   5d7fb8:	83 e0 0f             	and    $0xf,%eax
410b   5d7fbb:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
410f   5d7fbf:	4c 89 f8             	mov    %r15,%rax
4112   5d7fc2:	48 c1 e8 03          	shr    $0x3,%rax
4116   5d7fc6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
411b   5d7fcb:	0f 85 cf 2a 00 00    	jne    5daaa0 <___bpf_prog_run+0x6bf0>
4121   5d7fd1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4125   5d7fd5:	49 8b 17             	mov    (%r15),%rdx
4128   5d7fd8:	c0 e8 04             	shr    $0x4,%al
412b   5d7fdb:	0f b6 c0             	movzbl %al,%eax
412e   5d7fde:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4132   5d7fe2:	48 89 c1             	mov    %rax,%rcx
4135   5d7fe5:	48 c1 e9 03          	shr    $0x3,%rcx
4139   5d7fe9:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
413e   5d7fee:	0f 85 8f 2a 00 00    	jne    5daa83 <___bpf_prog_run+0x6bd3>
4144   5d7ff4:	48 0b 10             	or     (%rax),%rdx
4147   5d7ff7:	48 83 c3 08          	add    $0x8,%rbx
414b   5d7ffb:	49 89 17             	mov    %rdx,(%r15)
414e   5d7ffe:	e9 ec be ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4153   5d8003:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4157   5d8007:	48 89 f8             	mov    %rdi,%rax
415a   5d800a:	48 89 fa             	mov    %rdi,%rdx
415d   5d800d:	48 c1 e8 03          	shr    $0x3,%rax
4161   5d8011:	83 e2 07             	and    $0x7,%edx
4164   5d8014:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4169   5d8019:	38 d0                	cmp    %dl,%al
416b   5d801b:	7f 08                	jg     5d8025 <___bpf_prog_run+0x4175>
416d   5d801d:	84 c0                	test   %al,%al
416f   5d801f:	0f 85 de 1f 00 00    	jne    5da003 <___bpf_prog_run+0x6153>
4175   5d8025:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4179   5d8029:	83 e0 0f             	and    $0xf,%eax
417c   5d802c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4180   5d8030:	4c 89 f8             	mov    %r15,%rax
4183   5d8033:	48 c1 e8 03          	shr    $0x3,%rax
4187   5d8037:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
418c   5d803c:	0f 85 6e 2d 00 00    	jne    5dadb0 <___bpf_prog_run+0x6f00>
4192   5d8042:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
4196   5d8046:	4d 8b 3f             	mov    (%r15),%r15
4199   5d8049:	48 89 f8             	mov    %rdi,%rax
419c   5d804c:	48 c1 e8 03          	shr    $0x3,%rax
41a0   5d8050:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
41a5   5d8055:	48 89 f8             	mov    %rdi,%rax
41a8   5d8058:	83 e0 07             	and    $0x7,%eax
41ab   5d805b:	83 c0 03             	add    $0x3,%eax
41ae   5d805e:	38 d0                	cmp    %dl,%al
41b0   5d8060:	7c 08                	jl     5d806a <___bpf_prog_run+0x41ba>
41b2   5d8062:	84 d2                	test   %dl,%dl
41b4   5d8064:	0f 85 9b 1b 00 00    	jne    5d9c05 <___bpf_prog_run+0x5d55>
41ba   5d806a:	48 63 43 04          	movslq 0x4(%rbx),%rax
41be   5d806e:	49 39 c7             	cmp    %rax,%r15
41c1   5d8071:	0f 84 ae 0c 00 00    	je     5d8d25 <___bpf_prog_run+0x4e75>
41c7   5d8077:	48 83 c3 08          	add    $0x8,%rbx
41cb   5d807b:	e9 6f be ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
41d0   5d8080:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
41d4   5d8084:	48 89 f8             	mov    %rdi,%rax
41d7   5d8087:	48 89 fa             	mov    %rdi,%rdx
41da   5d808a:	48 c1 e8 03          	shr    $0x3,%rax
41de   5d808e:	83 e2 07             	and    $0x7,%edx
41e1   5d8091:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
41e6   5d8096:	38 d0                	cmp    %dl,%al
41e8   5d8098:	7f 08                	jg     5d80a2 <___bpf_prog_run+0x41f2>
41ea   5d809a:	84 c0                	test   %al,%al
41ec   5d809c:	0f 85 57 1f 00 00    	jne    5d9ff9 <___bpf_prog_run+0x6149>
41f2   5d80a2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
41f6   5d80a6:	83 e0 0f             	and    $0xf,%eax
41f9   5d80a9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
41fd   5d80ad:	4c 89 f8             	mov    %r15,%rax
4200   5d80b0:	48 c1 e8 03          	shr    $0x3,%rax
4204   5d80b4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4209   5d80b9:	0f 85 14 2b 00 00    	jne    5dabd3 <___bpf_prog_run+0x6d23>
420f   5d80bf:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4213   5d80c3:	49 8b 17             	mov    (%r15),%rdx
4216   5d80c6:	c0 e8 04             	shr    $0x4,%al
4219   5d80c9:	0f b6 c0             	movzbl %al,%eax
421c   5d80cc:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4220   5d80d0:	48 89 c1             	mov    %rax,%rcx
4223   5d80d3:	48 c1 e9 03          	shr    $0x3,%rcx
4227   5d80d7:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
422c   5d80dc:	0f 85 d4 2a 00 00    	jne    5dabb6 <___bpf_prog_run+0x6d06>
4232   5d80e2:	48 2b 10             	sub    (%rax),%rdx
4235   5d80e5:	48 83 c3 08          	add    $0x8,%rbx
4239   5d80e9:	49 89 17             	mov    %rdx,(%r15)
423c   5d80ec:	e9 fe bd ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4241   5d80f1:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4245   5d80f5:	48 89 f8             	mov    %rdi,%rax
4248   5d80f8:	48 89 fa             	mov    %rdi,%rdx
424b   5d80fb:	48 c1 e8 03          	shr    $0x3,%rax
424f   5d80ff:	83 e2 07             	and    $0x7,%edx
4252   5d8102:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4257   5d8107:	38 d0                	cmp    %dl,%al
4259   5d8109:	7f 08                	jg     5d8113 <___bpf_prog_run+0x4263>
425b   5d810b:	84 c0                	test   %al,%al
425d   5d810d:	0f 85 dc 1e 00 00    	jne    5d9fef <___bpf_prog_run+0x613f>
4263   5d8113:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4267   5d8117:	83 e0 0f             	and    $0xf,%eax
426a   5d811a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
426e   5d811e:	4c 89 f8             	mov    %r15,%rax
4271   5d8121:	48 c1 e8 03          	shr    $0x3,%rax
4275   5d8125:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
427a   5d812a:	0f 85 eb 2c 00 00    	jne    5dae1b <___bpf_prog_run+0x6f6b>
4280   5d8130:	49 8d 7e 58          	lea    0x58(%r14),%rdi
4284   5d8134:	41 8b 07             	mov    (%r15),%eax
4287   5d8137:	48 89 fa             	mov    %rdi,%rdx
428a   5d813a:	48 c1 ea 03          	shr    $0x3,%rdx
428e   5d813e:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4293   5d8143:	0f 85 c0 2c 00 00    	jne    5dae09 <___bpf_prog_run+0x6f59>
4299   5d8149:	49 89 46 58          	mov    %rax,0x58(%r14)
429d   5d814d:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
42a1   5d8151:	c0 ea 04             	shr    $0x4,%dl
42a4   5d8154:	0f b6 d2             	movzbl %dl,%edx
42a7   5d8157:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
42ab   5d815b:	4c 89 fa             	mov    %r15,%rdx
42ae   5d815e:	48 c1 ea 03          	shr    $0x3,%rdx
42b2   5d8162:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
42b7   5d8167:	0f 85 87 2c 00 00    	jne    5dadf4 <___bpf_prog_run+0x6f44>
42bd   5d816d:	41 8b 0f             	mov    (%r15),%ecx
42c0   5d8170:	31 d2                	xor    %edx,%edx
42c2   5d8172:	48 f7 f1             	div    %rcx
42c5   5d8175:	49 89 46 58          	mov    %rax,0x58(%r14)
42c9   5d8179:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
42cd   5d817d:	83 e0 0f             	and    $0xf,%eax
42d0   5d8180:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
42d4   5d8184:	4c 89 f8             	mov    %r15,%rax
42d7   5d8187:	48 c1 e8 03          	shr    $0x3,%rax
42db   5d818b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
42e0   5d8190:	0f 85 0b 27 00 00    	jne    5da8a1 <___bpf_prog_run+0x69f1>
42e6   5d8196:	49 89 17             	mov    %rdx,(%r15)
42e9   5d8199:	48 83 c3 08          	add    $0x8,%rbx
42ed   5d819d:	e9 4d bd ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
42f2   5d81a2:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
42f6   5d81a6:	48 89 f8             	mov    %rdi,%rax
42f9   5d81a9:	48 89 fa             	mov    %rdi,%rdx
42fc   5d81ac:	48 c1 e8 03          	shr    $0x3,%rax
4300   5d81b0:	83 e2 07             	and    $0x7,%edx
4303   5d81b3:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4308   5d81b8:	38 d0                	cmp    %dl,%al
430a   5d81ba:	7f 08                	jg     5d81c4 <___bpf_prog_run+0x4314>
430c   5d81bc:	84 c0                	test   %al,%al
430e   5d81be:	0f 85 21 1e 00 00    	jne    5d9fe5 <___bpf_prog_run+0x6135>
4314   5d81c4:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4318   5d81c8:	83 e0 0f             	and    $0xf,%eax
431b   5d81cb:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
431f   5d81cf:	4c 89 f8             	mov    %r15,%rax
4322   5d81d2:	48 c1 e8 03          	shr    $0x3,%rax
4326   5d81d6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
432b   5d81db:	0f 85 c2 2b 00 00    	jne    5dada3 <___bpf_prog_run+0x6ef3>
4331   5d81e1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4335   5d81e5:	49 8b 17             	mov    (%r15),%rdx
4338   5d81e8:	c0 e8 04             	shr    $0x4,%al
433b   5d81eb:	0f b6 c0             	movzbl %al,%eax
433e   5d81ee:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4342   5d81f2:	48 89 c1             	mov    %rax,%rcx
4345   5d81f5:	48 c1 e9 03          	shr    $0x3,%rcx
4349   5d81f9:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
434e   5d81fe:	0f 85 82 2b 00 00    	jne    5dad86 <___bpf_prog_run+0x6ed6>
4354   5d8204:	48 23 10             	and    (%rax),%rdx
4357   5d8207:	48 83 c3 08          	add    $0x8,%rbx
435b   5d820b:	49 89 17             	mov    %rdx,(%r15)
435e   5d820e:	e9 dc bc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4363   5d8213:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
4367   5d8217:	48 89 f8             	mov    %rdi,%rax
436a   5d821a:	48 c1 e8 03          	shr    $0x3,%rax
436e   5d821e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4373   5d8223:	48 89 f8             	mov    %rdi,%rax
4376   5d8226:	83 e0 07             	and    $0x7,%eax
4379   5d8229:	83 c0 03             	add    $0x3,%eax
437c   5d822c:	38 d0                	cmp    %dl,%al
437e   5d822e:	7c 08                	jl     5d8238 <___bpf_prog_run+0x4388>
4380   5d8230:	84 d2                	test   %dl,%dl
4382   5d8232:	0f 85 a3 1d 00 00    	jne    5d9fdb <___bpf_prog_run+0x612b>
4388   5d8238:	8b 43 04             	mov    0x4(%rbx),%eax
438b   5d823b:	83 f8 10             	cmp    $0x10,%eax
438e   5d823e:	0f 84 43 0a 00 00    	je     5d8c87 <___bpf_prog_run+0x4dd7>
4394   5d8244:	83 f8 20             	cmp    $0x20,%eax
4397   5d8247:	0f 84 e1 09 00 00    	je     5d8c2e <___bpf_prog_run+0x4d7e>
439d   5d824d:	48 83 c3 08          	add    $0x8,%rbx
43a1   5d8251:	e9 99 bc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
43a6   5d8256:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
43aa   5d825a:	48 89 f8             	mov    %rdi,%rax
43ad   5d825d:	48 89 fa             	mov    %rdi,%rdx
43b0   5d8260:	48 c1 e8 03          	shr    $0x3,%rax
43b4   5d8264:	83 e2 07             	and    $0x7,%edx
43b7   5d8267:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
43bc   5d826c:	38 d0                	cmp    %dl,%al
43be   5d826e:	7f 08                	jg     5d8278 <___bpf_prog_run+0x43c8>
43c0   5d8270:	84 c0                	test   %al,%al
43c2   5d8272:	0f 85 59 1d 00 00    	jne    5d9fd1 <___bpf_prog_run+0x6121>
43c8   5d8278:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
43cc   5d827c:	83 e0 0f             	and    $0xf,%eax
43cf   5d827f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
43d3   5d8283:	4c 89 f8             	mov    %r15,%rax
43d6   5d8286:	48 c1 e8 03          	shr    $0x3,%rax
43da   5d828a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
43df   5d828f:	0f 85 6f 24 00 00    	jne    5da704 <___bpf_prog_run+0x6854>
43e5   5d8295:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
43e9   5d8299:	49 8b 17             	mov    (%r15),%rdx
43ec   5d829c:	c0 e8 04             	shr    $0x4,%al
43ef   5d829f:	0f b6 c0             	movzbl %al,%eax
43f2   5d82a2:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
43f6   5d82a6:	48 89 c1             	mov    %rax,%rcx
43f9   5d82a9:	48 c1 e9 03          	shr    $0x3,%rcx
43fd   5d82ad:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
4402   5d82b2:	0f 85 2f 24 00 00    	jne    5da6e7 <___bpf_prog_run+0x6837>
4408   5d82b8:	48 03 10             	add    (%rax),%rdx
440b   5d82bb:	48 83 c3 08          	add    $0x8,%rbx
440f   5d82bf:	49 89 17             	mov    %rdx,(%r15)
4412   5d82c2:	e9 28 bc ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4417   5d82c7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
441b   5d82cb:	48 89 f8             	mov    %rdi,%rax
441e   5d82ce:	48 89 fa             	mov    %rdi,%rdx
4421   5d82d1:	48 c1 e8 03          	shr    $0x3,%rax
4425   5d82d5:	83 e2 07             	and    $0x7,%edx
4428   5d82d8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
442d   5d82dd:	38 d0                	cmp    %dl,%al
442f   5d82df:	7f 08                	jg     5d82e9 <___bpf_prog_run+0x4439>
4431   5d82e1:	84 c0                	test   %al,%al
4433   5d82e3:	0f 85 de 1c 00 00    	jne    5d9fc7 <___bpf_prog_run+0x6117>
4439   5d82e9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
443d   5d82ed:	89 c2                	mov    %eax,%edx
443f   5d82ef:	83 e0 0f             	and    $0xf,%eax
4442   5d82f2:	c0 ea 04             	shr    $0x4,%dl
4445   5d82f5:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4449   5d82f9:	0f b6 d2             	movzbl %dl,%edx
444c   5d82fc:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
4450   5d8300:	48 89 d0             	mov    %rdx,%rax
4453   5d8303:	48 c1 e8 03          	shr    $0x3,%rax
4457   5d8307:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
445c   5d830c:	0f 85 f1 29 00 00    	jne    5dad03 <___bpf_prog_run+0x6e53>
4462   5d8312:	48 8b 02             	mov    (%rdx),%rax
4465   5d8315:	4c 89 fa             	mov    %r15,%rdx
4468   5d8318:	48 c1 ea 03          	shr    $0x3,%rdx
446c   5d831c:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4471   5d8321:	0f 85 c7 29 00 00    	jne    5dacee <___bpf_prog_run+0x6e3e>
4477   5d8327:	49 89 07             	mov    %rax,(%r15)
447a   5d832a:	48 83 c3 08          	add    $0x8,%rbx
447e   5d832e:	e9 bc bb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4483   5d8333:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4487   5d8337:	48 89 f8             	mov    %rdi,%rax
448a   5d833a:	48 c1 e8 03          	shr    $0x3,%rax
448e   5d833e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4493   5d8343:	48 89 f8             	mov    %rdi,%rax
4496   5d8346:	83 e0 07             	and    $0x7,%eax
4499   5d8349:	83 c0 01             	add    $0x1,%eax
449c   5d834c:	38 d0                	cmp    %dl,%al
449e   5d834e:	7c 08                	jl     5d8358 <___bpf_prog_run+0x44a8>
44a0   5d8350:	84 d2                	test   %dl,%dl
44a2   5d8352:	0f 85 65 1c 00 00    	jne    5d9fbd <___bpf_prog_run+0x610d>
44a8   5d8358:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
44ad   5d835d:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
44b2   5d8362:	e9 88 bb ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
44b7   5d8367:	4c 8d 43 01          	lea    0x1(%rbx),%r8
44bb   5d836b:	4c 89 c0             	mov    %r8,%rax
44be   5d836e:	4c 89 c2             	mov    %r8,%rdx
44c1   5d8371:	48 c1 e8 03          	shr    $0x3,%rax
44c5   5d8375:	83 e2 07             	and    $0x7,%edx
44c8   5d8378:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
44cd   5d837d:	38 d0                	cmp    %dl,%al
44cf   5d837f:	7f 08                	jg     5d8389 <___bpf_prog_run+0x44d9>
44d1   5d8381:	84 c0                	test   %al,%al
44d3   5d8383:	0f 85 1f 1c 00 00    	jne    5d9fa8 <___bpf_prog_run+0x60f8>
44d9   5d8389:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
44dd   5d838d:	83 e0 0f             	and    $0xf,%eax
44e0   5d8390:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
44e4   5d8394:	4c 89 f8             	mov    %r15,%rax
44e7   5d8397:	48 c1 e8 03          	shr    $0x3,%rax
44eb   5d839b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
44f0   5d83a0:	0f 85 04 29 00 00    	jne    5dacaa <___bpf_prog_run+0x6dfa>
44f6   5d83a6:	4c 8d 4b 04          	lea    0x4(%rbx),%r9
44fa   5d83aa:	49 8b 07             	mov    (%r15),%rax
44fd   5d83ad:	4c 89 ca             	mov    %r9,%rdx
4500   5d83b0:	48 c1 ea 03          	shr    $0x3,%rdx
4504   5d83b4:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
4509   5d83b9:	4c 89 ca             	mov    %r9,%rdx
450c   5d83bc:	83 e2 07             	and    $0x7,%edx
450f   5d83bf:	83 c2 03             	add    $0x3,%edx
4512   5d83c2:	38 ca                	cmp    %cl,%dl
4514   5d83c4:	7c 08                	jl     5d83ce <___bpf_prog_run+0x451e>
4516   5d83c6:	84 c9                	test   %cl,%cl
4518   5d83c8:	0f 85 76 17 00 00    	jne    5d9b44 <___bpf_prog_run+0x5c94>
451e   5d83ce:	8b 4b 04             	mov    0x4(%rbx),%ecx
4521   5d83d1:	83 f9 1f             	cmp    $0x1f,%ecx
4524   5d83d4:	0f 87 00 00 00 00    	ja     5d83da <___bpf_prog_run+0x452a>	5d83d6: R_X86_64_PC32	.text.unlikely+0x6e4f
452a   5d83da:	4c 89 fa             	mov    %r15,%rdx
452d   5d83dd:	d3 f8                	sar    %cl,%eax
452f   5d83df:	48 c1 ea 03          	shr    $0x3,%rdx
4533   5d83e3:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4538   5d83e8:	0f 85 d1 28 00 00    	jne    5dacbf <___bpf_prog_run+0x6e0f>
453e   5d83ee:	49 89 07             	mov    %rax,(%r15)
4541   5d83f1:	48 83 c3 08          	add    $0x8,%rbx
4545   5d83f5:	e9 f5 ba ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
454a   5d83fa:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
454e   5d83fe:	48 89 f8             	mov    %rdi,%rax
4551   5d8401:	48 89 fa             	mov    %rdi,%rdx
4554   5d8404:	48 c1 e8 03          	shr    $0x3,%rax
4558   5d8408:	83 e2 07             	and    $0x7,%edx
455b   5d840b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4560   5d8410:	38 d0                	cmp    %dl,%al
4562   5d8412:	7f 08                	jg     5d841c <___bpf_prog_run+0x456c>
4564   5d8414:	84 c0                	test   %al,%al
4566   5d8416:	0f 85 82 1b 00 00    	jne    5d9f9e <___bpf_prog_run+0x60ee>
456c   5d841c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4570   5d8420:	83 e0 0f             	and    $0xf,%eax
4573   5d8423:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4577   5d8427:	4c 89 f8             	mov    %r15,%rax
457a   5d842a:	48 c1 e8 03          	shr    $0x3,%rax
457e   5d842e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4583   5d8433:	0f 85 0f 22 00 00    	jne    5da648 <___bpf_prog_run+0x6798>
4589   5d8439:	49 8d 7e 58          	lea    0x58(%r14),%rdi
458d   5d843d:	45 8b 3f             	mov    (%r15),%r15d
4590   5d8440:	48 89 f8             	mov    %rdi,%rax
4593   5d8443:	48 c1 e8 03          	shr    $0x3,%rax
4597   5d8447:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
459c   5d844c:	0f 85 ec 21 00 00    	jne    5da63e <___bpf_prog_run+0x678e>
45a2   5d8452:	4d 89 7e 58          	mov    %r15,0x58(%r14)
45a6   5d8456:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
45aa   5d845a:	c0 e8 04             	shr    $0x4,%al
45ad   5d845d:	0f b6 c0             	movzbl %al,%eax
45b0   5d8460:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
45b4   5d8464:	48 89 c2             	mov    %rax,%rdx
45b7   5d8467:	48 c1 ea 03          	shr    $0x3,%rdx
45bb   5d846b:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
45c0   5d8470:	0f 85 b3 21 00 00    	jne    5da629 <___bpf_prog_run+0x6779>
45c6   5d8476:	8b 08                	mov    (%rax),%ecx
45c8   5d8478:	31 d2                	xor    %edx,%edx
45ca   5d847a:	4c 89 f8             	mov    %r15,%rax
45cd   5d847d:	48 f7 f1             	div    %rcx
45d0   5d8480:	49 89 46 58          	mov    %rax,0x58(%r14)
45d4   5d8484:	49 89 c7             	mov    %rax,%r15
45d7   5d8487:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
45db   5d848b:	83 e0 0f             	and    $0xf,%eax
45de   5d848e:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
45e2   5d8492:	48 89 c2             	mov    %rax,%rdx
45e5   5d8495:	48 c1 ea 03          	shr    $0x3,%rdx
45e9   5d8499:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
45ee   5d849e:	0f 85 70 21 00 00    	jne    5da614 <___bpf_prog_run+0x6764>
45f4   5d84a4:	4c 89 38             	mov    %r15,(%rax)
45f7   5d84a7:	48 83 c3 08          	add    $0x8,%rbx
45fb   5d84ab:	e9 3f ba ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4600   5d84b0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4604   5d84b4:	48 89 f8             	mov    %rdi,%rax
4607   5d84b7:	48 89 fa             	mov    %rdi,%rdx
460a   5d84ba:	48 c1 e8 03          	shr    $0x3,%rax
460e   5d84be:	83 e2 07             	and    $0x7,%edx
4611   5d84c1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4616   5d84c6:	38 d0                	cmp    %dl,%al
4618   5d84c8:	7f 08                	jg     5d84d2 <___bpf_prog_run+0x4622>
461a   5d84ca:	84 c0                	test   %al,%al
461c   5d84cc:	0f 85 c2 1a 00 00    	jne    5d9f94 <___bpf_prog_run+0x60e4>
4622   5d84d2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4626   5d84d6:	83 e0 0f             	and    $0xf,%eax
4629   5d84d9:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
462d   5d84dd:	4c 89 f8             	mov    %r15,%rax
4630   5d84e0:	48 c1 e8 03          	shr    $0x3,%rax
4634   5d84e4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4639   5d84e9:	0f 85 5b 2e 00 00    	jne    5db34a <___bpf_prog_run+0x749a>
463f   5d84ef:	41 8b 07             	mov    (%r15),%eax
4642   5d84f2:	48 83 c3 08          	add    $0x8,%rbx
4646   5d84f6:	f7 d8                	neg    %eax
4648   5d84f8:	49 89 07             	mov    %rax,(%r15)
464b   5d84fb:	e9 ef b9 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4650   5d8500:	83 fa 50             	cmp    $0x50,%edx
4653   5d8503:	0f 85 ae 09 00 00    	jne    5d8eb7 <___bpf_prog_run+0x5007>
4659   5d8509:	83 e0 18             	and    $0x18,%eax
465c   5d850c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4660   5d8510:	88 45 b8             	mov    %al,-0x48(%rbp)
4663   5d8513:	48 89 f8             	mov    %rdi,%rax
4666   5d8516:	48 89 fa             	mov    %rdi,%rdx
4669   5d8519:	48 c1 e8 03          	shr    $0x3,%rax
466d   5d851d:	83 e2 07             	and    $0x7,%edx
4670   5d8520:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4675   5d8525:	38 d0                	cmp    %dl,%al
4677   5d8527:	7f 08                	jg     5d8531 <___bpf_prog_run+0x4681>
4679   5d8529:	84 c0                	test   %al,%al
467b   5d852b:	0f 85 db 10 00 00    	jne    5d960c <___bpf_prog_run+0x575c>
4681   5d8531:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4685   5d8535:	c0 e8 04             	shr    $0x4,%al
4688   5d8538:	0f b6 c0             	movzbl %al,%eax
468b   5d853b:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
468f   5d853f:	4c 89 f8             	mov    %r15,%rax
4692   5d8542:	48 c1 e8 03          	shr    $0x3,%rax
4696   5d8546:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
469b   5d854b:	0f 85 a6 12 00 00    	jne    5d97f7 <___bpf_prog_run+0x5947>
46a1   5d8551:	49 8b 07             	mov    (%r15),%rax
46a4   5d8554:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
46a8   5d8558:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
46ac   5d855c:	83 e0 0f             	and    $0xf,%eax
46af   5d855f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
46b3   5d8563:	4c 89 fa             	mov    %r15,%rdx
46b6   5d8566:	48 c1 ea 03          	shr    $0x3,%rdx
46ba   5d856a:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
46bf   5d856f:	0f 85 75 12 00 00    	jne    5d97ea <___bpf_prog_run+0x593a>
46c5   5d8575:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
46c9   5d8579:	4d 8b 3f             	mov    (%r15),%r15
46cc   5d857c:	48 89 f8             	mov    %rdi,%rax
46cf   5d857f:	48 c1 e8 03          	shr    $0x3,%rax
46d3   5d8583:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
46d8   5d8588:	48 89 f8             	mov    %rdi,%rax
46db   5d858b:	83 e0 07             	and    $0x7,%eax
46de   5d858e:	83 c0 01             	add    $0x1,%eax
46e1   5d8591:	38 d0                	cmp    %dl,%al
46e3   5d8593:	7c 08                	jl     5d859d <___bpf_prog_run+0x46ed>
46e5   5d8595:	84 d2                	test   %dl,%dl
46e7   5d8597:	0f 85 8b 12 00 00    	jne    5d9828 <___bpf_prog_run+0x5978>
46ed   5d859d:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
46f2   5d85a2:	49 01 d7             	add    %rdx,%r15
46f5   5d85a5:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
46f9   5d85a9:	0f 85 7b 0f 00 00    	jne    5d952a <___bpf_prog_run+0x567a>
46ff   5d85af:	be 04 00 00 00       	mov    $0x4,%esi
4704   5d85b4:	4c 89 ff             	mov    %r15,%rdi
4707   5d85b7:	e8 00 00 00 00       	call   5d85bc <___bpf_prog_run+0x470c>	5d85b8: R_X86_64_PLT32	__kasan_check_write-0x4
470c   5d85bc:	8b 45 c0             	mov    -0x40(%rbp),%eax
470f   5d85bf:	f0 41 21 07          	lock and %eax,(%r15)
4713   5d85c3:	e9 d4 01 00 00       	jmp    5d879c <___bpf_prog_run+0x48ec>
4718   5d85c8:	85 d2                	test   %edx,%edx
471a   5d85ca:	0f 85 d5 01 00 00    	jne    5d87a5 <___bpf_prog_run+0x48f5>
4720   5d85d0:	83 e0 18             	and    $0x18,%eax
4723   5d85d3:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4727   5d85d7:	88 45 b8             	mov    %al,-0x48(%rbp)
472a   5d85da:	48 89 f8             	mov    %rdi,%rax
472d   5d85dd:	48 89 fa             	mov    %rdi,%rdx
4730   5d85e0:	48 c1 e8 03          	shr    $0x3,%rax
4734   5d85e4:	83 e2 07             	and    $0x7,%edx
4737   5d85e7:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
473c   5d85ec:	38 d0                	cmp    %dl,%al
473e   5d85ee:	7f 08                	jg     5d85f8 <___bpf_prog_run+0x4748>
4740   5d85f0:	84 c0                	test   %al,%al
4742   5d85f2:	0f 85 66 11 00 00    	jne    5d975e <___bpf_prog_run+0x58ae>
4748   5d85f8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
474c   5d85fc:	c0 e8 04             	shr    $0x4,%al
474f   5d85ff:	0f b6 c0             	movzbl %al,%eax
4752   5d8602:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4756   5d8606:	4c 89 f8             	mov    %r15,%rax
4759   5d8609:	48 c1 e8 03          	shr    $0x3,%rax
475d   5d860d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4762   5d8612:	0f 85 03 12 00 00    	jne    5d981b <___bpf_prog_run+0x596b>
4768   5d8618:	49 8b 07             	mov    (%r15),%rax
476b   5d861b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
476f   5d861f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4773   5d8623:	83 e0 0f             	and    $0xf,%eax
4776   5d8626:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
477a   5d862a:	4c 89 fa             	mov    %r15,%rdx
477d   5d862d:	48 c1 ea 03          	shr    $0x3,%rdx
4781   5d8631:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4786   5d8636:	0f 85 d2 11 00 00    	jne    5d980e <___bpf_prog_run+0x595e>
478c   5d863c:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4790   5d8640:	4d 8b 3f             	mov    (%r15),%r15
4793   5d8643:	48 89 f8             	mov    %rdi,%rax
4796   5d8646:	48 c1 e8 03          	shr    $0x3,%rax
479a   5d864a:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
479f   5d864f:	48 89 f8             	mov    %rdi,%rax
47a2   5d8652:	83 e0 07             	and    $0x7,%eax
47a5   5d8655:	83 c0 01             	add    $0x1,%eax
47a8   5d8658:	38 d0                	cmp    %dl,%al
47aa   5d865a:	7c 08                	jl     5d8664 <___bpf_prog_run+0x47b4>
47ac   5d865c:	84 d2                	test   %dl,%dl
47ae   5d865e:	0f 85 a0 11 00 00    	jne    5d9804 <___bpf_prog_run+0x5954>
47b4   5d8664:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
47b9   5d8669:	49 01 d7             	add    %rdx,%r15
47bc   5d866c:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
47c0   5d8670:	0f 85 ce 0e 00 00    	jne    5d9544 <___bpf_prog_run+0x5694>
47c6   5d8676:	be 04 00 00 00       	mov    $0x4,%esi
47cb   5d867b:	4c 89 ff             	mov    %r15,%rdi
47ce   5d867e:	e8 00 00 00 00       	call   5d8683 <___bpf_prog_run+0x47d3>	5d867f: R_X86_64_PLT32	__kasan_check_write-0x4
47d3   5d8683:	8b 45 c0             	mov    -0x40(%rbp),%eax
47d6   5d8686:	f0 41 01 07          	lock add %eax,(%r15)
47da   5d868a:	e9 0d 01 00 00       	jmp    5d879c <___bpf_prog_run+0x48ec>
47df   5d868f:	81 fa e1 00 00 00    	cmp    $0xe1,%edx
47e5   5d8695:	0f 84 60 08 00 00    	je     5d8efb <___bpf_prog_run+0x504b>
47eb   5d869b:	0f 8e 27 02 00 00    	jle    5d88c8 <___bpf_prog_run+0x4a18>
47f1   5d86a1:	81 fa f1 00 00 00    	cmp    $0xf1,%edx
47f7   5d86a7:	0f 85 0a 08 00 00    	jne    5d8eb7 <___bpf_prog_run+0x5007>
47fd   5d86ad:	83 e0 18             	and    $0x18,%eax
4800   5d86b0:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4804   5d86b4:	88 45 b0             	mov    %al,-0x50(%rbp)
4807   5d86b7:	48 89 f8             	mov    %rdi,%rax
480a   5d86ba:	48 89 fa             	mov    %rdi,%rdx
480d   5d86bd:	48 c1 e8 03          	shr    $0x3,%rax
4811   5d86c1:	83 e2 07             	and    $0x7,%edx
4814   5d86c4:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4819   5d86c9:	38 d0                	cmp    %dl,%al
481b   5d86cb:	7f 08                	jg     5d86d5 <___bpf_prog_run+0x4825>
481d   5d86cd:	84 c0                	test   %al,%al
481f   5d86cf:	0f 85 41 0f 00 00    	jne    5d9616 <___bpf_prog_run+0x5766>
4825   5d86d5:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4829   5d86d9:	c0 e8 04             	shr    $0x4,%al
482c   5d86dc:	0f b6 c0             	movzbl %al,%eax
482f   5d86df:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4833   5d86e3:	4c 89 f8             	mov    %r15,%rax
4836   5d86e6:	48 c1 e8 03          	shr    $0x3,%rax
483a   5d86ea:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
483f   5d86ef:	0f 85 13 10 00 00    	jne    5d9708 <___bpf_prog_run+0x5858>
4845   5d86f5:	49 8b 07             	mov    (%r15),%rax
4848   5d86f8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
484c   5d86fc:	4c 89 f0             	mov    %r14,%rax
484f   5d86ff:	48 c1 e8 03          	shr    $0x3,%rax
4853   5d8703:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4858   5d8708:	0f 85 ed 0f 00 00    	jne    5d96fb <___bpf_prog_run+0x584b>
485e   5d870e:	49 8b 06             	mov    (%r14),%rax
4861   5d8711:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
4865   5d8715:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4869   5d8719:	83 e0 0f             	and    $0xf,%eax
486c   5d871c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4870   5d8720:	4c 89 fa             	mov    %r15,%rdx
4873   5d8723:	48 c1 ea 03          	shr    $0x3,%rdx
4877   5d8727:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
487c   5d872c:	0f 85 bc 0f 00 00    	jne    5d96ee <___bpf_prog_run+0x583e>
4882   5d8732:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4886   5d8736:	4d 8b 3f             	mov    (%r15),%r15
4889   5d8739:	48 89 f8             	mov    %rdi,%rax
488c   5d873c:	48 c1 e8 03          	shr    $0x3,%rax
4890   5d8740:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4895   5d8745:	48 89 f8             	mov    %rdi,%rax
4898   5d8748:	83 e0 07             	and    $0x7,%eax
489b   5d874b:	83 c0 01             	add    $0x1,%eax
489e   5d874e:	38 d0                	cmp    %dl,%al
48a0   5d8750:	7c 08                	jl     5d875a <___bpf_prog_run+0x48aa>
48a2   5d8752:	84 d2                	test   %dl,%dl
48a4   5d8754:	0f 85 8a 0f 00 00    	jne    5d96e4 <___bpf_prog_run+0x5834>
48aa   5d875a:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
48af   5d875f:	49 01 d7             	add    %rdx,%r15
48b2   5d8762:	80 7d b0 00          	cmpb   $0x0,-0x50(%rbp)
48b6   5d8766:	0f 85 70 0d 00 00    	jne    5d94dc <___bpf_prog_run+0x562c>
48bc   5d876c:	be 04 00 00 00       	mov    $0x4,%esi
48c1   5d8771:	4c 89 ff             	mov    %r15,%rdi
48c4   5d8774:	e8 00 00 00 00       	call   5d8779 <___bpf_prog_run+0x48c9>	5d8775: R_X86_64_PLT32	__kasan_check_write-0x4
48c9   5d8779:	8b 45 b8             	mov    -0x48(%rbp),%eax
48cc   5d877c:	8b 75 c0             	mov    -0x40(%rbp),%esi
48cf   5d877f:	f0 41 0f b1 37       	lock cmpxchg %esi,(%r15)
48d4   5d8784:	41 89 c7             	mov    %eax,%r15d
48d7   5d8787:	4c 89 f0             	mov    %r14,%rax
48da   5d878a:	48 c1 e8 03          	shr    $0x3,%rax
48de   5d878e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
48e3   5d8793:	0f 85 3e 0f 00 00    	jne    5d96d7 <___bpf_prog_run+0x5827>
48e9   5d8799:	4d 89 3e             	mov    %r15,(%r14)
48ec   5d879c:	48 83 c3 08          	add    $0x8,%rbx
48f0   5d87a0:	e9 4a b7 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
48f5   5d87a5:	83 fa 01             	cmp    $0x1,%edx
48f8   5d87a8:	0f 85 09 07 00 00    	jne    5d8eb7 <___bpf_prog_run+0x5007>
48fe   5d87ae:	83 e0 18             	and    $0x18,%eax
4901   5d87b1:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
4905   5d87b5:	88 45 b8             	mov    %al,-0x48(%rbp)
4908   5d87b8:	4c 89 f8             	mov    %r15,%rax
490b   5d87bb:	4c 89 fa             	mov    %r15,%rdx
490e   5d87be:	48 c1 e8 03          	shr    $0x3,%rax
4912   5d87c2:	83 e2 07             	and    $0x7,%edx
4915   5d87c5:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
491a   5d87ca:	38 d0                	cmp    %dl,%al
491c   5d87cc:	7f 08                	jg     5d87d6 <___bpf_prog_run+0x4926>
491e   5d87ce:	84 c0                	test   %al,%al
4920   5d87d0:	0f 85 fd 0f 00 00    	jne    5d97d3 <___bpf_prog_run+0x5923>
4926   5d87d6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
492a   5d87da:	c0 e8 04             	shr    $0x4,%al
492d   5d87dd:	0f b6 c0             	movzbl %al,%eax
4930   5d87e0:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4934   5d87e4:	48 89 c2             	mov    %rax,%rdx
4937   5d87e7:	48 c1 ea 03          	shr    $0x3,%rdx
493b   5d87eb:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4940   5d87f0:	0f 85 cc 0e 00 00    	jne    5d96c2 <___bpf_prog_run+0x5812>
4946   5d87f6:	48 8b 00             	mov    (%rax),%rax
4949   5d87f9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
494d   5d87fd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4951   5d8801:	83 e0 0f             	and    $0xf,%eax
4954   5d8804:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4958   5d8808:	48 89 c2             	mov    %rax,%rdx
495b   5d880b:	48 c1 ea 03          	shr    $0x3,%rdx
495f   5d880f:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4964   5d8814:	0f 85 93 0e 00 00    	jne    5d96ad <___bpf_prog_run+0x57fd>
496a   5d881a:	48 8b 00             	mov    (%rax),%rax
496d   5d881d:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4971   5d8821:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
4975   5d8825:	48 89 f8             	mov    %rdi,%rax
4978   5d8828:	48 c1 e8 03          	shr    $0x3,%rax
497c   5d882c:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4981   5d8831:	48 89 f8             	mov    %rdi,%rax
4984   5d8834:	83 e0 07             	and    $0x7,%eax
4987   5d8837:	83 c0 01             	add    $0x1,%eax
498a   5d883a:	38 d0                	cmp    %dl,%al
498c   5d883c:	7c 08                	jl     5d8846 <___bpf_prog_run+0x4996>
498e   5d883e:	84 d2                	test   %dl,%dl
4990   5d8840:	0f 85 5d 0e 00 00    	jne    5d96a3 <___bpf_prog_run+0x57f3>
4996   5d8846:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
499b   5d884b:	48 03 55 b0          	add    -0x50(%rbp),%rdx
499f   5d884f:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
49a3   5d8853:	0f 85 06 0c 00 00    	jne    5d945f <___bpf_prog_run+0x55af>
49a9   5d8859:	48 89 d7             	mov    %rdx,%rdi
49ac   5d885c:	be 04 00 00 00       	mov    $0x4,%esi
49b1   5d8861:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
49b5   5d8865:	e8 00 00 00 00       	call   5d886a <___bpf_prog_run+0x49ba>	5d8866: R_X86_64_PLT32	__kasan_check_write-0x4
49ba   5d886a:	8b 45 c0             	mov    -0x40(%rbp),%eax
49bd   5d886d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
49c1   5d8871:	f0 0f c1 02          	lock xadd %eax,(%rdx)
49c5   5d8875:	4c 89 fa             	mov    %r15,%rdx
49c8   5d8878:	4c 89 f9             	mov    %r15,%rcx
49cb   5d887b:	48 c1 ea 03          	shr    $0x3,%rdx
49cf   5d887f:	83 e1 07             	and    $0x7,%ecx
49d2   5d8882:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
49d7   5d8887:	38 ca                	cmp    %cl,%dl
49d9   5d8889:	7f 12                	jg     5d889d <___bpf_prog_run+0x49ed>
49db   5d888b:	84 d2                	test   %dl,%dl
49dd   5d888d:	74 0e                	je     5d889d <___bpf_prog_run+0x49ed>
49df   5d888f:	4c 89 ff             	mov    %r15,%rdi
49e2   5d8892:	89 45 c0             	mov    %eax,-0x40(%rbp)
49e5   5d8895:	e8 00 00 00 00       	call   5d889a <___bpf_prog_run+0x49ea>	5d8896: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
49ea   5d889a:	8b 45 c0             	mov    -0x40(%rbp),%eax
49ed   5d889d:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
49f1   5d88a1:	41 89 c7             	mov    %eax,%r15d
49f4   5d88a4:	c0 ea 04             	shr    $0x4,%dl
49f7   5d88a7:	0f b6 d2             	movzbl %dl,%edx
49fa   5d88aa:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
49fe   5d88ae:	48 89 d0             	mov    %rdx,%rax
4a01   5d88b1:	48 c1 e8 03          	shr    $0x3,%rax
4a05   5d88b5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4a0a   5d88ba:	0f 85 e1 0c 00 00    	jne    5d95a1 <___bpf_prog_run+0x56f1>
4a10   5d88c0:	4c 89 3a             	mov    %r15,(%rdx)
4a13   5d88c3:	e9 d4 fe ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
4a18   5d88c8:	81 fa a0 00 00 00    	cmp    $0xa0,%edx
4a1e   5d88ce:	0f 85 bf 00 00 00    	jne    5d8993 <___bpf_prog_run+0x4ae3>
4a24   5d88d4:	83 e0 18             	and    $0x18,%eax
4a27   5d88d7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4a2b   5d88db:	88 45 b8             	mov    %al,-0x48(%rbp)
4a2e   5d88de:	48 89 f8             	mov    %rdi,%rax
4a31   5d88e1:	48 89 fa             	mov    %rdi,%rdx
4a34   5d88e4:	48 c1 e8 03          	shr    $0x3,%rax
4a38   5d88e8:	83 e2 07             	and    $0x7,%edx
4a3b   5d88eb:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4a40   5d88f0:	38 d0                	cmp    %dl,%al
4a42   5d88f2:	7f 08                	jg     5d88fc <___bpf_prog_run+0x4a4c>
4a44   5d88f4:	84 c0                	test   %al,%al
4a46   5d88f6:	0f 85 24 0d 00 00    	jne    5d9620 <___bpf_prog_run+0x5770>
4a4c   5d88fc:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4a50   5d8900:	c0 e8 04             	shr    $0x4,%al
4a53   5d8903:	0f b6 c0             	movzbl %al,%eax
4a56   5d8906:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4a5a   5d890a:	4c 89 f8             	mov    %r15,%rax
4a5d   5d890d:	48 c1 e8 03          	shr    $0x3,%rax
4a61   5d8911:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4a66   5d8916:	0f 85 7a 0d 00 00    	jne    5d9696 <___bpf_prog_run+0x57e6>
4a6c   5d891c:	49 8b 07             	mov    (%r15),%rax
4a6f   5d891f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4a73   5d8923:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4a77   5d8927:	83 e0 0f             	and    $0xf,%eax
4a7a   5d892a:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4a7e   5d892e:	4c 89 fa             	mov    %r15,%rdx
4a81   5d8931:	48 c1 ea 03          	shr    $0x3,%rdx
4a85   5d8935:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4a8a   5d893a:	0f 85 86 0e 00 00    	jne    5d97c6 <___bpf_prog_run+0x5916>
4a90   5d8940:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4a94   5d8944:	4d 8b 3f             	mov    (%r15),%r15
4a97   5d8947:	48 89 f8             	mov    %rdi,%rax
4a9a   5d894a:	48 c1 e8 03          	shr    $0x3,%rax
4a9e   5d894e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4aa3   5d8953:	48 89 f8             	mov    %rdi,%rax
4aa6   5d8956:	83 e0 07             	and    $0x7,%eax
4aa9   5d8959:	83 c0 01             	add    $0x1,%eax
4aac   5d895c:	38 d0                	cmp    %dl,%al
4aae   5d895e:	7c 08                	jl     5d8968 <___bpf_prog_run+0x4ab8>
4ab0   5d8960:	84 d2                	test   %dl,%dl
4ab2   5d8962:	0f 85 54 0e 00 00    	jne    5d97bc <___bpf_prog_run+0x590c>
4ab8   5d8968:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
4abd   5d896d:	49 01 d7             	add    %rdx,%r15
4ac0   5d8970:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
4ac4   5d8974:	0f 85 96 0b 00 00    	jne    5d9510 <___bpf_prog_run+0x5660>
4aca   5d897a:	be 04 00 00 00       	mov    $0x4,%esi
4acf   5d897f:	4c 89 ff             	mov    %r15,%rdi
4ad2   5d8982:	e8 00 00 00 00       	call   5d8987 <___bpf_prog_run+0x4ad7>	5d8983: R_X86_64_PLT32	__kasan_check_write-0x4
4ad7   5d8987:	8b 45 c0             	mov    -0x40(%rbp),%eax
4ada   5d898a:	f0 41 31 07          	lock xor %eax,(%r15)
4ade   5d898e:	e9 09 fe ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
4ae3   5d8993:	81 fa a1 00 00 00    	cmp    $0xa1,%edx
4ae9   5d8999:	0f 85 18 05 00 00    	jne    5d8eb7 <___bpf_prog_run+0x5007>
4aef   5d899f:	83 e0 18             	and    $0x18,%eax
4af2   5d89a2:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
4af6   5d89a6:	88 45 b8             	mov    %al,-0x48(%rbp)
4af9   5d89a9:	4c 89 f8             	mov    %r15,%rax
4afc   5d89ac:	4c 89 fa             	mov    %r15,%rdx
4aff   5d89af:	48 c1 e8 03          	shr    $0x3,%rax
4b03   5d89b3:	83 e2 07             	and    $0x7,%edx
4b06   5d89b6:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4b0b   5d89bb:	38 d0                	cmp    %dl,%al
4b0d   5d89bd:	7f 08                	jg     5d89c7 <___bpf_prog_run+0x4b17>
4b0f   5d89bf:	84 c0                	test   %al,%al
4b11   5d89c1:	0f 85 8a 0d 00 00    	jne    5d9751 <___bpf_prog_run+0x58a1>
4b17   5d89c7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4b1b   5d89cb:	c0 e8 04             	shr    $0x4,%al
4b1e   5d89ce:	0f b6 c0             	movzbl %al,%eax
4b21   5d89d1:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4b25   5d89d5:	48 89 c2             	mov    %rax,%rdx
4b28   5d89d8:	48 c1 ea 03          	shr    $0x3,%rdx
4b2c   5d89dc:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4b31   5d89e1:	0f 85 c0 0d 00 00    	jne    5d97a7 <___bpf_prog_run+0x58f7>
4b37   5d89e7:	48 8b 00             	mov    (%rax),%rax
4b3a   5d89ea:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
4b3e   5d89ee:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4b42   5d89f2:	83 e0 0f             	and    $0xf,%eax
4b45   5d89f5:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4b49   5d89f9:	48 89 c2             	mov    %rax,%rdx
4b4c   5d89fc:	48 c1 ea 03          	shr    $0x3,%rdx
4b50   5d8a00:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4b55   5d8a05:	0f 85 87 0d 00 00    	jne    5d9792 <___bpf_prog_run+0x58e2>
4b5b   5d8a0b:	48 8b 00             	mov    (%rax),%rax
4b5e   5d8a0e:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4b62   5d8a12:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
4b66   5d8a16:	48 89 f8             	mov    %rdi,%rax
4b69   5d8a19:	48 c1 e8 03          	shr    $0x3,%rax
4b6d   5d8a1d:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4b72   5d8a22:	48 89 f8             	mov    %rdi,%rax
4b75   5d8a25:	83 e0 07             	and    $0x7,%eax
4b78   5d8a28:	83 c0 01             	add    $0x1,%eax
4b7b   5d8a2b:	38 d0                	cmp    %dl,%al
4b7d   5d8a2d:	7c 08                	jl     5d8a37 <___bpf_prog_run+0x4b87>
4b7f   5d8a2f:	84 d2                	test   %dl,%dl
4b81   5d8a31:	0f 85 55 0c 00 00    	jne    5d968c <___bpf_prog_run+0x57dc>
4b87   5d8a37:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
4b8c   5d8a3c:	48 03 55 b0          	add    -0x50(%rbp),%rdx
4b90   5d8a40:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
4b94   5d8a44:	0f 85 8a 09 00 00    	jne    5d93d4 <___bpf_prog_run+0x5524>
4b9a   5d8a4a:	48 89 d7             	mov    %rdx,%rdi
4b9d   5d8a4d:	be 04 00 00 00       	mov    $0x4,%esi
4ba2   5d8a52:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
4ba6   5d8a56:	e8 00 00 00 00       	call   5d8a5b <___bpf_prog_run+0x4bab>	5d8a57: R_X86_64_PLT32	__kasan_check_write-0x4
4bab   5d8a5b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
4baf   5d8a5f:	48 89 d0             	mov    %rdx,%rax
4bb2   5d8a62:	48 c1 e8 03          	shr    $0x3,%rax
4bb6   5d8a66:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
4bbb   5d8a6b:	48 89 d0             	mov    %rdx,%rax
4bbe   5d8a6e:	83 e0 07             	and    $0x7,%eax
4bc1   5d8a71:	83 c0 03             	add    $0x3,%eax
4bc4   5d8a74:	38 c8                	cmp    %cl,%al
4bc6   5d8a76:	7c 10                	jl     5d8a88 <___bpf_prog_run+0x4bd8>
4bc8   5d8a78:	84 c9                	test   %cl,%cl
4bca   5d8a7a:	74 0c                	je     5d8a88 <___bpf_prog_run+0x4bd8>
4bcc   5d8a7c:	48 89 d7             	mov    %rdx,%rdi
4bcf   5d8a7f:	e8 00 00 00 00       	call   5d8a84 <___bpf_prog_run+0x4bd4>	5d8a80: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4bd4   5d8a84:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
4bd8   5d8a88:	8b 02                	mov    (%rdx),%eax
4bda   5d8a8a:	8b 75 c0             	mov    -0x40(%rbp),%esi
4bdd   5d8a8d:	89 c1                	mov    %eax,%ecx
4bdf   5d8a8f:	31 c6                	xor    %eax,%esi
4be1   5d8a91:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
4be5   5d8a95:	75 f3                	jne    5d8a8a <___bpf_prog_run+0x4bda>
4be7   5d8a97:	4c 89 f8             	mov    %r15,%rax
4bea   5d8a9a:	4c 89 fa             	mov    %r15,%rdx
4bed   5d8a9d:	48 c1 e8 03          	shr    $0x3,%rax
4bf1   5d8aa1:	83 e2 07             	and    $0x7,%edx
4bf4   5d8aa4:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4bf9   5d8aa9:	38 d0                	cmp    %dl,%al
4bfb   5d8aab:	7f 12                	jg     5d8abf <___bpf_prog_run+0x4c0f>
4bfd   5d8aad:	84 c0                	test   %al,%al
4bff   5d8aaf:	74 0e                	je     5d8abf <___bpf_prog_run+0x4c0f>
4c01   5d8ab1:	4c 89 ff             	mov    %r15,%rdi
4c04   5d8ab4:	89 4d c0             	mov    %ecx,-0x40(%rbp)
4c07   5d8ab7:	e8 00 00 00 00       	call   5d8abc <___bpf_prog_run+0x4c0c>	5d8ab8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4c0c   5d8abc:	8b 4d c0             	mov    -0x40(%rbp),%ecx
4c0f   5d8abf:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4c13   5d8ac3:	41 89 cf             	mov    %ecx,%r15d
4c16   5d8ac6:	c0 e8 04             	shr    $0x4,%al
4c19   5d8ac9:	0f b6 c0             	movzbl %al,%eax
4c1c   5d8acc:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
4c20   5d8ad0:	48 89 c2             	mov    %rax,%rdx
4c23   5d8ad3:	48 c1 ea 03          	shr    $0x3,%rdx
4c27   5d8ad7:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
4c2c   5d8adc:	0f 85 d4 0a 00 00    	jne    5d95b6 <___bpf_prog_run+0x5706>
4c32   5d8ae2:	4c 89 38             	mov    %r15,(%rax)
4c35   5d8ae5:	e9 b2 fc ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
4c3a   5d8aea:	48 83 c3 08          	add    $0x8,%rbx
4c3e   5d8aee:	e9 fc b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c43   5d8af3:	48 83 c3 08          	add    $0x8,%rbx
4c47   5d8af7:	e9 f3 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c4c   5d8afc:	48 83 c3 08          	add    $0x8,%rbx
4c50   5d8b00:	e9 ea b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c55   5d8b05:	48 83 c3 08          	add    $0x8,%rbx
4c59   5d8b09:	e9 e1 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c5e   5d8b0e:	48 83 c3 08          	add    $0x8,%rbx
4c62   5d8b12:	e9 d8 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c67   5d8b17:	48 83 c3 08          	add    $0x8,%rbx
4c6b   5d8b1b:	e9 cf b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c70   5d8b20:	48 83 c3 08          	add    $0x8,%rbx
4c74   5d8b24:	e9 c6 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c79   5d8b29:	48 83 c3 08          	add    $0x8,%rbx
4c7d   5d8b2d:	e9 bd b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c82   5d8b32:	48 83 c3 08          	add    $0x8,%rbx
4c86   5d8b36:	e9 b4 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c8b   5d8b3b:	48 83 c3 08          	add    $0x8,%rbx
4c8f   5d8b3f:	e9 ab b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c94   5d8b44:	48 83 c3 08          	add    $0x8,%rbx
4c98   5d8b48:	e9 a2 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4c9d   5d8b4d:	48 83 c3 08          	add    $0x8,%rbx
4ca1   5d8b51:	e9 99 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4ca6   5d8b56:	48 83 c3 08          	add    $0x8,%rbx
4caa   5d8b5a:	e9 90 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4caf   5d8b5f:	48 83 c3 08          	add    $0x8,%rbx
4cb3   5d8b63:	e9 87 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cb8   5d8b68:	48 83 c3 08          	add    $0x8,%rbx
4cbc   5d8b6c:	e9 7e b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cc1   5d8b71:	48 83 c3 08          	add    $0x8,%rbx
4cc5   5d8b75:	e9 75 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cca   5d8b7a:	48 83 c3 08          	add    $0x8,%rbx
4cce   5d8b7e:	e9 6c b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cd3   5d8b83:	48 83 c3 08          	add    $0x8,%rbx
4cd7   5d8b87:	e9 63 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cdc   5d8b8c:	48 83 c3 08          	add    $0x8,%rbx
4ce0   5d8b90:	e9 5a b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4ce5   5d8b95:	48 83 c3 08          	add    $0x8,%rbx
4ce9   5d8b99:	e9 51 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cee   5d8b9e:	48 83 c3 08          	add    $0x8,%rbx
4cf2   5d8ba2:	e9 48 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4cf7   5d8ba7:	48 83 c3 08          	add    $0x8,%rbx
4cfb   5d8bab:	e9 3f b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d00   5d8bb0:	48 83 c3 08          	add    $0x8,%rbx
4d04   5d8bb4:	e9 36 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d09   5d8bb9:	48 83 c3 08          	add    $0x8,%rbx
4d0d   5d8bbd:	e9 2d b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d12   5d8bc2:	48 83 c3 08          	add    $0x8,%rbx
4d16   5d8bc6:	e9 24 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d1b   5d8bcb:	48 83 c3 08          	add    $0x8,%rbx
4d1f   5d8bcf:	e9 1b b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d24   5d8bd4:	48 83 c3 08          	add    $0x8,%rbx
4d28   5d8bd8:	e9 12 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d2d   5d8bdd:	48 83 c3 08          	add    $0x8,%rbx
4d31   5d8be1:	e9 09 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d36   5d8be6:	48 83 c3 08          	add    $0x8,%rbx
4d3a   5d8bea:	e9 00 b3 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d3f   5d8bef:	48 83 c3 08          	add    $0x8,%rbx
4d43   5d8bf3:	e9 f7 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d48   5d8bf8:	48 83 c3 08          	add    $0x8,%rbx
4d4c   5d8bfc:	e9 ee b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d51   5d8c01:	48 83 c3 08          	add    $0x8,%rbx
4d55   5d8c05:	e9 e5 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d5a   5d8c0a:	48 83 c3 08          	add    $0x8,%rbx
4d5e   5d8c0e:	e9 dc b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d63   5d8c13:	48 83 c3 08          	add    $0x8,%rbx
4d67   5d8c17:	e9 d3 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d6c   5d8c1c:	48 83 c3 08          	add    $0x8,%rbx
4d70   5d8c20:	e9 ca b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d75   5d8c25:	48 83 c3 08          	add    $0x8,%rbx
4d79   5d8c29:	e9 c1 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4d7e   5d8c2e:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4d82   5d8c32:	48 89 f8             	mov    %rdi,%rax
4d85   5d8c35:	48 89 fa             	mov    %rdi,%rdx
4d88   5d8c38:	48 c1 e8 03          	shr    $0x3,%rax
4d8c   5d8c3c:	83 e2 07             	and    $0x7,%edx
4d8f   5d8c3f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4d94   5d8c44:	38 d0                	cmp    %dl,%al
4d96   5d8c46:	7f 08                	jg     5d8c50 <___bpf_prog_run+0x4da0>
4d98   5d8c48:	84 c0                	test   %al,%al
4d9a   5d8c4a:	0f 85 e3 0a 00 00    	jne    5d9733 <___bpf_prog_run+0x5883>
4da0   5d8c50:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4da4   5d8c54:	83 e0 0f             	and    $0xf,%eax
4da7   5d8c57:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4dab   5d8c5b:	4c 89 f8             	mov    %r15,%rax
4dae   5d8c5e:	48 c1 e8 03          	shr    $0x3,%rax
4db2   5d8c62:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4db7   5d8c67:	0f 85 d0 26 00 00    	jne    5db33d <___bpf_prog_run+0x748d>
4dbd   5d8c6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
4dc2   5d8c72:	48 83 c3 08          	add    $0x8,%rbx
4dc6   5d8c76:	49 21 07             	and    %rax,(%r15)
4dc9   5d8c79:	e9 71 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4dce   5d8c7e:	48 83 c3 08          	add    $0x8,%rbx
4dd2   5d8c82:	e9 68 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4dd7   5d8c87:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4ddb   5d8c8b:	48 89 f8             	mov    %rdi,%rax
4dde   5d8c8e:	48 89 fa             	mov    %rdi,%rdx
4de1   5d8c91:	48 c1 e8 03          	shr    $0x3,%rax
4de5   5d8c95:	83 e2 07             	and    $0x7,%edx
4de8   5d8c98:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4ded   5d8c9d:	38 d0                	cmp    %dl,%al
4def   5d8c9f:	7f 08                	jg     5d8ca9 <___bpf_prog_run+0x4df9>
4df1   5d8ca1:	84 c0                	test   %al,%al
4df3   5d8ca3:	0f 85 e4 08 00 00    	jne    5d958d <___bpf_prog_run+0x56dd>
4df9   5d8ca9:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4dfd   5d8cad:	83 e0 0f             	and    $0xf,%eax
4e00   5d8cb0:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4e04   5d8cb4:	4c 89 f8             	mov    %r15,%rax
4e07   5d8cb7:	48 c1 e8 03          	shr    $0x3,%rax
4e0b   5d8cbb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4e10   5d8cc0:	0f 85 6a 26 00 00    	jne    5db330 <___bpf_prog_run+0x7480>
4e16   5d8cc6:	49 81 27 ff ff 00 00 	andq   $0xffff,(%r15)
4e1d   5d8ccd:	48 83 c3 08          	add    $0x8,%rbx
4e21   5d8cd1:	e9 19 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4e26   5d8cd6:	48 83 c3 08          	add    $0x8,%rbx
4e2a   5d8cda:	e9 10 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4e2f   5d8cdf:	48 83 c3 08          	add    $0x8,%rbx
4e33   5d8ce3:	e9 07 b2 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4e38   5d8ce8:	48 83 c3 08          	add    $0x8,%rbx
4e3c   5d8cec:	e9 fe b1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4e41   5d8cf1:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4e45   5d8cf5:	48 89 f8             	mov    %rdi,%rax
4e48   5d8cf8:	48 c1 e8 03          	shr    $0x3,%rax
4e4c   5d8cfc:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4e51   5d8d01:	48 89 f8             	mov    %rdi,%rax
4e54   5d8d04:	83 e0 07             	and    $0x7,%eax
4e57   5d8d07:	83 c0 01             	add    $0x1,%eax
4e5a   5d8d0a:	38 d0                	cmp    %dl,%al
4e5c   5d8d0c:	7c 08                	jl     5d8d16 <___bpf_prog_run+0x4e66>
4e5e   5d8d0e:	84 d2                	test   %dl,%dl
4e60   5d8d10:	0f 85 81 08 00 00    	jne    5d9597 <___bpf_prog_run+0x56e7>
4e66   5d8d16:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4e6b   5d8d1b:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4e70   5d8d20:	e9 ca b1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4e75   5d8d25:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4e79   5d8d29:	48 89 f8             	mov    %rdi,%rax
4e7c   5d8d2c:	48 c1 e8 03          	shr    $0x3,%rax
4e80   5d8d30:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4e85   5d8d35:	48 89 f8             	mov    %rdi,%rax
4e88   5d8d38:	83 e0 07             	and    $0x7,%eax
4e8b   5d8d3b:	83 c0 01             	add    $0x1,%eax
4e8e   5d8d3e:	38 d0                	cmp    %dl,%al
4e90   5d8d40:	7c 08                	jl     5d8d4a <___bpf_prog_run+0x4e9a>
4e92   5d8d42:	84 d2                	test   %dl,%dl
4e94   5d8d44:	0f 85 f3 09 00 00    	jne    5d973d <___bpf_prog_run+0x588d>
4e9a   5d8d4a:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4e9f   5d8d4f:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4ea4   5d8d54:	e9 96 b1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4ea9   5d8d59:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4ead   5d8d5d:	48 89 f8             	mov    %rdi,%rax
4eb0   5d8d60:	48 c1 e8 03          	shr    $0x3,%rax
4eb4   5d8d64:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4eb9   5d8d69:	48 89 f8             	mov    %rdi,%rax
4ebc   5d8d6c:	83 e0 07             	and    $0x7,%eax
4ebf   5d8d6f:	83 c0 01             	add    $0x1,%eax
4ec2   5d8d72:	38 d0                	cmp    %dl,%al
4ec4   5d8d74:	7c 08                	jl     5d8d7e <___bpf_prog_run+0x4ece>
4ec6   5d8d76:	84 d2                	test   %dl,%dl
4ec8   5d8d78:	0f 85 c9 09 00 00    	jne    5d9747 <___bpf_prog_run+0x5897>
4ece   5d8d7e:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4ed3   5d8d83:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4ed8   5d8d88:	e9 62 b1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4edd   5d8d8d:	48 83 c3 08          	add    $0x8,%rbx
4ee1   5d8d91:	e9 59 b1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4ee6   5d8d96:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
4eea   5d8d9a:	48 89 f8             	mov    %rdi,%rax
4eed   5d8d9d:	48 c1 e8 03          	shr    $0x3,%rax
4ef1   5d8da1:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
4ef6   5d8da6:	48 89 f8             	mov    %rdi,%rax
4ef9   5d8da9:	83 e0 07             	and    $0x7,%eax
4efc   5d8dac:	83 c0 01             	add    $0x1,%eax
4eff   5d8daf:	38 d0                	cmp    %dl,%al
4f01   5d8db1:	7c 08                	jl     5d8dbb <___bpf_prog_run+0x4f0b>
4f03   5d8db3:	84 d2                	test   %dl,%dl
4f05   5d8db5:	0f 85 c8 07 00 00    	jne    5d9583 <___bpf_prog_run+0x56d3>
4f0b   5d8dbb:	48 0f bf 43 02       	movswq 0x2(%rbx),%rax
4f10   5d8dc0:	48 8d 5c c3 08       	lea    0x8(%rbx,%rax,8),%rbx
4f15   5d8dc5:	e9 25 b1 ff ff       	jmp    5d3eef <___bpf_prog_run+0x3f>
4f1a   5d8dca:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4f1e   5d8dce:	48 89 f8             	mov    %rdi,%rax
4f21   5d8dd1:	48 89 fa             	mov    %rdi,%rdx
4f24   5d8dd4:	48 c1 e8 03          	shr    $0x3,%rax
4f28   5d8dd8:	83 e2 07             	and    $0x7,%edx
4f2b   5d8ddb:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4f30   5d8de0:	38 d0                	cmp    %dl,%al
4f32   5d8de2:	7f 08                	jg     5d8dec <___bpf_prog_run+0x4f3c>
4f34   5d8de4:	84 c0                	test   %al,%al
4f36   5d8de6:	0f 85 29 09 00 00    	jne    5d9715 <___bpf_prog_run+0x5865>
4f3c   5d8dec:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4f40   5d8df0:	83 e0 0f             	and    $0xf,%eax
4f43   5d8df3:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4f47   5d8df7:	4c 89 f8             	mov    %r15,%rax
4f4a   5d8dfa:	48 c1 e8 03          	shr    $0x3,%rax
4f4e   5d8dfe:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4f53   5d8e03:	0f 85 7a 16 00 00    	jne    5da483 <___bpf_prog_run+0x65d3>
4f59   5d8e09:	41 0f b7 07          	movzwl (%r15),%eax
4f5d   5d8e0d:	66 c1 c0 08          	rol    $0x8,%ax
4f61   5d8e11:	0f b7 c0             	movzwl %ax,%eax
4f64   5d8e14:	49 89 07             	mov    %rax,(%r15)
4f67   5d8e17:	e9 b5 dd ff ff       	jmp    5d6bd1 <___bpf_prog_run+0x2d21>
4f6c   5d8e1c:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4f70   5d8e20:	48 89 f8             	mov    %rdi,%rax
4f73   5d8e23:	48 89 fa             	mov    %rdi,%rdx
4f76   5d8e26:	48 c1 e8 03          	shr    $0x3,%rax
4f7a   5d8e2a:	83 e2 07             	and    $0x7,%edx
4f7d   5d8e2d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4f82   5d8e32:	38 d0                	cmp    %dl,%al
4f84   5d8e34:	7f 08                	jg     5d8e3e <___bpf_prog_run+0x4f8e>
4f86   5d8e36:	84 c0                	test   %al,%al
4f88   5d8e38:	0f 85 e1 08 00 00    	jne    5d971f <___bpf_prog_run+0x586f>
4f8e   5d8e3e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4f92   5d8e42:	83 e0 0f             	and    $0xf,%eax
4f95   5d8e45:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4f99   5d8e49:	4c 89 f8             	mov    %r15,%rax
4f9c   5d8e4c:	48 c1 e8 03          	shr    $0x3,%rax
4fa0   5d8e50:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4fa5   5d8e55:	0f 85 30 17 00 00    	jne    5da58b <___bpf_prog_run+0x66db>
4fab   5d8e5b:	49 8b 07             	mov    (%r15),%rax
4fae   5d8e5e:	48 0f c8             	bswap  %rax
4fb1   5d8e61:	49 89 07             	mov    %rax,(%r15)
4fb4   5d8e64:	e9 68 dd ff ff       	jmp    5d6bd1 <___bpf_prog_run+0x2d21>
4fb9   5d8e69:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
4fbd   5d8e6d:	48 89 f8             	mov    %rdi,%rax
4fc0   5d8e70:	48 89 fa             	mov    %rdi,%rdx
4fc3   5d8e73:	48 c1 e8 03          	shr    $0x3,%rax
4fc7   5d8e77:	83 e2 07             	and    $0x7,%edx
4fca   5d8e7a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
4fcf   5d8e7f:	38 d0                	cmp    %dl,%al
4fd1   5d8e81:	7f 08                	jg     5d8e8b <___bpf_prog_run+0x4fdb>
4fd3   5d8e83:	84 c0                	test   %al,%al
4fd5   5d8e85:	0f 85 9e 08 00 00    	jne    5d9729 <___bpf_prog_run+0x5879>
4fdb   5d8e8b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
4fdf   5d8e8f:	83 e0 0f             	and    $0xf,%eax
4fe2   5d8e92:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
4fe6   5d8e96:	4c 89 f8             	mov    %r15,%rax
4fe9   5d8e99:	48 c1 e8 03          	shr    $0x3,%rax
4fed   5d8e9d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4ff2   5d8ea2:	0f 85 e8 15 00 00    	jne    5da490 <___bpf_prog_run+0x65e0>
4ff8   5d8ea8:	49 8b 07             	mov    (%r15),%rax
4ffb   5d8eab:	0f c8                	bswap  %eax
4ffd   5d8ead:	89 c0                	mov    %eax,%eax
4fff   5d8eaf:	49 89 07             	mov    %rax,(%r15)
5002   5d8eb2:	e9 1a dd ff ff       	jmp    5d6bd1 <___bpf_prog_run+0x2d21>
5007   5d8eb7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5011   5d8ec1:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
5015   5d8ec5:	48 89 fa             	mov    %rdi,%rdx
5018   5d8ec8:	48 c1 ea 03          	shr    $0x3,%rdx
501c   5d8ecc:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
5020   5d8ed0:	48 89 f8             	mov    %rdi,%rax
5023   5d8ed3:	83 e0 07             	and    $0x7,%eax
5026   5d8ed6:	83 c0 03             	add    $0x3,%eax
5029   5d8ed9:	38 d0                	cmp    %dl,%al
502b   5d8edb:	7c 09                	jl     5d8ee6 <___bpf_prog_run+0x5036>
502d   5d8edd:	84 d2                	test   %dl,%dl
502f   5d8edf:	74 05                	je     5d8ee6 <___bpf_prog_run+0x5036>
5031   5d8ee1:	e8 00 00 00 00       	call   5d8ee6 <___bpf_prog_run+0x5036>	5d8ee2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5036   5d8ee6:	8b 53 04             	mov    0x4(%rbx),%edx
5039   5d8ee9:	44 89 fe             	mov    %r15d,%esi
503c   5d8eec:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5d8eef: R_X86_64_32S	.rodata+0x4e8f20
5043   5d8ef3:	e8 00 00 00 00       	call   5d8ef8 <___bpf_prog_run+0x5048>	5d8ef4: R_X86_64_PLT32	_printk-0x4
5048   5d8ef8:	90                   	nop
5049   5d8ef9:	0f 0b                	ud2
504b   5d8efb:	83 e0 18             	and    $0x18,%eax
504e   5d8efe:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
5052   5d8f02:	88 45 b8             	mov    %al,-0x48(%rbp)
5055   5d8f05:	4c 89 f8             	mov    %r15,%rax
5058   5d8f08:	4c 89 fa             	mov    %r15,%rdx
505b   5d8f0b:	48 c1 e8 03          	shr    $0x3,%rax
505f   5d8f0f:	83 e2 07             	and    $0x7,%edx
5062   5d8f12:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
5067   5d8f17:	38 d0                	cmp    %dl,%al
5069   5d8f19:	7f 08                	jg     5d8f23 <___bpf_prog_run+0x5073>
506b   5d8f1b:	84 c0                	test   %al,%al
506d   5d8f1d:	0f 85 dc 06 00 00    	jne    5d95ff <___bpf_prog_run+0x574f>
5073   5d8f23:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5077   5d8f27:	c0 e8 04             	shr    $0x4,%al
507a   5d8f2a:	0f b6 c0             	movzbl %al,%eax
507d   5d8f2d:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
5081   5d8f31:	48 89 c2             	mov    %rax,%rdx
5084   5d8f34:	48 c1 ea 03          	shr    $0x3,%rdx
5088   5d8f38:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
508d   5d8f3d:	0f 85 a7 06 00 00    	jne    5d95ea <___bpf_prog_run+0x573a>
5093   5d8f43:	48 8b 00             	mov    (%rax),%rax
5096   5d8f46:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
509a   5d8f4a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
509e   5d8f4e:	83 e0 0f             	and    $0xf,%eax
50a1   5d8f51:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
50a5   5d8f55:	48 89 c2             	mov    %rax,%rdx
50a8   5d8f58:	48 c1 ea 03          	shr    $0x3,%rdx
50ac   5d8f5c:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
50b1   5d8f61:	0f 85 6e 06 00 00    	jne    5d95d5 <___bpf_prog_run+0x5725>
50b7   5d8f67:	48 8b 00             	mov    (%rax),%rax
50ba   5d8f6a:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
50be   5d8f6e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
50c2   5d8f72:	48 89 f8             	mov    %rdi,%rax
50c5   5d8f75:	48 c1 e8 03          	shr    $0x3,%rax
50c9   5d8f79:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
50ce   5d8f7e:	48 89 f8             	mov    %rdi,%rax
50d1   5d8f81:	83 e0 07             	and    $0x7,%eax
50d4   5d8f84:	83 c0 01             	add    $0x1,%eax
50d7   5d8f87:	38 d0                	cmp    %dl,%al
50d9   5d8f89:	7c 08                	jl     5d8f93 <___bpf_prog_run+0x50e3>
50db   5d8f8b:	84 d2                	test   %dl,%dl
50dd   5d8f8d:	0f 85 38 06 00 00    	jne    5d95cb <___bpf_prog_run+0x571b>
50e3   5d8f93:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
50e8   5d8f98:	48 03 55 b0          	add    -0x50(%rbp),%rdx
50ec   5d8f9c:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
50f0   5d8fa0:	0f 85 c0 03 00 00    	jne    5d9366 <___bpf_prog_run+0x54b6>
50f6   5d8fa6:	48 89 d7             	mov    %rdx,%rdi
50f9   5d8fa9:	be 04 00 00 00       	mov    $0x4,%esi
50fe   5d8fae:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5102   5d8fb2:	e8 00 00 00 00       	call   5d8fb7 <___bpf_prog_run+0x5107>	5d8fb3: R_X86_64_PLT32	__kasan_check_write-0x4
5107   5d8fb7:	8b 45 c0             	mov    -0x40(%rbp),%eax
510a   5d8fba:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
510e   5d8fbe:	87 02                	xchg   %eax,(%rdx)
5110   5d8fc0:	4c 89 fa             	mov    %r15,%rdx
5113   5d8fc3:	4c 89 f9             	mov    %r15,%rcx
5116   5d8fc6:	48 c1 ea 03          	shr    $0x3,%rdx
511a   5d8fca:	83 e1 07             	and    $0x7,%ecx
511d   5d8fcd:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
5122   5d8fd2:	38 ca                	cmp    %cl,%dl
5124   5d8fd4:	7f 12                	jg     5d8fe8 <___bpf_prog_run+0x5138>
5126   5d8fd6:	84 d2                	test   %dl,%dl
5128   5d8fd8:	74 0e                	je     5d8fe8 <___bpf_prog_run+0x5138>
512a   5d8fda:	4c 89 ff             	mov    %r15,%rdi
512d   5d8fdd:	89 45 c0             	mov    %eax,-0x40(%rbp)
5130   5d8fe0:	e8 00 00 00 00       	call   5d8fe5 <___bpf_prog_run+0x5135>	5d8fe1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5135   5d8fe5:	8b 45 c0             	mov    -0x40(%rbp),%eax
5138   5d8fe8:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
513c   5d8fec:	41 89 c7             	mov    %eax,%r15d
513f   5d8fef:	c0 ea 04             	shr    $0x4,%dl
5142   5d8ff2:	0f b6 d2             	movzbl %dl,%edx
5145   5d8ff5:	49 8d 14 d6          	lea    (%r14,%rdx,8),%rdx
5149   5d8ff9:	48 89 d0             	mov    %rdx,%rax
514c   5d8ffc:	48 c1 e8 03          	shr    $0x3,%rax
5150   5d9000:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5155   5d9005:	0f 84 b5 f8 ff ff    	je     5d88c0 <___bpf_prog_run+0x4a10>
515b   5d900b:	48 89 d7             	mov    %rdx,%rdi
515e   5d900e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5162   5d9012:	e8 00 00 00 00       	call   5d9017 <___bpf_prog_run+0x5167>	5d9013: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5167   5d9017:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
516b   5d901b:	e9 a0 f8 ff ff       	jmp    5d88c0 <___bpf_prog_run+0x4a10>
5170   5d9020:	83 e0 18             	and    $0x18,%eax
5173   5d9023:	4c 8d 7b 01          	lea    0x1(%rbx),%r15
5177   5d9027:	88 45 b8             	mov    %al,-0x48(%rbp)
517a   5d902a:	4c 89 f8             	mov    %r15,%rax
517d   5d902d:	4c 89 fa             	mov    %r15,%rdx
5180   5d9030:	48 c1 e8 03          	shr    $0x3,%rax
5184   5d9034:	83 e2 07             	and    $0x7,%edx
5187   5d9037:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
518c   5d903c:	38 d0                	cmp    %dl,%al
518e   5d903e:	7f 08                	jg     5d9048 <___bpf_prog_run+0x5198>
5190   5d9040:	84 c0                	test   %al,%al
5192   5d9042:	0f 85 1e 08 00 00    	jne    5d9866 <___bpf_prog_run+0x59b6>
5198   5d9048:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
519c   5d904c:	c0 e8 04             	shr    $0x4,%al
519f   5d904f:	0f b6 c0             	movzbl %al,%eax
51a2   5d9052:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
51a6   5d9056:	48 89 c2             	mov    %rax,%rdx
51a9   5d9059:	48 c1 ea 03          	shr    $0x3,%rdx
51ad   5d905d:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
51b2   5d9062:	0f 85 e9 07 00 00    	jne    5d9851 <___bpf_prog_run+0x59a1>
51b8   5d9068:	48 8b 00             	mov    (%rax),%rax
51bb   5d906b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
51bf   5d906f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
51c3   5d9073:	83 e0 0f             	and    $0xf,%eax
51c6   5d9076:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
51ca   5d907a:	48 89 c2             	mov    %rax,%rdx
51cd   5d907d:	48 c1 ea 03          	shr    $0x3,%rdx
51d1   5d9081:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
51d6   5d9086:	0f 85 b0 07 00 00    	jne    5d983c <___bpf_prog_run+0x598c>
51dc   5d908c:	48 8b 00             	mov    (%rax),%rax
51df   5d908f:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
51e3   5d9093:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
51e7   5d9097:	48 89 f8             	mov    %rdi,%rax
51ea   5d909a:	48 c1 e8 03          	shr    $0x3,%rax
51ee   5d909e:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
51f3   5d90a3:	48 89 f8             	mov    %rdi,%rax
51f6   5d90a6:	83 e0 07             	and    $0x7,%eax
51f9   5d90a9:	83 c0 01             	add    $0x1,%eax
51fc   5d90ac:	38 d0                	cmp    %dl,%al
51fe   5d90ae:	7c 08                	jl     5d90b8 <___bpf_prog_run+0x5208>
5200   5d90b0:	84 d2                	test   %dl,%dl
5202   5d90b2:	0f 85 7a 07 00 00    	jne    5d9832 <___bpf_prog_run+0x5982>
5208   5d90b8:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
520d   5d90bd:	48 03 55 b0          	add    -0x50(%rbp),%rdx
5211   5d90c1:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
5215   5d90c5:	0f 85 10 02 00 00    	jne    5d92db <___bpf_prog_run+0x542b>
521b   5d90cb:	48 89 d7             	mov    %rdx,%rdi
521e   5d90ce:	be 04 00 00 00       	mov    $0x4,%esi
5223   5d90d3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5227   5d90d7:	e8 00 00 00 00       	call   5d90dc <___bpf_prog_run+0x522c>	5d90d8: R_X86_64_PLT32	__kasan_check_write-0x4
522c   5d90dc:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5230   5d90e0:	48 89 d0             	mov    %rdx,%rax
5233   5d90e3:	48 c1 e8 03          	shr    $0x3,%rax
5237   5d90e7:	42 0f b6 0c 28       	movzbl (%rax,%r13,1),%ecx
523c   5d90ec:	48 89 d0             	mov    %rdx,%rax
523f   5d90ef:	83 e0 07             	and    $0x7,%eax
5242   5d90f2:	83 c0 03             	add    $0x3,%eax
5245   5d90f5:	38 c8                	cmp    %cl,%al
5247   5d90f7:	7c 10                	jl     5d9109 <___bpf_prog_run+0x5259>
5249   5d90f9:	84 c9                	test   %cl,%cl
524b   5d90fb:	74 0c                	je     5d9109 <___bpf_prog_run+0x5259>
524d   5d90fd:	48 89 d7             	mov    %rdx,%rdi
5250   5d9100:	e8 00 00 00 00       	call   5d9105 <___bpf_prog_run+0x5255>	5d9101: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5255   5d9105:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5259   5d9109:	8b 02                	mov    (%rdx),%eax
525b   5d910b:	8b 75 c0             	mov    -0x40(%rbp),%esi
525e   5d910e:	89 c1                	mov    %eax,%ecx
5260   5d9110:	21 c6                	and    %eax,%esi
5262   5d9112:	f0 0f b1 32          	lock cmpxchg %esi,(%rdx)
5266   5d9116:	75 f3                	jne    5d910b <___bpf_prog_run+0x525b>
5268   5d9118:	4c 89 f8             	mov    %r15,%rax
526b   5d911b:	4c 89 fa             	mov    %r15,%rdx
526e   5d911e:	48 c1 e8 03          	shr    $0x3,%rax
5272   5d9122:	83 e2 07             	and    $0x7,%edx
5275   5d9125:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
527a   5d912a:	38 d0                	cmp    %dl,%al
527c   5d912c:	7f 12                	jg     5d9140 <___bpf_prog_run+0x5290>
527e   5d912e:	84 c0                	test   %al,%al
5280   5d9130:	74 0e                	je     5d9140 <___bpf_prog_run+0x5290>
5282   5d9132:	4c 89 ff             	mov    %r15,%rdi
5285   5d9135:	89 4d c0             	mov    %ecx,-0x40(%rbp)
5288   5d9138:	e8 00 00 00 00       	call   5d913d <___bpf_prog_run+0x528d>	5d9139: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
528d   5d913d:	8b 4d c0             	mov    -0x40(%rbp),%ecx
5290   5d9140:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5294   5d9144:	41 89 cf             	mov    %ecx,%r15d
5297   5d9147:	c0 e8 04             	shr    $0x4,%al
529a   5d914a:	0f b6 c0             	movzbl %al,%eax
529d   5d914d:	49 8d 04 c6          	lea    (%r14,%rax,8),%rax
52a1   5d9151:	48 89 c2             	mov    %rax,%rdx
52a4   5d9154:	48 c1 ea 03          	shr    $0x3,%rdx
52a8   5d9158:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
52ad   5d915d:	0f 84 7f f9 ff ff    	je     5d8ae2 <___bpf_prog_run+0x4c32>
52b3   5d9163:	48 89 c7             	mov    %rax,%rdi
52b6   5d9166:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
52ba   5d916a:	e8 00 00 00 00       	call   5d916f <___bpf_prog_run+0x52bf>	5d916b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
52bf   5d916f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
52c3   5d9173:	e9 6a f9 ff ff       	jmp    5d8ae2 <___bpf_prog_run+0x4c32>
52c8   5d9178:	83 e0 18             	and    $0x18,%eax
52cb   5d917b:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
52cf   5d917f:	88 45 b8             	mov    %al,-0x48(%rbp)
52d2   5d9182:	48 89 f8             	mov    %rdi,%rax
52d5   5d9185:	48 89 fa             	mov    %rdi,%rdx
52d8   5d9188:	48 c1 e8 03          	shr    $0x3,%rax
52dc   5d918c:	83 e2 07             	and    $0x7,%edx
52df   5d918f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
52e4   5d9194:	38 d0                	cmp    %dl,%al
52e6   5d9196:	7f 08                	jg     5d91a0 <___bpf_prog_run+0x52f0>
52e8   5d9198:	84 c0                	test   %al,%al
52ea   5d919a:	0f 85 4c 07 00 00    	jne    5d98ec <___bpf_prog_run+0x5a3c>
52f0   5d91a0:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
52f4   5d91a4:	c0 e8 04             	shr    $0x4,%al
52f7   5d91a7:	0f b6 c0             	movzbl %al,%eax
52fa   5d91aa:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
52fe   5d91ae:	4c 89 f8             	mov    %r15,%rax
5301   5d91b1:	48 c1 e8 03          	shr    $0x3,%rax
5305   5d91b5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
530a   5d91ba:	0f 85 1f 07 00 00    	jne    5d98df <___bpf_prog_run+0x5a2f>
5310   5d91c0:	49 8b 07             	mov    (%r15),%rax
5313   5d91c3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5317   5d91c7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
531b   5d91cb:	83 e0 0f             	and    $0xf,%eax
531e   5d91ce:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5322   5d91d2:	4c 89 fa             	mov    %r15,%rdx
5325   5d91d5:	48 c1 ea 03          	shr    $0x3,%rdx
5329   5d91d9:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
532e   5d91de:	0f 85 ee 06 00 00    	jne    5d98d2 <___bpf_prog_run+0x5a22>
5334   5d91e4:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
5338   5d91e8:	4d 8b 3f             	mov    (%r15),%r15
533b   5d91eb:	48 89 f8             	mov    %rdi,%rax
533e   5d91ee:	48 c1 e8 03          	shr    $0x3,%rax
5342   5d91f2:	42 0f b6 14 28       	movzbl (%rax,%r13,1),%edx
5347   5d91f7:	48 89 f8             	mov    %rdi,%rax
534a   5d91fa:	83 e0 07             	and    $0x7,%eax
534d   5d91fd:	83 c0 01             	add    $0x1,%eax
5350   5d9200:	38 d0                	cmp    %dl,%al
5352   5d9202:	7c 08                	jl     5d920c <___bpf_prog_run+0x535c>
5354   5d9204:	84 d2                	test   %dl,%dl
5356   5d9206:	0f 85 bc 06 00 00    	jne    5d98c8 <___bpf_prog_run+0x5a18>
535c   5d920c:	48 0f bf 53 02       	movswq 0x2(%rbx),%rdx
5361   5d9211:	49 01 d7             	add    %rdx,%r15
5364   5d9214:	80 7d b8 00          	cmpb   $0x0,-0x48(%rbp)
5368   5d9218:	0f 85 a3 00 00 00    	jne    5d92c1 <___bpf_prog_run+0x5411>
536e   5d921e:	be 04 00 00 00       	mov    $0x4,%esi
5373   5d9223:	4c 89 ff             	mov    %r15,%rdi
5376   5d9226:	e8 00 00 00 00       	call   5d922b <___bpf_prog_run+0x537b>	5d9227: R_X86_64_PLT32	__kasan_check_write-0x4
537b   5d922b:	8b 45 c0             	mov    -0x40(%rbp),%eax
537e   5d922e:	f0 41 09 07          	lock or %eax,(%r15)
5382   5d9232:	e9 65 f5 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
5387   5d9237:	48 89 d7             	mov    %rdx,%rdi
538a   5d923a:	be 08 00 00 00       	mov    $0x8,%esi
538f   5d923f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5393   5d9243:	e8 00 00 00 00       	call   5d9248 <___bpf_prog_run+0x5398>	5d9244: R_X86_64_PLT32	__kasan_check_write-0x4
5398   5d9248:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
539c   5d924c:	48 89 d0             	mov    %rdx,%rax
539f   5d924f:	48 c1 e8 03          	shr    $0x3,%rax
53a3   5d9253:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
53a8   5d9258:	0f 85 59 06 00 00    	jne    5d98b7 <___bpf_prog_run+0x5a07>
53ae   5d925e:	48 8b 02             	mov    (%rdx),%rax
53b1   5d9261:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
53b5   5d9265:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
53b9   5d9269:	48 09 c1             	or     %rax,%rcx
53bc   5d926c:	f0 48 0f b1 0a       	lock cmpxchg %rcx,(%rdx)
53c1   5d9271:	75 ee                	jne    5d9261 <___bpf_prog_run+0x53b1>
53c3   5d9273:	4c 89 f8             	mov    %r15,%rax
53c6   5d9276:	4c 89 fa             	mov    %r15,%rdx
53c9   5d9279:	48 c1 e8 03          	shr    $0x3,%rax
53cd   5d927d:	83 e2 07             	and    $0x7,%edx
53d0   5d9280:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
53d5   5d9285:	38 d0                	cmp    %dl,%al
53d7   5d9287:	7f 0c                	jg     5d9295 <___bpf_prog_run+0x53e5>
53d9   5d9289:	84 c0                	test   %al,%al
53db   5d928b:	74 08                	je     5d9295 <___bpf_prog_run+0x53e5>
53dd   5d928d:	4c 89 ff             	mov    %r15,%rdi
53e0   5d9290:	e8 00 00 00 00       	call   5d9295 <___bpf_prog_run+0x53e5>	5d9291: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
53e5   5d9295:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
53e9   5d9299:	c0 e8 04             	shr    $0x4,%al
53ec   5d929c:	0f b6 c0             	movzbl %al,%eax
53ef   5d929f:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
53f3   5d92a3:	4c 89 f8             	mov    %r15,%rax
53f6   5d92a6:	48 c1 e8 03          	shr    $0x3,%rax
53fa   5d92aa:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
53ff   5d92af:	0f 85 f5 05 00 00    	jne    5d98aa <___bpf_prog_run+0x59fa>
5405   5d92b5:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
5409   5d92b9:	49 89 07             	mov    %rax,(%r15)
540c   5d92bc:	e9 db f4 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
5411   5d92c1:	be 08 00 00 00       	mov    $0x8,%esi
5416   5d92c6:	4c 89 ff             	mov    %r15,%rdi
5419   5d92c9:	e8 00 00 00 00       	call   5d92ce <___bpf_prog_run+0x541e>	5d92ca: R_X86_64_PLT32	__kasan_check_write-0x4
541e   5d92ce:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5422   5d92d2:	f0 49 09 07          	lock or %rax,(%r15)
5426   5d92d6:	e9 c1 f4 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
542b   5d92db:	48 89 d7             	mov    %rdx,%rdi
542e   5d92de:	be 08 00 00 00       	mov    $0x8,%esi
5433   5d92e3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5437   5d92e7:	e8 00 00 00 00       	call   5d92ec <___bpf_prog_run+0x543c>	5d92e8: R_X86_64_PLT32	__kasan_check_write-0x4
543c   5d92ec:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5440   5d92f0:	48 89 d0             	mov    %rdx,%rax
5443   5d92f3:	48 c1 e8 03          	shr    $0x3,%rax
5447   5d92f7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
544c   5d92fc:	0f 85 97 05 00 00    	jne    5d9899 <___bpf_prog_run+0x59e9>
5452   5d9302:	48 8b 02             	mov    (%rdx),%rax
5455   5d9305:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5459   5d9309:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
545d   5d930d:	48 21 c1             	and    %rax,%rcx
5460   5d9310:	f0 48 0f b1 0a       	lock cmpxchg %rcx,(%rdx)
5465   5d9315:	75 ee                	jne    5d9305 <___bpf_prog_run+0x5455>
5467   5d9317:	4c 89 f8             	mov    %r15,%rax
546a   5d931a:	4c 89 fa             	mov    %r15,%rdx
546d   5d931d:	48 c1 e8 03          	shr    $0x3,%rax
5471   5d9321:	83 e2 07             	and    $0x7,%edx
5474   5d9324:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
5479   5d9329:	38 d0                	cmp    %dl,%al
547b   5d932b:	7f 0c                	jg     5d9339 <___bpf_prog_run+0x5489>
547d   5d932d:	84 c0                	test   %al,%al
547f   5d932f:	74 08                	je     5d9339 <___bpf_prog_run+0x5489>
5481   5d9331:	4c 89 ff             	mov    %r15,%rdi
5484   5d9334:	e8 00 00 00 00       	call   5d9339 <___bpf_prog_run+0x5489>	5d9335: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5489   5d9339:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
548d   5d933d:	c0 e8 04             	shr    $0x4,%al
5490   5d9340:	0f b6 c0             	movzbl %al,%eax
5493   5d9343:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5497   5d9347:	4c 89 f8             	mov    %r15,%rax
549a   5d934a:	48 c1 e8 03          	shr    $0x3,%rax
549e   5d934e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
54a3   5d9353:	0f 84 5c ff ff ff    	je     5d92b5 <___bpf_prog_run+0x5405>
54a9   5d9359:	4c 89 ff             	mov    %r15,%rdi
54ac   5d935c:	e8 00 00 00 00       	call   5d9361 <___bpf_prog_run+0x54b1>	5d935d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
54b1   5d9361:	e9 4f ff ff ff       	jmp    5d92b5 <___bpf_prog_run+0x5405>
54b6   5d9366:	48 89 d7             	mov    %rdx,%rdi
54b9   5d9369:	be 08 00 00 00       	mov    $0x8,%esi
54be   5d936e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
54c2   5d9372:	e8 00 00 00 00       	call   5d9377 <___bpf_prog_run+0x54c7>	5d9373: R_X86_64_PLT32	__kasan_check_write-0x4
54c7   5d9377:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
54cb   5d937b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
54cf   5d937f:	48 87 0a             	xchg   %rcx,(%rdx)
54d2   5d9382:	4c 89 f8             	mov    %r15,%rax
54d5   5d9385:	4c 89 fa             	mov    %r15,%rdx
54d8   5d9388:	48 c1 e8 03          	shr    $0x3,%rax
54dc   5d938c:	83 e2 07             	and    $0x7,%edx
54df   5d938f:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
54e4   5d9394:	38 d0                	cmp    %dl,%al
54e6   5d9396:	7f 14                	jg     5d93ac <___bpf_prog_run+0x54fc>
54e8   5d9398:	84 c0                	test   %al,%al
54ea   5d939a:	74 10                	je     5d93ac <___bpf_prog_run+0x54fc>
54ec   5d939c:	4c 89 ff             	mov    %r15,%rdi
54ef   5d939f:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
54f3   5d93a3:	e8 00 00 00 00       	call   5d93a8 <___bpf_prog_run+0x54f8>	5d93a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
54f8   5d93a8:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
54fc   5d93ac:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5500   5d93b0:	c0 e8 04             	shr    $0x4,%al
5503   5d93b3:	0f b6 c0             	movzbl %al,%eax
5506   5d93b6:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
550a   5d93ba:	4c 89 f8             	mov    %r15,%rax
550d   5d93bd:	48 c1 e8 03          	shr    $0x3,%rax
5511   5d93c1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5516   5d93c6:	0f 85 b8 04 00 00    	jne    5d9884 <___bpf_prog_run+0x59d4>
551c   5d93cc:	49 89 0f             	mov    %rcx,(%r15)
551f   5d93cf:	e9 c8 f3 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
5524   5d93d4:	48 89 d7             	mov    %rdx,%rdi
5527   5d93d7:	be 08 00 00 00       	mov    $0x8,%esi
552c   5d93dc:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
5530   5d93e0:	e8 00 00 00 00       	call   5d93e5 <___bpf_prog_run+0x5535>	5d93e1: R_X86_64_PLT32	__kasan_check_write-0x4
5535   5d93e5:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5539   5d93e9:	48 89 d0             	mov    %rdx,%rax
553c   5d93ec:	48 c1 e8 03          	shr    $0x3,%rax
5540   5d93f0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5545   5d93f5:	0f 85 78 04 00 00    	jne    5d9873 <___bpf_prog_run+0x59c3>
554b   5d93fb:	48 8b 02             	mov    (%rdx),%rax
554e   5d93fe:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5552   5d9402:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
5556   5d9406:	48 31 c1             	xor    %rax,%rcx
5559   5d9409:	f0 48 0f b1 0a       	lock cmpxchg %rcx,(%rdx)
555e   5d940e:	75 ee                	jne    5d93fe <___bpf_prog_run+0x554e>
5560   5d9410:	4c 89 f8             	mov    %r15,%rax
5563   5d9413:	4c 89 fa             	mov    %r15,%rdx
5566   5d9416:	48 c1 e8 03          	shr    $0x3,%rax
556a   5d941a:	83 e2 07             	and    $0x7,%edx
556d   5d941d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
5572   5d9422:	38 d0                	cmp    %dl,%al
5574   5d9424:	7f 0c                	jg     5d9432 <___bpf_prog_run+0x5582>
5576   5d9426:	84 c0                	test   %al,%al
5578   5d9428:	74 08                	je     5d9432 <___bpf_prog_run+0x5582>
557a   5d942a:	4c 89 ff             	mov    %r15,%rdi
557d   5d942d:	e8 00 00 00 00       	call   5d9432 <___bpf_prog_run+0x5582>	5d942e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5582   5d9432:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
5586   5d9436:	c0 e8 04             	shr    $0x4,%al
5589   5d9439:	0f b6 c0             	movzbl %al,%eax
558c   5d943c:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5590   5d9440:	4c 89 f8             	mov    %r15,%rax
5593   5d9443:	48 c1 e8 03          	shr    $0x3,%rax
5597   5d9447:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
559c   5d944c:	0f 84 63 fe ff ff    	je     5d92b5 <___bpf_prog_run+0x5405>
55a2   5d9452:	4c 89 ff             	mov    %r15,%rdi
55a5   5d9455:	e8 00 00 00 00       	call   5d945a <___bpf_prog_run+0x55aa>	5d9456: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
55aa   5d945a:	e9 56 fe ff ff       	jmp    5d92b5 <___bpf_prog_run+0x5405>
55af   5d945f:	48 89 d7             	mov    %rdx,%rdi
55b2   5d9462:	be 08 00 00 00       	mov    $0x8,%esi
55b7   5d9467:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
55bb   5d946b:	e8 00 00 00 00       	call   5d9470 <___bpf_prog_run+0x55c0>	5d946c: R_X86_64_PLT32	__kasan_check_write-0x4
55c0   5d9470:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
55c4   5d9474:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
55c8   5d9478:	f0 48 0f c1 0a       	lock xadd %rcx,(%rdx)
55cd   5d947d:	4c 89 f8             	mov    %r15,%rax
55d0   5d9480:	4c 89 fa             	mov    %r15,%rdx
55d3   5d9483:	48 c1 e8 03          	shr    $0x3,%rax
55d7   5d9487:	83 e2 07             	and    $0x7,%edx
55da   5d948a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
55df   5d948f:	38 d0                	cmp    %dl,%al
55e1   5d9491:	7f 14                	jg     5d94a7 <___bpf_prog_run+0x55f7>
55e3   5d9493:	84 c0                	test   %al,%al
55e5   5d9495:	74 10                	je     5d94a7 <___bpf_prog_run+0x55f7>
55e7   5d9497:	4c 89 ff             	mov    %r15,%rdi
55ea   5d949a:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
55ee   5d949e:	e8 00 00 00 00       	call   5d94a3 <___bpf_prog_run+0x55f3>	5d949f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
55f3   5d94a3:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
55f7   5d94a7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
55fb   5d94ab:	c0 e8 04             	shr    $0x4,%al
55fe   5d94ae:	0f b6 c0             	movzbl %al,%eax
5601   5d94b1:	4d 8d 3c c6          	lea    (%r14,%rax,8),%r15
5605   5d94b5:	4c 89 f8             	mov    %r15,%rax
5608   5d94b8:	48 c1 e8 03          	shr    $0x3,%rax
560c   5d94bc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5611   5d94c1:	0f 84 05 ff ff ff    	je     5d93cc <___bpf_prog_run+0x551c>
5617   5d94c7:	4c 89 ff             	mov    %r15,%rdi
561a   5d94ca:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
561e   5d94ce:	e8 00 00 00 00       	call   5d94d3 <___bpf_prog_run+0x5623>	5d94cf: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5623   5d94d3:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5627   5d94d7:	e9 f0 fe ff ff       	jmp    5d93cc <___bpf_prog_run+0x551c>
562c   5d94dc:	be 08 00 00 00       	mov    $0x8,%esi
5631   5d94e1:	4c 89 ff             	mov    %r15,%rdi
5634   5d94e4:	e8 00 00 00 00       	call   5d94e9 <___bpf_prog_run+0x5639>	5d94e5: R_X86_64_PLT32	__kasan_check_write-0x4
5639   5d94e9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
563d   5d94ed:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
5641   5d94f1:	f0 49 0f b1 37       	lock cmpxchg %rsi,(%r15)
5646   5d94f6:	4c 89 f2             	mov    %r14,%rdx
5649   5d94f9:	48 c1 ea 03          	shr    $0x3,%rdx
564d   5d94fd:	42 80 3c 2a 00       	cmpb   $0x0,(%rdx,%r13,1)
5652   5d9502:	0f 85 5c 1e 00 00    	jne    5db364 <___bpf_prog_run+0x74b4>
5658   5d9508:	49 89 06             	mov    %rax,(%r14)
565b   5d950b:	e9 8c f2 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
5660   5d9510:	be 08 00 00 00       	mov    $0x8,%esi
5665   5d9515:	4c 89 ff             	mov    %r15,%rdi
5668   5d9518:	e8 00 00 00 00       	call   5d951d <___bpf_prog_run+0x566d>	5d9519: R_X86_64_PLT32	__kasan_check_write-0x4
566d   5d951d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5671   5d9521:	f0 49 31 07          	lock xor %rax,(%r15)
5675   5d9525:	e9 72 f2 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
567a   5d952a:	be 08 00 00 00       	mov    $0x8,%esi
567f   5d952f:	4c 89 ff             	mov    %r15,%rdi
5682   5d9532:	e8 00 00 00 00       	call   5d9537 <___bpf_prog_run+0x5687>	5d9533: R_X86_64_PLT32	__kasan_check_write-0x4
5687   5d9537:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
568b   5d953b:	f0 49 21 07          	lock and %rax,(%r15)
568f   5d953f:	e9 58 f2 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
5694   5d9544:	be 08 00 00 00       	mov    $0x8,%esi
5699   5d9549:	4c 89 ff             	mov    %r15,%rdi
569c   5d954c:	e8 00 00 00 00       	call   5d9551 <___bpf_prog_run+0x56a1>	5d954d: R_X86_64_PLT32	__kasan_check_write-0x4
56a1   5d9551:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
56a5   5d9555:	f0 49 01 07          	lock add %rax,(%r15)
56a9   5d9559:	e9 3e f2 ff ff       	jmp    5d879c <___bpf_prog_run+0x48ec>
56ae   5d955e:	44 88 7d c0          	mov    %r15b,-0x40(%rbp)
56b2   5d9562:	e8 00 00 00 00       	call   5d9567 <___bpf_prog_run+0x56b7>	5d9563: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
56b7   5d9567:	49 63 d7             	movslq %r15d,%rdx
56ba   5d956a:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
56be   5d956e:	ff 24 d5 00 00 00 00 	jmp    *0x0(,%rdx,8)	5d9571: R_X86_64_32S	.rodata..c_jump_table
56c5   5d9575:	cc                   	int3
56c6   5d9576:	48 89 df             	mov    %rbx,%rdi
56c9   5d9579:	e8 00 00 00 00       	call   5d957e <___bpf_prog_run+0x56ce>	5d957a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
56ce   5d957e:	e9 8a a9 ff ff       	jmp    5d3f0d <___bpf_prog_run+0x5d>
56d3   5d9583:	e8 00 00 00 00       	call   5d9588 <___bpf_prog_run+0x56d8>	5d9584: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
56d8   5d9588:	e9 2e f8 ff ff       	jmp    5d8dbb <___bpf_prog_run+0x4f0b>
56dd   5d958d:	e8 00 00 00 00       	call   5d9592 <___bpf_prog_run+0x56e2>	5d958e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
56e2   5d9592:	e9 12 f7 ff ff       	jmp    5d8ca9 <___bpf_prog_run+0x4df9>
56e7   5d9597:	e8 00 00 00 00       	call   5d959c <___bpf_prog_run+0x56ec>	5d9598: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
56ec   5d959c:	e9 75 f7 ff ff       	jmp    5d8d16 <___bpf_prog_run+0x4e66>
56f1   5d95a1:	48 89 d7             	mov    %rdx,%rdi
56f4   5d95a4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
56f8   5d95a8:	e8 00 00 00 00       	call   5d95ad <___bpf_prog_run+0x56fd>	5d95a9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
56fd   5d95ad:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5701   5d95b1:	e9 0a f3 ff ff       	jmp    5d88c0 <___bpf_prog_run+0x4a10>
5706   5d95b6:	48 89 c7             	mov    %rax,%rdi
5709   5d95b9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
570d   5d95bd:	e8 00 00 00 00       	call   5d95c2 <___bpf_prog_run+0x5712>	5d95be: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5712   5d95c2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5716   5d95c6:	e9 17 f5 ff ff       	jmp    5d8ae2 <___bpf_prog_run+0x4c32>
571b   5d95cb:	e8 00 00 00 00       	call   5d95d0 <___bpf_prog_run+0x5720>	5d95cc: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5720   5d95d0:	e9 be f9 ff ff       	jmp    5d8f93 <___bpf_prog_run+0x50e3>
5725   5d95d5:	48 89 c7             	mov    %rax,%rdi
5728   5d95d8:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
572c   5d95dc:	e8 00 00 00 00       	call   5d95e1 <___bpf_prog_run+0x5731>	5d95dd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5731   5d95e1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
5735   5d95e5:	e9 7d f9 ff ff       	jmp    5d8f67 <___bpf_prog_run+0x50b7>
573a   5d95ea:	48 89 c7             	mov    %rax,%rdi
573d   5d95ed:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5741   5d95f1:	e8 00 00 00 00       	call   5d95f6 <___bpf_prog_run+0x5746>	5d95f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5746   5d95f6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
574a   5d95fa:	e9 44 f9 ff ff       	jmp    5d8f43 <___bpf_prog_run+0x5093>
574f   5d95ff:	4c 89 ff             	mov    %r15,%rdi
5752   5d9602:	e8 00 00 00 00       	call   5d9607 <___bpf_prog_run+0x5757>	5d9603: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5757   5d9607:	e9 17 f9 ff ff       	jmp    5d8f23 <___bpf_prog_run+0x5073>
575c   5d960c:	e8 00 00 00 00       	call   5d9611 <___bpf_prog_run+0x5761>	5d960d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5761   5d9611:	e9 1b ef ff ff       	jmp    5d8531 <___bpf_prog_run+0x4681>
5766   5d9616:	e8 00 00 00 00       	call   5d961b <___bpf_prog_run+0x576b>	5d9617: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
576b   5d961b:	e9 b5 f0 ff ff       	jmp    5d86d5 <___bpf_prog_run+0x4825>
5770   5d9620:	e8 00 00 00 00       	call   5d9625 <___bpf_prog_run+0x5775>	5d9621: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5775   5d9625:	e9 d2 f2 ff ff       	jmp    5d88fc <___bpf_prog_run+0x4a4c>
577a   5d962a:	4c 89 ff             	mov    %r15,%rdi
577d   5d962d:	e8 00 00 00 00       	call   5d9632 <___bpf_prog_run+0x5782>	5d962e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5782   5d9632:	e9 7c a9 ff ff       	jmp    5d3fb3 <___bpf_prog_run+0x103>
5787   5d9637:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
578b   5d963b:	e8 00 00 00 00       	call   5d9640 <___bpf_prog_run+0x5790>	5d963c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5790   5d9640:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5794   5d9644:	e9 78 df ff ff       	jmp    5d75c1 <___bpf_prog_run+0x3711>
5799   5d9649:	4c 89 ff             	mov    %r15,%rdi
579c   5d964c:	e8 00 00 00 00       	call   5d9651 <___bpf_prog_run+0x57a1>	5d964d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
57a1   5d9651:	e9 b8 ae ff ff       	jmp    5d450e <___bpf_prog_run+0x65e>
57a6   5d9656:	4c 89 ff             	mov    %r15,%rdi
57a9   5d9659:	e8 00 00 00 00       	call   5d965e <___bpf_prog_run+0x57ae>	5d965a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
57ae   5d965e:	e9 88 ae ff ff       	jmp    5d44eb <___bpf_prog_run+0x63b>
57b3   5d9663:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
57b7   5d9667:	e8 00 00 00 00       	call   5d966c <___bpf_prog_run+0x57bc>	5d9668: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57bc   5d966c:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
57c0   5d9670:	e9 3b ae ff ff       	jmp    5d44b0 <___bpf_prog_run+0x600>
57c5   5d9675:	e8 00 00 00 00       	call   5d967a <___bpf_prog_run+0x57ca>	5d9676: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57ca   5d967a:	e9 e2 ac ff ff       	jmp    5d4361 <___bpf_prog_run+0x4b1>
57cf   5d967f:	4c 89 ff             	mov    %r15,%rdi
57d2   5d9682:	e8 00 00 00 00       	call   5d9687 <___bpf_prog_run+0x57d7>	5d9683: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
57d7   5d9687:	e9 8e ad ff ff       	jmp    5d441a <___bpf_prog_run+0x56a>
57dc   5d968c:	e8 00 00 00 00       	call   5d9691 <___bpf_prog_run+0x57e1>	5d968d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57e1   5d9691:	e9 a1 f3 ff ff       	jmp    5d8a37 <___bpf_prog_run+0x4b87>
57e6   5d9696:	4c 89 ff             	mov    %r15,%rdi
57e9   5d9699:	e8 00 00 00 00       	call   5d969e <___bpf_prog_run+0x57ee>	5d969a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
57ee   5d969e:	e9 79 f2 ff ff       	jmp    5d891c <___bpf_prog_run+0x4a6c>
57f3   5d96a3:	e8 00 00 00 00       	call   5d96a8 <___bpf_prog_run+0x57f8>	5d96a4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
57f8   5d96a8:	e9 99 f1 ff ff       	jmp    5d8846 <___bpf_prog_run+0x4996>
57fd   5d96ad:	48 89 c7             	mov    %rax,%rdi
5800   5d96b0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5804   5d96b4:	e8 00 00 00 00       	call   5d96b9 <___bpf_prog_run+0x5809>	5d96b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5809   5d96b9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
580d   5d96bd:	e9 58 f1 ff ff       	jmp    5d881a <___bpf_prog_run+0x496a>
5812   5d96c2:	48 89 c7             	mov    %rax,%rdi
5815   5d96c5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5819   5d96c9:	e8 00 00 00 00       	call   5d96ce <___bpf_prog_run+0x581e>	5d96ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
581e   5d96ce:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5822   5d96d2:	e9 1f f1 ff ff       	jmp    5d87f6 <___bpf_prog_run+0x4946>
5827   5d96d7:	4c 89 f7             	mov    %r14,%rdi
582a   5d96da:	e8 00 00 00 00       	call   5d96df <___bpf_prog_run+0x582f>	5d96db: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
582f   5d96df:	e9 b5 f0 ff ff       	jmp    5d8799 <___bpf_prog_run+0x48e9>
5834   5d96e4:	e8 00 00 00 00       	call   5d96e9 <___bpf_prog_run+0x5839>	5d96e5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5839   5d96e9:	e9 6c f0 ff ff       	jmp    5d875a <___bpf_prog_run+0x48aa>
583e   5d96ee:	4c 89 ff             	mov    %r15,%rdi
5841   5d96f1:	e8 00 00 00 00       	call   5d96f6 <___bpf_prog_run+0x5846>	5d96f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5846   5d96f6:	e9 37 f0 ff ff       	jmp    5d8732 <___bpf_prog_run+0x4882>
584b   5d96fb:	4c 89 f7             	mov    %r14,%rdi
584e   5d96fe:	e8 00 00 00 00       	call   5d9703 <___bpf_prog_run+0x5853>	5d96ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5853   5d9703:	e9 06 f0 ff ff       	jmp    5d870e <___bpf_prog_run+0x485e>
5858   5d9708:	4c 89 ff             	mov    %r15,%rdi
585b   5d970b:	e8 00 00 00 00       	call   5d9710 <___bpf_prog_run+0x5860>	5d970c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5860   5d9710:	e9 e0 ef ff ff       	jmp    5d86f5 <___bpf_prog_run+0x4845>
5865   5d9715:	e8 00 00 00 00       	call   5d971a <___bpf_prog_run+0x586a>	5d9716: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
586a   5d971a:	e9 cd f6 ff ff       	jmp    5d8dec <___bpf_prog_run+0x4f3c>
586f   5d971f:	e8 00 00 00 00       	call   5d9724 <___bpf_prog_run+0x5874>	5d9720: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5874   5d9724:	e9 15 f7 ff ff       	jmp    5d8e3e <___bpf_prog_run+0x4f8e>
5879   5d9729:	e8 00 00 00 00       	call   5d972e <___bpf_prog_run+0x587e>	5d972a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
587e   5d972e:	e9 58 f7 ff ff       	jmp    5d8e8b <___bpf_prog_run+0x4fdb>
5883   5d9733:	e8 00 00 00 00       	call   5d9738 <___bpf_prog_run+0x5888>	5d9734: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5888   5d9738:	e9 13 f5 ff ff       	jmp    5d8c50 <___bpf_prog_run+0x4da0>
588d   5d973d:	e8 00 00 00 00       	call   5d9742 <___bpf_prog_run+0x5892>	5d973e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5892   5d9742:	e9 03 f6 ff ff       	jmp    5d8d4a <___bpf_prog_run+0x4e9a>
5897   5d9747:	e8 00 00 00 00       	call   5d974c <___bpf_prog_run+0x589c>	5d9748: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
589c   5d974c:	e9 2d f6 ff ff       	jmp    5d8d7e <___bpf_prog_run+0x4ece>
58a1   5d9751:	4c 89 ff             	mov    %r15,%rdi
58a4   5d9754:	e8 00 00 00 00       	call   5d9759 <___bpf_prog_run+0x58a9>	5d9755: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
58a9   5d9759:	e9 69 f2 ff ff       	jmp    5d89c7 <___bpf_prog_run+0x4b17>
58ae   5d975e:	e8 00 00 00 00       	call   5d9763 <___bpf_prog_run+0x58b3>	5d975f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
58b3   5d9763:	e9 90 ee ff ff       	jmp    5d85f8 <___bpf_prog_run+0x4748>
58b8   5d9768:	48 89 c7             	mov    %rax,%rdi
58bb   5d976b:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
58bf   5d976f:	e8 00 00 00 00       	call   5d9774 <___bpf_prog_run+0x58c4>	5d9770: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58c4   5d9774:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
58c8   5d9778:	e9 7a a8 ff ff       	jmp    5d3ff7 <___bpf_prog_run+0x147>
58cd   5d977d:	48 89 c7             	mov    %rax,%rdi
58d0   5d9780:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
58d4   5d9784:	e8 00 00 00 00       	call   5d9789 <___bpf_prog_run+0x58d9>	5d9785: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58d9   5d9789:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
58dd   5d978d:	e9 41 a8 ff ff       	jmp    5d3fd3 <___bpf_prog_run+0x123>
58e2   5d9792:	48 89 c7             	mov    %rax,%rdi
58e5   5d9795:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
58e9   5d9799:	e8 00 00 00 00       	call   5d979e <___bpf_prog_run+0x58ee>	5d979a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58ee   5d979e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
58f2   5d97a2:	e9 64 f2 ff ff       	jmp    5d8a0b <___bpf_prog_run+0x4b5b>
58f7   5d97a7:	48 89 c7             	mov    %rax,%rdi
58fa   5d97aa:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
58fe   5d97ae:	e8 00 00 00 00       	call   5d97b3 <___bpf_prog_run+0x5903>	5d97af: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5903   5d97b3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5907   5d97b7:	e9 2b f2 ff ff       	jmp    5d89e7 <___bpf_prog_run+0x4b37>
590c   5d97bc:	e8 00 00 00 00       	call   5d97c1 <___bpf_prog_run+0x5911>	5d97bd: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5911   5d97c1:	e9 a2 f1 ff ff       	jmp    5d8968 <___bpf_prog_run+0x4ab8>
5916   5d97c6:	4c 89 ff             	mov    %r15,%rdi
5919   5d97c9:	e8 00 00 00 00       	call   5d97ce <___bpf_prog_run+0x591e>	5d97ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
591e   5d97ce:	e9 6d f1 ff ff       	jmp    5d8940 <___bpf_prog_run+0x4a90>
5923   5d97d3:	4c 89 ff             	mov    %r15,%rdi
5926   5d97d6:	e8 00 00 00 00       	call   5d97db <___bpf_prog_run+0x592b>	5d97d7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
592b   5d97db:	e9 f6 ef ff ff       	jmp    5d87d6 <___bpf_prog_run+0x4926>
5930   5d97e0:	e8 00 00 00 00       	call   5d97e5 <___bpf_prog_run+0x5935>	5d97e1: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5935   5d97e5:	e9 39 a8 ff ff       	jmp    5d4023 <___bpf_prog_run+0x173>
593a   5d97ea:	4c 89 ff             	mov    %r15,%rdi
593d   5d97ed:	e8 00 00 00 00       	call   5d97f2 <___bpf_prog_run+0x5942>	5d97ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5942   5d97f2:	e9 7e ed ff ff       	jmp    5d8575 <___bpf_prog_run+0x46c5>
5947   5d97f7:	4c 89 ff             	mov    %r15,%rdi
594a   5d97fa:	e8 00 00 00 00       	call   5d97ff <___bpf_prog_run+0x594f>	5d97fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
594f   5d97ff:	e9 4d ed ff ff       	jmp    5d8551 <___bpf_prog_run+0x46a1>
5954   5d9804:	e8 00 00 00 00       	call   5d9809 <___bpf_prog_run+0x5959>	5d9805: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5959   5d9809:	e9 56 ee ff ff       	jmp    5d8664 <___bpf_prog_run+0x47b4>
595e   5d980e:	4c 89 ff             	mov    %r15,%rdi
5961   5d9811:	e8 00 00 00 00       	call   5d9816 <___bpf_prog_run+0x5966>	5d9812: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5966   5d9816:	e9 21 ee ff ff       	jmp    5d863c <___bpf_prog_run+0x478c>
596b   5d981b:	4c 89 ff             	mov    %r15,%rdi
596e   5d981e:	e8 00 00 00 00       	call   5d9823 <___bpf_prog_run+0x5973>	5d981f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5973   5d9823:	e9 f0 ed ff ff       	jmp    5d8618 <___bpf_prog_run+0x4768>
5978   5d9828:	e8 00 00 00 00       	call   5d982d <___bpf_prog_run+0x597d>	5d9829: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
597d   5d982d:	e9 6b ed ff ff       	jmp    5d859d <___bpf_prog_run+0x46ed>
5982   5d9832:	e8 00 00 00 00       	call   5d9837 <___bpf_prog_run+0x5987>	5d9833: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5987   5d9837:	e9 7c f8 ff ff       	jmp    5d90b8 <___bpf_prog_run+0x5208>
598c   5d983c:	48 89 c7             	mov    %rax,%rdi
598f   5d983f:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5993   5d9843:	e8 00 00 00 00       	call   5d9848 <___bpf_prog_run+0x5998>	5d9844: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5998   5d9848:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
599c   5d984c:	e9 3b f8 ff ff       	jmp    5d908c <___bpf_prog_run+0x51dc>
59a1   5d9851:	48 89 c7             	mov    %rax,%rdi
59a4   5d9854:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
59a8   5d9858:	e8 00 00 00 00       	call   5d985d <___bpf_prog_run+0x59ad>	5d9859: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59ad   5d985d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
59b1   5d9861:	e9 02 f8 ff ff       	jmp    5d9068 <___bpf_prog_run+0x51b8>
59b6   5d9866:	4c 89 ff             	mov    %r15,%rdi
59b9   5d9869:	e8 00 00 00 00       	call   5d986e <___bpf_prog_run+0x59be>	5d986a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
59be   5d986e:	e9 d5 f7 ff ff       	jmp    5d9048 <___bpf_prog_run+0x5198>
59c3   5d9873:	48 89 d7             	mov    %rdx,%rdi
59c6   5d9876:	e8 00 00 00 00       	call   5d987b <___bpf_prog_run+0x59cb>	5d9877: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59cb   5d987b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
59cf   5d987f:	e9 77 fb ff ff       	jmp    5d93fb <___bpf_prog_run+0x554b>
59d4   5d9884:	4c 89 ff             	mov    %r15,%rdi
59d7   5d9887:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
59db   5d988b:	e8 00 00 00 00       	call   5d9890 <___bpf_prog_run+0x59e0>	5d988c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
59e0   5d9890:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
59e4   5d9894:	e9 33 fb ff ff       	jmp    5d93cc <___bpf_prog_run+0x551c>
59e9   5d9899:	48 89 d7             	mov    %rdx,%rdi
59ec   5d989c:	e8 00 00 00 00       	call   5d98a1 <___bpf_prog_run+0x59f1>	5d989d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59f1   5d98a1:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
59f5   5d98a5:	e9 58 fa ff ff       	jmp    5d9302 <___bpf_prog_run+0x5452>
59fa   5d98aa:	4c 89 ff             	mov    %r15,%rdi
59fd   5d98ad:	e8 00 00 00 00       	call   5d98b2 <___bpf_prog_run+0x5a02>	5d98ae: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5a02   5d98b2:	e9 fe f9 ff ff       	jmp    5d92b5 <___bpf_prog_run+0x5405>
5a07   5d98b7:	48 89 d7             	mov    %rdx,%rdi
5a0a   5d98ba:	e8 00 00 00 00       	call   5d98bf <___bpf_prog_run+0x5a0f>	5d98bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a0f   5d98bf:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
5a13   5d98c3:	e9 96 f9 ff ff       	jmp    5d925e <___bpf_prog_run+0x53ae>
5a18   5d98c8:	e8 00 00 00 00       	call   5d98cd <___bpf_prog_run+0x5a1d>	5d98c9: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a1d   5d98cd:	e9 3a f9 ff ff       	jmp    5d920c <___bpf_prog_run+0x535c>
5a22   5d98d2:	4c 89 ff             	mov    %r15,%rdi
5a25   5d98d5:	e8 00 00 00 00       	call   5d98da <___bpf_prog_run+0x5a2a>	5d98d6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a2a   5d98da:	e9 05 f9 ff ff       	jmp    5d91e4 <___bpf_prog_run+0x5334>
5a2f   5d98df:	4c 89 ff             	mov    %r15,%rdi
5a32   5d98e2:	e8 00 00 00 00       	call   5d98e7 <___bpf_prog_run+0x5a37>	5d98e3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a37   5d98e7:	e9 d4 f8 ff ff       	jmp    5d91c0 <___bpf_prog_run+0x5310>
5a3c   5d98ec:	e8 00 00 00 00       	call   5d98f1 <___bpf_prog_run+0x5a41>	5d98ed: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5a41   5d98f1:	e9 aa f8 ff ff       	jmp    5d91a0 <___bpf_prog_run+0x52f0>
5a46   5d98f6:	e8 00 00 00 00       	call   5d98fb <___bpf_prog_run+0x5a4b>	5d98f7: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a4b   5d98fb:	e9 c8 e0 ff ff       	jmp    5d79c8 <___bpf_prog_run+0x3b18>
5a50   5d9900:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5a54   5d9904:	e8 00 00 00 00       	call   5d9909 <___bpf_prog_run+0x5a59>	5d9905: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a59   5d9909:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5a5d   5d990d:	e9 df aa ff ff       	jmp    5d43f1 <___bpf_prog_run+0x541>
5a62   5d9912:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5a66   5d9916:	89 45 c0             	mov    %eax,-0x40(%rbp)
5a69   5d9919:	e8 00 00 00 00       	call   5d991e <___bpf_prog_run+0x5a6e>	5d991a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a6e   5d991e:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5a72   5d9922:	48 63 45 c0          	movslq -0x40(%rbp),%rax
5a76   5d9926:	e9 f8 a8 ff ff       	jmp    5d4223 <___bpf_prog_run+0x373>
5a7b   5d992b:	89 45 c0             	mov    %eax,-0x40(%rbp)
5a7e   5d992e:	e8 00 00 00 00       	call   5d9933 <___bpf_prog_run+0x5a83>	5d992f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5a83   5d9933:	48 63 45 c0          	movslq -0x40(%rbp),%rax
5a87   5d9937:	e9 a2 a8 ff ff       	jmp    5d41de <___bpf_prog_run+0x32e>
5a8c   5d993c:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5a90   5d9940:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5a94   5d9944:	e8 00 00 00 00       	call   5d9949 <___bpf_prog_run+0x5a99>	5d9945: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5a99   5d9949:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5a9d   5d994d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5aa1   5d9951:	e9 66 a9 ff ff       	jmp    5d42bc <___bpf_prog_run+0x40c>
5aa6   5d9956:	e8 00 00 00 00       	call   5d995b <___bpf_prog_run+0x5aab>	5d9957: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5aab   5d995b:	e9 28 cb ff ff       	jmp    5d6488 <___bpf_prog_run+0x25d8>
5ab0   5d9960:	e8 00 00 00 00       	call   5d9965 <___bpf_prog_run+0x5ab5>	5d9961: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ab5   5d9965:	e9 ec ca ff ff       	jmp    5d6456 <___bpf_prog_run+0x25a6>
5aba   5d996a:	e8 00 00 00 00       	call   5d996f <___bpf_prog_run+0x5abf>	5d996b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5abf   5d996f:	e9 df c0 ff ff       	jmp    5d5a53 <___bpf_prog_run+0x1ba3>
5ac4   5d9974:	e8 00 00 00 00       	call   5d9979 <___bpf_prog_run+0x5ac9>	5d9975: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ac9   5d9979:	e9 a6 c0 ff ff       	jmp    5d5a24 <___bpf_prog_run+0x1b74>
5ace   5d997e:	e8 00 00 00 00       	call   5d9983 <___bpf_prog_run+0x5ad3>	5d997f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ad3   5d9983:	e9 c9 c5 ff ff       	jmp    5d5f51 <___bpf_prog_run+0x20a1>
5ad8   5d9988:	e8 00 00 00 00       	call   5d998d <___bpf_prog_run+0x5add>	5d9989: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5add   5d998d:	e9 9f bb ff ff       	jmp    5d5531 <___bpf_prog_run+0x1681>
5ae2   5d9992:	e8 00 00 00 00       	call   5d9997 <___bpf_prog_run+0x5ae7>	5d9993: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ae7   5d9997:	e9 4c c8 ff ff       	jmp    5d61e8 <___bpf_prog_run+0x2338>
5aec   5d999c:	e8 00 00 00 00       	call   5d99a1 <___bpf_prog_run+0x5af1>	5d999d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5af1   5d99a1:	e9 10 c8 ff ff       	jmp    5d61b6 <___bpf_prog_run+0x2306>
5af6   5d99a6:	e8 00 00 00 00       	call   5d99ab <___bpf_prog_run+0x5afb>	5d99a7: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5afb   5d99ab:	e9 0f be ff ff       	jmp    5d57bf <___bpf_prog_run+0x190f>
5b00   5d99b0:	e8 00 00 00 00       	call   5d99b5 <___bpf_prog_run+0x5b05>	5d99b1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b05   5d99b5:	e9 d6 bd ff ff       	jmp    5d5790 <___bpf_prog_run+0x18e0>
5b0a   5d99ba:	e8 00 00 00 00       	call   5d99bf <___bpf_prog_run+0x5b0f>	5d99bb: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b0f   5d99bf:	e9 11 c3 ff ff       	jmp    5d5cd5 <___bpf_prog_run+0x1e25>
5b14   5d99c4:	e8 00 00 00 00       	call   5d99c9 <___bpf_prog_run+0x5b19>	5d99c5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b19   5d99c9:	e9 e7 b8 ff ff       	jmp    5d52b5 <___bpf_prog_run+0x1405>
5b1e   5d99ce:	e8 00 00 00 00       	call   5d99d3 <___bpf_prog_run+0x5b23>	5d99cf: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b23   5d99d3:	e9 60 c9 ff ff       	jmp    5d6338 <___bpf_prog_run+0x2488>
5b28   5d99d8:	e8 00 00 00 00       	call   5d99dd <___bpf_prog_run+0x5b2d>	5d99d9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b2d   5d99dd:	e9 24 c9 ff ff       	jmp    5d6306 <___bpf_prog_run+0x2456>
5b32   5d99e2:	e8 00 00 00 00       	call   5d99e7 <___bpf_prog_run+0x5b37>	5d99e3: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b37   5d99e7:	e9 1d bf ff ff       	jmp    5d5909 <___bpf_prog_run+0x1a59>
5b3c   5d99ec:	e8 00 00 00 00       	call   5d99f1 <___bpf_prog_run+0x5b41>	5d99ed: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b41   5d99f1:	e9 e4 be ff ff       	jmp    5d58da <___bpf_prog_run+0x1a2a>
5b46   5d99f6:	e8 00 00 00 00       	call   5d99fb <___bpf_prog_run+0x5b4b>	5d99f7: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b4b   5d99fb:	e9 13 c4 ff ff       	jmp    5d5e13 <___bpf_prog_run+0x1f63>
5b50   5d9a00:	e8 00 00 00 00       	call   5d9a05 <___bpf_prog_run+0x5b55>	5d9a01: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b55   5d9a05:	e9 e9 b9 ff ff       	jmp    5d53f3 <___bpf_prog_run+0x1543>
5b5a   5d9a0a:	e8 00 00 00 00       	call   5d9a0f <___bpf_prog_run+0x5b5f>	5d9a0b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b5f   5d9a0f:	e9 84 c6 ff ff       	jmp    5d6098 <___bpf_prog_run+0x21e8>
5b64   5d9a14:	e8 00 00 00 00       	call   5d9a19 <___bpf_prog_run+0x5b69>	5d9a15: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b69   5d9a19:	e9 48 c6 ff ff       	jmp    5d6066 <___bpf_prog_run+0x21b6>
5b6e   5d9a1e:	e8 00 00 00 00       	call   5d9a23 <___bpf_prog_run+0x5b73>	5d9a1f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b73   5d9a23:	e9 4d bc ff ff       	jmp    5d5675 <___bpf_prog_run+0x17c5>
5b78   5d9a28:	e8 00 00 00 00       	call   5d9a2d <___bpf_prog_run+0x5b7d>	5d9a29: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5b7d   5d9a2d:	e9 14 bc ff ff       	jmp    5d5646 <___bpf_prog_run+0x1796>
5b82   5d9a32:	e8 00 00 00 00       	call   5d9a37 <___bpf_prog_run+0x5b87>	5d9a33: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b87   5d9a37:	e9 5b c1 ff ff       	jmp    5d5b97 <___bpf_prog_run+0x1ce7>
5b8c   5d9a3c:	e8 00 00 00 00       	call   5d9a41 <___bpf_prog_run+0x5b91>	5d9a3d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b91   5d9a41:	e9 31 b7 ff ff       	jmp    5d5177 <___bpf_prog_run+0x12c7>
5b96   5d9a46:	e8 00 00 00 00       	call   5d9a4b <___bpf_prog_run+0x5b9b>	5d9a47: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5b9b   5d9a4b:	e9 90 c9 ff ff       	jmp    5d63e0 <___bpf_prog_run+0x2530>
5ba0   5d9a50:	e8 00 00 00 00       	call   5d9a55 <___bpf_prog_run+0x5ba5>	5d9a51: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ba5   5d9a55:	e9 54 c9 ff ff       	jmp    5d63ae <___bpf_prog_run+0x24fe>
5baa   5d9a5a:	e8 00 00 00 00       	call   5d9a5f <___bpf_prog_run+0x5baf>	5d9a5b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5baf   5d9a5f:	e9 4a bf ff ff       	jmp    5d59ae <___bpf_prog_run+0x1afe>
5bb4   5d9a64:	e8 00 00 00 00       	call   5d9a69 <___bpf_prog_run+0x5bb9>	5d9a65: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bb9   5d9a69:	e9 11 bf ff ff       	jmp    5d597f <___bpf_prog_run+0x1acf>
5bbe   5d9a6e:	e8 00 00 00 00       	call   5d9a73 <___bpf_prog_run+0x5bc3>	5d9a6f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bc3   5d9a73:	e9 3a c4 ff ff       	jmp    5d5eb2 <___bpf_prog_run+0x2002>
5bc8   5d9a78:	e8 00 00 00 00       	call   5d9a7d <___bpf_prog_run+0x5bcd>	5d9a79: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bcd   5d9a7d:	e9 10 ba ff ff       	jmp    5d5492 <___bpf_prog_run+0x15e2>
5bd2   5d9a82:	e8 00 00 00 00       	call   5d9a87 <___bpf_prog_run+0x5bd7>	5d9a83: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5bd7   5d9a87:	e9 b4 c6 ff ff       	jmp    5d6140 <___bpf_prog_run+0x2290>
5bdc   5d9a8c:	e8 00 00 00 00       	call   5d9a91 <___bpf_prog_run+0x5be1>	5d9a8d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5be1   5d9a91:	e9 78 c6 ff ff       	jmp    5d610e <___bpf_prog_run+0x225e>
5be6   5d9a96:	e8 00 00 00 00       	call   5d9a9b <___bpf_prog_run+0x5beb>	5d9a97: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5beb   5d9a9b:	e9 7a bc ff ff       	jmp    5d571a <___bpf_prog_run+0x186a>
5bf0   5d9aa0:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5bf4   5d9aa4:	e8 00 00 00 00       	call   5d9aa9 <___bpf_prog_run+0x5bf9>	5d9aa5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bf9   5d9aa9:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5bfd   5d9aad:	e9 a7 db ff ff       	jmp    5d7659 <___bpf_prog_run+0x37a9>
5c02   5d9ab2:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5c06   5d9ab6:	e8 00 00 00 00       	call   5d9abb <___bpf_prog_run+0x5c0b>	5d9ab7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c0b   5d9abb:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5c0f   5d9abf:	e9 4e e4 ff ff       	jmp    5d7f12 <___bpf_prog_run+0x4062>
5c14   5d9ac4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5c18   5d9ac8:	e8 00 00 00 00       	call   5d9acd <___bpf_prog_run+0x5c1d>	5d9ac9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c1d   5d9acd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5c21   5d9ad1:	e9 6b d1 ff ff       	jmp    5d6c41 <___bpf_prog_run+0x2d91>
5c26   5d9ad6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5c2a   5d9ada:	e8 00 00 00 00       	call   5d9adf <___bpf_prog_run+0x5c2f>	5d9adb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c2f   5d9adf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5c33   5d9ae3:	e9 80 cd ff ff       	jmp    5d6868 <___bpf_prog_run+0x29b8>
5c38   5d9ae8:	4c 89 cf             	mov    %r9,%rdi
5c3b   5d9aeb:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
5c3f   5d9aef:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
5c43   5d9af3:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5c47   5d9af7:	e8 00 00 00 00       	call   5d9afc <___bpf_prog_run+0x5c4c>	5d9af8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c4c   5d9afc:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
5c50   5d9b00:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
5c54   5d9b04:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5c58   5d9b08:	e9 32 cf ff ff       	jmp    5d6a3f <___bpf_prog_run+0x2b8f>
5c5d   5d9b0d:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5c61   5d9b11:	e8 00 00 00 00       	call   5d9b16 <___bpf_prog_run+0x5c66>	5d9b12: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c66   5d9b16:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5c6a   5d9b1a:	e9 11 dd ff ff       	jmp    5d7830 <___bpf_prog_run+0x3980>
5c6f   5d9b1f:	4c 89 cf             	mov    %r9,%rdi
5c72   5d9b22:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
5c76   5d9b26:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
5c7a   5d9b2a:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5c7e   5d9b2e:	e8 00 00 00 00       	call   5d9b33 <___bpf_prog_run+0x5c83>	5d9b2f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5c83   5d9b33:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
5c87   5d9b37:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
5c8b   5d9b3b:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5c8f   5d9b3f:	e9 01 cb ff ff       	jmp    5d6645 <___bpf_prog_run+0x2795>
5c94   5d9b44:	4c 89 cf             	mov    %r9,%rdi
5c97   5d9b47:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5c9b   5d9b4b:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
5c9f   5d9b4f:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5ca3   5d9b53:	e8 00 00 00 00       	call   5d9b58 <___bpf_prog_run+0x5ca8>	5d9b54: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ca8   5d9b58:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
5cac   5d9b5c:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
5cb0   5d9b60:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5cb4   5d9b64:	e9 65 e8 ff ff       	jmp    5d83ce <___bpf_prog_run+0x451e>
5cb9   5d9b69:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5cbd   5d9b6d:	e8 00 00 00 00       	call   5d9b72 <___bpf_prog_run+0x5cc2>	5d9b6e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cc2   5d9b72:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5cc6   5d9b76:	e9 61 e2 ff ff       	jmp    5d7ddc <___bpf_prog_run+0x3f2c>
5ccb   5d9b7b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5ccf   5d9b7f:	e8 00 00 00 00       	call   5d9b84 <___bpf_prog_run+0x5cd4>	5d9b80: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cd4   5d9b84:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5cd8   5d9b88:	e9 f2 cf ff ff       	jmp    5d6b7f <___bpf_prog_run+0x2ccf>
5cdd   5d9b8d:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5ce1   5d9b91:	e8 00 00 00 00       	call   5d9b96 <___bpf_prog_run+0x5ce6>	5d9b92: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ce6   5d9b96:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5cea   5d9b9a:	e9 c1 dd ff ff       	jmp    5d7960 <___bpf_prog_run+0x3ab0>
5cef   5d9b9f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5cf3   5d9ba3:	e8 00 00 00 00       	call   5d9ba8 <___bpf_prog_run+0x5cf8>	5d9ba4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5cf8   5d9ba8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5cfc   5d9bac:	e9 9d cb ff ff       	jmp    5d674e <___bpf_prog_run+0x289e>
5d01   5d9bb1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d05   5d9bb5:	e8 00 00 00 00       	call   5d9bba <___bpf_prog_run+0x5d0a>	5d9bb6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d0a   5d9bba:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d0e   5d9bbe:	e9 26 e0 ff ff       	jmp    5d7be9 <___bpf_prog_run+0x3d39>
5d13   5d9bc3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d17   5d9bc7:	e8 00 00 00 00       	call   5d9bcc <___bpf_prog_run+0x5d1c>	5d9bc8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d1c   5d9bcc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d20   5d9bd0:	e9 80 cd ff ff       	jmp    5d6955 <___bpf_prog_run+0x2aa5>
5d25   5d9bd5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d29   5d9bd9:	e8 00 00 00 00       	call   5d9bde <___bpf_prog_run+0x5d2e>	5d9bda: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d2e   5d9bde:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d32   5d9be2:	e9 44 d1 ff ff       	jmp    5d6d2b <___bpf_prog_run+0x2e7b>
5d37   5d9be7:	e8 00 00 00 00       	call   5d9bec <___bpf_prog_run+0x5d3c>	5d9be8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d3c   5d9bec:	e9 0d c9 ff ff       	jmp    5d64fe <___bpf_prog_run+0x264e>
5d41   5d9bf1:	e8 00 00 00 00       	call   5d9bf6 <___bpf_prog_run+0x5d46>	5d9bf2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d46   5d9bf6:	e9 75 e2 ff ff       	jmp    5d7e70 <___bpf_prog_run+0x3fc0>
5d4b   5d9bfb:	e8 00 00 00 00       	call   5d9c00 <___bpf_prog_run+0x5d50>	5d9bfc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5d50   5d9c00:	e9 96 d0 ff ff       	jmp    5d6c9b <___bpf_prog_run+0x2deb>
5d55   5d9c05:	e8 00 00 00 00       	call   5d9c0a <___bpf_prog_run+0x5d5a>	5d9c06: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d5a   5d9c0a:	e9 5b e4 ff ff       	jmp    5d806a <___bpf_prog_run+0x41ba>
5d5f   5d9c0f:	e8 00 00 00 00       	call   5d9c14 <___bpf_prog_run+0x5d64>	5d9c10: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5d64   5d9c14:	e9 bf d4 ff ff       	jmp    5d70d8 <___bpf_prog_run+0x3228>
5d69   5d9c19:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5d6d   5d9c1d:	e8 00 00 00 00       	call   5d9c22 <___bpf_prog_run+0x5d72>	5d9c1e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5d72   5d9c22:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5d76   5d9c26:	e9 2b df ff ff       	jmp    5d7b56 <___bpf_prog_run+0x3ca6>
5d7b   5d9c2b:	e8 00 00 00 00       	call   5d9c30 <___bpf_prog_run+0x5d80>	5d9c2c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d80   5d9c30:	e9 f8 de ff ff       	jmp    5d7b2d <___bpf_prog_run+0x3c7d>
5d85   5d9c35:	4c 89 cf             	mov    %r9,%rdi
5d88   5d9c38:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
5d8c   5d9c3c:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
5d90   5d9c40:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
5d94   5d9c44:	e8 00 00 00 00       	call   5d9c49 <___bpf_prog_run+0x5d99>	5d9c45: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d99   5d9c49:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
5d9d   5d9c4d:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
5da1   5d9c51:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
5da5   5d9c55:	e9 ee e0 ff ff       	jmp    5d7d48 <___bpf_prog_run+0x3e98>
5daa   5d9c5a:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5dae   5d9c5e:	e8 00 00 00 00       	call   5d9c63 <___bpf_prog_run+0x5db3>	5d9c5f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5db3   5d9c63:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5db7   5d9c67:	e9 09 d2 ff ff       	jmp    5d6e75 <___bpf_prog_run+0x2fc5>
5dbc   5d9c6c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
5dc0   5d9c70:	e8 00 00 00 00       	call   5d9c75 <___bpf_prog_run+0x5dc5>	5d9c71: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dc5   5d9c75:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
5dc9   5d9c79:	e9 46 dc ff ff       	jmp    5d78c4 <___bpf_prog_run+0x3a14>
5dce   5d9c7e:	e8 00 00 00 00       	call   5d9c83 <___bpf_prog_run+0x5dd3>	5d9c7f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dd3   5d9c83:	e9 63 ba ff ff       	jmp    5d56eb <___bpf_prog_run+0x183b>
5dd8   5d9c88:	e8 00 00 00 00       	call   5d9c8d <___bpf_prog_run+0x5ddd>	5d9c89: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ddd   5d9c8d:	e9 a4 bf ff ff       	jmp    5d5c36 <___bpf_prog_run+0x1d86>
5de2   5d9c92:	e8 00 00 00 00       	call   5d9c97 <___bpf_prog_run+0x5de7>	5d9c93: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5de7   5d9c97:	e9 7a b5 ff ff       	jmp    5d5216 <___bpf_prog_run+0x1366>
5dec   5d9c9c:	e8 00 00 00 00       	call   5d9ca1 <___bpf_prog_run+0x5df1>	5d9c9d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5df1   5d9ca1:	e9 ea c5 ff ff       	jmp    5d6290 <___bpf_prog_run+0x23e0>
5df6   5d9ca6:	e8 00 00 00 00       	call   5d9cab <___bpf_prog_run+0x5dfb>	5d9ca7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dfb   5d9cab:	e9 ae c5 ff ff       	jmp    5d625e <___bpf_prog_run+0x23ae>
5e00   5d9cb0:	e8 00 00 00 00       	call   5d9cb5 <___bpf_prog_run+0x5e05>	5d9cb1: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e05   5d9cb5:	e9 aa bb ff ff       	jmp    5d5864 <___bpf_prog_run+0x19b4>
5e0a   5d9cba:	e8 00 00 00 00       	call   5d9cbf <___bpf_prog_run+0x5e0f>	5d9cbb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e0f   5d9cbf:	e9 71 bb ff ff       	jmp    5d5835 <___bpf_prog_run+0x1985>
5e14   5d9cc4:	e8 00 00 00 00       	call   5d9cc9 <___bpf_prog_run+0x5e19>	5d9cc5: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e19   5d9cc9:	e9 a6 c0 ff ff       	jmp    5d5d74 <___bpf_prog_run+0x1ec4>
5e1e   5d9cce:	e8 00 00 00 00       	call   5d9cd3 <___bpf_prog_run+0x5e23>	5d9ccf: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e23   5d9cd3:	e9 7c b6 ff ff       	jmp    5d5354 <___bpf_prog_run+0x14a4>
5e28   5d9cd8:	e8 00 00 00 00       	call   5d9cdd <___bpf_prog_run+0x5e2d>	5d9cd9: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e2d   5d9cdd:	e9 0e c3 ff ff       	jmp    5d5ff0 <___bpf_prog_run+0x2140>
5e32   5d9ce2:	e8 00 00 00 00       	call   5d9ce7 <___bpf_prog_run+0x5e37>	5d9ce3: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e37   5d9ce7:	e9 e4 b8 ff ff       	jmp    5d55d0 <___bpf_prog_run+0x1720>
5e3c   5d9cec:	e8 00 00 00 00       	call   5d9cf1 <___bpf_prog_run+0x5e41>	5d9ced: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e41   5d9cf1:	e9 d3 bd ff ff       	jmp    5d5ac9 <___bpf_prog_run+0x1c19>
5e46   5d9cf6:	e8 00 00 00 00       	call   5d9cfb <___bpf_prog_run+0x5e4b>	5d9cf7: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e4b   5d9cfb:	e9 d8 b3 ff ff       	jmp    5d50d8 <___bpf_prog_run+0x1228>
5e50   5d9d00:	e8 00 00 00 00       	call   5d9d05 <___bpf_prog_run+0x5e55>	5d9d01: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e55   5d9d05:	e9 9c b3 ff ff       	jmp    5d50a6 <___bpf_prog_run+0x11f6>
5e5a   5d9d0a:	e8 00 00 00 00       	call   5d9d0f <___bpf_prog_run+0x5e5f>	5d9d0b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e5f   5d9d0f:	e9 1c b3 ff ff       	jmp    5d5030 <___bpf_prog_run+0x1180>
5e64   5d9d14:	e8 00 00 00 00       	call   5d9d19 <___bpf_prog_run+0x5e69>	5d9d15: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e69   5d9d19:	e9 e0 b2 ff ff       	jmp    5d4ffe <___bpf_prog_run+0x114e>
5e6e   5d9d1e:	4c 89 ff             	mov    %r15,%rdi
5e71   5d9d21:	e8 00 00 00 00       	call   5d9d26 <___bpf_prog_run+0x5e76>	5d9d22: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5e76   5d9d26:	e9 97 ad ff ff       	jmp    5d4ac2 <___bpf_prog_run+0xc12>
5e7b   5d9d2b:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5e7f   5d9d2f:	e8 00 00 00 00       	call   5d9d34 <___bpf_prog_run+0x5e84>	5d9d30: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5e84   5d9d34:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5e88   5d9d38:	e9 5f ad ff ff       	jmp    5d4a9c <___bpf_prog_run+0xbec>
5e8d   5d9d3d:	4c 89 ff             	mov    %r15,%rdi
5e90   5d9d40:	89 55 c0             	mov    %edx,-0x40(%rbp)
5e93   5d9d43:	e8 00 00 00 00       	call   5d9d48 <___bpf_prog_run+0x5e98>	5d9d44: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
5e98   5d9d48:	8b 55 c0             	mov    -0x40(%rbp),%edx
5e9b   5d9d4b:	e9 d7 b0 ff ff       	jmp    5d4e27 <___bpf_prog_run+0xf77>
5ea0   5d9d50:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5ea4   5d9d54:	89 55 c0             	mov    %edx,-0x40(%rbp)
5ea7   5d9d57:	e8 00 00 00 00       	call   5d9d5c <___bpf_prog_run+0x5eac>	5d9d58: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5eac   5d9d5c:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5eb0   5d9d60:	8b 55 c0             	mov    -0x40(%rbp),%edx
5eb3   5d9d63:	e9 99 b0 ff ff       	jmp    5d4e01 <___bpf_prog_run+0xf51>
5eb8   5d9d68:	89 55 c0             	mov    %edx,-0x40(%rbp)
5ebb   5d9d6b:	e8 00 00 00 00       	call   5d9d70 <___bpf_prog_run+0x5ec0>	5d9d6c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ec0   5d9d70:	8b 55 c0             	mov    -0x40(%rbp),%edx
5ec3   5d9d73:	e9 44 b0 ff ff       	jmp    5d4dbc <___bpf_prog_run+0xf0c>
5ec8   5d9d78:	4c 89 ff             	mov    %r15,%rdi
5ecb   5d9d7b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5ecf   5d9d7f:	e8 00 00 00 00       	call   5d9d84 <___bpf_prog_run+0x5ed4>	5d9d80: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
5ed4   5d9d84:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5ed8   5d9d88:	e9 94 aa ff ff       	jmp    5d4821 <___bpf_prog_run+0x971>
5edd   5d9d8d:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5ee1   5d9d91:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5ee5   5d9d95:	e8 00 00 00 00       	call   5d9d9a <___bpf_prog_run+0x5eea>	5d9d96: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5eea   5d9d9a:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5eee   5d9d9e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5ef2   5d9da2:	e9 51 aa ff ff       	jmp    5d47f8 <___bpf_prog_run+0x948>
5ef7   5d9da7:	4c 89 ff             	mov    %r15,%rdi
5efa   5d9daa:	89 55 c0             	mov    %edx,-0x40(%rbp)
5efd   5d9dad:	e8 00 00 00 00       	call   5d9db2 <___bpf_prog_run+0x5f02>	5d9dae: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
5f02   5d9db2:	8b 55 c0             	mov    -0x40(%rbp),%edx
5f05   5d9db5:	e9 d0 b1 ff ff       	jmp    5d4f8a <___bpf_prog_run+0x10da>
5f0a   5d9dba:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5f0e   5d9dbe:	89 55 c0             	mov    %edx,-0x40(%rbp)
5f11   5d9dc1:	e8 00 00 00 00       	call   5d9dc6 <___bpf_prog_run+0x5f16>	5d9dc2: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f16   5d9dc6:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5f1a   5d9dca:	8b 55 c0             	mov    -0x40(%rbp),%edx
5f1d   5d9dcd:	e9 8f b1 ff ff       	jmp    5d4f61 <___bpf_prog_run+0x10b1>
5f22   5d9dd2:	89 55 c0             	mov    %edx,-0x40(%rbp)
5f25   5d9dd5:	e8 00 00 00 00       	call   5d9dda <___bpf_prog_run+0x5f2a>	5d9dd6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5f2a   5d9dda:	8b 55 c0             	mov    -0x40(%rbp),%edx
5f2d   5d9ddd:	e9 3a b1 ff ff       	jmp    5d4f1c <___bpf_prog_run+0x106c>
5f32   5d9de2:	4c 89 ff             	mov    %r15,%rdi
5f35   5d9de5:	e8 00 00 00 00       	call   5d9dea <___bpf_prog_run+0x5f3a>	5d9de6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f3a   5d9dea:	e9 71 ab ff ff       	jmp    5d4960 <___bpf_prog_run+0xab0>
5f3f   5d9def:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5f43   5d9df3:	e8 00 00 00 00       	call   5d9df8 <___bpf_prog_run+0x5f48>	5d9df4: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f48   5d9df8:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5f4c   5d9dfc:	e9 36 ab ff ff       	jmp    5d4937 <___bpf_prog_run+0xa87>
5f51   5d9e01:	4c 89 ff             	mov    %r15,%rdi
5f54   5d9e04:	e8 00 00 00 00       	call   5d9e09 <___bpf_prog_run+0x5f59>	5d9e05: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f59   5d9e09:	e9 4e ae ff ff       	jmp    5d4c5c <___bpf_prog_run+0xdac>
5f5e   5d9e0e:	4c 89 ff             	mov    %r15,%rdi
5f61   5d9e11:	e8 00 00 00 00       	call   5d9e16 <___bpf_prog_run+0x5f66>	5d9e12: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5f66   5d9e16:	e9 1e ae ff ff       	jmp    5d4c39 <___bpf_prog_run+0xd89>
5f6b   5d9e1b:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
5f6f   5d9e1f:	e8 00 00 00 00       	call   5d9e24 <___bpf_prog_run+0x5f74>	5d9e20: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f74   5d9e24:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
5f78   5d9e28:	e9 d1 ad ff ff       	jmp    5d4bfe <___bpf_prog_run+0xd4e>
5f7d   5d9e2d:	4c 89 ff             	mov    %r15,%rdi
5f80   5d9e30:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5f84   5d9e34:	e8 00 00 00 00       	call   5d9e39 <___bpf_prog_run+0x5f89>	5d9e35: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5f89   5d9e39:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5f8d   5d9e3d:	e9 64 a8 ff ff       	jmp    5d46a6 <___bpf_prog_run+0x7f6>
5f92   5d9e42:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5f96   5d9e46:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
5f9a   5d9e4a:	e8 00 00 00 00       	call   5d9e4f <___bpf_prog_run+0x5f9f>	5d9e4b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f9f   5d9e4f:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5fa3   5d9e53:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
5fa7   5d9e57:	e9 21 a8 ff ff       	jmp    5d467d <___bpf_prog_run+0x7cd>
5fac   5d9e5c:	e8 00 00 00 00       	call   5d9e61 <___bpf_prog_run+0x5fb1>	5d9e5d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fb1   5d9e61:	e9 5d b0 ff ff       	jmp    5d4ec3 <___bpf_prog_run+0x1013>
5fb6   5d9e66:	e8 00 00 00 00       	call   5d9e6b <___bpf_prog_run+0x5fbb>	5d9e67: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fbb   5d9e6b:	e9 4e aa ff ff       	jmp    5d48be <___bpf_prog_run+0xa0e>
5fc0   5d9e70:	e8 00 00 00 00       	call   5d9e75 <___bpf_prog_run+0x5fc5>	5d9e71: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5fc5   5d9e75:	e9 0b ad ff ff       	jmp    5d4b85 <___bpf_prog_run+0xcd5>
5fca   5d9e7a:	e8 00 00 00 00       	call   5d9e7f <___bpf_prog_run+0x5fcf>	5d9e7b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5fcf   5d9e7f:	e9 d2 ac ff ff       	jmp    5d4b56 <___bpf_prog_run+0xca6>
5fd4   5d9e84:	4c 89 ff             	mov    %r15,%rdi
5fd7   5d9e87:	89 55 c0             	mov    %edx,-0x40(%rbp)
5fda   5d9e8a:	e8 00 00 00 00       	call   5d9e8f <___bpf_prog_run+0x5fdf>	5d9e8b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
5fdf   5d9e8f:	8b 55 c0             	mov    -0x40(%rbp),%edx
5fe2   5d9e92:	e9 50 a7 ff ff       	jmp    5d45e7 <___bpf_prog_run+0x737>
5fe7   5d9e97:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
5feb   5d9e9b:	89 55 c0             	mov    %edx,-0x40(%rbp)
5fee   5d9e9e:	e8 00 00 00 00       	call   5d9ea3 <___bpf_prog_run+0x5ff3>	5d9e9f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5ff3   5d9ea3:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
5ff7   5d9ea7:	8b 55 c0             	mov    -0x40(%rbp),%edx
5ffa   5d9eaa:	e9 0f a7 ff ff       	jmp    5d45be <___bpf_prog_run+0x70e>
5fff   5d9eaf:	89 55 c0             	mov    %edx,-0x40(%rbp)
6002   5d9eb2:	e8 00 00 00 00       	call   5d9eb7 <___bpf_prog_run+0x6007>	5d9eb3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6007   5d9eb7:	8b 55 c0             	mov    -0x40(%rbp),%edx
600a   5d9eba:	e9 ba a6 ff ff       	jmp    5d4579 <___bpf_prog_run+0x6c9>
600f   5d9ebf:	4c 89 ff             	mov    %r15,%rdi
6012   5d9ec2:	e8 00 00 00 00       	call   5d9ec7 <___bpf_prog_run+0x6017>	5d9ec3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6017   5d9ec7:	e9 84 ae ff ff       	jmp    5d4d50 <___bpf_prog_run+0xea0>
601c   5d9ecc:	4c 89 ff             	mov    %r15,%rdi
601f   5d9ecf:	e8 00 00 00 00       	call   5d9ed4 <___bpf_prog_run+0x6024>	5d9ed0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6024   5d9ed4:	e9 56 ae ff ff       	jmp    5d4d2f <___bpf_prog_run+0xe7f>
6029   5d9ed9:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
602d   5d9edd:	e8 00 00 00 00       	call   5d9ee2 <___bpf_prog_run+0x6032>	5d9ede: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6032   5d9ee2:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6036   5d9ee6:	e9 09 ae ff ff       	jmp    5d4cf4 <___bpf_prog_run+0xe44>
603b   5d9eeb:	e8 00 00 00 00       	call   5d9ef0 <___bpf_prog_run+0x6040>	5d9eec: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6040   5d9ef0:	e9 2e ab ff ff       	jmp    5d4a23 <___bpf_prog_run+0xb73>
6045   5d9ef5:	e8 00 00 00 00       	call   5d9efa <___bpf_prog_run+0x604a>	5d9ef6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
604a   5d9efa:	e9 f5 aa ff ff       	jmp    5d49f4 <___bpf_prog_run+0xb44>
604f   5d9eff:	4c 89 ff             	mov    %r15,%rdi
6052   5d9f02:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6056   5d9f06:	e8 00 00 00 00       	call   5d9f0b <___bpf_prog_run+0x605b>	5d9f07: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
605b   5d9f0b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
605f   5d9f0f:	e9 4e a8 ff ff       	jmp    5d4762 <___bpf_prog_run+0x8b2>
6064   5d9f14:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
6068   5d9f18:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
606c   5d9f1c:	e8 00 00 00 00       	call   5d9f21 <___bpf_prog_run+0x6071>	5d9f1d: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6071   5d9f21:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
6075   5d9f25:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6079   5d9f29:	e9 0e a8 ff ff       	jmp    5d473c <___bpf_prog_run+0x88c>
607e   5d9f2e:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6082   5d9f32:	e8 00 00 00 00       	call   5d9f37 <___bpf_prog_run+0x6087>	5d9f33: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6087   5d9f37:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
608b   5d9f3b:	e9 0d a2 ff ff       	jmp    5d414d <___bpf_prog_run+0x29d>
6090   5d9f40:	4c 89 cf             	mov    %r9,%rdi
6093   5d9f43:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
6097   5d9f47:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
609b   5d9f4b:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
609f   5d9f4f:	e8 00 00 00 00       	call   5d9f54 <___bpf_prog_run+0x60a4>	5d9f50: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60a4   5d9f54:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
60a8   5d9f58:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
60ac   5d9f5c:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
60b0   5d9f60:	e9 1e d4 ff ff       	jmp    5d7383 <___bpf_prog_run+0x34d3>
60b5   5d9f65:	e8 00 00 00 00       	call   5d9f6a <___bpf_prog_run+0x60ba>	5d9f66: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60ba   5d9f6a:	e9 32 ce ff ff       	jmp    5d6da1 <___bpf_prog_run+0x2ef1>
60bf   5d9f6f:	4c 89 cf             	mov    %r9,%rdi
60c2   5d9f72:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
60c6   5d9f76:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
60ca   5d9f7a:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
60ce   5d9f7e:	e8 00 00 00 00       	call   5d9f83 <___bpf_prog_run+0x60d3>	5d9f7f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60d3   5d9f83:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
60d7   5d9f87:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
60db   5d9f8b:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
60df   5d9f8f:	e9 5b d3 ff ff       	jmp    5d72ef <___bpf_prog_run+0x343f>
60e4   5d9f94:	e8 00 00 00 00       	call   5d9f99 <___bpf_prog_run+0x60e9>	5d9f95: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
60e9   5d9f99:	e9 34 e5 ff ff       	jmp    5d84d2 <___bpf_prog_run+0x4622>
60ee   5d9f9e:	e8 00 00 00 00       	call   5d9fa3 <___bpf_prog_run+0x60f3>	5d9f9f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
60f3   5d9fa3:	e9 74 e4 ff ff       	jmp    5d841c <___bpf_prog_run+0x456c>
60f8   5d9fa8:	4c 89 c7             	mov    %r8,%rdi
60fb   5d9fab:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
60ff   5d9faf:	e8 00 00 00 00       	call   5d9fb4 <___bpf_prog_run+0x6104>	5d9fb0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6104   5d9fb4:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6108   5d9fb8:	e9 cc e3 ff ff       	jmp    5d8389 <___bpf_prog_run+0x44d9>
610d   5d9fbd:	e8 00 00 00 00       	call   5d9fc2 <___bpf_prog_run+0x6112>	5d9fbe: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6112   5d9fc2:	e9 91 e3 ff ff       	jmp    5d8358 <___bpf_prog_run+0x44a8>
6117   5d9fc7:	e8 00 00 00 00       	call   5d9fcc <___bpf_prog_run+0x611c>	5d9fc8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
611c   5d9fcc:	e9 18 e3 ff ff       	jmp    5d82e9 <___bpf_prog_run+0x4439>
6121   5d9fd1:	e8 00 00 00 00       	call   5d9fd6 <___bpf_prog_run+0x6126>	5d9fd2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6126   5d9fd6:	e9 9d e2 ff ff       	jmp    5d8278 <___bpf_prog_run+0x43c8>
612b   5d9fdb:	e8 00 00 00 00       	call   5d9fe0 <___bpf_prog_run+0x6130>	5d9fdc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6130   5d9fe0:	e9 53 e2 ff ff       	jmp    5d8238 <___bpf_prog_run+0x4388>
6135   5d9fe5:	e8 00 00 00 00       	call   5d9fea <___bpf_prog_run+0x613a>	5d9fe6: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
613a   5d9fea:	e9 d5 e1 ff ff       	jmp    5d81c4 <___bpf_prog_run+0x4314>
613f   5d9fef:	e8 00 00 00 00       	call   5d9ff4 <___bpf_prog_run+0x6144>	5d9ff0: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6144   5d9ff4:	e9 1a e1 ff ff       	jmp    5d8113 <___bpf_prog_run+0x4263>
6149   5d9ff9:	e8 00 00 00 00       	call   5d9ffe <___bpf_prog_run+0x614e>	5d9ffa: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
614e   5d9ffe:	e9 9f e0 ff ff       	jmp    5d80a2 <___bpf_prog_run+0x41f2>
6153   5da003:	e8 00 00 00 00       	call   5da008 <___bpf_prog_run+0x6158>	5da004: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6158   5da008:	e9 18 e0 ff ff       	jmp    5d8025 <___bpf_prog_run+0x4175>
615d   5da00d:	e8 00 00 00 00       	call   5da012 <___bpf_prog_run+0x6162>	5da00e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6162   5da012:	e9 9d df ff ff       	jmp    5d7fb4 <___bpf_prog_run+0x4104>
6167   5da017:	e8 00 00 00 00       	call   5da01c <___bpf_prog_run+0x616c>	5da018: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
616c   5da01c:	e9 26 df ff ff       	jmp    5d7f47 <___bpf_prog_run+0x4097>
6171   5da021:	e8 00 00 00 00       	call   5da026 <___bpf_prog_run+0x6176>	5da022: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6176   5da026:	e9 a2 de ff ff       	jmp    5d7ecd <___bpf_prog_run+0x401d>
617b   5da02b:	e8 00 00 00 00       	call   5da030 <___bpf_prog_run+0x6180>	5da02c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6180   5da030:	e9 dc dd ff ff       	jmp    5d7e11 <___bpf_prog_run+0x3f61>
6185   5da035:	e8 00 00 00 00       	call   5da03a <___bpf_prog_run+0x618a>	5da036: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
618a   5da03a:	e9 58 dd ff ff       	jmp    5d7d97 <___bpf_prog_run+0x3ee7>
618f   5da03f:	4c 89 c7             	mov    %r8,%rdi
6192   5da042:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6196   5da046:	e8 00 00 00 00       	call   5da04b <___bpf_prog_run+0x619b>	5da047: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
619b   5da04b:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
619f   5da04f:	e9 af dc ff ff       	jmp    5d7d03 <___bpf_prog_run+0x3e53>
61a4   5da054:	e8 00 00 00 00       	call   5da059 <___bpf_prog_run+0x61a9>	5da055: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61a9   5da059:	e9 34 dc ff ff       	jmp    5d7c92 <___bpf_prog_run+0x3de2>
61ae   5da05e:	e8 00 00 00 00       	call   5da063 <___bpf_prog_run+0x61b3>	5da05f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61b3   5da063:	e9 b6 db ff ff       	jmp    5d7c1e <___bpf_prog_run+0x3d6e>
61b8   5da068:	e8 00 00 00 00       	call   5da06d <___bpf_prog_run+0x61bd>	5da069: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61bd   5da06d:	e9 32 db ff ff       	jmp    5d7ba4 <___bpf_prog_run+0x3cf4>
61c2   5da072:	e8 00 00 00 00       	call   5da077 <___bpf_prog_run+0x61c7>	5da073: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
61c7   5da077:	e9 88 da ff ff       	jmp    5d7b04 <___bpf_prog_run+0x3c54>
61cc   5da07c:	e8 00 00 00 00       	call   5da081 <___bpf_prog_run+0x61d1>	5da07d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61d1   5da081:	e9 09 da ff ff       	jmp    5d7a8f <___bpf_prog_run+0x3bdf>
61d6   5da086:	e8 00 00 00 00       	call   5da08b <___bpf_prog_run+0x61db>	5da087: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
61db   5da08b:	e9 08 d9 ff ff       	jmp    5d7998 <___bpf_prog_run+0x3ae8>
61e0   5da090:	e8 00 00 00 00       	call   5da095 <___bpf_prog_run+0x61e5>	5da091: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61e5   5da095:	e9 81 d8 ff ff       	jmp    5d791b <___bpf_prog_run+0x3a6b>
61ea   5da09a:	e8 00 00 00 00       	call   5da09f <___bpf_prog_run+0x61ef>	5da09b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61ef   5da09f:	e9 c1 d7 ff ff       	jmp    5d7865 <___bpf_prog_run+0x39b5>
61f4   5da0a4:	e8 00 00 00 00       	call   5da0a9 <___bpf_prog_run+0x61f9>	5da0a5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
61f9   5da0a9:	e9 3d d7 ff ff       	jmp    5d77eb <___bpf_prog_run+0x393b>
61fe   5da0ae:	e8 00 00 00 00       	call   5da0b3 <___bpf_prog_run+0x6203>	5da0af: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6203   5da0b3:	e9 94 d6 ff ff       	jmp    5d774c <___bpf_prog_run+0x389c>
6208   5da0b8:	e8 00 00 00 00       	call   5da0bd <___bpf_prog_run+0x620d>	5da0b9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
620d   5da0bd:	e9 18 d6 ff ff       	jmp    5d76da <___bpf_prog_run+0x382a>
6212   5da0c2:	e8 00 00 00 00       	call   5da0c7 <___bpf_prog_run+0x6217>	5da0c3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6217   5da0c7:	e9 c3 d5 ff ff       	jmp    5d768f <___bpf_prog_run+0x37df>
621c   5da0cc:	e8 00 00 00 00       	call   5da0d1 <___bpf_prog_run+0x6221>	5da0cd: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6221   5da0d1:	e9 3e d5 ff ff       	jmp    5d7614 <___bpf_prog_run+0x3764>
6226   5da0d6:	e8 00 00 00 00       	call   5da0db <___bpf_prog_run+0x622b>	5da0d7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
622b   5da0db:	e9 bb d4 ff ff       	jmp    5d759b <___bpf_prog_run+0x36eb>
6230   5da0e0:	e8 00 00 00 00       	call   5da0e5 <___bpf_prog_run+0x6235>	5da0e1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6235   5da0e5:	e9 3c d4 ff ff       	jmp    5d7526 <___bpf_prog_run+0x3676>
623a   5da0ea:	e8 00 00 00 00       	call   5da0ef <___bpf_prog_run+0x623f>	5da0eb: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
623f   5da0ef:	e9 c1 d3 ff ff       	jmp    5d74b5 <___bpf_prog_run+0x3605>
6244   5da0f4:	e8 00 00 00 00       	call   5da0f9 <___bpf_prog_run+0x6249>	5da0f5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6249   5da0f9:	e9 45 d3 ff ff       	jmp    5d7443 <___bpf_prog_run+0x3593>
624e   5da0fe:	e8 00 00 00 00       	call   5da103 <___bpf_prog_run+0x6253>	5da0ff: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6253   5da103:	e9 ca d2 ff ff       	jmp    5d73d2 <___bpf_prog_run+0x3522>
6258   5da108:	4c 89 c7             	mov    %r8,%rdi
625b   5da10b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
625f   5da10f:	e8 00 00 00 00       	call   5da114 <___bpf_prog_run+0x6264>	5da110: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6264   5da114:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6268   5da118:	e9 21 d2 ff ff       	jmp    5d733e <___bpf_prog_run+0x348e>
626d   5da11d:	4c 89 c7             	mov    %r8,%rdi
6270   5da120:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6274   5da124:	e8 00 00 00 00       	call   5da129 <___bpf_prog_run+0x6279>	5da125: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6279   5da129:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
627d   5da12d:	e9 78 d1 ff ff       	jmp    5d72aa <___bpf_prog_run+0x33fa>
6282   5da132:	e8 00 00 00 00       	call   5da137 <___bpf_prog_run+0x6287>	5da133: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6287   5da137:	e9 fd d0 ff ff       	jmp    5d7239 <___bpf_prog_run+0x3389>
628c   5da13c:	e8 00 00 00 00       	call   5da141 <___bpf_prog_run+0x6291>	5da13d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6291   5da141:	e9 7d d0 ff ff       	jmp    5d71c3 <___bpf_prog_run+0x3313>
6296   5da146:	e8 00 00 00 00       	call   5da14b <___bpf_prog_run+0x629b>	5da147: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
629b   5da14b:	e9 d3 cf ff ff       	jmp    5d7123 <___bpf_prog_run+0x3273>
62a0   5da150:	e8 00 00 00 00       	call   5da155 <___bpf_prog_run+0x62a5>	5da151: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62a5   5da155:	e9 58 cf ff ff       	jmp    5d70b2 <___bpf_prog_run+0x3202>
62aa   5da15a:	e8 00 00 00 00       	call   5da15f <___bpf_prog_run+0x62af>	5da15b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62af   5da15f:	e9 d8 ce ff ff       	jmp    5d703c <___bpf_prog_run+0x318c>
62b4   5da164:	e8 00 00 00 00       	call   5da169 <___bpf_prog_run+0x62b9>	5da165: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62b9   5da169:	e9 06 ce ff ff       	jmp    5d6f74 <___bpf_prog_run+0x30c4>
62be   5da16e:	e8 00 00 00 00       	call   5da173 <___bpf_prog_run+0x62c3>	5da16f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62c3   5da173:	e9 87 cd ff ff       	jmp    5d6eff <___bpf_prog_run+0x304f>
62c8   5da178:	e8 00 00 00 00       	call   5da17d <___bpf_prog_run+0x62cd>	5da179: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62cd   5da17d:	e9 cd cc ff ff       	jmp    5d6e4f <___bpf_prog_run+0x2f9f>
62d2   5da182:	e8 00 00 00 00       	call   5da187 <___bpf_prog_run+0x62d7>	5da183: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62d7   5da187:	e9 4a cc ff ff       	jmp    5d6dd6 <___bpf_prog_run+0x2f26>
62dc   5da18c:	e8 00 00 00 00       	call   5da191 <___bpf_prog_run+0x62e1>	5da18d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62e1   5da191:	e9 c6 cb ff ff       	jmp    5d6d5c <___bpf_prog_run+0x2eac>
62e6   5da196:	e8 00 00 00 00       	call   5da19b <___bpf_prog_run+0x62eb>	5da197: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62eb   5da19b:	e9 46 cb ff ff       	jmp    5d6ce6 <___bpf_prog_run+0x2e36>
62f0   5da1a0:	e8 00 00 00 00       	call   5da1a5 <___bpf_prog_run+0x62f5>	5da1a1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
62f5   5da1a5:	e9 cb ca ff ff       	jmp    5d6c75 <___bpf_prog_run+0x2dc5>
62fa   5da1aa:	e8 00 00 00 00       	call   5da1af <___bpf_prog_run+0x62ff>	5da1ab: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
62ff   5da1af:	e9 48 ca ff ff       	jmp    5d6bfc <___bpf_prog_run+0x2d4c>
6304   5da1b4:	e8 00 00 00 00       	call   5da1b9 <___bpf_prog_run+0x6309>	5da1b5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6309   5da1b9:	e9 f5 c9 ff ff       	jmp    5d6bb3 <___bpf_prog_run+0x2d03>
630e   5da1be:	e8 00 00 00 00       	call   5da1c3 <___bpf_prog_run+0x6313>	5da1bf: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6313   5da1c3:	e9 72 c9 ff ff       	jmp    5d6b3a <___bpf_prog_run+0x2c8a>
6318   5da1c8:	e8 00 00 00 00       	call   5da1cd <___bpf_prog_run+0x631d>	5da1c9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
631d   5da1cd:	e9 bb c8 ff ff       	jmp    5d6a8d <___bpf_prog_run+0x2bdd>
6322   5da1d2:	4c 89 c7             	mov    %r8,%rdi
6325   5da1d5:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6329   5da1d9:	e8 00 00 00 00       	call   5da1de <___bpf_prog_run+0x632e>	5da1da: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
632e   5da1de:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6332   5da1e2:	e9 13 c8 ff ff       	jmp    5d69fa <___bpf_prog_run+0x2b4a>
6337   5da1e7:	e8 00 00 00 00       	call   5da1ec <___bpf_prog_run+0x633c>	5da1e8: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
633c   5da1ec:	e9 95 c7 ff ff       	jmp    5d6986 <___bpf_prog_run+0x2ad6>
6341   5da1f1:	e8 00 00 00 00       	call   5da1f6 <___bpf_prog_run+0x6346>	5da1f2: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6346   5da1f6:	e9 15 c7 ff ff       	jmp    5d6910 <___bpf_prog_run+0x2a60>
634b   5da1fb:	e8 00 00 00 00       	call   5da200 <___bpf_prog_run+0x6350>	5da1fc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6350   5da200:	e9 95 c6 ff ff       	jmp    5d689a <___bpf_prog_run+0x29ea>
6355   5da205:	e8 00 00 00 00       	call   5da20a <___bpf_prog_run+0x635a>	5da206: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
635a   5da20a:	e9 14 c6 ff ff       	jmp    5d6823 <___bpf_prog_run+0x2973>
635f   5da20f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6363   5da213:	e8 00 00 00 00       	call   5da218 <___bpf_prog_run+0x6368>	5da214: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6368   5da218:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
636c   5da21c:	e9 8a c5 ff ff       	jmp    5d67ab <___bpf_prog_run+0x28fb>
6371   5da221:	e8 00 00 00 00       	call   5da226 <___bpf_prog_run+0x6376>	5da222: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6376   5da226:	e9 de c4 ff ff       	jmp    5d6709 <___bpf_prog_run+0x2859>
637b   5da22b:	e8 00 00 00 00       	call   5da230 <___bpf_prog_run+0x6380>	5da22c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6380   5da230:	e9 5e c4 ff ff       	jmp    5d6693 <___bpf_prog_run+0x27e3>
6385   5da235:	4c 89 c7             	mov    %r8,%rdi
6388   5da238:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
638c   5da23c:	e8 00 00 00 00       	call   5da241 <___bpf_prog_run+0x6391>	5da23d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6391   5da241:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6395   5da245:	e9 b6 c3 ff ff       	jmp    5d6600 <___bpf_prog_run+0x2750>
639a   5da24a:	e8 00 00 00 00       	call   5da24f <___bpf_prog_run+0x639f>	5da24b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
639f   5da24f:	e9 0d c3 ff ff       	jmp    5d6561 <___bpf_prog_run+0x26b1>
63a4   5da254:	e8 00 00 00 00       	call   5da259 <___bpf_prog_run+0x63a9>	5da255: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63a9   5da259:	e9 5b c2 ff ff       	jmp    5d64b9 <___bpf_prog_run+0x2609>
63ae   5da25e:	e8 00 00 00 00       	call   5da263 <___bpf_prog_run+0x63b3>	5da25f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63b3   5da263:	e9 a9 c1 ff ff       	jmp    5d6411 <___bpf_prog_run+0x2561>
63b8   5da268:	e8 00 00 00 00       	call   5da26d <___bpf_prog_run+0x63bd>	5da269: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63bd   5da26d:	e9 f7 c0 ff ff       	jmp    5d6369 <___bpf_prog_run+0x24b9>
63c2   5da272:	e8 00 00 00 00       	call   5da277 <___bpf_prog_run+0x63c7>	5da273: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63c7   5da277:	e9 45 c0 ff ff       	jmp    5d62c1 <___bpf_prog_run+0x2411>
63cc   5da27c:	e8 00 00 00 00       	call   5da281 <___bpf_prog_run+0x63d1>	5da27d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63d1   5da281:	e9 93 bf ff ff       	jmp    5d6219 <___bpf_prog_run+0x2369>
63d6   5da286:	e8 00 00 00 00       	call   5da28b <___bpf_prog_run+0x63db>	5da287: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63db   5da28b:	e9 e1 be ff ff       	jmp    5d6171 <___bpf_prog_run+0x22c1>
63e0   5da290:	e8 00 00 00 00       	call   5da295 <___bpf_prog_run+0x63e5>	5da291: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63e5   5da295:	e9 2f be ff ff       	jmp    5d60c9 <___bpf_prog_run+0x2219>
63ea   5da29a:	e8 00 00 00 00       	call   5da29f <___bpf_prog_run+0x63ef>	5da29b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63ef   5da29f:	e9 7d bd ff ff       	jmp    5d6021 <___bpf_prog_run+0x2171>
63f4   5da2a4:	e8 00 00 00 00       	call   5da2a9 <___bpf_prog_run+0x63f9>	5da2a5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
63f9   5da2a9:	e9 d4 bc ff ff       	jmp    5d5f82 <___bpf_prog_run+0x20d2>
63fe   5da2ae:	e8 00 00 00 00       	call   5da2b3 <___bpf_prog_run+0x6403>	5da2af: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6403   5da2b3:	e9 2b bc ff ff       	jmp    5d5ee3 <___bpf_prog_run+0x2033>
6408   5da2b8:	e8 00 00 00 00       	call   5da2bd <___bpf_prog_run+0x640d>	5da2b9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
640d   5da2bd:	e9 82 bb ff ff       	jmp    5d5e44 <___bpf_prog_run+0x1f94>
6412   5da2c2:	e8 00 00 00 00       	call   5da2c7 <___bpf_prog_run+0x6417>	5da2c3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6417   5da2c7:	e9 d9 ba ff ff       	jmp    5d5da5 <___bpf_prog_run+0x1ef5>
641c   5da2cc:	e8 00 00 00 00       	call   5da2d1 <___bpf_prog_run+0x6421>	5da2cd: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6421   5da2d1:	e9 30 ba ff ff       	jmp    5d5d06 <___bpf_prog_run+0x1e56>
6426   5da2d6:	e8 00 00 00 00       	call   5da2db <___bpf_prog_run+0x642b>	5da2d7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
642b   5da2db:	e9 87 b9 ff ff       	jmp    5d5c67 <___bpf_prog_run+0x1db7>
6430   5da2e0:	e8 00 00 00 00       	call   5da2e5 <___bpf_prog_run+0x6435>	5da2e1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6435   5da2e5:	e9 de b8 ff ff       	jmp    5d5bc8 <___bpf_prog_run+0x1d18>
643a   5da2ea:	e8 00 00 00 00       	call   5da2ef <___bpf_prog_run+0x643f>	5da2eb: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
643f   5da2ef:	e9 35 b8 ff ff       	jmp    5d5b29 <___bpf_prog_run+0x1c79>
6444   5da2f4:	e8 00 00 00 00       	call   5da2f9 <___bpf_prog_run+0x6449>	5da2f5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6449   5da2f9:	e9 86 b7 ff ff       	jmp    5d5a84 <___bpf_prog_run+0x1bd4>
644e   5da2fe:	e8 00 00 00 00       	call   5da303 <___bpf_prog_run+0x6453>	5da2ff: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6453   5da303:	e9 d7 b6 ff ff       	jmp    5d59df <___bpf_prog_run+0x1b2f>
6458   5da308:	e8 00 00 00 00       	call   5da30d <___bpf_prog_run+0x645d>	5da309: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
645d   5da30d:	e9 28 b6 ff ff       	jmp    5d593a <___bpf_prog_run+0x1a8a>
6462   5da312:	e8 00 00 00 00       	call   5da317 <___bpf_prog_run+0x6467>	5da313: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6467   5da317:	e9 79 b5 ff ff       	jmp    5d5895 <___bpf_prog_run+0x19e5>
646c   5da31c:	e8 00 00 00 00       	call   5da321 <___bpf_prog_run+0x6471>	5da31d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6471   5da321:	e9 ca b4 ff ff       	jmp    5d57f0 <___bpf_prog_run+0x1940>
6476   5da326:	e8 00 00 00 00       	call   5da32b <___bpf_prog_run+0x647b>	5da327: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
647b   5da32b:	e9 1b b4 ff ff       	jmp    5d574b <___bpf_prog_run+0x189b>
6480   5da330:	e8 00 00 00 00       	call   5da335 <___bpf_prog_run+0x6485>	5da331: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6485   5da335:	e9 6c b3 ff ff       	jmp    5d56a6 <___bpf_prog_run+0x17f6>
648a   5da33a:	e8 00 00 00 00       	call   5da33f <___bpf_prog_run+0x648f>	5da33b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
648f   5da33f:	e9 bd b2 ff ff       	jmp    5d5601 <___bpf_prog_run+0x1751>
6494   5da344:	e8 00 00 00 00       	call   5da349 <___bpf_prog_run+0x6499>	5da345: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6499   5da349:	e9 14 b2 ff ff       	jmp    5d5562 <___bpf_prog_run+0x16b2>
649e   5da34e:	e8 00 00 00 00       	call   5da353 <___bpf_prog_run+0x64a3>	5da34f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64a3   5da353:	e9 6b b1 ff ff       	jmp    5d54c3 <___bpf_prog_run+0x1613>
64a8   5da358:	e8 00 00 00 00       	call   5da35d <___bpf_prog_run+0x64ad>	5da359: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64ad   5da35d:	e9 c2 b0 ff ff       	jmp    5d5424 <___bpf_prog_run+0x1574>
64b2   5da362:	e8 00 00 00 00       	call   5da367 <___bpf_prog_run+0x64b7>	5da363: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64b7   5da367:	e9 19 b0 ff ff       	jmp    5d5385 <___bpf_prog_run+0x14d5>
64bc   5da36c:	e8 00 00 00 00       	call   5da371 <___bpf_prog_run+0x64c1>	5da36d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64c1   5da371:	e9 70 af ff ff       	jmp    5d52e6 <___bpf_prog_run+0x1436>
64c6   5da376:	e8 00 00 00 00       	call   5da37b <___bpf_prog_run+0x64cb>	5da377: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64cb   5da37b:	e9 c7 ae ff ff       	jmp    5d5247 <___bpf_prog_run+0x1397>
64d0   5da380:	e8 00 00 00 00       	call   5da385 <___bpf_prog_run+0x64d5>	5da381: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64d5   5da385:	e9 1e ae ff ff       	jmp    5d51a8 <___bpf_prog_run+0x12f8>
64da   5da38a:	e8 00 00 00 00       	call   5da38f <___bpf_prog_run+0x64df>	5da38b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64df   5da38f:	e9 75 ad ff ff       	jmp    5d5109 <___bpf_prog_run+0x1259>
64e4   5da394:	e8 00 00 00 00       	call   5da399 <___bpf_prog_run+0x64e9>	5da395: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64e9   5da399:	e9 c3 ac ff ff       	jmp    5d5061 <___bpf_prog_run+0x11b1>
64ee   5da39e:	e8 00 00 00 00       	call   5da3a3 <___bpf_prog_run+0x64f3>	5da39f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
64f3   5da3a3:	e9 11 ac ff ff       	jmp    5d4fb9 <___bpf_prog_run+0x1109>
64f8   5da3a8:	e8 00 00 00 00       	call   5da3ad <___bpf_prog_run+0x64fd>	5da3a9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
64fd   5da3ad:	e9 45 ab ff ff       	jmp    5d4ef7 <___bpf_prog_run+0x1047>
6502   5da3b2:	e8 00 00 00 00       	call   5da3b7 <___bpf_prog_run+0x6507>	5da3b3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6507   5da3b7:	e9 99 aa ff ff       	jmp    5d4e55 <___bpf_prog_run+0xfa5>
650c   5da3bc:	e8 00 00 00 00       	call   5da3c1 <___bpf_prog_run+0x6511>	5da3bd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6511   5da3c1:	e9 d1 a9 ff ff       	jmp    5d4d97 <___bpf_prog_run+0xee7>
6516   5da3c6:	4c 89 ff             	mov    %r15,%rdi
6519   5da3c9:	e8 00 00 00 00       	call   5da3ce <___bpf_prog_run+0x651e>	5da3ca: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
651e   5da3ce:	e9 d9 a8 ff ff       	jmp    5d4cac <___bpf_prog_run+0xdfc>
6523   5da3d3:	4c 89 ff             	mov    %r15,%rdi
6526   5da3d6:	e8 00 00 00 00       	call   5da3db <___bpf_prog_run+0x652b>	5da3d7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
652b   5da3db:	e9 d6 a7 ff ff       	jmp    5d4bb6 <___bpf_prog_run+0xd06>
6530   5da3e0:	e8 00 00 00 00       	call   5da3e5 <___bpf_prog_run+0x6535>	5da3e1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6535   5da3e5:	e9 27 a7 ff ff       	jmp    5d4b11 <___bpf_prog_run+0xc61>
653a   5da3ea:	e8 00 00 00 00       	call   5da3ef <___bpf_prog_run+0x653f>	5da3eb: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
653f   5da3ef:	e9 60 a6 ff ff       	jmp    5d4a54 <___bpf_prog_run+0xba4>
6544   5da3f4:	e8 00 00 00 00       	call   5da3f9 <___bpf_prog_run+0x6549>	5da3f5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6549   5da3f9:	e9 b1 a5 ff ff       	jmp    5d49af <___bpf_prog_run+0xaff>
654e   5da3fe:	e8 00 00 00 00       	call   5da403 <___bpf_prog_run+0x6553>	5da3ff: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6553   5da403:	e9 e7 a4 ff ff       	jmp    5d48ef <___bpf_prog_run+0xa3f>
6558   5da408:	e8 00 00 00 00       	call   5da40d <___bpf_prog_run+0x655d>	5da409: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
655d   5da40d:	e9 3e a4 ff ff       	jmp    5d4850 <___bpf_prog_run+0x9a0>
6562   5da412:	e8 00 00 00 00       	call   5da417 <___bpf_prog_run+0x6567>	5da413: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6567   5da417:	e9 74 a3 ff ff       	jmp    5d4790 <___bpf_prog_run+0x8e0>
656c   5da41c:	e8 00 00 00 00       	call   5da421 <___bpf_prog_run+0x6571>	5da41d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6571   5da421:	e9 ae a2 ff ff       	jmp    5d46d4 <___bpf_prog_run+0x824>
6576   5da426:	e8 00 00 00 00       	call   5da42b <___bpf_prog_run+0x657b>	5da427: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
657b   5da42b:	e9 e5 a1 ff ff       	jmp    5d4615 <___bpf_prog_run+0x765>
6580   5da430:	e8 00 00 00 00       	call   5da435 <___bpf_prog_run+0x6585>	5da431: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6585   5da435:	e9 1a a1 ff ff       	jmp    5d4554 <___bpf_prog_run+0x6a4>
658a   5da43a:	4c 89 ff             	mov    %r15,%rdi
658d   5da43d:	e8 00 00 00 00       	call   5da442 <___bpf_prog_run+0x6592>	5da43e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6592   5da442:	e9 21 a0 ff ff       	jmp    5d4468 <___bpf_prog_run+0x5b8>
6597   5da447:	e8 00 00 00 00       	call   5da44c <___bpf_prog_run+0x659c>	5da448: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
659c   5da44c:	e9 58 9f ff ff       	jmp    5d43a9 <___bpf_prog_run+0x4f9>
65a1   5da451:	e8 00 00 00 00       	call   5da456 <___bpf_prog_run+0x65a6>	5da452: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
65a6   5da456:	e9 be 9e ff ff       	jmp    5d4319 <___bpf_prog_run+0x469>
65ab   5da45b:	e8 00 00 00 00       	call   5da460 <___bpf_prog_run+0x65b0>	5da45c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
65b0   5da460:	e9 06 9e ff ff       	jmp    5d426b <___bpf_prog_run+0x3bb>
65b5   5da465:	e8 00 00 00 00       	call   5da46a <___bpf_prog_run+0x65ba>	5da466: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
65ba   5da46a:	e9 49 9d ff ff       	jmp    5d41b8 <___bpf_prog_run+0x308>
65bf   5da46f:	e8 00 00 00 00       	call   5da474 <___bpf_prog_run+0x65c4>	5da470: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
65c4   5da474:	e9 56 c1 ff ff       	jmp    5d65cf <___bpf_prog_run+0x271f>
65c9   5da479:	e8 00 00 00 00       	call   5da47e <___bpf_prog_run+0x65ce>	5da47a: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
65ce   5da47e:	e9 37 d3 ff ff       	jmp    5d77ba <___bpf_prog_run+0x390a>
65d3   5da483:	4c 89 ff             	mov    %r15,%rdi
65d6   5da486:	e8 00 00 00 00       	call   5da48b <___bpf_prog_run+0x65db>	5da487: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
65db   5da48b:	e9 79 e9 ff ff       	jmp    5d8e09 <___bpf_prog_run+0x4f59>
65e0   5da490:	4c 89 ff             	mov    %r15,%rdi
65e3   5da493:	e8 00 00 00 00       	call   5da498 <___bpf_prog_run+0x65e8>	5da494: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
65e8   5da498:	e9 0b ea ff ff       	jmp    5d8ea8 <___bpf_prog_run+0x4ff8>
65ed   5da49d:	48 89 c7             	mov    %rax,%rdi
65f0   5da4a0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
65f4   5da4a4:	e8 00 00 00 00       	call   5da4a9 <___bpf_prog_run+0x65f9>	5da4a5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
65f9   5da4a9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
65fd   5da4ad:	e9 ed d9 ff ff       	jmp    5d7e9f <___bpf_prog_run+0x3fef>
6602   5da4b2:	4c 89 ff             	mov    %r15,%rdi
6605   5da4b5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6609   5da4b9:	e8 00 00 00 00       	call   5da4be <___bpf_prog_run+0x660e>	5da4ba: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
660e   5da4be:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6612   5da4c2:	e9 4e cf ff ff       	jmp    5d7415 <___bpf_prog_run+0x3565>
6617   5da4c7:	4c 89 ff             	mov    %r15,%rdi
661a   5da4ca:	e8 00 00 00 00       	call   5da4cf <___bpf_prog_run+0x661f>	5da4cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
661f   5da4cf:	e9 1e cf ff ff       	jmp    5d73f2 <___bpf_prog_run+0x3542>
6624   5da4d4:	4c 89 ff             	mov    %r15,%rdi
6627   5da4d7:	e8 00 00 00 00       	call   5da4dc <___bpf_prog_run+0x662c>	5da4d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
662c   5da4dc:	e9 22 c8 ff ff       	jmp    5d6d03 <___bpf_prog_run+0x2e53>
6631   5da4e1:	4c 89 ff             	mov    %r15,%rdi
6634   5da4e4:	e8 00 00 00 00       	call   5da4e9 <___bpf_prog_run+0x6639>	5da4e5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6639   5da4e9:	e9 e8 bf ff ff       	jmp    5d64d6 <___bpf_prog_run+0x2626>
663e   5da4ee:	48 89 c7             	mov    %rax,%rdi
6641   5da4f1:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6645   5da4f5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6649   5da4f9:	e8 00 00 00 00       	call   5da4fe <___bpf_prog_run+0x664e>	5da4fa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
664e   5da4fe:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6652   5da502:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6656   5da506:	e9 58 cc ff ff       	jmp    5d7163 <___bpf_prog_run+0x32b3>
665b   5da50b:	4c 89 ff             	mov    %r15,%rdi
665e   5da50e:	e8 00 00 00 00       	call   5da513 <___bpf_prog_run+0x6663>	5da50f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6663   5da513:	e9 28 cc ff ff       	jmp    5d7140 <___bpf_prog_run+0x3290>
6668   5da518:	48 89 c7             	mov    %rax,%rdi
666b   5da51b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
666f   5da51f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6673   5da523:	e8 00 00 00 00       	call   5da528 <___bpf_prog_run+0x6678>	5da524: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6678   5da528:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
667c   5da52c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6680   5da530:	e9 e5 d1 ff ff       	jmp    5d771a <___bpf_prog_run+0x386a>
6685   5da535:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6689   5da539:	e8 00 00 00 00       	call   5da53e <___bpf_prog_run+0x668e>	5da53a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
668e   5da53e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6692   5da542:	e9 3b c2 ff ff       	jmp    5d6782 <___bpf_prog_run+0x28d2>
6697   5da547:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
669b   5da54b:	e8 00 00 00 00       	call   5da550 <___bpf_prog_run+0x66a0>	5da54c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66a0   5da550:	e9 13 c2 ff ff       	jmp    5d6768 <___bpf_prog_run+0x28b8>
66a5   5da555:	4c 89 ff             	mov    %r15,%rdi
66a8   5da558:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
66ac   5da55c:	e8 00 00 00 00       	call   5da561 <___bpf_prog_run+0x66b1>	5da55d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
66b1   5da561:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
66b5   5da565:	e9 b9 9f ff ff       	jmp    5d4523 <___bpf_prog_run+0x673>
66ba   5da56a:	4c 89 ff             	mov    %r15,%rdi
66bd   5da56d:	e8 00 00 00 00       	call   5da572 <___bpf_prog_run+0x66c2>	5da56e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66c2   5da572:	e9 35 d1 ff ff       	jmp    5d76ac <___bpf_prog_run+0x37fc>
66c7   5da577:	e8 00 00 00 00       	call   5da57c <___bpf_prog_run+0x66cc>	5da578: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66cc   5da57c:	e9 77 b5 ff ff       	jmp    5d5af8 <___bpf_prog_run+0x1c48>
66d1   5da581:	e8 00 00 00 00       	call   5da586 <___bpf_prog_run+0x66d6>	5da582: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
66d6   5da586:	e9 a5 bf ff ff       	jmp    5d6530 <___bpf_prog_run+0x2680>
66db   5da58b:	4c 89 ff             	mov    %r15,%rdi
66de   5da58e:	e8 00 00 00 00       	call   5da593 <___bpf_prog_run+0x66e3>	5da58f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66e3   5da593:	e9 c3 e8 ff ff       	jmp    5d8e5b <___bpf_prog_run+0x4fab>
66e8   5da598:	e8 00 00 00 00       	call   5da59d <___bpf_prog_run+0x66ed>	5da599: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
66ed   5da59d:	e9 63 9b ff ff       	jmp    5d4105 <___bpf_prog_run+0x255>
66f2   5da5a2:	4c 89 ff             	mov    %r15,%rdi
66f5   5da5a5:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
66f9   5da5a9:	e8 00 00 00 00       	call   5da5ae <___bpf_prog_run+0x66fe>	5da5aa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
66fe   5da5ae:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6702   5da5b2:	e9 1c c1 ff ff       	jmp    5d66d3 <___bpf_prog_run+0x2823>
6707   5da5b7:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
670b   5da5bb:	e8 00 00 00 00       	call   5da5c0 <___bpf_prog_run+0x6710>	5da5bc: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6710   5da5c0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6714   5da5c4:	e9 d2 d2 ff ff       	jmp    5d789b <___bpf_prog_run+0x39eb>
6719   5da5c9:	4c 89 ff             	mov    %r15,%rdi
671c   5da5cc:	e8 00 00 00 00       	call   5da5d1 <___bpf_prog_run+0x6721>	5da5cd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6721   5da5d1:	e9 ed b0 ff ff       	jmp    5d56c3 <___bpf_prog_run+0x1813>
6726   5da5d6:	4c 89 f7             	mov    %r14,%rdi
6729   5da5d9:	e8 00 00 00 00       	call   5da5de <___bpf_prog_run+0x672e>	5da5da: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
672e   5da5de:	e9 7e d4 ff ff       	jmp    5d7a61 <___bpf_prog_run+0x3bb1>
6733   5da5e3:	4c 89 ff             	mov    %r15,%rdi
6736   5da5e6:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
673a   5da5ea:	e8 00 00 00 00       	call   5da5ef <___bpf_prog_run+0x673f>	5da5eb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
673f   5da5ef:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6743   5da5f3:	e9 cf cc ff ff       	jmp    5d72c7 <___bpf_prog_run+0x3417>
6748   5da5f8:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
674c   5da5fc:	e8 00 00 00 00       	call   5da601 <___bpf_prog_run+0x6751>	5da5fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6751   5da601:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6755   5da605:	e9 a5 c9 ff ff       	jmp    5d6faf <___bpf_prog_run+0x30ff>
675a   5da60a:	e8 00 00 00 00       	call   5da60f <___bpf_prog_run+0x675f>	5da60b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
675f   5da60f:	e9 81 c9 ff ff       	jmp    5d6f95 <___bpf_prog_run+0x30e5>
6764   5da614:	48 89 c7             	mov    %rax,%rdi
6767   5da617:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
676b   5da61b:	e8 00 00 00 00       	call   5da620 <___bpf_prog_run+0x6770>	5da61c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6770   5da620:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6774   5da624:	e9 7b de ff ff       	jmp    5d84a4 <___bpf_prog_run+0x45f4>
6779   5da629:	48 89 c7             	mov    %rax,%rdi
677c   5da62c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6780   5da630:	e8 00 00 00 00       	call   5da635 <___bpf_prog_run+0x6785>	5da631: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6785   5da635:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6789   5da639:	e9 38 de ff ff       	jmp    5d8476 <___bpf_prog_run+0x45c6>
678e   5da63e:	e8 00 00 00 00       	call   5da643 <___bpf_prog_run+0x6793>	5da63f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6793   5da643:	e9 0a de ff ff       	jmp    5d8452 <___bpf_prog_run+0x45a2>
6798   5da648:	4c 89 ff             	mov    %r15,%rdi
679b   5da64b:	e8 00 00 00 00       	call   5da650 <___bpf_prog_run+0x67a0>	5da64c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67a0   5da650:	e9 e4 dd ff ff       	jmp    5d8439 <___bpf_prog_run+0x4589>
67a5   5da655:	4c 89 ff             	mov    %r15,%rdi
67a8   5da658:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
67ac   5da65c:	e8 00 00 00 00       	call   5da661 <___bpf_prog_run+0x67b1>	5da65d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67b1   5da661:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
67b5   5da665:	e9 fa ad ff ff       	jmp    5d5464 <___bpf_prog_run+0x15b4>
67ba   5da66a:	4c 89 ff             	mov    %r15,%rdi
67bd   5da66d:	e8 00 00 00 00       	call   5da672 <___bpf_prog_run+0x67c2>	5da66e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67c2   5da672:	e9 ca ad ff ff       	jmp    5d5441 <___bpf_prog_run+0x1591>
67c7   5da677:	4c 89 ff             	mov    %r15,%rdi
67ca   5da67a:	e8 00 00 00 00       	call   5da67f <___bpf_prog_run+0x67cf>	5da67b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67cf   5da67f:	e9 d3 b2 ff ff       	jmp    5d5957 <___bpf_prog_run+0x1aa7>
67d4   5da684:	4c 89 ff             	mov    %r15,%rdi
67d7   5da687:	e8 00 00 00 00       	call   5da68c <___bpf_prog_run+0x67dc>	5da688: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67dc   5da68c:	e9 55 ba ff ff       	jmp    5d60e6 <___bpf_prog_run+0x2236>
67e1   5da691:	4c 89 ff             	mov    %r15,%rdi
67e4   5da694:	e8 00 00 00 00       	call   5da699 <___bpf_prog_run+0x67e9>	5da695: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67e9   5da699:	e9 80 af ff ff       	jmp    5d561e <___bpf_prog_run+0x176e>
67ee   5da69e:	4c 89 ff             	mov    %r15,%rdi
67f1   5da6a1:	e8 00 00 00 00       	call   5da6a6 <___bpf_prog_run+0x67f6>	5da6a2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
67f6   5da6a6:	e9 db bc ff ff       	jmp    5d6386 <___bpf_prog_run+0x24d6>
67fb   5da6ab:	4c 89 ff             	mov    %r15,%rdi
67fe   5da6ae:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6802   5da6b2:	e8 00 00 00 00       	call   5da6b7 <___bpf_prog_run+0x6807>	5da6b3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6807   5da6b7:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
680b   5da6bb:	e9 c4 b7 ff ff       	jmp    5d5e84 <___bpf_prog_run+0x1fd4>
6810   5da6c0:	4c 89 ff             	mov    %r15,%rdi
6813   5da6c3:	e8 00 00 00 00       	call   5da6c8 <___bpf_prog_run+0x6818>	5da6c4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6818   5da6c8:	e9 94 b7 ff ff       	jmp    5d5e61 <___bpf_prog_run+0x1fb1>
681d   5da6cd:	4c 89 ff             	mov    %r15,%rdi
6820   5da6d0:	e8 00 00 00 00       	call   5da6d5 <___bpf_prog_run+0x6825>	5da6d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6825   5da6d5:	e9 57 cf ff ff       	jmp    5d7631 <___bpf_prog_run+0x3781>
682a   5da6da:	4c 89 ff             	mov    %r15,%rdi
682d   5da6dd:	e8 00 00 00 00       	call   5da6e2 <___bpf_prog_run+0x6832>	5da6de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6832   5da6e2:	e9 03 d8 ff ff       	jmp    5d7eea <___bpf_prog_run+0x403a>
6837   5da6e7:	48 89 c7             	mov    %rax,%rdi
683a   5da6ea:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
683e   5da6ee:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6842   5da6f2:	e8 00 00 00 00       	call   5da6f7 <___bpf_prog_run+0x6847>	5da6f3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6847   5da6f7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
684b   5da6fb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
684f   5da6ff:	e9 b4 db ff ff       	jmp    5d82b8 <___bpf_prog_run+0x4408>
6854   5da704:	4c 89 ff             	mov    %r15,%rdi
6857   5da707:	e8 00 00 00 00       	call   5da70c <___bpf_prog_run+0x685c>	5da708: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
685c   5da70c:	e9 84 db ff ff       	jmp    5d8295 <___bpf_prog_run+0x43e5>
6861   5da711:	48 89 c7             	mov    %rax,%rdi
6864   5da714:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6868   5da718:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
686c   5da71c:	e8 00 00 00 00       	call   5da721 <___bpf_prog_run+0x6871>	5da71d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6871   5da721:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6875   5da725:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6879   5da729:	e9 a4 d5 ff ff       	jmp    5d7cd2 <___bpf_prog_run+0x3e22>
687e   5da72e:	4c 89 ff             	mov    %r15,%rdi
6881   5da731:	e8 00 00 00 00       	call   5da736 <___bpf_prog_run+0x6886>	5da732: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6886   5da736:	e9 74 d5 ff ff       	jmp    5d7caf <___bpf_prog_run+0x3dff>
688b   5da73b:	4c 89 ff             	mov    %r15,%rdi
688e   5da73e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6892   5da742:	e8 00 00 00 00       	call   5da747 <___bpf_prog_run+0x6897>	5da743: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6897   5da747:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
689b   5da74b:	e9 0f c3 ff ff       	jmp    5d6a5f <___bpf_prog_run+0x2baf>
68a0   5da750:	4c 89 ff             	mov    %r15,%rdi
68a3   5da753:	e8 00 00 00 00       	call   5da758 <___bpf_prog_run+0x68a8>	5da754: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68a8   5da758:	e9 bc c4 ff ff       	jmp    5d6c19 <___bpf_prog_run+0x2d69>
68ad   5da75d:	4c 89 ff             	mov    %r15,%rdi
68b0   5da760:	e8 00 00 00 00       	call   5da765 <___bpf_prog_run+0x68b5>	5da761: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68b5   5da765:	e9 d6 c0 ff ff       	jmp    5d6840 <___bpf_prog_run+0x2990>
68ba   5da76a:	48 89 c7             	mov    %rax,%rdi
68bd   5da76d:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
68c1   5da771:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
68c5   5da775:	e8 00 00 00 00       	call   5da77a <___bpf_prog_run+0x68ca>	5da776: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68ca   5da77a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
68ce   5da77e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
68d2   5da782:	e9 fc cc ff ff       	jmp    5d7483 <___bpf_prog_run+0x35d3>
68d7   5da787:	4c 89 ff             	mov    %r15,%rdi
68da   5da78a:	e8 00 00 00 00       	call   5da78f <___bpf_prog_run+0x68df>	5da78b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68df   5da78f:	e9 cc cc ff ff       	jmp    5d7460 <___bpf_prog_run+0x35b0>
68e4   5da794:	48 89 c7             	mov    %rax,%rdi
68e7   5da797:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
68eb   5da79b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
68ef   5da79f:	e8 00 00 00 00       	call   5da7a4 <___bpf_prog_run+0x68f4>	5da7a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
68f4   5da7a4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
68f8   5da7a8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
68fc   5da7ac:	e9 cb c8 ff ff       	jmp    5d707c <___bpf_prog_run+0x31cc>
6901   5da7b1:	4c 89 ff             	mov    %r15,%rdi
6904   5da7b4:	e8 00 00 00 00       	call   5da7b9 <___bpf_prog_run+0x6909>	5da7b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6909   5da7b9:	e9 9b c8 ff ff       	jmp    5d7059 <___bpf_prog_run+0x31a9>
690e   5da7be:	48 89 c7             	mov    %rax,%rdi
6911   5da7c1:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6915   5da7c5:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6919   5da7c9:	e8 00 00 00 00       	call   5da7ce <___bpf_prog_run+0x691e>	5da7ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
691e   5da7ce:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6922   5da7d2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6926   5da7d6:	e9 f4 d2 ff ff       	jmp    5d7acf <___bpf_prog_run+0x3c1f>
692b   5da7db:	4c 89 ff             	mov    %r15,%rdi
692e   5da7de:	e8 00 00 00 00       	call   5da7e3 <___bpf_prog_run+0x6933>	5da7df: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6933   5da7e3:	e9 c4 d2 ff ff       	jmp    5d7aac <___bpf_prog_run+0x3bfc>
6938   5da7e8:	4c 89 ff             	mov    %r15,%rdi
693b   5da7eb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
693f   5da7ef:	e8 00 00 00 00       	call   5da7f4 <___bpf_prog_run+0x6944>	5da7f0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6944   5da7f4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6948   5da7f8:	e9 8f cf ff ff       	jmp    5d778c <___bpf_prog_run+0x38dc>
694d   5da7fd:	4c 89 ff             	mov    %r15,%rdi
6950   5da800:	e8 00 00 00 00       	call   5da805 <___bpf_prog_run+0x6955>	5da801: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6955   5da805:	e9 5f cf ff ff       	jmp    5d7769 <___bpf_prog_run+0x38b9>
695a   5da80a:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
695e   5da80e:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
6962   5da812:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
6966   5da816:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
696a   5da81a:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
696e   5da81e:	e8 00 00 00 00       	call   5da823 <___bpf_prog_run+0x6973>	5da81f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6973   5da823:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
6977   5da827:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
697b   5da82b:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
697f   5da82f:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
6983   5da833:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
6987   5da837:	e9 09 d2 ff ff       	jmp    5d7a45 <___bpf_prog_run+0x3b95>
698c   5da83c:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
6990   5da840:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
6994   5da844:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
6998   5da848:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
699c   5da84c:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
69a0   5da850:	e8 00 00 00 00       	call   5da855 <___bpf_prog_run+0x69a5>	5da851: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
69a5   5da855:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
69a9   5da859:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
69ad   5da85d:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
69b1   5da861:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
69b5   5da865:	e9 c1 d1 ff ff       	jmp    5d7a2b <___bpf_prog_run+0x3b7b>
69ba   5da86a:	48 89 d7             	mov    %rdx,%rdi
69bd   5da86d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
69c1   5da871:	e8 00 00 00 00       	call   5da876 <___bpf_prog_run+0x69c6>	5da872: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
69c6   5da876:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
69ca   5da87a:	e9 f7 d2 ff ff       	jmp    5d7b76 <___bpf_prog_run+0x3cc6>
69cf   5da87f:	4c 89 ff             	mov    %r15,%rdi
69d2   5da882:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
69d6   5da886:	e8 00 00 00 00       	call   5da88b <___bpf_prog_run+0x69db>	5da887: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
69db   5da88b:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
69df   5da88f:	e9 49 c0 ff ff       	jmp    5d68dd <___bpf_prog_run+0x2a2d>
69e4   5da894:	4c 89 ff             	mov    %r15,%rdi
69e7   5da897:	e8 00 00 00 00       	call   5da89c <___bpf_prog_run+0x69ec>	5da898: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
69ec   5da89c:	e9 19 c0 ff ff       	jmp    5d68ba <___bpf_prog_run+0x2a0a>
69f1   5da8a1:	4c 89 ff             	mov    %r15,%rdi
69f4   5da8a4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
69f8   5da8a8:	e8 00 00 00 00       	call   5da8ad <___bpf_prog_run+0x69fd>	5da8a9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
69fd   5da8ad:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6a01   5da8b1:	e9 e0 d8 ff ff       	jmp    5d8196 <___bpf_prog_run+0x42e6>
6a06   5da8b6:	4c 89 ff             	mov    %r15,%rdi
6a09   5da8b9:	e8 00 00 00 00       	call   5da8be <___bpf_prog_run+0x6a0e>	5da8ba: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a0e   5da8be:	e9 76 9a ff ff       	jmp    5d4339 <___bpf_prog_run+0x489>
6a13   5da8c3:	48 89 c7             	mov    %rax,%rdi
6a16   5da8c6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6a1a   5da8ca:	e8 00 00 00 00       	call   5da8cf <___bpf_prog_run+0x6a1f>	5da8cb: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6a1f   5da8cf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6a23   5da8d3:	e9 62 9b ff ff       	jmp    5d443a <___bpf_prog_run+0x58a>
6a28   5da8d8:	4c 89 ff             	mov    %r15,%rdi
6a2b   5da8db:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6a2f   5da8df:	e8 00 00 00 00       	call   5da8e4 <___bpf_prog_run+0x6a34>	5da8e0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a34   5da8e4:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6a38   5da8e8:	e9 f1 cc ff ff       	jmp    5d75de <___bpf_prog_run+0x372e>
6a3d   5da8ed:	48 89 c7             	mov    %rax,%rdi
6a40   5da8f0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6a44   5da8f4:	e8 00 00 00 00       	call   5da8f9 <___bpf_prog_run+0x6a49>	5da8f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a49   5da8f9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6a4d   5da8fd:	e9 86 9b ff ff       	jmp    5d4488 <___bpf_prog_run+0x5d8>
6a52   5da902:	4c 89 f7             	mov    %r14,%rdi
6a55   5da905:	e8 00 00 00 00       	call   5da90a <___bpf_prog_run+0x6a5a>	5da906: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6a5a   5da90a:	e9 ff c6 ff ff       	jmp    5d700e <___bpf_prog_run+0x315e>
6a5f   5da90f:	48 89 75 a8          	mov    %rsi,-0x58(%rbp)
6a63   5da913:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
6a67   5da917:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
6a6b   5da91b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6a6f   5da91f:	e8 00 00 00 00       	call   5da924 <___bpf_prog_run+0x6a74>	5da920: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a74   5da924:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
6a78   5da928:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
6a7c   5da92c:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
6a80   5da930:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6a84   5da934:	e9 b9 c6 ff ff       	jmp    5d6ff2 <___bpf_prog_run+0x3142>
6a89   5da939:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
6a8d   5da93d:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
6a91   5da941:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
6a95   5da945:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6a99   5da949:	e8 00 00 00 00       	call   5da94e <___bpf_prog_run+0x6a9e>	5da94a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a9e   5da94e:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
6aa2   5da952:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
6aa6   5da956:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6aaa   5da95a:	e9 79 c6 ff ff       	jmp    5d6fd8 <___bpf_prog_run+0x3128>
6aaf   5da95f:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
6ab3   5da963:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6ab7   5da967:	e8 00 00 00 00       	call   5da96c <___bpf_prog_run+0x6abc>	5da968: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6abc   5da96c:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
6ac0   5da970:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6ac4   5da974:	e9 50 c6 ff ff       	jmp    5d6fc9 <___bpf_prog_run+0x3119>
6ac9   5da979:	4c 89 ff             	mov    %r15,%rdi
6acc   5da97c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6ad0   5da980:	e8 00 00 00 00       	call   5da985 <___bpf_prog_run+0x6ad5>	5da981: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ad5   5da985:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6ad9   5da989:	e9 13 bc ff ff       	jmp    5d65a1 <___bpf_prog_run+0x26f1>
6ade   5da98e:	4c 89 ff             	mov    %r15,%rdi
6ae1   5da991:	e8 00 00 00 00       	call   5da996 <___bpf_prog_run+0x6ae6>	5da992: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ae6   5da996:	e9 be c8 ff ff       	jmp    5d7259 <___bpf_prog_run+0x33a9>
6aeb   5da99b:	4c 89 ff             	mov    %r15,%rdi
6aee   5da99e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6af2   5da9a2:	e8 00 00 00 00       	call   5da9a7 <___bpf_prog_run+0x6af7>	5da9a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6af7   5da9a7:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6afb   5da9ab:	e9 16 c0 ff ff       	jmp    5d69c6 <___bpf_prog_run+0x2b16>
6b00   5da9b0:	4c 89 ff             	mov    %r15,%rdi
6b03   5da9b3:	e8 00 00 00 00       	call   5da9b8 <___bpf_prog_run+0x6b08>	5da9b4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b08   5da9b8:	e9 e6 bf ff ff       	jmp    5d69a3 <___bpf_prog_run+0x2af3>
6b0d   5da9bd:	4c 89 ff             	mov    %r15,%rdi
6b10   5da9c0:	e8 00 00 00 00       	call   5da9c5 <___bpf_prog_run+0x6b15>	5da9c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b15   5da9c5:	e9 64 d4 ff ff       	jmp    5d7e2e <___bpf_prog_run+0x3f7e>
6b1a   5da9ca:	48 89 c7             	mov    %rax,%rdi
6b1d   5da9cd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6b21   5da9d1:	e8 00 00 00 00       	call   5da9d6 <___bpf_prog_run+0x6b26>	5da9d2: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6b26   5da9d6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6b2a   5da9da:	e9 d9 c2 ff ff       	jmp    5d6cb8 <___bpf_prog_run+0x2e08>
6b2f   5da9df:	4c 89 ff             	mov    %r15,%rdi
6b32   5da9e2:	e8 00 00 00 00       	call   5da9e7 <___bpf_prog_run+0x6b37>	5da9e3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b37   5da9e7:	e9 92 bb ff ff       	jmp    5d657e <___bpf_prog_run+0x26ce>
6b3c   5da9ec:	4c 89 ff             	mov    %r15,%rdi
6b3f   5da9ef:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6b43   5da9f3:	e8 00 00 00 00       	call   5da9f8 <___bpf_prog_run+0x6b48>	5da9f4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b48   5da9f8:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6b4c   5da9fc:	e9 7b c8 ff ff       	jmp    5d727c <___bpf_prog_run+0x33cc>
6b51   5daa01:	e8 00 00 00 00       	call   5daa06 <___bpf_prog_run+0x6b56>	5daa02: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6b56   5daa06:	e9 3c d4 ff ff       	jmp    5d7e47 <___bpf_prog_run+0x3f97>
6b5b   5daa0b:	4c 89 ff             	mov    %r15,%rdi
6b5e   5daa0e:	e8 00 00 00 00       	call   5daa13 <___bpf_prog_run+0x6b63>	5daa0f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b63   5daa13:	e9 9b bc ff ff       	jmp    5d66b3 <___bpf_prog_run+0x2803>
6b68   5daa18:	4c 89 ff             	mov    %r15,%rdi
6b6b   5daa1b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6b6f   5daa1f:	e8 00 00 00 00       	call   5daa24 <___bpf_prog_run+0x6b74>	5daa20: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b74   5daa24:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6b78   5daa28:	e9 31 d2 ff ff       	jmp    5d7c5e <___bpf_prog_run+0x3dae>
6b7d   5daa2d:	4c 89 ff             	mov    %r15,%rdi
6b80   5daa30:	e8 00 00 00 00       	call   5daa35 <___bpf_prog_run+0x6b85>	5daa31: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b85   5daa35:	e9 01 d2 ff ff       	jmp    5d7c3b <___bpf_prog_run+0x3d8b>
6b8a   5daa3a:	4c 89 ff             	mov    %r15,%rdi
6b8d   5daa3d:	e8 00 00 00 00       	call   5daa42 <___bpf_prog_run+0x6b92>	5daa3e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6b92   5daa42:	e9 32 c3 ff ff       	jmp    5d6d79 <___bpf_prog_run+0x2ec9>
6b97   5daa47:	4c 89 ff             	mov    %r15,%rdi
6b9a   5daa4a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6b9e   5daa4e:	e8 00 00 00 00       	call   5daa53 <___bpf_prog_run+0x6ba3>	5daa4f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6ba3   5daa53:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6ba7   5daa57:	e9 b4 c8 ff ff       	jmp    5d7310 <___bpf_prog_run+0x3460>
6bac   5daa5c:	4c 89 ff             	mov    %r15,%rdi
6baf   5daa5f:	e8 00 00 00 00       	call   5daa64 <___bpf_prog_run+0x6bb4>	5daa60: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bb4   5daa64:	e9 8e cc ff ff       	jmp    5d76f7 <___bpf_prog_run+0x3847>
6bb9   5daa69:	4c 89 ff             	mov    %r15,%rdi
6bbc   5daa6c:	e8 00 00 00 00       	call   5daa71 <___bpf_prog_run+0x6bc1>	5daa6d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bc1   5daa71:	e9 4b d1 ff ff       	jmp    5d7bc1 <___bpf_prog_run+0x3d11>
6bc6   5daa76:	4c 89 ff             	mov    %r15,%rdi
6bc9   5daa79:	e8 00 00 00 00       	call   5daa7e <___bpf_prog_run+0x6bce>	5daa7a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bce   5daa7e:	e9 aa be ff ff       	jmp    5d692d <___bpf_prog_run+0x2a7d>
6bd3   5daa83:	48 89 c7             	mov    %rax,%rdi
6bd6   5daa86:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6bda   5daa8a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6bde   5daa8e:	e8 00 00 00 00       	call   5daa93 <___bpf_prog_run+0x6be3>	5daa8f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6be3   5daa93:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6be7   5daa97:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6beb   5daa9b:	e9 54 d5 ff ff       	jmp    5d7ff4 <___bpf_prog_run+0x4144>
6bf0   5daaa0:	4c 89 ff             	mov    %r15,%rdi
6bf3   5daaa3:	e8 00 00 00 00       	call   5daaa8 <___bpf_prog_run+0x6bf8>	5daaa4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6bf8   5daaa8:	e9 24 d5 ff ff       	jmp    5d7fd1 <___bpf_prog_run+0x4121>
6bfd   5daaad:	88 45 c0             	mov    %al,-0x40(%rbp)
6c00   5daab0:	e8 00 00 00 00       	call   5daab5 <___bpf_prog_run+0x6c05>	5daab1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c05   5daab5:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
6c09   5daab9:	e9 a3 94 ff ff       	jmp    5d3f61 <___bpf_prog_run+0xb1>
6c0e   5daabe:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c12   5daac2:	e8 00 00 00 00       	call   5daac7 <___bpf_prog_run+0x6c17>	5daac3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c17   5daac7:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c1b   5daacb:	e9 14 bd ff ff       	jmp    5d67e4 <___bpf_prog_run+0x2934>
6c20   5daad0:	4c 89 ff             	mov    %r15,%rdi
6c23   5daad3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c27   5daad7:	e8 00 00 00 00       	call   5daadc <___bpf_prog_run+0x6c2c>	5daad8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c2c   5daadc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c30   5daae0:	e9 bd aa ff ff       	jmp    5d55a2 <___bpf_prog_run+0x16f2>
6c35   5daae5:	4c 89 ff             	mov    %r15,%rdi
6c38   5daae8:	e8 00 00 00 00       	call   5daaed <___bpf_prog_run+0x6c3d>	5daae9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c3d   5daaed:	e9 8d aa ff ff       	jmp    5d557f <___bpf_prog_run+0x16cf>
6c42   5daaf2:	4c 89 ff             	mov    %r15,%rdi
6c45   5daaf5:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c49   5daaf9:	e8 00 00 00 00       	call   5daafe <___bpf_prog_run+0x6c4e>	5daafa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c4e   5daafe:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c52   5dab02:	e9 1f a8 ff ff       	jmp    5d5326 <___bpf_prog_run+0x1476>
6c57   5dab07:	4c 89 ff             	mov    %r15,%rdi
6c5a   5dab0a:	e8 00 00 00 00       	call   5dab0f <___bpf_prog_run+0x6c5f>	5dab0b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c5f   5dab0f:	e9 ef a7 ff ff       	jmp    5d5303 <___bpf_prog_run+0x1453>
6c64   5dab14:	4c 89 ff             	mov    %r15,%rdi
6c67   5dab17:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6c6b   5dab1b:	e8 00 00 00 00       	call   5dab20 <___bpf_prog_run+0x6c70>	5dab1c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c70   5dab20:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6c74   5dab24:	e9 99 b4 ff ff       	jmp    5d5fc2 <___bpf_prog_run+0x2112>
6c79   5dab29:	4c 89 ff             	mov    %r15,%rdi
6c7c   5dab2c:	e8 00 00 00 00       	call   5dab31 <___bpf_prog_run+0x6c81>	5dab2d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c81   5dab31:	e9 69 b4 ff ff       	jmp    5d5f9f <___bpf_prog_run+0x20ef>
6c86   5dab36:	4c 89 ff             	mov    %r15,%rdi
6c89   5dab39:	e8 00 00 00 00       	call   5dab3e <___bpf_prog_run+0x6c8e>	5dab3a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c8e   5dab3e:	e9 f3 b6 ff ff       	jmp    5d6236 <___bpf_prog_run+0x2386>
6c93   5dab43:	4c 89 ff             	mov    %r15,%rdi
6c96   5dab46:	e8 00 00 00 00       	call   5dab4b <___bpf_prog_run+0x6c9b>	5dab47: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6c9b   5dab4b:	e9 bd ac ff ff       	jmp    5d580d <___bpf_prog_run+0x195d>
6ca0   5dab50:	4c 89 ff             	mov    %r15,%rdi
6ca3   5dab53:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6ca7   5dab57:	e8 00 00 00 00       	call   5dab5c <___bpf_prog_run+0x6cac>	5dab58: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cac   5dab5c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6cb0   5dab60:	e9 e1 b1 ff ff       	jmp    5d5d46 <___bpf_prog_run+0x1e96>
6cb5   5dab65:	4c 89 ff             	mov    %r15,%rdi
6cb8   5dab68:	e8 00 00 00 00       	call   5dab6d <___bpf_prog_run+0x6cbd>	5dab69: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cbd   5dab6d:	e9 b1 b1 ff ff       	jmp    5d5d23 <___bpf_prog_run+0x1e73>
6cc2   5dab72:	4c 89 ff             	mov    %r15,%rdi
6cc5   5dab75:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6cc9   5dab79:	e8 00 00 00 00       	call   5dab7e <___bpf_prog_run+0x6cce>	5dab7a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cce   5dab7e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6cd2   5dab82:	e9 81 b0 ff ff       	jmp    5d5c08 <___bpf_prog_run+0x1d58>
6cd7   5dab87:	4c 89 ff             	mov    %r15,%rdi
6cda   5dab8a:	e8 00 00 00 00       	call   5dab8f <___bpf_prog_run+0x6cdf>	5dab8b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cdf   5dab8f:	e9 51 b0 ff ff       	jmp    5d5be5 <___bpf_prog_run+0x1d35>
6ce4   5dab94:	4c 89 ff             	mov    %r15,%rdi
6ce7   5dab97:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6ceb   5dab9b:	e8 00 00 00 00       	call   5daba0 <___bpf_prog_run+0x6cf0>	5dab9c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6cf0   5daba0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6cf4   5daba4:	e9 3f a6 ff ff       	jmp    5d51e8 <___bpf_prog_run+0x1338>
6cf9   5daba9:	4c 89 ff             	mov    %r15,%rdi
6cfc   5dabac:	e8 00 00 00 00       	call   5dabb1 <___bpf_prog_run+0x6d01>	5dabad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d01   5dabb1:	e9 0f a6 ff ff       	jmp    5d51c5 <___bpf_prog_run+0x1315>
6d06   5dabb6:	48 89 c7             	mov    %rax,%rdi
6d09   5dabb9:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6d0d   5dabbd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6d11   5dabc1:	e8 00 00 00 00       	call   5dabc6 <___bpf_prog_run+0x6d16>	5dabc2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d16   5dabc6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6d1a   5dabca:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6d1e   5dabce:	e9 0f d5 ff ff       	jmp    5d80e2 <___bpf_prog_run+0x4232>
6d23   5dabd3:	4c 89 ff             	mov    %r15,%rdi
6d26   5dabd6:	e8 00 00 00 00       	call   5dabdb <___bpf_prog_run+0x6d2b>	5dabd7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d2b   5dabdb:	e9 df d4 ff ff       	jmp    5d80bf <___bpf_prog_run+0x420f>
6d30   5dabe0:	4c 89 ff             	mov    %r15,%rdi
6d33   5dabe3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6d37   5dabe7:	e8 00 00 00 00       	call   5dabec <___bpf_prog_run+0x6d3c>	5dabe8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6d3c   5dabec:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6d40   5dabf0:	e9 70 ba ff ff       	jmp    5d6665 <___bpf_prog_run+0x27b5>
6d45   5dabf5:	4c 89 ff             	mov    %r15,%rdi
6d48   5dabf8:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6d4c   5dabfc:	e8 00 00 00 00       	call   5dac01 <___bpf_prog_run+0x6d51>	5dabfd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d51   5dac01:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6d55   5dac05:	e9 0d be ff ff       	jmp    5d6a17 <___bpf_prog_run+0x2b67>
6d5a   5dac0a:	4c 89 ff             	mov    %r15,%rdi
6d5d   5dac0d:	e8 00 00 00 00       	call   5dac12 <___bpf_prog_run+0x6d62>	5dac0e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d62   5dac12:	e9 f1 cb ff ff       	jmp    5d7808 <___bpf_prog_run+0x3958>
6d67   5dac17:	4c 89 ff             	mov    %r15,%rdi
6d6a   5dac1a:	89 4d c0             	mov    %ecx,-0x40(%rbp)
6d6d   5dac1d:	e8 00 00 00 00       	call   5dac22 <___bpf_prog_run+0x6d72>	5dac1e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d72   5dac22:	8b 4d c0             	mov    -0x40(%rbp),%ecx
6d75   5dac25:	e9 ef c1 ff ff       	jmp    5d6e19 <___bpf_prog_run+0x2f69>
6d7a   5dac2a:	4c 89 ff             	mov    %r15,%rdi
6d7d   5dac2d:	e8 00 00 00 00       	call   5dac32 <___bpf_prog_run+0x6d82>	5dac2e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d82   5dac32:	e9 bf c1 ff ff       	jmp    5d6df6 <___bpf_prog_run+0x2f46>
6d87   5dac37:	4c 89 ff             	mov    %r15,%rdi
6d8a   5dac3a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6d8e   5dac3e:	e8 00 00 00 00       	call   5dac43 <___bpf_prog_run+0x6d93>	5dac3f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6d93   5dac43:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6d97   5dac47:	e9 a1 cc ff ff       	jmp    5d78ed <___bpf_prog_run+0x3a3d>
6d9c   5dac4c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6da0   5dac50:	e8 00 00 00 00       	call   5dac55 <___bpf_prog_run+0x6da5>	5dac51: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6da5   5dac55:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6da9   5dac59:	e9 52 c2 ff ff       	jmp    5d6eb0 <___bpf_prog_run+0x3000>
6dae   5dac5e:	4c 89 ff             	mov    %r15,%rdi
6db1   5dac61:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6db5   5dac65:	e8 00 00 00 00       	call   5dac6a <___bpf_prog_run+0x6dba>	5dac66: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6dba   5dac6a:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6dbe   5dac6e:	e9 1f c2 ff ff       	jmp    5d6e92 <___bpf_prog_run+0x2fe2>
6dc3   5dac73:	4c 89 ff             	mov    %r15,%rdi
6dc6   5dac76:	e8 00 00 00 00       	call   5dac7b <___bpf_prog_run+0x6dcb>	5dac77: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6dcb   5dac7b:	e9 02 cc ff ff       	jmp    5d7882 <___bpf_prog_run+0x39d2>
6dd0   5dac80:	4c 89 ff             	mov    %r15,%rdi
6dd3   5dac83:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6dd7   5dac87:	e8 00 00 00 00       	call   5dac8c <___bpf_prog_run+0x6ddc>	5dac88: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6ddc   5dac8c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6de0   5dac90:	e9 d1 a0 ff ff       	jmp    5d4d66 <___bpf_prog_run+0xeb6>
6de5   5dac95:	4c 89 ff             	mov    %r15,%rdi
6de8   5dac98:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6dec   5dac9c:	e8 00 00 00 00       	call   5daca1 <___bpf_prog_run+0x6df1>	5dac9d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6df1   5daca1:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6df5   5daca5:	e9 73 b9 ff ff       	jmp    5d661d <___bpf_prog_run+0x276d>
6dfa   5dacaa:	4c 89 ff             	mov    %r15,%rdi
6dfd   5dacad:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6e01   5dacb1:	e8 00 00 00 00       	call   5dacb6 <___bpf_prog_run+0x6e06>	5dacb2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e06   5dacb6:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6e0a   5dacba:	e9 e7 d6 ff ff       	jmp    5d83a6 <___bpf_prog_run+0x44f6>
6e0f   5dacbf:	4c 89 ff             	mov    %r15,%rdi
6e12   5dacc2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e16   5dacc6:	e8 00 00 00 00       	call   5daccb <___bpf_prog_run+0x6e1b>	5dacc7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6e1b   5daccb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6e1f   5daccf:	e9 1a d7 ff ff       	jmp    5d83ee <___bpf_prog_run+0x453e>
6e24   5dacd4:	4c 89 ff             	mov    %r15,%rdi
6e27   5dacd7:	e8 00 00 00 00       	call   5dacdc <___bpf_prog_run+0x6e2c>	5dacd8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e2c   5dacdc:	e9 57 cc ff ff       	jmp    5d7938 <___bpf_prog_run+0x3a88>
6e31   5dace1:	4c 89 ff             	mov    %r15,%rdi
6e34   5dace4:	e8 00 00 00 00       	call   5dace9 <___bpf_prog_run+0x6e39>	5dace5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e39   5dace9:	e9 38 ba ff ff       	jmp    5d6726 <___bpf_prog_run+0x2876>
6e3e   5dacee:	4c 89 ff             	mov    %r15,%rdi
6e41   5dacf1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e45   5dacf5:	e8 00 00 00 00       	call   5dacfa <___bpf_prog_run+0x6e4a>	5dacf6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6e4a   5dacfa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6e4e   5dacfe:	e9 24 d6 ff ff       	jmp    5d8327 <___bpf_prog_run+0x4477>
6e53   5dad03:	48 89 d7             	mov    %rdx,%rdi
6e56   5dad06:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6e5a   5dad0a:	e8 00 00 00 00       	call   5dad0f <___bpf_prog_run+0x6e5f>	5dad0b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e5f   5dad0f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6e63   5dad13:	e9 fa d5 ff ff       	jmp    5d8312 <___bpf_prog_run+0x4462>
6e68   5dad18:	48 89 c7             	mov    %rax,%rdi
6e6b   5dad1b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6e6f   5dad1f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e73   5dad23:	e8 00 00 00 00       	call   5dad28 <___bpf_prog_run+0x6e78>	5dad24: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e78   5dad28:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6e7c   5dad2c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6e80   5dad30:	e9 31 c8 ff ff       	jmp    5d7566 <___bpf_prog_run+0x36b6>
6e85   5dad35:	4c 89 ff             	mov    %r15,%rdi
6e88   5dad38:	e8 00 00 00 00       	call   5dad3d <___bpf_prog_run+0x6e8d>	5dad39: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6e8d   5dad3d:	e9 01 c8 ff ff       	jmp    5d7543 <___bpf_prog_run+0x3693>
6e92   5dad42:	48 89 c7             	mov    %rax,%rdi
6e95   5dad45:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6e99   5dad49:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6e9d   5dad4d:	e8 00 00 00 00       	call   5dad52 <___bpf_prog_run+0x6ea2>	5dad4e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ea2   5dad52:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6ea6   5dad56:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6eaa   5dad5a:	e9 e0 c1 ff ff       	jmp    5d6f3f <___bpf_prog_run+0x308f>
6eaf   5dad5f:	4c 89 ff             	mov    %r15,%rdi
6eb2   5dad62:	e8 00 00 00 00       	call   5dad67 <___bpf_prog_run+0x6eb7>	5dad63: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6eb7   5dad67:	e9 b0 c1 ff ff       	jmp    5d6f1c <___bpf_prog_run+0x306c>
6ebc   5dad6c:	4c 89 ff             	mov    %r15,%rdi
6ebf   5dad6f:	e8 00 00 00 00       	call   5dad74 <___bpf_prog_run+0x6ec4>	5dad70: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ec4   5dad74:	e9 3b d0 ff ff       	jmp    5d7db4 <___bpf_prog_run+0x3f04>
6ec9   5dad79:	4c 89 ff             	mov    %r15,%rdi
6ecc   5dad7c:	e8 00 00 00 00       	call   5dad81 <___bpf_prog_run+0x6ed1>	5dad7d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ed1   5dad81:	e9 d1 bd ff ff       	jmp    5d6b57 <___bpf_prog_run+0x2ca7>
6ed6   5dad86:	48 89 c7             	mov    %rax,%rdi
6ed9   5dad89:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
6edd   5dad8d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ee1   5dad91:	e8 00 00 00 00       	call   5dad96 <___bpf_prog_run+0x6ee6>	5dad92: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6ee6   5dad96:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
6eea   5dad9a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6eee   5dad9e:	e9 61 d4 ff ff       	jmp    5d8204 <___bpf_prog_run+0x4354>
6ef3   5dada3:	4c 89 ff             	mov    %r15,%rdi
6ef6   5dada6:	e8 00 00 00 00       	call   5dadab <___bpf_prog_run+0x6efb>	5dada7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6efb   5dadab:	e9 31 d4 ff ff       	jmp    5d81e1 <___bpf_prog_run+0x4331>
6f00   5dadb0:	4c 89 ff             	mov    %r15,%rdi
6f03   5dadb3:	e8 00 00 00 00       	call   5dadb8 <___bpf_prog_run+0x6f08>	5dadb4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f08   5dadb8:	e9 85 d2 ff ff       	jmp    5d8042 <___bpf_prog_run+0x4192>
6f0d   5dadbd:	48 89 c7             	mov    %rax,%rdi
6f10   5dadc0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f14   5dadc4:	e8 00 00 00 00       	call   5dadc9 <___bpf_prog_run+0x6f19>	5dadc5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6f19   5dadc9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f1d   5dadcd:	e9 23 c3 ff ff       	jmp    5d70f5 <___bpf_prog_run+0x3245>
6f22   5dadd2:	4c 89 ff             	mov    %r15,%rdi
6f25   5dadd5:	e8 00 00 00 00       	call   5dadda <___bpf_prog_run+0x6f2a>	5dadd6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f2a   5dadda:	e9 f6 c6 ff ff       	jmp    5d74d5 <___bpf_prog_run+0x3625>
6f2f   5daddf:	4c 89 ff             	mov    %r15,%rdi
6f32   5dade2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f36   5dade6:	e8 00 00 00 00       	call   5dadeb <___bpf_prog_run+0x6f3b>	5dade7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6f3b   5dadeb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f3f   5dadef:	e9 75 cf ff ff       	jmp    5d7d69 <___bpf_prog_run+0x3eb9>
6f44   5dadf4:	4c 89 ff             	mov    %r15,%rdi
6f47   5dadf7:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f4b   5dadfb:	e8 00 00 00 00       	call   5dae00 <___bpf_prog_run+0x6f50>	5dadfc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f50   5dae00:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f54   5dae04:	e9 64 d3 ff ff       	jmp    5d816d <___bpf_prog_run+0x42bd>
6f59   5dae09:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6f5d   5dae0d:	e8 00 00 00 00       	call   5dae12 <___bpf_prog_run+0x6f62>	5dae0e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6f62   5dae12:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6f66   5dae16:	e9 2e d3 ff ff       	jmp    5d8149 <___bpf_prog_run+0x4299>
6f6b   5dae1b:	4c 89 ff             	mov    %r15,%rdi
6f6e   5dae1e:	e8 00 00 00 00       	call   5dae23 <___bpf_prog_run+0x6f73>	5dae1f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f73   5dae23:	e9 08 d3 ff ff       	jmp    5d8130 <___bpf_prog_run+0x4280>
6f78   5dae28:	4c 89 ff             	mov    %r15,%rdi
6f7b   5dae2b:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6f7f   5dae2f:	e8 00 00 00 00       	call   5dae34 <___bpf_prog_run+0x6f84>	5dae30: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f84   5dae34:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6f88   5dae38:	e9 bb c6 ff ff       	jmp    5d74f8 <___bpf_prog_run+0x3648>
6f8d   5dae3d:	4c 89 ff             	mov    %r15,%rdi
6f90   5dae40:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
6f94   5dae44:	e8 00 00 00 00       	call   5dae49 <___bpf_prog_run+0x6f99>	5dae45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f99   5dae49:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
6f9d   5dae4d:	e9 ce ce ff ff       	jmp    5d7d20 <___bpf_prog_run+0x3e70>
6fa2   5dae52:	4c 89 ff             	mov    %r15,%rdi
6fa5   5dae55:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6fa9   5dae59:	e8 00 00 00 00       	call   5dae5e <___bpf_prog_run+0x6fae>	5dae5a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6fae   5dae5e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6fb2   5dae62:	e9 a5 bc ff ff       	jmp    5d6b0c <___bpf_prog_run+0x2c5c>
6fb7   5dae67:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
6fbb   5dae6b:	e8 00 00 00 00       	call   5dae70 <___bpf_prog_run+0x6fc0>	5dae6c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6fc0   5dae70:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
6fc4   5dae74:	e9 72 bc ff ff       	jmp    5d6aeb <___bpf_prog_run+0x2c3b>
6fc9   5dae79:	4c 89 ff             	mov    %r15,%rdi
6fcc   5dae7c:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
6fd0   5dae80:	e8 00 00 00 00       	call   5dae85 <___bpf_prog_run+0x6fd5>	5dae81: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6fd5   5dae85:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
6fd9   5dae89:	e9 3f bc ff ff       	jmp    5d6acd <___bpf_prog_run+0x2c1d>
6fde   5dae8e:	4c 89 ff             	mov    %r15,%rdi
6fe1   5dae91:	e8 00 00 00 00       	call   5dae96 <___bpf_prog_run+0x6fe6>	5dae92: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6fe6   5dae96:	e9 12 bc ff ff       	jmp    5d6aad <___bpf_prog_run+0x2bfd>
6feb   5dae9b:	4c 89 ff             	mov    %r15,%rdi
6fee   5dae9e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
6ff2   5daea2:	e8 00 00 00 00       	call   5daea7 <___bpf_prog_run+0x6ff7>	5daea3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6ff7   5daea7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
6ffb   5daeab:	e9 d6 d0 ff ff       	jmp    5d7f86 <___bpf_prog_run+0x40d6>
7000   5daeb0:	48 89 d7             	mov    %rdx,%rdi
7003   5daeb3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7007   5daeb7:	e8 00 00 00 00       	call   5daebc <___bpf_prog_run+0x700c>	5daeb8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
700c   5daebc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7010   5daec0:	e9 a2 d0 ff ff       	jmp    5d7f67 <___bpf_prog_run+0x40b7>
7015   5daec5:	4c 89 ff             	mov    %r15,%rdi
7018   5daec8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
701c   5daecc:	e8 00 00 00 00       	call   5daed1 <___bpf_prog_run+0x7021>	5daecd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7021   5daed1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7025   5daed5:	e9 f7 bf ff ff       	jmp    5d6ed1 <___bpf_prog_run+0x3021>
702a   5daeda:	4c 89 ff             	mov    %r15,%rdi
702d   5daedd:	89 4d c0             	mov    %ecx,-0x40(%rbp)
7030   5daee0:	e8 00 00 00 00       	call   5daee5 <___bpf_prog_run+0x7035>	5daee1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7035   5daee5:	8b 4d c0             	mov    -0x40(%rbp),%ecx
7038   5daee8:	e9 19 c3 ff ff       	jmp    5d7206 <___bpf_prog_run+0x3356>
703d   5daeed:	4c 89 ff             	mov    %r15,%rdi
7040   5daef0:	e8 00 00 00 00       	call   5daef5 <___bpf_prog_run+0x7045>	5daef1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7045   5daef5:	e9 e9 c2 ff ff       	jmp    5d71e3 <___bpf_prog_run+0x3333>
704a   5daefa:	4c 89 ff             	mov    %r15,%rdi
704d   5daefd:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7051   5daf01:	e8 00 00 00 00       	call   5daf06 <___bpf_prog_run+0x7056>	5daf02: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7056   5daf06:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
705a   5daf0a:	e9 f4 a5 ff ff       	jmp    5d5503 <___bpf_prog_run+0x1653>
705f   5daf0f:	4c 89 ff             	mov    %r15,%rdi
7062   5daf12:	e8 00 00 00 00       	call   5daf17 <___bpf_prog_run+0x7067>	5daf13: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7067   5daf17:	e9 c4 a5 ff ff       	jmp    5d54e0 <___bpf_prog_run+0x1630>
706c   5daf1c:	4c 89 ff             	mov    %r15,%rdi
706f   5daf1f:	e8 00 00 00 00       	call   5daf24 <___bpf_prog_run+0x7074>	5daf20: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7074   5daf24:	e9 d3 aa ff ff       	jmp    5d59fc <___bpf_prog_run+0x1b4c>
7079   5daf29:	4c 89 ff             	mov    %r15,%rdi
707c   5daf2c:	e8 00 00 00 00       	call   5daf31 <___bpf_prog_run+0x7081>	5daf2d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7081   5daf31:	e9 58 b2 ff ff       	jmp    5d618e <___bpf_prog_run+0x22de>
7086   5daf36:	4c 89 ff             	mov    %r15,%rdi
7089   5daf39:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
708d   5daf3d:	e8 00 00 00 00       	call   5daf42 <___bpf_prog_run+0x7092>	5daf3e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7092   5daf42:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7096   5daf46:	e9 49 93 ff ff       	jmp    5d4294 <___bpf_prog_run+0x3e4>
709b   5daf4b:	4c 89 ff             	mov    %r15,%rdi
709e   5daf4e:	e8 00 00 00 00       	call   5daf53 <___bpf_prog_run+0x70a3>	5daf4f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70a3   5daf53:	e9 d6 b4 ff ff       	jmp    5d642e <___bpf_prog_run+0x257e>
70a8   5daf58:	48 89 c7             	mov    %rax,%rdi
70ab   5daf5b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
70af   5daf5f:	e8 00 00 00 00       	call   5daf64 <___bpf_prog_run+0x70b4>	5daf60: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70b4   5daf64:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
70b8   5daf68:	e9 b6 af ff ff       	jmp    5d5f23 <___bpf_prog_run+0x2073>
70bd   5daf6d:	4c 89 ff             	mov    %r15,%rdi
70c0   5daf70:	e8 00 00 00 00       	call   5daf75 <___bpf_prog_run+0x70c5>	5daf71: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70c5   5daf75:	e9 86 af ff ff       	jmp    5d5f00 <___bpf_prog_run+0x2050>
70ca   5daf7a:	4c 89 ff             	mov    %r15,%rdi
70cd   5daf7d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
70d1   5daf81:	e8 00 00 00 00       	call   5daf86 <___bpf_prog_run+0x70d6>	5daf82: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
70d6   5daf86:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
70da   5daf8a:	e9 ae 92 ff ff       	jmp    5d423d <___bpf_prog_run+0x38d>
70df   5daf8f:	4c 89 ff             	mov    %r15,%rdi
70e2   5daf92:	89 45 c0             	mov    %eax,-0x40(%rbp)
70e5   5daf95:	e8 00 00 00 00       	call   5daf9a <___bpf_prog_run+0x70ea>	5daf96: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
70ea   5daf9a:	48 63 45 c0          	movslq -0x40(%rbp),%rax
70ee   5daf9e:	e9 58 92 ff ff       	jmp    5d41fb <___bpf_prog_run+0x34b>
70f3   5dafa3:	4c 89 ff             	mov    %r15,%rdi
70f6   5dafa6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
70fa   5dafaa:	e8 00 00 00 00       	call   5dafaf <___bpf_prog_run+0x70ff>	5dafab: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
70ff   5dafaf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7103   5dafb3:	e9 33 93 ff ff       	jmp    5d42eb <___bpf_prog_run+0x43b>
7108   5dafb8:	48 89 d7             	mov    %rdx,%rdi
710b   5dafbb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
710f   5dafbf:	e8 00 00 00 00       	call   5dafc4 <___bpf_prog_run+0x7114>	5dafc0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7114   5dafc4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7118   5dafc8:	e9 09 93 ff ff       	jmp    5d42d6 <___bpf_prog_run+0x426>
711d   5dafcd:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
7121   5dafd1:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
7125   5dafd5:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
7129   5dafd9:	e8 00 00 00 00       	call   5dafde <___bpf_prog_run+0x712e>	5dafda: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
712e   5dafde:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
7132   5dafe2:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
7136   5dafe6:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
713a   5dafea:	e9 2d ca ff ff       	jmp    5d7a1c <___bpf_prog_run+0x3b6c>
713f   5dafef:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
7143   5daff3:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
7147   5daff7:	e8 00 00 00 00       	call   5daffc <___bpf_prog_run+0x714c>	5daff8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
714c   5daffc:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
7150   5db000:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
7154   5db004:	e9 f9 c9 ff ff       	jmp    5d7a02 <___bpf_prog_run+0x3b52>
7159   5db009:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
715d   5db00d:	e8 00 00 00 00       	call   5db012 <___bpf_prog_run+0x7162>	5db00e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7162   5db012:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
7166   5db016:	e9 cd c9 ff ff       	jmp    5d79e8 <___bpf_prog_run+0x3b38>
716b   5db01b:	4c 89 ff             	mov    %r15,%rdi
716e   5db01e:	e8 00 00 00 00       	call   5db023 <___bpf_prog_run+0x7173>	5db01f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7173   5db023:	e9 a1 93 ff ff       	jmp    5d43c9 <___bpf_prog_run+0x519>
7178   5db028:	4c 89 ff             	mov    %r15,%rdi
717b   5db02b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
717f   5db02f:	e8 00 00 00 00       	call   5db034 <___bpf_prog_run+0x7184>	5db030: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7184   5db034:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7188   5db038:	e9 88 a3 ff ff       	jmp    5d53c5 <___bpf_prog_run+0x1515>
718d   5db03d:	4c 89 ff             	mov    %r15,%rdi
7190   5db040:	e8 00 00 00 00       	call   5db045 <___bpf_prog_run+0x7195>	5db041: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7195   5db045:	e9 58 a3 ff ff       	jmp    5d53a2 <___bpf_prog_run+0x14f2>
719a   5db04a:	4c 89 ff             	mov    %r15,%rdi
719d   5db04d:	e8 00 00 00 00       	call   5db052 <___bpf_prog_run+0x71a2>	5db04e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71a2   5db052:	e9 5b a8 ff ff       	jmp    5d58b2 <___bpf_prog_run+0x1a02>
71a7   5db057:	4c 89 ff             	mov    %r15,%rdi
71aa   5db05a:	e8 00 00 00 00       	call   5db05f <___bpf_prog_run+0x71af>	5db05b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71af   5db05f:	e9 da af ff ff       	jmp    5d603e <___bpf_prog_run+0x218e>
71b4   5db064:	4c 89 ff             	mov    %r15,%rdi
71b7   5db067:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
71bb   5db06b:	e8 00 00 00 00       	call   5db070 <___bpf_prog_run+0x71c0>	5db06c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71c0   5db070:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
71c4   5db074:	e9 f0 aa ff ff       	jmp    5d5b69 <___bpf_prog_run+0x1cb9>
71c9   5db079:	4c 89 ff             	mov    %r15,%rdi
71cc   5db07c:	e8 00 00 00 00       	call   5db081 <___bpf_prog_run+0x71d1>	5db07d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71d1   5db081:	e9 c0 aa ff ff       	jmp    5d5b46 <___bpf_prog_run+0x1c96>
71d6   5db086:	4c 89 ff             	mov    %r15,%rdi
71d9   5db089:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
71dd   5db08d:	e8 00 00 00 00       	call   5db092 <___bpf_prog_run+0x71e2>	5db08e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71e2   5db092:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
71e6   5db096:	e9 ae a0 ff ff       	jmp    5d5149 <___bpf_prog_run+0x1299>
71eb   5db09b:	4c 89 ff             	mov    %r15,%rdi
71ee   5db09e:	e8 00 00 00 00       	call   5db0a3 <___bpf_prog_run+0x71f3>	5db09f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71f3   5db0a3:	e9 7e a0 ff ff       	jmp    5d5126 <___bpf_prog_run+0x1276>
71f8   5db0a8:	4c 89 ff             	mov    %r15,%rdi
71fb   5db0ab:	e8 00 00 00 00       	call   5db0b0 <___bpf_prog_run+0x7200>	5db0ac: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7200   5db0b0:	e9 b3 a6 ff ff       	jmp    5d5768 <___bpf_prog_run+0x18b8>
7205   5db0b5:	4c 89 ff             	mov    %r15,%rdi
7208   5db0b8:	e8 00 00 00 00       	call   5db0bd <___bpf_prog_run+0x720d>	5db0b9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
720d   5db0bd:	e9 1c b2 ff ff       	jmp    5d62de <___bpf_prog_run+0x242e>
7212   5db0c2:	4c 89 ff             	mov    %r15,%rdi
7215   5db0c5:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7219   5db0c9:	e8 00 00 00 00       	call   5db0ce <___bpf_prog_run+0x721e>	5db0ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
721e   5db0ce:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7222   5db0d2:	e9 0e ad ff ff       	jmp    5d5de5 <___bpf_prog_run+0x1f35>
7227   5db0d7:	4c 89 ff             	mov    %r15,%rdi
722a   5db0da:	e8 00 00 00 00       	call   5db0df <___bpf_prog_run+0x722f>	5db0db: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
722f   5db0df:	e9 de ac ff ff       	jmp    5d5dc2 <___bpf_prog_run+0x1f12>
7234   5db0e4:	4c 89 ff             	mov    %r15,%rdi
7237   5db0e7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
723b   5db0eb:	e8 00 00 00 00       	call   5db0f0 <___bpf_prog_run+0x7240>	5db0ec: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7240   5db0f0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7244   5db0f4:	e9 ae ab ff ff       	jmp    5d5ca7 <___bpf_prog_run+0x1df7>
7249   5db0f9:	4c 89 ff             	mov    %r15,%rdi
724c   5db0fc:	e8 00 00 00 00       	call   5db101 <___bpf_prog_run+0x7251>	5db0fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7251   5db101:	e9 7e ab ff ff       	jmp    5d5c84 <___bpf_prog_run+0x1dd4>
7256   5db106:	4c 89 ff             	mov    %r15,%rdi
7259   5db109:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
725d   5db10d:	e8 00 00 00 00       	call   5db112 <___bpf_prog_run+0x7262>	5db10e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7262   5db112:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7266   5db116:	e9 6c a1 ff ff       	jmp    5d5287 <___bpf_prog_run+0x13d7>
726b   5db11b:	4c 89 ff             	mov    %r15,%rdi
726e   5db11e:	e8 00 00 00 00       	call   5db123 <___bpf_prog_run+0x7273>	5db11f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7273   5db123:	e9 3c a1 ff ff       	jmp    5d5264 <___bpf_prog_run+0x13b4>
7278   5db128:	48 89 c7             	mov    %rax,%rdi
727b   5db12b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
727f   5db12f:	e8 00 00 00 00       	call   5db134 <___bpf_prog_run+0x7284>	5db130: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7284   5db134:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7288   5db138:	e9 99 9a ff ff       	jmp    5d4bd6 <___bpf_prog_run+0xd26>
728d   5db13d:	4c 89 ff             	mov    %r15,%rdi
7290   5db140:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7294   5db144:	e8 00 00 00 00       	call   5db149 <___bpf_prog_run+0x7299>	5db145: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7299   5db149:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
729d   5db14d:	e9 03 95 ff ff       	jmp    5d4655 <___bpf_prog_run+0x7a5>
72a2   5db152:	4c 89 ff             	mov    %r15,%rdi
72a5   5db155:	e8 00 00 00 00       	call   5db15a <___bpf_prog_run+0x72aa>	5db156: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72aa   5db15a:	e9 d6 94 ff ff       	jmp    5d4635 <___bpf_prog_run+0x785>
72af   5db15f:	4c 89 ff             	mov    %r15,%rdi
72b2   5db162:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
72b6   5db166:	e8 00 00 00 00       	call   5db16b <___bpf_prog_run+0x72bb>	5db167: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72bb   5db16b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
72bf   5db16f:	e9 21 9d ff ff       	jmp    5d4e95 <___bpf_prog_run+0xfe5>
72c4   5db174:	4c 89 ff             	mov    %r15,%rdi
72c7   5db177:	e8 00 00 00 00       	call   5db17c <___bpf_prog_run+0x72cc>	5db178: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72cc   5db17c:	e9 8e 97 ff ff       	jmp    5d490f <___bpf_prog_run+0xa5f>
72d1   5db181:	4c 89 ff             	mov    %r15,%rdi
72d4   5db184:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
72d8   5db188:	e8 00 00 00 00       	call   5db18d <___bpf_prog_run+0x72dd>	5db189: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
72dd   5db18d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
72e1   5db191:	e9 dc 9a ff ff       	jmp    5d4c72 <___bpf_prog_run+0xdc2>
72e6   5db196:	4c 89 ff             	mov    %r15,%rdi
72e9   5db199:	89 55 c0             	mov    %edx,-0x40(%rbp)
72ec   5db19c:	e8 00 00 00 00       	call   5db1a1 <___bpf_prog_run+0x72f1>	5db19d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
72f1   5db1a1:	8b 55 c0             	mov    -0x40(%rbp),%edx
72f4   5db1a4:	e9 90 9d ff ff       	jmp    5d4f39 <___bpf_prog_run+0x1089>
72f9   5db1a9:	48 89 c7             	mov    %rax,%rdi
72fc   5db1ac:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7300   5db1b0:	e8 00 00 00 00       	call   5db1b5 <___bpf_prog_run+0x7305>	5db1b1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7305   5db1b5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
7309   5db1b9:	e9 c3 97 ff ff       	jmp    5d4981 <___bpf_prog_run+0xad1>
730e   5db1be:	4c 89 ff             	mov    %r15,%rdi
7311   5db1c1:	e8 00 00 00 00       	call   5db1c6 <___bpf_prog_run+0x7316>	5db1c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7316   5db1c6:	e9 0b 9e ff ff       	jmp    5d4fd6 <___bpf_prog_run+0x1126>
731b   5db1cb:	48 89 c7             	mov    %rax,%rdi
731e   5db1ce:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7322   5db1d2:	e8 00 00 00 00       	call   5db1d7 <___bpf_prog_run+0x7327>	5db1d3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7327   5db1d7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
732b   5db1db:	e9 03 99 ff ff       	jmp    5d4ae3 <___bpf_prog_run+0xc33>
7330   5db1e0:	4c 89 ff             	mov    %r15,%rdi
7333   5db1e3:	e8 00 00 00 00       	call   5db1e8 <___bpf_prog_run+0x7338>	5db1e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7338   5db1e8:	e9 b4 a8 ff ff       	jmp    5d5aa1 <___bpf_prog_run+0x1bf1>
733d   5db1ed:	4c 89 ff             	mov    %r15,%rdi
7340   5db1f0:	e8 00 00 00 00       	call   5db1f5 <___bpf_prog_run+0x7345>	5db1f1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7345   5db1f5:	e9 84 9e ff ff       	jmp    5d507e <___bpf_prog_run+0x11ce>
734a   5db1fa:	4c 89 ff             	mov    %r15,%rdi
734d   5db1fd:	e8 00 00 00 00       	call   5db202 <___bpf_prog_run+0x7352>	5db1fe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7352   5db202:	e9 6d 98 ff ff       	jmp    5d4a74 <___bpf_prog_run+0xbc4>
7357   5db207:	4c 89 ff             	mov    %r15,%rdi
735a   5db20a:	89 55 c0             	mov    %edx,-0x40(%rbp)
735d   5db20d:	e8 00 00 00 00       	call   5db212 <___bpf_prog_run+0x7362>	5db20e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7362   5db212:	8b 55 c0             	mov    -0x40(%rbp),%edx
7365   5db215:	e9 bf 9b ff ff       	jmp    5d4dd9 <___bpf_prog_run+0xf29>
736a   5db21a:	4c 89 ff             	mov    %r15,%rdi
736d   5db21d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
7371   5db221:	e8 00 00 00 00       	call   5db226 <___bpf_prog_run+0x7376>	5db222: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7376   5db226:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
737a   5db22a:	e9 a1 95 ff ff       	jmp    5d47d0 <___bpf_prog_run+0x920>
737f   5db22f:	4c 89 ff             	mov    %r15,%rdi
7382   5db232:	e8 00 00 00 00       	call   5db237 <___bpf_prog_run+0x7387>	5db233: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7387   5db237:	e9 74 95 ff ff       	jmp    5d47b0 <___bpf_prog_run+0x900>
738c   5db23c:	4c 89 ff             	mov    %r15,%rdi
738f   5db23f:	e8 00 00 00 00       	call   5db244 <___bpf_prog_run+0x7394>	5db240: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7394   5db244:	e9 dc 8e ff ff       	jmp    5d4125 <___bpf_prog_run+0x275>
7399   5db249:	4c 89 ff             	mov    %r15,%rdi
739c   5db24c:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
73a0   5db250:	e8 00 00 00 00       	call   5db255 <___bpf_prog_run+0x73a5>	5db251: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73a5   5db255:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
73a9   5db259:	e9 fd c0 ff ff       	jmp    5d735b <___bpf_prog_run+0x34ab>
73ae   5db25e:	4c 89 ff             	mov    %r15,%rdi
73b1   5db261:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
73b5   5db265:	e8 00 00 00 00       	call   5db26a <___bpf_prog_run+0x73ba>	5db266: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
73ba   5db26a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
73be   5db26e:	e9 31 c1 ff ff       	jmp    5d73a4 <___bpf_prog_run+0x34f4>
73c3   5db273:	4c 89 ff             	mov    %r15,%rdi
73c6   5db276:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
73ca   5db27a:	e8 00 00 00 00       	call   5db27f <___bpf_prog_run+0x73cf>	5db27b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73cf   5db27f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
73d3   5db283:	e9 8c 94 ff ff       	jmp    5d4714 <___bpf_prog_run+0x864>
73d8   5db288:	4c 89 ff             	mov    %r15,%rdi
73db   5db28b:	e8 00 00 00 00       	call   5db290 <___bpf_prog_run+0x73e0>	5db28c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73e0   5db290:	e9 5f 94 ff ff       	jmp    5d46f4 <___bpf_prog_run+0x844>
73e5   5db295:	48 89 c7             	mov    %rax,%rdi
73e8   5db298:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
73ec   5db29c:	e8 00 00 00 00       	call   5db2a1 <___bpf_prog_run+0x73f1>	5db29d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
73f1   5db2a1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
73f5   5db2a5:	e9 dd 8e ff ff       	jmp    5d4187 <___bpf_prog_run+0x2d7>
73fa   5db2aa:	4c 89 ff             	mov    %r15,%rdi
73fd   5db2ad:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7401   5db2b1:	e8 00 00 00 00       	call   5db2b6 <___bpf_prog_run+0x7406>	5db2b2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7406   5db2b6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
740a   5db2ba:	e9 b3 8e ff ff       	jmp    5d4172 <___bpf_prog_run+0x2c2>
740f   5db2bf:	4c 89 ff             	mov    %r15,%rdi
7412   5db2c2:	e8 00 00 00 00       	call   5db2c7 <___bpf_prog_run+0x7417>	5db2c3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7417   5db2c7:	e9 a1 95 ff ff       	jmp    5d486d <___bpf_prog_run+0x9bd>
741c   5db2cc:	4c 89 ff             	mov    %r15,%rdi
741f   5db2cf:	e8 00 00 00 00       	call   5db2d4 <___bpf_prog_run+0x7424>	5db2d0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7424   5db2d4:	e9 55 98 ff ff       	jmp    5d4b2e <___bpf_prog_run+0xc7e>
7429   5db2d9:	4c 89 ff             	mov    %r15,%rdi
742c   5db2dc:	e8 00 00 00 00       	call   5db2e1 <___bpf_prog_run+0x7431>	5db2dd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7431   5db2e1:	e9 8c 9b ff ff       	jmp    5d4e72 <___bpf_prog_run+0xfc2>
7436   5db2e6:	4c 89 ff             	mov    %r15,%rdi
7439   5db2e9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
743d   5db2ed:	e8 00 00 00 00       	call   5db2f2 <___bpf_prog_run+0x7442>	5db2ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7442   5db2f2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
7446   5db2f6:	e9 95 95 ff ff       	jmp    5d4890 <___bpf_prog_run+0x9e0>
744b   5db2fb:	48 89 c7             	mov    %rax,%rdi
744e   5db2fe:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
7452   5db302:	e8 00 00 00 00       	call   5db307 <___bpf_prog_run+0x7457>	5db303: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7457   5db307:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
745b   5db30b:	e9 bc 99 ff ff       	jmp    5d4ccc <___bpf_prog_run+0xe1c>
7460   5db310:	4c 89 ff             	mov    %r15,%rdi
7463   5db313:	e8 00 00 00 00       	call   5db318 <___bpf_prog_run+0x7468>	5db314: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7468   5db318:	e9 af 96 ff ff       	jmp    5d49cc <___bpf_prog_run+0xb1c>
746d   5db31d:	4c 89 ff             	mov    %r15,%rdi
7470   5db320:	89 55 c0             	mov    %edx,-0x40(%rbp)
7473   5db323:	e8 00 00 00 00       	call   5db328 <___bpf_prog_run+0x7478>	5db324: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7478   5db328:	8b 55 c0             	mov    -0x40(%rbp),%edx
747b   5db32b:	e9 66 92 ff ff       	jmp    5d4596 <___bpf_prog_run+0x6e6>
7480   5db330:	4c 89 ff             	mov    %r15,%rdi
7483   5db333:	e8 00 00 00 00       	call   5db338 <___bpf_prog_run+0x7488>	5db334: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7488   5db338:	e9 89 d9 ff ff       	jmp    5d8cc6 <___bpf_prog_run+0x4e16>
748d   5db33d:	4c 89 ff             	mov    %r15,%rdi
7490   5db340:	e8 00 00 00 00       	call   5db345 <___bpf_prog_run+0x7495>	5db341: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7495   5db345:	e9 23 d9 ff ff       	jmp    5d8c6d <___bpf_prog_run+0x4dbd>
749a   5db34a:	4c 89 ff             	mov    %r15,%rdi
749d   5db34d:	e8 00 00 00 00       	call   5db352 <___bpf_prog_run+0x74a2>	5db34e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
74a2   5db352:	e9 98 d1 ff ff       	jmp    5d84ef <___bpf_prog_run+0x463f>
74a7   5db357:	4c 89 f7             	mov    %r14,%rdi
74aa   5db35a:	e8 00 00 00 00       	call   5db35f <___bpf_prog_run+0x74af>	5db35b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
74af   5db35f:	e9 2a be ff ff       	jmp    5d718e <___bpf_prog_run+0x32de>
74b4   5db364:	4c 89 f7             	mov    %r14,%rdi
74b7   5db367:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
74bb   5db36b:	e8 00 00 00 00       	call   5db370 <___bpf_prog_run+0x74c0>	5db36c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
74c0   5db370:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
74c4   5db374:	e9 8f e1 ff ff       	jmp    5d9508 <___bpf_prog_run+0x5658>
74c9   5db379:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
0000 0000000000006c80 <___bpf_prog_run.cold>:
0000     6c80:	48 63 d1             	movslq %ecx,%rdx
0003     6c83:	48 89 c6             	mov    %rax,%rsi
0006     6c86:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6c89: R_X86_64_32S	.data+0x66ca40
000d     6c8d:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
0011     6c91:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
0015     6c95:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0019     6c99:	e8 00 00 00 00       	call   6c9e <___bpf_prog_run.cold+0x1e>	6c9a: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
001e     6c9e:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
0022     6ca2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0026     6ca6:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
002a     6caa:	4c 89 ca             	mov    %r9,%rdx
002d     6cad:	48 c1 ea 03          	shr    $0x3,%rdx
0031     6cb1:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0036     6cb6:	4c 89 ca             	mov    %r9,%rdx
0039     6cb9:	83 e2 07             	and    $0x7,%edx
003c     6cbc:	83 c2 03             	add    $0x3,%edx
003f     6cbf:	38 ca                	cmp    %cl,%dl
0041     6cc1:	7c 08                	jl     6ccb <___bpf_prog_run.cold+0x4b>
0043     6cc3:	84 c9                	test   %cl,%cl
0045     6cc5:	0f 85 a5 00 00 00    	jne    6d70 <___bpf_prog_run.cold+0xf0>
004b     6ccb:	4c 89 c2             	mov    %r8,%rdx
004e     6cce:	4c 89 c6             	mov    %r8,%rsi
0051     6cd1:	8b 4b 04             	mov    0x4(%rbx),%ecx
0054     6cd4:	48 c1 ea 03          	shr    $0x3,%rdx
0058     6cd8:	83 e6 07             	and    $0x7,%esi
005b     6cdb:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
0060     6ce0:	40 38 f2             	cmp    %sil,%dl
0063     6ce3:	7f 08                	jg     6ced <___bpf_prog_run.cold+0x6d>
0065     6ce5:	84 d2                	test   %dl,%dl
0067     6ce7:	0f 85 a0 00 00 00    	jne    6d8d <___bpf_prog_run.cold+0x10d>
006d     6ced:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0071     6cf1:	83 e2 0f             	and    $0xf,%edx
0074     6cf4:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
0078     6cf8:	e9 00 00 00 00       	jmp    6cfd <___bpf_prog_run.cold+0x7d>	6cf9: R_X86_64_PC32	.text+0x5d72f7
007d     6cfd:	89 ca                	mov    %ecx,%edx
007f     6cff:	89 c6                	mov    %eax,%esi
0081     6d01:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6d04: R_X86_64_32S	.data+0x66c980
0088     6d08:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
008c     6d0c:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
0090     6d10:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0094     6d14:	e8 00 00 00 00       	call   6d19 <___bpf_prog_run.cold+0x99>	6d15: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0099     6d19:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
009d     6d1d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
00a1     6d21:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
00a5     6d25:	4c 89 ca             	mov    %r9,%rdx
00a8     6d28:	48 c1 ea 03          	shr    $0x3,%rdx
00ac     6d2c:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
00b1     6d31:	4c 89 ca             	mov    %r9,%rdx
00b4     6d34:	83 e2 07             	and    $0x7,%edx
00b7     6d37:	83 c2 03             	add    $0x3,%edx
00ba     6d3a:	38 ca                	cmp    %cl,%dl
00bc     6d3c:	7c 04                	jl     6d42 <___bpf_prog_run.cold+0xc2>
00be     6d3e:	84 c9                	test   %cl,%cl
00c0     6d40:	75 66                	jne    6da8 <___bpf_prog_run.cold+0x128>
00c2     6d42:	4c 89 c2             	mov    %r8,%rdx
00c5     6d45:	4c 89 c6             	mov    %r8,%rsi
00c8     6d48:	8b 4b 04             	mov    0x4(%rbx),%ecx
00cb     6d4b:	48 c1 ea 03          	shr    $0x3,%rdx
00cf     6d4f:	83 e6 07             	and    $0x7,%esi
00d2     6d52:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
00d7     6d57:	40 38 f2             	cmp    %sil,%dl
00da     6d5a:	7f 04                	jg     6d60 <___bpf_prog_run.cold+0xe0>
00dc     6d5c:	84 d2                	test   %dl,%dl
00de     6d5e:	75 5e                	jne    6dbe <___bpf_prog_run.cold+0x13e>
00e0     6d60:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
00e4     6d64:	83 e2 0f             	and    $0xf,%edx
00e7     6d67:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
00eb     6d6b:	e9 00 00 00 00       	jmp    6d70 <___bpf_prog_run.cold+0xf0>	6d6c: R_X86_64_PC32	.text+0x5d664d
00f0     6d70:	4c 89 cf             	mov    %r9,%rdi
00f3     6d73:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
00f7     6d77:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
00fb     6d7b:	e8 00 00 00 00       	call   6d80 <___bpf_prog_run.cold+0x100>	6d7c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0100     6d80:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0104     6d84:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0108     6d88:	e9 3e ff ff ff       	jmp    6ccb <___bpf_prog_run.cold+0x4b>
010d     6d8d:	4c 89 c7             	mov    %r8,%rdi
0110     6d90:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0114     6d94:	89 4d c0             	mov    %ecx,-0x40(%rbp)
0117     6d97:	e8 00 00 00 00       	call   6d9c <___bpf_prog_run.cold+0x11c>	6d98: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
011c     6d9c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0120     6da0:	8b 4d c0             	mov    -0x40(%rbp),%ecx
0123     6da3:	e9 45 ff ff ff       	jmp    6ced <___bpf_prog_run.cold+0x6d>
0128     6da8:	4c 89 cf             	mov    %r9,%rdi
012b     6dab:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
012f     6daf:	e8 00 00 00 00       	call   6db4 <___bpf_prog_run.cold+0x134>	6db0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0134     6db4:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
0138     6db8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
013c     6dbc:	eb 84                	jmp    6d42 <___bpf_prog_run.cold+0xc2>
013e     6dbe:	4c 89 c7             	mov    %r8,%rdi
0141     6dc1:	89 4d b8             	mov    %ecx,-0x48(%rbp)
0144     6dc4:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0148     6dc8:	e8 00 00 00 00       	call   6dcd <___bpf_prog_run.cold+0x14d>	6dc9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
014d     6dcd:	8b 4d b8             	mov    -0x48(%rbp),%ecx
0150     6dd0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0154     6dd4:	eb 8a                	jmp    6d60 <___bpf_prog_run.cold+0xe0>
0156     6dd6:	48 63 d1             	movslq %ecx,%rdx
0159     6dd9:	48 89 c6             	mov    %rax,%rsi
015c     6ddc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6ddf: R_X86_64_32S	.data+0x66c9c0
0163     6de3:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
0167     6de7:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
016b     6deb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
016f     6def:	e8 00 00 00 00       	call   6df4 <___bpf_prog_run.cold+0x174>	6df0: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0174     6df4:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
0178     6df8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
017c     6dfc:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
0180     6e00:	4c 89 ca             	mov    %r9,%rdx
0183     6e03:	48 c1 ea 03          	shr    $0x3,%rdx
0187     6e07:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
018c     6e0c:	4c 89 ca             	mov    %r9,%rdx
018f     6e0f:	83 e2 07             	and    $0x7,%edx
0192     6e12:	83 c2 03             	add    $0x3,%edx
0195     6e15:	38 ca                	cmp    %cl,%dl
0197     6e17:	7c 08                	jl     6e21 <___bpf_prog_run.cold+0x1a1>
0199     6e19:	84 c9                	test   %cl,%cl
019b     6e1b:	0f 85 af 00 00 00    	jne    6ed0 <___bpf_prog_run.cold+0x250>
01a1     6e21:	4c 89 c2             	mov    %r8,%rdx
01a4     6e24:	4c 89 c6             	mov    %r8,%rsi
01a7     6e27:	8b 4b 04             	mov    0x4(%rbx),%ecx
01aa     6e2a:	48 c1 ea 03          	shr    $0x3,%rdx
01ae     6e2e:	83 e6 07             	and    $0x7,%esi
01b1     6e31:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
01b6     6e36:	40 38 f2             	cmp    %sil,%dl
01b9     6e39:	7f 08                	jg     6e43 <___bpf_prog_run.cold+0x1c3>
01bb     6e3b:	84 d2                	test   %dl,%dl
01bd     6e3d:	0f 85 a6 00 00 00    	jne    6ee9 <___bpf_prog_run.cold+0x269>
01c3     6e43:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
01c7     6e47:	83 e2 0f             	and    $0xf,%edx
01ca     6e4a:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
01ce     6e4e:	e9 00 00 00 00       	jmp    6e53 <___bpf_prog_run.cold+0x1d3>	6e4f: R_X86_64_PC32	.text+0x5d738b
01d3     6e53:	48 63 d1             	movslq %ecx,%rdx
01d6     6e56:	48 63 f0             	movslq %eax,%rsi
01d9     6e59:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e5c: R_X86_64_32S	.data+0x66c940
01e0     6e60:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
01e4     6e64:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
01e8     6e68:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
01ec     6e6c:	e8 00 00 00 00       	call   6e71 <___bpf_prog_run.cold+0x1f1>	6e6d: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
01f1     6e71:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
01f5     6e75:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
01f9     6e79:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
01fd     6e7d:	4c 89 ca             	mov    %r9,%rdx
0200     6e80:	48 c1 ea 03          	shr    $0x3,%rdx
0204     6e84:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0209     6e89:	4c 89 ca             	mov    %r9,%rdx
020c     6e8c:	83 e2 07             	and    $0x7,%edx
020f     6e8f:	83 c2 03             	add    $0x3,%edx
0212     6e92:	38 ca                	cmp    %cl,%dl
0214     6e94:	7c 08                	jl     6e9e <___bpf_prog_run.cold+0x21e>
0216     6e96:	84 c9                	test   %cl,%cl
0218     6e98:	0f 85 96 01 00 00    	jne    7034 <___bpf_prog_run.cold+0x3b4>
021e     6e9e:	4c 89 c2             	mov    %r8,%rdx
0221     6ea1:	4c 89 c6             	mov    %r8,%rsi
0224     6ea4:	8b 4b 04             	mov    0x4(%rbx),%ecx
0227     6ea7:	48 c1 ea 03          	shr    $0x3,%rdx
022b     6eab:	83 e6 07             	and    $0x7,%esi
022e     6eae:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
0233     6eb3:	40 38 f2             	cmp    %sil,%dl
0236     6eb6:	7f 08                	jg     6ec0 <___bpf_prog_run.cold+0x240>
0238     6eb8:	84 d2                	test   %dl,%dl
023a     6eba:	0f 85 91 01 00 00    	jne    7051 <___bpf_prog_run.cold+0x3d1>
0240     6ec0:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0244     6ec4:	83 e2 0f             	and    $0xf,%edx
0247     6ec7:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
024b     6ecb:	e9 00 00 00 00       	jmp    6ed0 <___bpf_prog_run.cold+0x250>	6ecc: R_X86_64_PC32	.text+0x5d83d6
0250     6ed0:	4c 89 cf             	mov    %r9,%rdi
0253     6ed3:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
0257     6ed7:	e8 00 00 00 00       	call   6edc <___bpf_prog_run.cold+0x25c>	6ed8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
025c     6edc:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
0260     6ee0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0264     6ee4:	e9 38 ff ff ff       	jmp    6e21 <___bpf_prog_run.cold+0x1a1>
0269     6ee9:	4c 89 c7             	mov    %r8,%rdi
026c     6eec:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0270     6ef0:	89 4d c0             	mov    %ecx,-0x40(%rbp)
0273     6ef3:	e8 00 00 00 00       	call   6ef8 <___bpf_prog_run.cold+0x278>	6ef4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0278     6ef8:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
027c     6efc:	8b 4d c0             	mov    -0x40(%rbp),%ecx
027f     6eff:	e9 3f ff ff ff       	jmp    6e43 <___bpf_prog_run.cold+0x1c3>
0284     6f04:	48 63 d1             	movslq %ecx,%rdx
0287     6f07:	48 89 c6             	mov    %rax,%rsi
028a     6f0a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f0d: R_X86_64_32S	.data+0x66c900
0291     6f11:	4c 89 4d b0          	mov    %r9,-0x50(%rbp)
0295     6f15:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
0299     6f19:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
029d     6f1d:	e8 00 00 00 00       	call   6f22 <___bpf_prog_run.cold+0x2a2>	6f1e: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
02a2     6f22:	4c 8b 4d b0          	mov    -0x50(%rbp),%r9
02a6     6f26:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
02aa     6f2a:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
02ae     6f2e:	4c 89 ca             	mov    %r9,%rdx
02b1     6f31:	48 c1 ea 03          	shr    $0x3,%rdx
02b5     6f35:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
02ba     6f3a:	4c 89 ca             	mov    %r9,%rdx
02bd     6f3d:	83 e2 07             	and    $0x7,%edx
02c0     6f40:	83 c2 03             	add    $0x3,%edx
02c3     6f43:	38 ca                	cmp    %cl,%dl
02c5     6f45:	7c 08                	jl     6f4f <___bpf_prog_run.cold+0x2cf>
02c7     6f47:	84 c9                	test   %cl,%cl
02c9     6f49:	0f 85 ad 00 00 00    	jne    6ffc <___bpf_prog_run.cold+0x37c>
02cf     6f4f:	4c 89 c2             	mov    %r8,%rdx
02d2     6f52:	4c 89 c6             	mov    %r8,%rsi
02d5     6f55:	8b 4b 04             	mov    0x4(%rbx),%ecx
02d8     6f58:	48 c1 ea 03          	shr    $0x3,%rdx
02dc     6f5c:	83 e6 07             	and    $0x7,%esi
02df     6f5f:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
02e4     6f64:	40 38 f2             	cmp    %sil,%dl
02e7     6f67:	7f 08                	jg     6f71 <___bpf_prog_run.cold+0x2f1>
02e9     6f69:	84 d2                	test   %dl,%dl
02eb     6f6b:	0f 85 a8 00 00 00    	jne    7019 <___bpf_prog_run.cold+0x399>
02f1     6f71:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
02f5     6f75:	83 e2 0f             	and    $0xf,%edx
02f8     6f78:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
02fc     6f7c:	e9 00 00 00 00       	jmp    6f81 <___bpf_prog_run.cold+0x301>	6f7d: R_X86_64_PC32	.text+0x5d7d50
0301     6f81:	89 ca                	mov    %ecx,%edx
0303     6f83:	89 c6                	mov    %eax,%esi
0305     6f85:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6f88: R_X86_64_32S	.data+0x66ca00
030c     6f8c:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
0310     6f90:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
0314     6f94:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
0318     6f98:	e8 00 00 00 00       	call   6f9d <___bpf_prog_run.cold+0x31d>	6f99: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
031d     6f9d:	4c 8b 4d b8          	mov    -0x48(%rbp),%r9
0321     6fa1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0325     6fa5:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
0329     6fa9:	4c 89 ca             	mov    %r9,%rdx
032c     6fac:	48 c1 ea 03          	shr    $0x3,%rdx
0330     6fb0:	42 0f b6 0c 2a       	movzbl (%rdx,%r13,1),%ecx
0335     6fb5:	4c 89 ca             	mov    %r9,%rdx
0338     6fb8:	83 e2 07             	and    $0x7,%edx
033b     6fbb:	83 c2 03             	add    $0x3,%edx
033e     6fbe:	38 ca                	cmp    %cl,%dl
0340     6fc0:	7c 08                	jl     6fca <___bpf_prog_run.cold+0x34a>
0342     6fc2:	84 c9                	test   %cl,%cl
0344     6fc4:	0f 85 a2 00 00 00    	jne    706c <___bpf_prog_run.cold+0x3ec>
034a     6fca:	4c 89 c2             	mov    %r8,%rdx
034d     6fcd:	4c 89 c6             	mov    %r8,%rsi
0350     6fd0:	8b 4b 04             	mov    0x4(%rbx),%ecx
0353     6fd3:	48 c1 ea 03          	shr    $0x3,%rdx
0357     6fd7:	83 e6 07             	and    $0x7,%esi
035a     6fda:	42 0f b6 14 2a       	movzbl (%rdx,%r13,1),%edx
035f     6fdf:	40 38 f2             	cmp    %sil,%dl
0362     6fe2:	7f 08                	jg     6fec <___bpf_prog_run.cold+0x36c>
0364     6fe4:	84 d2                	test   %dl,%dl
0366     6fe6:	0f 85 99 00 00 00    	jne    7085 <___bpf_prog_run.cold+0x405>
036c     6fec:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
0370     6ff0:	83 e2 0f             	and    $0xf,%edx
0373     6ff3:	4d 8d 3c d6          	lea    (%r14,%rdx,8),%r15
0377     6ff7:	e9 00 00 00 00       	jmp    6ffc <___bpf_prog_run.cold+0x37c>	6ff8: R_X86_64_PC32	.text+0x5d6a47
037c     6ffc:	4c 89 cf             	mov    %r9,%rdi
037f     6fff:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0383     7003:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
0387     7007:	e8 00 00 00 00       	call   700c <___bpf_prog_run.cold+0x38c>	7008: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
038c     700c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
0390     7010:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
0394     7014:	e9 36 ff ff ff       	jmp    6f4f <___bpf_prog_run.cold+0x2cf>
0399     7019:	4c 89 c7             	mov    %r8,%rdi
039c     701c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
03a0     7020:	89 4d c0             	mov    %ecx,-0x40(%rbp)
03a3     7023:	e8 00 00 00 00       	call   7028 <___bpf_prog_run.cold+0x3a8>	7024: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
03a8     7028:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
03ac     702c:	8b 4d c0             	mov    -0x40(%rbp),%ecx
03af     702f:	e9 3d ff ff ff       	jmp    6f71 <___bpf_prog_run.cold+0x2f1>
03b4     7034:	4c 89 cf             	mov    %r9,%rdi
03b7     7037:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
03bb     703b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
03bf     703f:	e8 00 00 00 00       	call   7044 <___bpf_prog_run.cold+0x3c4>	7040: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03c4     7044:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
03c8     7048:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
03cc     704c:	e9 4d fe ff ff       	jmp    6e9e <___bpf_prog_run.cold+0x21e>
03d1     7051:	4c 89 c7             	mov    %r8,%rdi
03d4     7054:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
03d8     7058:	89 4d c0             	mov    %ecx,-0x40(%rbp)
03db     705b:	e8 00 00 00 00       	call   7060 <___bpf_prog_run.cold+0x3e0>	705c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
03e0     7060:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
03e4     7064:	8b 4d c0             	mov    -0x40(%rbp),%ecx
03e7     7067:	e9 54 fe ff ff       	jmp    6ec0 <___bpf_prog_run.cold+0x240>
03ec     706c:	4c 89 cf             	mov    %r9,%rdi
03ef     706f:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
03f3     7073:	e8 00 00 00 00       	call   7078 <___bpf_prog_run.cold+0x3f8>	7074: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03f8     7078:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
03fc     707c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0400     7080:	e9 45 ff ff ff       	jmp    6fca <___bpf_prog_run.cold+0x34a>
0405     7085:	4c 89 c7             	mov    %r8,%rdi
0408     7088:	89 4d b8             	mov    %ecx,-0x48(%rbp)
040b     708b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
040f     708f:	e8 00 00 00 00       	call   7094 <___bpf_prog_run.cold+0x414>	7090: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0414     7094:	8b 4d b8             	mov    -0x48(%rbp),%ecx
0417     7097:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
041b     709b:	e9 4c ff ff ff       	jmp    6fec <___bpf_prog_run.cold+0x36c>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
