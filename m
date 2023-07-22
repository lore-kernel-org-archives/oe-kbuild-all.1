Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9BA1C3B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689989971; x=1721525971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GsE0uY7Fs5L2jwHtIIfPd0pee6HRSoko4haWZZbwUk8=;
  b=Z/rNtuhBu67Cp1bxCtzRjapoBJ9JKm7LL2SbFRjKPAxOQdsHAoTDPWtL
   PDE3gSmlR3/UlRYRef+6hGaqfJ8KyTD7LenNWZhDEt/3y+/b4FQtzrn6C
   y0YnjaTZ367pp78NKM7UU3fJv/LUboBsHzGqKZMky3fj8X0xaTBkqJyCl
   Yk7jhrWqditeBZnchQaCuswzXBV37N2QTnT79LJ5ne7twhjS5+Xx/puSu
   VCyHjuGCVaFh3BdjB7eg5PvBgfRtWg+bBFnQ/QKgLeZotSeE/K5FKIXgd
   sm8VSSO7G6feafImJO+N4TpVK4OK+Sr7Dw0xtCfBPu4i/tN8itT8wxQCP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453526783"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="453526783"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 18:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="849013096"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="849013096"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 18:39:28 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN1ab-0007pT-1e;
	Sat, 22 Jul 2023 01:39:23 +0000
Date: Sat, 22 Jul 2023 09:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:seamcall_test 7/32] vmlinux.o: warning: objtool:
 __tdx_hypercall+0x4e0: __tdx_hypercall_failed() is missing a __noreturn
 annotation
Message-ID: <202307220934.SsoQdNR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git seamcall_test
head:   830ed3263bc64425a239e480552305507a35d219
commit: 1e26ac003996e397a151a2bc66dcabdde7d5ae9a [7/32] x86/tdx: Make TDX_HYPERCALL asm similar to TDX_MODULE_CALL
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230722/202307220934.SsoQdNR5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220934.SsoQdNR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220934.SsoQdNR5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __tdx_hypercall+0x4e0: __tdx_hypercall_failed() is missing a __noreturn annotation


