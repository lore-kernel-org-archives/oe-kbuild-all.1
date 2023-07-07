Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D55383
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688713917; x=1720249917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lxYmeuHR+vR3TKor+R1bS1QITorRkMrSH5SxK/bR668=;
  b=VoD3kO0EjI5Q0ly/LD3Km5RWREw/EpEoGsajB2wXwleZyrl/jsKbszv7
   T1vvQ6c7IBU+y/oB8dsAUudjPEtvysUyV9hWWMjzBMlO+IhpapG5qo1Xq
   +TfKm5s7vflpAjr/DsF3HhYMrIoem/sD8CU+Uj2n7obApdSvFeSk0TlzV
   Y5NbqmntuuqOERYbrwSKPM7Ax1ptTnn9GRU6KZdSwDolMV4jKADtrbZAW
   5NLWNod5M5yK4qoHfD8ds12L7kIRxgLPRyNbTZ6/rIbONSdE65PtFnn7x
   hmg+I0C4APhk9iVIB/9t3orfYGIJ/IVAjNhdSrWEv6Ea0tjPX6wxhxMLq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="362691842"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="362691842"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 00:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="713900481"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="713900481"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Jul 2023 00:11:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHfdB-0001rC-0t;
	Fri, 07 Jul 2023 07:11:53 +0000
Date: Fri, 7 Jul 2023 15:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 90/526]
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_in+0x147:
 undefined stack state
