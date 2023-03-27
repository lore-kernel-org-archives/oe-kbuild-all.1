Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0BE7468
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 19:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679943810; x=1711479810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZ5W7ea+cZm00DjngC6mjvUJHRhtoFpmjg8bfiVK+U4=;
  b=Ex2Abhi2dvQPXiaboid9i5NNlJqUMyBvuUJ1BNt+x7hzoDp+QSL28lOr
   6t2uOAQp5EPxTN23wEnf8dCw8BaMqryq6ZOT3Nu3JADWnJS7z7HwIbhQp
   XkH6rYSmZT4dtldKXbp7+4JGtNQTCgS9jHN0BD4QokLHt2Nu0Wqko7eXO
   dIFIoK9F2TltdoG6viXJHa8jva7XZkkoY6xNzhvQWC0gqbVVNOS2NpqKq
   vTVHGHtzvoAu/cdvNYoXmWZb6ojVVlDkFLGytTkzLT/L3iEIfTDaoXFYJ
   TeMX9ku9tUBmjNJjAdHlW7Lnih8vPqvp43zZUSJMC6tOhrdi68Iw9KnSX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337863750"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="337863750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 12:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="713956952"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="713956952"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Mar 2023 12:03:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgs7n-000HwX-13;
	Mon, 27 Mar 2023 19:03:23 +0000
Date: Tue, 28 Mar 2023 03:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [linux-stable-rc:queue/6.2 108/112] vmlinux.o: warning: objtool:
 do_one_initcall+0x127: unreachable instruction