objdump-func vmlinux.o __tdx_hypercall:
0000 0000000000004c10 <__tdx_hypercall_failed>:
0000     4c10:	f3 0f 1e fa          	endbr64
0004     4c14:	e8 00 00 00 00       	call   4c19 <__tdx_hypercall_failed+0x9>	4c15: R_X86_64_PLT32	__fentry__-0x4
0009     4c19:	e8 00 00 00 00       	call   4c1e <__tdx_hypercall_failed+0xe>	4c1a: R_X86_64_PLT32	__asan_handle_no_return-0x4
000e     4c1e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4c21: R_X86_64_32S	.rodata+0x3ea0
0015     4c25:	e8 00 00 00 00       	call   4c2a <__tdx_hypercall_failed+0x1a>	4c26: R_X86_64_PLT32	panic-0x4
001a     4c2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
0000 00000000000050d0 <__tdx_hypercall>:
0000     50d0:	f3 0f 1e fa          	endbr64
0004     50d4:	e8 00 00 00 00       	call   50d9 <__tdx_hypercall+0x9>	50d5: R_X86_64_PLT32	__fentry__-0x4
0009     50d9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0013     50e3:	41 57                	push   %r15
0015     50e5:	48 89 fa             	mov    %rdi,%rdx
0018     50e8:	41 56                	push   %r14
001a     50ea:	41 55                	push   %r13
001c     50ec:	41 54                	push   %r12
001e     50ee:	55                   	push   %rbp
001f     50ef:	53                   	push   %rbx
0020     50f0:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
0027     50f7:	48 c7 44 24 40 b3 8a b5 41 	movq   $0x41b58ab3,0x40(%rsp)
0030     5100:	48 8d 44 24 40       	lea    0x40(%rsp),%rax
0035     5105:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	510a: R_X86_64_32S	.rodata.str1.1+0xd93
003e     510e:	48 c1 e8 03          	shr    $0x3,%rax
0042     5112:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0047     5117:	48 01 c8             	add    %rcx,%rax
004a     511a:	48 c7 44 24 50 00 00 00 00 	movq   $0x0,0x50(%rsp)	511f: R_X86_64_32S	.text+0x50d0
0053     5123:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0059     5129:	c7 40 04 f1 f1 00 00 	movl   $0xf1f1,0x4(%rax)
0060     5130:	c7 40 10 00 00 00 f3 	movl   $0xf3000000,0x10(%rax)
0067     5137:	c7 40 14 f3 f3 f3 f3 	movl   $0xf3f3f3f3,0x14(%rax)
006e     513e:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0077     5147:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
007f     514f:	31 c0                	xor    %eax,%eax
0081     5151:	e8 00 00 00 00       	call   5156 <__tdx_hypercall+0x86>	5152: R_X86_64_PLT32	stackleak_track_stack-0x4
0086     5156:	48 c7 44 24 70 cc ff 00 00 	movq   $0xffcc,0x70(%rsp)
008f     515f:	48 8d 47 58          	lea    0x58(%rdi),%rax
0093     5163:	48 89 04 24          	mov    %rax,(%rsp)
0097     5167:	48 c1 e8 03          	shr    $0x3,%rax
009b     516b:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
009f     516f:	0f 85 4a 05 00 00    	jne    56bf <__tdx_hypercall+0x5ef>
00a5     5175:	48 8b 42 58          	mov    0x58(%rdx),%rax
00a9     5179:	48 89 d1             	mov    %rdx,%rcx
00ac     517c:	48 c1 e9 03          	shr    $0x3,%rcx
00b0     5180:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
00b5     5185:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00bf     518f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
00c3     5193:	0f 85 0f 05 00 00    	jne    56a8 <__tdx_hypercall+0x5d8>
00c9     5199:	48 8b 02             	mov    (%rdx),%rax
00cc     519c:	4c 8d 7a 08          	lea    0x8(%rdx),%r15
00d0     51a0:	4c 89 f9             	mov    %r15,%rcx
00d3     51a3:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
00db     51ab:	48 c1 e9 03          	shr    $0x3,%rcx
00df     51af:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00e9     51b9:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
00ed     51bd:	0f 85 ce 04 00 00    	jne    5691 <__tdx_hypercall+0x5c1>
00f3     51c3:	48 8b 42 08          	mov    0x8(%rdx),%rax
00f7     51c7:	4c 8d 72 10          	lea    0x10(%rdx),%r14
00fb     51cb:	4c 89 f1             	mov    %r14,%rcx
00fe     51ce:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
0106     51d6:	48 c1 e9 03          	shr    $0x3,%rcx
010a     51da:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0114     51e4:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0118     51e8:	0f 85 8c 04 00 00    	jne    567a <__tdx_hypercall+0x5aa>
011e     51ee:	48 8b 42 10          	mov    0x10(%rdx),%rax
0122     51f2:	4c 8d 6a 18          	lea    0x18(%rdx),%r13
0126     51f6:	4c 89 e9             	mov    %r13,%rcx
0129     51f9:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
0131     5201:	48 c1 e9 03          	shr    $0x3,%rcx
0135     5205:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
013f     520f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0143     5213:	0f 85 4a 04 00 00    	jne    5663 <__tdx_hypercall+0x593>
0149     5219:	48 8b 42 18          	mov    0x18(%rdx),%rax
014d     521d:	4c 8d 62 20          	lea    0x20(%rdx),%r12
0151     5221:	4c 89 e1             	mov    %r12,%rcx
0154     5224:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
015c     522c:	48 c1 e9 03          	shr    $0x3,%rcx
0160     5230:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
016a     523a:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
016e     523e:	0f 85 08 04 00 00    	jne    564c <__tdx_hypercall+0x57c>
0174     5244:	48 8b 42 20          	mov    0x20(%rdx),%rax
0178     5248:	48 8d 6a 28          	lea    0x28(%rdx),%rbp
017c     524c:	48 89 e9             	mov    %rbp,%rcx
017f     524f:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
0187     5257:	48 c1 e9 03          	shr    $0x3,%rcx
018b     525b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0195     5265:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0199     5269:	0f 85 c6 03 00 00    	jne    5635 <__tdx_hypercall+0x565>
019f     526f:	48 8b 42 28          	mov    0x28(%rdx),%rax
01a3     5273:	48 8d 5a 30          	lea    0x30(%rdx),%rbx
01a7     5277:	48 89 d9             	mov    %rbx,%rcx
01aa     527a:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
01b2     5282:	48 c1 e9 03          	shr    $0x3,%rcx
01b6     5286:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01c0     5290:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
01c4     5294:	0f 85 84 03 00 00    	jne    561e <__tdx_hypercall+0x54e>
01ca     529a:	48 8b 42 30          	mov    0x30(%rdx),%rax
01ce     529e:	48 89 84 24 b0 00 00 00 	mov    %rax,0xb0(%rsp)
01d6     52a6:	48 8d 42 38          	lea    0x38(%rdx),%rax
01da     52aa:	48 89 c1             	mov    %rax,%rcx
01dd     52ad:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
01e2     52b2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01ec     52bc:	48 c1 e9 03          	shr    $0x3,%rcx
01f0     52c0:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
01f4     52c4:	0f 85 3b 03 00 00    	jne    5605 <__tdx_hypercall+0x535>
01fa     52ca:	48 8b 42 38          	mov    0x38(%rdx),%rax
01fe     52ce:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
0206     52d6:	48 8d 42 50          	lea    0x50(%rdx),%rax
020a     52da:	48 89 c1             	mov    %rax,%rcx
020d     52dd:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0212     52e2:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
021c     52ec:	48 c1 e9 03          	shr    $0x3,%rcx
0220     52f0:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0224     52f4:	0f 85 f2 02 00 00    	jne    55ec <__tdx_hypercall+0x51c>
022a     52fa:	48 8b 42 50          	mov    0x50(%rdx),%rax
022e     52fe:	48 89 84 24 c0 00 00 00 	mov    %rax,0xc0(%rsp)
0236     5306:	48 8d 42 40          	lea    0x40(%rdx),%rax
023a     530a:	48 89 c1             	mov    %rax,%rcx
023d     530d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0242     5312:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
024c     531c:	48 c1 e9 03          	shr    $0x3,%rcx
0250     5320:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0254     5324:	0f 85 a9 02 00 00    	jne    55d3 <__tdx_hypercall+0x503>
025a     532a:	48 8b 42 40          	mov    0x40(%rdx),%rax
025e     532e:	48 89 84 24 c8 00 00 00 	mov    %rax,0xc8(%rsp)
0266     5336:	48 8d 42 48          	lea    0x48(%rdx),%rax
026a     533a:	48 89 c1             	mov    %rax,%rcx
026d     533d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0272     5342:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
027c     534c:	48 c1 e9 03          	shr    $0x3,%rcx
0280     5350:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0284     5354:	0f 85 60 02 00 00    	jne    55ba <__tdx_hypercall+0x4ea>
028a     535a:	48 8b 42 48          	mov    0x48(%rdx),%rax
028e     535e:	31 ff                	xor    %edi,%edi
0290     5360:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
0295     5365:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
029a     536a:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
02a2     5372:	e8 00 00 00 00       	call   5377 <__tdx_hypercall+0x2a7>	5373: R_X86_64_PLT32	__tdcall_hypercall-0x4
02a7     5377:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
02ac     537c:	48 85 c0             	test   %rax,%rax
02af     537f:	0f 85 26 02 00 00    	jne    55ab <__tdx_hypercall+0x4db>
02b5     5385:	48 89 d6             	mov    %rdx,%rsi
02b8     5388:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
02c0     5390:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02ca     539a:	48 c1 ee 03          	shr    $0x3,%rsi
02ce     539e:	80 3c 0e 00          	cmpb   $0x0,(%rsi,%rcx,1)
02d2     53a2:	0f 85 3f 04 00 00    	jne    57e7 <__tdx_hypercall+0x717>
02d8     53a8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
02e2     53b2:	4c 89 fe             	mov    %r15,%rsi
02e5     53b5:	48 89 02             	mov    %rax,(%rdx)
02e8     53b8:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
02f0     53c0:	48 c1 ee 03          	shr    $0x3,%rsi
02f4     53c4:	80 3c 0e 00          	cmpb   $0x0,(%rsi,%rcx,1)
02f8     53c8:	0f 85 f8 03 00 00    	jne    57c6 <__tdx_hypercall+0x6f6>
02fe     53ce:	4c 89 f1             	mov    %r14,%rcx
0301     53d1:	48 89 42 08          	mov    %rax,0x8(%rdx)
0305     53d5:	4c 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%r15
030d     53dd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0317     53e7:	48 c1 e9 03          	shr    $0x3,%rcx
031b     53eb:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
031f     53ef:	0f 85 ba 03 00 00    	jne    57af <__tdx_hypercall+0x6df>
0325     53f5:	4c 89 e9             	mov    %r13,%rcx
0328     53f8:	4c 89 7a 10          	mov    %r15,0x10(%rdx)
032c     53fc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0336     5406:	4c 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%r14
033e     540e:	48 c1 e9 03          	shr    $0x3,%rcx
0342     5412:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0346     5416:	0f 85 7c 03 00 00    	jne    5798 <__tdx_hypercall+0x6c8>
034c     541c:	4c 89 e1             	mov    %r12,%rcx
034f     541f:	4c 89 72 18          	mov    %r14,0x18(%rdx)
0353     5423:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
035d     542d:	4c 8b ac 24 a0 00 00 00 	mov    0xa0(%rsp),%r13
0365     5435:	48 c1 e9 03          	shr    $0x3,%rcx
0369     5439:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
036d     543d:	0f 85 3e 03 00 00    	jne    5781 <__tdx_hypercall+0x6b1>
0373     5443:	48 89 e9             	mov    %rbp,%rcx
0376     5446:	4c 89 6a 20          	mov    %r13,0x20(%rdx)
037a     544a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0384     5454:	4c 8b a4 24 a8 00 00 00 	mov    0xa8(%rsp),%r12
038c     545c:	48 c1 e9 03          	shr    $0x3,%rcx
0390     5460:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0394     5464:	0f 85 00 03 00 00    	jne    576a <__tdx_hypercall+0x69a>
039a     546a:	48 89 d9             	mov    %rbx,%rcx
039d     546d:	4c 89 62 28          	mov    %r12,0x28(%rdx)
03a1     5471:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03ab     547b:	48 8b ac 24 b0 00 00 00 	mov    0xb0(%rsp),%rbp
03b3     5483:	48 c1 e9 03          	shr    $0x3,%rcx
03b7     5487:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
03bb     548b:	0f 85 c2 02 00 00    	jne    5753 <__tdx_hypercall+0x683>
03c1     5491:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
03c6     5496:	48 89 6a 30          	mov    %rbp,0x30(%rdx)
03ca     549a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03d4     54a4:	48 8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%rbx
03dc     54ac:	48 c1 e9 03          	shr    $0x3,%rcx
03e0     54b0:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
03e4     54b4:	0f 85 80 02 00 00    	jne    573a <__tdx_hypercall+0x66a>
03ea     54ba:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
03ef     54bf:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
03f3     54c3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
03fd     54cd:	48 8b 9c 24 c8 00 00 00 	mov    0xc8(%rsp),%rbx
0405     54d5:	48 c1 e9 03          	shr    $0x3,%rcx
0409     54d9:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
040d     54dd:	0f 85 3e 02 00 00    	jne    5721 <__tdx_hypercall+0x651>
0413     54e3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0418     54e8:	48 89 5a 40          	mov    %rbx,0x40(%rdx)
041c     54ec:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0426     54f6:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
042e     54fe:	48 c1 e9 03          	shr    $0x3,%rcx
0432     5502:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0436     5506:	0f 85 fc 01 00 00    	jne    5708 <__tdx_hypercall+0x638>
043c     550c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0441     5511:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
0445     5515:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
044f     551f:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
0457     5527:	48 c1 e9 03          	shr    $0x3,%rcx
045b     552b:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
045f     552f:	0f 85 ba 01 00 00    	jne    56ef <__tdx_hypercall+0x61f>
0465     5535:	48 8b 0c 24          	mov    (%rsp),%rcx
0469     5539:	48 89 5a 50          	mov    %rbx,0x50(%rdx)
046d     553d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0477     5547:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
047c     554c:	48 c1 e9 03          	shr    $0x3,%rcx
0480     5550:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0484     5554:	0f 85 7d 01 00 00    	jne    56d7 <__tdx_hypercall+0x607>
048a     555a:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
048f     555f:	48 89 5a 58          	mov    %rbx,0x58(%rdx)
0493     5563:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
049d     556d:	48 01 c7             	add    %rax,%rdi
04a0     5570:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
04a7     5577:	48 c7 47 10 00 00 00 00 	movq   $0x0,0x10(%rdi)
04af     557f:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
04b7     5587:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
04c0     5590:	0f 85 72 02 00 00    	jne    5808 <__tdx_hypercall+0x738>
04c6     5596:	48 81 c4 20 01 00 00 	add    $0x120,%rsp
04cd     559d:	4c 89 f8             	mov    %r15,%rax
04d0     55a0:	5b                   	pop    %rbx
04d1     55a1:	5d                   	pop    %rbp
04d2     55a2:	41 5c                	pop    %r12
04d4     55a4:	41 5d                	pop    %r13
04d6     55a6:	41 5e                	pop    %r14
04d8     55a8:	41 5f                	pop    %r15
04da     55aa:	c3                   	ret
04db     55ab:	e8 00 00 00 00       	call   55b0 <__tdx_hypercall+0x4e0>	55ac: R_X86_64_PLT32	__tdx_hypercall_failed-0x4
04e0     55b0:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
04e5     55b5:	e9 cb fd ff ff       	jmp    5385 <__tdx_hypercall+0x2b5>
04ea     55ba:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
04ef     55bf:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
04f4     55c4:	e8 00 00 00 00       	call   55c9 <__tdx_hypercall+0x4f9>	55c5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04f9     55c9:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
04fe     55ce:	e9 87 fd ff ff       	jmp    535a <__tdx_hypercall+0x28a>
0503     55d3:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0508     55d8:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
050d     55dd:	e8 00 00 00 00       	call   55e2 <__tdx_hypercall+0x512>	55de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0512     55e2:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
0517     55e7:	e9 3e fd ff ff       	jmp    532a <__tdx_hypercall+0x25a>
051c     55ec:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0521     55f1:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
0526     55f6:	e8 00 00 00 00       	call   55fb <__tdx_hypercall+0x52b>	55f7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
052b     55fb:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
0530     5600:	e9 f5 fc ff ff       	jmp    52fa <__tdx_hypercall+0x22a>
0535     5605:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
053a     560a:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
053f     560f:	e8 00 00 00 00       	call   5614 <__tdx_hypercall+0x544>	5610: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0544     5614:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0549     5619:	e9 ac fc ff ff       	jmp    52ca <__tdx_hypercall+0x1fa>
054e     561e:	48 89 df             	mov    %rbx,%rdi
0551     5621:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0556     5626:	e8 00 00 00 00       	call   562b <__tdx_hypercall+0x55b>	5627: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
055b     562b:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0560     5630:	e9 65 fc ff ff       	jmp    529a <__tdx_hypercall+0x1ca>
0565     5635:	48 89 ef             	mov    %rbp,%rdi
0568     5638:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
056d     563d:	e8 00 00 00 00       	call   5642 <__tdx_hypercall+0x572>	563e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0572     5642:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0577     5647:	e9 23 fc ff ff       	jmp    526f <__tdx_hypercall+0x19f>
057c     564c:	4c 89 e7             	mov    %r12,%rdi
057f     564f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0584     5654:	e8 00 00 00 00       	call   5659 <__tdx_hypercall+0x589>	5655: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0589     5659:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
058e     565e:	e9 e1 fb ff ff       	jmp    5244 <__tdx_hypercall+0x174>
0593     5663:	4c 89 ef             	mov    %r13,%rdi
0596     5666:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
059b     566b:	e8 00 00 00 00       	call   5670 <__tdx_hypercall+0x5a0>	566c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05a0     5670:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
05a5     5675:	e9 9f fb ff ff       	jmp    5219 <__tdx_hypercall+0x149>
05aa     567a:	4c 89 f7             	mov    %r14,%rdi
05ad     567d:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
05b2     5682:	e8 00 00 00 00       	call   5687 <__tdx_hypercall+0x5b7>	5683: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05b7     5687:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
05bc     568c:	e9 5d fb ff ff       	jmp    51ee <__tdx_hypercall+0x11e>
05c1     5691:	4c 89 ff             	mov    %r15,%rdi
05c4     5694:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
05c9     5699:	e8 00 00 00 00       	call   569e <__tdx_hypercall+0x5ce>	569a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05ce     569e:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
05d3     56a3:	e9 1b fb ff ff       	jmp    51c3 <__tdx_hypercall+0xf3>
05d8     56a8:	48 89 d7             	mov    %rdx,%rdi
05db     56ab:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
05e0     56b0:	e8 00 00 00 00       	call   56b5 <__tdx_hypercall+0x5e5>	56b1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05e5     56b5:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
05ea     56ba:	e9 da fa ff ff       	jmp    5199 <__tdx_hypercall+0xc9>
05ef     56bf:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
05f4     56c4:	48 8b 3c 24          	mov    (%rsp),%rdi
05f8     56c8:	e8 00 00 00 00       	call   56cd <__tdx_hypercall+0x5fd>	56c9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05fd     56cd:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0602     56d2:	e9 9e fa ff ff       	jmp    5175 <__tdx_hypercall+0xa5>
0607     56d7:	48 8b 3c 24          	mov    (%rsp),%rdi
060b     56db:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0610     56e0:	e8 00 00 00 00       	call   56e5 <__tdx_hypercall+0x615>	56e1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0615     56e5:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
061a     56ea:	e9 6b fe ff ff       	jmp    555a <__tdx_hypercall+0x48a>
061f     56ef:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0624     56f4:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0629     56f9:	e8 00 00 00 00       	call   56fe <__tdx_hypercall+0x62e>	56fa: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
062e     56fe:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0633     5703:	e9 2d fe ff ff       	jmp    5535 <__tdx_hypercall+0x465>
0638     5708:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
063d     570d:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0642     5712:	e8 00 00 00 00       	call   5717 <__tdx_hypercall+0x647>	5713: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0647     5717:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
064c     571c:	e9 eb fd ff ff       	jmp    550c <__tdx_hypercall+0x43c>
0651     5721:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0656     5726:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
065b     572b:	e8 00 00 00 00       	call   5730 <__tdx_hypercall+0x660>	572c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0660     5730:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0665     5735:	e9 a9 fd ff ff       	jmp    54e3 <__tdx_hypercall+0x413>
066a     573a:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
066f     573f:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
0674     5744:	e8 00 00 00 00       	call   5749 <__tdx_hypercall+0x679>	5745: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0679     5749:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
067e     574e:	e9 67 fd ff ff       	jmp    54ba <__tdx_hypercall+0x3ea>
0683     5753:	48 89 df             	mov    %rbx,%rdi
0686     5756:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
068b     575b:	e8 00 00 00 00       	call   5760 <__tdx_hypercall+0x690>	575c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0690     5760:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
0695     5765:	e9 27 fd ff ff       	jmp    5491 <__tdx_hypercall+0x3c1>
069a     576a:	48 89 ef             	mov    %rbp,%rdi
069d     576d:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
06a2     5772:	e8 00 00 00 00       	call   5777 <__tdx_hypercall+0x6a7>	5773: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06a7     5777:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
06ac     577c:	e9 e9 fc ff ff       	jmp    546a <__tdx_hypercall+0x39a>
06b1     5781:	4c 89 e7             	mov    %r12,%rdi
06b4     5784:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
06b9     5789:	e8 00 00 00 00       	call   578e <__tdx_hypercall+0x6be>	578a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06be     578e:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
06c3     5793:	e9 ab fc ff ff       	jmp    5443 <__tdx_hypercall+0x373>
06c8     5798:	4c 89 ef             	mov    %r13,%rdi
06cb     579b:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
06d0     57a0:	e8 00 00 00 00       	call   57a5 <__tdx_hypercall+0x6d5>	57a1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06d5     57a5:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
06da     57aa:	e9 6d fc ff ff       	jmp    541c <__tdx_hypercall+0x34c>
06df     57af:	4c 89 f7             	mov    %r14,%rdi
06e2     57b2:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
06e7     57b7:	e8 00 00 00 00       	call   57bc <__tdx_hypercall+0x6ec>	57b8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06ec     57bc:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
06f1     57c1:	e9 2f fc ff ff       	jmp    53f5 <__tdx_hypercall+0x325>
06f6     57c6:	4c 89 ff             	mov    %r15,%rdi
06f9     57c9:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
06fe     57ce:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0703     57d3:	e8 00 00 00 00       	call   57d8 <__tdx_hypercall+0x708>	57d4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0708     57d8:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
070d     57dd:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0712     57e2:	e9 e7 fb ff ff       	jmp    53ce <__tdx_hypercall+0x2fe>
0717     57e7:	48 89 d7             	mov    %rdx,%rdi
071a     57ea:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
071f     57ef:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
0724     57f4:	e8 00 00 00 00       	call   57f9 <__tdx_hypercall+0x729>	57f5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0729     57f9:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
072e     57fe:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
0733     5803:	e9 a0 fb ff ff       	jmp    53a8 <__tdx_hypercall+0x2d8>
0738     5808:	e8 00 00 00 00       	call   580d <__tdx_hypercall+0x73d>	5809: R_X86_64_PLT32	__stack_chk_fail-0x4
073d     580d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
