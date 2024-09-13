Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78D6BFB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228138; cv=none; b=UCHgF6VG97yrioBID3sbmGbl8LoIXWQhTg2/HVTU6OcpXH/cz5buLAdZfGhNH+sjZTDo/rD3hbLtAaRMfcP+sqerG/4egSlbmW+IS8HQcDubuN5RhxUMiNKC1trzET09TYFv7n1No20ywDq9HfkdZwFifScSEek61qK7gHF8LzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228138; c=relaxed/simple;
	bh=R5SmIz5iogiNM6tI+K/EAEKsjorygZG633ZgcR5TSdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRCJxIRft4rWsi8RyAQ1yEID31/GFREJvD+3jB4srl5evuSE+A/9CrOC+ozeqidFRjpi3XqCe8xNotET7kMm9ku7aT3iD+KslaBFywx0wfGYbYHojoxH+UI3LmBU+55g3Pe74PdoPkBpWCt+ue2KWbq6aGiT9iiFA8mMMozJb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwN5/lWD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwN5/lWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726228137; x=1757764137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R5SmIz5iogiNM6tI+K/EAEKsjorygZG633ZgcR5TSdg=;
  b=RwN5/lWDIeeJbOR84f7weLr0po/gbrpvKdrxFZHRORrL9gjbUQuybP1+
   Uk4U+TtQe8cTsWWx0kDm9c3GPGigHFq2aqZg99pUmWEWRR83S3b81WVOj
   Vm7VhPyBvf/ao8qZ98GVm3oKKis5bFcPl/MtJX2AV3L+drM7raNwyeOY/
   iULJ+T/UBTfTVu4RhL6ERplcGibpNPqjaBX0qdac7hBMF/4WJuYuAZtSt
   FvjvSZxthqrgra7MG1sV6V9jNMb+4H0G0a2xe0RqFKoXt+HeTCH2/M872
   cxSTS82YsWY5IF1XtPpIL6vdYQDhtc7Tr7kJKWrgSJF8Qb+JrlTmf+Dag
   g==;
X-CSE-ConnectionGUID: 3xq8yiWCQnqwq9eQQHSEWg==
X-CSE-MsgGUID: fv4CfseQSVmWs5gI2mjGzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28904243"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28904243"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 04:48:56 -0700
X-CSE-ConnectionGUID: xKK56DXHS3q8+HZ5bOtp+Q==
X-CSE-MsgGUID: xQLjJHziS6ezuNAgmpzoNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72617492"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 04:48:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp4nE-0006U0-0p;
	Fri, 13 Sep 2024 11:48:52 +0000
Date: Fri, 13 Sep 2024 19:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7838/23707] fs/debugfs/file.o: warning:
 objtool: full_proxy_open()+0x55a: unreachable instruction
Message-ID: <202409131958.GH1DFWnD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Drew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c46f803e3465bd0ca66716804a4d3e20f586ac0d
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [7838/23707] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-012-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131958.GH1DFWnD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131958.GH1DFWnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131958.GH1DFWnD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/debugfs/file.c:15:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/debugfs/file.o: warning: objtool: full_proxy_open()+0x55a: unreachable instruction


