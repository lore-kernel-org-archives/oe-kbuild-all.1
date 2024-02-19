Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDAB5674F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 23:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708386042; cv=none; b=LibkDGgKM5fE5HImKXQQ05YKkXyj1s38EgIKV7pqAdfQ6RlyNqQqKP2hmLLctZPk0NoWj2dOFXbNC0BkLPh4k9sJjk9cuXrRI5xokY9bCmrqc4y8iUuOPtQftK/7xHyUUo2ZLbX1BbsGhz4N1B5SKGD01ZOBX8rOvyv4Wq2PWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708386042; c=relaxed/simple;
	bh=QBY8c1HmfUXMHUuRAbmRaM7RsKnFQi+okeyZKMhBrPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Va1hHrIOzbml8H5IuMLpotjIALfdDgBa8KwS8rZ+X6aHPDGVSp2Jwm/s75N6GTGV2UDLE3MdOOUykOxa84nd2/cU2LCaNw9PVPG4Jc6ECE6eJjIndEFoq5vA7TbNYo6tW8UpNNDz+UAycXGu2K7c+3vyAG/VeIAGIQt8LA7h2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tz3uU0a5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tz3uU0a5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708386039; x=1739922039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QBY8c1HmfUXMHUuRAbmRaM7RsKnFQi+okeyZKMhBrPY=;
  b=Tz3uU0a52OpfOcu7QqL3bLMnb+iBlsLl3HHW9+gOZO/7duXm97PjKV6z
   ucHz1VWLNGEFYeMflzo2xfBdWln53PBIf2fnVszpGr4EGDW79LRLlqF+n
   fIi2+wfRNqD1fsTqXZsVMaTUeGIeVfhbMBIxmHKClS2pPE9TNWSCvYxYO
   NZkCogkYMniPu/CwWM/CGsG+BKV4J6AFfEfUBVnhFelzzVxz+LE4j8vCi
   abW9sxLLRr4D7tVvv5RCF0ZgIAbrU9E5x3s++eYmv9rWGtf0t4rnaGS4R
   TzZnLEJ8+B4+rbqhFhojuQbo2JSf4/ftJlncZndthXOR5RRX1ilBXdPrB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="6247110"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="6247110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 15:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4973072"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2024 15:40:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcDFR-00048a-16;
	Mon, 19 Feb 2024 23:40:33 +0000
Date: Tue, 20 Feb 2024 07:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26652/30000] kernel/rcu/tree.o: warning:
 objtool: __call_rcu_nocb_wake()+0x72f: unreachable instruction
