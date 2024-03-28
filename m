Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F31137939
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711654469; cv=none; b=IzDZ7WQyiWJKBwwuJ0NZN/AibyrmUuXdNeTPQ+opL1/cmj1vFyevp+E9Nw/n7DpYTgHIo4uaUl3G6Qvh2GjxrWUMFKyAnjgVaUdxChMupOB166bvO7ZdiWrZlNiIxzTQxE+8/Ytvf8r65BwkaGDYpBaSK3zYNQlZgkWuoLOqqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711654469; c=relaxed/simple;
	bh=mTipPWavSR51xkKhcZ6zgE8a1ocE3MxXzhn6RchVcH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdIym/03GMFdm2tbQ1ug66+Hagjworng5D62pPf55bie9eqvEd3ZSdn1yCkdFyK7SuJjSxwUyQUTrH2yLVOWbomAJ901lI8zZm+80JOsDUm5QBwfHfMBHIGKOVAiIsXsVm+zV33PA4lmnUOYaOGKAVGiVZy9I7ZjgAPfawPeKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/8gL7zM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/8gL7zM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711654464; x=1743190464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mTipPWavSR51xkKhcZ6zgE8a1ocE3MxXzhn6RchVcH4=;
  b=C/8gL7zMkxs4UQTHKXvYQk86OiRPQfMu5y+QNj94Prjqigs0xPjfdRIl
   1kGiIarWxgpzUiKOxEMN82hfz/NlpvvjqtR5iSlcnda3swWMBx6bmoO9y
   IX138aN5GiqyYW/WepBY/QAztEppe3iB45q7ZoaGvAfO259suzoY7NjVu
   m4dxHexayOq/9QpXQKLkdH8ZLeHXvNCvy9Uj6H4e2GPKHMgM/G7iMMybk
   heeM0xT/Pi6ekhLTK1itWB8iBXN7LwhdEoBkYQiN8kFVpsGMHS8FSMGb9
   XMdLQeQSWt7AXxkhqf8blIdhngSRnfGw414fsO/G7Fw/V0bWRLnhXPoF5
   w==;
X-CSE-ConnectionGUID: wVW8B+HcTGePMQv15SF39A==
X-CSE-MsgGUID: 6DUjMjy8TICDQ8YwPTrruA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="9788670"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="9788670"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 12:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="54201052"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2024 12:34:21 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpvVy-0002TS-18;
	Thu, 28 Mar 2024 19:34:18 +0000
Date: Fri, 29 Mar 2024 03:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 6086/21636] fs/fuse/dir.o: warning:
 objtool: fuse_update_get_attr+0xe67: stack state mismatch: reg1[14]=-2-32
 reg2[14]=-2-152
Message-ID: <202403290351.PKLBhub5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   77f41820390aaf6d5f3e67004fc79671dbe46821
commit: 57f3ff9648991998d008ecf32f2f9e78a08bfb8b [6086/21636] ANDROID: fuse-bpf v1.1
config: x86_64-randconfig-011-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290351.PKLBhub5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290351.PKLBhub5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290351.PKLBhub5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dir.o: warning: objtool: fuse_update_get_attr+0xe67: stack state mismatch: reg1[14]=-2-32 reg2[14]=-2-152

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


