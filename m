Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE172F4D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688734323; x=1720270323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4C4QmiilBRbbPdQk3M7ScIPzh+9lgjX3msYSL/BxeII=;
  b=cfGILNZyXS/InDwQIliS0mriR20r5n/f1RlVugqrz5pTEe66xtqjtcIN
   y7yoAkDvmPMSX9uh/ncUHZ5G3TZ5NjSJkp4yqunAEmgl+Ci1DY62opVqa
   ETzH9S67UUmA6Dji8KwB5b2xPcYaJXlo1fhLwHO4EiaQtwbqlNk4L4We+
   SPaLWyTAa4sIsP76n9Nw1yPsOVwZ5Pv076UuV/b1BQNIVox6ASkChxGBL
   wYZ9JRtPouJpHCvFshL93nzzvZMSjJ3JFmvIRwKPUmOhNxR7yZJqZYWtt
   yDU3BpD3vtc9hx/cH3Fq3J2GLXH+1heF5Hw4+aiCwAkzXD2KmGo6GW4nf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="362749406"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="362749406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 05:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="966642332"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966642332"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2023 05:51:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHkwI-0001zi-1w;
	Fri, 07 Jul 2023 12:51:58 +0000
Date: Fri, 7 Jul 2023 20:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 90/526] vmlinux.o: warning: objtool:
 vmw_port_hb_out+0x1e5: undefined stack state
Message-ID: <202307072009.0zIRA7yy-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230707/202307072009.0zIRA7yy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307072009.0zIRA7yy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307072009.0zIRA7yy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmw_port_hb_out+0x1e5: undefined stack state
>> vmlinux.o: warning: objtool: vmw_port_hb_in+0x1ec: undefined stack state