Message-ID: <202307071527.YqN4MAXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   a24316f176c2c08713d96667428ef5093c090294
commit: aeb6b7c6b6ef84ab496189cdbc698426092aa46c [90/526] drm/vmwgfx: Add unwind hints around RBP clobber
config: x86_64-randconfig-x015-20230707 (https://download.01.org/0day-ci/archive/20230707/202307071527.YqN4MAXf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071527.YqN4MAXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071527.YqN4MAXf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_in+0x147: undefined stack state
>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_out+0x141: undefined stack state


objdump-func vmlinux.o vmw_port_hb_in:
0000 000000000181c80e <vmw_port_hb_in>:
0000  181c80e:	e8 00 00 00 00       	call   181c813 <vmw_port_hb_in+0x5>	181c80f: R_X86_64_PLT32	__fentry__-0x4
0005  181c813:	41 57                	push   %r15
0007  181c815:	49 89 f7             	mov    %rsi,%r15
000a  181c818:	41 56                	push   %r14
000c  181c81a:	41 55                	push   %r13
000e  181c81c:	41 54                	push   %r12
0010  181c81e:	49 89 d4             	mov    %rdx,%r12
0013  181c821:	55                   	push   %rbp
0014  181c822:	48 89 fd             	mov    %rdi,%rbp
0017  181c825:	53                   	push   %rbx
0018  181c826:	bb ff ff 37 00       	mov    $0x37ffff,%ebx
001d  181c82b:	48 c1 e3 2a          	shl    $0x2a,%rbx
0021  181c82f:	48 83 ec 78          	sub    $0x78,%rsp
0025  181c833:	48 c7 44 24 18 b3 8a b5 41 	movq   $0x41b58ab3,0x18(%rsp)
002e  181c83c:	4c 8d 74 24 18       	lea    0x18(%rsp),%r14
0033  181c841:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)	181c846: R_X86_64_32S	.rodata.str1.1+0x19f279
003c  181c84a:	49 c1 ee 03          	shr    $0x3,%r14
0040  181c84e:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)	181c853: R_X86_64_32S	.text+0x181c80e
0049  181c857:	49 8d 04 1e          	lea    (%r14,%rbx,1),%rax
004d  181c85b:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
0053  181c861:	c7 40 04 00 f3 f3 f3 	movl   $0xf3f3f300,0x4(%rax)
005a  181c868:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0063  181c871:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0068  181c876:	48 b8 fe fe fe fe fe fe fe fe 	movabs $0xfefefefefefefefe,%rax
0072  181c880:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
0077  181c885:	84 c9                	test   %cl,%cl
0079  181c887:	75 16                	jne    181c89f <vmw_port_hb_in+0x91>
007b  181c889:	48 89 e8             	mov    %rbp,%rax
007e  181c88c:	bb 00 00 01 00       	mov    $0x10000,%ebx
0083  181c891:	48 c1 e8 03          	shr    $0x3,%rax
0087  181c895:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
008c  181c89a:	e9 d9 01 00 00       	jmp    181ca78 <vmw_port_hb_in+0x26a>
0091  181c89f:	31 ff                	xor    %edi,%edi
0093  181c8a1:	e8 00 00 00 00       	call   181c8a6 <vmw_port_hb_in+0x98>	181c8a2: R_X86_64_PLT32	cc_platform_has-0x4
0098  181c8a6:	84 c0                	test   %al,%al
009a  181c8a8:	75 df                	jne    181c889 <vmw_port_hb_in+0x7b>
009c  181c8aa:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
00a0  181c8ae:	48 89 f8             	mov    %rdi,%rax
00a3  181c8b1:	48 c1 e8 03          	shr    $0x3,%rax
00a7  181c8b5:	8a 14 18             	mov    (%rax,%rbx,1),%dl
00aa  181c8b8:	48 89 f8             	mov    %rdi,%rax
00ad  181c8bb:	83 e0 07             	and    $0x7,%eax
00b0  181c8be:	83 c0 03             	add    $0x3,%eax
00b3  181c8c1:	38 d0                	cmp    %dl,%al
00b5  181c8c3:	7c 09                	jl     181c8ce <vmw_port_hb_in+0xc0>
00b7  181c8c5:	84 d2                	test   %dl,%dl
00b9  181c8c7:	74 05                	je     181c8ce <vmw_port_hb_in+0xc0>
00bb  181c8c9:	e8 00 00 00 00       	call   181c8ce <vmw_port_hb_in+0xc0>	181c8ca: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
00c0  181c8ce:	48 89 ea             	mov    %rbp,%rdx
00c3  181c8d1:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
00c8  181c8d6:	44 8b 6d 08          	mov    0x8(%rbp),%r13d
00cc  181c8da:	48 c1 e0 2a          	shl    $0x2a,%rax
00d0  181c8de:	48 c1 ea 03          	shr    $0x3,%rdx
00d4  181c8e2:	8a 14 02             	mov    (%rdx,%rax,1),%dl
00d7  181c8e5:	48 89 e8             	mov    %rbp,%rax
00da  181c8e8:	83 e0 07             	and    $0x7,%eax
00dd  181c8eb:	ff c0                	inc    %eax
00df  181c8ed:	38 d0                	cmp    %dl,%al
00e1  181c8ef:	7c 0c                	jl     181c8fd <vmw_port_hb_in+0xef>
00e3  181c8f1:	84 d2                	test   %dl,%dl
00e5  181c8f3:	74 08                	je     181c8fd <vmw_port_hb_in+0xef>
00e7  181c8f5:	48 89 ef             	mov    %rbp,%rdi
00ea  181c8f8:	e8 00 00 00 00       	call   181c8fd <vmw_port_hb_in+0xef>	181c8f9: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
00ef  181c8fd:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
00f3  181c901:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
00f7  181c905:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
00fc  181c90a:	48 c1 e0 2a          	shl    $0x2a,%rax
0100  181c90e:	89 d3                	mov    %edx,%ebx
0102  181c910:	48 89 fa             	mov    %rdi,%rdx
0105  181c913:	48 c1 ea 03          	shr    $0x3,%rdx
0109  181c917:	c1 e3 10             	shl    $0x10,%ebx
010c  181c91a:	8a 14 02             	mov    (%rdx,%rax,1),%dl
010f  181c91d:	48 89 f8             	mov    %rdi,%rax
0112  181c920:	83 e0 07             	and    $0x7,%eax
0115  181c923:	83 c0 03             	add    $0x3,%eax
0118  181c926:	38 d0                	cmp    %dl,%al
011a  181c928:	7c 09                	jl     181c933 <vmw_port_hb_in+0x125>
011c  181c92a:	84 d2                	test   %dl,%dl
011e  181c92c:	74 05                	je     181c933 <vmw_port_hb_in+0x125>
0120  181c92e:	e8 00 00 00 00       	call   181c933 <vmw_port_hb_in+0x125>	181c92f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0125  181c933:	89 da                	mov    %ebx,%edx
0127  181c935:	8b 75 04             	mov    0x4(%rbp),%esi
012a  181c938:	b8 68 58 4d 56       	mov    $0x564d5868,%eax
012f  181c93d:	bb 00 00 01 00       	mov    $0x10000,%ebx
0134  181c942:	83 ca 01             	or     $0x1,%edx
0137  181c945:	4c 89 e1             	mov    %r12,%rcx
013a  181c948:	4c 89 ff             	mov    %r15,%rdi
013d  181c94b:	55                   	push   %rbp
013e  181c94c:	4c 89 ed             	mov    %r13,%rbp
0141  181c94f:	66 ba 59 56          	mov    $0x5659,%dx
0145  181c953:	f3 6c                	rep insb (%dx),%es:(%rdi)
0147  181c955:	5d                   	pop    %rbp
0148  181c956:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
014d  181c95b:	e9 5c 01 00 00       	jmp    181cabc <vmw_port_hb_in+0x2ae>
0152  181c960:	41 bd 04 00 00 00    	mov    $0x4,%r13d
0158  181c966:	48 8d 7d 04          	lea    0x4(%rbp),%rdi
015c  181c96a:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
0161  181c96f:	4d 39 ec             	cmp    %r13,%r12
0164  181c972:	48 89 fa             	mov    %rdi,%rdx
0167  181c975:	4d 0f 46 ec          	cmovbe %r12,%r13
016b  181c979:	48 c1 e0 2a          	shl    $0x2a,%rax
016f  181c97d:	48 c1 ea 03          	shr    $0x3,%rdx
0173  181c981:	8a 14 02             	mov    (%rdx,%rax,1),%dl
0176  181c984:	48 89 f8             	mov    %rdi,%rax
0179  181c987:	83 e0 07             	and    $0x7,%eax
017c  181c98a:	83 c0 03             	add    $0x3,%eax
017f  181c98d:	38 d0                	cmp    %dl,%al
0181  181c98f:	0f 8d ee 00 00 00    	jge    181ca83 <vmw_port_hb_in+0x275>
0187  181c995:	8b 45 04             	mov    0x4(%rbp),%eax
018a  181c998:	48 8d 7d 08          	lea    0x8(%rbp),%rdi
018e  181c99c:	48 89 fa             	mov    %rdi,%rdx
0191  181c99f:	48 89 04 24          	mov    %rax,(%rsp)
0195  181c9a3:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
019a  181c9a8:	48 c1 ea 03          	shr    $0x3,%rdx
019e  181c9ac:	48 c1 e0 2a          	shl    $0x2a,%rax
01a2  181c9b0:	8a 14 02             	mov    (%rdx,%rax,1),%dl
01a5  181c9b3:	48 89 f8             	mov    %rdi,%rax
01a8  181c9b6:	83 e0 07             	and    $0x7,%eax
01ab  181c9b9:	83 c0 03             	add    $0x3,%eax
01ae  181c9bc:	38 d0                	cmp    %dl,%al
01b0  181c9be:	0f 8d d1 00 00 00    	jge    181ca95 <vmw_port_hb_in+0x287>
01b6  181c9c4:	8b 45 08             	mov    0x8(%rbp),%eax
01b9  181c9c7:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
01be  181c9cc:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
01c3  181c9d1:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
01c8  181c9d6:	48 c1 e0 2a          	shl    $0x2a,%rax
01cc  181c9da:	8a 14 01             	mov    (%rcx,%rax,1),%dl
01cf  181c9dd:	48 89 e8             	mov    %rbp,%rax
01d2  181c9e0:	83 e0 07             	and    $0x7,%eax
01d5  181c9e3:	ff c0                	inc    %eax
01d7  181c9e5:	38 d0                	cmp    %dl,%al
01d9  181c9e7:	0f 8d ba 00 00 00    	jge    181caa7 <vmw_port_hb_in+0x299>
01df  181c9ed:	0f b7 55 00          	movzwl 0x0(%rbp),%edx
01e3  181c9f1:	48 8b 34 24          	mov    (%rsp),%rsi
01e7  181c9f5:	b8 68 58 4d 56       	mov    $0x564d5868,%eax
01ec  181c9fa:	bb 01 00 00 00       	mov    $0x1,%ebx
01f1  181c9ff:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
01f6  181ca04:	b9 1e 00 04 00       	mov    $0x4001e,%ecx
01fb  181ca09:	c1 e2 10             	shl    $0x10,%edx
01fe  181ca0c:	66 ba 58 56          	mov    $0x5658,%dx
0202  181ca10:	ed                   	in     (%dx),%eax
0203  181ca11:	0f ba e1 10          	bt     $0x10,%ecx
0207  181ca15:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
020c  181ca1a:	48 89 cb             	mov    %rcx,%rbx
020f  181ca1d:	0f 83 99 00 00 00    	jae    181cabc <vmw_port_hb_in+0x2ae>
0215  181ca23:	b9 01 00 00 00       	mov    $0x1,%ecx
021a  181ca28:	31 d2                	xor    %edx,%edx
021c  181ca2a:	31 f6                	xor    %esi,%esi
021e  181ca2c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	181ca2f: R_X86_64_32S	_ftrace_annotated_branch+0x191700
0225  181ca33:	e8 00 00 00 00       	call   181ca38 <vmw_port_hb_in+0x22a>	181ca34: R_X86_64_PLT32	ftrace_likely_update-0x4
022a  181ca38:	b9 01 00 00 00       	mov    $0x1,%ecx
022f  181ca3d:	31 d2                	xor    %edx,%edx
0231  181ca3f:	31 f6                	xor    %esi,%esi
0233  181ca41:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	181ca44: R_X86_64_32S	_ftrace_annotated_branch+0x1916d0
023a  181ca48:	4d 29 ec             	sub    %r13,%r12
023d  181ca4b:	e8 00 00 00 00       	call   181ca50 <vmw_port_hb_in+0x242>	181ca4c: R_X86_64_PLT32	ftrace_likely_update-0x4
0242  181ca50:	b9 01 00 00 00       	mov    $0x1,%ecx
0247  181ca55:	31 d2                	xor    %edx,%edx
0249  181ca57:	31 f6                	xor    %esi,%esi
024b  181ca59:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	181ca5c: R_X86_64_32S	_ftrace_annotated_branch+0x1916a0
0252  181ca60:	e8 00 00 00 00       	call   181ca65 <vmw_port_hb_in+0x257>	181ca61: R_X86_64_PLT32	ftrace_likely_update-0x4
0257  181ca65:	4c 89 ff             	mov    %r15,%rdi
025a  181ca68:	4c 89 ea             	mov    %r13,%rdx
025d  181ca6b:	4d 01 ef             	add    %r13,%r15
0260  181ca6e:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
0265  181ca73:	e8 00 00 00 00       	call   181ca78 <vmw_port_hb_in+0x26a>	181ca74: R_X86_64_PLT32	memcpy-0x4
026a  181ca78:	4d 85 e4             	test   %r12,%r12
026d  181ca7b:	0f 85 df fe ff ff    	jne    181c960 <vmw_port_hb_in+0x152>
0273  181ca81:	eb 39                	jmp    181cabc <vmw_port_hb_in+0x2ae>
0275  181ca83:	84 d2                	test   %dl,%dl
0277  181ca85:	0f 84 0a ff ff ff    	je     181c995 <vmw_port_hb_in+0x187>
027d  181ca8b:	e8 00 00 00 00       	call   181ca90 <vmw_port_hb_in+0x282>	181ca8c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0282  181ca90:	e9 00 ff ff ff       	jmp    181c995 <vmw_port_hb_in+0x187>
0287  181ca95:	84 d2                	test   %dl,%dl
0289  181ca97:	0f 84 27 ff ff ff    	je     181c9c4 <vmw_port_hb_in+0x1b6>
028f  181ca9d:	e8 00 00 00 00       	call   181caa2 <vmw_port_hb_in+0x294>	181ca9e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0294  181caa2:	e9 1d ff ff ff       	jmp    181c9c4 <vmw_port_hb_in+0x1b6>
0299  181caa7:	84 d2                	test   %dl,%dl
029b  181caa9:	0f 84 3e ff ff ff    	je     181c9ed <vmw_port_hb_in+0x1df>
02a1  181caaf:	48 89 ef             	mov    %rbp,%rdi
02a4  181cab2:	e8 00 00 00 00       	call   181cab7 <vmw_port_hb_in+0x2a9>	181cab3: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
02a9  181cab7:	e9 31 ff ff ff       	jmp    181c9ed <vmw_port_hb_in+0x1df>
02ae  181cabc:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
02b3  181cac1:	31 d2                	xor    %edx,%edx
02b5  181cac3:	48 c1 e0 2a          	shl    $0x2a,%rax
02b9  181cac7:	49 89 14 06          	mov    %rdx,(%r14,%rax,1)
02bd  181cacb:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
02c2  181cad0:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
02cb  181cad9:	74 05                	je     181cae0 <vmw_port_hb_in+0x2d2>
02cd  181cadb:	e8 00 00 00 00       	call   181cae0 <vmw_port_hb_in+0x2d2>	181cadc: R_X86_64_PLT32	__stack_chk_fail-0x4
02d2  181cae0:	48 83 c4 78          	add    $0x78,%rsp
02d6  181cae4:	48 89 d8             	mov    %rbx,%rax
02d9  181cae7:	5b                   	pop    %rbx
02da  181cae8:	5d                   	pop    %rbp
02db  181cae9:	41 5c                	pop    %r12
02dd  181caeb:	41 5d                	pop    %r13
02df  181caed:	41 5e                	pop    %r14
02e1  181caef:	41 5f                	pop    %r15
02e3  181caf1:	c3                   	ret
02e4  181caf2:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
