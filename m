Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F260F6AB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677506806; x=1709042806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJfbE4PLYMjqRai28uzbKiDxxygq2Y7rQDZjqoT/R2Y=;
  b=jEupYkyWlL67sIO3tInvfHv/sEN/5+uqCSOckP5PM0sCDRe+1dk8ugYw
   dD7sDyu9Vq2L/RP5HtiBEVHoYWGEV8a+aJZrZdNCtkI3J4gWAbD1OyxdE
   YTnUUURKyUfBXeORtvTYMq2KISr8kbwVkZI1ZDkfeuBtvd/rMJC47otLx
   lzMDfloClnSImXHJpF7JYDR8MvjGqBTerZUbKyimxUMYmWx5tys2J8IQc
   nc/cAJs4l1mbbdup1VrJfEAjXpopHnyOMvmho2c0emeej8kPcBF4xFQbd
   /D+FZXANVRkmvj+UMunJh7At1I4cN4iUWkUVLAiSHP6Jk6K4T99snrcTJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="420126979"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="420126979"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 06:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="675899163"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="675899163"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 06:06:44 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWe9L-0004Tr-2d;
	Mon, 27 Feb 2023 14:06:43 +0000
Date: Mon, 27 Feb 2023 22:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 435/440] vmlinux.o: warning:
 objtool: vmx_vcpu_enter_exit+0x2c: call to perf_event_guest_enter_exit()
 leaves .noinstr.text section
