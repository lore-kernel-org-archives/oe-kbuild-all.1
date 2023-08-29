Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D7C182BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693344293; x=1724880293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sJDS4iu7Jt3W/rGMOlPGP18cYBSAxNXuzNqg93Hcn0=;
  b=VsErI64mwl/WmXxu8LxUypyYDNXSFQY6PrClqFEwuk7Q5CVAawpPqOca
   Zb8luhVv2lQBkIBD1YmrkwPTptdL8kq9kePex2CdJ9U2FHRL5LttfG7O2
   b/34r3+nKcnV84XIAKCH1Fv7eKBre1ZQL7fnWtE5YC1U0GliEjURXt8Vw
   oVbtkO8MgummJ9+hDTTgQpGci1pmk5C4tZl9pFurFh9L43tYc3/lPbnbr
   smg9O432B5D0hAOsgIN1fHTlWIIbTiullFa1mEsMS4w4jD8un0Rp7Q/tN
   cPditn3OPDjh0b4UOdoGTBbU+C5tiDUVE1zKTdkfL1L2sNVM9y+lNsa5e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375440903"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="375440903"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 14:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="741992121"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="741992121"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 14:24:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb6Ce-00095b-1f;
	Tue, 29 Aug 2023 21:24:48 +0000
Date: Wed, 30 Aug 2023 05:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/display/intel_dp.o: warning: objtool:
 intel_read_dp_sdp()+0x416: unreachable instruction