Message-ID: <202402200707.T32ryiHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   df46ea018097bf4ecdaa007218ffdad47b3742b4
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [26652/30000] tracing: Make tracepoint lockdep check actually test something
config: x86_64-randconfig-161-20240219 (https://download.01.org/0day-ci/archive/20240220/202402200707.T32ryiHT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402200707.T32ryiHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402200707.T32ryiHT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.o: warning: objtool: __call_rcu_nocb_wake()+0x72f: unreachable instruction


objdump-func vmlinux.o __call_rcu_nocb_wake:
0000 00000000003a6ba0 <__call_rcu_nocb_wake>:
0000   3a6ba0:	55                   	push   %rbp
0001   3a6ba1:	41 57                	push   %r15
0003   3a6ba3:	41 56                	push   %r14
0005   3a6ba5:	41 55                	push   %r13
0007   3a6ba7:	41 54                	push   %r12
0009   3a6ba9:	53                   	push   %rbx
000a   3a6baa:	48 83 ec 48          	sub    $0x48,%rsp
000e   3a6bae:	48 89 d3             	mov    %rdx,%rbx
0011   3a6bb1:	89 f5                	mov    %esi,%ebp
0013   3a6bb3:	49 89 fe             	mov    %rdi,%r14
0016   3a6bb6:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001f   3a6bbf:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0024   3a6bc4:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
002e   3a6bce:	48 8d 44 24 38       	lea    0x38(%rsp),%rax
0033   3a6bd3:	48 c1 e8 03          	shr    $0x3,%rax
0037   3a6bd7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
003c   3a6bdc:	74 0a                	je     3a6be8 <__call_rcu_nocb_wake+0x48>
003e   3a6bde:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0043   3a6be3:	e8 00 00 00 00       	call   3a6be8 <__call_rcu_nocb_wake+0x48>	3a6be4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0048   3a6be8:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
0051   3a6bf1:	4d 8d be b8 01 00 00 	lea    0x1b8(%r14),%r15
0058   3a6bf8:	4c 89 f8             	mov    %r15,%rax
005b   3a6bfb:	48 c1 e8 03          	shr    $0x3,%rax
005f   3a6bff:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0064   3a6c04:	74 08                	je     3a6c0e <__call_rcu_nocb_wake+0x6e>
0066   3a6c06:	4c 89 ff             	mov    %r15,%rdi
0069   3a6c09:	e8 00 00 00 00       	call   3a6c0e <__call_rcu_nocb_wake+0x6e>	3a6c0a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
006e   3a6c0e:	49 8b 07             	mov    (%r15),%rax
0071   3a6c11:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 3a6c18 <__call_rcu_nocb_wake+0x78>	3a6c13: R_X86_64_PC32	.data..read_mostly+0x24b7
0078   3a6c18:	0f 85 f2 00 00 00    	jne    3a6d10 <__call_rcu_nocb_wake+0x170>
007e   3a6c1e:	48 85 c0             	test   %rax,%rax
0081   3a6c21:	0f 84 e9 00 00 00    	je     3a6d10 <__call_rcu_nocb_wake+0x170>
0087   3a6c27:	4d 8d be 00 01 00 00 	lea    0x100(%r14),%r15
008e   3a6c2e:	4c 89 ff             	mov    %r15,%rdi
0091   3a6c31:	be 08 00 00 00       	mov    $0x8,%esi
0096   3a6c36:	e8 00 00 00 00       	call   3a6c3b <__call_rcu_nocb_wake+0x9b>	3a6c37: R_X86_64_PLT32	__kasan_check_read-0x4
009b   3a6c3b:	4c 89 f8             	mov    %r15,%rax
009e   3a6c3e:	48 c1 e8 03          	shr    $0x3,%rax
00a2   3a6c42:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00a7   3a6c47:	74 08                	je     3a6c51 <__call_rcu_nocb_wake+0xb1>
00a9   3a6c49:	4c 89 ff             	mov    %r15,%rdi
00ac   3a6c4c:	e8 00 00 00 00       	call   3a6c51 <__call_rcu_nocb_wake+0xb1>	3a6c4d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b1   3a6c51:	4d 8b a6 00 01 00 00 	mov    0x100(%r14),%r12
00b8   3a6c58:	4d 8d be 10 01 00 00 	lea    0x110(%r14),%r15
00bf   3a6c5f:	40 84 ed             	test   %bpl,%bpl
00c2   3a6c62:	0f 84 78 02 00 00    	je     3a6ee0 <__call_rcu_nocb_wake+0x340>
00c8   3a6c68:	4c 89 f8             	mov    %r15,%rax
00cb   3a6c6b:	48 c1 e8 03          	shr    $0x3,%rax
00cf   3a6c6f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00d4   3a6c74:	74 08                	je     3a6c7e <__call_rcu_nocb_wake+0xde>
00d6   3a6c76:	4c 89 ff             	mov    %r15,%rdi
00d9   3a6c79:	e8 00 00 00 00       	call   3a6c7e <__call_rcu_nocb_wake+0xde>	3a6c7a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
00de   3a6c7e:	4d 89 27             	mov    %r12,(%r15)
00e1   3a6c81:	f7 c3 00 02 00 00    	test   $0x200,%ebx
00e7   3a6c87:	0f 85 e2 04 00 00    	jne    3a716f <__call_rcu_nocb_wake+0x5cf>
00ed   3a6c8d:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 3a6c94 <__call_rcu_nocb_wake+0xf4>	3a6c90: R_X86_64_PC32	__tracepoint_str+0x284
00f4   3a6c94:	4c 89 f7             	mov    %r14,%rdi
00f7   3a6c97:	be 01 00 00 00       	mov    $0x1,%esi
00fc   3a6c9c:	e8 3f 54 01 00       	call   3bc0e0 <wake_nocb_gp_defer>
0101   3a6ca1:	4d 8d be 09 01 00 00 	lea    0x109(%r14),%r15
0108   3a6ca8:	4c 89 f8             	mov    %r15,%rax
010b   3a6cab:	48 c1 e8 03          	shr    $0x3,%rax
010f   3a6caf:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0114   3a6cb4:	84 c0                	test   %al,%al
0116   3a6cb6:	0f 85 7f 09 00 00    	jne    3a763b <__call_rcu_nocb_wake+0xa9b>
011c   3a6cbc:	41 80 3f 00          	cmpb   $0x0,(%r15)
0120   3a6cc0:	0f 84 2e 08 00 00    	je     3a74f4 <__call_rcu_nocb_wake+0x954>
0126   3a6cc6:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a6cc9: R_X86_64_32S	debug_locks
012d   3a6ccd:	48 c1 e8 03          	shr    $0x3,%rax
0131   3a6cd1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0136   3a6cd6:	84 c0                	test   %al,%al
0138   3a6cd8:	0f 85 5f 0a 00 00    	jne    3a773d <__call_rcu_nocb_wake+0xb9d>
013e   3a6cde:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a6ce5 <__call_rcu_nocb_wake+0x145>	3a6ce0: R_X86_64_PC32	debug_locks-0x5
0145   3a6ce5:	0f 84 d5 07 00 00    	je     3a74c0 <__call_rcu_nocb_wake+0x920>
014b   3a6ceb:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a6cf2 <__call_rcu_nocb_wake+0x152>	3a6cee: R_X86_64_PC32	lockdep_recursion-0x4
0152   3a6cf2:	85 c0                	test   %eax,%eax
0154   3a6cf4:	0f 85 c6 07 00 00    	jne    3a74c0 <__call_rcu_nocb_wake+0x920>
015a   3a6cfa:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a6d01 <__call_rcu_nocb_wake+0x161>	3a6cfd: R_X86_64_PC32	hardirqs_enabled-0x4
0161   3a6d01:	85 c0                	test   %eax,%eax
0163   3a6d03:	0f 84 b7 07 00 00    	je     3a74c0 <__call_rcu_nocb_wake+0x920>
0169   3a6d09:	0f 0b                	ud2
016b   3a6d0b:	e9 b0 07 00 00       	jmp    3a74c0 <__call_rcu_nocb_wake+0x920>
0170   3a6d10:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 3a6d17 <__call_rcu_nocb_wake+0x177>	3a6d13: R_X86_64_PC32	.data+0x4f7b54
0177   3a6d17:	4d 8d a6 b0 04 00 00 	lea    0x4b0(%r14),%r12
017e   3a6d1e:	4c 89 e0             	mov    %r12,%rax
0181   3a6d21:	48 c1 e8 03          	shr    $0x3,%rax
0185   3a6d25:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
018a   3a6d2a:	84 c0                	test   %al,%al
018c   3a6d2c:	0f 85 66 08 00 00    	jne    3a7598 <__call_rcu_nocb_wake+0x9f8>
0192   3a6d32:	48 89 1c 24          	mov    %rbx,(%rsp)
0196   3a6d36:	41 8b 2c 24          	mov    (%r12),%ebp
019a   3a6d3a:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 3a6d41 <__call_rcu_nocb_wake+0x1a1>	3a6d3d: R_X86_64_PC32	__tracepoint_str+0x274
01a1   3a6d41:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a6d44: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
01a8   3a6d48:	48 c1 e8 03          	shr    $0x3,%rax
01ac   3a6d4c:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
01b1   3a6d51:	84 c0                	test   %al,%al
01b3   3a6d53:	0f 85 5d 08 00 00    	jne    3a75b6 <__call_rcu_nocb_wake+0xa16>
01b9   3a6d59:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a6d60 <__call_rcu_nocb_wake+0x1c0>	3a6d5b: R_X86_64_PC32	__tracepoint_rcu_nocb_wake+0x3
01c0   3a6d60:	0f 8e 98 00 00 00    	jle    3a6dfe <__call_rcu_nocb_wake+0x25e>
01c6   3a6d66:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a6d6d <__call_rcu_nocb_wake+0x1cd>	3a6d69: R_X86_64_PC32	cpu_number-0x4
01cd   3a6d6d:	4c 89 eb             	mov    %r13,%rbx
01d0   3a6d70:	41 89 c5             	mov    %eax,%r13d
01d3   3a6d73:	c1 e8 06             	shr    $0x6,%eax
01d6   3a6d76:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	3a6d7a: R_X86_64_32S	__cpu_online_mask
01de   3a6d7e:	be 08 00 00 00       	mov    $0x8,%esi
01e3   3a6d83:	e8 00 00 00 00       	call   3a6d88 <__call_rcu_nocb_wake+0x1e8>	3a6d84: R_X86_64_PLT32	__kasan_check_read-0x4
01e8   3a6d88:	4c 0f a3 2d 00 00 00 00 	bt     %r13,0x0(%rip)        # 3a6d90 <__call_rcu_nocb_wake+0x1f0>	3a6d8c: R_X86_64_PC32	__cpu_online_mask-0x4
01f0   3a6d90:	49 89 dd             	mov    %rbx,%r13
01f3   3a6d93:	0f 83 d4 00 00 00    	jae    3a6e6d <__call_rcu_nocb_wake+0x2cd>
01f9   3a6d99:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3a6da0 <__call_rcu_nocb_wake+0x200>	3a6d9c: R_X86_64_PC32	__preempt_count-0x4
0200   3a6da0:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a6da3: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x38
0207   3a6da7:	48 c1 e8 03          	shr    $0x3,%rax
020b   3a6dab:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0210   3a6db0:	74 0c                	je     3a6dbe <__call_rcu_nocb_wake+0x21e>
0212   3a6db2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a6db5: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x38
0219   3a6db9:	e8 00 00 00 00       	call   3a6dbe <__call_rcu_nocb_wake+0x21e>	3a6dba: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
021e   3a6dbe:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 3a6dc5 <__call_rcu_nocb_wake+0x225>	3a6dc1: R_X86_64_PC32	__tracepoint_rcu_nocb_wake+0x34
0225   3a6dc5:	4d 85 ed             	test   %r13,%r13
0228   3a6dc8:	74 2a                	je     3a6df4 <__call_rcu_nocb_wake+0x254>
022a   3a6dca:	49 83 c5 08          	add    $0x8,%r13
022e   3a6dce:	4c 89 e8             	mov    %r13,%rax
0231   3a6dd1:	48 c1 e8 03          	shr    $0x3,%rax
0235   3a6dd5:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0239   3a6dd9:	74 08                	je     3a6de3 <__call_rcu_nocb_wake+0x243>
023b   3a6ddb:	4c 89 ef             	mov    %r13,%rdi
023e   3a6dde:	e8 00 00 00 00       	call   3a6de3 <__call_rcu_nocb_wake+0x243>	3a6ddf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0243   3a6de3:	49 8b 7d 00          	mov    0x0(%r13),%rdi
0247   3a6de7:	4c 89 fe             	mov    %r15,%rsi
024a   3a6dea:	89 ea                	mov    %ebp,%edx
024c   3a6dec:	4c 89 e1             	mov    %r12,%rcx
024f   3a6def:	e8 00 00 00 00       	call   3a6df4 <__call_rcu_nocb_wake+0x254>	3a6df0: R_X86_64_PLT32	__SCT__tp_func_rcu_nocb_wake-0x4
0254   3a6df4:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3a6dfb <__call_rcu_nocb_wake+0x25b>	3a6df7: R_X86_64_PC32	__preempt_count-0x4
025b   3a6dfb:	49 89 dd             	mov    %rbx,%r13
025e   3a6dfe:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a6e05 <__call_rcu_nocb_wake+0x265>	3a6e01: R_X86_64_PC32	cpu_number-0x4
0265   3a6e05:	41 89 c7             	mov    %eax,%r15d
0268   3a6e08:	c1 e8 06             	shr    $0x6,%eax
026b   3a6e0b:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	3a6e0f: R_X86_64_32S	__cpu_online_mask
0273   3a6e13:	be 08 00 00 00       	mov    $0x8,%esi
0278   3a6e18:	e8 00 00 00 00       	call   3a6e1d <__call_rcu_nocb_wake+0x27d>	3a6e19: R_X86_64_PLT32	__kasan_check_read-0x4
027d   3a6e1d:	4c 0f a3 3d 00 00 00 00 	bt     %r15,0x0(%rip)        # 3a6e25 <__call_rcu_nocb_wake+0x285>	3a6e21: R_X86_64_PC32	__cpu_online_mask-0x4
0285   3a6e25:	73 46                	jae    3a6e6d <__call_rcu_nocb_wake+0x2cd>
0287   3a6e27:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3a6e2e <__call_rcu_nocb_wake+0x28e>	3a6e2a: R_X86_64_PC32	__preempt_count-0x4
028e   3a6e2e:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	3a6e31: R_X86_64_32S	.data..percpu..shared_aligned+0x18c0
0295   3a6e35:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 3a6e3d <__call_rcu_nocb_wake+0x29d>	3a6e39: R_X86_64_PC32	this_cpu_off-0x4
029d   3a6e3d:	49 81 c7 48 01 00 00 	add    $0x148,%r15
02a4   3a6e44:	4c 89 f8             	mov    %r15,%rax
02a7   3a6e47:	48 c1 e8 03          	shr    $0x3,%rax
02ab   3a6e4b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
02b0   3a6e50:	84 c0                	test   %al,%al
02b2   3a6e52:	0f 85 c5 07 00 00    	jne    3a761d <__call_rcu_nocb_wake+0xa7d>
02b8   3a6e58:	41 8b 07             	mov    (%r15),%eax
02bb   3a6e5b:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3a6e62 <__call_rcu_nocb_wake+0x2c2>	3a6e5e: R_X86_64_PC32	__preempt_count-0x4
02c2   3a6e62:	a9 02 00 00 00       	test   $0x2,%eax
02c7   3a6e67:	0f 84 0f 07 00 00    	je     3a757c <__call_rcu_nocb_wake+0x9dc>
02cd   3a6e6d:	4d 8d be 09 01 00 00 	lea    0x109(%r14),%r15
02d4   3a6e74:	4c 89 f8             	mov    %r15,%rax
02d7   3a6e77:	48 c1 e8 03          	shr    $0x3,%rax
02db   3a6e7b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
02e0   3a6e80:	84 c0                	test   %al,%al
02e2   3a6e82:	0f 85 54 07 00 00    	jne    3a75dc <__call_rcu_nocb_wake+0xa3c>
02e8   3a6e88:	41 80 3f 00          	cmpb   $0x0,(%r15)
02ec   3a6e8c:	48 8b 1c 24          	mov    (%rsp),%rbx
02f0   3a6e90:	0f 84 a9 02 00 00    	je     3a713f <__call_rcu_nocb_wake+0x59f>
02f6   3a6e96:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a6e99: R_X86_64_32S	debug_locks
02fd   3a6e9d:	48 c1 e8 03          	shr    $0x3,%rax
0301   3a6ea1:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0306   3a6ea6:	84 c0                	test   %al,%al
0308   3a6ea8:	0f 85 49 07 00 00    	jne    3a75f7 <__call_rcu_nocb_wake+0xa57>
030e   3a6eae:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a6eb5 <__call_rcu_nocb_wake+0x315>	3a6eb0: R_X86_64_PC32	debug_locks-0x5
0315   3a6eb5:	0f 84 05 06 00 00    	je     3a74c0 <__call_rcu_nocb_wake+0x920>
031b   3a6ebb:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a6ec2 <__call_rcu_nocb_wake+0x322>	3a6ebe: R_X86_64_PC32	lockdep_recursion-0x4
0322   3a6ec2:	85 c0                	test   %eax,%eax
0324   3a6ec4:	0f 85 f6 05 00 00    	jne    3a74c0 <__call_rcu_nocb_wake+0x920>
032a   3a6eca:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a6ed1 <__call_rcu_nocb_wake+0x331>	3a6ecd: R_X86_64_PC32	hardirqs_enabled-0x4
0331   3a6ed1:	85 c0                	test   %eax,%eax
0333   3a6ed3:	0f 84 e7 05 00 00    	je     3a74c0 <__call_rcu_nocb_wake+0x920>
0339   3a6ed9:	0f 0b                	ud2
033b   3a6edb:	e9 e0 05 00 00       	jmp    3a74c0 <__call_rcu_nocb_wake+0x920>
0340   3a6ee0:	4c 89 e8             	mov    %r13,%rax
0343   3a6ee3:	4d 89 fd             	mov    %r15,%r13
0346   3a6ee6:	49 c1 ed 03          	shr    $0x3,%r13
034a   3a6eea:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
0350   3a6ef0:	74 08                	je     3a6efa <__call_rcu_nocb_wake+0x35a>
0352   3a6ef2:	4c 89 ff             	mov    %r15,%rdi
0355   3a6ef5:	e8 00 00 00 00       	call   3a6efa <__call_rcu_nocb_wake+0x35a>	3a6ef6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
035a   3a6efa:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 3a6f01 <__call_rcu_nocb_wake+0x361>	3a6efd: R_X86_64_PC32	.data+0x4f5e5c
0361   3a6f01:	49 03 07             	add    (%r15),%rax
0364   3a6f04:	49 39 c4             	cmp    %rax,%r12
0367   3a6f07:	0f 8e db 03 00 00    	jle    3a72e8 <__call_rcu_nocb_wake+0x748>
036d   3a6f0d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0377   3a6f17:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
037d   3a6f1d:	49 89 c5             	mov    %rax,%r13
0380   3a6f20:	74 08                	je     3a6f2a <__call_rcu_nocb_wake+0x38a>
0382   3a6f22:	4c 89 ff             	mov    %r15,%rdi
0385   3a6f25:	e8 00 00 00 00       	call   3a6f2a <__call_rcu_nocb_wake+0x38a>	3a6f26: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
038a   3a6f2a:	4d 89 27             	mov    %r12,(%r15)
038d   3a6f2d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a6f30: R_X86_64_32S	jiffies
0394   3a6f34:	48 c1 e8 03          	shr    $0x3,%rax
0398   3a6f38:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
039d   3a6f3d:	74 0c                	je     3a6f4b <__call_rcu_nocb_wake+0x3ab>
039f   3a6f3f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a6f42: R_X86_64_32S	jiffies
03a6   3a6f46:	e8 00 00 00 00       	call   3a6f4b <__call_rcu_nocb_wake+0x3ab>	3a6f47: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03ab   3a6f4b:	48 8b 2d 00 00 00 00 	mov    0x0(%rip),%rbp        # 3a6f52 <__call_rcu_nocb_wake+0x3b2>	3a6f4e: R_X86_64_PC32	jiffies-0x4
03b2   3a6f52:	4d 8d be 78 02 00 00 	lea    0x278(%r14),%r15
03b9   3a6f59:	4d 89 fc             	mov    %r15,%r12
03bc   3a6f5c:	49 c1 ec 03          	shr    $0x3,%r12
03c0   3a6f60:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
03c5   3a6f65:	74 08                	je     3a6f6f <__call_rcu_nocb_wake+0x3cf>
03c7   3a6f67:	4c 89 ff             	mov    %r15,%rdi
03ca   3a6f6a:	e8 00 00 00 00       	call   3a6f6f <__call_rcu_nocb_wake+0x3cf>	3a6f6b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03cf   3a6f6f:	49 8d 8e b8 00 00 00 	lea    0xb8(%r14),%rcx
03d6   3a6f76:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
03db   3a6f7b:	49 3b 2f             	cmp    (%r15),%rbp
03de   3a6f7e:	0f 84 cb 00 00 00    	je     3a704f <__call_rcu_nocb_wake+0x4af>
03e4   3a6f84:	48 8d 6c 24 38       	lea    0x38(%rsp),%rbp
03e9   3a6f89:	48 89 cf             	mov    %rcx,%rdi
03ec   3a6f8c:	48 89 ee             	mov    %rbp,%rsi
03ef   3a6f8f:	48 89 0c 24          	mov    %rcx,(%rsp)
03f3   3a6f93:	e8 00 00 00 00       	call   3a6f98 <__call_rcu_nocb_wake+0x3f8>	3a6f94: R_X86_64_PLT32	rcu_segcblist_nextgp-0x4
03f8   3a6f98:	48 8b 0c 24          	mov    (%rsp),%rcx
03fc   3a6f9c:	84 c0                	test   %al,%al
03fe   3a6f9e:	0f 84 ab 00 00 00    	je     3a704f <__call_rcu_nocb_wake+0x4af>
0404   3a6fa4:	4c 89 e9             	mov    %r13,%rcx
0407   3a6fa7:	4d 8d 6e 18          	lea    0x18(%r14),%r13
040b   3a6fab:	4c 89 e8             	mov    %r13,%rax
040e   3a6fae:	48 c1 e8 03          	shr    $0x3,%rax
0412   3a6fb2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0416   3a6fb6:	74 08                	je     3a6fc0 <__call_rcu_nocb_wake+0x420>
0418   3a6fb8:	4c 89 ef             	mov    %r13,%rdi
041b   3a6fbb:	e8 00 00 00 00       	call   3a6fc0 <__call_rcu_nocb_wake+0x420>	3a6fbc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0420   3a6fc0:	49 8b 45 00          	mov    0x0(%r13),%rax
0424   3a6fc4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0429   3a6fc9:	4c 8d 68 40          	lea    0x40(%rax),%r13
042d   3a6fcd:	48 c1 ed 03          	shr    $0x3,%rbp
0431   3a6fd1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
043b   3a6fdb:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
0440   3a6fe0:	74 0a                	je     3a6fec <__call_rcu_nocb_wake+0x44c>
0442   3a6fe2:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0447   3a6fe7:	e8 00 00 00 00       	call   3a6fec <__call_rcu_nocb_wake+0x44c>	3a6fe8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
044c   3a6fec:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
0451   3a6ff1:	4c 89 e8             	mov    %r13,%rax
0454   3a6ff4:	48 c1 e8 03          	shr    $0x3,%rax
0458   3a6ff8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0462   3a7002:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0466   3a7006:	74 08                	je     3a7010 <__call_rcu_nocb_wake+0x470>
0468   3a7008:	4c 89 ef             	mov    %r13,%rdi
046b   3a700b:	e8 00 00 00 00       	call   3a7010 <__call_rcu_nocb_wake+0x470>	3a700c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0470   3a7010:	49 8b 45 00          	mov    0x0(%r13),%rax
0474   3a7014:	48 39 e8             	cmp    %rbp,%rax
0477   3a7017:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0481   3a7021:	48 8b 0c 24          	mov    (%rsp),%rcx
0485   3a7025:	78 28                	js     3a704f <__call_rcu_nocb_wake+0x4af>
0487   3a7027:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
048c   3a702c:	4c 89 f6             	mov    %r14,%rsi
048f   3a702f:	e8 cc 5e 00 00       	call   3acf00 <rcu_advance_cbs_nowake>
0494   3a7034:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
0499   3a7039:	74 08                	je     3a7043 <__call_rcu_nocb_wake+0x4a3>
049b   3a703b:	4c 89 ff             	mov    %r15,%rdi
049e   3a703e:	e8 00 00 00 00       	call   3a7043 <__call_rcu_nocb_wake+0x4a3>	3a703f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
04a3   3a7043:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
04a8   3a7048:	49 89 07             	mov    %rax,(%r15)
04ab   3a704b:	48 8b 0c 24          	mov    (%rsp),%rcx
04af   3a704f:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%rsp)
04b5   3a7055:	4d 8d a6 18 04 00 00 	lea    0x418(%r14),%r12
04bc   3a705c:	4c 89 e0             	mov    %r12,%rax
04bf   3a705f:	48 c1 e8 03          	shr    $0x3,%rax
04c3   3a7063:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
04c8   3a7068:	84 c0                	test   %al,%al
04ca   3a706a:	0f 85 e6 05 00 00    	jne    3a7656 <__call_rcu_nocb_wake+0xab6>
04d0   3a7070:	45 0f b6 24 24       	movzbl (%r12),%r12d
04d5   3a7075:	49 83 fc 02          	cmp    $0x2,%r12
04d9   3a7079:	0f 83 6b 07 00 00    	jae    3a77ea <__call_rcu_nocb_wake+0xc4a>
04df   3a707f:	41 f6 c4 01          	test   $0x1,%r12b
04e3   3a7083:	75 0c                	jne    3a7091 <__call_rcu_nocb_wake+0x4f1>
04e5   3a7085:	48 89 cf             	mov    %rcx,%rdi
04e8   3a7088:	e8 00 00 00 00       	call   3a708d <__call_rcu_nocb_wake+0x4ed>	3a7089: R_X86_64_PLT32	rcu_segcblist_ready_cbs-0x4
04ed   3a708d:	84 c0                	test   %al,%al
04ef   3a708f:	75 37                	jne    3a70c8 <__call_rcu_nocb_wake+0x528>
04f1   3a7091:	4d 8d be 48 03 00 00 	lea    0x348(%r14),%r15
04f8   3a7098:	4c 89 f8             	mov    %r15,%rax
04fb   3a709b:	48 c1 e8 03          	shr    $0x3,%rax
04ff   3a709f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0504   3a70a4:	74 08                	je     3a70ae <__call_rcu_nocb_wake+0x50e>
0506   3a70a6:	4c 89 ff             	mov    %r15,%rdi
0509   3a70a9:	e8 00 00 00 00       	call   3a70ae <__call_rcu_nocb_wake+0x50e>	3a70aa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
050e   3a70ae:	49 83 3f 00          	cmpq   $0x0,(%r15)
0512   3a70b2:	75 14                	jne    3a70c8 <__call_rcu_nocb_wake+0x528>
0514   3a70b4:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 3a70bb <__call_rcu_nocb_wake+0x51b>	3a70b7: R_X86_64_PC32	__tracepoint_str+0x28c
051b   3a70bb:	4c 89 f7             	mov    %r14,%rdi
051e   3a70be:	be 02 00 00 00       	mov    $0x2,%esi
0523   3a70c3:	e8 18 50 01 00       	call   3bc0e0 <wake_nocb_gp_defer>
0528   3a70c8:	4d 8d be 09 01 00 00 	lea    0x109(%r14),%r15
052f   3a70cf:	4c 89 f8             	mov    %r15,%rax
0532   3a70d2:	48 c1 e8 03          	shr    $0x3,%rax
0536   3a70d6:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
053b   3a70db:	84 c0                	test   %al,%al
053d   3a70dd:	0f 85 97 05 00 00    	jne    3a767a <__call_rcu_nocb_wake+0xada>
0543   3a70e3:	41 80 3f 00          	cmpb   $0x0,(%r15)
0547   3a70e7:	0f 84 27 04 00 00    	je     3a7514 <__call_rcu_nocb_wake+0x974>
054d   3a70ed:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a70f0: R_X86_64_32S	debug_locks
0554   3a70f4:	48 c1 e8 03          	shr    $0x3,%rax
0558   3a70f8:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
055d   3a70fd:	84 c0                	test   %al,%al
055f   3a70ff:	0f 85 5e 06 00 00    	jne    3a7763 <__call_rcu_nocb_wake+0xbc3>
0565   3a7105:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a710c <__call_rcu_nocb_wake+0x56c>	3a7107: R_X86_64_PC32	debug_locks-0x5
056c   3a710c:	74 1a                	je     3a7128 <__call_rcu_nocb_wake+0x588>
056e   3a710e:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a7115 <__call_rcu_nocb_wake+0x575>	3a7111: R_X86_64_PC32	lockdep_recursion-0x4
0575   3a7115:	85 c0                	test   %eax,%eax
0577   3a7117:	75 0f                	jne    3a7128 <__call_rcu_nocb_wake+0x588>
0579   3a7119:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a7120 <__call_rcu_nocb_wake+0x580>	3a711c: R_X86_64_PC32	hardirqs_enabled-0x4
0580   3a7120:	85 c0                	test   %eax,%eax
0582   3a7122:	0f 85 62 04 00 00    	jne    3a758a <__call_rcu_nocb_wake+0x9ea>
0588   3a7128:	49 81 c6 c0 01 00 00 	add    $0x1c0,%r14
058f   3a712f:	4c 89 f7             	mov    %r14,%rdi
0592   3a7132:	48 89 de             	mov    %rbx,%rsi
0595   3a7135:	e8 00 00 00 00       	call   3a713a <__call_rcu_nocb_wake+0x59a>	3a7136: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
059a   3a713a:	e9 ec 03 00 00       	jmp    3a752b <__call_rcu_nocb_wake+0x98b>
059f   3a713f:	f7 c3 00 02 00 00    	test   $0x200,%ebx
05a5   3a7145:	74 05                	je     3a714c <__call_rcu_nocb_wake+0x5ac>
05a7   3a7147:	e8 00 00 00 00       	call   3a714c <__call_rcu_nocb_wake+0x5ac>	3a7148: R_X86_64_PLT32	trace_hardirqs_on-0x4
05ac   3a714c:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
05b5   3a7155:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
05ba   3a715a:	0f 85 d8 05 00 00    	jne    3a7738 <__call_rcu_nocb_wake+0xb98>
05c0   3a7160:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
05c5   3a7165:	ff 74 24 18          	push   0x18(%rsp)
05c9   3a7169:	9d                   	popf
05ca   3a716a:	e9 d0 03 00 00       	jmp    3a753f <__call_rcu_nocb_wake+0x99f>
05cf   3a716f:	4c 89 f7             	mov    %r14,%rdi
05d2   3a7172:	31 f6                	xor    %esi,%esi
05d4   3a7174:	48 89 da             	mov    %rbx,%rdx
05d7   3a7177:	e8 94 34 01 00       	call   3ba610 <wake_nocb_gp>
05dc   3a717c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 3a7183 <__call_rcu_nocb_wake+0x5e3>	3a717f: R_X86_64_PC32	.data+0x4f7b54
05e3   3a7183:	49 81 c6 b0 04 00 00 	add    $0x4b0,%r14
05ea   3a718a:	4c 89 f0             	mov    %r14,%rax
05ed   3a718d:	48 c1 e8 03          	shr    $0x3,%rax
05f1   3a7191:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
05f6   3a7196:	84 c0                	test   %al,%al
05f8   3a7198:	0f 85 f7 04 00 00    	jne    3a7695 <__call_rcu_nocb_wake+0xaf5>
05fe   3a719e:	41 8b 2e             	mov    (%r14),%ebp
0601   3a71a1:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 3a71a8 <__call_rcu_nocb_wake+0x608>	3a71a4: R_X86_64_PC32	__tracepoint_str+0x27c
0608   3a71a8:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a71ab: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
060f   3a71af:	48 c1 e8 03          	shr    $0x3,%rax
0613   3a71b3:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0618   3a71b8:	84 c0                	test   %al,%al
061a   3a71ba:	0f 85 f3 04 00 00    	jne    3a76b3 <__call_rcu_nocb_wake+0xb13>
0620   3a71c0:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a71c7 <__call_rcu_nocb_wake+0x627>	3a71c2: R_X86_64_PC32	__tracepoint_rcu_nocb_wake+0x3
0627   3a71c7:	0f 8e 8f 00 00 00    	jle    3a725c <__call_rcu_nocb_wake+0x6bc>
062d   3a71cd:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a71d4 <__call_rcu_nocb_wake+0x634>	3a71d0: R_X86_64_PC32	cpu_number-0x4
0634   3a71d4:	41 89 c7             	mov    %eax,%r15d
0637   3a71d7:	c1 e8 06             	shr    $0x6,%eax
063a   3a71da:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	3a71de: R_X86_64_32S	__cpu_online_mask
0642   3a71e2:	be 08 00 00 00       	mov    $0x8,%esi
0647   3a71e7:	e8 00 00 00 00       	call   3a71ec <__call_rcu_nocb_wake+0x64c>	3a71e8: R_X86_64_PLT32	__kasan_check_read-0x4
064c   3a71ec:	4c 0f a3 3d 00 00 00 00 	bt     %r15,0x0(%rip)        # 3a71f4 <__call_rcu_nocb_wake+0x654>	3a71f0: R_X86_64_PC32	__cpu_online_mask-0x4
0654   3a71f4:	0f 83 31 03 00 00    	jae    3a752b <__call_rcu_nocb_wake+0x98b>
065a   3a71fa:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3a7201 <__call_rcu_nocb_wake+0x661>	3a71fd: R_X86_64_PC32	__preempt_count-0x4
0661   3a7201:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a7204: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x38
0668   3a7208:	48 c1 e8 03          	shr    $0x3,%rax
066c   3a720c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0671   3a7211:	74 0c                	je     3a721f <__call_rcu_nocb_wake+0x67f>
0673   3a7213:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a7216: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x38
067a   3a721a:	e8 00 00 00 00       	call   3a721f <__call_rcu_nocb_wake+0x67f>	3a721b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
067f   3a721f:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 3a7226 <__call_rcu_nocb_wake+0x686>	3a7222: R_X86_64_PC32	__tracepoint_rcu_nocb_wake+0x34
0686   3a7226:	4d 85 ff             	test   %r15,%r15
0689   3a7229:	74 2a                	je     3a7255 <__call_rcu_nocb_wake+0x6b5>
068b   3a722b:	49 83 c7 08          	add    $0x8,%r15
068f   3a722f:	4c 89 f8             	mov    %r15,%rax
0692   3a7232:	48 c1 e8 03          	shr    $0x3,%rax
0696   3a7236:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
069b   3a723b:	74 08                	je     3a7245 <__call_rcu_nocb_wake+0x6a5>
069d   3a723d:	4c 89 ff             	mov    %r15,%rdi
06a0   3a7240:	e8 00 00 00 00       	call   3a7245 <__call_rcu_nocb_wake+0x6a5>	3a7241: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06a5   3a7245:	49 8b 3f             	mov    (%r15),%rdi
06a8   3a7248:	48 89 de             	mov    %rbx,%rsi
06ab   3a724b:	89 ea                	mov    %ebp,%edx
06ad   3a724d:	4c 89 f1             	mov    %r14,%rcx
06b0   3a7250:	e8 00 00 00 00       	call   3a7255 <__call_rcu_nocb_wake+0x6b5>	3a7251: R_X86_64_PLT32	__SCT__tp_func_rcu_nocb_wake-0x4
06b5   3a7255:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3a725c <__call_rcu_nocb_wake+0x6bc>	3a7258: R_X86_64_PC32	__preempt_count-0x4
06bc   3a725c:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a7263 <__call_rcu_nocb_wake+0x6c3>	3a725f: R_X86_64_PC32	cpu_number-0x4
06c3   3a7263:	89 c3                	mov    %eax,%ebx
06c5   3a7265:	c1 e8 06             	shr    $0x6,%eax
06c8   3a7268:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	3a726c: R_X86_64_32S	__cpu_online_mask
06d0   3a7270:	be 08 00 00 00       	mov    $0x8,%esi
06d5   3a7275:	e8 00 00 00 00       	call   3a727a <__call_rcu_nocb_wake+0x6da>	3a7276: R_X86_64_PLT32	__kasan_check_read-0x4
06da   3a727a:	48 0f a3 1d 00 00 00 00 	bt     %rbx,0x0(%rip)        # 3a7282 <__call_rcu_nocb_wake+0x6e2>	3a727e: R_X86_64_PC32	__cpu_online_mask-0x4
06e2   3a7282:	0f 83 a3 02 00 00    	jae    3a752b <__call_rcu_nocb_wake+0x98b>
06e8   3a7288:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3a728f <__call_rcu_nocb_wake+0x6ef>	3a728b: R_X86_64_PC32	__preempt_count-0x4
06ef   3a728f:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	3a7292: R_X86_64_32S	.data..percpu..shared_aligned+0x18c0
06f6   3a7296:	65 48 03 1d 00 00 00 00 	add    %gs:0x0(%rip),%rbx        # 3a729e <__call_rcu_nocb_wake+0x6fe>	3a729a: R_X86_64_PC32	this_cpu_off-0x4
06fe   3a729e:	48 81 c3 48 01 00 00 	add    $0x148,%rbx
0705   3a72a5:	48 89 d8             	mov    %rbx,%rax
0708   3a72a8:	48 c1 e8 03          	shr    $0x3,%rax
070c   3a72ac:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0711   3a72b1:	84 c0                	test   %al,%al
0713   3a72b3:	0f 85 f6 04 00 00    	jne    3a77af <__call_rcu_nocb_wake+0xc0f>
0719   3a72b9:	8b 03                	mov    (%rbx),%eax
071b   3a72bb:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3a72c2 <__call_rcu_nocb_wake+0x722>	3a72be: R_X86_64_PC32	__preempt_count-0x4
0722   3a72c2:	a9 02 00 00 00       	test   $0x2,%eax
0727   3a72c7:	0f 85 5e 02 00 00    	jne    3a752b <__call_rcu_nocb_wake+0x98b>
072d   3a72cd:	0f 0b                	ud2
072f   3a72cf:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0738   3a72d8:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
073d   3a72dd:	0f 85 55 04 00 00    	jne    3a7738 <__call_rcu_nocb_wake+0xb98>
0743   3a72e3:	e9 57 02 00 00       	jmp    3a753f <__call_rcu_nocb_wake+0x99f>
0748   3a72e8:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 3a72ef <__call_rcu_nocb_wake+0x74f>	3a72eb: R_X86_64_PC32	.data+0x4f7b54
074f   3a72ef:	4d 8d a6 b0 04 00 00 	lea    0x4b0(%r14),%r12
0756   3a72f6:	4c 89 e0             	mov    %r12,%rax
0759   3a72f9:	48 c1 e8 03          	shr    $0x3,%rax
075d   3a72fd:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0767   3a7307:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
076c   3a730c:	84 c0                	test   %al,%al
076e   3a730e:	0f 85 c5 03 00 00    	jne    3a76d9 <__call_rcu_nocb_wake+0xb39>
0774   3a7314:	41 8b 2c 24          	mov    (%r12),%ebp
0778   3a7318:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 3a731f <__call_rcu_nocb_wake+0x77f>	3a731b: R_X86_64_PC32	__tracepoint_str+0x294
077f   3a731f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a7322: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0786   3a7326:	48 c1 e8 03          	shr    $0x3,%rax
078a   3a732a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
078f   3a732f:	84 c0                	test   %al,%al
0791   3a7331:	0f 85 c0 03 00 00    	jne    3a76f7 <__call_rcu_nocb_wake+0xb57>
0797   3a7337:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a733e <__call_rcu_nocb_wake+0x79e>	3a7339: R_X86_64_PC32	__tracepoint_rcu_nocb_wake+0x3
079e   3a733e:	0f 8e ad 00 00 00    	jle    3a73f1 <__call_rcu_nocb_wake+0x851>
07a4   3a7344:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a734b <__call_rcu_nocb_wake+0x7ab>	3a7347: R_X86_64_PC32	cpu_number-0x4
07ab   3a734b:	41 89 c5             	mov    %eax,%r13d
07ae   3a734e:	c1 e8 06             	shr    $0x6,%eax
07b1   3a7351:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	3a7355: R_X86_64_32S	__cpu_online_mask
07b9   3a7359:	be 08 00 00 00       	mov    $0x8,%esi
07be   3a735e:	e8 00 00 00 00       	call   3a7363 <__call_rcu_nocb_wake+0x7c3>	3a735f: R_X86_64_PLT32	__kasan_check_read-0x4
07c3   3a7363:	4c 0f a3 2d 00 00 00 00 	bt     %r13,0x0(%rip)        # 3a736b <__call_rcu_nocb_wake+0x7cb>	3a7367: R_X86_64_PC32	__cpu_online_mask-0x4
07cb   3a736b:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
07d5   3a7375:	0f 83 e5 00 00 00    	jae    3a7460 <__call_rcu_nocb_wake+0x8c0>
07db   3a737b:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3a7382 <__call_rcu_nocb_wake+0x7e2>	3a737e: R_X86_64_PC32	__preempt_count-0x4
07e2   3a7382:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a7385: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x38
07e9   3a7389:	48 c1 e8 03          	shr    $0x3,%rax
07ed   3a738d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
07f2   3a7392:	74 0c                	je     3a73a0 <__call_rcu_nocb_wake+0x800>
07f4   3a7394:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a7397: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x38
07fb   3a739b:	e8 00 00 00 00       	call   3a73a0 <__call_rcu_nocb_wake+0x800>	3a739c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0800   3a73a0:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # 3a73a7 <__call_rcu_nocb_wake+0x807>	3a73a3: R_X86_64_PC32	__tracepoint_rcu_nocb_wake+0x34
0807   3a73a7:	4d 85 ed             	test   %r13,%r13
080a   3a73aa:	74 34                	je     3a73e0 <__call_rcu_nocb_wake+0x840>
080c   3a73ac:	49 83 c5 08          	add    $0x8,%r13
0810   3a73b0:	4c 89 e8             	mov    %r13,%rax
0813   3a73b3:	48 c1 e8 03          	shr    $0x3,%rax
0817   3a73b7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0821   3a73c1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0825   3a73c5:	74 08                	je     3a73cf <__call_rcu_nocb_wake+0x82f>
0827   3a73c7:	4c 89 ef             	mov    %r13,%rdi
082a   3a73ca:	e8 00 00 00 00       	call   3a73cf <__call_rcu_nocb_wake+0x82f>	3a73cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
082f   3a73cf:	49 8b 7d 00          	mov    0x0(%r13),%rdi
0833   3a73d3:	4c 89 fe             	mov    %r15,%rsi
0836   3a73d6:	89 ea                	mov    %ebp,%edx
0838   3a73d8:	4c 89 e1             	mov    %r12,%rcx
083b   3a73db:	e8 00 00 00 00       	call   3a73e0 <__call_rcu_nocb_wake+0x840>	3a73dc: R_X86_64_PLT32	__SCT__tp_func_rcu_nocb_wake-0x4
0840   3a73e0:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3a73e7 <__call_rcu_nocb_wake+0x847>	3a73e3: R_X86_64_PC32	__preempt_count-0x4
0847   3a73e7:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0851   3a73f1:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a73f8 <__call_rcu_nocb_wake+0x858>	3a73f4: R_X86_64_PC32	cpu_number-0x4
0858   3a73f8:	41 89 c7             	mov    %eax,%r15d
085b   3a73fb:	c1 e8 06             	shr    $0x6,%eax
085e   3a73fe:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	3a7402: R_X86_64_32S	__cpu_online_mask
0866   3a7406:	be 08 00 00 00       	mov    $0x8,%esi
086b   3a740b:	e8 00 00 00 00       	call   3a7410 <__call_rcu_nocb_wake+0x870>	3a740c: R_X86_64_PLT32	__kasan_check_read-0x4
0870   3a7410:	4c 0f a3 3d 00 00 00 00 	bt     %r15,0x0(%rip)        # 3a7418 <__call_rcu_nocb_wake+0x878>	3a7414: R_X86_64_PC32	__cpu_online_mask-0x4
0878   3a7418:	73 46                	jae    3a7460 <__call_rcu_nocb_wake+0x8c0>
087a   3a741a:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 3a7421 <__call_rcu_nocb_wake+0x881>	3a741d: R_X86_64_PC32	__preempt_count-0x4
0881   3a7421:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	3a7424: R_X86_64_32S	.data..percpu..shared_aligned+0x18c0
0888   3a7428:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 3a7430 <__call_rcu_nocb_wake+0x890>	3a742c: R_X86_64_PC32	this_cpu_off-0x4
0890   3a7430:	49 81 c7 48 01 00 00 	add    $0x148,%r15
0897   3a7437:	4c 89 f8             	mov    %r15,%rax
089a   3a743a:	48 c1 e8 03          	shr    $0x3,%rax
089e   3a743e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08a3   3a7443:	84 c0                	test   %al,%al
08a5   3a7445:	0f 85 81 03 00 00    	jne    3a77cc <__call_rcu_nocb_wake+0xc2c>
08ab   3a744b:	41 8b 07             	mov    (%r15),%eax
08ae   3a744e:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 3a7455 <__call_rcu_nocb_wake+0x8b5>	3a7451: R_X86_64_PC32	__preempt_count-0x4
08b5   3a7455:	a9 02 00 00 00       	test   $0x2,%eax
08ba   3a745a:	0f 84 23 01 00 00    	je     3a7583 <__call_rcu_nocb_wake+0x9e3>
08c0   3a7460:	4d 8d be 09 01 00 00 	lea    0x109(%r14),%r15
08c7   3a7467:	4c 89 f8             	mov    %r15,%rax
08ca   3a746a:	48 c1 e8 03          	shr    $0x3,%rax
08ce   3a746e:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08d3   3a7473:	84 c0                	test   %al,%al
08d5   3a7475:	0f 85 a2 02 00 00    	jne    3a771d <__call_rcu_nocb_wake+0xb7d>
08db   3a747b:	41 80 3f 00          	cmpb   $0x0,(%r15)
08df   3a747f:	0f 84 ca 00 00 00    	je     3a754f <__call_rcu_nocb_wake+0x9af>
08e5   3a7485:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	3a7488: R_X86_64_32S	debug_locks
08ec   3a748c:	48 c1 e8 03          	shr    $0x3,%rax
08f0   3a7490:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
08f5   3a7495:	84 c0                	test   %al,%al
08f7   3a7497:	0f 85 ec 02 00 00    	jne    3a7789 <__call_rcu_nocb_wake+0xbe9>
08fd   3a749d:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 3a74a4 <__call_rcu_nocb_wake+0x904>	3a749f: R_X86_64_PC32	debug_locks-0x5
0904   3a74a4:	74 1a                	je     3a74c0 <__call_rcu_nocb_wake+0x920>
0906   3a74a6:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a74ad <__call_rcu_nocb_wake+0x90d>	3a74a9: R_X86_64_PC32	lockdep_recursion-0x4
090d   3a74ad:	85 c0                	test   %eax,%eax
090f   3a74af:	75 0f                	jne    3a74c0 <__call_rcu_nocb_wake+0x920>
0911   3a74b1:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 3a74b8 <__call_rcu_nocb_wake+0x918>	3a74b4: R_X86_64_PC32	hardirqs_enabled-0x4
0918   3a74b8:	85 c0                	test   %eax,%eax
091a   3a74ba:	0f 85 d1 00 00 00    	jne    3a7591 <__call_rcu_nocb_wake+0x9f1>
0920   3a74c0:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0929   3a74c9:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
092e   3a74ce:	0f 85 64 02 00 00    	jne    3a7738 <__call_rcu_nocb_wake+0xb98>
0934   3a74d4:	49 81 c6 c0 01 00 00 	add    $0x1c0,%r14
093b   3a74db:	4c 89 f7             	mov    %r14,%rdi
093e   3a74de:	48 89 de             	mov    %rbx,%rsi
0941   3a74e1:	48 83 c4 48          	add    $0x48,%rsp
0945   3a74e5:	5b                   	pop    %rbx
0946   3a74e6:	41 5c                	pop    %r12
0948   3a74e8:	41 5d                	pop    %r13
094a   3a74ea:	41 5e                	pop    %r14
094c   3a74ec:	41 5f                	pop    %r15
094e   3a74ee:	5d                   	pop    %rbp
094f   3a74ef:	e9 00 00 00 00       	jmp    3a74f4 <__call_rcu_nocb_wake+0x954>	3a74f0: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0954   3a74f4:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
095d   3a74fd:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
0962   3a7502:	0f 85 30 02 00 00    	jne    3a7738 <__call_rcu_nocb_wake+0xb98>
0968   3a7508:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
096d   3a750d:	ff 74 24 20          	push   0x20(%rsp)
0971   3a7511:	9d                   	popf
0972   3a7512:	eb 2b                	jmp    3a753f <__call_rcu_nocb_wake+0x99f>
0974   3a7514:	f7 c3 00 02 00 00    	test   $0x200,%ebx
097a   3a751a:	74 05                	je     3a7521 <__call_rcu_nocb_wake+0x981>
097c   3a751c:	e8 00 00 00 00       	call   3a7521 <__call_rcu_nocb_wake+0x981>	3a751d: R_X86_64_PLT32	trace_hardirqs_on-0x4
0981   3a7521:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0986   3a7526:	ff 74 24 28          	push   0x28(%rsp)
098a   3a752a:	9d                   	popf
098b   3a752b:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0994   3a7534:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
0999   3a7539:	0f 85 f9 01 00 00    	jne    3a7738 <__call_rcu_nocb_wake+0xb98>
099f   3a753f:	48 83 c4 48          	add    $0x48,%rsp
09a3   3a7543:	5b                   	pop    %rbx
09a4   3a7544:	41 5c                	pop    %r12
09a6   3a7546:	41 5d                	pop    %r13
09a8   3a7548:	41 5e                	pop    %r14
09aa   3a754a:	41 5f                	pop    %r15
09ac   3a754c:	5d                   	pop    %rbp
09ad   3a754d:	c3                   	ret
09ae   3a754e:	cc                   	int3
09af   3a754f:	f7 c3 00 02 00 00    	test   $0x200,%ebx
09b5   3a7555:	74 05                	je     3a755c <__call_rcu_nocb_wake+0x9bc>
09b7   3a7557:	e8 00 00 00 00       	call   3a755c <__call_rcu_nocb_wake+0x9bc>	3a7558: R_X86_64_PLT32	trace_hardirqs_on-0x4
09bc   3a755c:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
09c5   3a7565:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
09ca   3a756a:	0f 85 c8 01 00 00    	jne    3a7738 <__call_rcu_nocb_wake+0xb98>
09d0   3a7570:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
09d5   3a7575:	ff 74 24 30          	push   0x30(%rsp)
09d9   3a7579:	9d                   	popf
09da   3a757a:	eb c3                	jmp    3a753f <__call_rcu_nocb_wake+0x99f>
09dc   3a757c:	0f 0b                	ud2
09de   3a757e:	e9 ea f8 ff ff       	jmp    3a6e6d <__call_rcu_nocb_wake+0x2cd>
09e3   3a7583:	0f 0b                	ud2
09e5   3a7585:	e9 d6 fe ff ff       	jmp    3a7460 <__call_rcu_nocb_wake+0x8c0>
09ea   3a758a:	0f 0b                	ud2
09ec   3a758c:	e9 97 fb ff ff       	jmp    3a7128 <__call_rcu_nocb_wake+0x588>
09f1   3a7591:	0f 0b                	ud2
09f3   3a7593:	e9 28 ff ff ff       	jmp    3a74c0 <__call_rcu_nocb_wake+0x920>
09f8   3a7598:	44 89 e1             	mov    %r12d,%ecx
09fb   3a759b:	80 e1 07             	and    $0x7,%cl
09fe   3a759e:	80 c1 03             	add    $0x3,%cl
0a01   3a75a1:	38 c1                	cmp    %al,%cl
0a03   3a75a3:	0f 8c 89 f7 ff ff    	jl     3a6d32 <__call_rcu_nocb_wake+0x192>
0a09   3a75a9:	4c 89 e7             	mov    %r12,%rdi
0a0c   3a75ac:	e8 00 00 00 00       	call   3a75b1 <__call_rcu_nocb_wake+0xa11>	3a75ad: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a11   3a75b1:	e9 7c f7 ff ff       	jmp    3a6d32 <__call_rcu_nocb_wake+0x192>
0a16   3a75b6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a75b9: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0a1d   3a75bd:	80 e1 07             	and    $0x7,%cl
0a20   3a75c0:	80 c1 03             	add    $0x3,%cl
0a23   3a75c3:	38 c1                	cmp    %al,%cl
0a25   3a75c5:	0f 8c 8e f7 ff ff    	jl     3a6d59 <__call_rcu_nocb_wake+0x1b9>
0a2b   3a75cb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a75ce: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0a32   3a75d2:	e8 00 00 00 00       	call   3a75d7 <__call_rcu_nocb_wake+0xa37>	3a75d3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a37   3a75d7:	e9 7d f7 ff ff       	jmp    3a6d59 <__call_rcu_nocb_wake+0x1b9>
0a3c   3a75dc:	44 89 f9             	mov    %r15d,%ecx
0a3f   3a75df:	80 e1 07             	and    $0x7,%cl
0a42   3a75e2:	38 c1                	cmp    %al,%cl
0a44   3a75e4:	0f 8c 9e f8 ff ff    	jl     3a6e88 <__call_rcu_nocb_wake+0x2e8>
0a4a   3a75ea:	4c 89 ff             	mov    %r15,%rdi
0a4d   3a75ed:	e8 00 00 00 00       	call   3a75f2 <__call_rcu_nocb_wake+0xa52>	3a75ee: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0a52   3a75f2:	e9 91 f8 ff ff       	jmp    3a6e88 <__call_rcu_nocb_wake+0x2e8>
0a57   3a75f7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a75fa: R_X86_64_32S	debug_locks
0a5e   3a75fe:	80 e1 07             	and    $0x7,%cl
0a61   3a7601:	80 c1 03             	add    $0x3,%cl
0a64   3a7604:	38 c1                	cmp    %al,%cl
0a66   3a7606:	0f 8c a2 f8 ff ff    	jl     3a6eae <__call_rcu_nocb_wake+0x30e>
0a6c   3a760c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a760f: R_X86_64_32S	debug_locks
0a73   3a7613:	e8 00 00 00 00       	call   3a7618 <__call_rcu_nocb_wake+0xa78>	3a7614: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a78   3a7618:	e9 91 f8 ff ff       	jmp    3a6eae <__call_rcu_nocb_wake+0x30e>
0a7d   3a761d:	44 89 f9             	mov    %r15d,%ecx
0a80   3a7620:	80 e1 07             	and    $0x7,%cl
0a83   3a7623:	80 c1 03             	add    $0x3,%cl
0a86   3a7626:	38 c1                	cmp    %al,%cl
0a88   3a7628:	0f 8c 2a f8 ff ff    	jl     3a6e58 <__call_rcu_nocb_wake+0x2b8>
0a8e   3a762e:	4c 89 ff             	mov    %r15,%rdi
0a91   3a7631:	e8 00 00 00 00       	call   3a7636 <__call_rcu_nocb_wake+0xa96>	3a7632: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a96   3a7636:	e9 1d f8 ff ff       	jmp    3a6e58 <__call_rcu_nocb_wake+0x2b8>
0a9b   3a763b:	44 89 f9             	mov    %r15d,%ecx
0a9e   3a763e:	80 e1 07             	and    $0x7,%cl
0aa1   3a7641:	38 c1                	cmp    %al,%cl
0aa3   3a7643:	0f 8c 73 f6 ff ff    	jl     3a6cbc <__call_rcu_nocb_wake+0x11c>
0aa9   3a7649:	4c 89 ff             	mov    %r15,%rdi
0aac   3a764c:	e8 00 00 00 00       	call   3a7651 <__call_rcu_nocb_wake+0xab1>	3a764d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0ab1   3a7651:	e9 66 f6 ff ff       	jmp    3a6cbc <__call_rcu_nocb_wake+0x11c>
0ab6   3a7656:	49 89 cf             	mov    %rcx,%r15
0ab9   3a7659:	44 89 e1             	mov    %r12d,%ecx
0abc   3a765c:	80 e1 07             	and    $0x7,%cl
0abf   3a765f:	38 c1                	cmp    %al,%cl
0ac1   3a7661:	4c 89 f9             	mov    %r15,%rcx
0ac4   3a7664:	0f 8c 06 fa ff ff    	jl     3a7070 <__call_rcu_nocb_wake+0x4d0>
0aca   3a766a:	4c 89 e7             	mov    %r12,%rdi
0acd   3a766d:	e8 00 00 00 00       	call   3a7672 <__call_rcu_nocb_wake+0xad2>	3a766e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0ad2   3a7672:	4c 89 f9             	mov    %r15,%rcx
0ad5   3a7675:	e9 f6 f9 ff ff       	jmp    3a7070 <__call_rcu_nocb_wake+0x4d0>
0ada   3a767a:	44 89 f9             	mov    %r15d,%ecx
0add   3a767d:	80 e1 07             	and    $0x7,%cl
0ae0   3a7680:	38 c1                	cmp    %al,%cl
0ae2   3a7682:	0f 8c 5b fa ff ff    	jl     3a70e3 <__call_rcu_nocb_wake+0x543>
0ae8   3a7688:	4c 89 ff             	mov    %r15,%rdi
0aeb   3a768b:	e8 00 00 00 00       	call   3a7690 <__call_rcu_nocb_wake+0xaf0>	3a768c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0af0   3a7690:	e9 4e fa ff ff       	jmp    3a70e3 <__call_rcu_nocb_wake+0x543>
0af5   3a7695:	44 89 f1             	mov    %r14d,%ecx
0af8   3a7698:	80 e1 07             	and    $0x7,%cl
0afb   3a769b:	80 c1 03             	add    $0x3,%cl
0afe   3a769e:	38 c1                	cmp    %al,%cl
0b00   3a76a0:	0f 8c f8 fa ff ff    	jl     3a719e <__call_rcu_nocb_wake+0x5fe>
0b06   3a76a6:	4c 89 f7             	mov    %r14,%rdi
0b09   3a76a9:	e8 00 00 00 00       	call   3a76ae <__call_rcu_nocb_wake+0xb0e>	3a76aa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b0e   3a76ae:	e9 eb fa ff ff       	jmp    3a719e <__call_rcu_nocb_wake+0x5fe>
0b13   3a76b3:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a76b6: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0b1a   3a76ba:	80 e1 07             	and    $0x7,%cl
0b1d   3a76bd:	80 c1 03             	add    $0x3,%cl
0b20   3a76c0:	38 c1                	cmp    %al,%cl
0b22   3a76c2:	0f 8c f8 fa ff ff    	jl     3a71c0 <__call_rcu_nocb_wake+0x620>
0b28   3a76c8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a76cb: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0b2f   3a76cf:	e8 00 00 00 00       	call   3a76d4 <__call_rcu_nocb_wake+0xb34>	3a76d0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b34   3a76d4:	e9 e7 fa ff ff       	jmp    3a71c0 <__call_rcu_nocb_wake+0x620>
0b39   3a76d9:	44 89 e1             	mov    %r12d,%ecx
0b3c   3a76dc:	80 e1 07             	and    $0x7,%cl
0b3f   3a76df:	80 c1 03             	add    $0x3,%cl
0b42   3a76e2:	38 c1                	cmp    %al,%cl
0b44   3a76e4:	0f 8c 2a fc ff ff    	jl     3a7314 <__call_rcu_nocb_wake+0x774>
0b4a   3a76ea:	4c 89 e7             	mov    %r12,%rdi
0b4d   3a76ed:	e8 00 00 00 00       	call   3a76f2 <__call_rcu_nocb_wake+0xb52>	3a76ee: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b52   3a76f2:	e9 1d fc ff ff       	jmp    3a7314 <__call_rcu_nocb_wake+0x774>
0b57   3a76f7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a76fa: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0b5e   3a76fe:	80 e1 07             	and    $0x7,%cl
0b61   3a7701:	80 c1 03             	add    $0x3,%cl
0b64   3a7704:	38 c1                	cmp    %al,%cl
0b66   3a7706:	0f 8c 2b fc ff ff    	jl     3a7337 <__call_rcu_nocb_wake+0x797>
0b6c   3a770c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a770f: R_X86_64_32S	__tracepoint_rcu_nocb_wake+0x8
0b73   3a7713:	e8 00 00 00 00       	call   3a7718 <__call_rcu_nocb_wake+0xb78>	3a7714: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b78   3a7718:	e9 1a fc ff ff       	jmp    3a7337 <__call_rcu_nocb_wake+0x797>
0b7d   3a771d:	44 89 f9             	mov    %r15d,%ecx
0b80   3a7720:	80 e1 07             	and    $0x7,%cl
0b83   3a7723:	38 c1                	cmp    %al,%cl
0b85   3a7725:	0f 8c 50 fd ff ff    	jl     3a747b <__call_rcu_nocb_wake+0x8db>
0b8b   3a772b:	4c 89 ff             	mov    %r15,%rdi
0b8e   3a772e:	e8 00 00 00 00       	call   3a7733 <__call_rcu_nocb_wake+0xb93>	3a772f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b93   3a7733:	e9 43 fd ff ff       	jmp    3a747b <__call_rcu_nocb_wake+0x8db>
0b98   3a7738:	e8 00 00 00 00       	call   3a773d <__call_rcu_nocb_wake+0xb9d>	3a7739: R_X86_64_PLT32	__stack_chk_fail-0x4
0b9d   3a773d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a7740: R_X86_64_32S	debug_locks
0ba4   3a7744:	80 e1 07             	and    $0x7,%cl
0ba7   3a7747:	80 c1 03             	add    $0x3,%cl
0baa   3a774a:	38 c1                	cmp    %al,%cl
0bac   3a774c:	0f 8c 8c f5 ff ff    	jl     3a6cde <__call_rcu_nocb_wake+0x13e>
0bb2   3a7752:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a7755: R_X86_64_32S	debug_locks
0bb9   3a7759:	e8 00 00 00 00       	call   3a775e <__call_rcu_nocb_wake+0xbbe>	3a775a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0bbe   3a775e:	e9 7b f5 ff ff       	jmp    3a6cde <__call_rcu_nocb_wake+0x13e>
0bc3   3a7763:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a7766: R_X86_64_32S	debug_locks
0bca   3a776a:	80 e1 07             	and    $0x7,%cl
0bcd   3a776d:	80 c1 03             	add    $0x3,%cl
0bd0   3a7770:	38 c1                	cmp    %al,%cl
0bd2   3a7772:	0f 8c 8d f9 ff ff    	jl     3a7105 <__call_rcu_nocb_wake+0x565>
0bd8   3a7778:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a777b: R_X86_64_32S	debug_locks
0bdf   3a777f:	e8 00 00 00 00       	call   3a7784 <__call_rcu_nocb_wake+0xbe4>	3a7780: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0be4   3a7784:	e9 7c f9 ff ff       	jmp    3a7105 <__call_rcu_nocb_wake+0x565>
0be9   3a7789:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	3a778c: R_X86_64_32S	debug_locks
0bf0   3a7790:	80 e1 07             	and    $0x7,%cl
0bf3   3a7793:	80 c1 03             	add    $0x3,%cl
0bf6   3a7796:	38 c1                	cmp    %al,%cl
0bf8   3a7798:	0f 8c ff fc ff ff    	jl     3a749d <__call_rcu_nocb_wake+0x8fd>
0bfe   3a779e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a77a1: R_X86_64_32S	debug_locks
0c05   3a77a5:	e8 00 00 00 00       	call   3a77aa <__call_rcu_nocb_wake+0xc0a>	3a77a6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c0a   3a77aa:	e9 ee fc ff ff       	jmp    3a749d <__call_rcu_nocb_wake+0x8fd>
0c0f   3a77af:	89 d9                	mov    %ebx,%ecx
0c11   3a77b1:	80 e1 07             	and    $0x7,%cl
0c14   3a77b4:	80 c1 03             	add    $0x3,%cl
0c17   3a77b7:	38 c1                	cmp    %al,%cl
0c19   3a77b9:	0f 8c fa fa ff ff    	jl     3a72b9 <__call_rcu_nocb_wake+0x719>
0c1f   3a77bf:	48 89 df             	mov    %rbx,%rdi
0c22   3a77c2:	e8 00 00 00 00       	call   3a77c7 <__call_rcu_nocb_wake+0xc27>	3a77c3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c27   3a77c7:	e9 ed fa ff ff       	jmp    3a72b9 <__call_rcu_nocb_wake+0x719>
0c2c   3a77cc:	44 89 f9             	mov    %r15d,%ecx
0c2f   3a77cf:	80 e1 07             	and    $0x7,%cl
0c32   3a77d2:	80 c1 03             	add    $0x3,%cl
0c35   3a77d5:	38 c1                	cmp    %al,%cl
0c37   3a77d7:	0f 8c 6e fc ff ff    	jl     3a744b <__call_rcu_nocb_wake+0x8ab>
0c3d   3a77dd:	4c 89 ff             	mov    %r15,%rdi
0c40   3a77e0:	e8 00 00 00 00       	call   3a77e5 <__call_rcu_nocb_wake+0xc45>	3a77e1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c45   3a77e5:	e9 61 fc ff ff       	jmp    3a744b <__call_rcu_nocb_wake+0x8ab>
0c4a   3a77ea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3a77ed: R_X86_64_32S	.data+0x4f8fa0
0c51   3a77f1:	4c 89 e6             	mov    %r12,%rsi
0c54   3a77f4:	49 89 cf             	mov    %rcx,%r15
0c57   3a77f7:	e8 00 00 00 00       	call   3a77fc <__call_rcu_nocb_wake+0xc5c>	3a77f8: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0c5c   3a77fc:	4c 89 f9             	mov    %r15,%rcx
0c5f   3a77ff:	41 f6 c4 01          	test   $0x1,%r12b
0c63   3a7803:	0f 84 7c f8 ff ff    	je     3a7085 <__call_rcu_nocb_wake+0x4e5>
0c69   3a7809:	e9 83 f8 ff ff       	jmp    3a7091 <__call_rcu_nocb_wake+0x4f1>
0c6e   3a780e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