objdump-func vmlinux.o full_proxy_open:
0000 0000000000c15070 <full_proxy_open>:
0000   c15070:	55                   	push   %rbp
0001   c15071:	48 89 e5             	mov    %rsp,%rbp
0004   c15074:	41 57                	push   %r15
0006   c15076:	41 56                	push   %r14
0008   c15078:	41 55                	push   %r13
000a   c1507a:	41 54                	push   %r12
000c   c1507c:	53                   	push   %rbx
000d   c1507d:	48 83 ec 30          	sub    $0x30,%rsp
0011   c15081:	4c 8d 76 18          	lea    0x18(%rsi),%r14
0015   c15085:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
001f   c1508f:	49 89 f7             	mov    %rsi,%r15
0022   c15092:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
0026   c15096:	4d 89 f4             	mov    %r14,%r12
0029   c15099:	49 c1 ec 03          	shr    $0x3,%r12
002d   c1509d:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
0032   c150a2:	74 08                	je     c150ac <full_proxy_open+0x3c>
0034   c150a4:	4c 89 f7             	mov    %r14,%rdi
0037   c150a7:	e8 00 00 00 00       	call   c150ac <full_proxy_open+0x3c>	c150a8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
003c   c150ac:	49 8b 1e             	mov    (%r14),%rbx
003f   c150af:	48 89 df             	mov    %rbx,%rdi
0042   c150b2:	e8 00 00 00 00       	call   c150b7 <full_proxy_open+0x47>	c150b3: R_X86_64_PLT32	debugfs_file_get-0x4
0047   c150b7:	83 f8 fb             	cmp    $0xfffffffb,%eax
004a   c150ba:	0f 84 3d 04 00 00    	je     c154fd <full_proxy_open+0x48d>
0050   c150c0:	41 89 c5             	mov    %eax,%r13d
0053   c150c3:	85 c0                	test   %eax,%eax
0055   c150c5:	0f 85 d0 04 00 00    	jne    c1559b <full_proxy_open+0x52b>
005b   c150cb:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0065   c150d5:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
006a   c150da:	74 08                	je     c150e4 <full_proxy_open+0x74>
006c   c150dc:	4c 89 f7             	mov    %r14,%rdi
006f   c150df:	e8 00 00 00 00       	call   c150e4 <full_proxy_open+0x74>	c150e0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0074   c150e4:	41 bc f8 00 00 00    	mov    $0xf8,%r12d
007a   c150ea:	4d 03 26             	add    (%r14),%r12
007d   c150ed:	4c 89 e0             	mov    %r12,%rax
0080   c150f0:	48 c1 e8 03          	shr    $0x3,%rax
0084   c150f4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0089   c150f9:	74 08                	je     c15103 <full_proxy_open+0x93>
008b   c150fb:	4c 89 e7             	mov    %r12,%rdi
008e   c150fe:	e8 00 00 00 00       	call   c15103 <full_proxy_open+0x93>	c150ff: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0093   c15103:	4d 8b 34 24          	mov    (%r12),%r14
0097   c15107:	41 f6 c6 01          	test   $0x1,%r14b
009b   c1510b:	0f 85 28 04 00 00    	jne    c15539 <full_proxy_open+0x4c9>
00a1   c15111:	4c 89 f0             	mov    %r14,%rax
00a4   c15114:	48 c1 e8 03          	shr    $0x3,%rax
00a8   c15118:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00ad   c1511d:	74 08                	je     c15127 <full_proxy_open+0xb7>
00af   c1511f:	4c 89 f7             	mov    %r14,%rdi
00b2   c15122:	e8 00 00 00 00       	call   c15127 <full_proxy_open+0xb7>	c15123: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00b7   c15127:	4d 8b 36             	mov    (%r14),%r14
00ba   c1512a:	4d 85 f6             	test   %r14,%r14
00bd   c1512d:	0f 84 14 04 00 00    	je     c15547 <full_proxy_open+0x4d7>
00c3   c15133:	4d 89 f4             	mov    %r14,%r12
00c6   c15136:	49 c1 ec 03          	shr    $0x3,%r12
00ca   c1513a:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
00cf   c1513f:	74 08                	je     c15149 <full_proxy_open+0xd9>
00d1   c15141:	4c 89 f7             	mov    %r14,%rdi
00d4   c15144:	e8 00 00 00 00       	call   c15149 <full_proxy_open+0xd9>	c15145: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00d9   c15149:	49 8b 3e             	mov    (%r14),%rdi
00dc   c1514c:	e8 00 00 00 00       	call   c15151 <full_proxy_open+0xe1>	c1514d: R_X86_64_PLT32	try_module_get-0x4
00e1   c15151:	84 c0                	test   %al,%al
00e3   c15153:	0f 84 ee 03 00 00    	je     c15547 <full_proxy_open+0x4d7>
00e9   c15159:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	c1515c: R_X86_64_32S	kmalloc_caches+0x48
00f0   c15160:	48 c1 e8 03          	shr    $0x3,%rax
00f4   c15164:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00f9   c15169:	74 0c                	je     c15177 <full_proxy_open+0x107>
00fb   c1516b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c1516e: R_X86_64_32S	kmalloc_caches+0x48
0102   c15172:	e8 00 00 00 00       	call   c15177 <full_proxy_open+0x107>	c15173: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0107   c15177:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # c1517e <full_proxy_open+0x10e>	c1517a: R_X86_64_PC32	kmalloc_caches+0x44
010e   c1517e:	ba 20 01 00 00       	mov    $0x120,%edx
0113   c15183:	be c0 80 60 00       	mov    $0x6080c0,%esi
0118   c15188:	e8 00 00 00 00       	call   c1518d <full_proxy_open+0x11d>	c15189: R_X86_64_PLT32	kmem_cache_alloc_trace-0x4
011d   c1518d:	48 85 c0             	test   %rax,%rax
0120   c15190:	0f 84 72 03 00 00    	je     c15508 <full_proxy_open+0x498>
0126   c15196:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
012a   c1519a:	4c 8d 60 78          	lea    0x78(%rax),%r12
012e   c1519e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
0132   c151a2:	4c 89 e0             	mov    %r12,%rax
0135   c151a5:	48 c1 e8 03          	shr    $0x3,%rax
0139   c151a9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
013e   c151ae:	74 08                	je     c151b8 <full_proxy_open+0x148>
0140   c151b0:	4c 89 e7             	mov    %r12,%rdi
0143   c151b3:	e8 00 00 00 00       	call   c151b8 <full_proxy_open+0x148>	c151b4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0148   c151b8:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)	c151bc: R_X86_64_32S	.text+0xc160d0
0150   c151c0:	4d 8d 66 08          	lea    0x8(%r14),%r12
0154   c151c4:	4c 89 e0             	mov    %r12,%rax
0157   c151c7:	48 c1 e8 03          	shr    $0x3,%rax
015b   c151cb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0160   c151d0:	74 08                	je     c151da <full_proxy_open+0x16a>
0162   c151d2:	4c 89 e7             	mov    %r12,%rdi
0165   c151d5:	e8 00 00 00 00       	call   c151da <full_proxy_open+0x16a>	c151d6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
016a   c151da:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
016f   c151df:	74 26                	je     c15207 <full_proxy_open+0x197>
0171   c151e1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
0175   c151e5:	4c 8d 60 08          	lea    0x8(%rax),%r12
0179   c151e9:	4c 89 e0             	mov    %r12,%rax
017c   c151ec:	48 c1 e8 03          	shr    $0x3,%rax
0180   c151f0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0185   c151f5:	74 08                	je     c151ff <full_proxy_open+0x18f>
0187   c151f7:	4c 89 e7             	mov    %r12,%rdi
018a   c151fa:	e8 00 00 00 00       	call   c151ff <full_proxy_open+0x18f>	c151fb: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
018f   c151ff:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)	c15203: R_X86_64_32S	.text+0xc16320
0197   c15207:	4d 8d 66 10          	lea    0x10(%r14),%r12
019b   c1520b:	4c 89 e0             	mov    %r12,%rax
019e   c1520e:	48 c1 e8 03          	shr    $0x3,%rax
01a2   c15212:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
01a7   c15217:	74 08                	je     c15221 <full_proxy_open+0x1b1>
01a9   c15219:	4c 89 e7             	mov    %r12,%rdi
01ac   c1521c:	e8 00 00 00 00       	call   c15221 <full_proxy_open+0x1b1>	c1521d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01b1   c15221:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
01b6   c15226:	74 26                	je     c1524e <full_proxy_open+0x1de>
01b8   c15228:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
01bc   c1522c:	4c 8d 60 10          	lea    0x10(%rax),%r12
01c0   c15230:	4c 89 e0             	mov    %r12,%rax
01c3   c15233:	48 c1 e8 03          	shr    $0x3,%rax
01c7   c15237:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
01cc   c1523c:	74 08                	je     c15246 <full_proxy_open+0x1d6>
01ce   c1523e:	4c 89 e7             	mov    %r12,%rdi
01d1   c15241:	e8 00 00 00 00       	call   c15246 <full_proxy_open+0x1d6>	c15242: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
01d6   c15246:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)	c1524a: R_X86_64_32S	.text+0xc16470
01de   c1524e:	4d 8d 66 18          	lea    0x18(%r14),%r12
01e2   c15252:	4c 89 e0             	mov    %r12,%rax
01e5   c15255:	48 c1 e8 03          	shr    $0x3,%rax
01e9   c15259:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
01ee   c1525e:	74 08                	je     c15268 <full_proxy_open+0x1f8>
01f0   c15260:	4c 89 e7             	mov    %r12,%rdi
01f3   c15263:	e8 00 00 00 00       	call   c15268 <full_proxy_open+0x1f8>	c15264: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01f8   c15268:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
01fd   c1526d:	74 26                	je     c15295 <full_proxy_open+0x225>
01ff   c1526f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
0203   c15273:	4c 8d 60 18          	lea    0x18(%rax),%r12
0207   c15277:	4c 89 e0             	mov    %r12,%rax
020a   c1527a:	48 c1 e8 03          	shr    $0x3,%rax
020e   c1527e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0213   c15283:	74 08                	je     c1528d <full_proxy_open+0x21d>
0215   c15285:	4c 89 e7             	mov    %r12,%rdi
0218   c15288:	e8 00 00 00 00       	call   c1528d <full_proxy_open+0x21d>	c15289: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
021d   c1528d:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)	c15291: R_X86_64_32S	.text+0xc165c0
0225   c15295:	4d 8d 66 40          	lea    0x40(%r14),%r12
0229   c15299:	4c 89 e0             	mov    %r12,%rax
022c   c1529c:	48 c1 e8 03          	shr    $0x3,%rax
0230   c152a0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0235   c152a5:	74 08                	je     c152af <full_proxy_open+0x23f>
0237   c152a7:	4c 89 e7             	mov    %r12,%rdi
023a   c152aa:	e8 00 00 00 00       	call   c152af <full_proxy_open+0x23f>	c152ab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
023f   c152af:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
0244   c152b4:	74 26                	je     c152dc <full_proxy_open+0x26c>
0246   c152b6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
024a   c152ba:	4c 8d 60 40          	lea    0x40(%rax),%r12
024e   c152be:	4c 89 e0             	mov    %r12,%rax
0251   c152c1:	48 c1 e8 03          	shr    $0x3,%rax
0255   c152c5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
025a   c152ca:	74 08                	je     c152d4 <full_proxy_open+0x264>
025c   c152cc:	4c 89 e7             	mov    %r12,%rdi
025f   c152cf:	e8 00 00 00 00       	call   c152d4 <full_proxy_open+0x264>	c152d0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0264   c152d4:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)	c152d8: R_X86_64_32S	.text+0xc16710
026c   c152dc:	4d 8d 66 48          	lea    0x48(%r14),%r12
0270   c152e0:	4c 89 e0             	mov    %r12,%rax
0273   c152e3:	48 c1 e8 03          	shr    $0x3,%rax
0277   c152e7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
027c   c152ec:	74 08                	je     c152f6 <full_proxy_open+0x286>
027e   c152ee:	4c 89 e7             	mov    %r12,%rdi
0281   c152f1:	e8 00 00 00 00       	call   c152f6 <full_proxy_open+0x286>	c152f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0286   c152f6:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
028b   c152fb:	74 26                	je     c15323 <full_proxy_open+0x2b3>
028d   c152fd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
0291   c15301:	4c 8d 60 48          	lea    0x48(%rax),%r12
0295   c15305:	4c 89 e0             	mov    %r12,%rax
0298   c15308:	48 c1 e8 03          	shr    $0x3,%rax
029c   c1530c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
02a1   c15311:	74 08                	je     c1531b <full_proxy_open+0x2ab>
02a3   c15313:	4c 89 e7             	mov    %r12,%rdi
02a6   c15316:	e8 00 00 00 00       	call   c1531b <full_proxy_open+0x2ab>	c15317: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
02ab   c1531b:	49 c7 04 24 00 00 00 00 	movq   $0x0,(%r12)	c1531f: R_X86_64_32S	.text+0xc16850
02b3   c15323:	4d 8d 67 28          	lea    0x28(%r15),%r12
02b7   c15327:	4c 89 e0             	mov    %r12,%rax
02ba   c1532a:	48 c1 e8 03          	shr    $0x3,%rax
02be   c1532e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
02c3   c15333:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
02c7   c15337:	74 08                	je     c15341 <full_proxy_open+0x2d1>
02c9   c15339:	4c 89 e7             	mov    %r12,%rdi
02cc   c1533c:	e8 00 00 00 00       	call   c15341 <full_proxy_open+0x2d1>	c1533d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02d1   c15341:	49 83 3c 24 00       	cmpq   $0x0,(%r12)
02d6   c15346:	4c 89 65 c0          	mov    %r12,-0x40(%rbp)
02da   c1534a:	74 3a                	je     c15386 <full_proxy_open+0x316>
02dc   c1534c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
02e0   c15350:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
02e5   c15355:	74 08                	je     c1535f <full_proxy_open+0x2ef>
02e7   c15357:	4c 89 e7             	mov    %r12,%rdi
02ea   c1535a:	e8 00 00 00 00       	call   c1535f <full_proxy_open+0x2ef>	c1535b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02ef   c1535f:	4d 8b 24 24          	mov    (%r12),%r12
02f3   c15363:	4c 89 e0             	mov    %r12,%rax
02f6   c15366:	48 c1 e8 03          	shr    $0x3,%rax
02fa   c1536a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
02ff   c1536f:	74 08                	je     c15379 <full_proxy_open+0x309>
0301   c15371:	4c 89 e7             	mov    %r12,%rdi
0304   c15374:	e8 00 00 00 00       	call   c15379 <full_proxy_open+0x309>	c15375: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0309   c15379:	49 8b 3c 24          	mov    (%r12),%rdi
030d   c1537d:	e8 00 00 00 00       	call   c15382 <full_proxy_open+0x312>	c1537e: R_X86_64_PLT32	module_put-0x4
0312   c15382:	4c 8b 65 c0          	mov    -0x40(%rbp),%r12
0316   c15386:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
031a   c1538a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
031f   c1538f:	74 08                	je     c15399 <full_proxy_open+0x329>
0321   c15391:	4c 89 e7             	mov    %r12,%rdi
0324   c15394:	e8 00 00 00 00       	call   c15399 <full_proxy_open+0x329>	c15395: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0329   c15399:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
032d   c1539d:	4c 89 75 b8          	mov    %r14,-0x48(%rbp)
0331   c153a1:	49 83 c6 68          	add    $0x68,%r14
0335   c153a5:	49 89 04 24          	mov    %rax,(%r12)
0339   c153a9:	4d 89 f4             	mov    %r14,%r12
033c   c153ac:	49 c1 ec 03          	shr    $0x3,%r12
0340   c153b0:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
0345   c153b5:	74 08                	je     c153bf <full_proxy_open+0x34f>
0347   c153b7:	4c 89 f7             	mov    %r14,%rdi
034a   c153ba:	e8 00 00 00 00       	call   c153bf <full_proxy_open+0x34f>	c153bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
034f   c153bf:	45 31 ed             	xor    %r13d,%r13d
0352   c153c2:	49 83 3e 00          	cmpq   $0x0,(%r14)
0356   c153c6:	0f 84 92 01 00 00    	je     c1555e <full_proxy_open+0x4ee>
035c   c153cc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0366   c153d6:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
036b   c153db:	74 08                	je     c153e5 <full_proxy_open+0x375>
036d   c153dd:	4c 89 f7             	mov    %r14,%rdi
0370   c153e0:	e8 00 00 00 00       	call   c153e5 <full_proxy_open+0x375>	c153e1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0375   c153e5:	4d 8b 1e             	mov    (%r14),%r11
0378   c153e8:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
037c   c153ec:	4c 89 fe             	mov    %r15,%rsi
037f   c153ef:	e8 00 00 00 00       	call   c153f4 <full_proxy_open+0x384>	c153f0: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0384   c153f4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
0388   c153f8:	41 89 c7             	mov    %eax,%r15d
038b   c153fb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0395   c15405:	4c 8b 65 b0          	mov    -0x50(%rbp),%r12
0399   c15409:	4c 8b 75 c0          	mov    -0x40(%rbp),%r14
039d   c1540d:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
03a1   c15411:	74 08                	je     c1541b <full_proxy_open+0x3ab>
03a3   c15413:	4c 89 f7             	mov    %r14,%rdi
03a6   c15416:	e8 00 00 00 00       	call   c1541b <full_proxy_open+0x3ab>	c15417: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03ab   c1541b:	49 8b 06             	mov    (%r14),%rax
03ae   c1541e:	45 85 ff             	test   %r15d,%r15d
03b1   c15421:	0f 84 86 01 00 00    	je     c155ad <full_proxy_open+0x53d>
03b7   c15427:	48 85 c0             	test   %rax,%rax
03ba   c1542a:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
03c4   c15434:	74 3a                	je     c15470 <full_proxy_open+0x400>
03c6   c15436:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
03ca   c1543a:	4c 8b 65 c0          	mov    -0x40(%rbp),%r12
03ce   c1543e:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
03d3   c15443:	74 08                	je     c1544d <full_proxy_open+0x3dd>
03d5   c15445:	4c 89 e7             	mov    %r12,%rdi
03d8   c15448:	e8 00 00 00 00       	call   c1544d <full_proxy_open+0x3dd>	c15449: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03dd   c1544d:	4d 8b 24 24          	mov    (%r12),%r12
03e1   c15451:	4c 89 e0             	mov    %r12,%rax
03e4   c15454:	48 c1 e8 03          	shr    $0x3,%rax
03e8   c15458:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
03ed   c1545d:	74 08                	je     c15467 <full_proxy_open+0x3f7>
03ef   c1545f:	4c 89 e7             	mov    %r12,%rdi
03f2   c15462:	e8 00 00 00 00       	call   c15467 <full_proxy_open+0x3f7>	c15463: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03f7   c15467:	49 8b 3c 24          	mov    (%r12),%rdi
03fb   c1546b:	e8 00 00 00 00       	call   c15470 <full_proxy_open+0x400>	c1546c: R_X86_64_PLT32	module_put-0x4
0400   c15470:	4c 8d 63 68          	lea    0x68(%rbx),%r12
0404   c15474:	4c 89 e0             	mov    %r12,%rax
0407   c15477:	48 c1 e8 03          	shr    $0x3,%rax
040b   c1547b:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0410   c15480:	74 08                	je     c1548a <full_proxy_open+0x41a>
0412   c15482:	4c 89 e7             	mov    %r12,%rdi
0415   c15485:	e8 00 00 00 00       	call   c1548a <full_proxy_open+0x41a>	c15486: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
041a   c1548a:	41 bd 00 02 00 00    	mov    $0x200,%r13d
0420   c15490:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
042a   c1549a:	4d 03 2c 24          	add    (%r12),%r13
042e   c1549e:	4c 89 e8             	mov    %r13,%rax
0431   c154a1:	48 c1 e8 03          	shr    $0x3,%rax
0435   c154a5:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0439   c154a9:	74 08                	je     c154b3 <full_proxy_open+0x443>
043b   c154ab:	4c 89 ef             	mov    %r13,%rdi
043e   c154ae:	e8 00 00 00 00       	call   c154b3 <full_proxy_open+0x443>	c154af: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0443   c154b3:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
0447   c154b7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0451   c154c1:	4d 8b 75 00          	mov    0x0(%r13),%r14
0455   c154c5:	4c 8b 65 b0          	mov    -0x50(%rbp),%r12
0459   c154c9:	4c 8b 6d c0          	mov    -0x40(%rbp),%r13
045d   c154cd:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0461   c154d1:	74 08                	je     c154db <full_proxy_open+0x46b>
0463   c154d3:	4c 89 ef             	mov    %r13,%rdi
0466   c154d6:	e8 00 00 00 00       	call   c154db <full_proxy_open+0x46b>	c154d7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
046b   c154db:	4d 89 75 00          	mov    %r14,0x0(%r13)
046f   c154df:	4d 85 f6             	test   %r14,%r14
0472   c154e2:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
0476   c154e6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
047a   c154ea:	45 89 fd             	mov    %r15d,%r13d
047d   c154ed:	75 22                	jne    c15511 <full_proxy_open+0x4a1>
047f   c154ef:	0f 0b                	ud2
0481   c154f1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c154f4: R_X86_64_32S	.data+0x3dced8
0488   c154f8:	e8 00 00 00 00       	call   c154fd <full_proxy_open+0x48d>	c154f9: R_X86_64_PLT32	__ubsan_handle_builtin_unreachable-0x4
048d   c154fd:	41 bd fe ff ff ff    	mov    $0xfffffffe,%r13d
0493   c15503:	e9 93 00 00 00       	jmp    c1559b <full_proxy_open+0x52b>
0498   c15508:	41 bd f4 ff ff ff    	mov    $0xfffffff4,%r13d
049e   c1550e:	48 89 c7             	mov    %rax,%rdi
04a1   c15511:	e8 00 00 00 00       	call   c15516 <full_proxy_open+0x4a6>	c15512: R_X86_64_PLT32	kfree-0x4
04a6   c15516:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
04b0   c15520:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
04b5   c15525:	74 08                	je     c1552f <full_proxy_open+0x4bf>
04b7   c15527:	4c 89 f7             	mov    %r14,%rdi
04ba   c1552a:	e8 00 00 00 00       	call   c1552f <full_proxy_open+0x4bf>	c1552b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04bf   c1552f:	49 8b 3e             	mov    (%r14),%rdi
04c2   c15532:	e8 00 00 00 00       	call   c15537 <full_proxy_open+0x4c7>	c15533: R_X86_64_PLT32	module_put-0x4
04c7   c15537:	eb 25                	jmp    c1555e <full_proxy_open+0x4ee>
04c9   c15539:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c1553c: R_X86_64_32S	.rodata+0x1c1380
04d0   c15540:	e8 00 00 00 00       	call   c15545 <full_proxy_open+0x4d5>	c15541: R_X86_64_PLT32	printk-0x4
04d5   c15545:	0f 0b                	ud2
04d7   c15547:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c1554a: R_X86_64_32S	.rodata+0x1c4e60
04de   c1554e:	48 89 de             	mov    %rbx,%rsi
04e1   c15551:	e8 00 00 00 00       	call   c15556 <full_proxy_open+0x4e6>	c15552: R_X86_64_PLT32	__warn_printk-0x4
04e6   c15556:	0f 0b                	ud2
04e8   c15558:	41 bd fa ff ff ff    	mov    $0xfffffffa,%r13d
04ee   c1555e:	48 81 c3 f8 00 00 00 	add    $0xf8,%rbx
04f5   c15565:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
04ff   c1556f:	48 89 d8             	mov    %rbx,%rax
0502   c15572:	48 c1 e8 03          	shr    $0x3,%rax
0506   c15576:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
050a   c1557a:	74 08                	je     c15584 <full_proxy_open+0x514>
050c   c1557c:	48 89 df             	mov    %rbx,%rdi
050f   c1557f:	e8 00 00 00 00       	call   c15584 <full_proxy_open+0x514>	c15580: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0514   c15584:	48 8b 3b             	mov    (%rbx),%rdi
0517   c15587:	ff 4f 08             	decl   0x8(%rdi)
051a   c1558a:	0f 88 00 00 00 00    	js     c15590 <full_proxy_open+0x520>	c1558c: R_X86_64_PC32	.text..refcount+0x4fb
0520   c15590:	75 09                	jne    c1559b <full_proxy_open+0x52b>
0522   c15592:	48 83 c7 10          	add    $0x10,%rdi
0526   c15596:	e8 00 00 00 00       	call   c1559b <full_proxy_open+0x52b>	c15597: R_X86_64_PLT32	complete-0x4
052b   c1559b:	44 89 e8             	mov    %r13d,%eax
052e   c1559e:	48 83 c4 30          	add    $0x30,%rsp
0532   c155a2:	5b                   	pop    %rbx
0533   c155a3:	41 5c                	pop    %r12
0535   c155a5:	41 5d                	pop    %r13
0537   c155a7:	41 5e                	pop    %r14
0539   c155a9:	41 5f                	pop    %r15
053b   c155ab:	5d                   	pop    %rbp
053c   c155ac:	c3                   	ret
053d   c155ad:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
0541   c155b1:	48 39 c8             	cmp    %rcx,%rax
0544   c155b4:	74 a8                	je     c1555e <full_proxy_open+0x4ee>
0546   c155b6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c155b9: R_X86_64_32S	.rodata+0x1c4ec0
054d   c155bd:	48 89 de             	mov    %rbx,%rsi
0550   c155c0:	49 89 ce             	mov    %rcx,%r14
0553   c155c3:	e8 00 00 00 00       	call   c155c8 <full_proxy_open+0x558>	c155c4: R_X86_64_PLT32	__warn_printk-0x4
0558   c155c8:	0f 0b                	ud2
055a   c155ca:	4c 89 f7             	mov    %r14,%rdi
055d   c155cd:	4c 8b 75 b8          	mov    -0x48(%rbp),%r14
0561   c155d1:	45 31 ed             	xor    %r13d,%r13d
0564   c155d4:	e9 38 ff ff ff       	jmp    c15511 <full_proxy_open+0x4a1>
0569   c155d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
