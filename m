Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128101B3F17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726197278; cv=none; b=pN6mP55Ak85nMQd1g9pTMTJ4ok+55SxTA3lKE1ykzKAlSDFXxOPChHScvIjVRtOXK1uJ0lz7jStIdXQlIdLX0c+sCQNIo/5Ahtq/sEVzZkYIhNBAYltPzreIKQiz4/C+dSV7PeIltVEPWrgHV9nePsRPAWt2LBN93AZawKL0SzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726197278; c=relaxed/simple;
	bh=GiYWdA12/CBk9QWjijPpyHau0FzYjMTiMWEMu+aGCYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVx3k4e7S0iEAztug9wLAyAbAqevgcAtSMsjgVCoWXIzpsikL0Nb4uP6jE/R38GsniCemvaf3wyTOM57L2fMGCX6uvh5qaNZMiHmCFx0H/fdxhw8iXFqrM90IuH2eLWl5GRbDdy/ZoAFchZGrEcVEUbmnrHUoHhKe3abkLhb1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CY+rg7yY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CY+rg7yY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726197277; x=1757733277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GiYWdA12/CBk9QWjijPpyHau0FzYjMTiMWEMu+aGCYI=;
  b=CY+rg7yYJ6v5XsBm4pWJwnL4v8UEopQKh3OnQfK5BgQe1HkKkeJcPZlr
   3Ie7UjtKGrFwJNA5ibTuJiryyzfAcAAss5KR6iATzO7oGkaD6zMvOyTxM
   qZVKubdFLTDITJ3OUWybYSRCz42MdhVxhQsTvLtdZqZza4a1exRvftlYz
   km88Rn5EetV0oeR+Iod/82ptQDK8ZXAk2kNWt+yomNFT+7Qja/VtJ9GnM
   qeAdat4AOfWFRQV6o+m/FKqTkiDNvcfTcQAFLjnDVKYFvZ/0ocPbGIUY6
   /O1xTNdywcZsh+z8hJQnONOgoQCfIIcoQJQ3acKL0oCJstVXMr8422Q19
   A==;
X-CSE-ConnectionGUID: Q9bbq//BQuyQvP1BusEJEA==
X-CSE-MsgGUID: REU1Jn8nQNytnftJCfhpPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24908595"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="24908595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 20:14:34 -0700
X-CSE-ConnectionGUID: LXBIUV2KSKqf7h7UhIQgEg==
X-CSE-MsgGUID: hJ0VYLaER5OQ5fmiPDrmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="68419448"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 20:14:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sowlR-0005x2-22;
	Fri, 13 Sep 2024 03:14:29 +0000
Date: Fri, 13 Sep 2024 11:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jaegeuk-f2fs-stable:linux-5.10.y 287/780] fs/iomap/buffered-io.o:
 warning: objtool: iomap_read_inline_data()+0x376: unreachable instruction
Message-ID: <202409131141.k4h6hMW9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git linux-5.10.y
head:   e36040b2caec4c8a0a9434ab743b1f66248e5d27
commit: 4c646eceff35f0bfee4c67285c6963ac2db6849e [287/780] iomap: support reading inline data from non-zero pos
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240913/202409131141.k4h6hMW9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131141.k4h6hMW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131141.k4h6hMW9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.o: warning: objtool: iomap_read_inline_data()+0x376: unreachable instruction