Message-ID: <202303280258.yag0e99W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.2
head:   a30d07158b2e0c47d750a938f596747144fcf62e
commit: bc7367ae4130cfc3e3b2d644126d65605fe95023 [108/112] entry: Fix noinstr warning in __enter_from_user_mode()
config: x86_64-buildonly-randconfig-r004-20230327 (https://download.01.org/0day-ci/archive/20230328/202303280258.yag0e99W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=bc7367ae4130cfc3e3b2d644126d65605fe95023
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.2
        git checkout bc7367ae4130cfc3e3b2d644126d65605fe95023
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280258.yag0e99W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_one_initcall+0x127: unreachable instruction


objdump-func vmlinux.o do_one_initcall:
0000 0000000000000e00 <do_one_initcall>:
0000      e00:	f3 0f 1e fa          	endbr64
0004      e04:	e8 00 00 00 00       	call   e09 <do_one_initcall+0x9>	e05: R_X86_64_PLT32	__fentry__-0x4
0009      e09:	41 55                	push   %r13
000b      e0b:	41 54                	push   %r12
000d      e0d:	49 89 fc             	mov    %rdi,%r12
0010      e10:	55                   	push   %rbp
0011      e11:	53                   	push   %rbx
0012      e12:	48 83 ec 40          	sub    $0x40,%rsp
0016      e16:	e8 00 00 00 00       	call   e1b <do_one_initcall+0x1b>	e17: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001b      e1b:	4c 89 e7             	mov    %r12,%rdi
001e      e1e:	8b 2d 00 00 00 00    	mov    0x0(%rip),%ebp        # e24 <do_one_initcall+0x24>	e20: R_X86_64_PC32	pcpu_hot+0x4
0024      e24:	e8 97 fd ff ff       	call   bc0 <initcall_blacklisted>
0029      e29:	31 ff                	xor    %edi,%edi
002b      e2b:	81 e5 ff ff ff 7f    	and    $0x7fffffff,%ebp
0031      e31:	89 c3                	mov    %eax,%ebx
0033      e33:	89 c6                	mov    %eax,%esi
0035      e35:	e8 00 00 00 00       	call   e3a <do_one_initcall+0x3a>	e36: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
003a      e3a:	84 db                	test   %bl,%bl
003c      e3c:	0f 85 cc 01 00 00    	jne    100e <do_one_initcall+0x20e>
0042      e42:	e8 00 00 00 00       	call   e47 <do_one_initcall+0x47>	e43: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0047      e47:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
004c      e4c:	e8 00 00 00 00       	call   e51 <do_one_initcall+0x51>	e4d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0051      e51:	e8 00 00 00 00       	call   e56 <do_one_initcall+0x56>	e52: R_X86_64_PLT32	rcu_is_watching-0x4
0056      e56:	2e e8 00 00 00 00    	cs call e5c <do_one_initcall+0x5c>	e58: R_X86_64_PLT32	__x86_indirect_thunk_r12-0x4
005c      e5c:	41 89 c5             	mov    %eax,%r13d
005f      e5f:	66 90                	xchg   %ax,%ax
0061      e61:	e8 00 00 00 00       	call   e66 <do_one_initcall+0x66>	e62: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0066      e66:	e8 00 00 00 00       	call   e6b <do_one_initcall+0x6b>	e67: R_X86_64_PLT32	rcu_is_watching-0x4
006b      e6b:	89 ef                	mov    %ebp,%edi
006d      e6d:	c6 04 24 00          	movb   $0x0,(%rsp)
0071      e71:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # e77 <do_one_initcall+0x77>	e73: R_X86_64_PC32	pcpu_hot+0x4
0077      e77:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
007d      e7d:	89 de                	mov    %ebx,%esi
007f      e7f:	e8 00 00 00 00       	call   e84 <do_one_initcall+0x84>	e80: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0084      e84:	39 dd                	cmp    %ebx,%ebp
0086      e86:	0f 85 f6 00 00 00    	jne    f82 <do_one_initcall+0x182>
008c      e8c:	e8 00 00 00 00       	call   e91 <do_one_initcall+0x91>	e8d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0091      e91:	9c                   	pushf
0092      e92:	5b                   	pop    %rbx
0093      e93:	81 e3 00 02 00 00    	and    $0x200,%ebx
0099      e99:	31 ff                	xor    %edi,%edi
009b      e9b:	48 89 de             	mov    %rbx,%rsi
009e      e9e:	e8 00 00 00 00       	call   ea3 <do_one_initcall+0xa3>	e9f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00a3      ea3:	48 85 db             	test   %rbx,%rbx
00a6      ea6:	0f 84 3e 01 00 00    	je     fea <do_one_initcall+0x1ea>
00ac      eac:	e8 00 00 00 00       	call   eb1 <do_one_initcall+0xb1>	ead: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b1      eb1:	31 f6                	xor    %esi,%esi
00b3      eb3:	31 ff                	xor    %edi,%edi
00b5      eb5:	e8 00 00 00 00       	call   eba <do_one_initcall+0xba>	eb6: R_X86_64_PLT32	add_device_randomness-0x4
00ba      eba:	e8 00 00 00 00       	call   ebf <do_one_initcall+0xbf>	ebb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00bf      ebf:	44 89 e8             	mov    %r13d,%eax
00c2      ec2:	48 83 c4 40          	add    $0x40,%rsp
00c6      ec6:	5b                   	pop    %rbx
00c7      ec7:	5d                   	pop    %rbp
00c8      ec8:	41 5c                	pop    %r12
00ca      eca:	41 5d                	pop    %r13
00cc      ecc:	31 d2                	xor    %edx,%edx
00ce      ece:	31 f6                	xor    %esi,%esi
00d0      ed0:	31 ff                	xor    %edi,%edi
00d2      ed2:	c3                   	ret
00d3      ed3:	e8 00 00 00 00       	call   ed8 <do_one_initcall+0xd8>	ed4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00d8      ed8:	ff 05 00 00 00 00    	incl   0x0(%rip)        # ede <do_one_initcall+0xde>	eda: R_X86_64_PC32	pcpu_hot+0x4
00de      ede:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # ee5 <do_one_initcall+0xe5>	ee1: R_X86_64_PC32	__tracepoint_initcall_finish+0x3c
00e5      ee5:	48 85 db             	test   %rbx,%rbx
00e8      ee8:	74 14                	je     efe <do_one_initcall+0xfe>
00ea      eea:	e8 00 00 00 00       	call   eef <do_one_initcall+0xef>	eeb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ef      eef:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
00f3      ef3:	44 89 ea             	mov    %r13d,%edx
00f6      ef6:	4c 89 e6             	mov    %r12,%rsi
00f9      ef9:	e8 00 00 00 00       	call   efe <do_one_initcall+0xfe>	efa: R_X86_64_PLT32	__SCT__tp_func_initcall_finish-0x4
00fe      efe:	e8 00 00 00 00       	call   f03 <do_one_initcall+0x103>	eff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0103      f03:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # f09 <do_one_initcall+0x109>	f05: R_X86_64_PC32	pcpu_hot+0x4
0109      f09:	0f 94 c3             	sete   %bl
010c      f0c:	31 ff                	xor    %edi,%edi
010e      f0e:	89 de                	mov    %ebx,%esi
0110      f10:	e8 00 00 00 00       	call   f15 <do_one_initcall+0x115>	f11: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0115      f15:	84 db                	test   %bl,%bl
0117      f17:	0f 84 44 ff ff ff    	je     e61 <do_one_initcall+0x61>
011d      f1d:	e8 00 00 00 00       	call   f22 <do_one_initcall+0x122>	f1e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0122      f22:	e8 00 00 00 00       	call   f27 <do_one_initcall+0x127>	f23: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
0127      f27:	e9 35 ff ff ff       	jmp    e61 <do_one_initcall+0x61>
012c      f2c:	e8 00 00 00 00       	call   f31 <do_one_initcall+0x131>	f2d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0131      f31:	ff 05 00 00 00 00    	incl   0x0(%rip)        # f37 <do_one_initcall+0x137>	f33: R_X86_64_PC32	pcpu_hot+0x4
0137      f37:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # f3e <do_one_initcall+0x13e>	f3a: R_X86_64_PC32	__tracepoint_initcall_start+0x3c
013e      f3e:	48 85 db             	test   %rbx,%rbx
0141      f41:	74 11                	je     f54 <do_one_initcall+0x154>
0143      f43:	e8 00 00 00 00       	call   f48 <do_one_initcall+0x148>	f44: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0148      f48:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
014c      f4c:	4c 89 e6             	mov    %r12,%rsi
014f      f4f:	e8 00 00 00 00       	call   f54 <do_one_initcall+0x154>	f50: R_X86_64_PLT32	__SCT__tp_func_initcall_start-0x4
0154      f54:	e8 00 00 00 00       	call   f59 <do_one_initcall+0x159>	f55: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0159      f59:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # f5f <do_one_initcall+0x15f>	f5b: R_X86_64_PC32	pcpu_hot+0x4
015f      f5f:	0f 94 c3             	sete   %bl
0162      f62:	31 ff                	xor    %edi,%edi
0164      f64:	89 de                	mov    %ebx,%esi
0166      f66:	e8 00 00 00 00       	call   f6b <do_one_initcall+0x16b>	f67: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
016b      f6b:	84 db                	test   %bl,%bl
016d      f6d:	0f 84 d9 fe ff ff    	je     e4c <do_one_initcall+0x4c>
0173      f73:	e8 00 00 00 00       	call   f78 <do_one_initcall+0x178>	f74: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0178      f78:	e8 00 00 00 00       	call   f7d <do_one_initcall+0x17d>	f79: R_X86_64_PLT32	preempt_schedule_notrace_thunk-0x4
017d      f7d:	e9 ca fe ff ff       	jmp    e4c <do_one_initcall+0x4c>
0182      f82:	e8 00 00 00 00       	call   f87 <do_one_initcall+0x187>	f83: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0187      f87:	48 b8 70 72 65 65 6d 70 74 69 	movabs $0x6974706d65657270,%rax
0191      f91:	48 89 04 24          	mov    %rax,(%rsp)
0195      f95:	48 b8 6f 6e 20 69 6d 62 61 6c 	movabs $0x6c61626d69206e6f,%rax
019f      f9f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
01a4      fa4:	b8 20 00 00 00       	mov    $0x20,%eax
01a9      fa9:	c7 44 24 10 61 6e 63 65 	movl   $0x65636e61,0x10(%rsp)
01b1      fb1:	66 89 44 24 14       	mov    %ax,0x14(%rsp)
01b6      fb6:	e8 00 00 00 00       	call   fbb <do_one_initcall+0x1bb>	fb7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bb      fbb:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # fc1 <do_one_initcall+0x1c1>	fbd: R_X86_64_PC32	pcpu_hot+0x4
01c1      fc1:	89 da                	mov    %ebx,%edx
01c3      fc3:	89 d8                	mov    %ebx,%eax
01c5      fc5:	89 df                	mov    %ebx,%edi
01c7      fc7:	81 e2 00 00 00 80    	and    $0x80000000,%edx
01cd      fcd:	09 ea                	or     %ebp,%edx
01cf      fcf:	0f b1 15 00 00 00 00 	cmpxchg %edx,0x0(%rip)        # fd6 <do_one_initcall+0x1d6>	fd2: R_X86_64_PC32	pcpu_hot+0x4
01d6      fd6:	41 89 c4             	mov    %eax,%r12d
01d9      fd9:	89 c6                	mov    %eax,%esi
01db      fdb:	e8 00 00 00 00       	call   fe0 <do_one_initcall+0x1e0>	fdc: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
01e0      fe0:	44 39 e3             	cmp    %r12d,%ebx
01e3      fe3:	75 d1                	jne    fb6 <do_one_initcall+0x1b6>
01e5      fe5:	e9 a2 fe ff ff       	jmp    e8c <do_one_initcall+0x8c>
01ea      fea:	e8 00 00 00 00       	call   fef <do_one_initcall+0x1ef>	feb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ef      fef:	ba 40 00 00 00       	mov    $0x40,%edx
01f4      ff4:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	ff7: R_X86_64_32S	.rodata.str1.1+0x9d
01fb      ffb:	48 89 e7             	mov    %rsp,%rdi
01fe      ffe:	e8 00 00 00 00       	call   1003 <do_one_initcall+0x203>	fff: R_X86_64_PLT32	strlcat-0x4
0203     1003:	e8 00 00 00 00       	call   1008 <do_one_initcall+0x208>	1004: R_X86_64_PLT32	trace_hardirqs_on-0x4
0208     1008:	fb                   	sti
0209     1009:	e9 9e fe ff ff       	jmp    eac <do_one_initcall+0xac>
020e     100e:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
0214     1014:	e9 a1 fe ff ff       	jmp    eba <do_one_initcall+0xba>
0219     1019:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0224     1024:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
022f     102f:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
023a     103a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
0240     1040:	f3 0f 1e fa          	endbr64
0244     1044:	e8 00 00 00 00       	call   1049 <do_one_initcall+0x249>	1045: R_X86_64_PLT32	__fentry__-0x4
0249     1049:	e8 00 00 00 00       	call   104e <do_one_initcall+0x24e>	104a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
024e     104e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	1051: R_X86_64_32S	.rodata.str1.1+0xc5
0255     1055:	ba cc 00 00 00       	mov    $0xcc,%edx
025a     105a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	105d: R_X86_64_32S	__init_end
0261     1061:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1064: R_X86_64_32S	__init_begin
0268     1068:	e9 00 00 00 00       	jmp    106d <do_one_initcall+0x26d>	1069: R_X86_64_PLT32	free_reserved_area-0x4
026d     106d:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0277     1077:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
