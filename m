Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A74C8A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690147562; x=1721683562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yS1U4ayOMbHu2Y4KF3zHmVHVicMP3tuArE7gs7o/weU=;
  b=fTowV6u1w4RM4qpet/fHm4Ha95Zwn5ab9R6rBMh/pLBRmXb6nisJTU4b
   kflISO/9P7ZXkuLnzm5a0tuK1TUAyyzeYQPm99kMa4WGQhknwJxAgAGVK
   fTR33vcun+iBefgJPR29kvuaUTExmmUjT4450GRe/1N4smpr0NIQc/xMQ
   +IxEBnPHhVtRC1eyN5AaBEJo7HinNFoSIMwqjuorxIh5hIfjdecyE+xrM
   dfR/4hxGRv+MAJGlGvIyG5D7oAhnmb/6rYH7T1JiUzYSjNtbf2yehUM5v
   qoU9vs4d7rLZsy7LYb0uVgfmLL3oPZLw3kqNJvZRLE1h14Vorc2mjfz+g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433548256"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="433548256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 14:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="719439663"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="719439663"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Jul 2023 14:25:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNgaT-0009HD-21;
	Sun, 23 Jul 2023 21:25:57 +0000
Date: Mon, 24 Jul 2023 05:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [linux-stable-rc:linux-4.14.y 4901/5024] drivers/gpu/drm/drm_edid.o:
 warning: objtool: mode_in_range()+0x8: undefined stack state
Message-ID: <202307240553.tB2a40oQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   0de60b6a720fa89040582d7d0c6f59565970bfc9
commit: 01296d0f4f74495818a1a1af8a8845b933e571b5 [4901/5024] drm/edid: Fix uninitialized variable in drm_cvt_modes()
config: x86_64-buildonly-randconfig-r003-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240553.tB2a40oQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240553.tB2a40oQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240553.tB2a40oQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_edid.o: warning: objtool: mode_in_range()+0x8: undefined stack state
>> drivers/gpu/drm/drm_edid.o: warning: objtool: mode_in_range()+0x0: stack state mismatch: cfa1=6+16 cfa2=7+8


