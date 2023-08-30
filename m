Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C91377
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693368434; x=1724904434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsWnDZJYClcF+e3I5IB6odw369aTj//zeqi4Yy/H5ZQ=;
  b=L/JUa1vaMKqMcNsi86t5hLqgy2yZKcm/6tI/2ieaqg6eIPSKpzvxRIWS
   lFeoVb7m1bCMiVau1T6XFjQEPSTQHFr4rlFnzruk40lN0BDdahnGTdQRi
   QOWScwUgTTJm8g7ooenhOyrXbZZ85mprDpQHaA+qdv1SxNwyQPXEhqOUp
   ZW8x0ilVgPTfBalrMKBo8/nUmm//e1MF7UVElJiO1AcM418ry5gbv17Yr
   kWihtzhZ3xa3Q8aOz5Tn6qoPxwDOzFa7QU5u2pHH7kInPLMG+DsREEOmU
   p1AypFP1X8jccrubS7BAc7YCcveadtCM4PyNDEYjqF8Pc6wHG3nUwFpTf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374446646"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="374446646"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="808962976"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="808962976"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2023 21:07:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCTu-0009PH-1X;
	Wed, 30 Aug 2023 04:07:05 +0000
Date: Wed, 30 Aug 2023 12:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/display/intel_pps.o: warning: objtool:
 intel_pps_on_unlocked()+0x4ff: unreachable instruction