objdump-func vmlinux.o vmw_port_hb_out:
0000 0000000004f3ed00 <vmw_port_hb_out>:
0000  4f3ed00:	e8 00 00 00 00       	call   4f3ed05 <vmw_port_hb_out+0x5>	4f3ed01: R_X86_64_PLT32	__fentry__-0x4
0005  4f3ed05:	41 57                	push   %r15
0007  4f3ed07:	41 56                	push   %r14
0009  4f3ed09:	49 89 f6             	mov    %rsi,%r14
000c  4f3ed0c:	41 55                	push   %r13
000e  4f3ed0e:	49 89 fd             	mov    %rdi,%r13
0011  4f3ed11:	41 54                	push   %r12
0013  4f3ed13:	55                   	push   %rbp
0014  4f3ed14:	53                   	push   %rbx
0015  4f3ed15:	89 d3                	mov    %edx,%ebx
0017  4f3ed17:	48 83 ec 20          	sub    $0x20,%rsp
001b  4f3ed1b:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0024  4f3ed24:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0029  4f3ed29:	31 c0                	xor    %eax,%eax
002b  4f3ed2b:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
0030  4f3ed30:	e8 00 00 00 00       	call   4f3ed35 <vmw_port_hb_out+0x35>	4f3ed31: R_X86_64_PLT32	__tsan_func_entry-0x4
0035  4f3ed35:	e8 00 00 00 00       	call   4f3ed3a <vmw_port_hb_out+0x3a>	4f3ed36: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
003a  4f3ed3a:	4c 89 f7             	mov    %r14,%rdi
003d  4f3ed3d:	e8 00 00 00 00       	call   4f3ed42 <vmw_port_hb_out+0x42>	4f3ed3e: R_X86_64_PLT32	strlen-0x4
0042  4f3ed42:	31 ff                	xor    %edi,%edi
0044  4f3ed44:	89 de                	mov    %ebx,%esi
0046  4f3ed46:	48 89 c5             	mov    %rax,%rbp
0049  4f3ed49:	49 89 c4             	mov    %rax,%r12
004c  4f3ed4c:	e8 00 00 00 00       	call   4f3ed51 <vmw_port_hb_out+0x51>	4f3ed4d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0051  4f3ed51:	84 db                	test   %bl,%bl
0053  4f3ed53:	0f 85 1d 01 00 00    	jne    4f3ee76 <vmw_port_hb_out+0x176>
0059  4f3ed59:	e8 00 00 00 00       	call   4f3ed5e <vmw_port_hb_out+0x5e>	4f3ed5a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
005e  4f3ed5e:	48 89 ee             	mov    %rbp,%rsi
0061  4f3ed61:	31 ff                	xor    %edi,%edi
0063  4f3ed63:	bb 00 00 01 00       	mov    $0x10000,%ebx
0068  4f3ed68:	e8 00 00 00 00       	call   4f3ed6d <vmw_port_hb_out+0x6d>	4f3ed69: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
006d  4f3ed6d:	49 8d 45 04          	lea    0x4(%r13),%rax
0071  4f3ed71:	48 89 04 24          	mov    %rax,(%rsp)
0075  4f3ed75:	49 8d 45 08          	lea    0x8(%r13),%rax
0079  4f3ed79:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
007e  4f3ed7e:	48 85 ed             	test   %rbp,%rbp
0081  4f3ed81:	0f 84 b3 00 00 00    	je     4f3ee3a <vmw_port_hb_out+0x13a>
0087  4f3ed87:	e8 00 00 00 00       	call   4f3ed8c <vmw_port_hb_out+0x8c>	4f3ed88: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
008c  4f3ed8c:	b8 04 00 00 00       	mov    $0x4,%eax
0091  4f3ed91:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)
009a  4f3ed9a:	49 39 c4             	cmp    %rax,%r12
009d  4f3ed9d:	49 0f 46 c4          	cmovbe %r12,%rax
00a1  4f3eda1:	89 c7                	mov    %eax,%edi
00a3  4f3eda3:	85 c0                	test   %eax,%eax
00a5  4f3eda5:	74 15                	je     4f3edbc <vmw_port_hb_out+0xbc>
00a7  4f3eda7:	31 d2                	xor    %edx,%edx
00a9  4f3eda9:	89 d1                	mov    %edx,%ecx
00ab  4f3edab:	83 c2 01             	add    $0x1,%edx
00ae  4f3edae:	41 0f b6 34 0e       	movzbl (%r14,%rcx,1),%esi
00b3  4f3edb3:	40 88 74 0c 10       	mov    %sil,0x10(%rsp,%rcx,1)
00b8  4f3edb8:	39 fa                	cmp    %edi,%edx
00ba  4f3edba:	72 ed                	jb     4f3eda9 <vmw_port_hb_out+0xa9>
00bc  4f3edbc:	48 8b 3c 24          	mov    (%rsp),%rdi
00c0  4f3edc0:	49 29 c4             	sub    %rax,%r12
00c3  4f3edc3:	49 01 c6             	add    %rax,%r14
00c6  4f3edc6:	e8 00 00 00 00       	call   4f3edcb <vmw_port_hb_out+0xcb>	4f3edc7: R_X86_64_PLT32	__tsan_read4-0x4
00cb  4f3edcb:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
00d0  4f3edd0:	45 8b 7d 04          	mov    0x4(%r13),%r15d
00d4  4f3edd4:	e8 00 00 00 00       	call   4f3edd9 <vmw_port_hb_out+0xd9>	4f3edd5: R_X86_64_PLT32	__tsan_read4-0x4
00d9  4f3edd9:	4c 89 ef             	mov    %r13,%rdi
00dc  4f3eddc:	41 8b 6d 08          	mov    0x8(%r13),%ebp
00e0  4f3ede0:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
00e5  4f3ede5:	e8 00 00 00 00       	call   4f3edea <vmw_port_hb_out+0xea>	4f3ede6: R_X86_64_PLT32	__tsan_read2-0x4
00ea  4f3edea:	41 0f b7 55 00       	movzwl 0x0(%r13),%edx
00ef  4f3edef:	b9 1e 00 02 00       	mov    $0x2001e,%ecx
00f4  4f3edf4:	4c 89 fe             	mov    %r15,%rsi
00f7  4f3edf7:	b8 68 58 4d 56       	mov    $0x564d5868,%eax
00fc  4f3edfc:	48 89 ef             	mov    %rbp,%rdi
00ff  4f3edff:	c1 e2 10             	shl    $0x10,%edx
0102  4f3ee02:	66 ba 58 56          	mov    $0x5658,%dx
0106  4f3ee06:	ed                   	in     (%dx),%eax
0107  4f3ee07:	31 ff                	xor    %edi,%edi
0109  4f3ee09:	4c 89 e6             	mov    %r12,%rsi
010c  4f3ee0c:	48 89 cb             	mov    %rcx,%rbx
010f  4f3ee0f:	e8 00 00 00 00       	call   4f3ee14 <vmw_port_hb_out+0x114>	4f3ee10: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0114  4f3ee14:	4d 85 e4             	test   %r12,%r12
0117  4f3ee17:	74 21                	je     4f3ee3a <vmw_port_hb_out+0x13a>
0119  4f3ee19:	e8 00 00 00 00       	call   4f3ee1e <vmw_port_hb_out+0x11e>	4f3ee1a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011e  4f3ee1e:	48 89 dd             	mov    %rbx,%rbp
0121  4f3ee21:	31 ff                	xor    %edi,%edi
0123  4f3ee23:	81 e5 00 00 01 00    	and    $0x10000,%ebp
0129  4f3ee29:	48 89 ee             	mov    %rbp,%rsi
012c  4f3ee2c:	e8 00 00 00 00       	call   4f3ee31 <vmw_port_hb_out+0x131>	4f3ee2d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0131  4f3ee31:	48 85 ed             	test   %rbp,%rbp
0134  4f3ee34:	0f 85 4d ff ff ff    	jne    4f3ed87 <vmw_port_hb_out+0x87>
013a  4f3ee3a:	e8 00 00 00 00       	call   4f3ee3f <vmw_port_hb_out+0x13f>	4f3ee3b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
013f  4f3ee3f:	e8 00 00 00 00       	call   4f3ee44 <vmw_port_hb_out+0x144>	4f3ee40: R_X86_64_PLT32	__tsan_func_exit-0x4
0144  4f3ee44:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0149  4f3ee49:	65 48 2b 04 25 28 00 00 00 	sub    %gs:0x28,%rax
0152  4f3ee52:	0f 85 93 00 00 00    	jne    4f3eeeb <vmw_port_hb_out+0x1eb>
0158  4f3ee58:	48 83 c4 20          	add    $0x20,%rsp
015c  4f3ee5c:	48 89 d8             	mov    %rbx,%rax
015f  4f3ee5f:	5b                   	pop    %rbx
0160  4f3ee60:	5d                   	pop    %rbp
0161  4f3ee61:	41 5c                	pop    %r12
0163  4f3ee63:	41 5d                	pop    %r13
0165  4f3ee65:	41 5e                	pop    %r14
0167  4f3ee67:	41 5f                	pop    %r15
0169  4f3ee69:	31 d2                	xor    %edx,%edx
016b  4f3ee6b:	31 c9                	xor    %ecx,%ecx
016d  4f3ee6d:	31 f6                	xor    %esi,%esi
016f  4f3ee6f:	31 ff                	xor    %edi,%edi
0171  4f3ee71:	e9 00 00 00 00       	jmp    4f3ee76 <vmw_port_hb_out+0x176>	4f3ee72: R_X86_64_PLT32	__x86_return_thunk-0x4
0176  4f3ee76:	e8 00 00 00 00       	call   4f3ee7b <vmw_port_hb_out+0x17b>	4f3ee77: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
017b  4f3ee7b:	31 ff                	xor    %edi,%edi
017d  4f3ee7d:	e8 00 00 00 00       	call   4f3ee82 <vmw_port_hb_out+0x182>	4f3ee7e: R_X86_64_PLT32	cc_platform_has-0x4
0182  4f3ee82:	31 ff                	xor    %edi,%edi
0184  4f3ee84:	89 c3                	mov    %eax,%ebx
0186  4f3ee86:	89 c6                	mov    %eax,%esi
0188  4f3ee88:	e8 00 00 00 00       	call   4f3ee8d <vmw_port_hb_out+0x18d>	4f3ee89: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
018d  4f3ee8d:	84 db                	test   %bl,%bl
018f  4f3ee8f:	0f 85 c4 fe ff ff    	jne    4f3ed59 <vmw_port_hb_out+0x59>
0195  4f3ee95:	e8 00 00 00 00       	call   4f3ee9a <vmw_port_hb_out+0x19a>	4f3ee96: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
019a  4f3ee9a:	49 8d 7d 04          	lea    0x4(%r13),%rdi
019e  4f3ee9e:	e8 00 00 00 00       	call   4f3eea3 <vmw_port_hb_out+0x1a3>	4f3ee9f: R_X86_64_PLT32	__tsan_read4-0x4
01a3  4f3eea3:	4c 89 ef             	mov    %r13,%rdi
01a6  4f3eea6:	45 8b 65 04          	mov    0x4(%r13),%r12d
01aa  4f3eeaa:	e8 00 00 00 00       	call   4f3eeaf <vmw_port_hb_out+0x1af>	4f3eeab: R_X86_64_PLT32	__tsan_read2-0x4
01af  4f3eeaf:	41 0f b7 55 00       	movzwl 0x0(%r13),%edx
01b4  4f3eeb4:	49 8d 7d 08          	lea    0x8(%r13),%rdi
01b8  4f3eeb8:	89 d3                	mov    %edx,%ebx
01ba  4f3eeba:	e8 00 00 00 00       	call   4f3eebf <vmw_port_hb_out+0x1bf>	4f3eebb: R_X86_64_PLT32	__tsan_read4-0x4
01bf  4f3eebf:	c1 e3 10             	shl    $0x10,%ebx
01c2  4f3eec2:	41 8b 7d 08          	mov    0x8(%r13),%edi
01c6  4f3eec6:	48 89 e9             	mov    %rbp,%rcx
01c9  4f3eec9:	89 da                	mov    %ebx,%edx
01cb  4f3eecb:	b8 68 58 4d 56       	mov    $0x564d5868,%eax
01d0  4f3eed0:	bb 00 00 01 00       	mov    $0x10000,%ebx
01d5  4f3eed5:	4c 89 f6             	mov    %r14,%rsi
01d8  4f3eed8:	83 ca 03             	or     $0x3,%edx
01db  4f3eedb:	55                   	push   %rbp
01dc  4f3eedc:	4c 89 e5             	mov    %r12,%rbp
01df  4f3eedf:	66 ba 59 56          	mov    $0x5659,%dx
01e3  4f3eee3:	f3 6e                	rep outsb %ds:(%rsi),(%dx)
01e5  4f3eee5:	5d                   	pop    %rbp
01e6  4f3eee6:	e9 4f ff ff ff       	jmp    4f3ee3a <vmw_port_hb_out+0x13a>
01eb  4f3eeeb:	e8 00 00 00 00       	call   4f3eef0 <vmw_port_hb_out+0x1f0>	4f3eeec: R_X86_64_PLT32	__stack_chk_fail-0x4
01f0  4f3eef0:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
01fb  4f3eefb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
