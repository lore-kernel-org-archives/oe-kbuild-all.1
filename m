Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BF3138C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 03:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683603653; x=1715139653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vaXnKSGY2N1uhz4/vLLqyQWhtbw1xBxHMxTHmP95pEc=;
  b=JlXPH56j5xxxzTlNTIFITqzlej4dLIYRyoPMDlVPCbjq4flH+zSFXNYT
   qoVdJxFCwUm98JEfkuQIV6dAjnIug/K4x87ND2VtZeR8E+/GPVRsrhfRw
   wUfMEWTnSSiMGgqGcK3W2foF+D1qHDw1ukIzu/1/Ws5nYb1nhLNM2Tpdl
   N4vbK7EtXIAEWGFIWTeTFshrMM30tGoKoOIye+mlvrBe5uxtPgFtlXUL7
   lauIskT73bhxmmukTKdSlTcTAwpM3dr3+zd4gKojyH+UknAQXXUvAO3A0
   Zk6ZquVKLaXlIyYQvtpJDsnQm/zBrNVIkP2s19CYJRpsvdTcaa+sTpbXX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415367246"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="415367246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 20:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763657057"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="763657057"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 20:40:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwEDb-0001e3-0S;
	Tue, 09 May 2023 03:40:51 +0000
Date: Tue, 9 May 2023 11:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/clock 7/9] vmlinux.o: warning: objtool:
 read_hv_sched_clock_tsc+0x17: call to hv_get_tsc_page() leaves .noinstr.text
 section
Message-ID: <202305091118.5L2zQHwo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/clock
head:   6c433ce701d4bb3d07a4102cbb8bf00c217be05d
commit: eb9adda6628185629ffacf24e7d64b6cc68e905a [7/9] x86/tsc: Provide sched_clock_noinstr()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305091118.5L2zQHwo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=eb9adda6628185629ffacf24e7d64b6cc68e905a
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/clock
        git checkout eb9adda6628185629ffacf24e7d64b6cc68e905a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091118.5L2zQHwo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: local_clock+0x8: call to sched_clock() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: read_hv_sched_clock_tsc+0x17: call to hv_get_tsc_page() leaves .noinstr.text section


objdump-func vmlinux.o read_hv_sched_clock_tsc:
0000 0000000000010fc0 <read_hv_sched_clock_tsc>:
0000    10fc0:	f3 0f 1e fa          	endbr64
0004    10fc4:	41 57                	push   %r15
0006    10fc6:	41 56                	push   %r14
0008    10fc8:	41 55                	push   %r13
000a    10fca:	41 54                	push   %r12
000c    10fcc:	55                   	push   %rbp
000d    10fcd:	53                   	push   %rbx
000e    10fce:	48 83 ec 08          	sub    $0x8,%rsp
0012    10fd2:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	10fd3: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0017    10fd7:	e8 00 00 00 00       	call   10fdc <read_hv_sched_clock_tsc+0x1c>	10fd8: R_X86_64_PLT32	hv_get_tsc_page-0x4
001c    10fdc:	48 89 c5             	mov    %rax,%rbp
001f    10fdf:	eb 2c                	jmp    1100d <read_hv_sched_clock_tsc+0x4d>
0021    10fe1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	10fe2: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0026    10fe6:	4c 8b 75 08          	mov    0x8(%rbp),%r14
002a    10fea:	4c 8b 65 10          	mov    0x10(%rbp),%r12
002e    10fee:	0f 31                	rdtsc
0030    10ff0:	90                   	nop
0031    10ff1:	90                   	nop
0032    10ff2:	90                   	nop
0033    10ff3:	48 89 14 24          	mov    %rdx,(%rsp)
0037    10ff7:	49 89 c7             	mov    %rax,%r15
003a    10ffa:	44 8b 6d 00          	mov    0x0(%rbp),%r13d
003e    10ffe:	89 df                	mov    %ebx,%edi
0040    11000:	44 89 ee             	mov    %r13d,%esi
0043    11003:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	11004: R_X86_64_NONE	__sanitizer_cov_trace_cmp4-0x4
0048    11008:	44 39 eb             	cmp    %r13d,%ebx
004b    1100b:	74 4f                	je     1105c <read_hv_sched_clock_tsc+0x9c>
004d    1100d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1100e: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0052    11012:	8b 5d 00             	mov    0x0(%rbp),%ebx
0055    11015:	31 ff                	xor    %edi,%edi
0057    11017:	89 de                	mov    %ebx,%esi
0059    11019:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1101a: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp4-0x4
005e    1101e:	85 db                	test   %ebx,%ebx
0060    11020:	75 bf                	jne    10fe1 <read_hv_sched_clock_tsc+0x21>
0062    11022:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
0069    11029:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1102a: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
006e    1102e:	4c 2b 25 00 00 00 00 	sub    0x0(%rip),%r12        # 11035 <read_hv_sched_clock_tsc+0x75>	11031: R_X86_64_PC32	.data..ro_after_init+0x26b74
0075    11035:	4b 8d 04 a4          	lea    (%r12,%r12,4),%rax
0079    11039:	48 83 c4 08          	add    $0x8,%rsp
007d    1103d:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
0081    11041:	5b                   	pop    %rbx
0082    11042:	5d                   	pop    %rbp
0083    11043:	48 c1 e0 02          	shl    $0x2,%rax
0087    11047:	41 5c                	pop    %r12
0089    11049:	41 5d                	pop    %r13
008b    1104b:	41 5e                	pop    %r14
008d    1104d:	41 5f                	pop    %r15
008f    1104f:	31 d2                	xor    %edx,%edx
0091    11051:	31 c9                	xor    %ecx,%ecx
0093    11053:	31 f6                	xor    %esi,%esi
0095    11055:	31 ff                	xor    %edi,%edi
0097    11057:	e9 00 00 00 00       	jmp    1105c <read_hv_sched_clock_tsc+0x9c>	11058: R_X86_64_PLT32	__x86_return_thunk-0x4
009c    1105c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1105d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00a1    11061:	48 8b 3c 24          	mov    (%rsp),%rdi
00a5    11065:	4c 89 f6             	mov    %r14,%rsi
00a8    11068:	48 c1 e7 20          	shl    $0x20,%rdi
00ac    1106c:	4c 09 ff             	or     %r15,%rdi
00af    1106f:	e8 00 00 00 00       	call   11074 <read_hv_sched_clock_tsc+0xb4>	11070: R_X86_64_PC32	.text+0xc41b3bc
00b4    11074:	49 01 c4             	add    %rax,%r12
00b7    11077:	eb b0                	jmp    11029 <read_hv_sched_clock_tsc+0x69>
00b9    11079:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