objdump-func vmlinux.o iomap_read_inline_data:
0000 00000000005e38e7 <iomap_read_inline_data>:
0000   5e38e7:	e8 00 00 00 00       	call   5e38ec <iomap_read_inline_data+0x5>	5e38e8: R_X86_64_PLT32	__fentry__-0x4
0005   5e38ec:	55                   	push   %rbp
0006   5e38ed:	48 89 e5             	mov    %rsp,%rbp
0009   5e38f0:	41 57                	push   %r15
000b   5e38f2:	41 56                	push   %r14
000d   5e38f4:	41 55                	push   %r13
000f   5e38f6:	41 54                	push   %r12
0011   5e38f8:	53                   	push   %rbx
0012   5e38f9:	48 8d 64 24 e0       	lea    -0x20(%rsp),%rsp
0017   5e38fe:	49 89 d4             	mov    %rdx,%r12
001a   5e3901:	49 89 f5             	mov    %rsi,%r13
001d   5e3904:	49 89 fe             	mov    %rdi,%r14
0020   5e3907:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
002a   5e3911:	e8 00 00 00 00       	call   5e3916 <iomap_read_inline_data+0x2f>	5e3912: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002f   5e3916:	49 83 c6 48          	add    $0x48,%r14
0033   5e391a:	4c 89 f0             	mov    %r14,%rax
0036   5e391d:	48 c1 e8 03          	shr    $0x3,%rax
003a   5e3921:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
003e   5e3925:	74 08                	je     5e392f <iomap_read_inline_data+0x48>
0040   5e3927:	4c 89 f7             	mov    %r14,%rdi
0043   5e392a:	e8 00 00 00 00       	call   5e392f <iomap_read_inline_data+0x48>	5e392b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0048   5e392f:	49 8d 5c 24 08       	lea    0x8(%r12),%rbx
004d   5e3934:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0057   5e393e:	4d 8b 36             	mov    (%r14),%r14
005a   5e3941:	49 89 df             	mov    %rbx,%r15
005d   5e3944:	49 c1 ef 03          	shr    $0x3,%r15
0061   5e3948:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
0066   5e394d:	74 08                	je     5e3957 <iomap_read_inline_data+0x70>
0068   5e394f:	48 89 df             	mov    %rbx,%rdi
006b   5e3952:	e8 00 00 00 00       	call   5e3957 <iomap_read_inline_data+0x70>	5e3953: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0070   5e3957:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
0074   5e395b:	49 83 c5 08          	add    $0x8,%r13
0078   5e395f:	4c 2b 33             	sub    (%rbx),%r14
007b   5e3962:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0085   5e396c:	4c 89 e8             	mov    %r13,%rax
0088   5e396f:	48 c1 e8 03          	shr    $0x3,%rax
008c   5e3973:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0090   5e3977:	74 08                	je     5e3981 <iomap_read_inline_data+0x9a>
0092   5e3979:	4c 89 ef             	mov    %r13,%rdi
0095   5e397c:	e8 00 00 00 00       	call   5e3981 <iomap_read_inline_data+0x9a>	5e397d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
009a   5e3981:	4d 8b 6d 00          	mov    0x0(%r13),%r13
009e   5e3985:	41 f6 c5 01          	test   $0x1,%r13b
00a2   5e3989:	0f 85 ba 02 00 00    	jne    5e3c49 <iomap_read_inline_data+0x362>
00a8   5e398f:	e8 00 00 00 00       	call   5e3994 <iomap_read_inline_data+0xad>	5e3990: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ad   5e3994:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
00b1   5e3998:	4c 89 ef             	mov    %r13,%rdi
00b4   5e399b:	be 08 00 00 00       	mov    $0x8,%esi
00b9   5e39a0:	e8 00 00 00 00       	call   5e39a5 <iomap_read_inline_data+0xbe>	5e39a1: R_X86_64_PLT32	__kasan_check_read-0x4
00be   5e39a5:	4c 89 e8             	mov    %r13,%rax
00c1   5e39a8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
00cb   5e39b2:	48 c1 e8 03          	shr    $0x3,%rax
00cf   5e39b6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
00d3   5e39ba:	74 08                	je     5e39c4 <iomap_read_inline_data+0xdd>
00d5   5e39bc:	4c 89 ef             	mov    %r13,%rdi
00d8   5e39bf:	e8 00 00 00 00       	call   5e39c4 <iomap_read_inline_data+0xdd>	5e39c0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00dd   5e39c4:	49 f7 45 00 04 00 00 00 	testq  $0x4,0x0(%r13)
00e5   5e39cc:	0f 85 7b 01 00 00    	jne    5e3b4d <iomap_read_inline_data+0x266>
00eb   5e39d2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00f5   5e39dc:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
00fa   5e39e1:	74 08                	je     5e39eb <iomap_read_inline_data+0x104>
00fc   5e39e3:	48 89 df             	mov    %rbx,%rdi
00ff   5e39e6:	e8 00 00 00 00       	call   5e39eb <iomap_read_inline_data+0x104>	5e39e7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0104   5e39eb:	0f b7 03             	movzwl (%rbx),%eax
0107   5e39ee:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
010b   5e39f2:	a9 ff 0f 00 00       	test   $0xfff,%eax
0110   5e39f7:	0f 85 59 02 00 00    	jne    5e3c56 <iomap_read_inline_data+0x36f>
0116   5e39fd:	4d 8d 7c 24 30       	lea    0x30(%r12),%r15
011b   5e3a02:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0125   5e3a0c:	4c 89 f8             	mov    %r15,%rax
0128   5e3a0f:	48 c1 e8 03          	shr    $0x3,%rax
012c   5e3a13:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0130   5e3a17:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
0134   5e3a1b:	74 08                	je     5e3a25 <iomap_read_inline_data+0x13e>
0136   5e3a1d:	4c 89 ff             	mov    %r15,%rdi
0139   5e3a20:	e8 00 00 00 00       	call   5e3a25 <iomap_read_inline_data+0x13e>	5e3a21: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
013e   5e3a25:	49 8b 07             	mov    (%r15),%rax
0141   5e3a28:	b9 00 10 00 00       	mov    $0x1000,%ecx
0146   5e3a2d:	25 ff 0f 00 00       	and    $0xfff,%eax
014b   5e3a32:	48 29 c1             	sub    %rax,%rcx
014e   5e3a35:	49 39 ce             	cmp    %rcx,%r14
0151   5e3a38:	0f 87 26 02 00 00    	ja     5e3c64 <iomap_read_inline_data+0x37d>
0157   5e3a3e:	49 83 c4 10          	add    $0x10,%r12
015b   5e3a42:	4c 89 e0             	mov    %r12,%rax
015e   5e3a45:	48 c1 e8 03          	shr    $0x3,%rax
0162   5e3a49:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0166   5e3a4d:	74 08                	je     5e3a57 <iomap_read_inline_data+0x170>
0168   5e3a4f:	4c 89 e7             	mov    %r12,%rdi
016b   5e3a52:	e8 00 00 00 00       	call   5e3a57 <iomap_read_inline_data+0x170>	5e3a53: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0170   5e3a57:	4d 3b 34 24          	cmp    (%r12),%r14
0174   5e3a5b:	0f 87 11 02 00 00    	ja     5e3c72 <iomap_read_inline_data+0x38b>
017a   5e3a61:	48 8d 03             	lea    (%rbx),%rax
017d   5e3a64:	4c 89 eb             	mov    %r13,%rbx
0180   5e3a67:	48 c1 eb 03          	shr    $0x3,%rbx
0184   5e3a6b:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
0188   5e3a6f:	74 08                	je     5e3a79 <iomap_read_inline_data+0x192>
018a   5e3a71:	4c 89 ef             	mov    %r13,%rdi
018d   5e3a74:	e8 00 00 00 00       	call   5e3a79 <iomap_read_inline_data+0x192>	5e3a75: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0192   5e3a79:	41 f6 45 01 60       	testb  $0x60,0x1(%r13)
0197   5e3a7e:	0f 85 fc 01 00 00    	jne    5e3c80 <iomap_read_inline_data+0x399>
019d   5e3a84:	bf 01 00 00 00       	mov    $0x1,%edi
01a2   5e3a89:	4c 89 7d c0          	mov    %r15,-0x40(%rbp)
01a6   5e3a8d:	e8 00 00 00 00       	call   5e3a92 <iomap_read_inline_data+0x1ab>	5e3a8e: R_X86_64_PLT32	preempt_count_add-0x4
01ab   5e3a92:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
01b5   5e3a9c:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 5e3aa3 <iomap_read_inline_data+0x1bc>	5e3a9f: R_X86_64_PC32	current_task-0x4
01bc   5e3aa3:	49 81 c4 90 07 00 00 	add    $0x790,%r12
01c3   5e3aaa:	4c 89 e0             	mov    %r12,%rax
01c6   5e3aad:	48 c1 e8 03          	shr    $0x3,%rax
01ca   5e3ab1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
01ce   5e3ab5:	42 8a 04 38          	mov    (%rax,%r15,1),%al
01d2   5e3ab9:	84 c0                	test   %al,%al
01d4   5e3abb:	0f 85 d9 01 00 00    	jne    5e3c9a <iomap_read_inline_data+0x3b3>
01da   5e3ac1:	41 ff 04 24          	incl   (%r12)
01de   5e3ac5:	42 80 3c 3b 00       	cmpb   $0x0,(%rbx,%r15,1)
01e3   5e3aca:	74 08                	je     5e3ad4 <iomap_read_inline_data+0x1ed>
01e5   5e3acc:	4c 89 ef             	mov    %r13,%rdi
01e8   5e3acf:	e8 00 00 00 00       	call   5e3ad4 <iomap_read_inline_data+0x1ed>	5e3ad0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01ed   5e3ad4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	5e3ad7: R_X86_64_32S	mem_section
01f4   5e3adb:	49 8b 5d 00          	mov    0x0(%r13),%rbx
01f8   5e3adf:	48 c1 e8 03          	shr    $0x3,%rax
01fc   5e3ae3:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0201   5e3ae8:	74 0c                	je     5e3af6 <iomap_read_inline_data+0x20f>
0203   5e3aea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5e3aed: R_X86_64_32S	mem_section
020a   5e3af1:	e8 00 00 00 00       	call   5e3af6 <iomap_read_inline_data+0x20f>	5e3af2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
020f   5e3af6:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 5e3afd <iomap_read_inline_data+0x216>	5e3af9: R_X86_64_PC32	mem_section-0x4
0216   5e3afd:	4c 8b 7d c0          	mov    -0x40(%rbp),%r15
021a   5e3b01:	48 85 c0             	test   %rax,%rax
021d   5e3b04:	74 51                	je     5e3b57 <iomap_read_inline_data+0x270>
021f   5e3b06:	48 89 d9             	mov    %rbx,%rcx
0222   5e3b09:	48 c1 e9 34          	shr    $0x34,%rcx
0226   5e3b0d:	4c 8d 2c c8          	lea    (%rax,%rcx,8),%r13
022a   5e3b11:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0234   5e3b1b:	4c 89 e8             	mov    %r13,%rax
0237   5e3b1e:	48 c1 e8 03          	shr    $0x3,%rax
023b   5e3b22:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
023f   5e3b26:	74 08                	je     5e3b30 <iomap_read_inline_data+0x249>
0241   5e3b28:	4c 89 ef             	mov    %r13,%rdi
0244   5e3b2b:	e8 00 00 00 00       	call   5e3b30 <iomap_read_inline_data+0x249>	5e3b2c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0249   5e3b30:	4d 8b 6d 00          	mov    0x0(%r13),%r13
024d   5e3b34:	4d 85 ed             	test   %r13,%r13
0250   5e3b37:	74 25                	je     5e3b5e <iomap_read_inline_data+0x277>
0252   5e3b39:	48 c1 eb 2d          	shr    $0x2d,%rbx
0256   5e3b3d:	e8 00 00 00 00       	call   5e3b42 <iomap_read_inline_data+0x25b>	5e3b3e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
025b   5e3b42:	83 e3 7f             	and    $0x7f,%ebx
025e   5e3b45:	c1 e3 05             	shl    $0x5,%ebx
0261   5e3b48:	49 01 dd             	add    %rbx,%r13
0264   5e3b4b:	eb 19                	jmp    5e3b66 <iomap_read_inline_data+0x27f>
0266   5e3b4d:	e8 00 00 00 00       	call   5e3b52 <iomap_read_inline_data+0x26b>	5e3b4e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026b   5e3b52:	e9 e0 00 00 00       	jmp    5e3c37 <iomap_read_inline_data+0x350>
0270   5e3b57:	e8 00 00 00 00       	call   5e3b5c <iomap_read_inline_data+0x275>	5e3b58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0275   5e3b5c:	eb 05                	jmp    5e3b63 <iomap_read_inline_data+0x27c>
0277   5e3b5e:	e8 00 00 00 00       	call   5e3b63 <iomap_read_inline_data+0x27c>	5e3b5f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
027c   5e3b63:	45 31 ed             	xor    %r13d,%r13d
027f   5e3b66:	4c 89 e8             	mov    %r13,%rax
0282   5e3b69:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
028c   5e3b73:	48 c1 e8 03          	shr    $0x3,%rax
0290   5e3b77:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0294   5e3b7b:	74 08                	je     5e3b85 <iomap_read_inline_data+0x29e>
0296   5e3b7d:	4c 89 ef             	mov    %r13,%rdi
0299   5e3b80:	e8 00 00 00 00       	call   5e3b85 <iomap_read_inline_data+0x29e>	5e3b81: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
029e   5e3b85:	48 b8 f0 ff ff ff ff ff ff 03 	movabs $0x3fffffffffffff0,%rax
02a8   5e3b8f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	5e3b92: R_X86_64_32S	page_offset_base
02af   5e3b96:	49 23 45 00          	and    0x0(%r13),%rax
02b3   5e3b9a:	4c 8b 6d d0          	mov    -0x30(%rbp),%r13
02b7   5e3b9e:	48 c1 e9 03          	shr    $0x3,%rcx
02bb   5e3ba2:	49 29 c5             	sub    %rax,%r13
02be   5e3ba5:	49 c1 e5 06          	shl    $0x6,%r13
02c2   5e3ba9:	80 3c 19 00          	cmpb   $0x0,(%rcx,%rbx,1)
02c6   5e3bad:	74 0c                	je     5e3bbb <iomap_read_inline_data+0x2d4>
02c8   5e3baf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	5e3bb2: R_X86_64_32S	page_offset_base
02cf   5e3bb6:	e8 00 00 00 00       	call   5e3bbb <iomap_read_inline_data+0x2d4>	5e3bb7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02d4   5e3bbb:	4c 03 2d 00 00 00 00 	add    0x0(%rip),%r13        # 5e3bc2 <iomap_read_inline_data+0x2db>	5e3bbe: R_X86_64_PC32	page_offset_base-0x4
02db   5e3bc2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
02df   5e3bc6:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
02e3   5e3bca:	74 08                	je     5e3bd4 <iomap_read_inline_data+0x2ed>
02e5   5e3bcc:	4c 89 ff             	mov    %r15,%rdi
02e8   5e3bcf:	e8 00 00 00 00       	call   5e3bd4 <iomap_read_inline_data+0x2ed>	5e3bd0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02ed   5e3bd4:	49 8b 37             	mov    (%r15),%rsi
02f0   5e3bd7:	4c 89 ef             	mov    %r13,%rdi
02f3   5e3bda:	4c 89 f2             	mov    %r14,%rdx
02f6   5e3bdd:	e8 00 00 00 00       	call   5e3be2 <iomap_read_inline_data+0x2fb>	5e3bde: R_X86_64_PLT32	memcpy-0x4
02fb   5e3be2:	ba 00 10 00 00       	mov    $0x1000,%edx
0300   5e3be7:	4d 01 f5             	add    %r14,%r13
0303   5e3bea:	31 f6                	xor    %esi,%esi
0305   5e3bec:	4c 29 f2             	sub    %r14,%rdx
0308   5e3bef:	4c 89 ef             	mov    %r13,%rdi
030b   5e3bf2:	e8 00 00 00 00       	call   5e3bf7 <iomap_read_inline_data+0x310>	5e3bf3: R_X86_64_PLT32	memset-0x4
0310   5e3bf7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
0314   5e3bfb:	8a 04 18             	mov    (%rax,%rbx,1),%al
0317   5e3bfe:	84 c0                	test   %al,%al
0319   5e3c00:	0f 85 b2 00 00 00    	jne    5e3cb8 <iomap_read_inline_data+0x3d1>
031f   5e3c06:	41 ff 0c 24          	decl   (%r12)
0323   5e3c0a:	bf 01 00 00 00       	mov    $0x1,%edi
0328   5e3c0f:	e8 00 00 00 00       	call   5e3c14 <iomap_read_inline_data+0x32d>	5e3c10: R_X86_64_PLT32	preempt_count_sub-0x4
032d   5e3c14:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 5e3c1a <iomap_read_inline_data+0x333>	5e3c16: R_X86_64_PC32	__preempt_count-0x4
0333   5e3c1a:	48 8b 5d d0          	mov    -0x30(%rbp),%rbx
0337   5e3c1e:	85 c0                	test   %eax,%eax
0339   5e3c20:	74 6c                	je     5e3c8e <iomap_read_inline_data+0x3a7>
033b   5e3c22:	e8 00 00 00 00       	call   5e3c27 <iomap_read_inline_data+0x340>	5e3c23: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0340   5e3c27:	48 89 df             	mov    %rbx,%rdi
0343   5e3c2a:	be 08 00 00 00       	mov    $0x8,%esi
0348   5e3c2f:	e8 00 00 00 00       	call   5e3c34 <iomap_read_inline_data+0x34d>	5e3c30: R_X86_64_PLT32	__kasan_check_write-0x4
034d   5e3c34:	80 0b 04             	orb    $0x4,(%rbx)
0350   5e3c37:	31 c0                	xor    %eax,%eax
0352   5e3c39:	48 8d 64 24 20       	lea    0x20(%rsp),%rsp
0357   5e3c3e:	5b                   	pop    %rbx
0358   5e3c3f:	41 5c                	pop    %r12
035a   5e3c41:	41 5d                	pop    %r13
035c   5e3c43:	41 5e                	pop    %r14
035e   5e3c45:	41 5f                	pop    %r15
0360   5e3c47:	5d                   	pop    %rbp
0361   5e3c48:	c3                   	ret
0362   5e3c49:	e8 00 00 00 00       	call   5e3c4e <iomap_read_inline_data+0x367>	5e3c4a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0367   5e3c4e:	49 ff cd             	dec    %r13
036a   5e3c51:	e9 42 fd ff ff       	jmp    5e3998 <iomap_read_inline_data+0xb1>
036f   5e3c56:	e8 00 00 00 00       	call   5e3c5b <iomap_read_inline_data+0x374>	5e3c57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0374   5e3c5b:	0f 0b                	ud2
0376   5e3c5d:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
037b   5e3c62:	eb d5                	jmp    5e3c39 <iomap_read_inline_data+0x352>
037d   5e3c64:	e8 00 00 00 00       	call   5e3c69 <iomap_read_inline_data+0x382>	5e3c65: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0382   5e3c69:	0f 0b                	ud2
0384   5e3c6b:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
0389   5e3c70:	eb c7                	jmp    5e3c39 <iomap_read_inline_data+0x352>
038b   5e3c72:	e8 00 00 00 00       	call   5e3c77 <iomap_read_inline_data+0x390>	5e3c73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0390   5e3c77:	0f 0b                	ud2
0392   5e3c79:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
0397   5e3c7e:	eb b9                	jmp    5e3c39 <iomap_read_inline_data+0x352>
0399   5e3c80:	e8 00 00 00 00       	call   5e3c85 <iomap_read_inline_data+0x39e>	5e3c81: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
039e   5e3c85:	0f 0b                	ud2
03a0   5e3c87:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
03a5   5e3c8c:	eb ab                	jmp    5e3c39 <iomap_read_inline_data+0x352>
03a7   5e3c8e:	e8 00 00 00 00       	call   5e3c93 <iomap_read_inline_data+0x3ac>	5e3c8f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03ac   5e3c93:	e8 00 00 00 00       	call   5e3c98 <iomap_read_inline_data+0x3b1>	5e3c94: R_X86_64_PLT32	preempt_schedule_thunk-0x4
03b1   5e3c98:	eb 8d                	jmp    5e3c27 <iomap_read_inline_data+0x340>
03b3   5e3c9a:	44 89 e1             	mov    %r12d,%ecx
03b6   5e3c9d:	80 e1 07             	and    $0x7,%cl
03b9   5e3ca0:	80 c1 03             	add    $0x3,%cl
03bc   5e3ca3:	38 c1                	cmp    %al,%cl
03be   5e3ca5:	0f 8c 16 fe ff ff    	jl     5e3ac1 <iomap_read_inline_data+0x1da>
03c4   5e3cab:	4c 89 e7             	mov    %r12,%rdi
03c7   5e3cae:	e8 00 00 00 00       	call   5e3cb3 <iomap_read_inline_data+0x3cc>	5e3caf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03cc   5e3cb3:	e9 09 fe ff ff       	jmp    5e3ac1 <iomap_read_inline_data+0x1da>
03d1   5e3cb8:	44 89 e1             	mov    %r12d,%ecx
03d4   5e3cbb:	80 e1 07             	and    $0x7,%cl
03d7   5e3cbe:	80 c1 03             	add    $0x3,%cl
03da   5e3cc1:	38 c1                	cmp    %al,%cl
03dc   5e3cc3:	0f 8c 3d ff ff ff    	jl     5e3c06 <iomap_read_inline_data+0x31f>
03e2   5e3cc9:	4c 89 e7             	mov    %r12,%rdi
03e5   5e3ccc:	e8 00 00 00 00       	call   5e3cd1 <iomap_read_inline_data+0x3ea>	5e3ccd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
03ea   5e3cd1:	e9 30 ff ff ff       	jmp    5e3c06 <iomap_read_inline_data+0x31f>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