Message-ID: <202308301138.9zfgVdRX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core60-51
head:   79f190d7ae78b399a873f6814484a1854cb4ba31
commit: 78ac7e6cd7c8e859394774851896f1ff9fa7805c FROMGIT: drm/i915/pps: rename edp_panel_* to intel_pps_*_unlocked
date:   2 years, 7 months ago
config: x86_64-randconfig-015-20230829 (https://download.01.org/0day-ci/archive/20230830/202308301138.9zfgVdRX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301138.9zfgVdRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301138.9zfgVdRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_pps.o: warning: objtool: intel_pps_on_unlocked()+0x4ff: unreachable instruction


objdump-func vmlinux.o intel_pps_on_unlocked:
0000 000000000272b870 <intel_pps_on_unlocked>:
0000  272b870:	55                   	push   %rbp
0001  272b871:	41 57                	push   %r15
0003  272b873:	41 56                	push   %r14
0005  272b875:	41 55                	push   %r13
0007  272b877:	41 54                	push   %r12
0009  272b879:	53                   	push   %rbx
000a  272b87a:	48 83 ec 58          	sub    $0x58,%rsp
000e  272b87e:	49 89 fe             	mov    %rdi,%r14
0011  272b881:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001a  272b88a:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
001f  272b88f:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0029  272b899:	4c 8d a7 c0 fe ff ff 	lea    -0x140(%rdi),%r12
0030  272b8a0:	4d 89 e5             	mov    %r12,%r13
0033  272b8a3:	49 c1 ed 03          	shr    $0x3,%r13
0037  272b8a7:	43 80 7c 3d 00 00    	cmpb   $0x0,0x0(%r13,%r15,1)
003d  272b8ad:	74 08                	je     272b8b7 <intel_pps_on_unlocked+0x47>
003f  272b8af:	4c 89 e7             	mov    %r12,%rdi
0042  272b8b2:	e8 00 00 00 00       	call   272b8b7 <intel_pps_on_unlocked+0x47>	272b8b3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0047  272b8b7:	49 8b 1c 24          	mov    (%r12),%rbx
004b  272b8bb:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	272b8be: R_X86_64_32S	debug_locks
0052  272b8c2:	48 c1 e8 03          	shr    $0x3,%rax
0056  272b8c6:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
005b  272b8cb:	84 c0                	test   %al,%al
005d  272b8cd:	0f 85 b5 04 00 00    	jne    272bd88 <intel_pps_on_unlocked+0x518>
0063  272b8d3:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 272b8da <intel_pps_on_unlocked+0x6a>	272b8d5: R_X86_64_PC32	debug_locks-0x5
006a  272b8da:	74 19                	je     272b8f5 <intel_pps_on_unlocked+0x85>
006c  272b8dc:	48 8d bb 58 a1 00 00 	lea    0xa158(%rbx),%rdi
0073  272b8e3:	be ff ff ff ff       	mov    $0xffffffff,%esi
0078  272b8e8:	e8 00 00 00 00       	call   272b8ed <intel_pps_on_unlocked+0x7d>	272b8e9: R_X86_64_PLT32	lock_is_held_type-0x4
007d  272b8ed:	85 c0                	test   %eax,%eax
007f  272b8ef:	0f 84 7c 03 00 00    	je     272bc71 <intel_pps_on_unlocked+0x401>
0085  272b8f5:	4c 89 f7             	mov    %r14,%rdi
0088  272b8f8:	e8 00 00 00 00       	call   272b8fd <intel_pps_on_unlocked+0x8d>	272b8f9: R_X86_64_PLT32	intel_dp_is_edp-0x4
008d  272b8fd:	84 c0                	test   %al,%al
008f  272b8ff:	0f 84 49 03 00 00    	je     272bc4e <intel_pps_on_unlocked+0x3de>
0095  272b905:	48 8d 43 18          	lea    0x18(%rbx),%rax
0099  272b909:	48 89 c5             	mov    %rax,%rbp
009c  272b90c:	48 c1 ed 03          	shr    $0x3,%rbp
00a0  272b910:	42 80 7c 3d 00 00    	cmpb   $0x0,0x0(%rbp,%r15,1)
00a6  272b916:	48 89 04 24          	mov    %rax,(%rsp)
00aa  272b91a:	74 0d                	je     272b929 <intel_pps_on_unlocked+0xb9>
00ac  272b91c:	48 8b 3c 24          	mov    (%rsp),%rdi
00b0  272b920:	e8 00 00 00 00       	call   272b925 <intel_pps_on_unlocked+0xb5>	272b921: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b5  272b925:	48 8b 04 24          	mov    (%rsp),%rax
00b9  272b929:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
00be  272b92e:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
00c3  272b933:	48 8b 38             	mov    (%rax),%rdi
00c6  272b936:	49 8d 8e d8 fe ff ff 	lea    -0x128(%r14),%rcx
00cd  272b93d:	48 89 c8             	mov    %rcx,%rax
00d0  272b940:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
00d5  272b945:	48 c1 e9 03          	shr    $0x3,%rcx
00d9  272b949:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
00de  272b94e:	42 0f b6 04 39       	movzbl (%rcx,%r15,1),%eax
00e3  272b953:	84 c0                	test   %al,%al
00e5  272b955:	0f 85 53 04 00 00    	jne    272bdae <intel_pps_on_unlocked+0x53e>
00eb  272b95b:	45 8b ae d8 fe ff ff 	mov    -0x128(%r14),%r13d
00f2  272b962:	4d 8d a6 f8 fe ff ff 	lea    -0x108(%r14),%r12
00f9  272b969:	4c 89 e1             	mov    %r12,%rcx
00fc  272b96c:	48 c1 e9 03          	shr    $0x3,%rcx
0100  272b970:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
0105  272b975:	42 80 3c 39 00       	cmpb   $0x0,(%rcx,%r15,1)
010a  272b97a:	74 0e                	je     272b98a <intel_pps_on_unlocked+0x11a>
010c  272b97c:	49 89 ff             	mov    %rdi,%r15
010f  272b97f:	4c 89 e7             	mov    %r12,%rdi
0112  272b982:	e8 00 00 00 00       	call   272b987 <intel_pps_on_unlocked+0x117>	272b983: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0117  272b987:	4c 89 ff             	mov    %r15,%rdi
011a  272b98a:	4d 8b 86 f8 fe ff ff 	mov    -0x108(%r14),%r8
0121  272b991:	be 04 00 00 00       	mov    $0x4,%esi
0126  272b996:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	272b999: R_X86_64_32S	.rodata+0x9b3d60
012d  272b99d:	44 89 e9             	mov    %r13d,%ecx
0130  272b9a0:	e8 00 00 00 00       	call   272b9a5 <intel_pps_on_unlocked+0x135>	272b9a1: R_X86_64_PLT32	drm_dev_dbg-0x4
0135  272b9a5:	4c 89 f7             	mov    %r14,%rdi
0138  272b9a8:	e8 93 d8 ff ff       	call   2729240 <edp_have_panel_power>
013d  272b9ad:	84 c0                	test   %al,%al
013f  272b9af:	0f 85 d6 02 00 00    	jne    272bc8b <intel_pps_on_unlocked+0x41b>
0145  272b9b5:	4c 89 f7             	mov    %r14,%rdi
0148  272b9b8:	e8 00 00 00 00       	call   272b9bd <intel_pps_on_unlocked+0x14d>	272b9b9: R_X86_64_PLT32	wait_panel_power_cycle-0x4
014d  272b9bd:	4c 8d 64 24 38       	lea    0x38(%rsp),%r12
0152  272b9c2:	4c 89 f7             	mov    %r14,%rdi
0155  272b9c5:	4c 89 e6             	mov    %r12,%rsi
0158  272b9c8:	e8 93 4d 00 00       	call   2730760 <intel_pps_get_registers>
015d  272b9cd:	49 c1 ec 03          	shr    $0x3,%r12
0161  272b9d1:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
016b  272b9db:	43 0f b6 04 3c       	movzbl (%r12,%r15,1),%eax
0170  272b9e0:	84 c0                	test   %al,%al
0172  272b9e2:	0f 85 ee 03 00 00    	jne    272bdd6 <intel_pps_on_unlocked+0x566>
0178  272b9e8:	8b 44 24 38          	mov    0x38(%rsp),%eax
017c  272b9ec:	89 04 24             	mov    %eax,(%rsp)
017f  272b9ef:	4c 89 f7             	mov    %r14,%rdi
0182  272b9f2:	e8 79 f1 ff ff       	call   272ab70 <ilk_get_pp_control>
0187  272b9f7:	4c 8d ab 4a 10 00 00 	lea    0x104a(%rbx),%r13
018e  272b9fe:	4c 89 ed             	mov    %r13,%rbp
0191  272ba01:	48 c1 ed 03          	shr    $0x3,%rbp
0195  272ba05:	42 0f b6 54 3d 00    	movzbl 0x0(%rbp,%r15,1),%edx
019b  272ba0b:	84 d2                	test   %dl,%dl
019d  272ba0d:	0f 85 da 03 00 00    	jne    272bded <intel_pps_on_unlocked+0x57d>
01a3  272ba13:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
01a8  272ba18:	41 80 7d 00 05       	cmpb   $0x5,0x0(%r13)
01ad  272ba1d:	75 6e                	jne    272ba8d <intel_pps_on_unlocked+0x21d>
01af  272ba1f:	83 e0 fd             	and    $0xfffffffd,%eax
01b2  272ba22:	4c 8d ab 80 11 00 00 	lea    0x1180(%rbx),%r13
01b9  272ba29:	48 8d bb 60 12 00 00 	lea    0x1260(%rbx),%rdi
01c0  272ba30:	48 89 f9             	mov    %rdi,%rcx
01c3  272ba33:	48 c1 e9 03          	shr    $0x3,%rcx
01c7  272ba37:	42 80 3c 39 00       	cmpb   $0x0,(%rcx,%r15,1)
01cc  272ba3c:	74 0b                	je     272ba49 <intel_pps_on_unlocked+0x1d9>
01ce  272ba3e:	41 89 c4             	mov    %eax,%r12d
01d1  272ba41:	e8 00 00 00 00       	call   272ba46 <intel_pps_on_unlocked+0x1d6>	272ba42: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01d6  272ba46:	44 89 e0             	mov    %r12d,%eax
01d9  272ba49:	4c 89 ef             	mov    %r13,%rdi
01dc  272ba4c:	8b 34 24             	mov    (%rsp),%esi
01df  272ba4f:	89 44 24 18          	mov    %eax,0x18(%rsp)
01e3  272ba53:	89 c2                	mov    %eax,%edx
01e5  272ba55:	b9 01 00 00 00       	mov    $0x1,%ecx
01ea  272ba5a:	ff 93 60 12 00 00    	call   *0x1260(%rbx)
01f0  272ba60:	4c 8d a3 40 12 00 00 	lea    0x1240(%rbx),%r12
01f7  272ba67:	4c 89 e0             	mov    %r12,%rax
01fa  272ba6a:	48 c1 e8 03          	shr    $0x3,%rax
01fe  272ba6e:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0203  272ba73:	74 08                	je     272ba7d <intel_pps_on_unlocked+0x20d>
0205  272ba75:	4c 89 e7             	mov    %r12,%rdi
0208  272ba78:	e8 00 00 00 00       	call   272ba7d <intel_pps_on_unlocked+0x20d>	272ba79: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
020d  272ba7d:	4c 89 ef             	mov    %r13,%rdi
0210  272ba80:	8b 34 24             	mov    (%rsp),%esi
0213  272ba83:	31 d2                	xor    %edx,%edx
0215  272ba85:	41 ff 14 24          	call   *(%r12)
0219  272ba89:	8b 44 24 18          	mov    0x18(%rsp),%eax
021d  272ba8d:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
0222  272ba92:	42 0f b6 54 3d 00    	movzbl 0x0(%rbp,%r15,1),%edx
0228  272ba98:	84 d2                	test   %dl,%dl
022a  272ba9a:	0f 85 6e 03 00 00    	jne    272be0e <intel_pps_on_unlocked+0x59e>
0230  272baa0:	45 31 e4             	xor    %r12d,%r12d
0233  272baa3:	80 bb 4a 10 00 00 05 	cmpb   $0x5,0x104a(%rbx)
023a  272baaa:	41 0f 95 c4          	setne  %r12b
023e  272baae:	45 01 e4             	add    %r12d,%r12d
0241  272bab1:	89 44 24 18          	mov    %eax,0x18(%rsp)
0245  272bab5:	41 09 c4             	or     %eax,%r12d
0248  272bab8:	41 83 cc 01          	or     $0x1,%r12d
024c  272babc:	48 8d 83 80 11 00 00 	lea    0x1180(%rbx),%rax
0253  272bac3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0258  272bac8:	4c 8d ab 60 12 00 00 	lea    0x1260(%rbx),%r13
025f  272bacf:	4c 89 ed             	mov    %r13,%rbp
0262  272bad2:	48 c1 ed 03          	shr    $0x3,%rbp
0266  272bad6:	42 80 7c 3d 00 00    	cmpb   $0x0,0x0(%rbp,%r15,1)
026c  272badc:	74 08                	je     272bae6 <intel_pps_on_unlocked+0x276>
026e  272bade:	4c 89 ef             	mov    %r13,%rdi
0271  272bae1:	e8 00 00 00 00       	call   272bae6 <intel_pps_on_unlocked+0x276>	272bae2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0276  272bae6:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
027b  272baeb:	8b 34 24             	mov    (%rsp),%esi
027e  272baee:	44 89 e2             	mov    %r12d,%edx
0281  272baf1:	b9 01 00 00 00       	mov    $0x1,%ecx
0286  272baf6:	ff 93 60 12 00 00    	call   *0x1260(%rbx)
028c  272bafc:	48 81 c3 40 12 00 00 	add    $0x1240,%rbx
0293  272bb03:	49 89 dc             	mov    %rbx,%r12
0296  272bb06:	49 c1 ec 03          	shr    $0x3,%r12
029a  272bb0a:	43 80 3c 3c 00       	cmpb   $0x0,(%r12,%r15,1)
029f  272bb0f:	74 08                	je     272bb19 <intel_pps_on_unlocked+0x2a9>
02a1  272bb11:	48 89 df             	mov    %rbx,%rdi
02a4  272bb14:	e8 00 00 00 00       	call   272bb19 <intel_pps_on_unlocked+0x2a9>	272bb15: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02a9  272bb19:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
02ae  272bb1e:	8b 34 24             	mov    (%rsp),%esi
02b1  272bb21:	31 d2                	xor    %edx,%edx
02b3  272bb23:	ff 13                	call   *(%rbx)
02b5  272bb25:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
02ba  272bb2a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
02bf  272bb2f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
02c4  272bb34:	74 08                	je     272bb3e <intel_pps_on_unlocked+0x2ce>
02c6  272bb36:	4c 89 ff             	mov    %r15,%rdi
02c9  272bb39:	e8 00 00 00 00       	call   272bb3e <intel_pps_on_unlocked+0x2ce>	272bb3a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02ce  272bb3e:	4d 8b 3f             	mov    (%r15),%r15
02d1  272bb41:	49 83 c7 18          	add    $0x18,%r15
02d5  272bb45:	4c 89 f8             	mov    %r15,%rax
02d8  272bb48:	48 c1 e8 03          	shr    $0x3,%rax
02dc  272bb4c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02e6  272bb56:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
02ea  272bb5a:	74 08                	je     272bb64 <intel_pps_on_unlocked+0x2f4>
02ec  272bb5c:	4c 89 ff             	mov    %r15,%rdi
02ef  272bb5f:	e8 00 00 00 00       	call   272bb64 <intel_pps_on_unlocked+0x2f4>	272bb60: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02f4  272bb64:	49 8b 3f             	mov    (%r15),%rdi
02f7  272bb67:	be 04 00 00 00       	mov    $0x4,%esi
02fc  272bb6c:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	272bb6f: R_X86_64_32S	.rodata+0x9b6900
0303  272bb73:	e8 00 00 00 00       	call   272bb78 <intel_pps_on_unlocked+0x308>	272bb74: R_X86_64_PLT32	drm_dev_dbg-0x4
0308  272bb78:	4c 89 f7             	mov    %r14,%rdi
030b  272bb7b:	be 0f 00 00 b0       	mov    $0xb000000f,%esi
0310  272bb80:	ba 08 00 00 80       	mov    $0x80000008,%edx
0315  272bb85:	e8 b6 dc ff ff       	call   2729840 <wait_panel_status>
031a  272bb8a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	272bb8d: R_X86_64_32S	jiffies
0321  272bb91:	48 c1 e8 03          	shr    $0x3,%rax
0325  272bb95:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
032f  272bb9f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0333  272bba3:	74 0c                	je     272bbb1 <intel_pps_on_unlocked+0x341>
0335  272bba5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	272bba8: R_X86_64_32S	jiffies
033c  272bbac:	e8 00 00 00 00       	call   272bbb1 <intel_pps_on_unlocked+0x341>	272bbad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0341  272bbb1:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 272bbb8 <intel_pps_on_unlocked+0x348>	272bbb4: R_X86_64_PC32	jiffies-0x4
0348  272bbb8:	49 81 c6 58 0c 00 00 	add    $0xc58,%r14
034f  272bbbf:	4c 89 f0             	mov    %r14,%rax
0352  272bbc2:	48 c1 e8 03          	shr    $0x3,%rax
0356  272bbc6:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0360  272bbd0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0364  272bbd4:	74 08                	je     272bbde <intel_pps_on_unlocked+0x36e>
0366  272bbd6:	4c 89 f7             	mov    %r14,%rdi
0369  272bbd9:	e8 00 00 00 00       	call   272bbde <intel_pps_on_unlocked+0x36e>	272bbda: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
036e  272bbde:	4d 89 3e             	mov    %r15,(%r14)
0371  272bbe1:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
037b  272bbeb:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0380  272bbf0:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0385  272bbf5:	84 c0                	test   %al,%al
0387  272bbf7:	0f 85 36 02 00 00    	jne    272be33 <intel_pps_on_unlocked+0x5c3>
038d  272bbfd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0392  272bc02:	80 38 05             	cmpb   $0x5,(%rax)
0395  272bc05:	8b 54 24 18          	mov    0x18(%rsp),%edx
0399  272bc09:	75 43                	jne    272bc4e <intel_pps_on_unlocked+0x3de>
039b  272bc0b:	83 ca 03             	or     $0x3,%edx
039e  272bc0e:	42 80 7c 35 00 00    	cmpb   $0x0,0x0(%rbp,%r14,1)
03a4  272bc14:	74 0c                	je     272bc22 <intel_pps_on_unlocked+0x3b2>
03a6  272bc16:	4c 89 ef             	mov    %r13,%rdi
03a9  272bc19:	89 d5                	mov    %edx,%ebp
03ab  272bc1b:	e8 00 00 00 00       	call   272bc20 <intel_pps_on_unlocked+0x3b0>	272bc1c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03b0  272bc20:	89 ea                	mov    %ebp,%edx
03b2  272bc22:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
03b7  272bc27:	8b 34 24             	mov    (%rsp),%esi
03ba  272bc2a:	b9 01 00 00 00       	mov    $0x1,%ecx
03bf  272bc2f:	41 ff 55 00          	call   *0x0(%r13)
03c3  272bc33:	43 80 3c 34 00       	cmpb   $0x0,(%r12,%r14,1)
03c8  272bc38:	74 08                	je     272bc42 <intel_pps_on_unlocked+0x3d2>
03ca  272bc3a:	48 89 df             	mov    %rbx,%rdi
03cd  272bc3d:	e8 00 00 00 00       	call   272bc42 <intel_pps_on_unlocked+0x3d2>	272bc3e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03d2  272bc42:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
03d7  272bc47:	8b 34 24             	mov    (%rsp),%esi
03da  272bc4a:	31 d2                	xor    %edx,%edx
03dc  272bc4c:	ff 13                	call   *(%rbx)
03de  272bc4e:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
03e7  272bc57:	48 3b 44 24 50       	cmp    0x50(%rsp),%rax
03ec  272bc5c:	0f 85 12 02 00 00    	jne    272be74 <intel_pps_on_unlocked+0x604>
03f2  272bc62:	48 83 c4 58          	add    $0x58,%rsp
03f6  272bc66:	5b                   	pop    %rbx
03f7  272bc67:	41 5c                	pop    %r12
03f9  272bc69:	41 5d                	pop    %r13
03fb  272bc6b:	41 5e                	pop    %r14
03fd  272bc6d:	41 5f                	pop    %r15
03ff  272bc6f:	5d                   	pop    %rbp
0400  272bc70:	c3                   	ret
0401  272bc71:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	272bc74: R_X86_64_32S	.rodata+0x9b39e0
0408  272bc78:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	272bc7b: R_X86_64_32S	.rodata+0x9b3a00
040f  272bc7f:	e8 00 00 00 00       	call   272bc84 <intel_pps_on_unlocked+0x414>	272bc80: R_X86_64_PLT32	__warn_printk-0x4
0414  272bc84:	0f 0b                	ud2
0416  272bc86:	e9 6a fc ff ff       	jmp    272b8f5 <intel_pps_on_unlocked+0x85>
041b  272bc8b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0425  272bc95:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
042a  272bc9a:	74 09                	je     272bca5 <intel_pps_on_unlocked+0x435>
042c  272bc9c:	48 8b 3c 24          	mov    (%rsp),%rdi
0430  272bca0:	e8 00 00 00 00       	call   272bca5 <intel_pps_on_unlocked+0x435>	272bca1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0435  272bca5:	4c 8b 34 24          	mov    (%rsp),%r14
0439  272bca9:	49 8b 3e             	mov    (%r14),%rdi
043c  272bcac:	e8 00 00 00 00       	call   272bcb1 <intel_pps_on_unlocked+0x441>	272bcad: R_X86_64_PLT32	dev_driver_string-0x4
0441  272bcb1:	48 89 c3             	mov    %rax,%rbx
0444  272bcb4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
044e  272bcbe:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
0453  272bcc3:	74 08                	je     272bccd <intel_pps_on_unlocked+0x45d>
0455  272bcc5:	4c 89 f7             	mov    %r14,%rdi
0458  272bcc8:	e8 00 00 00 00       	call   272bccd <intel_pps_on_unlocked+0x45d>	272bcc9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
045d  272bccd:	4d 8b 3e             	mov    (%r14),%r15
0460  272bcd0:	4d 8d 77 50          	lea    0x50(%r15),%r14
0464  272bcd4:	4c 89 f0             	mov    %r14,%rax
0467  272bcd7:	48 c1 e8 03          	shr    $0x3,%rax
046b  272bcdb:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0475  272bce5:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0479  272bce9:	74 08                	je     272bcf3 <intel_pps_on_unlocked+0x483>
047b  272bceb:	4c 89 f7             	mov    %r14,%rdi
047e  272bcee:	e8 00 00 00 00       	call   272bcf3 <intel_pps_on_unlocked+0x483>	272bcef: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0483  272bcf3:	49 83 7f 50 00       	cmpq   $0x0,0x50(%r15)
0488  272bcf8:	4d 0f 44 f7          	cmove  %r15,%r14
048c  272bcfc:	4c 89 f0             	mov    %r14,%rax
048f  272bcff:	48 c1 e8 03          	shr    $0x3,%rax
0493  272bd03:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
049d  272bd0d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
04a1  272bd11:	74 08                	je     272bd1b <intel_pps_on_unlocked+0x4ab>
04a3  272bd13:	4c 89 f7             	mov    %r14,%rdi
04a6  272bd16:	e8 00 00 00 00       	call   272bd1b <intel_pps_on_unlocked+0x4ab>	272bd17: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04ab  272bd1b:	4d 8b 36             	mov    (%r14),%r14
04ae  272bd1e:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
04b8  272bd28:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
04bd  272bd2d:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
04c2  272bd32:	84 c0                	test   %al,%al
04c4  272bd34:	0f 85 18 01 00 00    	jne    272be52 <intel_pps_on_unlocked+0x5e2>
04ca  272bd3a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
04cf  272bd3f:	8b 28                	mov    (%rax),%ebp
04d1  272bd41:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
04d6  272bd46:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
04db  272bd4b:	74 08                	je     272bd55 <intel_pps_on_unlocked+0x4e5>
04dd  272bd4d:	4c 89 e7             	mov    %r12,%rdi
04e0  272bd50:	e8 00 00 00 00       	call   272bd55 <intel_pps_on_unlocked+0x4e5>	272bd51: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e5  272bd55:	4d 8b 04 24          	mov    (%r12),%r8
04e9  272bd59:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	272bd5c: R_X86_64_32S	.rodata+0x9b3dc0
04f0  272bd60:	48 89 de             	mov    %rbx,%rsi
04f3  272bd63:	4c 89 f2             	mov    %r14,%rdx
04f6  272bd66:	89 e9                	mov    %ebp,%ecx
04f8  272bd68:	e8 00 00 00 00       	call   272bd6d <intel_pps_on_unlocked+0x4fd>	272bd69: R_X86_64_PLT32	__warn_printk-0x4
04fd  272bd6d:	0f 0b                	ud2
04ff  272bd6f:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0508  272bd78:	48 3b 44 24 50       	cmp    0x50(%rsp),%rax
050d  272bd7d:	0f 85 f1 00 00 00    	jne    272be74 <intel_pps_on_unlocked+0x604>
0513  272bd83:	e9 da fe ff ff       	jmp    272bc62 <intel_pps_on_unlocked+0x3f2>
0518  272bd88:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	272bd8b: R_X86_64_32S	debug_locks
051f  272bd8f:	80 e1 07             	and    $0x7,%cl
0522  272bd92:	80 c1 03             	add    $0x3,%cl
0525  272bd95:	38 c1                	cmp    %al,%cl
0527  272bd97:	0f 8c 36 fb ff ff    	jl     272b8d3 <intel_pps_on_unlocked+0x63>
052d  272bd9d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	272bda0: R_X86_64_32S	debug_locks
0534  272bda4:	e8 00 00 00 00       	call   272bda9 <intel_pps_on_unlocked+0x539>	272bda5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0539  272bda9:	e9 25 fb ff ff       	jmp    272b8d3 <intel_pps_on_unlocked+0x63>
053e  272bdae:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0543  272bdb3:	80 e1 07             	and    $0x7,%cl
0546  272bdb6:	80 c1 03             	add    $0x3,%cl
0549  272bdb9:	38 c1                	cmp    %al,%cl
054b  272bdbb:	0f 8c 9a fb ff ff    	jl     272b95b <intel_pps_on_unlocked+0xeb>
0551  272bdc1:	49 89 fc             	mov    %rdi,%r12
0554  272bdc4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0559  272bdc9:	e8 00 00 00 00       	call   272bdce <intel_pps_on_unlocked+0x55e>	272bdca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
055e  272bdce:	4c 89 e7             	mov    %r12,%rdi
0561  272bdd1:	e9 85 fb ff ff       	jmp    272b95b <intel_pps_on_unlocked+0xeb>
0566  272bdd6:	3c 03                	cmp    $0x3,%al
0568  272bdd8:	0f 8f 0a fc ff ff    	jg     272b9e8 <intel_pps_on_unlocked+0x178>
056e  272bdde:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0573  272bde3:	e8 00 00 00 00       	call   272bde8 <intel_pps_on_unlocked+0x578>	272bde4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0578  272bde8:	e9 fb fb ff ff       	jmp    272b9e8 <intel_pps_on_unlocked+0x178>
057d  272bded:	44 89 e9             	mov    %r13d,%ecx
0580  272bdf0:	80 e1 07             	and    $0x7,%cl
0583  272bdf3:	38 d1                	cmp    %dl,%cl
0585  272bdf5:	0f 8c 18 fc ff ff    	jl     272ba13 <intel_pps_on_unlocked+0x1a3>
058b  272bdfb:	4c 89 ef             	mov    %r13,%rdi
058e  272bdfe:	41 89 c4             	mov    %eax,%r12d
0591  272be01:	e8 00 00 00 00       	call   272be06 <intel_pps_on_unlocked+0x596>	272be02: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0596  272be06:	44 89 e0             	mov    %r12d,%eax
0599  272be09:	e9 05 fc ff ff       	jmp    272ba13 <intel_pps_on_unlocked+0x1a3>
059e  272be0e:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
05a3  272be13:	80 e1 07             	and    $0x7,%cl
05a6  272be16:	38 d1                	cmp    %dl,%cl
05a8  272be18:	0f 8c 82 fc ff ff    	jl     272baa0 <intel_pps_on_unlocked+0x230>
05ae  272be1e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
05b3  272be23:	41 89 c4             	mov    %eax,%r12d
05b6  272be26:	e8 00 00 00 00       	call   272be2b <intel_pps_on_unlocked+0x5bb>	272be27: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
05bb  272be2b:	44 89 e0             	mov    %r12d,%eax
05be  272be2e:	e9 6d fc ff ff       	jmp    272baa0 <intel_pps_on_unlocked+0x230>
05c3  272be33:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
05c8  272be38:	80 e1 07             	and    $0x7,%cl
05cb  272be3b:	38 c1                	cmp    %al,%cl
05cd  272be3d:	0f 8c ba fd ff ff    	jl     272bbfd <intel_pps_on_unlocked+0x38d>
05d3  272be43:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
05d8  272be48:	e8 00 00 00 00       	call   272be4d <intel_pps_on_unlocked+0x5dd>	272be49: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
05dd  272be4d:	e9 ab fd ff ff       	jmp    272bbfd <intel_pps_on_unlocked+0x38d>
05e2  272be52:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
05e7  272be57:	80 e1 07             	and    $0x7,%cl
05ea  272be5a:	80 c1 03             	add    $0x3,%cl
05ed  272be5d:	38 c1                	cmp    %al,%cl
05ef  272be5f:	0f 8c d5 fe ff ff    	jl     272bd3a <intel_pps_on_unlocked+0x4ca>
05f5  272be65:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
05fa  272be6a:	e8 00 00 00 00       	call   272be6f <intel_pps_on_unlocked+0x5ff>	272be6b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
05ff  272be6f:	e9 c6 fe ff ff       	jmp    272bd3a <intel_pps_on_unlocked+0x4ca>
0604  272be74:	e8 00 00 00 00       	call   272be79 <intel_pps_on_unlocked+0x609>	272be75: R_X86_64_PLT32	__stack_chk_fail-0x4
0609  272be79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