Message-ID: <202302272143.eJC8WVKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   6960696b1b5b8d8074bf2724321ff73782e42e6c
commit: b7377b41927c4fa035228a4eb3fb6151d64bf749 [435/440] perf, KVM: introduce software event on enter/exit to/from guest
config: x86_64-randconfig-a013-20230227 (https://download.01.org/0day-ci/archive/20230227/202302272143.eJC8WVKI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/b7377b41927c4fa035228a4eb3fb6151d64bf749
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b7377b41927c4fa035228a4eb3fb6151d64bf749
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272143.eJC8WVKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x2c: call to perf_event_guest_enter_exit() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0xcc: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x14a: call to __kasan_check_write() leaves .noinstr.text section


objdump-func vmlinux.o vmx_vcpu_enter_exit:
0000 00000000000014ba <vmx_vcpu_enter_exit>:
0000     14ba:	55                   	push   %rbp
0001     14bb:	48 89 e5             	mov    %rsp,%rbp
0004     14be:	41 57                	push   %r15
0006     14c0:	41 56                	push   %r14
0008     14c2:	41 55                	push   %r13
000a     14c4:	49 89 d5             	mov    %rdx,%r13
000d     14c7:	41 54                	push   %r12
000f     14c9:	49 89 fc             	mov    %rdi,%r12
0012     14cc:	53                   	push   %rbx
0013     14cd:	48 89 f3             	mov    %rsi,%rbx
0016     14d0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	14d1: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
001b     14d5:	90                   	nop
001c     14d6:	e8 00 00 00 00       	call   14db <vmx_vcpu_enter_exit+0x21>	14d7: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0021     14db:	e8 00 00 00 00       	call   14e0 <vmx_vcpu_enter_exit+0x26>	14dc: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
0026     14e0:	90                   	nop
0027     14e1:	bf 01 00 00 00       	mov    $0x1,%edi
002c     14e6:	e8 00 00 00 00       	call   14eb <vmx_vcpu_enter_exit+0x31>	14e7: R_X86_64_PLT32	perf_event_guest_enter_exit-0x4
0031     14eb:	66 90                	xchg   %ax,%ax
0033     14ed:	eb 0f                	jmp    14fe <vmx_vcpu_enter_exit+0x44>
0035     14ef:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	14f0: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
003a     14f4:	bf 03 00 00 00       	mov    $0x3,%edi
003f     14f9:	e8 00 00 00 00       	call   14fe <vmx_vcpu_enter_exit+0x44>	14fa: R_X86_64_PLT32	__ct_user_enter-0x4
0044     14fe:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	14ff: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0049     1503:	e8 00 00 00 00       	call   1508 <vmx_vcpu_enter_exit+0x4e>	1504: R_X86_64_PC32	.text+0x184192
004e     1508:	31 ff                	xor    %edi,%edi
0050     150a:	41 89 c6             	mov    %eax,%r14d
0053     150d:	89 c6                	mov    %eax,%esi
0055     150f:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1510: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
005a     1514:	45 84 f6             	test   %r14b,%r14b
005d     1517:	75 0c                	jne    1525 <vmx_vcpu_enter_exit+0x6b>
005f     1519:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	151a: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0064     151e:	90                   	nop
0065     151f:	e8 00 00 00 00       	call   1524 <vmx_vcpu_enter_exit+0x6a>	1520: R_X86_64_PC32	.text+0x1859bb
006a     1524:	90                   	nop
006b     1525:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1526: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0070     152a:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
0074     152e:	e8 00 00 00 00       	call   1533 <vmx_vcpu_enter_exit+0x79>	152f: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
0079     1533:	66 90                	xchg   %ax,%ax
007b     1535:	eb 0f                	jmp    1546 <vmx_vcpu_enter_exit+0x8c>
007d     1537:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1538: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0082     153c:	4c 89 e7             	mov    %r12,%rdi
0085     153f:	e8 ac fe ff ff       	call   13f0 <vmx_l1d_flush>
008a     1544:	eb 3b                	jmp    1581 <vmx_vcpu_enter_exit+0xc7>
008c     1546:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1547: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0091     154b:	66 90                	xchg   %ax,%ax
0093     154d:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	154e: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0098     1552:	66 90                	xchg   %ax,%ax
009a     1554:	eb 2b                	jmp    1581 <vmx_vcpu_enter_exit+0xc7>
009c     1556:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1557: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00a1     155b:	49 8b 3c 24          	mov    (%r12),%rdi
00a5     155f:	e8 00 00 00 00       	call   1564 <vmx_vcpu_enter_exit+0xaa>	1560: R_X86_64_PLT32	kvm_arch_has_assigned_device-0x4
00aa     1564:	31 ff                	xor    %edi,%edi
00ac     1566:	41 89 c6             	mov    %eax,%r14d
00af     1569:	89 c6                	mov    %eax,%esi
00b1     156b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	156c: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
00b6     1570:	45 84 f6             	test   %r14b,%r14b
00b9     1573:	74 0c                	je     1581 <vmx_vcpu_enter_exit+0xc7>
00bb     1575:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1576: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00c0     157a:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1581 <vmx_vcpu_enter_exit+0xc7>	157d: R_X86_64_PC32	.rodata+0x487fc
00c7     1581:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1582: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00cc     1586:	44 8a b3 30 27 00 00 	mov    0x2730(%rbx),%r14b
00d3     158d:	31 ff                	xor    %edi,%edi
00d5     158f:	44 89 f6             	mov    %r14d,%esi
00d8     1592:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1593: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
00dd     1597:	45 84 f6             	test   %r14b,%r14b
00e0     159a:	74 27                	je     15c3 <vmx_vcpu_enter_exit+0x109>
00e2     159c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	159d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
00e7     15a1:	b9 23 01 00 00       	mov    $0x123,%ecx
00ec     15a6:	0f 32                	rdmsr
00ee     15a8:	48 c1 e2 20          	shl    $0x20,%rdx
00f2     15ac:	48 09 c2             	or     %rax,%rdx
00f5     15af:	48 89 d0             	mov    %rdx,%rax
00f8     15b2:	48 c1 ea 20          	shr    $0x20,%rdx
00fc     15b6:	48 83 c8 08          	or     $0x8,%rax
0100     15ba:	0f 30                	wrmsr
0102     15bc:	48 89 83 28 27 00 00 	mov    %rax,0x2728(%rbx)
0109     15c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	15c4: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
010e     15c8:	4d 8b b4 24 60 02 00 00 	mov    0x260(%r12),%r14
0116     15d0:	41 0f 20 d7          	mov    %cr2,%r15
011a     15d4:	4c 89 fe             	mov    %r15,%rsi
011d     15d7:	4c 89 f7             	mov    %r14,%rdi
0120     15da:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	15db: R_X86_64_NONE	__sanitizer_cov_trace_cmp8-0x4
0125     15df:	4d 39 fe             	cmp    %r15,%r14
0128     15e2:	74 09                	je     15ed <vmx_vcpu_enter_exit+0x133>
012a     15e4:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	15e5: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
012f     15e9:	41 0f 22 d6          	mov    %r14,%cr2
0133     15ed:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	15ee: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0138     15f2:	49 8d b4 24 c0 01 00 00 	lea    0x1c0(%r12),%rsi
0140     15fa:	44 89 ea             	mov    %r13d,%edx
0143     15fd:	48 89 df             	mov    %rbx,%rdi
0146     1600:	e8 00 00 00 00       	call   1605 <vmx_vcpu_enter_exit+0x14b>	1601: R_X86_64_PLT32	__vmx_vcpu_run-0x4
014b     1605:	88 83 10 1f 00 00    	mov    %al,0x1f10(%rbx)
0151     160b:	0f 20 d0             	mov    %cr2,%rax
0154     160e:	49 89 84 24 60 02 00 00 	mov    %rax,0x260(%r12)
015c     1616:	44 8a a3 30 27 00 00 	mov    0x2730(%rbx),%r12b
0163     161d:	31 ff                	xor    %edi,%edi
0165     161f:	44 89 e6             	mov    %r12d,%esi
0168     1622:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1623: R_X86_64_NONE	__sanitizer_cov_trace_const_cmp1-0x4
016d     1627:	45 84 e4             	test   %r12b,%r12b
0170     162a:	74 25                	je     1651 <vmx_vcpu_enter_exit+0x197>
0172     162c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	162d: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
0177     1631:	48 8b 83 28 27 00 00 	mov    0x2728(%rbx),%rax
017e     1638:	b9 23 01 00 00       	mov    $0x123,%ecx
0183     163d:	48 83 e0 f7          	and    $0xfffffffffffffff7,%rax
0187     1641:	48 89 c2             	mov    %rax,%rdx
018a     1644:	48 89 83 28 27 00 00 	mov    %rax,0x2728(%rbx)
0191     164b:	48 c1 ea 20          	shr    $0x20,%rdx
0195     164f:	0f 30                	wrmsr
0197     1651:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1652: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
019c     1656:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
01a0     165a:	e8 00 00 00 00       	call   165f <vmx_vcpu_enter_exit+0x1a5>	165b: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
01a5     165f:	66 90                	xchg   %ax,%ax
01a7     1661:	eb 0f                	jmp    1672 <vmx_vcpu_enter_exit+0x1b8>
01a9     1663:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1664: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
01ae     1668:	bf 03 00 00 00       	mov    $0x3,%edi
01b3     166d:	e8 00 00 00 00       	call   1672 <vmx_vcpu_enter_exit+0x1b8>	166e: R_X86_64_PLT32	__ct_user_exit-0x4
01b8     1672:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	1673: R_X86_64_NONE	__sanitizer_cov_trace_pc-0x4
01bd     1677:	31 ff                	xor    %edi,%edi
01bf     1679:	e8 00 00 00 00       	call   167e <vmx_vcpu_enter_exit+0x1c4>	167a: R_X86_64_PLT32	perf_event_guest_enter_exit-0x4
01c4     167e:	90                   	nop
01c5     167f:	e8 00 00 00 00       	call   1684 <vmx_vcpu_enter_exit+0x1ca>	1680: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
01ca     1684:	90                   	nop
01cb     1685:	5b                   	pop    %rbx
01cc     1686:	41 5c                	pop    %r12
01ce     1688:	41 5d                	pop    %r13
01d0     168a:	41 5e                	pop    %r14
01d2     168c:	41 5f                	pop    %r15
01d4     168e:	5d                   	pop    %rbp
01d5     168f:	31 c0                	xor    %eax,%eax
01d7     1691:	31 d2                	xor    %edx,%edx
01d9     1693:	31 c9                	xor    %ecx,%ecx
01db     1695:	31 f6                	xor    %esi,%esi
01dd     1697:	31 ff                	xor    %edi,%edi
01df     1699:	c3                   	ret
01e0     169a:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
