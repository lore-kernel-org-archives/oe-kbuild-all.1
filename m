Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C297E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682931725; x=1714467725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9vfayopyruWdr7A7+j7cvnoq/BY8vVMR4ry0skg3NQ=;
  b=YJyGPRNl3wsq25wKeXh1H3gqn3CxFIw+bUuiLWAxFqBOFEbW6OU2OqYT
   /g8l4A7EYixPaEyVbJNmY3kHDqYsKLy2BcdkXGZTXN0Z5VYKi58+OJ/oZ
   Bo2bRnlsDk6YXPwuwkdoAab8hIxcgLKejWT2jL87Erp/Pdujuc6ntr9zW
   vIrJcRUmPa+KOGTTM6rpV4z6OwXQKn2c0lu+FrkCGI0eJIPVQTM2qvlTm
   r4xBVRaKQjOvDC4zDfoFK+oTr/kgsYbUsPf+rUWUNThYFzvHN0bDIkINB
   9SA6puUmFdUg2rDkH66fzzIN3f73byE5N4ZhLEGvClb+qAisdaRbzjrLA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="337225763"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="337225763"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 02:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="1025557098"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="1025557098"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 May 2023 02:02:02 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptPQ1-0000NR-2N;
	Mon, 01 May 2023 09:02:01 +0000
Date: Mon, 1 May 2023 17:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-stable 775/2570] vmlinux.o: warning: objtool:
 mptscsih_abort+0xa42: unreachable instruction