Message-ID: <202308300556.C9BIyFhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core60-51
head:   79f190d7ae78b399a873f6814484a1854cb4ba31
commit: c3b727af671c97b5535720d185f3d77192b87744 FROMGIT: drm/i915/pps: abstract panel power sequencer from intel_dp.c
date:   2 years, 7 months ago
config: x86_64-randconfig-015-20230829 (https://download.01.org/0day-ci/archive/20230830/202308300556.C9BIyFhQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300556.C9BIyFhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300556.C9BIyFhQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp.o: warning: objtool: intel_read_dp_sdp()+0x416: unreachable instruction


objdump-func vmlinux.o intel_read_dp_sdp:
0000 00000000026c7cc0 <intel_read_dp_sdp>:
0000  26c7cc0:	55                   	push   %rbp
0001  26c7cc1:	41 57                	push   %r15
0003  26c7cc3:	41 56                	push   %r14
0005  26c7cc5:	41 55                	push   %r13
0007  26c7cc7:	41 54                	push   %r12
0009  26c7cc9:	53                   	push   %rbx
000a  26c7cca:	48 83 ec 38          	sub    $0x38,%rsp
000e  26c7cce:	89 d5                	mov    %edx,%ebp
0010  26c7cd0:	49 89 ff             	mov    %rdi,%r15
0013  26c7cd3:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
001c  26c7cdc:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0021  26c7ce1:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
002b  26c7ceb:	4c 8d 67 78          	lea    0x78(%rdi),%r12
002f  26c7cef:	4d 89 e6             	mov    %r12,%r14
0032  26c7cf2:	49 c1 ee 03          	shr    $0x3,%r14
0036  26c7cf6:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
003b  26c7cfb:	84 c0                	test   %al,%al
003d  26c7cfd:	0f 85 9a 06 00 00    	jne    26c839d <intel_read_dp_sdp+0x6dd>
0043  26c7d03:	41 83 3c 24 0a       	cmpl   $0xa,(%r12)
0048  26c7d08:	0f 85 6c 06 00 00    	jne    26c837a <intel_read_dp_sdp+0x6ba>
004e  26c7d0e:	83 fd 0a             	cmp    $0xa,%ebp
0051  26c7d11:	0f 84 1c 02 00 00    	je     26c7f33 <intel_read_dp_sdp+0x273>
0057  26c7d17:	83 fd 07             	cmp    $0x7,%ebp
005a  26c7d1a:	0f 85 9f 03 00 00    	jne    26c80bf <intel_read_dp_sdp+0x3ff>
0060  26c7d20:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
0065  26c7d25:	84 c0                	test   %al,%al
0067  26c7d27:	0f 85 94 06 00 00    	jne    26c83c1 <intel_read_dp_sdp+0x701>
006d  26c7d2d:	41 8b 04 24          	mov    (%r12),%eax
0071  26c7d31:	83 f8 0a             	cmp    $0xa,%eax
0074  26c7d34:	0f 87 b5 03 00 00    	ja     26c80ef <intel_read_dp_sdp+0x42f>
007a  26c7d3a:	b9 c0 05 00 00       	mov    $0x5c0,%ecx
007f  26c7d3f:	0f a3 c1             	bt     %eax,%ecx
0082  26c7d42:	4d 89 fd             	mov    %r15,%r13
0085  26c7d45:	0f 83 a4 03 00 00    	jae    26c80ef <intel_read_dp_sdp+0x42f>
008b  26c7d4b:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
0090  26c7d50:	84 c0                	test   %al,%al
0092  26c7d52:	0f 85 8d 06 00 00    	jne    26c83e5 <intel_read_dp_sdp+0x725>
0098  26c7d58:	41 8b 04 24          	mov    (%r12),%eax
009c  26c7d5c:	83 f8 0a             	cmp    $0xa,%eax
009f  26c7d5f:	0f 87 cd 03 00 00    	ja     26c8132 <intel_read_dp_sdp+0x472>
00a5  26c7d65:	b9 c0 05 00 00       	mov    $0x5c0,%ecx
00aa  26c7d6a:	0f a3 c1             	bt     %eax,%ecx
00ad  26c7d6d:	4c 89 fd             	mov    %r15,%rbp
00b0  26c7d70:	0f 83 bc 03 00 00    	jae    26c8132 <intel_read_dp_sdp+0x472>
00b6  26c7d76:	48 89 34 24          	mov    %rsi,(%rsp)
00ba  26c7d7a:	48 81 c5 40 01 00 00 	add    $0x140,%rbp
00c1  26c7d81:	4c 89 f8             	mov    %r15,%rax
00c4  26c7d84:	48 c1 e8 03          	shr    $0x3,%rax
00c8  26c7d88:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
00cc  26c7d8c:	74 08                	je     26c7d96 <intel_read_dp_sdp+0xd6>
00ce  26c7d8e:	4c 89 ff             	mov    %r15,%rdi
00d1  26c7d91:	e8 00 00 00 00       	call   26c7d96 <intel_read_dp_sdp+0xd6>	26c7d92: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00d6  26c7d96:	4d 8b 37             	mov    (%r15),%r14
00d9  26c7d99:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
00de  26c7d9e:	ba 24 00 00 00       	mov    $0x24,%edx
00e3  26c7da3:	4c 89 e7             	mov    %r12,%rdi
00e6  26c7da6:	31 f6                	xor    %esi,%esi
00e8  26c7da8:	e8 00 00 00 00       	call   26c7dad <intel_read_dp_sdp+0xed>	26c7da9: R_X86_64_PLT32	memset-0x4
00ed  26c7dad:	48 89 ef             	mov    %rbp,%rdi
00f0  26c7db0:	e8 00 00 00 00       	call   26c7db5 <intel_read_dp_sdp+0xf5>	26c7db1: R_X86_64_PLT32	intel_psr_enabled-0x4
00f5  26c7db5:	84 c0                	test   %al,%al
00f7  26c7db7:	0f 85 bd 05 00 00    	jne    26c837a <intel_read_dp_sdp+0x6ba>
00fd  26c7dbd:	48 8b 04 24          	mov    (%rsp),%rax
0101  26c7dc1:	48 8d a8 d8 0f 00 00 	lea    0xfd8(%rax),%rbp
0108  26c7dc8:	48 89 e8             	mov    %rbp,%rax
010b  26c7dcb:	48 c1 e8 03          	shr    $0x3,%rax
010f  26c7dcf:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0113  26c7dd3:	84 c0                	test   %al,%al
0115  26c7dd5:	0f 85 84 06 00 00    	jne    26c845f <intel_read_dp_sdp+0x79f>
011b  26c7ddb:	8b 6d 00             	mov    0x0(%rbp),%ebp
011e  26c7dde:	bf 07 00 00 00       	mov    $0x7,%edi
0123  26c7de3:	e8 00 00 00 00       	call   26c7de8 <intel_read_dp_sdp+0x128>	26c7de4: R_X86_64_PLT32	intel_hdmi_infoframe_enable-0x4
0128  26c7de8:	85 e8                	test   %ebp,%eax
012a  26c7dea:	0f 84 8a 05 00 00    	je     26c837a <intel_read_dp_sdp+0x6ba>
0130  26c7df0:	48 8b 34 24          	mov    (%rsp),%rsi
0134  26c7df4:	48 8d ae f0 10 00 00 	lea    0x10f0(%rsi),%rbp
013b  26c7dfb:	49 81 c5 68 1a 00 00 	add    $0x1a68,%r13
0142  26c7e02:	4c 89 e8             	mov    %r13,%rax
0145  26c7e05:	48 c1 e8 03          	shr    $0x3,%rax
0149  26c7e09:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
014d  26c7e0d:	74 0c                	je     26c7e1b <intel_read_dp_sdp+0x15b>
014f  26c7e0f:	4c 89 ef             	mov    %r13,%rdi
0152  26c7e12:	e8 00 00 00 00       	call   26c7e17 <intel_read_dp_sdp+0x157>	26c7e13: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0157  26c7e17:	48 8b 34 24          	mov    (%rsp),%rsi
015b  26c7e1b:	41 b8 24 00 00 00    	mov    $0x24,%r8d
0161  26c7e21:	4c 89 ff             	mov    %r15,%rdi
0164  26c7e24:	ba 07 00 00 00       	mov    $0x7,%edx
0169  26c7e29:	4c 89 e1             	mov    %r12,%rcx
016c  26c7e2c:	41 ff 55 00          	call   *0x0(%r13)
0170  26c7e30:	ba 24 00 00 00       	mov    $0x24,%edx
0175  26c7e35:	48 89 ef             	mov    %rbp,%rdi
0178  26c7e38:	31 f6                	xor    %esi,%esi
017a  26c7e3a:	e8 00 00 00 00       	call   26c7e3f <intel_read_dp_sdp+0x17f>	26c7e3b: R_X86_64_PLT32	memset-0x4
017f  26c7e3f:	49 c1 ec 03          	shr    $0x3,%r12
0183  26c7e43:	41 80 3c 1c 00       	cmpb   $0x0,(%r12,%rbx,1)
0188  26c7e48:	0f 85 2e 06 00 00    	jne    26c847c <intel_read_dp_sdp+0x7bc>
018e  26c7e4e:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
0193  26c7e53:	0f 85 f4 04 00 00    	jne    26c834d <intel_read_dp_sdp+0x68d>
0199  26c7e59:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
019e  26c7e5e:	84 c0                	test   %al,%al
01a0  26c7e60:	0f 85 b3 06 00 00    	jne    26c8519 <intel_read_dp_sdp+0x859>
01a6  26c7e66:	80 7c 24 09 07       	cmpb   $0x7,0x9(%rsp)
01ab  26c7e6b:	0f 85 dc 04 00 00    	jne    26c834d <intel_read_dp_sdp+0x68d>
01b1  26c7e71:	48 89 e8             	mov    %rbp,%rax
01b4  26c7e74:	48 c1 e8 03          	shr    $0x3,%rax
01b8  26c7e78:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
01bc  26c7e7c:	84 c0                	test   %al,%al
01be  26c7e7e:	0f 85 cd 06 00 00    	jne    26c8551 <intel_read_dp_sdp+0x891>
01c4  26c7e84:	c6 45 00 07          	movb   $0x7,0x0(%rbp)
01c8  26c7e88:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
01cd  26c7e8d:	84 c0                	test   %al,%al
01cf  26c7e8f:	48 8b 14 24          	mov    (%rsp),%rdx
01d3  26c7e93:	0f 85 d2 06 00 00    	jne    26c856b <intel_read_dp_sdp+0x8ab>
01d9  26c7e99:	0f b6 6c 24 0a       	movzbl 0xa(%rsp),%ebp
01de  26c7e9e:	4c 8d ba f1 10 00 00 	lea    0x10f1(%rdx),%r15
01e5  26c7ea5:	4c 89 f8             	mov    %r15,%rax
01e8  26c7ea8:	48 c1 e8 03          	shr    $0x3,%rax
01ec  26c7eac:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
01f0  26c7eb0:	84 c0                	test   %al,%al
01f2  26c7eb2:	0f 85 d3 06 00 00    	jne    26c858b <intel_read_dp_sdp+0x8cb>
01f8  26c7eb8:	41 88 2f             	mov    %bpl,(%r15)
01fb  26c7ebb:	4c 8d 7c 24 0b       	lea    0xb(%rsp),%r15
0200  26c7ec0:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
0205  26c7ec5:	84 c0                	test   %al,%al
0207  26c7ec7:	0f 85 dd 06 00 00    	jne    26c85aa <intel_read_dp_sdp+0x8ea>
020d  26c7ecd:	0f b6 6c 24 0b       	movzbl 0xb(%rsp),%ebp
0212  26c7ed2:	4c 8d a2 f2 10 00 00 	lea    0x10f2(%rdx),%r12
0219  26c7ed9:	4c 89 e0             	mov    %r12,%rax
021c  26c7edc:	48 c1 e8 03          	shr    $0x3,%rax
0220  26c7ee0:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0224  26c7ee4:	84 c0                	test   %al,%al
0226  26c7ee6:	0f 85 dd 06 00 00    	jne    26c85c9 <intel_read_dp_sdp+0x909>
022c  26c7eec:	41 88 2c 24          	mov    %bpl,(%r12)
0230  26c7ef0:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
0235  26c7ef5:	83 f8 05             	cmp    $0x5,%eax
0238  26c7ef8:	0f 84 c7 02 00 00    	je     26c81c5 <intel_read_dp_sdp+0x505>
023e  26c7efe:	83 f8 04             	cmp    $0x4,%eax
0241  26c7f01:	0f 84 12 04 00 00    	je     26c8319 <intel_read_dp_sdp+0x659>
0247  26c7f07:	83 f8 02             	cmp    $0x2,%eax
024a  26c7f0a:	0f 85 3d 04 00 00    	jne    26c834d <intel_read_dp_sdp+0x68d>
0250  26c7f10:	4c 89 f8             	mov    %r15,%rax
0253  26c7f13:	48 c1 e8 03          	shr    $0x3,%rax
0257  26c7f17:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
025b  26c7f1b:	84 c0                	test   %al,%al
025d  26c7f1d:	0f 85 f9 06 00 00    	jne    26c861c <intel_read_dp_sdp+0x95c>
0263  26c7f23:	80 7c 24 0b 08       	cmpb   $0x8,0xb(%rsp)
0268  26c7f28:	0f 85 1f 04 00 00    	jne    26c834d <intel_read_dp_sdp+0x68d>
026e  26c7f2e:	e9 47 04 00 00       	jmp    26c837a <intel_read_dp_sdp+0x6ba>
0273  26c7f33:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
0278  26c7f38:	84 c0                	test   %al,%al
027a  26c7f3a:	0f 85 c9 04 00 00    	jne    26c8409 <intel_read_dp_sdp+0x749>
0280  26c7f40:	41 8b 04 24          	mov    (%r12),%eax
0284  26c7f44:	83 f8 0a             	cmp    $0xa,%eax
0287  26c7f47:	0f 87 23 02 00 00    	ja     26c8170 <intel_read_dp_sdp+0x4b0>
028d  26c7f4d:	b9 c0 05 00 00       	mov    $0x5c0,%ecx
0292  26c7f52:	0f a3 c1             	bt     %eax,%ecx
0295  26c7f55:	4d 89 fd             	mov    %r15,%r13
0298  26c7f58:	0f 83 12 02 00 00    	jae    26c8170 <intel_read_dp_sdp+0x4b0>
029e  26c7f5e:	48 89 34 24          	mov    %rsi,(%rsp)
02a2  26c7f62:	48 8d ae d8 0f 00 00 	lea    0xfd8(%rsi),%rbp
02a9  26c7f69:	4c 89 f8             	mov    %r15,%rax
02ac  26c7f6c:	48 c1 e8 03          	shr    $0x3,%rax
02b0  26c7f70:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
02b4  26c7f74:	74 08                	je     26c7f7e <intel_read_dp_sdp+0x2be>
02b6  26c7f76:	4c 89 ff             	mov    %r15,%rdi
02b9  26c7f79:	e8 00 00 00 00       	call   26c7f7e <intel_read_dp_sdp+0x2be>	26c7f7a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02be  26c7f7e:	4d 8b 37             	mov    (%r15),%r14
02c1  26c7f81:	4c 8d 64 24 08       	lea    0x8(%rsp),%r12
02c6  26c7f86:	ba 24 00 00 00       	mov    $0x24,%edx
02cb  26c7f8b:	4c 89 e7             	mov    %r12,%rdi
02ce  26c7f8e:	31 f6                	xor    %esi,%esi
02d0  26c7f90:	e8 00 00 00 00       	call   26c7f95 <intel_read_dp_sdp+0x2d5>	26c7f91: R_X86_64_PLT32	memset-0x4
02d5  26c7f95:	48 89 e8             	mov    %rbp,%rax
02d8  26c7f98:	48 c1 e8 03          	shr    $0x3,%rax
02dc  26c7f9c:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
02e0  26c7fa0:	84 c0                	test   %al,%al
02e2  26c7fa2:	0f 85 85 04 00 00    	jne    26c842d <intel_read_dp_sdp+0x76d>
02e8  26c7fa8:	8b 6d 00             	mov    0x0(%rbp),%ebp
02eb  26c7fab:	bf 0a 00 00 00       	mov    $0xa,%edi
02f0  26c7fb0:	e8 00 00 00 00       	call   26c7fb5 <intel_read_dp_sdp+0x2f5>	26c7fb1: R_X86_64_PLT32	intel_hdmi_infoframe_enable-0x4
02f5  26c7fb5:	85 e8                	test   %ebp,%eax
02f7  26c7fb7:	0f 84 bd 03 00 00    	je     26c837a <intel_read_dp_sdp+0x6ba>
02fd  26c7fbd:	49 81 c5 68 1a 00 00 	add    $0x1a68,%r13
0304  26c7fc4:	4c 89 e8             	mov    %r13,%rax
0307  26c7fc7:	48 c1 e8 03          	shr    $0x3,%rax
030b  26c7fcb:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
030f  26c7fcf:	74 08                	je     26c7fd9 <intel_read_dp_sdp+0x319>
0311  26c7fd1:	4c 89 ef             	mov    %r13,%rdi
0314  26c7fd4:	e8 00 00 00 00       	call   26c7fd9 <intel_read_dp_sdp+0x319>	26c7fd5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0319  26c7fd9:	41 b8 24 00 00 00    	mov    $0x24,%r8d
031f  26c7fdf:	4c 89 ff             	mov    %r15,%rdi
0322  26c7fe2:	48 8b 34 24          	mov    (%rsp),%rsi
0326  26c7fe6:	ba 0a 00 00 00       	mov    $0xa,%edx
032b  26c7feb:	4c 89 e1             	mov    %r12,%rcx
032e  26c7fee:	41 ff 55 00          	call   *0x0(%r13)
0332  26c7ff2:	49 c1 ec 03          	shr    $0x3,%r12
0336  26c7ff6:	41 80 3c 1c 00       	cmpb   $0x0,(%r12,%rbx,1)
033b  26c7ffb:	0f 85 49 04 00 00    	jne    26c844a <intel_read_dp_sdp+0x78a>
0341  26c8001:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
0346  26c8006:	0f 85 86 00 00 00    	jne    26c8092 <intel_read_dp_sdp+0x3d2>
034c  26c800c:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
0351  26c8011:	84 c0                	test   %al,%al
0353  26c8013:	0f 85 78 04 00 00    	jne    26c8491 <intel_read_dp_sdp+0x7d1>
0359  26c8019:	80 7c 24 09 87       	cmpb   $0x87,0x9(%rsp)
035e  26c801e:	75 72                	jne    26c8092 <intel_read_dp_sdp+0x3d2>
0360  26c8020:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
0365  26c8025:	84 c0                	test   %al,%al
0367  26c8027:	0f 85 08 05 00 00    	jne    26c8535 <intel_read_dp_sdp+0x875>
036d  26c802d:	80 7c 24 0a 1d       	cmpb   $0x1d,0xa(%rsp)
0372  26c8032:	75 5e                	jne    26c8092 <intel_read_dp_sdp+0x3d2>
0374  26c8034:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
0379  26c8039:	84 c0                	test   %al,%al
037b  26c803b:	0f 85 a3 05 00 00    	jne    26c85e4 <intel_read_dp_sdp+0x924>
0381  26c8041:	80 7c 24 0b 4c       	cmpb   $0x4c,0xb(%rsp)
0386  26c8046:	75 4a                	jne    26c8092 <intel_read_dp_sdp+0x3d2>
0388  26c8048:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
038d  26c804d:	84 c0                	test   %al,%al
038f  26c804f:	0f 85 ab 05 00 00    	jne    26c8600 <intel_read_dp_sdp+0x940>
0395  26c8055:	80 7c 24 0c 01       	cmpb   $0x1,0xc(%rsp)
039a  26c805a:	75 36                	jne    26c8092 <intel_read_dp_sdp+0x3d2>
039c  26c805c:	41 0f b6 04 1c       	movzbl (%r12,%rbx,1),%eax
03a1  26c8061:	84 c0                	test   %al,%al
03a3  26c8063:	0f 85 ce 05 00 00    	jne    26c8637 <intel_read_dp_sdp+0x977>
03a9  26c8069:	80 7c 24 0d 1a       	cmpb   $0x1a,0xd(%rsp)
03ae  26c806e:	75 22                	jne    26c8092 <intel_read_dp_sdp+0x3d2>
03b0  26c8070:	48 8b 3c 24          	mov    (%rsp),%rdi
03b4  26c8074:	48 81 c7 ac 10 00 00 	add    $0x10ac,%rdi
03bb  26c807b:	48 8d 74 24 0e       	lea    0xe(%rsp),%rsi
03c0  26c8080:	ba 1a 00 00 00       	mov    $0x1a,%edx
03c5  26c8085:	e8 00 00 00 00       	call   26c808a <intel_read_dp_sdp+0x3ca>	26c8086: R_X86_64_PLT32	hdmi_drm_infoframe_unpack_only-0x4
03ca  26c808a:	85 c0                	test   %eax,%eax
03cc  26c808c:	0f 84 e8 02 00 00    	je     26c837a <intel_read_dp_sdp+0x6ba>
03d2  26c8092:	49 83 c6 18          	add    $0x18,%r14
03d6  26c8096:	4c 89 f0             	mov    %r14,%rax
03d9  26c8099:	48 c1 e8 03          	shr    $0x3,%rax
03dd  26c809d:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
03e1  26c80a1:	74 08                	je     26c80ab <intel_read_dp_sdp+0x3eb>
03e3  26c80a3:	4c 89 f7             	mov    %r14,%rdi
03e6  26c80a6:	e8 00 00 00 00       	call   26c80ab <intel_read_dp_sdp+0x3eb>	26c80a7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03eb  26c80ab:	49 8b 3e             	mov    (%r14),%rdi
03ee  26c80ae:	be 04 00 00 00       	mov    $0x4,%esi
03f3  26c80b3:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	26c80b6: R_X86_64_32S	.rodata+0x9a17a0
03fa  26c80ba:	e9 b6 02 00 00       	jmp    26c8375 <intel_read_dp_sdp+0x6b5>
03ff  26c80bf:	89 ea                	mov    %ebp,%edx
0401  26c80c1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	26c80c4: R_X86_64_32S	.rodata+0x9a04e0
0408  26c80c8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	26c80cb: R_X86_64_32S	.rodata+0x9a0520
040f  26c80cf:	e8 00 00 00 00       	call   26c80d4 <intel_read_dp_sdp+0x414>	26c80d0: R_X86_64_PLT32	__warn_printk-0x4
0414  26c80d4:	0f 0b                	ud2
0416  26c80d6:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
041f  26c80df:	48 3b 44 24 30       	cmp    0x30(%rsp),%rax
0424  26c80e4:	0f 85 b5 06 00 00    	jne    26c879f <intel_read_dp_sdp+0xadf>
042a  26c80ea:	e9 9f 02 00 00       	jmp    26c838e <intel_read_dp_sdp+0x6ce>
042f  26c80ef:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
0434  26c80f4:	84 c0                	test   %al,%al
0436  26c80f6:	0f 85 b1 03 00 00    	jne    26c84ad <intel_read_dp_sdp+0x7ed>
043c  26c80fc:	41 83 3c 24 0b       	cmpl   $0xb,(%r12)
0441  26c8101:	0f 85 a7 00 00 00    	jne    26c81ae <intel_read_dp_sdp+0x4ee>
0447  26c8107:	4d 8d af 40 01 00 00 	lea    0x140(%r15),%r13
044e  26c810e:	4c 89 e8             	mov    %r13,%rax
0451  26c8111:	48 c1 e8 03          	shr    $0x3,%rax
0455  26c8115:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0459  26c8119:	74 0e                	je     26c8129 <intel_read_dp_sdp+0x469>
045b  26c811b:	4c 89 ef             	mov    %r13,%rdi
045e  26c811e:	48 89 f5             	mov    %rsi,%rbp
0461  26c8121:	e8 00 00 00 00       	call   26c8126 <intel_read_dp_sdp+0x466>	26c8122: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0466  26c8126:	48 89 ee             	mov    %rbp,%rsi
0469  26c8129:	4d 8b 6d 00          	mov    0x0(%r13),%r13
046d  26c812d:	e9 19 fc ff ff       	jmp    26c7d4b <intel_read_dp_sdp+0x8b>
0472  26c8132:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
0477  26c8137:	84 c0                	test   %al,%al
0479  26c8139:	0f 85 92 03 00 00    	jne    26c84d1 <intel_read_dp_sdp+0x811>
047f  26c813f:	41 83 3c 24 0b       	cmpl   $0xb,(%r12)
0484  26c8144:	75 70                	jne    26c81b6 <intel_read_dp_sdp+0x4f6>
0486  26c8146:	4d 8d b7 40 01 00 00 	lea    0x140(%r15),%r14
048d  26c814d:	4c 89 f0             	mov    %r14,%rax
0490  26c8150:	48 c1 e8 03          	shr    $0x3,%rax
0494  26c8154:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
0498  26c8158:	74 0e                	je     26c8168 <intel_read_dp_sdp+0x4a8>
049a  26c815a:	4c 89 f7             	mov    %r14,%rdi
049d  26c815d:	49 89 f4             	mov    %rsi,%r12
04a0  26c8160:	e8 00 00 00 00       	call   26c8165 <intel_read_dp_sdp+0x4a5>	26c8161: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04a5  26c8165:	4c 89 e6             	mov    %r12,%rsi
04a8  26c8168:	49 8b 2e             	mov    (%r14),%rbp
04ab  26c816b:	e9 06 fc ff ff       	jmp    26c7d76 <intel_read_dp_sdp+0xb6>
04b0  26c8170:	41 0f b6 04 1e       	movzbl (%r14,%rbx,1),%eax
04b5  26c8175:	84 c0                	test   %al,%al
04b7  26c8177:	0f 85 78 03 00 00    	jne    26c84f5 <intel_read_dp_sdp+0x835>
04bd  26c817d:	41 83 3c 24 0b       	cmpl   $0xb,(%r12)
04c2  26c8182:	75 39                	jne    26c81bd <intel_read_dp_sdp+0x4fd>
04c4  26c8184:	4d 8d b7 40 01 00 00 	lea    0x140(%r15),%r14
04cb  26c818b:	4c 89 f0             	mov    %r14,%rax
04ce  26c818e:	48 c1 e8 03          	shr    $0x3,%rax
04d2  26c8192:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
04d6  26c8196:	74 0e                	je     26c81a6 <intel_read_dp_sdp+0x4e6>
04d8  26c8198:	4c 89 f7             	mov    %r14,%rdi
04db  26c819b:	49 89 f4             	mov    %rsi,%r12
04de  26c819e:	e8 00 00 00 00       	call   26c81a3 <intel_read_dp_sdp+0x4e3>	26c819f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e3  26c81a3:	4c 89 e6             	mov    %r12,%rsi
04e6  26c81a6:	4d 8b 2e             	mov    (%r14),%r13
04e9  26c81a9:	e9 b0 fd ff ff       	jmp    26c7f5e <intel_read_dp_sdp+0x29e>
04ee  26c81ae:	45 31 ed             	xor    %r13d,%r13d
04f1  26c81b1:	e9 95 fb ff ff       	jmp    26c7d4b <intel_read_dp_sdp+0x8b>
04f6  26c81b6:	31 ed                	xor    %ebp,%ebp
04f8  26c81b8:	e9 b9 fb ff ff       	jmp    26c7d76 <intel_read_dp_sdp+0xb6>
04fd  26c81bd:	45 31 ed             	xor    %r13d,%r13d
0500  26c81c0:	e9 99 fd ff ff       	jmp    26c7f5e <intel_read_dp_sdp+0x29e>
0505  26c81c5:	4c 89 f8             	mov    %r15,%rax
0508  26c81c8:	48 c1 e8 03          	shr    $0x3,%rax
050c  26c81cc:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0510  26c81d0:	84 c0                	test   %al,%al
0512  26c81d2:	0f 85 7b 04 00 00    	jne    26c8653 <intel_read_dp_sdp+0x993>
0518  26c81d8:	80 7c 24 0b 13       	cmpb   $0x13,0xb(%rsp)
051d  26c81dd:	0f 85 6a 01 00 00    	jne    26c834d <intel_read_dp_sdp+0x68d>
0523  26c81e3:	48 8d 7c 24 1c       	lea    0x1c(%rsp),%rdi
0528  26c81e8:	48 89 f8             	mov    %rdi,%rax
052b  26c81eb:	48 c1 e8 03          	shr    $0x3,%rax
052f  26c81ef:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0533  26c81f3:	84 c0                	test   %al,%al
0535  26c81f5:	0f 85 8e 04 00 00    	jne    26c8689 <intel_read_dp_sdp+0x9c9>
053b  26c81fb:	0f b6 6c 24 1c       	movzbl 0x1c(%rsp),%ebp
0540  26c8200:	41 89 ef             	mov    %ebp,%r15d
0543  26c8203:	41 c1 ef 04          	shr    $0x4,%r15d
0547  26c8207:	48 8b 14 24          	mov    (%rsp),%rdx
054b  26c820b:	48 8d ba f4 10 00 00 	lea    0x10f4(%rdx),%rdi
0552  26c8212:	48 89 f8             	mov    %rdi,%rax
0555  26c8215:	48 c1 e8 03          	shr    $0x3,%rax
0559  26c8219:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
055d  26c821d:	84 c0                	test   %al,%al
055f  26c821f:	0f 85 7b 04 00 00    	jne    26c86a0 <intel_read_dp_sdp+0x9e0>
0565  26c8225:	44 89 ba f4 10 00 00 	mov    %r15d,0x10f4(%rdx)
056c  26c822c:	83 e5 0f             	and    $0xf,%ebp
056f  26c822f:	4c 8d ba f8 10 00 00 	lea    0x10f8(%rdx),%r15
0576  26c8236:	4c 89 f8             	mov    %r15,%rax
0579  26c8239:	48 c1 e8 03          	shr    $0x3,%rax
057d  26c823d:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0581  26c8241:	84 c0                	test   %al,%al
0583  26c8243:	0f 85 75 04 00 00    	jne    26c86be <intel_read_dp_sdp+0x9fe>
0589  26c8249:	41 89 2f             	mov    %ebp,(%r15)
058c  26c824c:	48 8d 7c 24 1d       	lea    0x1d(%rsp),%rdi
0591  26c8251:	48 89 f8             	mov    %rdi,%rax
0594  26c8254:	48 c1 e8 03          	shr    $0x3,%rax
0598  26c8258:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
059c  26c825c:	84 c0                	test   %al,%al
059e  26c825e:	0f 85 7c 04 00 00    	jne    26c86e0 <intel_read_dp_sdp+0xa20>
05a4  26c8264:	44 0f b6 7c 24 1d    	movzbl 0x1d(%rsp),%r15d
05aa  26c826a:	44 89 fd             	mov    %r15d,%ebp
05ad  26c826d:	c1 ed 07             	shr    $0x7,%ebp
05b0  26c8270:	4c 8d a2 00 11 00 00 	lea    0x1100(%rdx),%r12
05b7  26c8277:	4c 89 e0             	mov    %r12,%rax
05ba  26c827a:	48 c1 e8 03          	shr    $0x3,%rax
05be  26c827e:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
05c2  26c8282:	84 c0                	test   %al,%al
05c4  26c8284:	0f 85 71 04 00 00    	jne    26c86fb <intel_read_dp_sdp+0xa3b>
05ca  26c828a:	41 89 2c 24          	mov    %ebp,(%r12)
05ce  26c828e:	41 83 e7 07          	and    $0x7,%r15d
05d2  26c8292:	41 80 ff 05          	cmp    $0x5,%r15b
05d6  26c8296:	0f 83 99 00 00 00    	jae    26c8335 <intel_read_dp_sdp+0x675>
05dc  26c829c:	41 0f b6 c7          	movzbl %r15b,%eax
05e0  26c82a0:	4c 8d 34 85 00 00 00 00 	lea    0x0(,%rax,4),%r14	26c82a4: R_X86_64_32S	.rodata+0x9a3ba0
05e8  26c82a8:	4c 89 f0             	mov    %r14,%rax
05eb  26c82ab:	48 c1 e8 03          	shr    $0x3,%rax
05ef  26c82af:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
05f3  26c82b3:	84 c0                	test   %al,%al
05f5  26c82b5:	0f 85 62 04 00 00    	jne    26c871d <intel_read_dp_sdp+0xa5d>
05fb  26c82bb:	41 8b 2e             	mov    (%r14),%ebp
05fe  26c82be:	4c 8d b2 fc 10 00 00 	lea    0x10fc(%rdx),%r14
0605  26c82c5:	4c 89 f0             	mov    %r14,%rax
0608  26c82c8:	48 c1 e8 03          	shr    $0x3,%rax
060c  26c82cc:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0610  26c82d0:	84 c0                	test   %al,%al
0612  26c82d2:	0f 85 67 04 00 00    	jne    26c873f <intel_read_dp_sdp+0xa7f>
0618  26c82d8:	41 89 2e             	mov    %ebp,(%r14)
061b  26c82db:	48 8d 7c 24 1e       	lea    0x1e(%rsp),%rdi
0620  26c82e0:	48 89 f8             	mov    %rdi,%rax
0623  26c82e3:	48 c1 e8 03          	shr    $0x3,%rax
0627  26c82e7:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
062b  26c82eb:	84 c0                	test   %al,%al
062d  26c82ed:	0f 85 6e 04 00 00    	jne    26c8761 <intel_read_dp_sdp+0xaa1>
0633  26c82f3:	0f b6 6c 24 1e       	movzbl 0x1e(%rsp),%ebp
0638  26c82f8:	83 e5 07             	and    $0x7,%ebp
063b  26c82fb:	48 81 c2 04 11 00 00 	add    $0x1104,%rdx
0642  26c8302:	48 89 d0             	mov    %rdx,%rax
0645  26c8305:	48 c1 e8 03          	shr    $0x3,%rax
0649  26c8309:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
064d  26c830d:	84 c0                	test   %al,%al
064f  26c830f:	0f 85 67 04 00 00    	jne    26c877c <intel_read_dp_sdp+0xabc>
0655  26c8315:	89 2a                	mov    %ebp,(%rdx)
0657  26c8317:	eb 61                	jmp    26c837a <intel_read_dp_sdp+0x6ba>
0659  26c8319:	4c 89 f8             	mov    %r15,%rax
065c  26c831c:	48 c1 e8 03          	shr    $0x3,%rax
0660  26c8320:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
0664  26c8324:	84 c0                	test   %al,%al
0666  26c8326:	0f 85 42 03 00 00    	jne    26c866e <intel_read_dp_sdp+0x9ae>
066c  26c832c:	80 7c 24 0b 0e       	cmpb   $0xe,0xb(%rsp)
0671  26c8331:	75 1a                	jne    26c834d <intel_read_dp_sdp+0x68d>
0673  26c8333:	eb 45                	jmp    26c837a <intel_read_dp_sdp+0x6ba>
0675  26c8335:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	26c8338: R_X86_64_32S	.rodata+0x9a04e0
067c  26c833c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	26c833f: R_X86_64_32S	.rodata+0x9a1760
0683  26c8343:	4c 89 fa             	mov    %r15,%rdx
0686  26c8346:	e8 00 00 00 00       	call   26c834b <intel_read_dp_sdp+0x68b>	26c8347: R_X86_64_PLT32	__warn_printk-0x4
068b  26c834b:	0f 0b                	ud2
068d  26c834d:	49 83 c6 18          	add    $0x18,%r14
0691  26c8351:	4c 89 f0             	mov    %r14,%rax
0694  26c8354:	48 c1 e8 03          	shr    $0x3,%rax
0698  26c8358:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
069c  26c835c:	74 08                	je     26c8366 <intel_read_dp_sdp+0x6a6>
069e  26c835e:	4c 89 f7             	mov    %r14,%rdi
06a1  26c8361:	e8 00 00 00 00       	call   26c8366 <intel_read_dp_sdp+0x6a6>	26c8362: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06a6  26c8366:	49 8b 3e             	mov    (%r14),%rdi
06a9  26c8369:	be 04 00 00 00       	mov    $0x4,%esi
06ae  26c836e:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	26c8371: R_X86_64_32S	.rodata+0x9a1720
06b5  26c8375:	e8 00 00 00 00       	call   26c837a <intel_read_dp_sdp+0x6ba>	26c8376: R_X86_64_PLT32	drm_dev_dbg-0x4
06ba  26c837a:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
06c3  26c8383:	48 3b 44 24 30       	cmp    0x30(%rsp),%rax
06c8  26c8388:	0f 85 11 04 00 00    	jne    26c879f <intel_read_dp_sdp+0xadf>
06ce  26c838e:	48 83 c4 38          	add    $0x38,%rsp
06d2  26c8392:	5b                   	pop    %rbx
06d3  26c8393:	41 5c                	pop    %r12
06d5  26c8395:	41 5d                	pop    %r13
06d7  26c8397:	41 5e                	pop    %r14
06d9  26c8399:	41 5f                	pop    %r15
06db  26c839b:	5d                   	pop    %rbp
06dc  26c839c:	c3                   	ret
06dd  26c839d:	44 89 e1             	mov    %r12d,%ecx
06e0  26c83a0:	80 e1 07             	and    $0x7,%cl
06e3  26c83a3:	80 c1 03             	add    $0x3,%cl
06e6  26c83a6:	38 c1                	cmp    %al,%cl
06e8  26c83a8:	0f 8c 55 f9 ff ff    	jl     26c7d03 <intel_read_dp_sdp+0x43>
06ee  26c83ae:	4c 89 e7             	mov    %r12,%rdi
06f1  26c83b1:	49 89 f5             	mov    %rsi,%r13
06f4  26c83b4:	e8 00 00 00 00       	call   26c83b9 <intel_read_dp_sdp+0x6f9>	26c83b5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
06f9  26c83b9:	4c 89 ee             	mov    %r13,%rsi
06fc  26c83bc:	e9 42 f9 ff ff       	jmp    26c7d03 <intel_read_dp_sdp+0x43>
0701  26c83c1:	44 89 e1             	mov    %r12d,%ecx
0704  26c83c4:	80 e1 07             	and    $0x7,%cl
0707  26c83c7:	80 c1 03             	add    $0x3,%cl
070a  26c83ca:	38 c1                	cmp    %al,%cl
070c  26c83cc:	0f 8c 5b f9 ff ff    	jl     26c7d2d <intel_read_dp_sdp+0x6d>
0712  26c83d2:	4c 89 e7             	mov    %r12,%rdi
0715  26c83d5:	49 89 f5             	mov    %rsi,%r13
0718  26c83d8:	e8 00 00 00 00       	call   26c83dd <intel_read_dp_sdp+0x71d>	26c83d9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
071d  26c83dd:	4c 89 ee             	mov    %r13,%rsi
0720  26c83e0:	e9 48 f9 ff ff       	jmp    26c7d2d <intel_read_dp_sdp+0x6d>
0725  26c83e5:	44 89 e1             	mov    %r12d,%ecx
0728  26c83e8:	80 e1 07             	and    $0x7,%cl
072b  26c83eb:	80 c1 03             	add    $0x3,%cl
072e  26c83ee:	38 c1                	cmp    %al,%cl
0730  26c83f0:	0f 8c 62 f9 ff ff    	jl     26c7d58 <intel_read_dp_sdp+0x98>
0736  26c83f6:	4c 89 e7             	mov    %r12,%rdi
0739  26c83f9:	48 89 f5             	mov    %rsi,%rbp
073c  26c83fc:	e8 00 00 00 00       	call   26c8401 <intel_read_dp_sdp+0x741>	26c83fd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0741  26c8401:	48 89 ee             	mov    %rbp,%rsi
0744  26c8404:	e9 4f f9 ff ff       	jmp    26c7d58 <intel_read_dp_sdp+0x98>
0749  26c8409:	44 89 e1             	mov    %r12d,%ecx
074c  26c840c:	80 e1 07             	and    $0x7,%cl
074f  26c840f:	80 c1 03             	add    $0x3,%cl
0752  26c8412:	38 c1                	cmp    %al,%cl
0754  26c8414:	0f 8c 26 fb ff ff    	jl     26c7f40 <intel_read_dp_sdp+0x280>
075a  26c841a:	4c 89 e7             	mov    %r12,%rdi
075d  26c841d:	49 89 f5             	mov    %rsi,%r13
0760  26c8420:	e8 00 00 00 00       	call   26c8425 <intel_read_dp_sdp+0x765>	26c8421: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0765  26c8425:	4c 89 ee             	mov    %r13,%rsi
0768  26c8428:	e9 13 fb ff ff       	jmp    26c7f40 <intel_read_dp_sdp+0x280>
076d  26c842d:	89 e9                	mov    %ebp,%ecx
076f  26c842f:	80 e1 07             	and    $0x7,%cl
0772  26c8432:	80 c1 03             	add    $0x3,%cl
0775  26c8435:	38 c1                	cmp    %al,%cl
0777  26c8437:	0f 8c 6b fb ff ff    	jl     26c7fa8 <intel_read_dp_sdp+0x2e8>
077d  26c843d:	48 89 ef             	mov    %rbp,%rdi
0780  26c8440:	e8 00 00 00 00       	call   26c8445 <intel_read_dp_sdp+0x785>	26c8441: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0785  26c8445:	e9 5e fb ff ff       	jmp    26c7fa8 <intel_read_dp_sdp+0x2e8>
078a  26c844a:	0f 8f b1 fb ff ff    	jg     26c8001 <intel_read_dp_sdp+0x341>
0790  26c8450:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0795  26c8455:	e8 00 00 00 00       	call   26c845a <intel_read_dp_sdp+0x79a>	26c8456: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
079a  26c845a:	e9 a2 fb ff ff       	jmp    26c8001 <intel_read_dp_sdp+0x341>
079f  26c845f:	89 e9                	mov    %ebp,%ecx
07a1  26c8461:	80 e1 07             	and    $0x7,%cl
07a4  26c8464:	80 c1 03             	add    $0x3,%cl
07a7  26c8467:	38 c1                	cmp    %al,%cl
07a9  26c8469:	0f 8c 6c f9 ff ff    	jl     26c7ddb <intel_read_dp_sdp+0x11b>
07af  26c846f:	48 89 ef             	mov    %rbp,%rdi
07b2  26c8472:	e8 00 00 00 00       	call   26c8477 <intel_read_dp_sdp+0x7b7>	26c8473: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
07b7  26c8477:	e9 5f f9 ff ff       	jmp    26c7ddb <intel_read_dp_sdp+0x11b>
07bc  26c847c:	0f 8f cc f9 ff ff    	jg     26c7e4e <intel_read_dp_sdp+0x18e>
07c2  26c8482:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
07c7  26c8487:	e8 00 00 00 00       	call   26c848c <intel_read_dp_sdp+0x7cc>	26c8488: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
07cc  26c848c:	e9 bd f9 ff ff       	jmp    26c7e4e <intel_read_dp_sdp+0x18e>
07d1  26c8491:	48 8d 7c 24 09       	lea    0x9(%rsp),%rdi
07d6  26c8496:	89 f9                	mov    %edi,%ecx
07d8  26c8498:	80 e1 07             	and    $0x7,%cl
07db  26c849b:	38 c1                	cmp    %al,%cl
07dd  26c849d:	0f 8c 76 fb ff ff    	jl     26c8019 <intel_read_dp_sdp+0x359>
07e3  26c84a3:	e8 00 00 00 00       	call   26c84a8 <intel_read_dp_sdp+0x7e8>	26c84a4: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
07e8  26c84a8:	e9 6c fb ff ff       	jmp    26c8019 <intel_read_dp_sdp+0x359>
07ed  26c84ad:	44 89 e1             	mov    %r12d,%ecx
07f0  26c84b0:	80 e1 07             	and    $0x7,%cl
07f3  26c84b3:	80 c1 03             	add    $0x3,%cl
07f6  26c84b6:	38 c1                	cmp    %al,%cl
07f8  26c84b8:	0f 8c 3e fc ff ff    	jl     26c80fc <intel_read_dp_sdp+0x43c>
07fe  26c84be:	4c 89 e7             	mov    %r12,%rdi
0801  26c84c1:	49 89 f5             	mov    %rsi,%r13
0804  26c84c4:	e8 00 00 00 00       	call   26c84c9 <intel_read_dp_sdp+0x809>	26c84c5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0809  26c84c9:	4c 89 ee             	mov    %r13,%rsi
080c  26c84cc:	e9 2b fc ff ff       	jmp    26c80fc <intel_read_dp_sdp+0x43c>
0811  26c84d1:	44 89 e1             	mov    %r12d,%ecx
0814  26c84d4:	80 e1 07             	and    $0x7,%cl
0817  26c84d7:	80 c1 03             	add    $0x3,%cl
081a  26c84da:	38 c1                	cmp    %al,%cl
081c  26c84dc:	0f 8c 5d fc ff ff    	jl     26c813f <intel_read_dp_sdp+0x47f>
0822  26c84e2:	4c 89 e7             	mov    %r12,%rdi
0825  26c84e5:	49 89 f6             	mov    %rsi,%r14
0828  26c84e8:	e8 00 00 00 00       	call   26c84ed <intel_read_dp_sdp+0x82d>	26c84e9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
082d  26c84ed:	4c 89 f6             	mov    %r14,%rsi
0830  26c84f0:	e9 4a fc ff ff       	jmp    26c813f <intel_read_dp_sdp+0x47f>
0835  26c84f5:	44 89 e1             	mov    %r12d,%ecx
0838  26c84f8:	80 e1 07             	and    $0x7,%cl
083b  26c84fb:	80 c1 03             	add    $0x3,%cl
083e  26c84fe:	38 c1                	cmp    %al,%cl
0840  26c8500:	0f 8c 77 fc ff ff    	jl     26c817d <intel_read_dp_sdp+0x4bd>
0846  26c8506:	4c 89 e7             	mov    %r12,%rdi
0849  26c8509:	49 89 f6             	mov    %rsi,%r14
084c  26c850c:	e8 00 00 00 00       	call   26c8511 <intel_read_dp_sdp+0x851>	26c850d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0851  26c8511:	4c 89 f6             	mov    %r14,%rsi
0854  26c8514:	e9 64 fc ff ff       	jmp    26c817d <intel_read_dp_sdp+0x4bd>
0859  26c8519:	48 8d 7c 24 09       	lea    0x9(%rsp),%rdi
085e  26c851e:	89 f9                	mov    %edi,%ecx
0860  26c8520:	80 e1 07             	and    $0x7,%cl
0863  26c8523:	38 c1                	cmp    %al,%cl
0865  26c8525:	0f 8c 3b f9 ff ff    	jl     26c7e66 <intel_read_dp_sdp+0x1a6>
086b  26c852b:	e8 00 00 00 00       	call   26c8530 <intel_read_dp_sdp+0x870>	26c852c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0870  26c8530:	e9 31 f9 ff ff       	jmp    26c7e66 <intel_read_dp_sdp+0x1a6>
0875  26c8535:	48 8d 7c 24 0a       	lea    0xa(%rsp),%rdi
087a  26c853a:	89 f9                	mov    %edi,%ecx
087c  26c853c:	80 e1 07             	and    $0x7,%cl
087f  26c853f:	38 c1                	cmp    %al,%cl
0881  26c8541:	0f 8c e6 fa ff ff    	jl     26c802d <intel_read_dp_sdp+0x36d>
0887  26c8547:	e8 00 00 00 00       	call   26c854c <intel_read_dp_sdp+0x88c>	26c8548: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
088c  26c854c:	e9 dc fa ff ff       	jmp    26c802d <intel_read_dp_sdp+0x36d>
0891  26c8551:	89 e9                	mov    %ebp,%ecx
0893  26c8553:	80 e1 07             	and    $0x7,%cl
0896  26c8556:	38 c1                	cmp    %al,%cl
0898  26c8558:	0f 8c 26 f9 ff ff    	jl     26c7e84 <intel_read_dp_sdp+0x1c4>
089e  26c855e:	48 89 ef             	mov    %rbp,%rdi
08a1  26c8561:	e8 00 00 00 00       	call   26c8566 <intel_read_dp_sdp+0x8a6>	26c8562: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
08a6  26c8566:	e9 19 f9 ff ff       	jmp    26c7e84 <intel_read_dp_sdp+0x1c4>
08ab  26c856b:	48 8d 7c 24 0a       	lea    0xa(%rsp),%rdi
08b0  26c8570:	89 f9                	mov    %edi,%ecx
08b2  26c8572:	80 e1 07             	and    $0x7,%cl
08b5  26c8575:	38 c1                	cmp    %al,%cl
08b7  26c8577:	0f 8c 1c f9 ff ff    	jl     26c7e99 <intel_read_dp_sdp+0x1d9>
08bd  26c857d:	e8 00 00 00 00       	call   26c8582 <intel_read_dp_sdp+0x8c2>	26c857e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
08c2  26c8582:	48 8b 14 24          	mov    (%rsp),%rdx
08c6  26c8586:	e9 0e f9 ff ff       	jmp    26c7e99 <intel_read_dp_sdp+0x1d9>
08cb  26c858b:	44 89 f9             	mov    %r15d,%ecx
08ce  26c858e:	80 e1 07             	and    $0x7,%cl
08d1  26c8591:	38 c1                	cmp    %al,%cl
08d3  26c8593:	0f 8c 1f f9 ff ff    	jl     26c7eb8 <intel_read_dp_sdp+0x1f8>
08d9  26c8599:	4c 89 ff             	mov    %r15,%rdi
08dc  26c859c:	e8 00 00 00 00       	call   26c85a1 <intel_read_dp_sdp+0x8e1>	26c859d: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
08e1  26c85a1:	48 8b 14 24          	mov    (%rsp),%rdx
08e5  26c85a5:	e9 0e f9 ff ff       	jmp    26c7eb8 <intel_read_dp_sdp+0x1f8>
08ea  26c85aa:	44 89 f9             	mov    %r15d,%ecx
08ed  26c85ad:	80 e1 07             	and    $0x7,%cl
08f0  26c85b0:	38 c1                	cmp    %al,%cl
08f2  26c85b2:	0f 8c 15 f9 ff ff    	jl     26c7ecd <intel_read_dp_sdp+0x20d>
08f8  26c85b8:	4c 89 ff             	mov    %r15,%rdi
08fb  26c85bb:	e8 00 00 00 00       	call   26c85c0 <intel_read_dp_sdp+0x900>	26c85bc: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0900  26c85c0:	48 8b 14 24          	mov    (%rsp),%rdx
0904  26c85c4:	e9 04 f9 ff ff       	jmp    26c7ecd <intel_read_dp_sdp+0x20d>
0909  26c85c9:	44 89 e1             	mov    %r12d,%ecx
090c  26c85cc:	80 e1 07             	and    $0x7,%cl
090f  26c85cf:	38 c1                	cmp    %al,%cl
0911  26c85d1:	0f 8c 15 f9 ff ff    	jl     26c7eec <intel_read_dp_sdp+0x22c>
0917  26c85d7:	4c 89 e7             	mov    %r12,%rdi
091a  26c85da:	e8 00 00 00 00       	call   26c85df <intel_read_dp_sdp+0x91f>	26c85db: R_X86_64_PLT32	__asan_report_store1_noabort-0x4
091f  26c85df:	e9 08 f9 ff ff       	jmp    26c7eec <intel_read_dp_sdp+0x22c>
0924  26c85e4:	48 8d 7c 24 0b       	lea    0xb(%rsp),%rdi
0929  26c85e9:	89 f9                	mov    %edi,%ecx
092b  26c85eb:	80 e1 07             	and    $0x7,%cl
092e  26c85ee:	38 c1                	cmp    %al,%cl
0930  26c85f0:	0f 8c 4b fa ff ff    	jl     26c8041 <intel_read_dp_sdp+0x381>
0936  26c85f6:	e8 00 00 00 00       	call   26c85fb <intel_read_dp_sdp+0x93b>	26c85f7: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
093b  26c85fb:	e9 41 fa ff ff       	jmp    26c8041 <intel_read_dp_sdp+0x381>
0940  26c8600:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
0945  26c8605:	89 f9                	mov    %edi,%ecx
0947  26c8607:	80 e1 07             	and    $0x7,%cl
094a  26c860a:	38 c1                	cmp    %al,%cl
094c  26c860c:	0f 8c 43 fa ff ff    	jl     26c8055 <intel_read_dp_sdp+0x395>
0952  26c8612:	e8 00 00 00 00       	call   26c8617 <intel_read_dp_sdp+0x957>	26c8613: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0957  26c8617:	e9 39 fa ff ff       	jmp    26c8055 <intel_read_dp_sdp+0x395>
095c  26c861c:	44 89 f9             	mov    %r15d,%ecx
095f  26c861f:	80 e1 07             	and    $0x7,%cl
0962  26c8622:	38 c1                	cmp    %al,%cl
0964  26c8624:	0f 8c f9 f8 ff ff    	jl     26c7f23 <intel_read_dp_sdp+0x263>
096a  26c862a:	4c 89 ff             	mov    %r15,%rdi
096d  26c862d:	e8 00 00 00 00       	call   26c8632 <intel_read_dp_sdp+0x972>	26c862e: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0972  26c8632:	e9 ec f8 ff ff       	jmp    26c7f23 <intel_read_dp_sdp+0x263>
0977  26c8637:	48 8d 7c 24 0d       	lea    0xd(%rsp),%rdi
097c  26c863c:	89 f9                	mov    %edi,%ecx
097e  26c863e:	80 e1 07             	and    $0x7,%cl
0981  26c8641:	38 c1                	cmp    %al,%cl
0983  26c8643:	0f 8c 20 fa ff ff    	jl     26c8069 <intel_read_dp_sdp+0x3a9>
0989  26c8649:	e8 00 00 00 00       	call   26c864e <intel_read_dp_sdp+0x98e>	26c864a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
098e  26c864e:	e9 16 fa ff ff       	jmp    26c8069 <intel_read_dp_sdp+0x3a9>
0993  26c8653:	44 89 f9             	mov    %r15d,%ecx
0996  26c8656:	80 e1 07             	and    $0x7,%cl
0999  26c8659:	38 c1                	cmp    %al,%cl
099b  26c865b:	0f 8c 77 fb ff ff    	jl     26c81d8 <intel_read_dp_sdp+0x518>
09a1  26c8661:	4c 89 ff             	mov    %r15,%rdi
09a4  26c8664:	e8 00 00 00 00       	call   26c8669 <intel_read_dp_sdp+0x9a9>	26c8665: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
09a9  26c8669:	e9 6a fb ff ff       	jmp    26c81d8 <intel_read_dp_sdp+0x518>
09ae  26c866e:	44 89 f9             	mov    %r15d,%ecx
09b1  26c8671:	80 e1 07             	and    $0x7,%cl
09b4  26c8674:	38 c1                	cmp    %al,%cl
09b6  26c8676:	0f 8c b0 fc ff ff    	jl     26c832c <intel_read_dp_sdp+0x66c>
09bc  26c867c:	4c 89 ff             	mov    %r15,%rdi
09bf  26c867f:	e8 00 00 00 00       	call   26c8684 <intel_read_dp_sdp+0x9c4>	26c8680: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
09c4  26c8684:	e9 a3 fc ff ff       	jmp    26c832c <intel_read_dp_sdp+0x66c>
09c9  26c8689:	89 f9                	mov    %edi,%ecx
09cb  26c868b:	80 e1 07             	and    $0x7,%cl
09ce  26c868e:	38 c1                	cmp    %al,%cl
09d0  26c8690:	0f 8c 65 fb ff ff    	jl     26c81fb <intel_read_dp_sdp+0x53b>
09d6  26c8696:	e8 00 00 00 00       	call   26c869b <intel_read_dp_sdp+0x9db>	26c8697: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
09db  26c869b:	e9 5b fb ff ff       	jmp    26c81fb <intel_read_dp_sdp+0x53b>
09e0  26c86a0:	89 f9                	mov    %edi,%ecx
09e2  26c86a2:	80 e1 07             	and    $0x7,%cl
09e5  26c86a5:	80 c1 03             	add    $0x3,%cl
09e8  26c86a8:	38 c1                	cmp    %al,%cl
09ea  26c86aa:	0f 8c 75 fb ff ff    	jl     26c8225 <intel_read_dp_sdp+0x565>
09f0  26c86b0:	e8 00 00 00 00       	call   26c86b5 <intel_read_dp_sdp+0x9f5>	26c86b1: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
09f5  26c86b5:	48 8b 14 24          	mov    (%rsp),%rdx
09f9  26c86b9:	e9 67 fb ff ff       	jmp    26c8225 <intel_read_dp_sdp+0x565>
09fe  26c86be:	44 89 f9             	mov    %r15d,%ecx
0a01  26c86c1:	80 e1 07             	and    $0x7,%cl
0a04  26c86c4:	80 c1 03             	add    $0x3,%cl
0a07  26c86c7:	38 c1                	cmp    %al,%cl
0a09  26c86c9:	0f 8c 7a fb ff ff    	jl     26c8249 <intel_read_dp_sdp+0x589>
0a0f  26c86cf:	4c 89 ff             	mov    %r15,%rdi
0a12  26c86d2:	e8 00 00 00 00       	call   26c86d7 <intel_read_dp_sdp+0xa17>	26c86d3: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0a17  26c86d7:	48 8b 14 24          	mov    (%rsp),%rdx
0a1b  26c86db:	e9 69 fb ff ff       	jmp    26c8249 <intel_read_dp_sdp+0x589>
0a20  26c86e0:	89 f9                	mov    %edi,%ecx
0a22  26c86e2:	80 e1 07             	and    $0x7,%cl
0a25  26c86e5:	38 c1                	cmp    %al,%cl
0a27  26c86e7:	0f 8c 77 fb ff ff    	jl     26c8264 <intel_read_dp_sdp+0x5a4>
0a2d  26c86ed:	e8 00 00 00 00       	call   26c86f2 <intel_read_dp_sdp+0xa32>	26c86ee: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0a32  26c86f2:	48 8b 14 24          	mov    (%rsp),%rdx
0a36  26c86f6:	e9 69 fb ff ff       	jmp    26c8264 <intel_read_dp_sdp+0x5a4>
0a3b  26c86fb:	44 89 e1             	mov    %r12d,%ecx
0a3e  26c86fe:	80 e1 07             	and    $0x7,%cl
0a41  26c8701:	80 c1 03             	add    $0x3,%cl
0a44  26c8704:	38 c1                	cmp    %al,%cl
0a46  26c8706:	0f 8c 7e fb ff ff    	jl     26c828a <intel_read_dp_sdp+0x5ca>
0a4c  26c870c:	4c 89 e7             	mov    %r12,%rdi
0a4f  26c870f:	e8 00 00 00 00       	call   26c8714 <intel_read_dp_sdp+0xa54>	26c8710: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0a54  26c8714:	48 8b 14 24          	mov    (%rsp),%rdx
0a58  26c8718:	e9 6d fb ff ff       	jmp    26c828a <intel_read_dp_sdp+0x5ca>
0a5d  26c871d:	44 89 f1             	mov    %r14d,%ecx
0a60  26c8720:	80 e1 07             	and    $0x7,%cl
0a63  26c8723:	80 c1 03             	add    $0x3,%cl
0a66  26c8726:	38 c1                	cmp    %al,%cl
0a68  26c8728:	0f 8c 8d fb ff ff    	jl     26c82bb <intel_read_dp_sdp+0x5fb>
0a6e  26c872e:	4c 89 f7             	mov    %r14,%rdi
0a71  26c8731:	e8 00 00 00 00       	call   26c8736 <intel_read_dp_sdp+0xa76>	26c8732: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0a76  26c8736:	48 8b 14 24          	mov    (%rsp),%rdx
0a7a  26c873a:	e9 7c fb ff ff       	jmp    26c82bb <intel_read_dp_sdp+0x5fb>
0a7f  26c873f:	44 89 f1             	mov    %r14d,%ecx
0a82  26c8742:	80 e1 07             	and    $0x7,%cl
0a85  26c8745:	80 c1 03             	add    $0x3,%cl
0a88  26c8748:	38 c1                	cmp    %al,%cl
0a8a  26c874a:	0f 8c 88 fb ff ff    	jl     26c82d8 <intel_read_dp_sdp+0x618>
0a90  26c8750:	4c 89 f7             	mov    %r14,%rdi
0a93  26c8753:	e8 00 00 00 00       	call   26c8758 <intel_read_dp_sdp+0xa98>	26c8754: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0a98  26c8758:	48 8b 14 24          	mov    (%rsp),%rdx
0a9c  26c875c:	e9 77 fb ff ff       	jmp    26c82d8 <intel_read_dp_sdp+0x618>
0aa1  26c8761:	89 f9                	mov    %edi,%ecx
0aa3  26c8763:	80 e1 07             	and    $0x7,%cl
0aa6  26c8766:	38 c1                	cmp    %al,%cl
0aa8  26c8768:	0f 8c 85 fb ff ff    	jl     26c82f3 <intel_read_dp_sdp+0x633>
0aae  26c876e:	e8 00 00 00 00       	call   26c8773 <intel_read_dp_sdp+0xab3>	26c876f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0ab3  26c8773:	48 8b 14 24          	mov    (%rsp),%rdx
0ab7  26c8777:	e9 77 fb ff ff       	jmp    26c82f3 <intel_read_dp_sdp+0x633>
0abc  26c877c:	89 d1                	mov    %edx,%ecx
0abe  26c877e:	80 e1 07             	and    $0x7,%cl
0ac1  26c8781:	80 c1 03             	add    $0x3,%cl
0ac4  26c8784:	38 c1                	cmp    %al,%cl
0ac6  26c8786:	0f 8c 89 fb ff ff    	jl     26c8315 <intel_read_dp_sdp+0x655>
0acc  26c878c:	48 89 d7             	mov    %rdx,%rdi
0acf  26c878f:	48 89 d3             	mov    %rdx,%rbx
0ad2  26c8792:	e8 00 00 00 00       	call   26c8797 <intel_read_dp_sdp+0xad7>	26c8793: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0ad7  26c8797:	48 89 da             	mov    %rbx,%rdx
0ada  26c879a:	e9 76 fb ff ff       	jmp    26c8315 <intel_read_dp_sdp+0x655>
0adf  26c879f:	e8 00 00 00 00       	call   26c87a4 <intel_read_dp_sdp+0xae4>	26c87a0: R_X86_64_PLT32	__stack_chk_fail-0x4
0ae4  26c87a4:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
0aef  26c87af:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