objdump-func vmlinux.o fuse_update_get_attr:
0000 0000000000ee75c0 <fuse_update_get_attr>:
0000   ee75c0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	ee75c1: R_X86_64_NONE	__fentry__-0x4
0005   ee75c5:	55                   	push   %rbp
0006   ee75c6:	41 57                	push   %r15
0008   ee75c8:	41 56                	push   %r14
000a   ee75ca:	41 55                	push   %r13
000c   ee75cc:	41 54                	push   %r12
000e   ee75ce:	53                   	push   %rbx
000f   ee75cf:	48 81 ec b8 02 00 00 	sub    $0x2b8,%rsp
0016   ee75d6:	44 89 cd             	mov    %r9d,%ebp
0019   ee75d9:	44 89 44 24 04       	mov    %r8d,0x4(%rsp)
001e   ee75de:	49 89 cd             	mov    %rcx,%r13
0021   ee75e1:	49 89 d7             	mov    %rdx,%r15
0024   ee75e4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
0029   ee75e9:	48 89 fb             	mov    %rdi,%rbx
002c   ee75ec:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0035   ee75f5:	48 89 84 24 b0 02 00 00 	mov    %rax,0x2b0(%rsp)
003d   ee75fd:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0047   ee7607:	48 81 c7 f8 04 00 00 	add    $0x4f8,%rdi
004e   ee760e:	48 89 f8             	mov    %rdi,%rax
0051   ee7611:	48 c1 e8 03          	shr    $0x3,%rax
0055   ee7615:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
005a   ee761a:	84 c0                	test   %al,%al
005c   ee761c:	0f 85 68 19 00 00    	jne    ee8f8a <fuse_update_get_attr+0x19ca>
0062   ee7622:	8b 83 f8 04 00 00    	mov    0x4f8(%rbx),%eax
0068   ee7628:	89 44 24 58          	mov    %eax,0x58(%rsp)
006c   ee762c:	48 89 df             	mov    %rbx,%rdi
006f   ee762f:	e8 00 00 00 00       	call   ee7634 <fuse_update_get_attr+0x74>	ee7630: R_X86_64_PLT32	fuse_get_cache_mask-0x4
0074   ee7634:	89 44 24 50          	mov    %eax,0x50(%rsp)
0078   ee7638:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
007d   ee763d:	48 83 c3 28          	add    $0x28,%rbx
0081   ee7641:	48 89 d8             	mov    %rbx,%rax
0084   ee7644:	48 c1 e8 03          	shr    $0x3,%rax
0088   ee7648:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
008d   ee764d:	74 12                	je     ee7661 <fuse_update_get_attr+0xa1>
008f   ee764f:	48 89 df             	mov    %rbx,%rdi
0092   ee7652:	e8 00 00 00 00       	call   ee7657 <fuse_update_get_attr+0x97>	ee7653: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0097   ee7657:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
00a1   ee7661:	41 bc d8 06 00 00    	mov    $0x6d8,%r12d
00a7   ee7667:	4c 03 23             	add    (%rbx),%r12
00aa   ee766a:	4c 89 e0             	mov    %r12,%rax
00ad   ee766d:	48 c1 e8 03          	shr    $0x3,%rax
00b1   ee7671:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
00b6   ee7676:	74 08                	je     ee7680 <fuse_update_get_attr+0xc0>
00b8   ee7678:	4c 89 e7             	mov    %r12,%rdi
00bb   ee767b:	e8 00 00 00 00       	call   ee7680 <fuse_update_get_attr+0xc0>	ee767c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00c0   ee7680:	49 8b 04 24          	mov    (%r12),%rax
00c4   ee7684:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
00c9   ee7689:	48 8d 7c 24 78       	lea    0x78(%rsp),%rdi
00ce   ee768e:	ba 78 00 00 00       	mov    $0x78,%edx
00d3   ee7693:	31 f6                	xor    %esi,%esi
00d5   ee7695:	e8 00 00 00 00       	call   ee769a <fuse_update_get_attr+0xda>	ee7696: R_X86_64_PLT32	memset-0x4
00da   ee769a:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
00e2   ee76a2:	ba e0 00 00 00       	mov    $0xe0,%edx
00e7   ee76a7:	31 f6                	xor    %esi,%esi
00e9   ee76a9:	e8 00 00 00 00       	call   ee76ae <fuse_update_get_attr+0xee>	ee76aa: R_X86_64_PLT32	memset-0x4
00ee   ee76ae:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
00f3   ee76b3:	48 85 db             	test   %rbx,%rbx
00f6   ee76b6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0100   ee76c0:	0f 84 4f 04 00 00    	je     ee7b15 <fuse_update_get_attr+0x555>
0106   ee76c6:	48 81 c3 c8 04 00 00 	add    $0x4c8,%rbx
010d   ee76cd:	48 89 d8             	mov    %rbx,%rax
0110   ee76d0:	48 c1 e8 03          	shr    $0x3,%rax
0114   ee76d4:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0118   ee76d8:	74 12                	je     ee76ec <fuse_update_get_attr+0x12c>
011a   ee76da:	48 89 df             	mov    %rbx,%rdi
011d   ee76dd:	e8 00 00 00 00       	call   ee76e2 <fuse_update_get_attr+0x122>	ee76de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0122   ee76e2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
012c   ee76ec:	48 83 3b 00          	cmpq   $0x0,(%rbx)
0130   ee76f0:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0135   ee76f5:	0f 84 1a 04 00 00    	je     ee7b15 <fuse_update_get_attr+0x555>
013b   ee76fb:	49 83 c7 08          	add    $0x8,%r15
013f   ee76ff:	4c 89 f8             	mov    %r15,%rax
0142   ee7702:	48 c1 e8 03          	shr    $0x3,%rax
0146   ee7706:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
014b   ee770b:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
014f   ee770f:	74 08                	je     ee7719 <fuse_update_get_attr+0x159>
0151   ee7711:	4c 89 ff             	mov    %r15,%rdi
0154   ee7714:	e8 00 00 00 00       	call   ee7719 <fuse_update_get_attr+0x159>	ee7715: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0159   ee7719:	49 8b 17             	mov    (%r15),%rdx
015c   ee771c:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
0164   ee7724:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
0169   ee7729:	4c 89 e9             	mov    %r13,%rcx
016c   ee772c:	44 8b 44 24 04       	mov    0x4(%rsp),%r8d
0171   ee7731:	41 89 e9             	mov    %ebp,%r9d
0174   ee7734:	e8 00 00 00 00       	call   ee7739 <fuse_update_get_attr+0x179>	ee7735: R_X86_64_PLT32	fuse_getattr_initialize-0x4
0179   ee7739:	85 c0                	test   %eax,%eax
017b   ee773b:	74 08                	je     ee7745 <fuse_update_get_attr+0x185>
017d   ee773d:	41 89 c4             	mov    %eax,%r12d
0180   ee7740:	e9 13 17 00 00       	jmp    ee8e58 <fuse_update_get_attr+0x1898>
0185   ee7745:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
018a   ee774a:	48 8d bc 24 f0 00 00 00 	lea    0xf0(%rsp),%rdi
0192   ee7752:	48 8d b4 24 d0 01 00 00 	lea    0x1d0(%rsp),%rsi
019a   ee775a:	ba e0 00 00 00       	mov    $0xe0,%edx
019f   ee775f:	e8 00 00 00 00       	call   ee7764 <fuse_update_get_attr+0x1a4>	ee7760: R_X86_64_PLT32	memcpy-0x4
01a4   ee7764:	48 8d bc 24 d8 01 00 00 	lea    0x1d8(%rsp),%rdi
01ac   ee776c:	48 89 f8             	mov    %rdi,%rax
01af   ee776f:	48 c1 e8 03          	shr    $0x3,%rax
01b3   ee7773:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
01bd   ee777d:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
01c2   ee7782:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
01c6   ee7786:	84 c0                	test   %al,%al
01c8   ee7788:	0f 85 16 18 00 00    	jne    ee8fa4 <fuse_update_get_attr+0x19e4>
01ce   ee778e:	80 8c 24 da 01 00 00 01 	orb    $0x1,0x1da(%rsp)
01d6   ee7796:	48 8d 84 24 e0 01 00 00 	lea    0x1e0(%rsp),%rax
01de   ee779e:	48 c1 e8 03          	shr    $0x3,%rax
01e2   ee77a2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
01e7   ee77a7:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
01eb   ee77ab:	84 c0                	test   %al,%al
01ed   ee77ad:	0f 85 15 18 00 00    	jne    ee8fc8 <fuse_update_get_attr+0x1a08>
01f3   ee77b3:	89 6c 24 14          	mov    %ebp,0x14(%rsp)
01f7   ee77b7:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
01fc   ee77bc:	83 bc 24 e0 01 00 00 00 	cmpl   $0x0,0x1e0(%rsp)
0204   ee77c4:	0f 84 30 02 00 00    	je     ee79fa <fuse_update_get_attr+0x43a>
020a   ee77ca:	45 31 ed             	xor    %r13d,%r13d
020d   ee77cd:	49 63 ed             	movslq %r13d,%rbp
0210   ee77d0:	83 fd 03             	cmp    $0x3,%ebp
0213   ee77d3:	0f 87 7b 01 00 00    	ja     ee7954 <fuse_update_get_attr+0x394>
0219   ee77d9:	48 8d 04 6d 00 00 00 00 	lea    0x0(,%rbp,2),%rax
0221   ee77e1:	48 01 e8             	add    %rbp,%rax
0224   ee77e4:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
0228   ee77e8:	48 81 c3 68 02 00 00 	add    $0x268,%rbx
022f   ee77ef:	48 8d 04 6d 00 00 00 00 	lea    0x0(,%rbp,2),%rax
0237   ee77f7:	48 01 e8             	add    %rbp,%rax
023a   ee77fa:	4c 8d 24 c4          	lea    (%rsp,%rax,8),%r12
023e   ee77fe:	49 81 c4 f0 01 00 00 	add    $0x1f0,%r12
0245   ee7805:	4c 89 e0             	mov    %r12,%rax
0248   ee7808:	48 c1 e8 03          	shr    $0x3,%rax
024c   ee780c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0250   ee7810:	84 c0                	test   %al,%al
0252   ee7812:	0f 85 14 01 00 00    	jne    ee792c <fuse_update_get_attr+0x36c>
0258   ee7818:	45 8b 3c 24          	mov    (%r12),%r15d
025c   ee781c:	48 8d 04 6d 00 00 00 00 	lea    0x0(,%rbp,2),%rax
0264   ee7824:	48 01 e8             	add    %rbp,%rax
0267   ee7827:	4c 8d 24 c4          	lea    (%rsp,%rax,8),%r12
026b   ee782b:	49 81 c4 f8 01 00 00 	add    $0x1f8,%r12
0272   ee7832:	4c 89 e0             	mov    %r12,%rax
0275   ee7835:	48 c1 e8 03          	shr    $0x3,%rax
0279   ee7839:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
027d   ee783d:	74 12                	je     ee7851 <fuse_update_get_attr+0x291>
027f   ee783f:	4c 89 e7             	mov    %r12,%rdi
0282   ee7842:	e8 00 00 00 00       	call   ee7847 <fuse_update_get_attr+0x287>	ee7843: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0287   ee7847:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0291   ee7851:	4d 8b 34 24          	mov    (%r12),%r14
0295   ee7855:	48 89 d8             	mov    %rbx,%rax
0298   ee7858:	48 c1 e8 03          	shr    $0x3,%rax
029c   ee785c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
02a0   ee7860:	84 c0                	test   %al,%al
02a2   ee7862:	75 76                	jne    ee78da <fuse_update_get_attr+0x31a>
02a4   ee7864:	44 89 3b             	mov    %r15d,(%rbx)
02a7   ee7867:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
02ab   ee786b:	48 89 f8             	mov    %rdi,%rax
02ae   ee786e:	48 c1 e8 03          	shr    $0x3,%rax
02b2   ee7872:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
02b6   ee7876:	74 0f                	je     ee7887 <fuse_update_get_attr+0x2c7>
02b8   ee7878:	e8 00 00 00 00       	call   ee787d <fuse_update_get_attr+0x2bd>	ee7879: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
02bd   ee787d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
02c7   ee7887:	4c 89 73 08          	mov    %r14,0x8(%rbx)
02cb   ee788b:	48 83 c3 10          	add    $0x10,%rbx
02cf   ee788f:	48 89 d8             	mov    %rbx,%rax
02d2   ee7892:	48 c1 e8 03          	shr    $0x3,%rax
02d6   ee7896:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
02da   ee789a:	74 12                	je     ee78ae <fuse_update_get_attr+0x2ee>
02dc   ee789c:	48 89 df             	mov    %rbx,%rdi
02df   ee789f:	e8 00 00 00 00       	call   ee78a4 <fuse_update_get_attr+0x2e4>	ee78a0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
02e4   ee78a4:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
02ee   ee78ae:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
02f5   ee78b5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
02fa   ee78ba:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
02fe   ee78be:	84 c0                	test   %al,%al
0300   ee78c0:	75 3f                	jne    ee7901 <fuse_update_get_attr+0x341>
0302   ee78c2:	8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%ebx
0309   ee78c9:	49 ff c5             	inc    %r13
030c   ee78cc:	41 39 dd             	cmp    %ebx,%r13d
030f   ee78cf:	0f 82 f8 fe ff ff    	jb     ee77cd <fuse_update_get_attr+0x20d>
0315   ee78d5:	e9 22 01 00 00       	jmp    ee79fc <fuse_update_get_attr+0x43c>
031a   ee78da:	89 d9                	mov    %ebx,%ecx
031c   ee78dc:	80 e1 07             	and    $0x7,%cl
031f   ee78df:	80 c1 03             	add    $0x3,%cl
0322   ee78e2:	38 c1                	cmp    %al,%cl
0324   ee78e4:	0f 8c 7a ff ff ff    	jl     ee7864 <fuse_update_get_attr+0x2a4>
032a   ee78ea:	48 89 df             	mov    %rbx,%rdi
032d   ee78ed:	e8 00 00 00 00       	call   ee78f2 <fuse_update_get_attr+0x332>	ee78ee: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0332   ee78f2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
033c   ee78fc:	e9 63 ff ff ff       	jmp    ee7864 <fuse_update_get_attr+0x2a4>
0341   ee7901:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
0349   ee7909:	80 e1 07             	and    $0x7,%cl
034c   ee790c:	80 c1 03             	add    $0x3,%cl
034f   ee790f:	38 c1                	cmp    %al,%cl
0351   ee7911:	7c af                	jl     ee78c2 <fuse_update_get_attr+0x302>
0353   ee7913:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
035b   ee791b:	e8 00 00 00 00       	call   ee7920 <fuse_update_get_attr+0x360>	ee791c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0360   ee7920:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
036a   ee792a:	eb 96                	jmp    ee78c2 <fuse_update_get_attr+0x302>
036c   ee792c:	44 89 e1             	mov    %r12d,%ecx
036f   ee792f:	80 e1 07             	and    $0x7,%cl
0372   ee7932:	80 c1 03             	add    $0x3,%cl
0375   ee7935:	38 c1                	cmp    %al,%cl
0377   ee7937:	0f 8c db fe ff ff    	jl     ee7818 <fuse_update_get_attr+0x258>
037d   ee793d:	4c 89 e7             	mov    %r12,%rdi
0380   ee7940:	e8 00 00 00 00       	call   ee7945 <fuse_update_get_attr+0x385>	ee7941: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0385   ee7945:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
038f   ee794f:	e9 c4 fe ff ff       	jmp    ee7818 <fuse_update_get_attr+0x258>
0394   ee7954:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee7957: R_X86_64_32S	.data+0x8c22c0
039b   ee795b:	4c 89 ee             	mov    %r13,%rsi
039e   ee795e:	e8 00 00 00 00       	call   ee7963 <fuse_update_get_attr+0x3a3>	ee795f: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
03a3   ee7963:	4c 8d 34 6d 00 00 00 00 	lea    0x0(,%rbp,2),%r14
03ab   ee796b:	49 01 ee             	add    %rbp,%r14
03ae   ee796e:	4a 8d 1c f4          	lea    (%rsp,%r14,8),%rbx
03b2   ee7972:	48 81 c3 68 02 00 00 	add    $0x268,%rbx
03b9   ee7979:	41 83 fd 04          	cmp    $0x4,%r13d
03bd   ee797d:	74 6c                	je     ee79eb <fuse_update_get_attr+0x42b>
03bf   ee797f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee7982: R_X86_64_32S	.data+0x8c22e0
03c6   ee7986:	4c 89 ee             	mov    %r13,%rsi
03c9   ee7989:	e8 00 00 00 00       	call   ee798e <fuse_update_get_attr+0x3ce>	ee798a: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
03ce   ee798e:	4e 8d 24 f4          	lea    (%rsp,%r14,8),%r12
03d2   ee7992:	49 81 c4 f0 01 00 00 	add    $0x1f0,%r12
03d9   ee7999:	4c 89 e0             	mov    %r12,%rax
03dc   ee799c:	48 c1 e8 03          	shr    $0x3,%rax
03e0   ee79a0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
03ea   ee79aa:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
03ee   ee79ae:	84 c0                	test   %al,%al
03f0   ee79b0:	75 22                	jne    ee79d4 <fuse_update_get_attr+0x414>
03f2   ee79b2:	45 8b 3c 24          	mov    (%r12),%r15d
03f6   ee79b6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee79b9: R_X86_64_32S	.data+0x8c2300
03fd   ee79bd:	4c 89 ee             	mov    %r13,%rsi
0400   ee79c0:	e8 00 00 00 00       	call   ee79c5 <fuse_update_get_attr+0x405>	ee79c1: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0405   ee79c5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
040f   ee79cf:	e9 48 fe ff ff       	jmp    ee781c <fuse_update_get_attr+0x25c>
0414   ee79d4:	44 89 e1             	mov    %r12d,%ecx
0417   ee79d7:	80 e1 07             	and    $0x7,%cl
041a   ee79da:	80 c1 03             	add    $0x3,%cl
041d   ee79dd:	38 c1                	cmp    %al,%cl
041f   ee79df:	7c d1                	jl     ee79b2 <fuse_update_get_attr+0x3f2>
0421   ee79e1:	4c 89 e7             	mov    %r12,%rdi
0424   ee79e4:	e8 00 00 00 00       	call   ee79e9 <fuse_update_get_attr+0x429>	ee79e5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0429   ee79e9:	eb c7                	jmp    ee79b2 <fuse_update_get_attr+0x3f2>
042b   ee79eb:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0435   ee79f5:	e9 f5 fd ff ff       	jmp    ee77ef <fuse_update_get_attr+0x22f>
043a   ee79fa:	31 db                	xor    %ebx,%ebx
043c   ee79fc:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
0444   ee7a04:	48 89 f8             	mov    %rdi,%rax
0447   ee7a07:	48 c1 e8 03          	shr    $0x3,%rax
044b   ee7a0b:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0450   ee7a10:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0454   ee7a14:	84 c0                	test   %al,%al
0456   ee7a16:	0f 85 de 15 00 00    	jne    ee8ffa <fuse_update_get_attr+0x1a3a>
045c   ee7a1c:	89 9c 24 e4 01 00 00 	mov    %ebx,0x1e4(%rsp)
0463   ee7a23:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0468   ee7a28:	4c 8d b0 d0 04 00 00 	lea    0x4d0(%rax),%r14
046f   ee7a2f:	4d 89 f7             	mov    %r14,%r15
0472   ee7a32:	49 c1 ef 03          	shr    $0x3,%r15
0476   ee7a36:	41 80 3c 17 00       	cmpb   $0x0,(%r15,%rdx,1)
047b   ee7a3b:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
0480   ee7a40:	8b 6c 24 14          	mov    0x14(%rsp),%ebp
0484   ee7a44:	74 12                	je     ee7a58 <fuse_update_get_attr+0x498>
0486   ee7a46:	4c 89 f7             	mov    %r14,%rdi
0489   ee7a49:	e8 00 00 00 00       	call   ee7a4e <fuse_update_get_attr+0x48e>	ee7a4a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
048e   ee7a4e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0498   ee7a58:	49 8b 1e             	mov    (%r14),%rbx
049b   ee7a5b:	48 85 db             	test   %rbx,%rbx
049e   ee7a5e:	0f 84 fa 01 00 00    	je     ee7c5e <fuse_update_get_attr+0x69e>
04a4   ee7a64:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ee7a67: R_X86_64_32S	bpf_stats_enabled_key
04ab   ee7a6b:	48 c1 e8 03          	shr    $0x3,%rax
04af   ee7a6f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
04b3   ee7a73:	84 c0                	test   %al,%al
04b5   ee7a75:	0f 85 f4 15 00 00    	jne    ee906f <fuse_update_get_attr+0x1aaf>
04bb   ee7a7b:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # ee7a82 <fuse_update_get_attr+0x4c2>	ee7a7d: R_X86_64_PC32	bpf_stats_enabled_key-0x5
04c2   ee7a82:	0f 8f fc 13 00 00    	jg     ee8e84 <fuse_update_get_attr+0x18c4>
04c8   ee7a88:	4c 8d 63 48          	lea    0x48(%rbx),%r12
04cc   ee7a8c:	48 83 c3 30          	add    $0x30,%rbx
04d0   ee7a90:	48 89 d8             	mov    %rbx,%rax
04d3   ee7a93:	48 c1 e8 03          	shr    $0x3,%rax
04d7   ee7a97:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
04db   ee7a9b:	74 08                	je     ee7aa5 <fuse_update_get_attr+0x4e5>
04dd   ee7a9d:	48 89 df             	mov    %rbx,%rdi
04e0   ee7aa0:	e8 00 00 00 00       	call   ee7aa5 <fuse_update_get_attr+0x4e5>	ee7aa1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e5   ee7aa5:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
04ed   ee7aad:	4c 89 e6             	mov    %r12,%rsi
04f0   ee7ab0:	ff 13                	call   *(%rbx)
04f2   ee7ab2:	85 c0                	test   %eax,%eax
04f4   ee7ab4:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
04f9   ee7ab9:	0f 88 a6 0b 00 00    	js     ee8665 <fuse_update_get_attr+0x10a5>
04ff   ee7abf:	a8 01                	test   $0x1,%al
0501   ee7ac1:	74 40                	je     ee7b03 <fuse_update_get_attr+0x543>
0503   ee7ac3:	48 89 df             	mov    %rbx,%rdi
0506   ee7ac6:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
050a   ee7aca:	e8 00 00 00 00       	call   ee7acf <fuse_update_get_attr+0x50f>	ee7acb: R_X86_64_PLT32	fuse_lock_inode-0x4
050f   ee7acf:	89 c3                	mov    %eax,%ebx
0511   ee7ad1:	48 8d b4 24 d0 01 00 00 	lea    0x1d0(%rsp),%rsi
0519   ee7ad9:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
051e   ee7ade:	e8 00 00 00 00       	call   ee7ae3 <fuse_update_get_attr+0x523>	ee7adf: R_X86_64_PLT32	fuse_bpf_simple_request-0x4
0523   ee7ae3:	49 89 c4             	mov    %rax,%r12
0526   ee7ae6:	0f b6 f3             	movzbl %bl,%esi
0529   ee7ae9:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
052e   ee7aee:	48 89 df             	mov    %rbx,%rdi
0531   ee7af1:	e8 00 00 00 00       	call   ee7af6 <fuse_update_get_attr+0x536>	ee7af2: R_X86_64_PLT32	fuse_unlock_inode-0x4
0536   ee7af6:	8b 44 24 3c          	mov    0x3c(%rsp),%eax
053a   ee7afa:	4d 85 e4             	test   %r12,%r12
053d   ee7afd:	0f 88 fb 12 00 00    	js     ee8dfe <fuse_update_get_attr+0x183e>
0543   ee7b03:	a8 02                	test   $0x2,%al
0545   ee7b05:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
054f   ee7b0f:	0f 85 4e 01 00 00    	jne    ee7c63 <fuse_update_get_attr+0x6a3>
0555   ee7b15:	f7 c5 00 20 00 00    	test   $0x2000,%ebp
055b   ee7b1b:	75 1e                	jne    ee7b3b <fuse_update_get_attr+0x57b>
055d   ee7b1d:	f7 c5 00 40 00 00    	test   $0x4000,%ebp
0563   ee7b23:	0f 85 86 00 00 00    	jne    ee7baf <fuse_update_get_attr+0x5ef>
0569   ee7b29:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
056d   ee7b2d:	f7 d1                	not    %ecx
056f   ee7b2f:	8b 44 24 58          	mov    0x58(%rsp),%eax
0573   ee7b33:	21 c8                	and    %ecx,%eax
0575   ee7b35:	85 44 24 04          	test   %eax,0x4(%rsp)
0579   ee7b39:	74 20                	je     ee7b5b <fuse_update_get_attr+0x59b>
057b   ee7b3b:	48 89 df             	mov    %rbx,%rdi
057e   ee7b3e:	e8 00 00 00 00       	call   ee7b43 <fuse_update_get_attr+0x583>	ee7b3f: R_X86_64_PLT32	forget_all_cached_acls-0x4
0583   ee7b43:	48 89 df             	mov    %rbx,%rdi
0586   ee7b46:	4c 89 ee             	mov    %r13,%rsi
0589   ee7b49:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
058e   ee7b4e:	e8 bd 6e 00 00       	call   eeea10 <fuse_do_getattr>
0593   ee7b53:	41 89 c4             	mov    %eax,%r12d
0596   ee7b56:	e9 fd 12 00 00       	jmp    ee8e58 <fuse_update_get_attr+0x1898>
059b   ee7b5b:	48 81 c3 f0 04 00 00 	add    $0x4f0,%rbx
05a2   ee7b62:	48 89 d8             	mov    %rbx,%rax
05a5   ee7b65:	48 c1 e8 03          	shr    $0x3,%rax
05a9   ee7b69:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
05ad   ee7b6d:	74 12                	je     ee7b81 <fuse_update_get_attr+0x5c1>
05af   ee7b6f:	48 89 df             	mov    %rbx,%rdi
05b2   ee7b72:	e8 00 00 00 00       	call   ee7b77 <fuse_update_get_attr+0x5b7>	ee7b73: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05b7   ee7b77:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
05c1   ee7b81:	48 8b 1b             	mov    (%rbx),%rbx
05c4   ee7b84:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ee7b87: R_X86_64_32S	jiffies
05cb   ee7b8b:	48 c1 e8 03          	shr    $0x3,%rax
05cf   ee7b8f:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
05d3   ee7b93:	74 0c                	je     ee7ba1 <fuse_update_get_attr+0x5e1>
05d5   ee7b95:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee7b98: R_X86_64_32S	jiffies
05dc   ee7b9c:	e8 00 00 00 00       	call   ee7ba1 <fuse_update_get_attr+0x5e1>	ee7b9d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05e1   ee7ba1:	48 3b 1d 00 00 00 00 	cmp    0x0(%rip),%rbx        # ee7ba8 <fuse_update_get_attr+0x5e8>	ee7ba4: R_X86_64_PC32	jiffies-0x4
05e8   ee7ba8:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
05ed   ee7bad:	78 8c                	js     ee7b3b <fuse_update_get_attr+0x57b>
05ef   ee7baf:	45 31 e4             	xor    %r12d,%r12d
05f2   ee7bb2:	4d 85 ed             	test   %r13,%r13
05f5   ee7bb5:	0f 84 9d 12 00 00    	je     ee8e58 <fuse_update_get_attr+0x1898>
05fb   ee7bbb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee7bbe: R_X86_64_32S	init_user_ns
0602   ee7bc2:	48 89 de             	mov    %rbx,%rsi
0605   ee7bc5:	4c 89 ea             	mov    %r13,%rdx
0608   ee7bc8:	e8 00 00 00 00       	call   ee7bcd <fuse_update_get_attr+0x60d>	ee7bc9: R_X86_64_PLT32	generic_fillattr-0x4
060d   ee7bcd:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0617   ee7bd7:	48 81 c3 fc 04 00 00 	add    $0x4fc,%rbx
061e   ee7bde:	48 89 d8             	mov    %rbx,%rax
0621   ee7be1:	48 c1 e8 03          	shr    $0x3,%rax
0625   ee7be5:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0629   ee7be9:	84 c0                	test   %al,%al
062b   ee7beb:	0f 85 2d 14 00 00    	jne    ee901e <fuse_update_get_attr+0x1a5e>
0631   ee7bf1:	0f b7 2b             	movzwl (%rbx),%ebp
0634   ee7bf4:	49 8d 5d 04          	lea    0x4(%r13),%rbx
0638   ee7bf8:	48 89 d8             	mov    %rbx,%rax
063b   ee7bfb:	48 c1 e8 03          	shr    $0x3,%rax
063f   ee7bff:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0643   ee7c03:	84 c0                	test   %al,%al
0645   ee7c05:	0f 85 39 14 00 00    	jne    ee9044 <fuse_update_get_attr+0x1a84>
064b   ee7c0b:	66 89 2b             	mov    %bp,(%rbx)
064e   ee7c0e:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0653   ee7c13:	48 81 c3 00 05 00 00 	add    $0x500,%rbx
065a   ee7c1a:	48 89 d8             	mov    %rbx,%rax
065d   ee7c1d:	48 c1 e8 03          	shr    $0x3,%rax
0661   ee7c21:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0665   ee7c25:	74 12                	je     ee7c39 <fuse_update_get_attr+0x679>
0667   ee7c27:	48 89 df             	mov    %rbx,%rdi
066a   ee7c2a:	e8 00 00 00 00       	call   ee7c2f <fuse_update_get_attr+0x66f>	ee7c2b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
066f   ee7c2f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0679   ee7c39:	48 8b 1b             	mov    (%rbx),%rbx
067c   ee7c3c:	49 83 c5 20          	add    $0x20,%r13
0680   ee7c40:	4c 89 e8             	mov    %r13,%rax
0683   ee7c43:	48 c1 e8 03          	shr    $0x3,%rax
0687   ee7c47:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
068b   ee7c4b:	74 08                	je     ee7c55 <fuse_update_get_attr+0x695>
068d   ee7c4d:	4c 89 ef             	mov    %r13,%rdi
0690   ee7c50:	e8 00 00 00 00       	call   ee7c55 <fuse_update_get_attr+0x695>	ee7c51: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0695   ee7c55:	49 89 5d 00          	mov    %rbx,0x0(%r13)
0699   ee7c59:	e9 fa 11 00 00       	jmp    ee8e58 <fuse_update_get_attr+0x1898>
069e   ee7c5e:	b8 02 00 00 00       	mov    $0x2,%eax
06a3   ee7c63:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
06a7   ee7c67:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
06ac   ee7c6c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
06b0   ee7c70:	84 c0                	test   %al,%al
06b2   ee7c72:	0f 85 27 14 00 00    	jne    ee909f <fuse_update_get_attr+0x1adf>
06b8   ee7c78:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
06bd   ee7c7d:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
06c2   ee7c82:	80 a4 24 da 01 00 00 fe 	andb   $0xfe,0x1da(%rsp)
06ca   ee7c8a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
06cf   ee7c8f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
06d3   ee7c93:	84 c0                	test   %al,%al
06d5   ee7c95:	0f 85 36 14 00 00    	jne    ee90d1 <fuse_update_get_attr+0x1b11>
06db   ee7c9b:	83 bc 24 e0 01 00 00 00 	cmpl   $0x0,0x1e0(%rsp)
06e3   ee7ca3:	0f 84 7e 07 00 00    	je     ee8427 <fuse_update_get_attr+0xe67>
06e9   ee7ca9:	48 8d bc 24 68 02 00 00 	lea    0x268(%rsp),%rdi
06f1   ee7cb1:	49 89 ff             	mov    %rdi,%r15
06f4   ee7cb4:	49 c1 ef 03          	shr    $0x3,%r15
06f8   ee7cb8:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
06fd   ee7cbd:	84 c0                	test   %al,%al
06ff   ee7cbf:	0f 85 94 14 00 00    	jne    ee9159 <fuse_update_get_attr+0x1b99>
0705   ee7cc5:	48 8d 9c 24 f0 01 00 00 	lea    0x1f0(%rsp),%rbx
070d   ee7ccd:	8b ac 24 68 02 00 00 	mov    0x268(%rsp),%ebp
0714   ee7cd4:	4c 8d ac 24 70 02 00 00 	lea    0x270(%rsp),%r13
071c   ee7cdc:	4d 89 ec             	mov    %r13,%r12
071f   ee7cdf:	49 c1 ec 03          	shr    $0x3,%r12
0723   ee7ce3:	41 80 3c 14 00       	cmpb   $0x0,(%r12,%rdx,1)
0728   ee7ce8:	74 12                	je     ee7cfc <fuse_update_get_attr+0x73c>
072a   ee7cea:	4c 89 ef             	mov    %r13,%rdi
072d   ee7ced:	e8 00 00 00 00       	call   ee7cf2 <fuse_update_get_attr+0x732>	ee7cee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0732   ee7cf2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
073c   ee7cfc:	4c 8b b4 24 70 02 00 00 	mov    0x270(%rsp),%r14
0744   ee7d04:	48 89 d8             	mov    %rbx,%rax
0747   ee7d07:	48 c1 e8 03          	shr    $0x3,%rax
074b   ee7d0b:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
074f   ee7d0f:	84 c0                	test   %al,%al
0751   ee7d11:	0f 85 66 14 00 00    	jne    ee917d <fuse_update_get_attr+0x1bbd>
0757   ee7d17:	89 ac 24 f0 01 00 00 	mov    %ebp,0x1f0(%rsp)
075e   ee7d1e:	48 8d bc 24 f8 01 00 00 	lea    0x1f8(%rsp),%rdi
0766   ee7d26:	48 89 f8             	mov    %rdi,%rax
0769   ee7d29:	48 c1 e8 03          	shr    $0x3,%rax
076d   ee7d2d:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0771   ee7d31:	74 0f                	je     ee7d42 <fuse_update_get_attr+0x782>
0773   ee7d33:	e8 00 00 00 00       	call   ee7d38 <fuse_update_get_attr+0x778>	ee7d34: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0778   ee7d38:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0782   ee7d42:	4c 89 b4 24 f8 01 00 00 	mov    %r14,0x1f8(%rsp)
078a   ee7d4a:	48 8d bc 24 00 02 00 00 	lea    0x200(%rsp),%rdi
0792   ee7d52:	48 89 f8             	mov    %rdi,%rax
0795   ee7d55:	48 c1 e8 03          	shr    $0x3,%rax
0799   ee7d59:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
079d   ee7d5d:	74 0f                	je     ee7d6e <fuse_update_get_attr+0x7ae>
079f   ee7d5f:	e8 00 00 00 00       	call   ee7d64 <fuse_update_get_attr+0x7a4>	ee7d60: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
07a4   ee7d64:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
07ae   ee7d6e:	48 c7 84 24 00 02 00 00 00 00 00 00 	movq   $0x0,0x200(%rsp)
07ba   ee7d7a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
07bf   ee7d7f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
07c3   ee7d83:	84 c0                	test   %al,%al
07c5   ee7d85:	0f 85 19 14 00 00    	jne    ee91a4 <fuse_update_get_attr+0x1be4>
07cb   ee7d8b:	83 bc 24 e0 01 00 00 02 	cmpl   $0x2,0x1e0(%rsp)
07d3   ee7d93:	0f 82 8e 06 00 00    	jb     ee8427 <fuse_update_get_attr+0xe67>
07d9   ee7d99:	48 8d bc 24 80 02 00 00 	lea    0x280(%rsp),%rdi
07e1   ee7da1:	48 89 f8             	mov    %rdi,%rax
07e4   ee7da4:	48 c1 e8 03          	shr    $0x3,%rax
07e8   ee7da8:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
07ec   ee7dac:	84 c0                	test   %al,%al
07ee   ee7dae:	0f 85 da 14 00 00    	jne    ee928e <fuse_update_get_attr+0x1cce>
07f4   ee7db4:	48 8d 9c 24 08 02 00 00 	lea    0x208(%rsp),%rbx
07fc   ee7dbc:	8b ac 24 80 02 00 00 	mov    0x280(%rsp),%ebp
0803   ee7dc3:	48 8d bc 24 88 02 00 00 	lea    0x288(%rsp),%rdi
080b   ee7dcb:	48 89 f8             	mov    %rdi,%rax
080e   ee7dce:	48 c1 e8 03          	shr    $0x3,%rax
0812   ee7dd2:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0816   ee7dd6:	74 0f                	je     ee7de7 <fuse_update_get_attr+0x827>
0818   ee7dd8:	e8 00 00 00 00       	call   ee7ddd <fuse_update_get_attr+0x81d>	ee7dd9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
081d   ee7ddd:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0827   ee7de7:	4c 8b b4 24 88 02 00 00 	mov    0x288(%rsp),%r14
082f   ee7def:	48 89 d8             	mov    %rbx,%rax
0832   ee7df2:	48 c1 e8 03          	shr    $0x3,%rax
0836   ee7df6:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
083a   ee7dfa:	84 c0                	test   %al,%al
083c   ee7dfc:	0f 85 b0 14 00 00    	jne    ee92b2 <fuse_update_get_attr+0x1cf2>
0842   ee7e02:	89 ac 24 08 02 00 00 	mov    %ebp,0x208(%rsp)
0849   ee7e09:	48 8d bc 24 10 02 00 00 	lea    0x210(%rsp),%rdi
0851   ee7e11:	48 89 f8             	mov    %rdi,%rax
0854   ee7e14:	48 c1 e8 03          	shr    $0x3,%rax
0858   ee7e18:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
085c   ee7e1c:	74 0f                	je     ee7e2d <fuse_update_get_attr+0x86d>
085e   ee7e1e:	e8 00 00 00 00       	call   ee7e23 <fuse_update_get_attr+0x863>	ee7e1f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0863   ee7e23:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
086d   ee7e2d:	4c 89 b4 24 10 02 00 00 	mov    %r14,0x210(%rsp)
0875   ee7e35:	48 8d bc 24 18 02 00 00 	lea    0x218(%rsp),%rdi
087d   ee7e3d:	48 89 f8             	mov    %rdi,%rax
0880   ee7e40:	48 c1 e8 03          	shr    $0x3,%rax
0884   ee7e44:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0888   ee7e48:	74 0f                	je     ee7e59 <fuse_update_get_attr+0x899>
088a   ee7e4a:	e8 00 00 00 00       	call   ee7e4f <fuse_update_get_attr+0x88f>	ee7e4b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
088f   ee7e4f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0899   ee7e59:	48 c7 84 24 18 02 00 00 00 00 00 00 	movq   $0x0,0x218(%rsp)
08a5   ee7e65:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
08aa   ee7e6a:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
08ae   ee7e6e:	84 c0                	test   %al,%al
08b0   ee7e70:	0f 85 63 14 00 00    	jne    ee92d9 <fuse_update_get_attr+0x1d19>
08b6   ee7e76:	83 bc 24 e0 01 00 00 03 	cmpl   $0x3,0x1e0(%rsp)
08be   ee7e7e:	0f 82 a3 05 00 00    	jb     ee8427 <fuse_update_get_attr+0xe67>
08c4   ee7e84:	48 8d bc 24 98 02 00 00 	lea    0x298(%rsp),%rdi
08cc   ee7e8c:	48 89 f8             	mov    %rdi,%rax
08cf   ee7e8f:	48 c1 e8 03          	shr    $0x3,%rax
08d3   ee7e93:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
08d7   ee7e97:	84 c0                	test   %al,%al
08d9   ee7e99:	0f 85 1b 15 00 00    	jne    ee93ba <fuse_update_get_attr+0x1dfa>
08df   ee7e9f:	48 8d 9c 24 20 02 00 00 	lea    0x220(%rsp),%rbx
08e7   ee7ea7:	8b ac 24 98 02 00 00 	mov    0x298(%rsp),%ebp
08ee   ee7eae:	48 8d bc 24 a0 02 00 00 	lea    0x2a0(%rsp),%rdi
08f6   ee7eb6:	48 89 f8             	mov    %rdi,%rax
08f9   ee7eb9:	48 c1 e8 03          	shr    $0x3,%rax
08fd   ee7ebd:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0901   ee7ec1:	74 0f                	je     ee7ed2 <fuse_update_get_attr+0x912>
0903   ee7ec3:	e8 00 00 00 00       	call   ee7ec8 <fuse_update_get_attr+0x908>	ee7ec4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0908   ee7ec8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0912   ee7ed2:	4c 8b b4 24 a0 02 00 00 	mov    0x2a0(%rsp),%r14
091a   ee7eda:	48 89 d8             	mov    %rbx,%rax
091d   ee7edd:	48 c1 e8 03          	shr    $0x3,%rax
0921   ee7ee1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0925   ee7ee5:	84 c0                	test   %al,%al
0927   ee7ee7:	0f 85 f1 14 00 00    	jne    ee93de <fuse_update_get_attr+0x1e1e>
092d   ee7eed:	89 ac 24 20 02 00 00 	mov    %ebp,0x220(%rsp)
0934   ee7ef4:	48 8d bc 24 28 02 00 00 	lea    0x228(%rsp),%rdi
093c   ee7efc:	48 89 f8             	mov    %rdi,%rax
093f   ee7eff:	48 c1 e8 03          	shr    $0x3,%rax
0943   ee7f03:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0947   ee7f07:	74 0f                	je     ee7f18 <fuse_update_get_attr+0x958>
0949   ee7f09:	e8 00 00 00 00       	call   ee7f0e <fuse_update_get_attr+0x94e>	ee7f0a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
094e   ee7f0e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0958   ee7f18:	4c 89 b4 24 28 02 00 00 	mov    %r14,0x228(%rsp)
0960   ee7f20:	48 8d bc 24 30 02 00 00 	lea    0x230(%rsp),%rdi
0968   ee7f28:	48 89 f8             	mov    %rdi,%rax
096b   ee7f2b:	48 c1 e8 03          	shr    $0x3,%rax
096f   ee7f2f:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0973   ee7f33:	74 0f                	je     ee7f44 <fuse_update_get_attr+0x984>
0975   ee7f35:	e8 00 00 00 00       	call   ee7f3a <fuse_update_get_attr+0x97a>	ee7f36: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
097a   ee7f3a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0984   ee7f44:	48 c7 84 24 30 02 00 00 00 00 00 00 	movq   $0x0,0x230(%rsp)
0990   ee7f50:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0995   ee7f55:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0999   ee7f59:	84 c0                	test   %al,%al
099b   ee7f5b:	0f 85 a4 14 00 00    	jne    ee9405 <fuse_update_get_attr+0x1e45>
09a1   ee7f61:	83 bc 24 e0 01 00 00 04 	cmpl   $0x4,0x1e0(%rsp)
09a9   ee7f69:	0f 82 b8 04 00 00    	jb     ee8427 <fuse_update_get_attr+0xe67>
09af   ee7f6f:	be 03 00 00 00       	mov    $0x3,%esi
09b4   ee7f74:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee7f77: R_X86_64_32S	.data+0x8c2340
09bb   ee7f7b:	49 89 d6             	mov    %rdx,%r14
09be   ee7f7e:	e8 00 00 00 00       	call   ee7f83 <fuse_update_get_attr+0x9c3>	ee7f7f: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
09c3   ee7f83:	48 8d bc 24 b0 02 00 00 	lea    0x2b0(%rsp),%rdi
09cb   ee7f8b:	48 89 f8             	mov    %rdi,%rax
09ce   ee7f8e:	48 c1 e8 03          	shr    $0x3,%rax
09d2   ee7f92:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
09d7   ee7f97:	84 c0                	test   %al,%al
09d9   ee7f99:	0f 85 ff 15 00 00    	jne    ee959e <fuse_update_get_attr+0x1fde>
09df   ee7f9f:	8b ac 24 b0 02 00 00 	mov    0x2b0(%rsp),%ebp
09e6   ee7fa6:	be 03 00 00 00       	mov    $0x3,%esi
09eb   ee7fab:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee7fae: R_X86_64_32S	.data+0x8c2360
09f2   ee7fb2:	e8 00 00 00 00       	call   ee7fb7 <fuse_update_get_attr+0x9f7>	ee7fb3: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
09f7   ee7fb7:	48 8d 9c 24 38 02 00 00 	lea    0x238(%rsp),%rbx
09ff   ee7fbf:	48 8d bc 24 b8 02 00 00 	lea    0x2b8(%rsp),%rdi
0a07   ee7fc7:	48 89 f8             	mov    %rdi,%rax
0a0a   ee7fca:	48 c1 e8 03          	shr    $0x3,%rax
0a0e   ee7fce:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0a13   ee7fd3:	4c 89 f2             	mov    %r14,%rdx
0a16   ee7fd6:	74 0f                	je     ee7fe7 <fuse_update_get_attr+0xa27>
0a18   ee7fd8:	e8 00 00 00 00       	call   ee7fdd <fuse_update_get_attr+0xa1d>	ee7fd9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a1d   ee7fdd:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0a27   ee7fe7:	4c 8b b4 24 b8 02 00 00 	mov    0x2b8(%rsp),%r14
0a2f   ee7fef:	48 89 d8             	mov    %rbx,%rax
0a32   ee7ff2:	48 c1 e8 03          	shr    $0x3,%rax
0a36   ee7ff6:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0a3a   ee7ffa:	84 c0                	test   %al,%al
0a3c   ee7ffc:	0f 85 b6 15 00 00    	jne    ee95b8 <fuse_update_get_attr+0x1ff8>
0a42   ee8002:	89 ac 24 38 02 00 00 	mov    %ebp,0x238(%rsp)
0a49   ee8009:	48 8d bc 24 40 02 00 00 	lea    0x240(%rsp),%rdi
0a51   ee8011:	48 89 f8             	mov    %rdi,%rax
0a54   ee8014:	48 c1 e8 03          	shr    $0x3,%rax
0a58   ee8018:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0a5c   ee801c:	74 0f                	je     ee802d <fuse_update_get_attr+0xa6d>
0a5e   ee801e:	e8 00 00 00 00       	call   ee8023 <fuse_update_get_attr+0xa63>	ee801f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0a63   ee8023:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0a6d   ee802d:	4c 89 b4 24 40 02 00 00 	mov    %r14,0x240(%rsp)
0a75   ee8035:	48 8d bc 24 48 02 00 00 	lea    0x248(%rsp),%rdi
0a7d   ee803d:	48 89 f8             	mov    %rdi,%rax
0a80   ee8040:	48 c1 e8 03          	shr    $0x3,%rax
0a84   ee8044:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0a88   ee8048:	74 0f                	je     ee8059 <fuse_update_get_attr+0xa99>
0a8a   ee804a:	e8 00 00 00 00       	call   ee804f <fuse_update_get_attr+0xa8f>	ee804b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0a8f   ee804f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0a99   ee8059:	48 c7 84 24 48 02 00 00 00 00 00 00 	movq   $0x0,0x248(%rsp)
0aa5   ee8065:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0aaa   ee806a:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0aae   ee806e:	84 c0                	test   %al,%al
0ab0   ee8070:	0f 85 69 15 00 00    	jne    ee95df <fuse_update_get_attr+0x201f>
0ab6   ee8076:	83 bc 24 e0 01 00 00 05 	cmpl   $0x5,0x1e0(%rsp)
0abe   ee807e:	0f 82 a3 03 00 00    	jb     ee8427 <fuse_update_get_attr+0xe67>
0ac4   ee8084:	be 04 00 00 00       	mov    $0x4,%esi
0ac9   ee8089:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee808c: R_X86_64_32S	.data+0x8c2340
0ad0   ee8090:	49 89 d6             	mov    %rdx,%r14
0ad3   ee8093:	e8 00 00 00 00       	call   ee8098 <fuse_update_get_attr+0xad8>	ee8094: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0ad8   ee8098:	48 8d bc 24 c8 02 00 00 	lea    0x2c8(%rsp),%rdi
0ae0   ee80a0:	48 89 f8             	mov    %rdi,%rax
0ae3   ee80a3:	48 c1 e8 03          	shr    $0x3,%rax
0ae7   ee80a7:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0aec   ee80ac:	84 c0                	test   %al,%al
0aee   ee80ae:	0f 85 0c 16 00 00    	jne    ee96c0 <fuse_update_get_attr+0x2100>
0af4   ee80b4:	8b ac 24 c8 02 00 00 	mov    0x2c8(%rsp),%ebp
0afb   ee80bb:	be 04 00 00 00       	mov    $0x4,%esi
0b00   ee80c0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee80c3: R_X86_64_32S	.data+0x8c2360
0b07   ee80c7:	e8 00 00 00 00       	call   ee80cc <fuse_update_get_attr+0xb0c>	ee80c8: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0b0c   ee80cc:	48 8d 9c 24 50 02 00 00 	lea    0x250(%rsp),%rbx
0b14   ee80d4:	48 8d bc 24 d0 02 00 00 	lea    0x2d0(%rsp),%rdi
0b1c   ee80dc:	48 89 f8             	mov    %rdi,%rax
0b1f   ee80df:	48 c1 e8 03          	shr    $0x3,%rax
0b23   ee80e3:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0b28   ee80e8:	4c 89 f2             	mov    %r14,%rdx
0b2b   ee80eb:	74 0f                	je     ee80fc <fuse_update_get_attr+0xb3c>
0b2d   ee80ed:	e8 00 00 00 00       	call   ee80f2 <fuse_update_get_attr+0xb32>	ee80ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b32   ee80f2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0b3c   ee80fc:	4c 8b b4 24 d0 02 00 00 	mov    0x2d0(%rsp),%r14
0b44   ee8104:	48 89 d8             	mov    %rbx,%rax
0b47   ee8107:	48 c1 e8 03          	shr    $0x3,%rax
0b4b   ee810b:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0b4f   ee810f:	84 c0                	test   %al,%al
0b51   ee8111:	0f 85 c3 15 00 00    	jne    ee96da <fuse_update_get_attr+0x211a>
0b57   ee8117:	89 ac 24 50 02 00 00 	mov    %ebp,0x250(%rsp)
0b5e   ee811e:	48 8d bc 24 58 02 00 00 	lea    0x258(%rsp),%rdi
0b66   ee8126:	48 89 f8             	mov    %rdi,%rax
0b69   ee8129:	48 c1 e8 03          	shr    $0x3,%rax
0b6d   ee812d:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0b71   ee8131:	74 0f                	je     ee8142 <fuse_update_get_attr+0xb82>
0b73   ee8133:	e8 00 00 00 00       	call   ee8138 <fuse_update_get_attr+0xb78>	ee8134: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0b78   ee8138:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0b82   ee8142:	4c 89 b4 24 58 02 00 00 	mov    %r14,0x258(%rsp)
0b8a   ee814a:	48 8d bc 24 60 02 00 00 	lea    0x260(%rsp),%rdi
0b92   ee8152:	48 89 f8             	mov    %rdi,%rax
0b95   ee8155:	48 c1 e8 03          	shr    $0x3,%rax
0b99   ee8159:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0b9d   ee815d:	74 0f                	je     ee816e <fuse_update_get_attr+0xbae>
0b9f   ee815f:	e8 00 00 00 00       	call   ee8164 <fuse_update_get_attr+0xba4>	ee8160: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0ba4   ee8164:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0bae   ee816e:	48 c7 84 24 60 02 00 00 00 00 00 00 	movq   $0x0,0x260(%rsp)
0bba   ee817a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0bbf   ee817f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0bc3   ee8183:	84 c0                	test   %al,%al
0bc5   ee8185:	0f 85 76 15 00 00    	jne    ee9701 <fuse_update_get_attr+0x2141>
0bcb   ee818b:	83 bc 24 e0 01 00 00 06 	cmpl   $0x6,0x1e0(%rsp)
0bd3   ee8193:	0f 82 8e 02 00 00    	jb     ee8427 <fuse_update_get_attr+0xe67>
0bd9   ee8199:	be 05 00 00 00       	mov    $0x5,%esi
0bde   ee819e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee81a1: R_X86_64_32S	.data+0x8c2340
0be5   ee81a5:	49 89 d6             	mov    %rdx,%r14
0be8   ee81a8:	e8 00 00 00 00       	call   ee81ad <fuse_update_get_attr+0xbed>	ee81a9: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0bed   ee81ad:	48 8d bc 24 e0 02 00 00 	lea    0x2e0(%rsp),%rdi
0bf5   ee81b5:	48 89 f8             	mov    %rdi,%rax
0bf8   ee81b8:	48 c1 e8 03          	shr    $0x3,%rax
0bfc   ee81bc:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
0c01   ee81c1:	84 c0                	test   %al,%al
0c03   ee81c3:	0f 85 88 15 00 00    	jne    ee9751 <fuse_update_get_attr+0x2191>
0c09   ee81c9:	8b 9c 24 e0 02 00 00 	mov    0x2e0(%rsp),%ebx
0c10   ee81d0:	be 05 00 00 00       	mov    $0x5,%esi
0c15   ee81d5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee81d8: R_X86_64_32S	.data+0x8c2360
0c1c   ee81dc:	e8 00 00 00 00       	call   ee81e1 <fuse_update_get_attr+0xc21>	ee81dd: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0c21   ee81e1:	48 8d bc 24 e8 02 00 00 	lea    0x2e8(%rsp),%rdi
0c29   ee81e9:	48 89 f8             	mov    %rdi,%rax
0c2c   ee81ec:	48 c1 e8 03          	shr    $0x3,%rax
0c30   ee81f0:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0c35   ee81f5:	4c 89 f2             	mov    %r14,%rdx
0c38   ee81f8:	74 0f                	je     ee8209 <fuse_update_get_attr+0xc49>
0c3a   ee81fa:	e8 00 00 00 00       	call   ee81ff <fuse_update_get_attr+0xc3f>	ee81fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c3f   ee81ff:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0c49   ee8209:	4c 8b b4 24 e8 02 00 00 	mov    0x2e8(%rsp),%r14
0c51   ee8211:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
0c56   ee8216:	84 c0                	test   %al,%al
0c58   ee8218:	0f 85 4d 15 00 00    	jne    ee976b <fuse_update_get_attr+0x21ab>
0c5e   ee821e:	89 9c 24 68 02 00 00 	mov    %ebx,0x268(%rsp)
0c65   ee8225:	41 80 3c 14 00       	cmpb   $0x0,(%r12,%rdx,1)
0c6a   ee822a:	74 12                	je     ee823e <fuse_update_get_attr+0xc7e>
0c6c   ee822c:	4c 89 ef             	mov    %r13,%rdi
0c6f   ee822f:	e8 00 00 00 00       	call   ee8234 <fuse_update_get_attr+0xc74>	ee8230: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0c74   ee8234:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0c7e   ee823e:	4c 89 b4 24 70 02 00 00 	mov    %r14,0x270(%rsp)
0c86   ee8246:	48 8d bc 24 78 02 00 00 	lea    0x278(%rsp),%rdi
0c8e   ee824e:	48 89 f8             	mov    %rdi,%rax
0c91   ee8251:	48 c1 e8 03          	shr    $0x3,%rax
0c95   ee8255:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0c99   ee8259:	74 0f                	je     ee826a <fuse_update_get_attr+0xcaa>
0c9b   ee825b:	e8 00 00 00 00       	call   ee8260 <fuse_update_get_attr+0xca0>	ee825c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0ca0   ee8260:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0caa   ee826a:	48 c7 84 24 78 02 00 00 00 00 00 00 	movq   $0x0,0x278(%rsp)
0cb6   ee8276:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0cbb   ee827b:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0cbf   ee827f:	84 c0                	test   %al,%al
0cc1   ee8281:	0f 85 16 15 00 00    	jne    ee979d <fuse_update_get_attr+0x21dd>
0cc7   ee8287:	83 bc 24 e0 01 00 00 07 	cmpl   $0x7,0x1e0(%rsp)
0ccf   ee828f:	0f 82 92 01 00 00    	jb     ee8427 <fuse_update_get_attr+0xe67>
0cd5   ee8295:	bb 06 00 00 00       	mov    $0x6,%ebx
0cda   ee829a:	4c 63 f3             	movslq %ebx,%r14
0cdd   ee829d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee82a0: R_X86_64_32S	.data+0x8c2320
0ce4   ee82a4:	48 89 de             	mov    %rbx,%rsi
0ce7   ee82a7:	49 89 d5             	mov    %rdx,%r13
0cea   ee82aa:	e8 00 00 00 00       	call   ee82af <fuse_update_get_attr+0xcef>	ee82ab: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0cef   ee82af:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee82b2: R_X86_64_32S	.data+0x8c2340
0cf6   ee82b6:	48 89 de             	mov    %rbx,%rsi
0cf9   ee82b9:	e8 00 00 00 00       	call   ee82be <fuse_update_get_attr+0xcfe>	ee82ba: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0cfe   ee82be:	4f 8d 34 76          	lea    (%r14,%r14,2),%r14
0d02   ee82c2:	4e 8d 3c f4          	lea    (%rsp,%r14,8),%r15
0d06   ee82c6:	49 81 c7 68 02 00 00 	add    $0x268,%r15
0d0d   ee82cd:	4c 89 f8             	mov    %r15,%rax
0d10   ee82d0:	48 c1 e8 03          	shr    $0x3,%rax
0d14   ee82d4:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
0d19   ee82d9:	84 c0                	test   %al,%al
0d1b   ee82db:	0f 85 d2 00 00 00    	jne    ee83b3 <fuse_update_get_attr+0xdf3>
0d21   ee82e1:	41 8b 2f             	mov    (%r15),%ebp
0d24   ee82e4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee82e7: R_X86_64_32S	.data+0x8c2360
0d2b   ee82eb:	48 89 de             	mov    %rbx,%rsi
0d2e   ee82ee:	e8 00 00 00 00       	call   ee82f3 <fuse_update_get_attr+0xd33>	ee82ef: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0d33   ee82f3:	4e 8d 24 f4          	lea    (%rsp,%r14,8),%r12
0d37   ee82f7:	49 81 c4 70 02 00 00 	add    $0x270,%r12
0d3e   ee82fe:	4c 89 e0             	mov    %r12,%rax
0d41   ee8301:	48 c1 e8 03          	shr    $0x3,%rax
0d45   ee8305:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0d4a   ee830a:	4c 89 ea             	mov    %r13,%rdx
0d4d   ee830d:	74 12                	je     ee8321 <fuse_update_get_attr+0xd61>
0d4f   ee830f:	4c 89 e7             	mov    %r12,%rdi
0d52   ee8312:	e8 00 00 00 00       	call   ee8317 <fuse_update_get_attr+0xd57>	ee8313: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d57   ee8317:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0d61   ee8321:	4e 8d 3c f4          	lea    (%rsp,%r14,8),%r15
0d65   ee8325:	49 81 c7 f0 01 00 00 	add    $0x1f0,%r15
0d6c   ee832c:	4d 8b 34 24          	mov    (%r12),%r14
0d70   ee8330:	4c 89 f8             	mov    %r15,%rax
0d73   ee8333:	48 c1 e8 03          	shr    $0x3,%rax
0d77   ee8337:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0d7b   ee833b:	84 c0                	test   %al,%al
0d7d   ee833d:	0f 85 8e 00 00 00    	jne    ee83d1 <fuse_update_get_attr+0xe11>
0d83   ee8343:	41 89 2f             	mov    %ebp,(%r15)
0d86   ee8346:	49 8d 7f 08          	lea    0x8(%r15),%rdi
0d8a   ee834a:	48 89 f8             	mov    %rdi,%rax
0d8d   ee834d:	48 c1 e8 03          	shr    $0x3,%rax
0d91   ee8351:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0d95   ee8355:	74 0f                	je     ee8366 <fuse_update_get_attr+0xda6>
0d97   ee8357:	e8 00 00 00 00       	call   ee835c <fuse_update_get_attr+0xd9c>	ee8358: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0d9c   ee835c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0da6   ee8366:	4d 89 77 08          	mov    %r14,0x8(%r15)
0daa   ee836a:	49 83 c7 10          	add    $0x10,%r15
0dae   ee836e:	4c 89 f8             	mov    %r15,%rax
0db1   ee8371:	48 c1 e8 03          	shr    $0x3,%rax
0db5   ee8375:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0db9   ee8379:	74 12                	je     ee838d <fuse_update_get_attr+0xdcd>
0dbb   ee837b:	4c 89 ff             	mov    %r15,%rdi
0dbe   ee837e:	e8 00 00 00 00       	call   ee8383 <fuse_update_get_attr+0xdc3>	ee837f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0dc3   ee8383:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0dcd   ee838d:	49 c7 07 00 00 00 00 	movq   $0x0,(%r15)
0dd4   ee8394:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0dd9   ee8399:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0ddd   ee839d:	84 c0                	test   %al,%al
0ddf   ee839f:	75 58                	jne    ee83f9 <fuse_update_get_attr+0xe39>
0de1   ee83a1:	48 ff c3             	inc    %rbx
0de4   ee83a4:	3b 9c 24 e0 01 00 00 	cmp    0x1e0(%rsp),%ebx
0deb   ee83ab:	0f 82 e9 fe ff ff    	jb     ee829a <fuse_update_get_attr+0xcda>
0df1   ee83b1:	eb 74                	jmp    ee8427 <fuse_update_get_attr+0xe67>
0df3   ee83b3:	44 89 f9             	mov    %r15d,%ecx
0df6   ee83b6:	80 e1 07             	and    $0x7,%cl
0df9   ee83b9:	80 c1 03             	add    $0x3,%cl
0dfc   ee83bc:	38 c1                	cmp    %al,%cl
0dfe   ee83be:	0f 8c 1d ff ff ff    	jl     ee82e1 <fuse_update_get_attr+0xd21>
0e04   ee83c4:	4c 89 ff             	mov    %r15,%rdi
0e07   ee83c7:	e8 00 00 00 00       	call   ee83cc <fuse_update_get_attr+0xe0c>	ee83c8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e0c   ee83cc:	e9 10 ff ff ff       	jmp    ee82e1 <fuse_update_get_attr+0xd21>
0e11   ee83d1:	44 89 f9             	mov    %r15d,%ecx
0e14   ee83d4:	80 e1 07             	and    $0x7,%cl
0e17   ee83d7:	80 c1 03             	add    $0x3,%cl
0e1a   ee83da:	38 c1                	cmp    %al,%cl
0e1c   ee83dc:	0f 8c 61 ff ff ff    	jl     ee8343 <fuse_update_get_attr+0xd83>
0e22   ee83e2:	4c 89 ff             	mov    %r15,%rdi
0e25   ee83e5:	e8 00 00 00 00       	call   ee83ea <fuse_update_get_attr+0xe2a>	ee83e6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e2a   ee83ea:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e34   ee83f4:	e9 4a ff ff ff       	jmp    ee8343 <fuse_update_get_attr+0xd83>
0e39   ee83f9:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
0e41   ee8401:	80 e1 07             	and    $0x7,%cl
0e44   ee8404:	80 c1 03             	add    $0x3,%cl
0e47   ee8407:	38 c1                	cmp    %al,%cl
0e49   ee8409:	7c 96                	jl     ee83a1 <fuse_update_get_attr+0xde1>
0e4b   ee840b:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
0e53   ee8413:	e8 00 00 00 00       	call   ee8418 <fuse_update_get_attr+0xe58>	ee8414: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e58   ee8418:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0e62   ee8422:	e9 7a ff ff ff       	jmp    ee83a1 <fuse_update_get_attr+0xde1>
0e67   ee8427:	48 8d bc 24 04 01 00 00 	lea    0x104(%rsp),%rdi
0e6f   ee842f:	49 89 ff             	mov    %rdi,%r15
0e72   ee8432:	49 c1 ef 03          	shr    $0x3,%r15
0e76   ee8436:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
0e7b   ee843b:	84 c0                	test   %al,%al
0e7d   ee843d:	0f 85 c0 0c 00 00    	jne    ee9103 <fuse_update_get_attr+0x1b43>
0e83   ee8443:	83 bc 24 04 01 00 00 00 	cmpl   $0x0,0x104(%rsp)
0e8b   ee844b:	0f 84 1c 02 00 00    	je     ee866d <fuse_update_get_attr+0x10ad>
0e91   ee8451:	45 31 ed             	xor    %r13d,%r13d
0e94   ee8454:	4d 63 e5             	movslq %r13d,%r12
0e97   ee8457:	41 83 fc 03          	cmp    $0x3,%r12d
0e9b   ee845b:	0f 87 63 01 00 00    	ja     ee85c4 <fuse_update_get_attr+0x1004>
0ea1   ee8461:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
0ea5   ee8465:	48 8d 2c c4          	lea    (%rsp,%rax,8),%rbp
0ea9   ee8469:	48 81 c5 68 02 00 00 	add    $0x268,%rbp
0eb0   ee8470:	41 83 fd 03          	cmp    $0x3,%r13d
0eb4   ee8474:	0f 84 c9 01 00 00    	je     ee8643 <fuse_update_get_attr+0x1083>
0eba   ee847a:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
0ebe   ee847e:	48 81 c3 88 01 00 00 	add    $0x188,%rbx
0ec5   ee8485:	48 89 d8             	mov    %rbx,%rax
0ec8   ee8488:	48 c1 e8 03          	shr    $0x3,%rax
0ecc   ee848c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0ed0   ee8490:	84 c0                	test   %al,%al
0ed2   ee8492:	0f 85 05 01 00 00    	jne    ee859d <fuse_update_get_attr+0xfdd>
0ed8   ee8498:	44 8b 33             	mov    (%rbx),%r14d
0edb   ee849b:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
0edf   ee849f:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
0ee3   ee84a3:	48 81 c3 90 01 00 00 	add    $0x190,%rbx
0eea   ee84aa:	48 89 d8             	mov    %rbx,%rax
0eed   ee84ad:	48 c1 e8 03          	shr    $0x3,%rax
0ef1   ee84b1:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0ef5   ee84b5:	74 12                	je     ee84c9 <fuse_update_get_attr+0xf09>
0ef7   ee84b7:	48 89 df             	mov    %rbx,%rdi
0efa   ee84ba:	e8 00 00 00 00       	call   ee84bf <fuse_update_get_attr+0xeff>	ee84bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0eff   ee84bf:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0f09   ee84c9:	48 8b 1b             	mov    (%rbx),%rbx
0f0c   ee84cc:	48 89 e8             	mov    %rbp,%rax
0f0f   ee84cf:	48 c1 e8 03          	shr    $0x3,%rax
0f13   ee84d3:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
0f17   ee84d7:	84 c0                	test   %al,%al
0f19   ee84d9:	75 74                	jne    ee854f <fuse_update_get_attr+0xf8f>
0f1b   ee84db:	44 89 75 00          	mov    %r14d,0x0(%rbp)
0f1f   ee84df:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
0f23   ee84e3:	48 89 f8             	mov    %rdi,%rax
0f26   ee84e6:	48 c1 e8 03          	shr    $0x3,%rax
0f2a   ee84ea:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0f2e   ee84ee:	74 0f                	je     ee84ff <fuse_update_get_attr+0xf3f>
0f30   ee84f0:	e8 00 00 00 00       	call   ee84f5 <fuse_update_get_attr+0xf35>	ee84f1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f35   ee84f5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0f3f   ee84ff:	48 89 5d 08          	mov    %rbx,0x8(%rbp)
0f43   ee8503:	48 83 c5 10          	add    $0x10,%rbp
0f47   ee8507:	48 89 e8             	mov    %rbp,%rax
0f4a   ee850a:	48 c1 e8 03          	shr    $0x3,%rax
0f4e   ee850e:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
0f52   ee8512:	74 12                	je     ee8526 <fuse_update_get_attr+0xf66>
0f54   ee8514:	48 89 ef             	mov    %rbp,%rdi
0f57   ee8517:	e8 00 00 00 00       	call   ee851c <fuse_update_get_attr+0xf5c>	ee8518: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f5c   ee851c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0f66   ee8526:	48 c7 45 00 00 00 00 00 	movq   $0x0,0x0(%rbp)
0f6e   ee852e:	41 0f b6 04 17       	movzbl (%r15,%rdx,1),%eax
0f73   ee8533:	84 c0                	test   %al,%al
0f75   ee8535:	75 3b                	jne    ee8572 <fuse_update_get_attr+0xfb2>
0f77   ee8537:	8b ac 24 04 01 00 00 	mov    0x104(%rsp),%ebp
0f7e   ee853e:	49 ff c5             	inc    %r13
0f81   ee8541:	41 39 ed             	cmp    %ebp,%r13d
0f84   ee8544:	0f 82 0a ff ff ff    	jb     ee8454 <fuse_update_get_attr+0xe94>
0f8a   ee854a:	e9 20 01 00 00       	jmp    ee866f <fuse_update_get_attr+0x10af>
0f8f   ee854f:	89 e9                	mov    %ebp,%ecx
0f91   ee8551:	80 e1 07             	and    $0x7,%cl
0f94   ee8554:	80 c1 03             	add    $0x3,%cl
0f97   ee8557:	38 c1                	cmp    %al,%cl
0f99   ee8559:	7c 80                	jl     ee84db <fuse_update_get_attr+0xf1b>
0f9b   ee855b:	48 89 ef             	mov    %rbp,%rdi
0f9e   ee855e:	e8 00 00 00 00       	call   ee8563 <fuse_update_get_attr+0xfa3>	ee855f: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0fa3   ee8563:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0fad   ee856d:	e9 69 ff ff ff       	jmp    ee84db <fuse_update_get_attr+0xf1b>
0fb2   ee8572:	48 8d 8c 24 04 01 00 00 	lea    0x104(%rsp),%rcx
0fba   ee857a:	80 e1 07             	and    $0x7,%cl
0fbd   ee857d:	80 c1 03             	add    $0x3,%cl
0fc0   ee8580:	38 c1                	cmp    %al,%cl
0fc2   ee8582:	7c b3                	jl     ee8537 <fuse_update_get_attr+0xf77>
0fc4   ee8584:	48 8d bc 24 04 01 00 00 	lea    0x104(%rsp),%rdi
0fcc   ee858c:	e8 00 00 00 00       	call   ee8591 <fuse_update_get_attr+0xfd1>	ee858d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0fd1   ee8591:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0fdb   ee859b:	eb 9a                	jmp    ee8537 <fuse_update_get_attr+0xf77>
0fdd   ee859d:	89 d9                	mov    %ebx,%ecx
0fdf   ee859f:	80 e1 07             	and    $0x7,%cl
0fe2   ee85a2:	80 c1 03             	add    $0x3,%cl
0fe5   ee85a5:	38 c1                	cmp    %al,%cl
0fe7   ee85a7:	0f 8c eb fe ff ff    	jl     ee8498 <fuse_update_get_attr+0xed8>
0fed   ee85ad:	48 89 df             	mov    %rbx,%rdi
0ff0   ee85b0:	e8 00 00 00 00       	call   ee85b5 <fuse_update_get_attr+0xff5>	ee85b1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ff5   ee85b5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0fff   ee85bf:	e9 d4 fe ff ff       	jmp    ee8498 <fuse_update_get_attr+0xed8>
1004   ee85c4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee85c7: R_X86_64_32S	.data+0x8c2380
100b   ee85cb:	4c 89 ee             	mov    %r13,%rsi
100e   ee85ce:	e8 00 00 00 00       	call   ee85d3 <fuse_update_get_attr+0x1013>	ee85cf: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1013   ee85d3:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
1017   ee85d7:	48 8d 2c c4          	lea    (%rsp,%rax,8),%rbp
101b   ee85db:	48 81 c5 68 02 00 00 	add    $0x268,%rbp
1022   ee85e2:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
1027   ee85e7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee85ea: R_X86_64_32S	.data+0x8c23a0
102e   ee85ee:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
1033   ee85f3:	e8 00 00 00 00       	call   ee85f8 <fuse_update_get_attr+0x1038>	ee85f4: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1038   ee85f8:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
103c   ee85fc:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
1040   ee8600:	48 81 c3 88 01 00 00 	add    $0x188,%rbx
1047   ee8607:	48 89 d8             	mov    %rbx,%rax
104a   ee860a:	48 c1 e8 03          	shr    $0x3,%rax
104e   ee860e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1058   ee8618:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
105c   ee861c:	84 c0                	test   %al,%al
105e   ee861e:	75 2f                	jne    ee864f <fuse_update_get_attr+0x108f>
1060   ee8620:	44 8b 33             	mov    (%rbx),%r14d
1063   ee8623:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee8626: R_X86_64_32S	.data+0x8c23c0
106a   ee862a:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
106f   ee862f:	e8 00 00 00 00       	call   ee8634 <fuse_update_get_attr+0x1074>	ee8630: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1074   ee8634:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
107e   ee863e:	e9 58 fe ff ff       	jmp    ee849b <fuse_update_get_attr+0xedb>
1083   ee8643:	b8 03 00 00 00       	mov    $0x3,%eax
1088   ee8648:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
108d   ee864d:	eb 98                	jmp    ee85e7 <fuse_update_get_attr+0x1027>
108f   ee864f:	89 d9                	mov    %ebx,%ecx
1091   ee8651:	80 e1 07             	and    $0x7,%cl
1094   ee8654:	80 c1 03             	add    $0x3,%cl
1097   ee8657:	38 c1                	cmp    %al,%cl
1099   ee8659:	7c c5                	jl     ee8620 <fuse_update_get_attr+0x1060>
109b   ee865b:	48 89 df             	mov    %rbx,%rdi
109e   ee865e:	e8 00 00 00 00       	call   ee8663 <fuse_update_get_attr+0x10a3>	ee865f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
10a3   ee8663:	eb bb                	jmp    ee8620 <fuse_update_get_attr+0x1060>
10a5   ee8665:	4c 63 e0             	movslq %eax,%r12
10a8   ee8668:	e9 91 07 00 00       	jmp    ee8dfe <fuse_update_get_attr+0x183e>
10ad   ee866d:	31 ed                	xor    %ebp,%ebp
10af   ee866f:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
10b4   ee8674:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
10b8   ee8678:	84 c0                	test   %al,%al
10ba   ee867a:	0f 85 a7 0a 00 00    	jne    ee9127 <fuse_update_get_attr+0x1b67>
10c0   ee8680:	89 ac 24 e4 01 00 00 	mov    %ebp,0x1e4(%rsp)
10c7   ee8687:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
10cc   ee868c:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
10d0   ee8690:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
10d5   ee8695:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
10da   ee869a:	74 08                	je     ee86a4 <fuse_update_get_attr+0x10e4>
10dc   ee869c:	48 89 df             	mov    %rbx,%rdi
10df   ee869f:	e8 00 00 00 00       	call   ee86a4 <fuse_update_get_attr+0x10e4>	ee86a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
10e4   ee86a4:	48 8b 33             	mov    (%rbx),%rsi
10e7   ee86a7:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
10ef   ee86af:	4c 89 ea             	mov    %r13,%rdx
10f2   ee86b2:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
10f6   ee86b6:	44 8b 44 24 14       	mov    0x14(%rsp),%r8d
10fb   ee86bb:	e8 00 00 00 00       	call   ee86c0 <fuse_update_get_attr+0x1100>	ee86bc: R_X86_64_PLT32	fuse_getattr_backing-0x4
1100   ee86c0:	4c 63 e0             	movslq %eax,%r12
1103   ee86c3:	49 81 fc 01 f0 ff ff 	cmp    $0xfffffffffffff001,%r12
110a   ee86ca:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1114   ee86d4:	72 24                	jb     ee86fa <fuse_update_get_attr+0x113a>
1116   ee86d6:	89 c3                	mov    %eax,%ebx
1118   ee86d8:	48 8d bc 24 dc 01 00 00 	lea    0x1dc(%rsp),%rdi
1120   ee86e0:	48 89 f8             	mov    %rdi,%rax
1123   ee86e3:	48 c1 e8 03          	shr    $0x3,%rax
1127   ee86e7:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
112b   ee86eb:	84 c0                	test   %al,%al
112d   ee86ed:	0f 85 e3 0a 00 00    	jne    ee91d6 <fuse_update_get_attr+0x1c16>
1133   ee86f3:	89 9c 24 dc 01 00 00 	mov    %ebx,0x1dc(%rsp)
113a   ee86fa:	f6 44 24 3c 04       	testb  $0x4,0x3c(%rsp)
113f   ee86ff:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
1143   ee8703:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1148   ee8708:	0f 84 12 07 00 00    	je     ee8e20 <fuse_update_get_attr+0x1860>
114e   ee870e:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
1153   ee8713:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1157   ee8717:	84 c0                	test   %al,%al
1159   ee8719:	0f 85 db 0a 00 00    	jne    ee91fa <fuse_update_get_attr+0x1c3a>
115f   ee871f:	80 8c 24 da 01 00 00 02 	orb    $0x2,0x1da(%rsp)
1167   ee8727:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
116c   ee872c:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1170   ee8730:	84 c0                	test   %al,%al
1172   ee8732:	0f 85 f4 0a 00 00    	jne    ee922c <fuse_update_get_attr+0x1c6c>
1178   ee8738:	83 bc 24 e4 01 00 00 00 	cmpl   $0x0,0x1e4(%rsp)
1180   ee8740:	0f 84 40 05 00 00    	je     ee8c86 <fuse_update_get_attr+0x16c6>
1186   ee8746:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
118b   ee874b:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
118f   ee874f:	84 c0                	test   %al,%al
1191   ee8751:	0f 85 b4 0b 00 00    	jne    ee930b <fuse_update_get_attr+0x1d4b>
1197   ee8757:	8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%ebx
119e   ee875e:	8d 43 01             	lea    0x1(%rbx),%eax
11a1   ee8761:	89 84 24 e0 01 00 00 	mov    %eax,0x1e0(%rsp)
11a8   ee8768:	48 83 fb 06          	cmp    $0x6,%rbx
11ac   ee876c:	0f 83 c1 0f 00 00    	jae    ee9733 <fuse_update_get_attr+0x2173>
11b2   ee8772:	48 8d 1c 5b          	lea    (%rbx,%rbx,2),%rbx
11b6   ee8776:	48 8d bc 24 68 02 00 00 	lea    0x268(%rsp),%rdi
11be   ee877e:	48 89 f8             	mov    %rdi,%rax
11c1   ee8781:	48 c1 e8 03          	shr    $0x3,%rax
11c5   ee8785:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
11c9   ee8789:	84 c0                	test   %al,%al
11cb   ee878b:	0f 85 ac 0b 00 00    	jne    ee933d <fuse_update_get_attr+0x1d7d>
11d1   ee8791:	48 8d 1c dc          	lea    (%rsp,%rbx,8),%rbx
11d5   ee8795:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
11dc   ee879c:	44 8b b4 24 68 02 00 00 	mov    0x268(%rsp),%r14d
11e4   ee87a4:	48 8d bc 24 70 02 00 00 	lea    0x270(%rsp),%rdi
11ec   ee87ac:	48 89 f8             	mov    %rdi,%rax
11ef   ee87af:	48 c1 e8 03          	shr    $0x3,%rax
11f3   ee87b3:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
11f7   ee87b7:	74 0f                	je     ee87c8 <fuse_update_get_attr+0x1208>
11f9   ee87b9:	e8 00 00 00 00       	call   ee87be <fuse_update_get_attr+0x11fe>	ee87ba: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
11fe   ee87be:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1208   ee87c8:	4c 8b bc 24 70 02 00 00 	mov    0x270(%rsp),%r15
1210   ee87d0:	48 89 d8             	mov    %rbx,%rax
1213   ee87d3:	48 c1 e8 03          	shr    $0x3,%rax
1217   ee87d7:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
121b   ee87db:	84 c0                	test   %al,%al
121d   ee87dd:	0f 85 7e 0b 00 00    	jne    ee9361 <fuse_update_get_attr+0x1da1>
1223   ee87e3:	44 89 33             	mov    %r14d,(%rbx)
1226   ee87e6:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
122a   ee87ea:	48 89 f8             	mov    %rdi,%rax
122d   ee87ed:	48 c1 e8 03          	shr    $0x3,%rax
1231   ee87f1:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1235   ee87f5:	74 0f                	je     ee8806 <fuse_update_get_attr+0x1246>
1237   ee87f7:	e8 00 00 00 00       	call   ee87fc <fuse_update_get_attr+0x123c>	ee87f8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
123c   ee87fc:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1246   ee8806:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
124a   ee880a:	48 83 c3 10          	add    $0x10,%rbx
124e   ee880e:	48 89 d8             	mov    %rbx,%rax
1251   ee8811:	48 c1 e8 03          	shr    $0x3,%rax
1255   ee8815:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1259   ee8819:	74 12                	je     ee882d <fuse_update_get_attr+0x126d>
125b   ee881b:	48 89 df             	mov    %rbx,%rdi
125e   ee881e:	e8 00 00 00 00       	call   ee8823 <fuse_update_get_attr+0x1263>	ee881f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1263   ee8823:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
126d   ee882d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
1274   ee8834:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1279   ee8839:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
127d   ee883d:	84 c0                	test   %al,%al
127f   ee883f:	0f 85 43 0b 00 00    	jne    ee9388 <fuse_update_get_attr+0x1dc8>
1285   ee8845:	83 bc 24 e4 01 00 00 02 	cmpl   $0x2,0x1e4(%rsp)
128d   ee884d:	0f 82 33 04 00 00    	jb     ee8c86 <fuse_update_get_attr+0x16c6>
1293   ee8853:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
1298   ee8858:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
129c   ee885c:	84 c0                	test   %al,%al
129e   ee885e:	0f 85 d3 0b 00 00    	jne    ee9437 <fuse_update_get_attr+0x1e77>
12a4   ee8864:	8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%ebx
12ab   ee886b:	8d 43 01             	lea    0x1(%rbx),%eax
12ae   ee886e:	89 84 24 e0 01 00 00 	mov    %eax,0x1e0(%rsp)
12b5   ee8875:	48 83 fb 06          	cmp    $0x6,%rbx
12b9   ee8879:	0f 83 50 0f 00 00    	jae    ee97cf <fuse_update_get_attr+0x220f>
12bf   ee887f:	48 8d 1c 5b          	lea    (%rbx,%rbx,2),%rbx
12c3   ee8883:	48 8d bc 24 80 02 00 00 	lea    0x280(%rsp),%rdi
12cb   ee888b:	48 89 f8             	mov    %rdi,%rax
12ce   ee888e:	48 c1 e8 03          	shr    $0x3,%rax
12d2   ee8892:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
12d6   ee8896:	84 c0                	test   %al,%al
12d8   ee8898:	0f 85 cb 0b 00 00    	jne    ee9469 <fuse_update_get_attr+0x1ea9>
12de   ee889e:	48 8d 1c dc          	lea    (%rsp,%rbx,8),%rbx
12e2   ee88a2:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
12e9   ee88a9:	44 8b b4 24 80 02 00 00 	mov    0x280(%rsp),%r14d
12f1   ee88b1:	48 8d bc 24 88 02 00 00 	lea    0x288(%rsp),%rdi
12f9   ee88b9:	48 89 f8             	mov    %rdi,%rax
12fc   ee88bc:	48 c1 e8 03          	shr    $0x3,%rax
1300   ee88c0:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1304   ee88c4:	74 0f                	je     ee88d5 <fuse_update_get_attr+0x1315>
1306   ee88c6:	e8 00 00 00 00       	call   ee88cb <fuse_update_get_attr+0x130b>	ee88c7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
130b   ee88cb:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1315   ee88d5:	4c 8b bc 24 88 02 00 00 	mov    0x288(%rsp),%r15
131d   ee88dd:	48 89 d8             	mov    %rbx,%rax
1320   ee88e0:	48 c1 e8 03          	shr    $0x3,%rax
1324   ee88e4:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1328   ee88e8:	84 c0                	test   %al,%al
132a   ee88ea:	0f 85 9d 0b 00 00    	jne    ee948d <fuse_update_get_attr+0x1ecd>
1330   ee88f0:	44 89 33             	mov    %r14d,(%rbx)
1333   ee88f3:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
1337   ee88f7:	48 89 f8             	mov    %rdi,%rax
133a   ee88fa:	48 c1 e8 03          	shr    $0x3,%rax
133e   ee88fe:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1342   ee8902:	74 0f                	je     ee8913 <fuse_update_get_attr+0x1353>
1344   ee8904:	e8 00 00 00 00       	call   ee8909 <fuse_update_get_attr+0x1349>	ee8905: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1349   ee8909:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1353   ee8913:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
1357   ee8917:	48 83 c3 10          	add    $0x10,%rbx
135b   ee891b:	48 89 d8             	mov    %rbx,%rax
135e   ee891e:	48 c1 e8 03          	shr    $0x3,%rax
1362   ee8922:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1366   ee8926:	74 12                	je     ee893a <fuse_update_get_attr+0x137a>
1368   ee8928:	48 89 df             	mov    %rbx,%rdi
136b   ee892b:	e8 00 00 00 00       	call   ee8930 <fuse_update_get_attr+0x1370>	ee892c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1370   ee8930:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
137a   ee893a:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
1381   ee8941:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1386   ee8946:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
138a   ee894a:	84 c0                	test   %al,%al
138c   ee894c:	0f 85 62 0b 00 00    	jne    ee94b4 <fuse_update_get_attr+0x1ef4>
1392   ee8952:	83 bc 24 e4 01 00 00 03 	cmpl   $0x3,0x1e4(%rsp)
139a   ee895a:	0f 82 26 03 00 00    	jb     ee8c86 <fuse_update_get_attr+0x16c6>
13a0   ee8960:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
13a5   ee8965:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
13a9   ee8969:	84 c0                	test   %al,%al
13ab   ee896b:	0f 85 a0 0c 00 00    	jne    ee9611 <fuse_update_get_attr+0x2051>
13b1   ee8971:	8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%ebx
13b8   ee8978:	8d 43 01             	lea    0x1(%rbx),%eax
13bb   ee897b:	89 84 24 e0 01 00 00 	mov    %eax,0x1e0(%rsp)
13c2   ee8982:	48 83 fb 06          	cmp    $0x6,%rbx
13c6   ee8986:	0f 83 61 0e 00 00    	jae    ee97ed <fuse_update_get_attr+0x222d>
13cc   ee898c:	48 8d 1c 5b          	lea    (%rbx,%rbx,2),%rbx
13d0   ee8990:	48 8d bc 24 98 02 00 00 	lea    0x298(%rsp),%rdi
13d8   ee8998:	48 89 f8             	mov    %rdi,%rax
13db   ee899b:	48 c1 e8 03          	shr    $0x3,%rax
13df   ee899f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
13e3   ee89a3:	84 c0                	test   %al,%al
13e5   ee89a5:	0f 85 98 0c 00 00    	jne    ee9643 <fuse_update_get_attr+0x2083>
13eb   ee89ab:	48 8d 1c dc          	lea    (%rsp,%rbx,8),%rbx
13ef   ee89af:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
13f6   ee89b6:	44 8b b4 24 98 02 00 00 	mov    0x298(%rsp),%r14d
13fe   ee89be:	48 8d bc 24 a0 02 00 00 	lea    0x2a0(%rsp),%rdi
1406   ee89c6:	48 89 f8             	mov    %rdi,%rax
1409   ee89c9:	48 c1 e8 03          	shr    $0x3,%rax
140d   ee89cd:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1411   ee89d1:	74 0f                	je     ee89e2 <fuse_update_get_attr+0x1422>
1413   ee89d3:	e8 00 00 00 00       	call   ee89d8 <fuse_update_get_attr+0x1418>	ee89d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1418   ee89d8:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1422   ee89e2:	4c 8b bc 24 a0 02 00 00 	mov    0x2a0(%rsp),%r15
142a   ee89ea:	48 89 d8             	mov    %rbx,%rax
142d   ee89ed:	48 c1 e8 03          	shr    $0x3,%rax
1431   ee89f1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1435   ee89f5:	84 c0                	test   %al,%al
1437   ee89f7:	0f 85 6a 0c 00 00    	jne    ee9667 <fuse_update_get_attr+0x20a7>
143d   ee89fd:	44 89 33             	mov    %r14d,(%rbx)
1440   ee8a00:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
1444   ee8a04:	48 89 f8             	mov    %rdi,%rax
1447   ee8a07:	48 c1 e8 03          	shr    $0x3,%rax
144b   ee8a0b:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
144f   ee8a0f:	74 0f                	je     ee8a20 <fuse_update_get_attr+0x1460>
1451   ee8a11:	e8 00 00 00 00       	call   ee8a16 <fuse_update_get_attr+0x1456>	ee8a12: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1456   ee8a16:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1460   ee8a20:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
1464   ee8a24:	48 83 c3 10          	add    $0x10,%rbx
1468   ee8a28:	48 89 d8             	mov    %rbx,%rax
146b   ee8a2b:	48 c1 e8 03          	shr    $0x3,%rax
146f   ee8a2f:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1473   ee8a33:	74 12                	je     ee8a47 <fuse_update_get_attr+0x1487>
1475   ee8a35:	48 89 df             	mov    %rbx,%rdi
1478   ee8a38:	e8 00 00 00 00       	call   ee8a3d <fuse_update_get_attr+0x147d>	ee8a39: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
147d   ee8a3d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1487   ee8a47:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
148e   ee8a4e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1493   ee8a53:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1497   ee8a57:	84 c0                	test   %al,%al
1499   ee8a59:	0f 85 2f 0c 00 00    	jne    ee968e <fuse_update_get_attr+0x20ce>
149f   ee8a5f:	83 bc 24 e4 01 00 00 04 	cmpl   $0x4,0x1e4(%rsp)
14a7   ee8a67:	0f 82 19 02 00 00    	jb     ee8c86 <fuse_update_get_attr+0x16c6>
14ad   ee8a6d:	41 bf 03 00 00 00    	mov    $0x3,%r15d
14b3   ee8a73:	4c 89 64 24 50       	mov    %r12,0x50(%rsp)
14b8   ee8a78:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
14bd   ee8a7d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
14c1   ee8a81:	84 c0                	test   %al,%al
14c3   ee8a83:	0f 85 4a 01 00 00    	jne    ee8bd3 <fuse_update_get_attr+0x1613>
14c9   ee8a89:	8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%ebx
14d0   ee8a90:	8d 43 01             	lea    0x1(%rbx),%eax
14d3   ee8a93:	89 84 24 e0 01 00 00 	mov    %eax,0x1e0(%rsp)
14da   ee8a9a:	48 83 fb 06          	cmp    $0x6,%rbx
14de   ee8a9e:	0f 83 ce 01 00 00    	jae    ee8c72 <fuse_update_get_attr+0x16b2>
14e4   ee8aa4:	4d 63 f7             	movslq %r15d,%r14
14e7   ee8aa7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee8aaa: R_X86_64_32S	.data+0x8c2400
14ee   ee8aae:	4c 89 fe             	mov    %r15,%rsi
14f1   ee8ab1:	e8 00 00 00 00       	call   ee8ab6 <fuse_update_get_attr+0x14f6>	ee8ab2: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
14f6   ee8ab6:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
14fa   ee8aba:	4e 8d 24 ec          	lea    (%rsp,%r13,8),%r12
14fe   ee8abe:	49 81 c4 68 02 00 00 	add    $0x268,%r12
1505   ee8ac5:	4c 89 e0             	mov    %r12,%rax
1508   ee8ac8:	48 c1 e8 03          	shr    $0x3,%rax
150c   ee8acc:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
1516   ee8ad6:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
151b   ee8adb:	84 c0                	test   %al,%al
151d   ee8add:	0f 85 18 01 00 00    	jne    ee8bfb <fuse_update_get_attr+0x163b>
1523   ee8ae3:	41 8b 04 24          	mov    (%r12),%eax
1527   ee8ae7:	89 44 24 30          	mov    %eax,0x30(%rsp)
152b   ee8aeb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee8aee: R_X86_64_32S	.data+0x8c2420
1532   ee8af2:	4c 89 fe             	mov    %r15,%rsi
1535   ee8af5:	e8 00 00 00 00       	call   ee8afa <fuse_update_get_attr+0x153a>	ee8af6: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
153a   ee8afa:	4e 8d 24 ec          	lea    (%rsp,%r13,8),%r12
153e   ee8afe:	49 81 c4 70 02 00 00 	add    $0x270,%r12
1545   ee8b05:	4c 89 e0             	mov    %r12,%rax
1548   ee8b08:	48 c1 e8 03          	shr    $0x3,%rax
154c   ee8b0c:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1551   ee8b11:	4c 89 f2             	mov    %r14,%rdx
1554   ee8b14:	74 12                	je     ee8b28 <fuse_update_get_attr+0x1568>
1556   ee8b16:	4c 89 e7             	mov    %r12,%rdi
1559   ee8b19:	e8 00 00 00 00       	call   ee8b1e <fuse_update_get_attr+0x155e>	ee8b1a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
155e   ee8b1e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1568   ee8b28:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
156c   ee8b2c:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
1570   ee8b30:	48 81 c3 f0 01 00 00 	add    $0x1f0,%rbx
1577   ee8b37:	4d 8b 24 24          	mov    (%r12),%r12
157b   ee8b3b:	48 89 d8             	mov    %rbx,%rax
157e   ee8b3e:	48 c1 e8 03          	shr    $0x3,%rax
1582   ee8b42:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
1586   ee8b46:	84 c0                	test   %al,%al
1588   ee8b48:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
158d   ee8b4d:	0f 85 c6 00 00 00    	jne    ee8c19 <fuse_update_get_attr+0x1659>
1593   ee8b53:	8b 44 24 30          	mov    0x30(%rsp),%eax
1597   ee8b57:	89 03                	mov    %eax,(%rbx)
1599   ee8b59:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
159d   ee8b5d:	48 89 f8             	mov    %rdi,%rax
15a0   ee8b60:	48 c1 e8 03          	shr    $0x3,%rax
15a4   ee8b64:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
15a8   ee8b68:	74 0f                	je     ee8b79 <fuse_update_get_attr+0x15b9>
15aa   ee8b6a:	e8 00 00 00 00       	call   ee8b6f <fuse_update_get_attr+0x15af>	ee8b6b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
15af   ee8b6f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
15b9   ee8b79:	4c 89 63 08          	mov    %r12,0x8(%rbx)
15bd   ee8b7d:	48 83 c3 10          	add    $0x10,%rbx
15c1   ee8b81:	48 89 d8             	mov    %rbx,%rax
15c4   ee8b84:	48 c1 e8 03          	shr    $0x3,%rax
15c8   ee8b88:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
15cc   ee8b8c:	74 12                	je     ee8ba0 <fuse_update_get_attr+0x15e0>
15ce   ee8b8e:	48 89 df             	mov    %rbx,%rdi
15d1   ee8b91:	e8 00 00 00 00       	call   ee8b96 <fuse_update_get_attr+0x15d6>	ee8b92: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
15d6   ee8b96:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
15e0   ee8ba0:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
15e7   ee8ba7:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
15ec   ee8bac:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
15f0   ee8bb0:	84 c0                	test   %al,%al
15f2   ee8bb2:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
15f7   ee8bb7:	0f 85 83 00 00 00    	jne    ee8c40 <fuse_update_get_attr+0x1680>
15fd   ee8bbd:	49 ff c7             	inc    %r15
1600   ee8bc0:	44 3b bc 24 e4 01 00 00 	cmp    0x1e4(%rsp),%r15d
1608   ee8bc8:	0f 82 aa fe ff ff    	jb     ee8a78 <fuse_update_get_attr+0x14b8>
160e   ee8bce:	e9 b3 00 00 00       	jmp    ee8c86 <fuse_update_get_attr+0x16c6>
1613   ee8bd3:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
161b   ee8bdb:	80 e1 07             	and    $0x7,%cl
161e   ee8bde:	80 c1 03             	add    $0x3,%cl
1621   ee8be1:	38 c1                	cmp    %al,%cl
1623   ee8be3:	0f 8c a0 fe ff ff    	jl     ee8a89 <fuse_update_get_attr+0x14c9>
1629   ee8be9:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1631   ee8bf1:	e8 00 00 00 00       	call   ee8bf6 <fuse_update_get_attr+0x1636>	ee8bf2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1636   ee8bf6:	e9 8e fe ff ff       	jmp    ee8a89 <fuse_update_get_attr+0x14c9>
163b   ee8bfb:	44 89 e1             	mov    %r12d,%ecx
163e   ee8bfe:	80 e1 07             	and    $0x7,%cl
1641   ee8c01:	80 c1 03             	add    $0x3,%cl
1644   ee8c04:	38 c1                	cmp    %al,%cl
1646   ee8c06:	0f 8c d7 fe ff ff    	jl     ee8ae3 <fuse_update_get_attr+0x1523>
164c   ee8c0c:	4c 89 e7             	mov    %r12,%rdi
164f   ee8c0f:	e8 00 00 00 00       	call   ee8c14 <fuse_update_get_attr+0x1654>	ee8c10: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1654   ee8c14:	e9 ca fe ff ff       	jmp    ee8ae3 <fuse_update_get_attr+0x1523>
1659   ee8c19:	89 d9                	mov    %ebx,%ecx
165b   ee8c1b:	80 e1 07             	and    $0x7,%cl
165e   ee8c1e:	80 c1 03             	add    $0x3,%cl
1661   ee8c21:	38 c1                	cmp    %al,%cl
1663   ee8c23:	0f 8c 2a ff ff ff    	jl     ee8b53 <fuse_update_get_attr+0x1593>
1669   ee8c29:	48 89 df             	mov    %rbx,%rdi
166c   ee8c2c:	e8 00 00 00 00       	call   ee8c31 <fuse_update_get_attr+0x1671>	ee8c2d: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1671   ee8c31:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
167b   ee8c3b:	e9 13 ff ff ff       	jmp    ee8b53 <fuse_update_get_attr+0x1593>
1680   ee8c40:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
1688   ee8c48:	80 e1 07             	and    $0x7,%cl
168b   ee8c4b:	80 c1 03             	add    $0x3,%cl
168e   ee8c4e:	38 c1                	cmp    %al,%cl
1690   ee8c50:	0f 8c 67 ff ff ff    	jl     ee8bbd <fuse_update_get_attr+0x15fd>
1696   ee8c56:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
169e   ee8c5e:	e8 00 00 00 00       	call   ee8c63 <fuse_update_get_attr+0x16a3>	ee8c5f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
16a3   ee8c63:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
16ad   ee8c6d:	e9 4b ff ff ff       	jmp    ee8bbd <fuse_update_get_attr+0x15fd>
16b2   ee8c72:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee8c75: R_X86_64_32S	.data+0x8c23e0
16b9   ee8c79:	48 89 de             	mov    %rbx,%rsi
16bc   ee8c7c:	e8 00 00 00 00       	call   ee8c81 <fuse_update_get_attr+0x16c1>	ee8c7d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
16c1   ee8c81:	e9 1e fe ff ff       	jmp    ee8aa4 <fuse_update_get_attr+0x14e4>
16c6   ee8c86:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
16cb   ee8c8b:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
16cf   ee8c8f:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
16d4   ee8c94:	74 12                	je     ee8ca8 <fuse_update_get_attr+0x16e8>
16d6   ee8c96:	48 89 df             	mov    %rbx,%rdi
16d9   ee8c99:	e8 00 00 00 00       	call   ee8c9e <fuse_update_get_attr+0x16de>	ee8c9a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16de   ee8c9e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
16e8   ee8ca8:	48 8b 1b             	mov    (%rbx),%rbx
16eb   ee8cab:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	ee8cae: R_X86_64_32S	bpf_stats_enabled_key
16f2   ee8cb2:	48 c1 e8 03          	shr    $0x3,%rax
16f6   ee8cb6:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
16fa   ee8cba:	84 c0                	test   %al,%al
16fc   ee8cbc:	0f 85 9c 05 00 00    	jne    ee925e <fuse_update_get_attr+0x1c9e>
1702   ee8cc2:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # ee8cc9 <fuse_update_get_attr+0x1709>	ee8cc4: R_X86_64_PC32	bpf_stats_enabled_key-0x5
1709   ee8cc9:	0f 8f 42 02 00 00    	jg     ee8f11 <fuse_update_get_attr+0x1951>
170f   ee8ccf:	4d 89 e6             	mov    %r12,%r14
1712   ee8cd2:	4c 8d 7b 48          	lea    0x48(%rbx),%r15
1716   ee8cd6:	48 83 c3 30          	add    $0x30,%rbx
171a   ee8cda:	48 89 d8             	mov    %rbx,%rax
171d   ee8cdd:	48 c1 e8 03          	shr    $0x3,%rax
1721   ee8ce1:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1725   ee8ce5:	74 08                	je     ee8cef <fuse_update_get_attr+0x172f>
1727   ee8ce7:	48 89 df             	mov    %rbx,%rdi
172a   ee8cea:	e8 00 00 00 00       	call   ee8cef <fuse_update_get_attr+0x172f>	ee8ceb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
172f   ee8cef:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
1737   ee8cf7:	4c 89 fe             	mov    %r15,%rsi
173a   ee8cfa:	ff 13                	call   *(%rbx)
173c   ee8cfc:	41 89 c4             	mov    %eax,%r12d
173f   ee8cff:	45 85 e4             	test   %r12d,%r12d
1742   ee8d02:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
1746   ee8d06:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
174b   ee8d0b:	0f 88 02 01 00 00    	js     ee8e13 <fuse_update_get_attr+0x1853>
1751   ee8d11:	41 f6 c4 01          	test   $0x1,%r12b
1755   ee8d15:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
175f   ee8d1f:	4d 89 f4             	mov    %r14,%r12
1762   ee8d22:	0f 84 f8 00 00 00    	je     ee8e20 <fuse_update_get_attr+0x1860>
1768   ee8d28:	48 8d bc 24 88 01 00 00 	lea    0x188(%rsp),%rdi
1770   ee8d30:	48 89 f8             	mov    %rdi,%rax
1773   ee8d33:	48 c1 e8 03          	shr    $0x3,%rax
1777   ee8d37:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
177b   ee8d3b:	84 c0                	test   %al,%al
177d   ee8d3d:	0f 85 a3 07 00 00    	jne    ee94e6 <fuse_update_get_attr+0x1f26>
1783   ee8d43:	8b 9c 24 88 01 00 00 	mov    0x188(%rsp),%ebx
178a   ee8d4a:	48 8d bc 24 68 02 00 00 	lea    0x268(%rsp),%rdi
1792   ee8d52:	48 89 f8             	mov    %rdi,%rax
1795   ee8d55:	48 c1 e8 03          	shr    $0x3,%rax
1799   ee8d59:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
179d   ee8d5d:	84 c0                	test   %al,%al
179f   ee8d5f:	0f 85 a5 07 00 00    	jne    ee950a <fuse_update_get_attr+0x1f4a>
17a5   ee8d65:	89 9c 24 68 02 00 00 	mov    %ebx,0x268(%rsp)
17ac   ee8d6c:	48 8d bc 24 a0 01 00 00 	lea    0x1a0(%rsp),%rdi
17b4   ee8d74:	48 89 f8             	mov    %rdi,%rax
17b7   ee8d77:	48 c1 e8 03          	shr    $0x3,%rax
17bb   ee8d7b:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
17bf   ee8d7f:	84 c0                	test   %al,%al
17c1   ee8d81:	0f 85 a7 07 00 00    	jne    ee952e <fuse_update_get_attr+0x1f6e>
17c7   ee8d87:	8b 9c 24 a0 01 00 00 	mov    0x1a0(%rsp),%ebx
17ce   ee8d8e:	48 8d bc 24 80 02 00 00 	lea    0x280(%rsp),%rdi
17d6   ee8d96:	48 89 f8             	mov    %rdi,%rax
17d9   ee8d99:	48 c1 e8 03          	shr    $0x3,%rax
17dd   ee8d9d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
17e1   ee8da1:	84 c0                	test   %al,%al
17e3   ee8da3:	0f 85 a9 07 00 00    	jne    ee9552 <fuse_update_get_attr+0x1f92>
17e9   ee8da9:	89 9c 24 80 02 00 00 	mov    %ebx,0x280(%rsp)
17f0   ee8db0:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
17f5   ee8db5:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
17f9   ee8db9:	84 c0                	test   %al,%al
17fb   ee8dbb:	0f 85 b5 07 00 00    	jne    ee9576 <fuse_update_get_attr+0x1fb6>
1801   ee8dc1:	89 ac 24 e4 01 00 00 	mov    %ebp,0x1e4(%rsp)
1808   ee8dc8:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
180d   ee8dcd:	4c 89 f7             	mov    %r14,%rdi
1810   ee8dd0:	e8 00 00 00 00       	call   ee8dd5 <fuse_update_get_attr+0x1815>	ee8dd1: R_X86_64_PLT32	fuse_lock_inode-0x4
1815   ee8dd5:	89 c3                	mov    %eax,%ebx
1817   ee8dd7:	48 8d b4 24 d0 01 00 00 	lea    0x1d0(%rsp),%rsi
181f   ee8ddf:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
1824   ee8de4:	e8 00 00 00 00       	call   ee8de9 <fuse_update_get_attr+0x1829>	ee8de5: R_X86_64_PLT32	fuse_bpf_simple_request-0x4
1829   ee8de9:	49 89 c7             	mov    %rax,%r15
182c   ee8dec:	0f b6 f3             	movzbl %bl,%esi
182f   ee8def:	4c 89 f7             	mov    %r14,%rdi
1832   ee8df2:	e8 00 00 00 00       	call   ee8df7 <fuse_update_get_attr+0x1837>	ee8df3: R_X86_64_PLT32	fuse_unlock_inode-0x4
1837   ee8df7:	4d 85 ff             	test   %r15,%r15
183a   ee8dfa:	4d 0f 48 e7          	cmovs  %r15,%r12
183e   ee8dfe:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1848   ee8e08:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
184c   ee8e0c:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1851   ee8e11:	eb 0d                	jmp    ee8e20 <fuse_update_get_attr+0x1860>
1853   ee8e13:	4d 63 e4             	movslq %r12d,%r12
1856   ee8e16:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1860   ee8e20:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
1865   ee8e25:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
1869   ee8e29:	74 0e                	je     ee8e39 <fuse_update_get_attr+0x1879>
186b   ee8e2b:	e8 00 00 00 00       	call   ee8e30 <fuse_update_get_attr+0x1870>	ee8e2c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1870   ee8e30:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1875   ee8e35:	8b 4c 24 04          	mov    0x4(%rsp),%ecx
1879   ee8e39:	48 8b 37             	mov    (%rdi),%rsi
187c   ee8e3c:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
1884   ee8e44:	4c 89 ea             	mov    %r13,%rdx
1887   ee8e47:	44 8b 44 24 14       	mov    0x14(%rsp),%r8d
188c   ee8e4c:	e8 00 00 00 00       	call   ee8e51 <fuse_update_get_attr+0x1891>	ee8e4d: R_X86_64_PLT32	fuse_getattr_finalize-0x4
1891   ee8e51:	48 85 c0             	test   %rax,%rax
1894   ee8e54:	44 0f 45 e0          	cmovne %eax,%r12d
1898   ee8e58:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
18a1   ee8e61:	48 3b 84 24 b0 02 00 00 	cmp    0x2b0(%rsp),%rax
18a9   ee8e69:	0f 85 fb 01 00 00    	jne    ee906a <fuse_update_get_attr+0x1aaa>
18af   ee8e6f:	44 89 e0             	mov    %r12d,%eax
18b2   ee8e72:	48 81 c4 b8 02 00 00 	add    $0x2b8,%rsp
18b9   ee8e79:	5b                   	pop    %rbx
18ba   ee8e7a:	41 5c                	pop    %r12
18bc   ee8e7c:	41 5d                	pop    %r13
18be   ee8e7e:	41 5e                	pop    %r14
18c0   ee8e80:	41 5f                	pop    %r15
18c2   ee8e82:	5d                   	pop    %rbp
18c3   ee8e83:	c3                   	ret
18c4   ee8e84:	4c 89 7c 24 48       	mov    %r15,0x48(%rsp)
18c9   ee8e89:	4d 89 f7             	mov    %r14,%r15
18cc   ee8e8c:	49 89 d6             	mov    %rdx,%r14
18cf   ee8e8f:	e8 00 00 00 00       	call   ee8e94 <fuse_update_get_attr+0x18d4>	ee8e90: R_X86_64_PLT32	sched_clock-0x4
18d4   ee8e94:	49 89 c5             	mov    %rax,%r13
18d7   ee8e97:	4c 8d 63 48          	lea    0x48(%rbx),%r12
18db   ee8e9b:	48 8d 7b 30          	lea    0x30(%rbx),%rdi
18df   ee8e9f:	48 89 f8             	mov    %rdi,%rax
18e2   ee8ea2:	48 c1 e8 03          	shr    $0x3,%rax
18e6   ee8ea6:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
18eb   ee8eab:	74 05                	je     ee8eb2 <fuse_update_get_attr+0x18f2>
18ed   ee8ead:	e8 00 00 00 00       	call   ee8eb2 <fuse_update_get_attr+0x18f2>	ee8eae: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
18f2   ee8eb2:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
18fa   ee8eba:	4c 89 e6             	mov    %r12,%rsi
18fd   ee8ebd:	ff 53 30             	call   *0x30(%rbx)
1900   ee8ec0:	41 89 c4             	mov    %eax,%r12d
1903   ee8ec3:	48 83 c3 20          	add    $0x20,%rbx
1907   ee8ec7:	48 89 d8             	mov    %rbx,%rax
190a   ee8eca:	48 c1 e8 03          	shr    $0x3,%rax
190e   ee8ece:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1918   ee8ed8:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
191c   ee8edc:	74 08                	je     ee8ee6 <fuse_update_get_attr+0x1926>
191e   ee8ede:	48 89 df             	mov    %rbx,%rdi
1921   ee8ee1:	e8 00 00 00 00       	call   ee8ee6 <fuse_update_get_attr+0x1926>	ee8ee2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1926   ee8ee6:	48 8b 1b             	mov    (%rbx),%rbx
1929   ee8ee9:	48 ff 03             	incq   (%rbx)
192c   ee8eec:	e8 00 00 00 00       	call   ee8ef1 <fuse_update_get_attr+0x1931>	ee8eed: R_X86_64_PLT32	sched_clock-0x4
1931   ee8ef1:	4c 29 e8             	sub    %r13,%rax
1934   ee8ef4:	48 01 43 08          	add    %rax,0x8(%rbx)
1938   ee8ef8:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
193d   ee8efd:	8b 6c 24 14          	mov    0x14(%rsp),%ebp
1941   ee8f01:	4d 89 fe             	mov    %r15,%r14
1944   ee8f04:	4c 8b 7c 24 48       	mov    0x48(%rsp),%r15
1949   ee8f09:	44 89 e0             	mov    %r12d,%eax
194c   ee8f0c:	e9 a1 eb ff ff       	jmp    ee7ab2 <fuse_update_get_attr+0x4f2>
1951   ee8f11:	4d 89 e6             	mov    %r12,%r14
1954   ee8f14:	49 89 d5             	mov    %rdx,%r13
1957   ee8f17:	e8 00 00 00 00       	call   ee8f1c <fuse_update_get_attr+0x195c>	ee8f18: R_X86_64_PLT32	sched_clock-0x4
195c   ee8f1c:	49 89 c7             	mov    %rax,%r15
195f   ee8f1f:	4c 8d 63 48          	lea    0x48(%rbx),%r12
1963   ee8f23:	48 8d 7b 30          	lea    0x30(%rbx),%rdi
1967   ee8f27:	48 89 f8             	mov    %rdi,%rax
196a   ee8f2a:	48 c1 e8 03          	shr    $0x3,%rax
196e   ee8f2e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1973   ee8f33:	74 05                	je     ee8f3a <fuse_update_get_attr+0x197a>
1975   ee8f35:	e8 00 00 00 00       	call   ee8f3a <fuse_update_get_attr+0x197a>	ee8f36: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
197a   ee8f3a:	48 8d bc 24 d0 01 00 00 	lea    0x1d0(%rsp),%rdi
1982   ee8f42:	4c 89 e6             	mov    %r12,%rsi
1985   ee8f45:	ff 53 30             	call   *0x30(%rbx)
1988   ee8f48:	41 89 c4             	mov    %eax,%r12d
198b   ee8f4b:	48 83 c3 20          	add    $0x20,%rbx
198f   ee8f4f:	48 89 d8             	mov    %rbx,%rax
1992   ee8f52:	48 c1 e8 03          	shr    $0x3,%rax
1996   ee8f56:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
19a0   ee8f60:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
19a4   ee8f64:	74 08                	je     ee8f6e <fuse_update_get_attr+0x19ae>
19a6   ee8f66:	48 89 df             	mov    %rbx,%rdi
19a9   ee8f69:	e8 00 00 00 00       	call   ee8f6e <fuse_update_get_attr+0x19ae>	ee8f6a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19ae   ee8f6e:	48 8b 1b             	mov    (%rbx),%rbx
19b1   ee8f71:	48 ff 03             	incq   (%rbx)
19b4   ee8f74:	e8 00 00 00 00       	call   ee8f79 <fuse_update_get_attr+0x19b9>	ee8f75: R_X86_64_PLT32	sched_clock-0x4
19b9   ee8f79:	4c 29 f8             	sub    %r15,%rax
19bc   ee8f7c:	48 01 43 08          	add    %rax,0x8(%rbx)
19c0   ee8f80:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
19c5   ee8f85:	e9 75 fd ff ff       	jmp    ee8cff <fuse_update_get_attr+0x173f>
19ca   ee8f8a:	89 f9                	mov    %edi,%ecx
19cc   ee8f8c:	80 e1 07             	and    $0x7,%cl
19cf   ee8f8f:	80 c1 03             	add    $0x3,%cl
19d2   ee8f92:	38 c1                	cmp    %al,%cl
19d4   ee8f94:	0f 8c 88 e6 ff ff    	jl     ee7622 <fuse_update_get_attr+0x62>
19da   ee8f9a:	e8 00 00 00 00       	call   ee8f9f <fuse_update_get_attr+0x19df>	ee8f9b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
19df   ee8f9f:	e9 7e e6 ff ff       	jmp    ee7622 <fuse_update_get_attr+0x62>
19e4   ee8fa4:	89 f9                	mov    %edi,%ecx
19e6   ee8fa6:	80 e1 07             	and    $0x7,%cl
19e9   ee8fa9:	80 c1 03             	add    $0x3,%cl
19ec   ee8fac:	38 c1                	cmp    %al,%cl
19ee   ee8fae:	0f 8c da e7 ff ff    	jl     ee778e <fuse_update_get_attr+0x1ce>
19f4   ee8fb4:	e8 00 00 00 00       	call   ee8fb9 <fuse_update_get_attr+0x19f9>	ee8fb5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
19f9   ee8fb9:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1a03   ee8fc3:	e9 c6 e7 ff ff       	jmp    ee778e <fuse_update_get_attr+0x1ce>
1a08   ee8fc8:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1a10   ee8fd0:	80 e1 07             	and    $0x7,%cl
1a13   ee8fd3:	80 c1 03             	add    $0x3,%cl
1a16   ee8fd6:	38 c1                	cmp    %al,%cl
1a18   ee8fd8:	0f 8c d5 e7 ff ff    	jl     ee77b3 <fuse_update_get_attr+0x1f3>
1a1e   ee8fde:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1a26   ee8fe6:	e8 00 00 00 00       	call   ee8feb <fuse_update_get_attr+0x1a2b>	ee8fe7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1a2b   ee8feb:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1a35   ee8ff5:	e9 b9 e7 ff ff       	jmp    ee77b3 <fuse_update_get_attr+0x1f3>
1a3a   ee8ffa:	89 f9                	mov    %edi,%ecx
1a3c   ee8ffc:	80 e1 07             	and    $0x7,%cl
1a3f   ee8fff:	80 c1 03             	add    $0x3,%cl
1a42   ee9002:	38 c1                	cmp    %al,%cl
1a44   ee9004:	0f 8c 12 ea ff ff    	jl     ee7a1c <fuse_update_get_attr+0x45c>
1a4a   ee900a:	e8 00 00 00 00       	call   ee900f <fuse_update_get_attr+0x1a4f>	ee900b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1a4f   ee900f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1a59   ee9019:	e9 fe e9 ff ff       	jmp    ee7a1c <fuse_update_get_attr+0x45c>
1a5e   ee901e:	89 d9                	mov    %ebx,%ecx
1a60   ee9020:	80 e1 07             	and    $0x7,%cl
1a63   ee9023:	fe c1                	inc    %cl
1a65   ee9025:	38 c1                	cmp    %al,%cl
1a67   ee9027:	0f 8c c4 eb ff ff    	jl     ee7bf1 <fuse_update_get_attr+0x631>
1a6d   ee902d:	48 89 df             	mov    %rbx,%rdi
1a70   ee9030:	e8 00 00 00 00       	call   ee9035 <fuse_update_get_attr+0x1a75>	ee9031: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1a75   ee9035:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1a7f   ee903f:	e9 ad eb ff ff       	jmp    ee7bf1 <fuse_update_get_attr+0x631>
1a84   ee9044:	89 d9                	mov    %ebx,%ecx
1a86   ee9046:	80 e1 07             	and    $0x7,%cl
1a89   ee9049:	fe c1                	inc    %cl
1a8b   ee904b:	38 c1                	cmp    %al,%cl
1a8d   ee904d:	0f 8c b8 eb ff ff    	jl     ee7c0b <fuse_update_get_attr+0x64b>
1a93   ee9053:	48 89 df             	mov    %rbx,%rdi
1a96   ee9056:	e8 00 00 00 00       	call   ee905b <fuse_update_get_attr+0x1a9b>	ee9057: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
1a9b   ee905b:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1aa5   ee9065:	e9 a1 eb ff ff       	jmp    ee7c0b <fuse_update_get_attr+0x64b>
1aaa   ee906a:	e8 00 00 00 00       	call   ee906f <fuse_update_get_attr+0x1aaf>	ee906b: R_X86_64_PLT32	__stack_chk_fail-0x4
1aaf   ee906f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	ee9072: R_X86_64_32S	bpf_stats_enabled_key
1ab6   ee9076:	80 e1 07             	and    $0x7,%cl
1ab9   ee9079:	80 c1 03             	add    $0x3,%cl
1abc   ee907c:	38 c1                	cmp    %al,%cl
1abe   ee907e:	0f 8c f7 e9 ff ff    	jl     ee7a7b <fuse_update_get_attr+0x4bb>
1ac4   ee9084:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee9087: R_X86_64_32S	bpf_stats_enabled_key
1acb   ee908b:	e8 00 00 00 00       	call   ee9090 <fuse_update_get_attr+0x1ad0>	ee908c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ad0   ee9090:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1ada   ee909a:	e9 dc e9 ff ff       	jmp    ee7a7b <fuse_update_get_attr+0x4bb>
1adf   ee909f:	48 8d 8c 24 d8 01 00 00 	lea    0x1d8(%rsp),%rcx
1ae7   ee90a7:	80 e1 07             	and    $0x7,%cl
1aea   ee90aa:	80 c1 03             	add    $0x3,%cl
1aed   ee90ad:	38 c1                	cmp    %al,%cl
1aef   ee90af:	0f 8c c3 eb ff ff    	jl     ee7c78 <fuse_update_get_attr+0x6b8>
1af5   ee90b5:	48 8d bc 24 d8 01 00 00 	lea    0x1d8(%rsp),%rdi
1afd   ee90bd:	e8 00 00 00 00       	call   ee90c2 <fuse_update_get_attr+0x1b02>	ee90be: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b02   ee90c2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1b0c   ee90cc:	e9 a7 eb ff ff       	jmp    ee7c78 <fuse_update_get_attr+0x6b8>
1b11   ee90d1:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1b19   ee90d9:	80 e1 07             	and    $0x7,%cl
1b1c   ee90dc:	80 c1 03             	add    $0x3,%cl
1b1f   ee90df:	38 c1                	cmp    %al,%cl
1b21   ee90e1:	0f 8c b4 eb ff ff    	jl     ee7c9b <fuse_update_get_attr+0x6db>
1b27   ee90e7:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1b2f   ee90ef:	e8 00 00 00 00       	call   ee90f4 <fuse_update_get_attr+0x1b34>	ee90f0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b34   ee90f4:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1b3e   ee90fe:	e9 98 eb ff ff       	jmp    ee7c9b <fuse_update_get_attr+0x6db>
1b43   ee9103:	89 f9                	mov    %edi,%ecx
1b45   ee9105:	80 e1 07             	and    $0x7,%cl
1b48   ee9108:	80 c1 03             	add    $0x3,%cl
1b4b   ee910b:	38 c1                	cmp    %al,%cl
1b4d   ee910d:	0f 8c 30 f3 ff ff    	jl     ee8443 <fuse_update_get_attr+0xe83>
1b53   ee9113:	e8 00 00 00 00       	call   ee9118 <fuse_update_get_attr+0x1b58>	ee9114: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b58   ee9118:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1b62   ee9122:	e9 1c f3 ff ff       	jmp    ee8443 <fuse_update_get_attr+0xe83>
1b67   ee9127:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
1b6f   ee912f:	80 e1 07             	and    $0x7,%cl
1b72   ee9132:	80 c1 03             	add    $0x3,%cl
1b75   ee9135:	38 c1                	cmp    %al,%cl
1b77   ee9137:	0f 8c 43 f5 ff ff    	jl     ee8680 <fuse_update_get_attr+0x10c0>
1b7d   ee913d:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
1b85   ee9145:	e8 00 00 00 00       	call   ee914a <fuse_update_get_attr+0x1b8a>	ee9146: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1b8a   ee914a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1b94   ee9154:	e9 27 f5 ff ff       	jmp    ee8680 <fuse_update_get_attr+0x10c0>
1b99   ee9159:	89 f9                	mov    %edi,%ecx
1b9b   ee915b:	80 e1 07             	and    $0x7,%cl
1b9e   ee915e:	80 c1 03             	add    $0x3,%cl
1ba1   ee9161:	38 c1                	cmp    %al,%cl
1ba3   ee9163:	0f 8c 5c eb ff ff    	jl     ee7cc5 <fuse_update_get_attr+0x705>
1ba9   ee9169:	e8 00 00 00 00       	call   ee916e <fuse_update_get_attr+0x1bae>	ee916a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1bae   ee916e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1bb8   ee9178:	e9 48 eb ff ff       	jmp    ee7cc5 <fuse_update_get_attr+0x705>
1bbd   ee917d:	89 d9                	mov    %ebx,%ecx
1bbf   ee917f:	80 e1 07             	and    $0x7,%cl
1bc2   ee9182:	80 c1 03             	add    $0x3,%cl
1bc5   ee9185:	38 c1                	cmp    %al,%cl
1bc7   ee9187:	0f 8c 8a eb ff ff    	jl     ee7d17 <fuse_update_get_attr+0x757>
1bcd   ee918d:	48 89 df             	mov    %rbx,%rdi
1bd0   ee9190:	e8 00 00 00 00       	call   ee9195 <fuse_update_get_attr+0x1bd5>	ee9191: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1bd5   ee9195:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1bdf   ee919f:	e9 73 eb ff ff       	jmp    ee7d17 <fuse_update_get_attr+0x757>
1be4   ee91a4:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1bec   ee91ac:	80 e1 07             	and    $0x7,%cl
1bef   ee91af:	80 c1 03             	add    $0x3,%cl
1bf2   ee91b2:	38 c1                	cmp    %al,%cl
1bf4   ee91b4:	0f 8c d1 eb ff ff    	jl     ee7d8b <fuse_update_get_attr+0x7cb>
1bfa   ee91ba:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1c02   ee91c2:	e8 00 00 00 00       	call   ee91c7 <fuse_update_get_attr+0x1c07>	ee91c3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c07   ee91c7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1c11   ee91d1:	e9 b5 eb ff ff       	jmp    ee7d8b <fuse_update_get_attr+0x7cb>
1c16   ee91d6:	89 f9                	mov    %edi,%ecx
1c18   ee91d8:	80 e1 07             	and    $0x7,%cl
1c1b   ee91db:	80 c1 03             	add    $0x3,%cl
1c1e   ee91de:	38 c1                	cmp    %al,%cl
1c20   ee91e0:	0f 8c 0d f5 ff ff    	jl     ee86f3 <fuse_update_get_attr+0x1133>
1c26   ee91e6:	e8 00 00 00 00       	call   ee91eb <fuse_update_get_attr+0x1c2b>	ee91e7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1c2b   ee91eb:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1c35   ee91f5:	e9 f9 f4 ff ff       	jmp    ee86f3 <fuse_update_get_attr+0x1133>
1c3a   ee91fa:	48 8d 8c 24 d8 01 00 00 	lea    0x1d8(%rsp),%rcx
1c42   ee9202:	80 e1 07             	and    $0x7,%cl
1c45   ee9205:	80 c1 03             	add    $0x3,%cl
1c48   ee9208:	38 c1                	cmp    %al,%cl
1c4a   ee920a:	0f 8c 0f f5 ff ff    	jl     ee871f <fuse_update_get_attr+0x115f>
1c50   ee9210:	48 8d bc 24 d8 01 00 00 	lea    0x1d8(%rsp),%rdi
1c58   ee9218:	e8 00 00 00 00       	call   ee921d <fuse_update_get_attr+0x1c5d>	ee9219: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c5d   ee921d:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1c67   ee9227:	e9 f3 f4 ff ff       	jmp    ee871f <fuse_update_get_attr+0x115f>
1c6c   ee922c:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
1c74   ee9234:	80 e1 07             	and    $0x7,%cl
1c77   ee9237:	80 c1 03             	add    $0x3,%cl
1c7a   ee923a:	38 c1                	cmp    %al,%cl
1c7c   ee923c:	0f 8c f6 f4 ff ff    	jl     ee8738 <fuse_update_get_attr+0x1178>
1c82   ee9242:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
1c8a   ee924a:	e8 00 00 00 00       	call   ee924f <fuse_update_get_attr+0x1c8f>	ee924b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c8f   ee924f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1c99   ee9259:	e9 da f4 ff ff       	jmp    ee8738 <fuse_update_get_attr+0x1178>
1c9e   ee925e:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	ee9261: R_X86_64_32S	bpf_stats_enabled_key
1ca5   ee9265:	80 e1 07             	and    $0x7,%cl
1ca8   ee9268:	80 c1 03             	add    $0x3,%cl
1cab   ee926b:	38 c1                	cmp    %al,%cl
1cad   ee926d:	0f 8c 4f fa ff ff    	jl     ee8cc2 <fuse_update_get_attr+0x1702>
1cb3   ee9273:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee9276: R_X86_64_32S	bpf_stats_enabled_key
1cba   ee927a:	e8 00 00 00 00       	call   ee927f <fuse_update_get_attr+0x1cbf>	ee927b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1cbf   ee927f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1cc9   ee9289:	e9 34 fa ff ff       	jmp    ee8cc2 <fuse_update_get_attr+0x1702>
1cce   ee928e:	89 f9                	mov    %edi,%ecx
1cd0   ee9290:	80 e1 07             	and    $0x7,%cl
1cd3   ee9293:	80 c1 03             	add    $0x3,%cl
1cd6   ee9296:	38 c1                	cmp    %al,%cl
1cd8   ee9298:	0f 8c 16 eb ff ff    	jl     ee7db4 <fuse_update_get_attr+0x7f4>
1cde   ee929e:	e8 00 00 00 00       	call   ee92a3 <fuse_update_get_attr+0x1ce3>	ee929f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ce3   ee92a3:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1ced   ee92ad:	e9 02 eb ff ff       	jmp    ee7db4 <fuse_update_get_attr+0x7f4>
1cf2   ee92b2:	89 d9                	mov    %ebx,%ecx
1cf4   ee92b4:	80 e1 07             	and    $0x7,%cl
1cf7   ee92b7:	80 c1 03             	add    $0x3,%cl
1cfa   ee92ba:	38 c1                	cmp    %al,%cl
1cfc   ee92bc:	0f 8c 40 eb ff ff    	jl     ee7e02 <fuse_update_get_attr+0x842>
1d02   ee92c2:	48 89 df             	mov    %rbx,%rdi
1d05   ee92c5:	e8 00 00 00 00       	call   ee92ca <fuse_update_get_attr+0x1d0a>	ee92c6: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1d0a   ee92ca:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1d14   ee92d4:	e9 29 eb ff ff       	jmp    ee7e02 <fuse_update_get_attr+0x842>
1d19   ee92d9:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1d21   ee92e1:	80 e1 07             	and    $0x7,%cl
1d24   ee92e4:	80 c1 03             	add    $0x3,%cl
1d27   ee92e7:	38 c1                	cmp    %al,%cl
1d29   ee92e9:	0f 8c 87 eb ff ff    	jl     ee7e76 <fuse_update_get_attr+0x8b6>
1d2f   ee92ef:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1d37   ee92f7:	e8 00 00 00 00       	call   ee92fc <fuse_update_get_attr+0x1d3c>	ee92f8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d3c   ee92fc:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1d46   ee9306:	e9 6b eb ff ff       	jmp    ee7e76 <fuse_update_get_attr+0x8b6>
1d4b   ee930b:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1d53   ee9313:	80 e1 07             	and    $0x7,%cl
1d56   ee9316:	80 c1 03             	add    $0x3,%cl
1d59   ee9319:	38 c1                	cmp    %al,%cl
1d5b   ee931b:	0f 8c 36 f4 ff ff    	jl     ee8757 <fuse_update_get_attr+0x1197>
1d61   ee9321:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1d69   ee9329:	e8 00 00 00 00       	call   ee932e <fuse_update_get_attr+0x1d6e>	ee932a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d6e   ee932e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1d78   ee9338:	e9 1a f4 ff ff       	jmp    ee8757 <fuse_update_get_attr+0x1197>
1d7d   ee933d:	89 f9                	mov    %edi,%ecx
1d7f   ee933f:	80 e1 07             	and    $0x7,%cl
1d82   ee9342:	80 c1 03             	add    $0x3,%cl
1d85   ee9345:	38 c1                	cmp    %al,%cl
1d87   ee9347:	0f 8c 44 f4 ff ff    	jl     ee8791 <fuse_update_get_attr+0x11d1>
1d8d   ee934d:	e8 00 00 00 00       	call   ee9352 <fuse_update_get_attr+0x1d92>	ee934e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d92   ee9352:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1d9c   ee935c:	e9 30 f4 ff ff       	jmp    ee8791 <fuse_update_get_attr+0x11d1>
1da1   ee9361:	89 d9                	mov    %ebx,%ecx
1da3   ee9363:	80 e1 07             	and    $0x7,%cl
1da6   ee9366:	80 c1 03             	add    $0x3,%cl
1da9   ee9369:	38 c1                	cmp    %al,%cl
1dab   ee936b:	0f 8c 72 f4 ff ff    	jl     ee87e3 <fuse_update_get_attr+0x1223>
1db1   ee9371:	48 89 df             	mov    %rbx,%rdi
1db4   ee9374:	e8 00 00 00 00       	call   ee9379 <fuse_update_get_attr+0x1db9>	ee9375: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1db9   ee9379:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1dc3   ee9383:	e9 5b f4 ff ff       	jmp    ee87e3 <fuse_update_get_attr+0x1223>
1dc8   ee9388:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
1dd0   ee9390:	80 e1 07             	and    $0x7,%cl
1dd3   ee9393:	80 c1 03             	add    $0x3,%cl
1dd6   ee9396:	38 c1                	cmp    %al,%cl
1dd8   ee9398:	0f 8c a7 f4 ff ff    	jl     ee8845 <fuse_update_get_attr+0x1285>
1dde   ee939e:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
1de6   ee93a6:	e8 00 00 00 00       	call   ee93ab <fuse_update_get_attr+0x1deb>	ee93a7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1deb   ee93ab:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1df5   ee93b5:	e9 8b f4 ff ff       	jmp    ee8845 <fuse_update_get_attr+0x1285>
1dfa   ee93ba:	89 f9                	mov    %edi,%ecx
1dfc   ee93bc:	80 e1 07             	and    $0x7,%cl
1dff   ee93bf:	80 c1 03             	add    $0x3,%cl
1e02   ee93c2:	38 c1                	cmp    %al,%cl
1e04   ee93c4:	0f 8c d5 ea ff ff    	jl     ee7e9f <fuse_update_get_attr+0x8df>
1e0a   ee93ca:	e8 00 00 00 00       	call   ee93cf <fuse_update_get_attr+0x1e0f>	ee93cb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1e0f   ee93cf:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1e19   ee93d9:	e9 c1 ea ff ff       	jmp    ee7e9f <fuse_update_get_attr+0x8df>
1e1e   ee93de:	89 d9                	mov    %ebx,%ecx
1e20   ee93e0:	80 e1 07             	and    $0x7,%cl
1e23   ee93e3:	80 c1 03             	add    $0x3,%cl
1e26   ee93e6:	38 c1                	cmp    %al,%cl
1e28   ee93e8:	0f 8c ff ea ff ff    	jl     ee7eed <fuse_update_get_attr+0x92d>
1e2e   ee93ee:	48 89 df             	mov    %rbx,%rdi
1e31   ee93f1:	e8 00 00 00 00       	call   ee93f6 <fuse_update_get_attr+0x1e36>	ee93f2: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1e36   ee93f6:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1e40   ee9400:	e9 e8 ea ff ff       	jmp    ee7eed <fuse_update_get_attr+0x92d>
1e45   ee9405:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1e4d   ee940d:	80 e1 07             	and    $0x7,%cl
1e50   ee9410:	80 c1 03             	add    $0x3,%cl
1e53   ee9413:	38 c1                	cmp    %al,%cl
1e55   ee9415:	0f 8c 46 eb ff ff    	jl     ee7f61 <fuse_update_get_attr+0x9a1>
1e5b   ee941b:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1e63   ee9423:	e8 00 00 00 00       	call   ee9428 <fuse_update_get_attr+0x1e68>	ee9424: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1e68   ee9428:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1e72   ee9432:	e9 2a eb ff ff       	jmp    ee7f61 <fuse_update_get_attr+0x9a1>
1e77   ee9437:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
1e7f   ee943f:	80 e1 07             	and    $0x7,%cl
1e82   ee9442:	80 c1 03             	add    $0x3,%cl
1e85   ee9445:	38 c1                	cmp    %al,%cl
1e87   ee9447:	0f 8c 17 f4 ff ff    	jl     ee8864 <fuse_update_get_attr+0x12a4>
1e8d   ee944d:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
1e95   ee9455:	e8 00 00 00 00       	call   ee945a <fuse_update_get_attr+0x1e9a>	ee9456: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1e9a   ee945a:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1ea4   ee9464:	e9 fb f3 ff ff       	jmp    ee8864 <fuse_update_get_attr+0x12a4>
1ea9   ee9469:	89 f9                	mov    %edi,%ecx
1eab   ee946b:	80 e1 07             	and    $0x7,%cl
1eae   ee946e:	80 c1 03             	add    $0x3,%cl
1eb1   ee9471:	38 c1                	cmp    %al,%cl
1eb3   ee9473:	0f 8c 25 f4 ff ff    	jl     ee889e <fuse_update_get_attr+0x12de>
1eb9   ee9479:	e8 00 00 00 00       	call   ee947e <fuse_update_get_attr+0x1ebe>	ee947a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ebe   ee947e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1ec8   ee9488:	e9 11 f4 ff ff       	jmp    ee889e <fuse_update_get_attr+0x12de>
1ecd   ee948d:	89 d9                	mov    %ebx,%ecx
1ecf   ee948f:	80 e1 07             	and    $0x7,%cl
1ed2   ee9492:	80 c1 03             	add    $0x3,%cl
1ed5   ee9495:	38 c1                	cmp    %al,%cl
1ed7   ee9497:	0f 8c 53 f4 ff ff    	jl     ee88f0 <fuse_update_get_attr+0x1330>
1edd   ee949d:	48 89 df             	mov    %rbx,%rdi
1ee0   ee94a0:	e8 00 00 00 00       	call   ee94a5 <fuse_update_get_attr+0x1ee5>	ee94a1: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1ee5   ee94a5:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1eef   ee94af:	e9 3c f4 ff ff       	jmp    ee88f0 <fuse_update_get_attr+0x1330>
1ef4   ee94b4:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
1efc   ee94bc:	80 e1 07             	and    $0x7,%cl
1eff   ee94bf:	80 c1 03             	add    $0x3,%cl
1f02   ee94c2:	38 c1                	cmp    %al,%cl
1f04   ee94c4:	0f 8c 88 f4 ff ff    	jl     ee8952 <fuse_update_get_attr+0x1392>
1f0a   ee94ca:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
1f12   ee94d2:	e8 00 00 00 00       	call   ee94d7 <fuse_update_get_attr+0x1f17>	ee94d3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f17   ee94d7:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1f21   ee94e1:	e9 6c f4 ff ff       	jmp    ee8952 <fuse_update_get_attr+0x1392>
1f26   ee94e6:	89 f9                	mov    %edi,%ecx
1f28   ee94e8:	80 e1 07             	and    $0x7,%cl
1f2b   ee94eb:	80 c1 03             	add    $0x3,%cl
1f2e   ee94ee:	38 c1                	cmp    %al,%cl
1f30   ee94f0:	0f 8c 4d f8 ff ff    	jl     ee8d43 <fuse_update_get_attr+0x1783>
1f36   ee94f6:	e8 00 00 00 00       	call   ee94fb <fuse_update_get_attr+0x1f3b>	ee94f7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f3b   ee94fb:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1f45   ee9505:	e9 39 f8 ff ff       	jmp    ee8d43 <fuse_update_get_attr+0x1783>
1f4a   ee950a:	89 f9                	mov    %edi,%ecx
1f4c   ee950c:	80 e1 07             	and    $0x7,%cl
1f4f   ee950f:	80 c1 03             	add    $0x3,%cl
1f52   ee9512:	38 c1                	cmp    %al,%cl
1f54   ee9514:	0f 8c 4b f8 ff ff    	jl     ee8d65 <fuse_update_get_attr+0x17a5>
1f5a   ee951a:	e8 00 00 00 00       	call   ee951f <fuse_update_get_attr+0x1f5f>	ee951b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1f5f   ee951f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1f69   ee9529:	e9 37 f8 ff ff       	jmp    ee8d65 <fuse_update_get_attr+0x17a5>
1f6e   ee952e:	89 f9                	mov    %edi,%ecx
1f70   ee9530:	80 e1 07             	and    $0x7,%cl
1f73   ee9533:	80 c1 03             	add    $0x3,%cl
1f76   ee9536:	38 c1                	cmp    %al,%cl
1f78   ee9538:	0f 8c 49 f8 ff ff    	jl     ee8d87 <fuse_update_get_attr+0x17c7>
1f7e   ee953e:	e8 00 00 00 00       	call   ee9543 <fuse_update_get_attr+0x1f83>	ee953f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f83   ee9543:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1f8d   ee954d:	e9 35 f8 ff ff       	jmp    ee8d87 <fuse_update_get_attr+0x17c7>
1f92   ee9552:	89 f9                	mov    %edi,%ecx
1f94   ee9554:	80 e1 07             	and    $0x7,%cl
1f97   ee9557:	80 c1 03             	add    $0x3,%cl
1f9a   ee955a:	38 c1                	cmp    %al,%cl
1f9c   ee955c:	0f 8c 47 f8 ff ff    	jl     ee8da9 <fuse_update_get_attr+0x17e9>
1fa2   ee9562:	e8 00 00 00 00       	call   ee9567 <fuse_update_get_attr+0x1fa7>	ee9563: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1fa7   ee9567:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
1fb1   ee9571:	e9 33 f8 ff ff       	jmp    ee8da9 <fuse_update_get_attr+0x17e9>
1fb6   ee9576:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
1fbe   ee957e:	80 e1 07             	and    $0x7,%cl
1fc1   ee9581:	80 c1 03             	add    $0x3,%cl
1fc4   ee9584:	38 c1                	cmp    %al,%cl
1fc6   ee9586:	0f 8c 35 f8 ff ff    	jl     ee8dc1 <fuse_update_get_attr+0x1801>
1fcc   ee958c:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
1fd4   ee9594:	e8 00 00 00 00       	call   ee9599 <fuse_update_get_attr+0x1fd9>	ee9595: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
1fd9   ee9599:	e9 23 f8 ff ff       	jmp    ee8dc1 <fuse_update_get_attr+0x1801>
1fde   ee959e:	89 f9                	mov    %edi,%ecx
1fe0   ee95a0:	80 e1 07             	and    $0x7,%cl
1fe3   ee95a3:	80 c1 03             	add    $0x3,%cl
1fe6   ee95a6:	38 c1                	cmp    %al,%cl
1fe8   ee95a8:	0f 8c f1 e9 ff ff    	jl     ee7f9f <fuse_update_get_attr+0x9df>
1fee   ee95ae:	e8 00 00 00 00       	call   ee95b3 <fuse_update_get_attr+0x1ff3>	ee95af: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ff3   ee95b3:	e9 e7 e9 ff ff       	jmp    ee7f9f <fuse_update_get_attr+0x9df>
1ff8   ee95b8:	89 d9                	mov    %ebx,%ecx
1ffa   ee95ba:	80 e1 07             	and    $0x7,%cl
1ffd   ee95bd:	80 c1 03             	add    $0x3,%cl
2000   ee95c0:	38 c1                	cmp    %al,%cl
2002   ee95c2:	0f 8c 3a ea ff ff    	jl     ee8002 <fuse_update_get_attr+0xa42>
2008   ee95c8:	48 89 df             	mov    %rbx,%rdi
200b   ee95cb:	e8 00 00 00 00       	call   ee95d0 <fuse_update_get_attr+0x2010>	ee95cc: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2010   ee95d0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
201a   ee95da:	e9 23 ea ff ff       	jmp    ee8002 <fuse_update_get_attr+0xa42>
201f   ee95df:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
2027   ee95e7:	80 e1 07             	and    $0x7,%cl
202a   ee95ea:	80 c1 03             	add    $0x3,%cl
202d   ee95ed:	38 c1                	cmp    %al,%cl
202f   ee95ef:	0f 8c 81 ea ff ff    	jl     ee8076 <fuse_update_get_attr+0xab6>
2035   ee95f5:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
203d   ee95fd:	e8 00 00 00 00       	call   ee9602 <fuse_update_get_attr+0x2042>	ee95fe: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2042   ee9602:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
204c   ee960c:	e9 65 ea ff ff       	jmp    ee8076 <fuse_update_get_attr+0xab6>
2051   ee9611:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
2059   ee9619:	80 e1 07             	and    $0x7,%cl
205c   ee961c:	80 c1 03             	add    $0x3,%cl
205f   ee961f:	38 c1                	cmp    %al,%cl
2061   ee9621:	0f 8c 4a f3 ff ff    	jl     ee8971 <fuse_update_get_attr+0x13b1>
2067   ee9627:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
206f   ee962f:	e8 00 00 00 00       	call   ee9634 <fuse_update_get_attr+0x2074>	ee9630: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2074   ee9634:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
207e   ee963e:	e9 2e f3 ff ff       	jmp    ee8971 <fuse_update_get_attr+0x13b1>
2083   ee9643:	89 f9                	mov    %edi,%ecx
2085   ee9645:	80 e1 07             	and    $0x7,%cl
2088   ee9648:	80 c1 03             	add    $0x3,%cl
208b   ee964b:	38 c1                	cmp    %al,%cl
208d   ee964d:	0f 8c 58 f3 ff ff    	jl     ee89ab <fuse_update_get_attr+0x13eb>
2093   ee9653:	e8 00 00 00 00       	call   ee9658 <fuse_update_get_attr+0x2098>	ee9654: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2098   ee9658:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
20a2   ee9662:	e9 44 f3 ff ff       	jmp    ee89ab <fuse_update_get_attr+0x13eb>
20a7   ee9667:	89 d9                	mov    %ebx,%ecx
20a9   ee9669:	80 e1 07             	and    $0x7,%cl
20ac   ee966c:	80 c1 03             	add    $0x3,%cl
20af   ee966f:	38 c1                	cmp    %al,%cl
20b1   ee9671:	0f 8c 86 f3 ff ff    	jl     ee89fd <fuse_update_get_attr+0x143d>
20b7   ee9677:	48 89 df             	mov    %rbx,%rdi
20ba   ee967a:	e8 00 00 00 00       	call   ee967f <fuse_update_get_attr+0x20bf>	ee967b: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
20bf   ee967f:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
20c9   ee9689:	e9 6f f3 ff ff       	jmp    ee89fd <fuse_update_get_attr+0x143d>
20ce   ee968e:	48 8d 8c 24 e4 01 00 00 	lea    0x1e4(%rsp),%rcx
20d6   ee9696:	80 e1 07             	and    $0x7,%cl
20d9   ee9699:	80 c1 03             	add    $0x3,%cl
20dc   ee969c:	38 c1                	cmp    %al,%cl
20de   ee969e:	0f 8c bb f3 ff ff    	jl     ee8a5f <fuse_update_get_attr+0x149f>
20e4   ee96a4:	48 8d bc 24 e4 01 00 00 	lea    0x1e4(%rsp),%rdi
20ec   ee96ac:	e8 00 00 00 00       	call   ee96b1 <fuse_update_get_attr+0x20f1>	ee96ad: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20f1   ee96b1:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
20fb   ee96bb:	e9 9f f3 ff ff       	jmp    ee8a5f <fuse_update_get_attr+0x149f>
2100   ee96c0:	89 f9                	mov    %edi,%ecx
2102   ee96c2:	80 e1 07             	and    $0x7,%cl
2105   ee96c5:	80 c1 03             	add    $0x3,%cl
2108   ee96c8:	38 c1                	cmp    %al,%cl
210a   ee96ca:	0f 8c e4 e9 ff ff    	jl     ee80b4 <fuse_update_get_attr+0xaf4>
2110   ee96d0:	e8 00 00 00 00       	call   ee96d5 <fuse_update_get_attr+0x2115>	ee96d1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2115   ee96d5:	e9 da e9 ff ff       	jmp    ee80b4 <fuse_update_get_attr+0xaf4>
211a   ee96da:	89 d9                	mov    %ebx,%ecx
211c   ee96dc:	80 e1 07             	and    $0x7,%cl
211f   ee96df:	80 c1 03             	add    $0x3,%cl
2122   ee96e2:	38 c1                	cmp    %al,%cl
2124   ee96e4:	0f 8c 2d ea ff ff    	jl     ee8117 <fuse_update_get_attr+0xb57>
212a   ee96ea:	48 89 df             	mov    %rbx,%rdi
212d   ee96ed:	e8 00 00 00 00       	call   ee96f2 <fuse_update_get_attr+0x2132>	ee96ee: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
2132   ee96f2:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
213c   ee96fc:	e9 16 ea ff ff       	jmp    ee8117 <fuse_update_get_attr+0xb57>
2141   ee9701:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
2149   ee9709:	80 e1 07             	and    $0x7,%cl
214c   ee970c:	80 c1 03             	add    $0x3,%cl
214f   ee970f:	38 c1                	cmp    %al,%cl
2151   ee9711:	0f 8c 74 ea ff ff    	jl     ee818b <fuse_update_get_attr+0xbcb>
2157   ee9717:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
215f   ee971f:	e8 00 00 00 00       	call   ee9724 <fuse_update_get_attr+0x2164>	ee9720: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2164   ee9724:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
216e   ee972e:	e9 58 ea ff ff       	jmp    ee818b <fuse_update_get_attr+0xbcb>
2173   ee9733:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee9736: R_X86_64_32S	.data+0x8c23e0
217a   ee973a:	48 89 de             	mov    %rbx,%rsi
217d   ee973d:	e8 00 00 00 00       	call   ee9742 <fuse_update_get_attr+0x2182>	ee973e: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
2182   ee9742:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
218c   ee974c:	e9 21 f0 ff ff       	jmp    ee8772 <fuse_update_get_attr+0x11b2>
2191   ee9751:	89 f9                	mov    %edi,%ecx
2193   ee9753:	80 e1 07             	and    $0x7,%cl
2196   ee9756:	80 c1 03             	add    $0x3,%cl
2199   ee9759:	38 c1                	cmp    %al,%cl
219b   ee975b:	0f 8c 68 ea ff ff    	jl     ee81c9 <fuse_update_get_attr+0xc09>
21a1   ee9761:	e8 00 00 00 00       	call   ee9766 <fuse_update_get_attr+0x21a6>	ee9762: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
21a6   ee9766:	e9 5e ea ff ff       	jmp    ee81c9 <fuse_update_get_attr+0xc09>
21ab   ee976b:	48 8d 8c 24 68 02 00 00 	lea    0x268(%rsp),%rcx
21b3   ee9773:	80 e1 07             	and    $0x7,%cl
21b6   ee9776:	80 c1 03             	add    $0x3,%cl
21b9   ee9779:	38 c1                	cmp    %al,%cl
21bb   ee977b:	0f 8c 9d ea ff ff    	jl     ee821e <fuse_update_get_attr+0xc5e>
21c1   ee9781:	48 8d bc 24 68 02 00 00 	lea    0x268(%rsp),%rdi
21c9   ee9789:	e8 00 00 00 00       	call   ee978e <fuse_update_get_attr+0x21ce>	ee978a: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
21ce   ee978e:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
21d8   ee9798:	e9 81 ea ff ff       	jmp    ee821e <fuse_update_get_attr+0xc5e>
21dd   ee979d:	48 8d 8c 24 e0 01 00 00 	lea    0x1e0(%rsp),%rcx
21e5   ee97a5:	80 e1 07             	and    $0x7,%cl
21e8   ee97a8:	80 c1 03             	add    $0x3,%cl
21eb   ee97ab:	38 c1                	cmp    %al,%cl
21ed   ee97ad:	0f 8c d4 ea ff ff    	jl     ee8287 <fuse_update_get_attr+0xcc7>
21f3   ee97b3:	48 8d bc 24 e0 01 00 00 	lea    0x1e0(%rsp),%rdi
21fb   ee97bb:	e8 00 00 00 00       	call   ee97c0 <fuse_update_get_attr+0x2200>	ee97bc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2200   ee97c0:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
220a   ee97ca:	e9 b8 ea ff ff       	jmp    ee8287 <fuse_update_get_attr+0xcc7>
220f   ee97cf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee97d2: R_X86_64_32S	.data+0x8c23e0
2216   ee97d6:	48 89 de             	mov    %rbx,%rsi
2219   ee97d9:	e8 00 00 00 00       	call   ee97de <fuse_update_get_attr+0x221e>	ee97da: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
221e   ee97de:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
2228   ee97e8:	e9 92 f0 ff ff       	jmp    ee887f <fuse_update_get_attr+0x12bf>
222d   ee97ed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ee97f0: R_X86_64_32S	.data+0x8c23e0
2234   ee97f4:	48 89 de             	mov    %rbx,%rsi
2237   ee97f7:	e8 00 00 00 00       	call   ee97fc <fuse_update_get_attr+0x223c>	ee97f8: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
223c   ee97fc:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
2246   ee9806:	e9 81 f1 ff ff       	jmp    ee898c <fuse_update_get_attr+0x13cc>
224b   ee980b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