Message-ID: <202305011612.40xqnbhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-stable
head:   7e83b5e75b20f49d4940bf35dfc1e38f3f95e5dc
commit: 76751e14d179119739c548cc95ffbaa6ff52785d [775/2570] Compiler attributes: GCC cold function alignment workarounds
config: x86_64-randconfig-a002-20230501 (https://download.01.org/0day-ci/archive/20230501/202305011612.40xqnbhX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=76751e14d179119739c548cc95ffbaa6ff52785d
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-stable
        git checkout 76751e14d179119739c548cc95ffbaa6ff52785d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305011612.40xqnbhX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: mptscsih_abort+0xa42: unreachable instruction


objdump-func vmlinux.o mptscsih_abort:
0000 0000000001eea140 <mptscsih_abort>:
0000  1eea140:	f3 0f 1e fa          	endbr64
0004  1eea144:	e8 00 00 00 00       	call   1eea149 <mptscsih_abort+0x9>	1eea145: R_X86_64_PLT32	__fentry__-0x4
0009  1eea149:	41 57                	push   %r15
000b  1eea14b:	41 56                	push   %r14
000d  1eea14d:	41 55                	push   %r13
000f  1eea14f:	41 54                	push   %r12
0011  1eea151:	55                   	push   %rbp
0012  1eea152:	48 89 fd             	mov    %rdi,%rbp
0015  1eea155:	53                   	push   %rbx
0016  1eea156:	48 83 ec 38          	sub    $0x38,%rsp
001a  1eea15a:	e8 00 00 00 00       	call   1eea15f <mptscsih_abort+0x1f>	1eea15b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001f  1eea15f:	48 89 ea             	mov    %rbp,%rdx
0022  1eea162:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
002c  1eea16c:	48 c1 ea 03          	shr    $0x3,%rdx
0030  1eea170:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0034  1eea174:	0f 85 37 0a 00 00    	jne    1eeabb1 <mptscsih_abort+0xa71>
003a  1eea17a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0044  1eea184:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
0048  1eea188:	48 89 da             	mov    %rbx,%rdx
004b  1eea18b:	48 c1 ea 03          	shr    $0x3,%rdx
004f  1eea18f:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0053  1eea193:	0f 85 25 0a 00 00    	jne    1eeabbe <mptscsih_abort+0xa7e>
0059  1eea199:	48 8b 1b             	mov    (%rbx),%rbx
005c  1eea19c:	48 89 d8             	mov    %rbx,%rax
005f  1eea19f:	48 05 80 0c 00 00    	add    $0xc80,%rax
0065  1eea1a5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
006a  1eea1aa:	0f 84 73 08 00 00    	je     1eeaa23 <mptscsih_abort+0x8e3>
0070  1eea1b0:	e8 00 00 00 00       	call   1eea1b5 <mptscsih_abort+0x75>	1eea1b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0075  1eea1b5:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
007a  1eea1ba:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0084  1eea1c4:	48 c1 ea 03          	shr    $0x3,%rdx
0088  1eea1c8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
008c  1eea1cc:	0f 85 20 0a 00 00    	jne    1eeabf2 <mptscsih_abort+0xab2>
0092  1eea1d2:	4c 8b bb 80 0c 00 00 	mov    0xc80(%rbx),%r15
0099  1eea1d9:	48 89 ea             	mov    %rbp,%rdx
009c  1eea1dc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eea1df: R_X86_64_32S	.rodata+0x7461a0
00a3  1eea1e3:	49 8d 47 08          	lea    0x8(%r15),%rax
00a7  1eea1e7:	48 89 c6             	mov    %rax,%rsi
00aa  1eea1ea:	48 89 04 24          	mov    %rax,(%rsp)
00ae  1eea1ee:	e8 00 00 00 00       	call   1eea1f3 <mptscsih_abort+0xb3>	1eea1ef: R_X86_64_PLT32	_printk-0x4
00b3  1eea1f3:	48 89 ef             	mov    %rbp,%rdi
00b6  1eea1f6:	e8 00 00 00 00       	call   1eea1fb <mptscsih_abort+0xbb>	1eea1f7: R_X86_64_PLT32	scsi_print_command-0x4
00bb  1eea1fb:	48 89 ea             	mov    %rbp,%rdx
00be  1eea1fe:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00c8  1eea208:	48 c1 ea 03          	shr    $0x3,%rdx
00cc  1eea20c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00d0  1eea210:	0f 85 c2 09 00 00    	jne    1eeabd8 <mptscsih_abort+0xa98>
00d6  1eea216:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e0  1eea220:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
00e4  1eea224:	48 8d bb e0 00 00 00 	lea    0xe0(%rbx),%rdi
00eb  1eea22b:	48 89 fa             	mov    %rdi,%rdx
00ee  1eea22e:	48 c1 ea 03          	shr    $0x3,%rdx
00f2  1eea232:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
00f6  1eea236:	0f 85 c5 09 00 00    	jne    1eeac01 <mptscsih_abort+0xac1>
00fc  1eea23c:	4c 8b ab e0 00 00 00 	mov    0xe0(%rbx),%r13
0103  1eea243:	4d 85 ed             	test   %r13,%r13
0106  1eea246:	0f 84 db 01 00 00    	je     1eea427 <mptscsih_abort+0x2e7>
010c  1eea24c:	e8 00 00 00 00       	call   1eea251 <mptscsih_abort+0x111>	1eea24d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0111  1eea251:	4c 89 ea             	mov    %r13,%rdx
0114  1eea254:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
011e  1eea25e:	48 c1 ea 03          	shr    $0x3,%rdx
0122  1eea262:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0126  1eea266:	0f 85 79 09 00 00    	jne    1eeabe5 <mptscsih_abort+0xaa5>
012c  1eea26c:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0130  1eea270:	48 85 db             	test   %rbx,%rbx
0133  1eea273:	0f 84 ae 01 00 00    	je     1eea427 <mptscsih_abort+0x2e7>
0139  1eea279:	e8 00 00 00 00       	call   1eea27e <mptscsih_abort+0x13e>	1eea27a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
013e  1eea27e:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
0142  1eea282:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
014c  1eea28c:	48 89 fa             	mov    %rdi,%rdx
014f  1eea28f:	48 c1 ea 03          	shr    $0x3,%rdx
0153  1eea293:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0157  1eea297:	84 c0                	test   %al,%al
0159  1eea299:	74 06                	je     1eea2a1 <mptscsih_abort+0x161>
015b  1eea29b:	0f 8e 98 08 00 00    	jle    1eeab39 <mptscsih_abort+0x9f9>
0161  1eea2a1:	44 0f b6 63 08       	movzbl 0x8(%rbx),%r12d
0166  1eea2a6:	31 ff                	xor    %edi,%edi
0168  1eea2a8:	41 83 e4 40          	and    $0x40,%r12d
016c  1eea2ac:	44 89 e6             	mov    %r12d,%esi
016f  1eea2af:	e8 00 00 00 00       	call   1eea2b4 <mptscsih_abort+0x174>	1eea2b0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0174  1eea2b4:	45 84 e4             	test   %r12b,%r12b
0177  1eea2b7:	0f 85 02 01 00 00    	jne    1eea3bf <mptscsih_abort+0x27f>
017d  1eea2bd:	e8 00 00 00 00       	call   1eea2c2 <mptscsih_abort+0x182>	1eea2be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0182  1eea2c2:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
0186  1eea2c6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0190  1eea2d0:	48 89 fa             	mov    %rdi,%rdx
0193  1eea2d3:	48 c1 ea 03          	shr    $0x3,%rdx
0197  1eea2d7:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
019b  1eea2db:	84 c0                	test   %al,%al
019d  1eea2dd:	74 06                	je     1eea2e5 <mptscsih_abort+0x1a5>
019f  1eea2df:	0f 8e 86 08 00 00    	jle    1eeab6b <mptscsih_abort+0xa2b>
01a5  1eea2e5:	0f b6 5b 10          	movzbl 0x10(%rbx),%ebx
01a9  1eea2e9:	31 ff                	xor    %edi,%edi
01ab  1eea2eb:	89 de                	mov    %ebx,%esi
01ad  1eea2ed:	e8 00 00 00 00       	call   1eea2f2 <mptscsih_abort+0x1b2>	1eea2ee: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
01b2  1eea2f2:	84 db                	test   %bl,%bl
01b4  1eea2f4:	0f 84 fc 01 00 00    	je     1eea4f6 <mptscsih_abort+0x3b6>
01ba  1eea2fa:	e8 00 00 00 00       	call   1eea2ff <mptscsih_abort+0x1bf>	1eea2fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bf  1eea2ff:	49 8d bf c8 00 00 00 	lea    0xc8(%r15),%rdi
01c6  1eea306:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01d0  1eea310:	48 89 fa             	mov    %rdi,%rdx
01d3  1eea313:	48 c1 ea 03          	shr    $0x3,%rdx
01d7  1eea317:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
01db  1eea31b:	84 c0                	test   %al,%al
01dd  1eea31d:	74 08                	je     1eea327 <mptscsih_abort+0x1e7>
01df  1eea31f:	3c 03                	cmp    $0x3,%al
01e1  1eea321:	0f 8e 1c 08 00 00    	jle    1eeab43 <mptscsih_abort+0xa03>
01e7  1eea327:	41 8b 9f c8 00 00 00 	mov    0xc8(%r15),%ebx
01ee  1eea32e:	31 ff                	xor    %edi,%edi
01f0  1eea330:	81 e3 00 01 00 00    	and    $0x100,%ebx
01f6  1eea336:	89 de                	mov    %ebx,%esi
01f8  1eea338:	e8 00 00 00 00       	call   1eea33d <mptscsih_abort+0x1fd>	1eea339: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
01fd  1eea33d:	85 db                	test   %ebx,%ebx
01ff  1eea33f:	0f 85 94 01 00 00    	jne    1eea4d9 <mptscsih_abort+0x399>
0205  1eea345:	e8 00 00 00 00       	call   1eea34a <mptscsih_abort+0x20a>	1eea346: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
020a  1eea34a:	48 8d bd 70 01 00 00 	lea    0x170(%rbp),%rdi
0211  1eea351:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
021b  1eea35b:	48 89 fa             	mov    %rdi,%rdx
021e  1eea35e:	48 c1 ea 03          	shr    $0x3,%rdx
0222  1eea362:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0226  1eea366:	84 c0                	test   %al,%al
0228  1eea368:	74 08                	je     1eea372 <mptscsih_abort+0x232>
022a  1eea36a:	3c 03                	cmp    $0x3,%al
022c  1eea36c:	0f 8e b5 08 00 00    	jle    1eeac27 <mptscsih_abort+0xae7>
0232  1eea372:	c7 85 70 01 00 00 00 00 08 00 	movl   $0x80000,0x170(%rbp)
023c  1eea37c:	41 bc 03 20 00 00    	mov    $0x2003,%r12d
0242  1eea382:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	1eea385: R_X86_64_32S	.rodata+0x744e80
0249  1eea389:	e8 00 00 00 00       	call   1eea38e <mptscsih_abort+0x24e>	1eea38a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
024e  1eea38e:	48 8b 34 24          	mov    (%rsp),%rsi
0252  1eea392:	49 89 e8             	mov    %rbp,%r8
0255  1eea395:	44 89 e1             	mov    %r12d,%ecx
0258  1eea398:	4c 89 ea             	mov    %r13,%rdx
025b  1eea39b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eea39e: R_X86_64_32S	.rodata+0x7464a0
0262  1eea3a2:	e8 00 00 00 00       	call   1eea3a7 <mptscsih_abort+0x267>	1eea3a3: R_X86_64_PLT32	_printk-0x4
0267  1eea3a7:	e8 00 00 00 00       	call   1eea3ac <mptscsih_abort+0x26c>	1eea3a8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
026c  1eea3ac:	44 89 e0             	mov    %r12d,%eax
026f  1eea3af:	48 83 c4 38          	add    $0x38,%rsp
0273  1eea3b3:	5b                   	pop    %rbx
0274  1eea3b4:	5d                   	pop    %rbp
0275  1eea3b5:	41 5c                	pop    %r12
0277  1eea3b7:	41 5d                	pop    %r13
0279  1eea3b9:	41 5e                	pop    %r14
027b  1eea3bb:	41 5f                	pop    %r15
027d  1eea3bd:	c3                   	ret
027e  1eea3be:	cc                   	int3
027f  1eea3bf:	e8 00 00 00 00       	call   1eea3c4 <mptscsih_abort+0x284>	1eea3c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0284  1eea3c4:	49 8d bf c8 00 00 00 	lea    0xc8(%r15),%rdi
028b  1eea3cb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0295  1eea3d5:	48 89 fa             	mov    %rdi,%rdx
0298  1eea3d8:	48 c1 ea 03          	shr    $0x3,%rdx
029c  1eea3dc:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
02a0  1eea3e0:	84 c0                	test   %al,%al
02a2  1eea3e2:	74 08                	je     1eea3ec <mptscsih_abort+0x2ac>
02a4  1eea3e4:	3c 03                	cmp    $0x3,%al
02a6  1eea3e6:	0f 8e 61 07 00 00    	jle    1eeab4d <mptscsih_abort+0xa0d>
02ac  1eea3ec:	41 8b 9f c8 00 00 00 	mov    0xc8(%r15),%ebx
02b3  1eea3f3:	31 ff                	xor    %edi,%edi
02b5  1eea3f5:	81 e3 00 01 00 00    	and    $0x100,%ebx
02bb  1eea3fb:	89 de                	mov    %ebx,%esi
02bd  1eea3fd:	e8 00 00 00 00       	call   1eea402 <mptscsih_abort+0x2c2>	1eea3fe: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
02c2  1eea402:	85 db                	test   %ebx,%ebx
02c4  1eea404:	0f 84 3b ff ff ff    	je     1eea345 <mptscsih_abort+0x205>
02ca  1eea40a:	e8 00 00 00 00       	call   1eea40f <mptscsih_abort+0x2cf>	1eea40b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02cf  1eea40f:	48 8b 34 24          	mov    (%rsp),%rsi
02d3  1eea413:	48 89 ea             	mov    %rbp,%rdx
02d6  1eea416:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eea419: R_X86_64_32S	.rodata+0x746260
02dd  1eea41d:	e8 00 00 00 00       	call   1eea422 <mptscsih_abort+0x2e2>	1eea41e: R_X86_64_PLT32	_printk-0x4
02e2  1eea422:	e9 1e ff ff ff       	jmp    1eea345 <mptscsih_abort+0x205>
02e7  1eea427:	e8 00 00 00 00       	call   1eea42c <mptscsih_abort+0x2ec>	1eea428: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02ec  1eea42c:	49 8d bf c8 00 00 00 	lea    0xc8(%r15),%rdi
02f3  1eea433:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02fd  1eea43d:	48 89 fa             	mov    %rdi,%rdx
0300  1eea440:	48 c1 ea 03          	shr    $0x3,%rdx
0304  1eea444:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0308  1eea448:	84 c0                	test   %al,%al
030a  1eea44a:	74 08                	je     1eea454 <mptscsih_abort+0x314>
030c  1eea44c:	3c 03                	cmp    $0x3,%al
030e  1eea44e:	0f 8e 03 07 00 00    	jle    1eeab57 <mptscsih_abort+0xa17>
0314  1eea454:	41 8b 9f c8 00 00 00 	mov    0xc8(%r15),%ebx
031b  1eea45b:	31 ff                	xor    %edi,%edi
031d  1eea45d:	81 e3 00 01 00 00    	and    $0x100,%ebx
0323  1eea463:	89 de                	mov    %ebx,%esi
0325  1eea465:	e8 00 00 00 00       	call   1eea46a <mptscsih_abort+0x32a>	1eea466: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
032a  1eea46a:	85 db                	test   %ebx,%ebx
032c  1eea46c:	75 51                	jne    1eea4bf <mptscsih_abort+0x37f>
032e  1eea46e:	e8 00 00 00 00       	call   1eea473 <mptscsih_abort+0x333>	1eea46f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0333  1eea473:	48 8d bd 70 01 00 00 	lea    0x170(%rbp),%rdi
033a  1eea47a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0344  1eea484:	48 89 fa             	mov    %rdi,%rdx
0347  1eea487:	48 c1 ea 03          	shr    $0x3,%rdx
034b  1eea48b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
034f  1eea48f:	84 c0                	test   %al,%al
0351  1eea491:	74 08                	je     1eea49b <mptscsih_abort+0x35b>
0353  1eea493:	3c 03                	cmp    $0x3,%al
0355  1eea495:	0f 8e c6 06 00 00    	jle    1eeab61 <mptscsih_abort+0xa21>
035b  1eea49b:	48 89 ef             	mov    %rbp,%rdi
035e  1eea49e:	41 bc 02 20 00 00    	mov    $0x2002,%r12d
0364  1eea4a4:	c7 85 70 01 00 00 00 00 01 00 	movl   $0x10000,0x170(%rbp)
036e  1eea4ae:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	1eea4b1: R_X86_64_32S	.rodata+0x744de0
0375  1eea4b5:	e8 00 00 00 00       	call   1eea4ba <mptscsih_abort+0x37a>	1eea4b6: R_X86_64_PLT32	scsi_done-0x4
037a  1eea4ba:	e9 ca fe ff ff       	jmp    1eea389 <mptscsih_abort+0x249>
037f  1eea4bf:	e8 00 00 00 00       	call   1eea4c4 <mptscsih_abort+0x384>	1eea4c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0384  1eea4c4:	48 8b 34 24          	mov    (%rsp),%rsi
0388  1eea4c8:	48 89 ea             	mov    %rbp,%rdx
038b  1eea4cb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eea4ce: R_X86_64_32S	.rodata+0x746200
0392  1eea4d2:	e8 00 00 00 00       	call   1eea4d7 <mptscsih_abort+0x397>	1eea4d3: R_X86_64_PLT32	_printk-0x4
0397  1eea4d7:	eb 95                	jmp    1eea46e <mptscsih_abort+0x32e>
0399  1eea4d9:	e8 00 00 00 00       	call   1eea4de <mptscsih_abort+0x39e>	1eea4da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
039e  1eea4de:	48 8b 34 24          	mov    (%rsp),%rsi
03a2  1eea4e2:	48 89 ea             	mov    %rbp,%rdx
03a5  1eea4e5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eea4e8: R_X86_64_32S	.rodata+0x7462c0
03ac  1eea4ec:	e8 00 00 00 00       	call   1eea4f1 <mptscsih_abort+0x3b1>	1eea4ed: R_X86_64_PLT32	_printk-0x4
03b1  1eea4f1:	e9 4f fe ff ff       	jmp    1eea345 <mptscsih_abort+0x205>
03b6  1eea4f6:	e8 00 00 00 00       	call   1eea4fb <mptscsih_abort+0x3bb>	1eea4f7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03bb  1eea4fb:	49 8d 87 50 13 00 00 	lea    0x1350(%r15),%rax
03c2  1eea502:	48 89 c7             	mov    %rax,%rdi
03c5  1eea505:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
03ca  1eea50a:	e8 00 00 00 00       	call   1eea50f <mptscsih_abort+0x3cf>	1eea50b: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
03cf  1eea50f:	49 8d 8f d4 01 00 00 	lea    0x1d4(%r15),%rcx
03d6  1eea516:	48 89 ca             	mov    %rcx,%rdx
03d9  1eea519:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
03de  1eea51e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03e8  1eea528:	48 c1 ea 03          	shr    $0x3,%rdx
03ec  1eea52c:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
03f1  1eea531:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
03f5  1eea535:	48 89 c8             	mov    %rcx,%rax
03f8  1eea538:	83 e0 07             	and    $0x7,%eax
03fb  1eea53b:	83 c0 03             	add    $0x3,%eax
03fe  1eea53e:	38 d0                	cmp    %dl,%al
0400  1eea540:	7c 08                	jl     1eea54a <mptscsih_abort+0x40a>
0402  1eea542:	84 d2                	test   %dl,%dl
0404  1eea544:	0f 85 c1 06 00 00    	jne    1eeac0b <mptscsih_abort+0xacb>
040a  1eea54a:	45 8b b7 d4 01 00 00 	mov    0x1d4(%r15),%r14d
0411  1eea551:	31 ff                	xor    %edi,%edi
0413  1eea553:	44 89 f6             	mov    %r14d,%esi
0416  1eea556:	e8 00 00 00 00       	call   1eea55b <mptscsih_abort+0x41b>	1eea557: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
041b  1eea55b:	45 85 f6             	test   %r14d,%r14d
041e  1eea55e:	0f 8e 18 05 00 00    	jle    1eeaa7c <mptscsih_abort+0x93c>
0424  1eea564:	e8 00 00 00 00       	call   1eea569 <mptscsih_abort+0x429>	1eea565: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0429  1eea569:	49 8d 87 48 13 00 00 	lea    0x1348(%r15),%rax
0430  1eea570:	48 89 c2             	mov    %rax,%rdx
0433  1eea573:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0438  1eea578:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0442  1eea582:	48 c1 ea 03          	shr    $0x3,%rdx
0446  1eea586:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
044a  1eea58a:	0f 85 88 06 00 00    	jne    1eeac18 <mptscsih_abort+0xad8>
0450  1eea590:	4d 8b a7 48 13 00 00 	mov    0x1348(%r15),%r12
0457  1eea597:	31 db                	xor    %ebx,%ebx
0459  1eea599:	eb 1f                	jmp    1eea5ba <mptscsih_abort+0x47a>
045b  1eea59b:	e8 00 00 00 00       	call   1eea5a0 <mptscsih_abort+0x460>	1eea59c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0460  1eea5a0:	83 c3 01             	add    $0x1,%ebx
0463  1eea5a3:	44 89 f6             	mov    %r14d,%esi
0466  1eea5a6:	49 83 c4 08          	add    $0x8,%r12
046a  1eea5aa:	89 df                	mov    %ebx,%edi
046c  1eea5ac:	e8 00 00 00 00       	call   1eea5b1 <mptscsih_abort+0x471>	1eea5ad: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0471  1eea5b1:	44 39 f3             	cmp    %r14d,%ebx
0474  1eea5b4:	0f 84 c2 04 00 00    	je     1eeaa7c <mptscsih_abort+0x93c>
047a  1eea5ba:	e8 00 00 00 00       	call   1eea5bf <mptscsih_abort+0x47f>	1eea5bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
047f  1eea5bf:	4c 89 e0             	mov    %r12,%rax
0482  1eea5c2:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
048c  1eea5cc:	48 c1 e8 03          	shr    $0x3,%rax
0490  1eea5d0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0494  1eea5d4:	0f 85 ca 05 00 00    	jne    1eeaba4 <mptscsih_abort+0xa64>
049a  1eea5da:	49 3b 2c 24          	cmp    (%r12),%rbp
049e  1eea5de:	75 bb                	jne    1eea59b <mptscsih_abort+0x45b>
04a0  1eea5e0:	e8 00 00 00 00       	call   1eea5e5 <mptscsih_abort+0x4a5>	1eea5e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04a5  1eea5e5:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
04aa  1eea5ea:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
04af  1eea5ef:	e8 00 00 00 00       	call   1eea5f4 <mptscsih_abort+0x4b4>	1eea5f0: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
04b4  1eea5f4:	31 ff                	xor    %edi,%edi
04b6  1eea5f6:	89 de                	mov    %ebx,%esi
04b8  1eea5f8:	e8 00 00 00 00       	call   1eea5fd <mptscsih_abort+0x4bd>	1eea5f9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
04bd  1eea5fd:	e8 00 00 00 00       	call   1eea602 <mptscsih_abort+0x4c2>	1eea5fe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04c2  1eea602:	49 8d bf 40 13 00 00 	lea    0x1340(%r15),%rdi
04c9  1eea609:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
04d3  1eea613:	48 89 fa             	mov    %rdi,%rdx
04d6  1eea616:	48 c1 ea 03          	shr    $0x3,%rdx
04da  1eea61a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
04de  1eea61e:	0f 85 1e 06 00 00    	jne    1eeac42 <mptscsih_abort+0xb02>
04e4  1eea624:	4d 8b a7 40 13 00 00 	mov    0x1340(%r15),%r12
04eb  1eea62b:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
04f2  1eea632:	4c 89 e6             	mov    %r12,%rsi
04f5  1eea635:	e8 00 00 00 00       	call   1eea63a <mptscsih_abort+0x4fa>	1eea636: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04fa  1eea63a:	49 83 fc ff          	cmp    $0xffffffffffffffff,%r12
04fe  1eea63e:	74 10                	je     1eea650 <mptscsih_abort+0x510>
0500  1eea640:	e8 00 00 00 00       	call   1eea645 <mptscsih_abort+0x505>	1eea641: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0505  1eea645:	49 83 c4 01          	add    $0x1,%r12
0509  1eea649:	4d 89 a7 40 13 00 00 	mov    %r12,0x1340(%r15)
0510  1eea650:	e8 00 00 00 00       	call   1eea655 <mptscsih_abort+0x515>	1eea651: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0515  1eea655:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1eea658: R_X86_64_32S	mpt_fwfault_debug
051c  1eea65c:	48 ba 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rdx
0526  1eea666:	48 89 c1             	mov    %rax,%rcx
0529  1eea669:	83 e0 07             	and    $0x7,%eax
052c  1eea66c:	48 c1 e9 03          	shr    $0x3,%rcx
0530  1eea670:	83 c0 03             	add    $0x3,%eax
0533  1eea673:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
0537  1eea677:	38 d0                	cmp    %dl,%al
0539  1eea679:	7c 08                	jl     1eea683 <mptscsih_abort+0x543>
053b  1eea67b:	84 d2                	test   %dl,%dl
053d  1eea67d:	0f 85 ae 05 00 00    	jne    1eeac31 <mptscsih_abort+0xaf1>
0543  1eea683:	44 8b 25 00 00 00 00 	mov    0x0(%rip),%r12d        # 1eea68a <mptscsih_abort+0x54a>	1eea686: R_X86_64_PC32	mpt_fwfault_debug-0x4
054a  1eea68a:	31 ff                	xor    %edi,%edi
054c  1eea68c:	44 89 e6             	mov    %r12d,%esi
054f  1eea68f:	e8 00 00 00 00       	call   1eea694 <mptscsih_abort+0x554>	1eea690: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0554  1eea694:	45 85 e4             	test   %r12d,%r12d
0557  1eea697:	0f 85 d8 04 00 00    	jne    1eeab75 <mptscsih_abort+0xa35>
055d  1eea69d:	e8 00 00 00 00       	call   1eea6a2 <mptscsih_abort+0x562>	1eea69e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0562  1eea6a2:	49 8d bf c8 01 00 00 	lea    0x1c8(%r15),%rdi
0569  1eea6a9:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0573  1eea6b3:	48 89 fa             	mov    %rdi,%rdx
0576  1eea6b6:	48 c1 ea 03          	shr    $0x3,%rdx
057a  1eea6ba:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
057e  1eea6be:	0f 85 d4 05 00 00    	jne    1eeac98 <mptscsih_abort+0xb58>
0584  1eea6c4:	49 8d bf d8 01 00 00 	lea    0x1d8(%r15),%rdi
058b  1eea6cb:	4d 8b a7 c8 01 00 00 	mov    0x1c8(%r15),%r12
0592  1eea6d2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
059c  1eea6dc:	48 89 fa             	mov    %rdi,%rdx
059f  1eea6df:	48 c1 ea 03          	shr    $0x3,%rdx
05a3  1eea6e3:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
05a7  1eea6e7:	84 c0                	test   %al,%al
05a9  1eea6e9:	74 08                	je     1eea6f3 <mptscsih_abort+0x5b3>
05ab  1eea6eb:	3c 03                	cmp    $0x3,%al
05ad  1eea6ed:	0f 8e b9 05 00 00    	jle    1eeacac <mptscsih_abort+0xb6c>
05b3  1eea6f3:	41 8b 87 d8 01 00 00 	mov    0x1d8(%r15),%eax
05ba  1eea6fa:	0f af c3             	imul   %ebx,%eax
05bd  1eea6fd:	48 98                	cltq
05bf  1eea6ff:	49 01 c4             	add    %rax,%r12
05c2  1eea702:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05cc  1eea70c:	49 8d 7c 24 08       	lea    0x8(%r12),%rdi
05d1  1eea711:	48 89 fa             	mov    %rdi,%rdx
05d4  1eea714:	48 c1 ea 03          	shr    $0x3,%rdx
05d8  1eea718:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
05dc  1eea71c:	84 c0                	test   %al,%al
05de  1eea71e:	74 08                	je     1eea728 <mptscsih_abort+0x5e8>
05e0  1eea720:	3c 03                	cmp    $0x3,%al
05e2  1eea722:	0f 8e 7a 05 00 00    	jle    1eeaca2 <mptscsih_abort+0xb62>
05e8  1eea728:	49 8d bf e0 00 00 00 	lea    0xe0(%r15),%rdi
05ef  1eea72f:	45 8b 64 24 08       	mov    0x8(%r12),%r12d
05f4  1eea734:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05fe  1eea73e:	48 89 fa             	mov    %rdi,%rdx
0601  1eea741:	48 c1 ea 03          	shr    $0x3,%rdx
0605  1eea745:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0609  1eea749:	84 c0                	test   %al,%al
060b  1eea74b:	74 06                	je     1eea753 <mptscsih_abort+0x613>
060d  1eea74d:	0f 8e 98 05 00 00    	jle    1eeaceb <mptscsih_abort+0xbab>
0613  1eea753:	41 0f b6 bf e0 00 00 00 	movzbl 0xe0(%r15),%edi
061b  1eea75b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	1eea75e: R_X86_64_32S	.rodata+0x746500
0622  1eea762:	41 be 28 00 00 00    	mov    $0x28,%r14d
0628  1eea768:	40 88 7c 24 18       	mov    %dil,0x18(%rsp)
062d  1eea76d:	e8 00 00 00 00       	call   1eea772 <mptscsih_abort+0x632>	1eea76e: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
0632  1eea772:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
0637  1eea777:	84 c0                	test   %al,%al
0639  1eea779:	74 11                	je     1eea78c <mptscsih_abort+0x64c>
063b  1eea77b:	3c 02                	cmp    $0x2,%al
063d  1eea77d:	41 be 0a 00 00 00    	mov    $0xa,%r14d
0643  1eea783:	b8 1e 00 00 00       	mov    $0x1e,%eax
0648  1eea788:	4c 0f 44 f0          	cmove  %rax,%r14
064c  1eea78c:	e8 00 00 00 00       	call   1eea791 <mptscsih_abort+0x651>	1eea78d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0651  1eea791:	49 8d 7d 10          	lea    0x10(%r13),%rdi
0655  1eea795:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
065f  1eea79f:	48 89 fa             	mov    %rdi,%rdx
0662  1eea7a2:	48 c1 ea 03          	shr    $0x3,%rdx
0666  1eea7a6:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
066a  1eea7aa:	0f 85 31 05 00 00    	jne    1eeace1 <mptscsih_abort+0xba1>
0670  1eea7b0:	4c 89 ea             	mov    %r13,%rdx
0673  1eea7b3:	4d 8b 45 10          	mov    0x10(%r13),%r8
0677  1eea7b7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0681  1eea7c1:	48 c1 ea 03          	shr    $0x3,%rdx
0685  1eea7c5:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
0689  1eea7c9:	0f 85 fb 04 00 00    	jne    1eeacca <mptscsih_abort+0xb8a>
068f  1eea7cf:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0699  1eea7d9:	4d 8b 6d 00          	mov    0x0(%r13),%r13
069d  1eea7dd:	49 8d 7d 0a          	lea    0xa(%r13),%rdi
06a1  1eea7e1:	48 89 fa             	mov    %rdi,%rdx
06a4  1eea7e4:	48 c1 ea 03          	shr    $0x3,%rdx
06a8  1eea7e8:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
06ac  1eea7ec:	48 89 fa             	mov    %rdi,%rdx
06af  1eea7ef:	83 e2 07             	and    $0x7,%edx
06b2  1eea7f2:	38 d0                	cmp    %dl,%al
06b4  1eea7f4:	7f 08                	jg     1eea7fe <mptscsih_abort+0x6be>
06b6  1eea7f6:	84 c0                	test   %al,%al
06b8  1eea7f8:	0f 85 b8 04 00 00    	jne    1eeacb6 <mptscsih_abort+0xb76>
06be  1eea7fe:	49 8d 7d 0b          	lea    0xb(%r13),%rdi
06c2  1eea802:	41 0f b6 4d 0a       	movzbl 0xa(%r13),%ecx
06c7  1eea807:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
06d1  1eea811:	48 89 fa             	mov    %rdi,%rdx
06d4  1eea814:	48 c1 ea 03          	shr    $0x3,%rdx
06d8  1eea818:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
06dc  1eea81c:	48 89 fa             	mov    %rdi,%rdx
06df  1eea81f:	83 e2 07             	and    $0x7,%edx
06e2  1eea822:	38 d0                	cmp    %dl,%al
06e4  1eea824:	7f 08                	jg     1eea82e <mptscsih_abort+0x6ee>
06e6  1eea826:	84 c0                	test   %al,%al
06e8  1eea828:	0f 85 44 04 00 00    	jne    1eeac72 <mptscsih_abort+0xb32>
06ee  1eea82e:	41 0f b6 55 0b       	movzbl 0xb(%r13),%edx
06f3  1eea833:	41 56                	push   %r14
06f5  1eea835:	be 01 00 00 00       	mov    $0x1,%esi
06fa  1eea83a:	45 89 e1             	mov    %r12d,%r9d
06fd  1eea83d:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0702  1eea842:	e8 00 00 00 00       	call   1eea847 <mptscsih_abort+0x707>	1eea843: R_X86_64_PLT32	mptscsih_IssueTaskMgmt-0x4
0707  1eea847:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
070c  1eea84c:	e8 00 00 00 00       	call   1eea851 <mptscsih_abort+0x711>	1eea84d: R_X86_64_PLT32	_raw_spin_lock_irqsave-0x4
0711  1eea851:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
0716  1eea856:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
071b  1eea85b:	59                   	pop    %rcx
071c  1eea85c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0726  1eea866:	48 89 f2             	mov    %rsi,%rdx
0729  1eea869:	48 c1 ea 03          	shr    $0x3,%rdx
072d  1eea86d:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
0731  1eea871:	48 89 f0             	mov    %rsi,%rax
0734  1eea874:	83 e0 07             	and    $0x7,%eax
0737  1eea877:	83 c0 03             	add    $0x3,%eax
073a  1eea87a:	38 d0                	cmp    %dl,%al
073c  1eea87c:	7c 08                	jl     1eea886 <mptscsih_abort+0x746>
073e  1eea87e:	84 d2                	test   %dl,%dl
0740  1eea880:	0f 85 df 03 00 00    	jne    1eeac65 <mptscsih_abort+0xb25>
0746  1eea886:	45 8b b7 d4 01 00 00 	mov    0x1d4(%r15),%r14d
074d  1eea88d:	31 ff                	xor    %edi,%edi
074f  1eea88f:	44 89 f6             	mov    %r14d,%esi
0752  1eea892:	e8 00 00 00 00       	call   1eea897 <mptscsih_abort+0x757>	1eea893: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0757  1eea897:	45 85 f6             	test   %r14d,%r14d
075a  1eea89a:	0f 8e 11 01 00 00    	jle    1eea9b1 <mptscsih_abort+0x871>
0760  1eea8a0:	e8 00 00 00 00       	call   1eea8a5 <mptscsih_abort+0x765>	1eea8a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0765  1eea8a5:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
076a  1eea8aa:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0774  1eea8b4:	48 c1 ea 03          	shr    $0x3,%rdx
0778  1eea8b8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
077c  1eea8bc:	0f 85 8a 03 00 00    	jne    1eeac4c <mptscsih_abort+0xb0c>
0782  1eea8c2:	4d 8b a7 48 13 00 00 	mov    0x1348(%r15),%r12
0789  1eea8c9:	45 31 ed             	xor    %r13d,%r13d
078c  1eea8cc:	eb 21                	jmp    1eea8ef <mptscsih_abort+0x7af>
078e  1eea8ce:	e8 00 00 00 00       	call   1eea8d3 <mptscsih_abort+0x793>	1eea8cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0793  1eea8d3:	41 83 c5 01          	add    $0x1,%r13d
0797  1eea8d7:	44 89 f6             	mov    %r14d,%esi
079a  1eea8da:	49 83 c4 08          	add    $0x8,%r12
079e  1eea8de:	44 89 ef             	mov    %r13d,%edi
07a1  1eea8e1:	e8 00 00 00 00       	call   1eea8e6 <mptscsih_abort+0x7a6>	1eea8e2: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
07a6  1eea8e6:	45 39 f5             	cmp    %r14d,%r13d
07a9  1eea8e9:	0f 84 c2 00 00 00    	je     1eea9b1 <mptscsih_abort+0x871>
07af  1eea8ef:	e8 00 00 00 00       	call   1eea8f4 <mptscsih_abort+0x7b4>	1eea8f0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07b4  1eea8f4:	4c 89 e0             	mov    %r12,%rax
07b7  1eea8f7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
07c1  1eea901:	48 c1 e8 03          	shr    $0x3,%rax
07c5  1eea905:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
07c9  1eea909:	0f 85 bc 02 00 00    	jne    1eeabcb <mptscsih_abort+0xa8b>
07cf  1eea90f:	49 3b 2c 24          	cmp    (%r12),%rbp
07d3  1eea913:	75 b9                	jne    1eea8ce <mptscsih_abort+0x78e>
07d5  1eea915:	e8 00 00 00 00       	call   1eea91a <mptscsih_abort+0x7da>	1eea916: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07da  1eea91a:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
07df  1eea91f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
07e4  1eea924:	e8 00 00 00 00       	call   1eea929 <mptscsih_abort+0x7e9>	1eea925: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
07e9  1eea929:	89 de                	mov    %ebx,%esi
07eb  1eea92b:	44 89 ef             	mov    %r13d,%edi
07ee  1eea92e:	e8 00 00 00 00       	call   1eea933 <mptscsih_abort+0x7f3>	1eea92f: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
07f3  1eea933:	41 39 dd             	cmp    %ebx,%r13d
07f6  1eea936:	0f 85 89 00 00 00    	jne    1eea9c5 <mptscsih_abort+0x885>
07fc  1eea93c:	e8 00 00 00 00       	call   1eea941 <mptscsih_abort+0x801>	1eea93d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0801  1eea941:	49 8d bf c8 00 00 00 	lea    0xc8(%r15),%rdi
0808  1eea948:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0812  1eea952:	48 89 fa             	mov    %rdi,%rdx
0815  1eea955:	48 c1 ea 03          	shr    $0x3,%rdx
0819  1eea959:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
081d  1eea95d:	84 c0                	test   %al,%al
081f  1eea95f:	74 08                	je     1eea969 <mptscsih_abort+0x829>
0821  1eea961:	3c 03                	cmp    $0x3,%al
0823  1eea963:	0f 8e 25 03 00 00    	jle    1eeac8e <mptscsih_abort+0xb4e>
0829  1eea969:	41 8b 9f c8 00 00 00 	mov    0xc8(%r15),%ebx
0830  1eea970:	31 ff                	xor    %edi,%edi
0832  1eea972:	41 bc 03 20 00 00    	mov    $0x2003,%r12d
0838  1eea978:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	1eea97b: R_X86_64_32S	.rodata+0x744e80
083f  1eea97f:	81 e3 00 01 00 00    	and    $0x100,%ebx
0845  1eea985:	89 de                	mov    %ebx,%esi
0847  1eea987:	e8 00 00 00 00       	call   1eea98c <mptscsih_abort+0x84c>	1eea988: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
084c  1eea98c:	85 db                	test   %ebx,%ebx
084e  1eea98e:	0f 84 f5 f9 ff ff    	je     1eea389 <mptscsih_abort+0x249>
0854  1eea994:	e8 00 00 00 00       	call   1eea999 <mptscsih_abort+0x859>	1eea995: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0859  1eea999:	48 8b 34 24          	mov    (%rsp),%rsi
085d  1eea99d:	48 89 ea             	mov    %rbp,%rdx
0860  1eea9a0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eea9a3: R_X86_64_32S	.rodata+0x7463a0
0867  1eea9a7:	e8 00 00 00 00       	call   1eea9ac <mptscsih_abort+0x86c>	1eea9a8: R_X86_64_PLT32	_printk-0x4
086c  1eea9ac:	e9 d8 f9 ff ff       	jmp    1eea389 <mptscsih_abort+0x249>
0871  1eea9b1:	e8 00 00 00 00       	call   1eea9b6 <mptscsih_abort+0x876>	1eea9b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0876  1eea9b6:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
087b  1eea9bb:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0880  1eea9c0:	e8 00 00 00 00       	call   1eea9c5 <mptscsih_abort+0x885>	1eea9c1: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0885  1eea9c5:	e8 00 00 00 00       	call   1eea9ca <mptscsih_abort+0x88a>	1eea9c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
088a  1eea9ca:	49 8d bf c8 00 00 00 	lea    0xc8(%r15),%rdi
0891  1eea9d1:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
089b  1eea9db:	48 89 fa             	mov    %rdi,%rdx
089e  1eea9de:	48 c1 ea 03          	shr    $0x3,%rdx
08a2  1eea9e2:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
08a6  1eea9e6:	84 c0                	test   %al,%al
08a8  1eea9e8:	74 09                	je     1eea9f3 <mptscsih_abort+0x8b3>
08aa  1eea9ea:	3c 03                	cmp    $0x3,%al
08ac  1eea9ec:	7f 05                	jg     1eea9f3 <mptscsih_abort+0x8b3>
08ae  1eea9ee:	e8 00 00 00 00       	call   1eea9f3 <mptscsih_abort+0x8b3>	1eea9ef: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
08b3  1eea9f3:	41 8b 9f c8 00 00 00 	mov    0xc8(%r15),%ebx
08ba  1eea9fa:	31 ff                	xor    %edi,%edi
08bc  1eea9fc:	81 e3 00 01 00 00    	and    $0x100,%ebx
08c2  1eeaa02:	89 de                	mov    %ebx,%esi
08c4  1eeaa04:	e8 00 00 00 00       	call   1eeaa09 <mptscsih_abort+0x8c9>	1eeaa05: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08c9  1eeaa09:	85 db                	test   %ebx,%ebx
08cb  1eeaa0b:	0f 85 76 01 00 00    	jne    1eeab87 <mptscsih_abort+0xa47>
08d1  1eeaa11:	41 bc 02 20 00 00    	mov    $0x2002,%r12d
08d7  1eeaa17:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	1eeaa1a: R_X86_64_32S	.rodata+0x744de0
08de  1eeaa1e:	e9 66 f9 ff ff       	jmp    1eea389 <mptscsih_abort+0x249>
08e3  1eeaa23:	e8 00 00 00 00       	call   1eeaa28 <mptscsih_abort+0x8e8>	1eeaa24: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08e8  1eeaa28:	48 8d bd 70 01 00 00 	lea    0x170(%rbp),%rdi
08ef  1eeaa2f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
08f9  1eeaa39:	48 89 fa             	mov    %rdi,%rdx
08fc  1eeaa3c:	48 c1 ea 03          	shr    $0x3,%rdx
0900  1eeaa40:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0904  1eeaa44:	84 c0                	test   %al,%al
0906  1eeaa46:	74 08                	je     1eeaa50 <mptscsih_abort+0x910>
0908  1eeaa48:	3c 03                	cmp    $0x3,%al
090a  1eeaa4a:	0f 8e 0b 02 00 00    	jle    1eeac5b <mptscsih_abort+0xb1b>
0910  1eeaa50:	c7 85 70 01 00 00 00 00 08 00 	movl   $0x80000,0x170(%rbp)
091a  1eeaa5a:	48 89 ef             	mov    %rbp,%rdi
091d  1eeaa5d:	41 bc 03 20 00 00    	mov    $0x2003,%r12d
0923  1eeaa63:	e8 00 00 00 00       	call   1eeaa68 <mptscsih_abort+0x928>	1eeaa64: R_X86_64_PLT32	scsi_done-0x4
0928  1eeaa68:	48 89 ee             	mov    %rbp,%rsi
092b  1eeaa6b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eeaa6e: R_X86_64_32S	.rodata+0x746140
0932  1eeaa72:	e8 00 00 00 00       	call   1eeaa77 <mptscsih_abort+0x937>	1eeaa73: R_X86_64_PLT32	_printk-0x4
0937  1eeaa77:	e9 2b f9 ff ff       	jmp    1eea3a7 <mptscsih_abort+0x267>
093c  1eeaa7c:	e8 00 00 00 00       	call   1eeaa81 <mptscsih_abort+0x941>	1eeaa7d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0941  1eeaa81:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0946  1eeaa86:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
094b  1eeaa8b:	e8 00 00 00 00       	call   1eeaa90 <mptscsih_abort+0x950>	1eeaa8c: R_X86_64_PLT32	_raw_spin_unlock_irqrestore-0x4
0950  1eeaa90:	e8 00 00 00 00       	call   1eeaa95 <mptscsih_abort+0x955>	1eeaa91: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0955  1eeaa95:	48 8d bd 70 01 00 00 	lea    0x170(%rbp),%rdi
095c  1eeaa9c:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0966  1eeaaa6:	48 89 fa             	mov    %rdi,%rdx
0969  1eeaaa9:	48 c1 ea 03          	shr    $0x3,%rdx
096d  1eeaaad:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
0971  1eeaab1:	84 c0                	test   %al,%al
0973  1eeaab3:	74 09                	je     1eeaabe <mptscsih_abort+0x97e>
0975  1eeaab5:	3c 03                	cmp    $0x3,%al
0977  1eeaab7:	7f 05                	jg     1eeaabe <mptscsih_abort+0x97e>
0979  1eeaab9:	e8 00 00 00 00       	call   1eeaabe <mptscsih_abort+0x97e>	1eeaaba: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
097e  1eeaabe:	49 8d bf c8 00 00 00 	lea    0xc8(%r15),%rdi
0985  1eeaac5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
098f  1eeaacf:	c7 85 70 01 00 00 00 00 08 00 	movl   $0x80000,0x170(%rbp)
0999  1eeaad9:	48 89 fa             	mov    %rdi,%rdx
099c  1eeaadc:	48 c1 ea 03          	shr    $0x3,%rdx
09a0  1eeaae0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
09a4  1eeaae4:	84 c0                	test   %al,%al
09a6  1eeaae6:	74 09                	je     1eeaaf1 <mptscsih_abort+0x9b1>
09a8  1eeaae8:	3c 03                	cmp    $0x3,%al
09aa  1eeaaea:	7f 05                	jg     1eeaaf1 <mptscsih_abort+0x9b1>
09ac  1eeaaec:	e8 00 00 00 00       	call   1eeaaf1 <mptscsih_abort+0x9b1>	1eeaaed: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
09b1  1eeaaf1:	41 8b 9f c8 00 00 00 	mov    0xc8(%r15),%ebx
09b8  1eeaaf8:	31 ff                	xor    %edi,%edi
09ba  1eeaafa:	81 e3 00 01 00 00    	and    $0x100,%ebx
09c0  1eeab00:	89 de                	mov    %ebx,%esi
09c2  1eeab02:	e8 00 00 00 00       	call   1eeab07 <mptscsih_abort+0x9c7>	1eeab03: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09c7  1eeab07:	85 db                	test   %ebx,%ebx
09c9  1eeab09:	0f 84 02 ff ff ff    	je     1eeaa11 <mptscsih_abort+0x8d1>
09cf  1eeab0f:	e8 00 00 00 00       	call   1eeab14 <mptscsih_abort+0x9d4>	1eeab10: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09d4  1eeab14:	48 8b 34 24          	mov    (%rsp),%rsi
09d8  1eeab18:	48 89 ea             	mov    %rbp,%rdx
09db  1eeab1b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eeab1e: R_X86_64_32S	.rodata+0x746320
09e2  1eeab22:	41 bc 02 20 00 00    	mov    $0x2002,%r12d
09e8  1eeab28:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	1eeab2b: R_X86_64_32S	.rodata+0x744de0
09ef  1eeab2f:	e8 00 00 00 00       	call   1eeab34 <mptscsih_abort+0x9f4>	1eeab30: R_X86_64_PLT32	_printk-0x4
09f4  1eeab34:	e9 50 f8 ff ff       	jmp    1eea389 <mptscsih_abort+0x249>
09f9  1eeab39:	e8 00 00 00 00       	call   1eeab3e <mptscsih_abort+0x9fe>	1eeab3a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
09fe  1eeab3e:	e9 5e f7 ff ff       	jmp    1eea2a1 <mptscsih_abort+0x161>
0a03  1eeab43:	e8 00 00 00 00       	call   1eeab48 <mptscsih_abort+0xa08>	1eeab44: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a08  1eeab48:	e9 da f7 ff ff       	jmp    1eea327 <mptscsih_abort+0x1e7>
0a0d  1eeab4d:	e8 00 00 00 00       	call   1eeab52 <mptscsih_abort+0xa12>	1eeab4e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a12  1eeab52:	e9 95 f8 ff ff       	jmp    1eea3ec <mptscsih_abort+0x2ac>
0a17  1eeab57:	e8 00 00 00 00       	call   1eeab5c <mptscsih_abort+0xa1c>	1eeab58: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a1c  1eeab5c:	e9 f3 f8 ff ff       	jmp    1eea454 <mptscsih_abort+0x314>
0a21  1eeab61:	e8 00 00 00 00       	call   1eeab66 <mptscsih_abort+0xa26>	1eeab62: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0a26  1eeab66:	e9 30 f9 ff ff       	jmp    1eea49b <mptscsih_abort+0x35b>
0a2b  1eeab6b:	e8 00 00 00 00       	call   1eeab70 <mptscsih_abort+0xa30>	1eeab6c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0a30  1eeab70:	e9 70 f7 ff ff       	jmp    1eea2e5 <mptscsih_abort+0x1a5>
0a35  1eeab75:	e8 00 00 00 00       	call   1eeab7a <mptscsih_abort+0xa3a>	1eeab76: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a3a  1eeab7a:	4c 89 ff             	mov    %r15,%rdi
0a3d  1eeab7d:	e8 00 00 00 00       	call   1eeab82 <mptscsih_abort+0xa42>	1eeab7e: R_X86_64_PLT32	mpt_halt_firmware-0x4
0a42  1eeab82:	e9 16 fb ff ff       	jmp    1eea69d <mptscsih_abort+0x55d>
0a47  1eeab87:	e8 00 00 00 00       	call   1eeab8c <mptscsih_abort+0xa4c>	1eeab88: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a4c  1eeab8c:	48 8b 34 24          	mov    (%rsp),%rsi
0a50  1eeab90:	48 89 ea             	mov    %rbp,%rdx
0a53  1eeab93:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eeab96: R_X86_64_32S	.rodata+0x746420
0a5a  1eeab9a:	e8 00 00 00 00       	call   1eeab9f <mptscsih_abort+0xa5f>	1eeab9b: R_X86_64_PLT32	_printk-0x4
0a5f  1eeab9f:	e9 6d fe ff ff       	jmp    1eeaa11 <mptscsih_abort+0x8d1>
0a64  1eeaba4:	4c 89 e7             	mov    %r12,%rdi
0a67  1eeaba7:	e8 00 00 00 00       	call   1eeabac <mptscsih_abort+0xa6c>	1eeaba8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a6c  1eeabac:	e9 29 fa ff ff       	jmp    1eea5da <mptscsih_abort+0x49a>
0a71  1eeabb1:	48 89 ef             	mov    %rbp,%rdi
0a74  1eeabb4:	e8 00 00 00 00       	call   1eeabb9 <mptscsih_abort+0xa79>	1eeabb5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a79  1eeabb9:	e9 bc f5 ff ff       	jmp    1eea17a <mptscsih_abort+0x3a>
0a7e  1eeabbe:	48 89 df             	mov    %rbx,%rdi
0a81  1eeabc1:	e8 00 00 00 00       	call   1eeabc6 <mptscsih_abort+0xa86>	1eeabc2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a86  1eeabc6:	e9 ce f5 ff ff       	jmp    1eea199 <mptscsih_abort+0x59>
0a8b  1eeabcb:	4c 89 e7             	mov    %r12,%rdi
0a8e  1eeabce:	e8 00 00 00 00       	call   1eeabd3 <mptscsih_abort+0xa93>	1eeabcf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a93  1eeabd3:	e9 37 fd ff ff       	jmp    1eea90f <mptscsih_abort+0x7cf>
0a98  1eeabd8:	48 89 ef             	mov    %rbp,%rdi
0a9b  1eeabdb:	e8 00 00 00 00       	call   1eeabe0 <mptscsih_abort+0xaa0>	1eeabdc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aa0  1eeabe0:	e9 31 f6 ff ff       	jmp    1eea216 <mptscsih_abort+0xd6>
0aa5  1eeabe5:	4c 89 ef             	mov    %r13,%rdi
0aa8  1eeabe8:	e8 00 00 00 00       	call   1eeabed <mptscsih_abort+0xaad>	1eeabe9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0aad  1eeabed:	e9 7a f6 ff ff       	jmp    1eea26c <mptscsih_abort+0x12c>
0ab2  1eeabf2:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0ab7  1eeabf7:	e8 00 00 00 00       	call   1eeabfc <mptscsih_abort+0xabc>	1eeabf8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0abc  1eeabfc:	e9 d1 f5 ff ff       	jmp    1eea1d2 <mptscsih_abort+0x92>
0ac1  1eeac01:	e8 00 00 00 00       	call   1eeac06 <mptscsih_abort+0xac6>	1eeac02: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ac6  1eeac06:	e9 31 f6 ff ff       	jmp    1eea23c <mptscsih_abort+0xfc>
0acb  1eeac0b:	48 89 cf             	mov    %rcx,%rdi
0ace  1eeac0e:	e8 00 00 00 00       	call   1eeac13 <mptscsih_abort+0xad3>	1eeac0f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ad3  1eeac13:	e9 32 f9 ff ff       	jmp    1eea54a <mptscsih_abort+0x40a>
0ad8  1eeac18:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0add  1eeac1d:	e8 00 00 00 00       	call   1eeac22 <mptscsih_abort+0xae2>	1eeac1e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ae2  1eeac22:	e9 69 f9 ff ff       	jmp    1eea590 <mptscsih_abort+0x450>
0ae7  1eeac27:	e8 00 00 00 00       	call   1eeac2c <mptscsih_abort+0xaec>	1eeac28: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0aec  1eeac2c:	e9 41 f7 ff ff       	jmp    1eea372 <mptscsih_abort+0x232>
0af1  1eeac31:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1eeac34: R_X86_64_32S	mpt_fwfault_debug
0af8  1eeac38:	e8 00 00 00 00       	call   1eeac3d <mptscsih_abort+0xafd>	1eeac39: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0afd  1eeac3d:	e9 41 fa ff ff       	jmp    1eea683 <mptscsih_abort+0x543>
0b02  1eeac42:	e8 00 00 00 00       	call   1eeac47 <mptscsih_abort+0xb07>	1eeac43: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b07  1eeac47:	e9 d8 f9 ff ff       	jmp    1eea624 <mptscsih_abort+0x4e4>
0b0c  1eeac4c:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0b11  1eeac51:	e8 00 00 00 00       	call   1eeac56 <mptscsih_abort+0xb16>	1eeac52: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b16  1eeac56:	e9 67 fc ff ff       	jmp    1eea8c2 <mptscsih_abort+0x782>
0b1b  1eeac5b:	e8 00 00 00 00       	call   1eeac60 <mptscsih_abort+0xb20>	1eeac5c: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0b20  1eeac60:	e9 eb fd ff ff       	jmp    1eeaa50 <mptscsih_abort+0x910>
0b25  1eeac65:	48 89 f7             	mov    %rsi,%rdi
0b28  1eeac68:	e8 00 00 00 00       	call   1eeac6d <mptscsih_abort+0xb2d>	1eeac69: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b2d  1eeac6d:	e9 14 fc ff ff       	jmp    1eea886 <mptscsih_abort+0x746>
0b32  1eeac72:	89 4c 24 34          	mov    %ecx,0x34(%rsp)
0b36  1eeac76:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0b3b  1eeac7b:	e8 00 00 00 00       	call   1eeac80 <mptscsih_abort+0xb40>	1eeac7c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b40  1eeac80:	8b 4c 24 34          	mov    0x34(%rsp),%ecx
0b44  1eeac84:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0b49  1eeac89:	e9 a0 fb ff ff       	jmp    1eea82e <mptscsih_abort+0x6ee>
0b4e  1eeac8e:	e8 00 00 00 00       	call   1eeac93 <mptscsih_abort+0xb53>	1eeac8f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b53  1eeac93:	e9 d1 fc ff ff       	jmp    1eea969 <mptscsih_abort+0x829>
0b58  1eeac98:	e8 00 00 00 00       	call   1eeac9d <mptscsih_abort+0xb5d>	1eeac99: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b5d  1eeac9d:	e9 22 fa ff ff       	jmp    1eea6c4 <mptscsih_abort+0x584>
0b62  1eeaca2:	e8 00 00 00 00       	call   1eeaca7 <mptscsih_abort+0xb67>	1eeaca3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b67  1eeaca7:	e9 7c fa ff ff       	jmp    1eea728 <mptscsih_abort+0x5e8>
0b6c  1eeacac:	e8 00 00 00 00       	call   1eeacb1 <mptscsih_abort+0xb71>	1eeacad: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b71  1eeacb1:	e9 3d fa ff ff       	jmp    1eea6f3 <mptscsih_abort+0x5b3>
0b76  1eeacb6:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0b7b  1eeacbb:	e8 00 00 00 00       	call   1eeacc0 <mptscsih_abort+0xb80>	1eeacbc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b80  1eeacc0:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0b85  1eeacc5:	e9 34 fb ff ff       	jmp    1eea7fe <mptscsih_abort+0x6be>
0b8a  1eeacca:	4c 89 ef             	mov    %r13,%rdi
0b8d  1eeaccd:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
0b92  1eeacd2:	e8 00 00 00 00       	call   1eeacd7 <mptscsih_abort+0xb97>	1eeacd3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b97  1eeacd7:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
0b9c  1eeacdc:	e9 ee fa ff ff       	jmp    1eea7cf <mptscsih_abort+0x68f>
0ba1  1eeace1:	e8 00 00 00 00       	call   1eeace6 <mptscsih_abort+0xba6>	1eeace2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ba6  1eeace6:	e9 c5 fa ff ff       	jmp    1eea7b0 <mptscsih_abort+0x670>
0bab  1eeaceb:	e8 00 00 00 00       	call   1eeacf0 <mptscsih_abort+0xbb0>	1eeacec: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0bb0  1eeacf0:	e9 5e fa ff ff       	jmp    1eea753 <mptscsih_abort+0x613>
0bb5  1eeacf5:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