objdump-func vmlinux.o mode_in_range:
0000 0000000000532e30 <mode_in_range>:
0000   532e30:	55                   	push   %rbp
0001   532e31:	48 8d 46 13          	lea    0x13(%rsi),%rax
0005   532e35:	48 89 e5             	mov    %rsp,%rbp
0008   532e38:	41 57                	push   %r15
000a   532e3a:	41 56                	push   %r14
000c   532e3c:	41 55                	push   %r13
000e   532e3e:	41 54                	push   %r12
0010   532e40:	49 89 fd             	mov    %rdi,%r13
0013   532e43:	53                   	push   %rbx
0014   532e44:	49 89 f4             	mov    %rsi,%r12
0017   532e47:	48 89 c7             	mov    %rax,%rdi
001a   532e4a:	48 89 d3             	mov    %rdx,%rbx
001d   532e4d:	48 83 ec 10          	sub    $0x10,%rsp
0021   532e51:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
0025   532e55:	e8 00 00 00 00       	call   532e5a <mode_in_range+0x2a>	532e56: R_X86_64_PLT32	__asan_load1_noabort-0x4
002a   532e5a:	41 0f b6 44 24 13    	movzbl 0x13(%r12),%eax
0030   532e60:	48 8d 7b 07          	lea    0x7(%rbx),%rdi
0034   532e64:	88 45 d0             	mov    %al,-0x30(%rbp)
0037   532e67:	e8 00 00 00 00       	call   532e6c <mode_in_range+0x3c>	532e68: R_X86_64_PLT32	__asan_load1_noabort-0x4
003c   532e6c:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
0040   532e70:	44 0f b6 73 07       	movzbl 0x7(%rbx),%r14d
0045   532e75:	e8 00 00 00 00       	call   532e7a <mode_in_range+0x4a>	532e76: R_X86_64_PLT32	__asan_load1_noabort-0x4
004a   532e7a:	80 7d d0 03          	cmpb   $0x3,-0x30(%rbp)
004e   532e7e:	44 0f b6 7b 08       	movzbl 0x8(%rbx),%r15d
0053   532e83:	76 27                	jbe    532eac <mode_in_range+0x7c>
0055   532e85:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
0059   532e89:	e8 00 00 00 00       	call   532e8e <mode_in_range+0x5e>	532e8a: R_X86_64_PLT32	__asan_load1_noabort-0x4
005e   532e8e:	0f b6 43 04          	movzbl 0x4(%rbx),%eax
0062   532e92:	41 8d 8e ff 00 00 00 	lea    0xff(%r14),%ecx
0069   532e99:	a8 04                	test   $0x4,%al
006b   532e9b:	44 0f 45 f1          	cmovne %ecx,%r14d
006f   532e9f:	41 8d 8f ff 00 00 00 	lea    0xff(%r15),%ecx
0076   532ea6:	a8 08                	test   $0x8,%al
0078   532ea8:	44 0f 45 f9          	cmovne %ecx,%r15d
007c   532eac:	4c 89 ef             	mov    %r13,%rdi
007f   532eaf:	e8 00 00 00 00       	call   532eb4 <mode_in_range+0x84>	532eb0: R_X86_64_PLT32	drm_mode_hsync-0x4
0084   532eb4:	44 39 f8             	cmp    %r15d,%eax
0087   532eb7:	0f 8f 21 01 00 00    	jg     532fde <mode_in_range+0x1ae>
008d   532ebd:	44 39 f0             	cmp    %r14d,%eax
0090   532ec0:	0f 8c 18 01 00 00    	jl     532fde <mode_in_range+0x1ae>
0096   532ec6:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
009a   532eca:	e8 00 00 00 00       	call   532ecf <mode_in_range+0x9f>	532ecb: R_X86_64_PLT32	__asan_load1_noabort-0x4
009f   532ecf:	41 0f b6 44 24 13    	movzbl 0x13(%r12),%eax
00a5   532ed5:	48 8d 7b 05          	lea    0x5(%rbx),%rdi
00a9   532ed9:	88 45 d0             	mov    %al,-0x30(%rbp)
00ac   532edc:	e8 00 00 00 00       	call   532ee1 <mode_in_range+0xb1>	532edd: R_X86_64_PLT32	__asan_load1_noabort-0x4
00b1   532ee1:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
00b5   532ee5:	44 0f b6 7b 05       	movzbl 0x5(%rbx),%r15d
00ba   532eea:	e8 00 00 00 00       	call   532eef <mode_in_range+0xbf>	532eeb: R_X86_64_PLT32	__asan_load1_noabort-0x4
00bf   532eef:	80 7d d0 03          	cmpb   $0x3,-0x30(%rbp)
00c3   532ef3:	44 0f b6 73 06       	movzbl 0x6(%rbx),%r14d
00c8   532ef8:	0f 87 f1 00 00 00    	ja     532fef <mode_in_range+0x1bf>
00ce   532efe:	4c 89 ef             	mov    %r13,%rdi
00d1   532f01:	e8 00 00 00 00       	call   532f06 <mode_in_range+0xd6>	532f02: R_X86_64_PLT32	drm_mode_vrefresh-0x4
00d6   532f06:	44 39 f0             	cmp    %r14d,%eax
00d9   532f09:	0f 8f cf 00 00 00    	jg     532fde <mode_in_range+0x1ae>
00df   532f0f:	44 39 f8             	cmp    %r15d,%eax
00e2   532f12:	0f 8c c6 00 00 00    	jl     532fde <mode_in_range+0x1ae>
00e8   532f18:	48 8d 7b 09          	lea    0x9(%rbx),%rdi
00ec   532f1c:	e8 00 00 00 00       	call   532f21 <mode_in_range+0xf1>	532f1d: R_X86_64_PLT32	__asan_load1_noabort-0x4
00f1   532f21:	0f b6 43 09          	movzbl 0x9(%rbx),%eax
00f5   532f25:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
00f9   532f29:	88 45 d0             	mov    %al,-0x30(%rbp)
00fc   532f2c:	e8 00 00 00 00       	call   532f31 <mode_in_range+0x101>	532f2d: R_X86_64_PLT32	__asan_load1_noabort-0x4
0101   532f31:	0f b6 45 d0          	movzbl -0x30(%rbp),%eax
0105   532f35:	45 0f b6 74 24 13    	movzbl 0x13(%r12),%r14d
010b   532f3b:	8d 50 ff             	lea    -0x1(%rax),%edx
010e   532f3e:	80 fa fd             	cmp    $0xfd,%dl
0111   532f41:	0f 87 ea 00 00 00    	ja     533031 <mode_in_range+0x201>
0117   532f47:	44 69 f8 10 27 00 00 	imul   $0x2710,%eax,%r15d
011e   532f4e:	41 80 fe 03          	cmp    $0x3,%r14b
0122   532f52:	0f 86 c3 00 00 00    	jbe    53301b <mode_in_range+0x1eb>
0128   532f58:	48 8d 43 0a          	lea    0xa(%rbx),%rax
012c   532f5c:	48 89 c7             	mov    %rax,%rdi
012f   532f5f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
0133   532f63:	e8 00 00 00 00       	call   532f68 <mode_in_range+0x138>	532f64: R_X86_64_PLT32	__asan_load1_noabort-0x4
0138   532f68:	80 7b 0a 04          	cmpb   $0x4,0xa(%rbx)
013c   532f6c:	0f 85 a9 00 00 00    	jne    53301b <mode_in_range+0x1eb>
0142   532f72:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
0146   532f76:	e8 00 00 00 00       	call   532f7b <mode_in_range+0x14b>	532f77: R_X86_64_PLT32	__asan_load1_noabort-0x4
014b   532f7b:	0f b6 53 0c          	movzbl 0xc(%rbx),%edx
014f   532f7f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
0153   532f83:	c0 ea 02             	shr    $0x2,%dl
0156   532f86:	0f b6 d2             	movzbl %dl,%edx
0159   532f89:	69 d2 06 ff ff ff    	imul   $0xffffff06,%edx,%edx
015f   532f8f:	41 01 d7             	add    %edx,%r15d
0162   532f92:	0f 85 71 01 00 00    	jne    533109 <mode_in_range+0x2d9>
0168   532f98:	49 8d 7d 5c          	lea    0x5c(%r13),%rdi
016c   532f9c:	e8 00 00 00 00       	call   532fa1 <mode_in_range+0x171>	532f9d: R_X86_64_PLT32	__asan_load4_noabort-0x4
0171   532fa1:	45 8b 7d 5c          	mov    0x5c(%r13),%r15d
0175   532fa5:	48 8d 7b 0d          	lea    0xd(%rbx),%rdi
0179   532fa9:	e8 00 00 00 00       	call   532fae <mode_in_range+0x17e>	532faa: R_X86_64_PLT32	__asan_load1_noabort-0x4
017e   532fae:	0f b6 53 0d          	movzbl 0xd(%rbx),%edx
0182   532fb2:	84 d2                	test   %dl,%dl
0184   532fb4:	88 55 d0             	mov    %dl,-0x30(%rbp)
0187   532fb7:	0f 84 9d 00 00 00    	je     53305a <mode_in_range+0x22a>
018d   532fbd:	48 8d 7b 0c          	lea    0xc(%rbx),%rdi
0191   532fc1:	e8 00 00 00 00       	call   532fc6 <mode_in_range+0x196>	532fc2: R_X86_64_PLT32	__asan_load1_noabort-0x4
0196   532fc6:	0f b6 43 0c          	movzbl 0xc(%rbx),%eax
019a   532fca:	0f b6 55 d0          	movzbl -0x30(%rbp),%edx
019e   532fce:	83 e0 03             	and    $0x3,%eax
01a1   532fd1:	c1 e0 08             	shl    $0x8,%eax
01a4   532fd4:	01 d0                	add    %edx,%eax
01a6   532fd6:	c1 e0 03             	shl    $0x3,%eax
01a9   532fd9:	44 39 f8             	cmp    %r15d,%eax
01ac   532fdc:	7d 7c                	jge    53305a <mode_in_range+0x22a>
01ae   532fde:	31 c0                	xor    %eax,%eax
01b0   532fe0:	48 83 c4 10          	add    $0x10,%rsp
01b4   532fe4:	5b                   	pop    %rbx
01b5   532fe5:	41 5c                	pop    %r12
01b7   532fe7:	41 5d                	pop    %r13
01b9   532fe9:	41 5e                	pop    %r14
01bb   532feb:	41 5f                	pop    %r15
01bd   532fed:	5d                   	pop    %rbp
01be   532fee:	c3                   	ret
01bf   532fef:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
01c3   532ff3:	e8 00 00 00 00       	call   532ff8 <mode_in_range+0x1c8>	532ff4: R_X86_64_PLT32	__asan_load1_noabort-0x4
01c8   532ff8:	0f b6 43 04          	movzbl 0x4(%rbx),%eax
01cc   532ffc:	41 8d 8f ff 00 00 00 	lea    0xff(%r15),%ecx
01d3   533003:	a8 01                	test   $0x1,%al
01d5   533005:	44 0f 45 f9          	cmovne %ecx,%r15d
01d9   533009:	41 8d 8e ff 00 00 00 	lea    0xff(%r14),%ecx
01e0   533010:	a8 02                	test   $0x2,%al
01e2   533012:	44 0f 45 f1          	cmovne %ecx,%r14d
01e6   533016:	e9 e3 fe ff ff       	jmp    532efe <mode_in_range+0xce>
01eb   53301b:	49 8d 7d 58          	lea    0x58(%r13),%rdi
01ef   53301f:	41 81 c7 89 13 00 00 	add    $0x1389,%r15d
01f6   533026:	e8 00 00 00 00       	call   53302b <mode_in_range+0x1fb>	533027: R_X86_64_PLT32	__asan_load4_noabort-0x4
01fb   53302b:	45 3b 7d 58          	cmp    0x58(%r13),%r15d
01ff   53302f:	72 ad                	jb     532fde <mode_in_range+0x1ae>
0201   533031:	49 8d 7d 5c          	lea    0x5c(%r13),%rdi
0205   533035:	e8 00 00 00 00       	call   53303a <mode_in_range+0x20a>	533036: R_X86_64_PLT32	__asan_load4_noabort-0x4
020a   53303a:	41 80 fe 03          	cmp    $0x3,%r14b
020e   53303e:	45 8b 7d 5c          	mov    0x5c(%r13),%r15d
0212   533042:	76 16                	jbe    53305a <mode_in_range+0x22a>
0214   533044:	48 8d 43 0a          	lea    0xa(%rbx),%rax
0218   533048:	48 89 c7             	mov    %rax,%rdi
021b   53304b:	e8 00 00 00 00       	call   533050 <mode_in_range+0x220>	53304c: R_X86_64_PLT32	__asan_load1_noabort-0x4
0220   533050:	80 7b 0a 04          	cmpb   $0x4,0xa(%rbx)
0224   533054:	0f 84 4b ff ff ff    	je     532fa5 <mode_in_range+0x175>
022a   53305a:	49 8d 7d 68          	lea    0x68(%r13),%rdi
022e   53305e:	e8 00 00 00 00       	call   533063 <mode_in_range+0x233>	53305f: R_X86_64_PLT32	__asan_load4_noabort-0x4
0233   533063:	41 8b 55 68          	mov    0x68(%r13),%edx
0237   533067:	b8 01 00 00 00       	mov    $0x1,%eax
023c   53306c:	44 29 fa             	sub    %r15d,%edx
023f   53306f:	81 fa a0 00 00 00    	cmp    $0xa0,%edx
0245   533075:	0f 85 65 ff ff ff    	jne    532fe0 <mode_in_range+0x1b0>
024b   53307b:	49 8d 7d 64          	lea    0x64(%r13),%rdi
024f   53307f:	88 45 d0             	mov    %al,-0x30(%rbp)
0252   533082:	e8 00 00 00 00       	call   533087 <mode_in_range+0x257>	533083: R_X86_64_PLT32	__asan_load4_noabort-0x4
0257   533087:	41 8b 5d 64          	mov    0x64(%r13),%ebx
025b   53308b:	0f b6 45 d0          	movzbl -0x30(%rbp),%eax
025f   53308f:	89 da                	mov    %ebx,%edx
0261   533091:	44 29 fa             	sub    %r15d,%edx
0264   533094:	83 fa 50             	cmp    $0x50,%edx
0267   533097:	0f 85 43 ff ff ff    	jne    532fe0 <mode_in_range+0x1b0>
026d   53309d:	49 8d 7d 60          	lea    0x60(%r13),%rdi
0271   5330a1:	e8 00 00 00 00       	call   5330a6 <mode_in_range+0x276>	5330a2: R_X86_64_PLT32	__asan_load4_noabort-0x4
0276   5330a6:	41 2b 5d 60          	sub    0x60(%r13),%ebx
027a   5330aa:	0f b6 45 d0          	movzbl -0x30(%rbp),%eax
027e   5330ae:	83 fb 20             	cmp    $0x20,%ebx
0281   5330b1:	0f 85 29 ff ff ff    	jne    532fe0 <mode_in_range+0x1b0>
0287   5330b7:	49 8d 7d 74          	lea    0x74(%r13),%rdi
028b   5330bb:	e8 00 00 00 00       	call   5330c0 <mode_in_range+0x290>	5330bc: R_X86_64_PLT32	__asan_load4_noabort-0x4
0290   5330c0:	49 8d 7d 70          	lea    0x70(%r13),%rdi
0294   5330c4:	41 8b 5d 74          	mov    0x74(%r13),%ebx
0298   5330c8:	e8 00 00 00 00       	call   5330cd <mode_in_range+0x29d>	5330c9: R_X86_64_PLT32	__asan_load4_noabort-0x4
029d   5330cd:	41 2b 5d 70          	sub    0x70(%r13),%ebx
02a1   5330d1:	0f b6 45 d0          	movzbl -0x30(%rbp),%eax
02a5   5330d5:	83 fb 03             	cmp    $0x3,%ebx
02a8   5330d8:	0f 85 02 ff ff ff    	jne    532fe0 <mode_in_range+0x1b0>
02ae   5330de:	41 80 fe 03          	cmp    $0x3,%r14b
02b2   5330e2:	77 18                	ja     5330fc <mode_in_range+0x2cc>
02b4   5330e4:	49 8d 7c 24 14       	lea    0x14(%r12),%rdi
02b9   5330e9:	e8 00 00 00 00       	call   5330ee <mode_in_range+0x2be>	5330ea: R_X86_64_PLT32	__asan_load1_noabort-0x4
02be   5330ee:	41 0f b6 44 24 14    	movzbl 0x14(%r12),%eax
02c4   5330f4:	c0 e8 07             	shr    $0x7,%al
02c7   5330f7:	e9 e4 fe ff ff       	jmp    532fe0 <mode_in_range+0x1b0>
02cc   5330fc:	4c 89 e7             	mov    %r12,%rdi
02cf   5330ff:	e8 1c f8 ff ff       	call   532920 <drm_monitor_supports_rb.part.2>
02d4   533104:	e9 d7 fe ff ff       	jmp    532fe0 <mode_in_range+0x1b0>
02d9   533109:	49 8d 7d 58          	lea    0x58(%r13),%rdi
02dd   53310d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
02e1   533111:	e8 00 00 00 00       	call   533116 <mode_in_range+0x2e6>	533112: R_X86_64_PLT32	__asan_load4_noabort-0x4
02e6   533116:	45 3b 7d 58          	cmp    0x58(%r13),%r15d
02ea   53311a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
02ee   53311e:	0f 82 ba fe ff ff    	jb     532fde <mode_in_range+0x1ae>
02f4   533124:	49 8d 7d 5c          	lea    0x5c(%r13),%rdi
02f8   533128:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
02fc   53312c:	e8 00 00 00 00       	call   533131 <mode_in_range+0x301>	53312d: R_X86_64_PLT32	__asan_load4_noabort-0x4
0301   533131:	45 8b 7d 5c          	mov    0x5c(%r13),%r15d
0305   533135:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
0309   533139:	e9 0a ff ff ff       	jmp    533048 <mode_in_range+0x218>
030e   53313e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
