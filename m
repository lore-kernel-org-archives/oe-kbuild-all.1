Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AE414BF8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473680; cv=none; b=O3rUKsq++uIvE9WpA9EyAjQ3DgEJSff1w2t3+pf5fEvBZ1ZnZspPJS7DbASBv7Oq69ZG1Si70s76BriVoeNUnoiYUs6fkR23UrUII9GONpL7w8xGAaBv3pTocne/OcqRw6BKEZJwxenaF2LuhNna2l/LpGx6ISlv9HVR6hlUG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473680; c=relaxed/simple;
	bh=XGAk/V84WCUiIp5VhBQ5QyMRAz2JEPef50MhUGvLGJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQrELwDoo1A4rKiup+M0FB6yfC9UaERSVGRszsTAjHqMPYe+RYDGBC2etMgD92gH+VNiCbjq80o/q1JNKX3MASvL3FWDrHt3/aSfP72xQvHYi2ywWe17N/xwABxuVLU4CH+V1Y0JridVj3M2PVFZKty+LuDOfmm/sZ6MBoQx540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4bYzkFi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4bYzkFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727473679; x=1759009679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGAk/V84WCUiIp5VhBQ5QyMRAz2JEPef50MhUGvLGJc=;
  b=J4bYzkFieXw3T2gNpIhK+ImRrfMfMfIZiPxa7GYPSySwSUPtF+26LsTV
   4EhMYqKEeCXZth0Qce8z49NNI7fODjnUqVmgho1drNR44DUqPTTAMpiVD
   VSXeKu6AH75TH0nEMSbqxVAS1w57B+TEXZzPtd4Gdx0z9W1CEHBKiZXbc
   QEVUWHTZ8nikb6reypHjSGmb6iy16vujnT1KZDiKzNiDROinYX/SCiBvw
   W4uvi6JbUnZQj2foiqKoEacCbv2sVLD73nR5EvWZn6nzJINgvXGfDkel5
   Xpp/PC06PJ8Evo5/I/Pc0/LfFjL7OGvlBndDt+o9FezXNUKXnXZw/ErJG
   A==;
X-CSE-ConnectionGUID: 8hPvEVn+TWOGUEBlZ4mRlw==
X-CSE-MsgGUID: MI9FVXbBQpChRyBzqHPqkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26764051"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26764051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:47:48 -0700
X-CSE-ConnectionGUID: 2h3uVKYRSw+VXTA0ErYbPA==
X-CSE-MsgGUID: jHG/DMShTpKsCnEPuez0MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72336042"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2024 14:47:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIoP-000MeZ-1T;
	Fri, 27 Sep 2024 21:47:41 +0000
Date: Sat, 28 Sep 2024 05:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 2/4] vmlinux.o: warning: objtool:
 exc_page_fault+0x4b: call to _printk() leaves .noinstr.text section
Message-ID: <202409280535.6DMYjenP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d852e67c4b2e8e23847886c8e167e058a8d603fa
commit: c6e98994c1ab985f4c8a5cfab0ab692505be75e9 [2/4] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-randconfig-003-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280535.6DMYjenP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280535.6DMYjenP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280535.6DMYjenP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exc_page_fault+0x4b: call to _printk() leaves .noinstr.text section


objdump-func vmlinux.o exc_page_fault:
0000 0000000000001b7f <exc_page_fault>:
0000     1b7f:	f3 0f 1e fa          	endbr64
0004     1b83:	41 55                	push   %r13
0006     1b85:	41 54                	push   %r12
0008     1b87:	55                   	push   %rbp
0009     1b88:	48 89 f5             	mov    %rsi,%rbp
000c     1b8b:	53                   	push   %rbx
000d     1b8c:	48 89 fb             	mov    %rdi,%rbx
0010     1b8f:	41 0f 20 d4          	mov    %cr2,%r12
0014     1b93:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1b9a <exc_page_fault+0x1b>	1b95: R_X86_64_PC32	kiwi_fault_logging-0x5
001b     1b9a:	74 34                	je     1bd0 <exc_page_fault+0x51>
001d     1b9c:	48 8b 34 25 00 00 00 00 	mov    0x0,%rsi	1ba0: R_X86_64_32S	current_task
0025     1ba4:	8b 96 9c 0f 00 00    	mov    0xf9c(%rsi),%edx
002b     1baa:	55                   	push   %rbp
002c     1bab:	4c 89 e1             	mov    %r12,%rcx
002f     1bae:	48 81 c6 18 10 00 00 	add    $0x1018,%rsi
0036     1bb5:	4c 8b 8f 98 00 00 00 	mov    0x98(%rdi),%r9
003d     1bbc:	4c 8b 87 80 00 00 00 	mov    0x80(%rdi),%r8
0044     1bc3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1bc6: R_X86_64_32S	.rodata.str1.1+0x13d67
004b     1bca:	e8 00 00 00 00       	call   1bcf <exc_page_fault+0x50>	1bcb: R_X86_64_PLT32	_printk-0x4
0050     1bcf:	58                   	pop    %rax
0051     1bd0:	48 8b 04 25 00 00 00 00 	mov    0x0,%rax	1bd4: R_X86_64_32S	current_task
0059     1bd8:	48 8b 80 70 19 00 00 	mov    0x1970(%rax),%rax
0060     1bdf:	0f 18 88 78 05 00 00 	prefetcht0 0x578(%rax)
0067     1be6:	66 90                	xchg   %ax,%ax
0069     1be8:	eb 13                	jmp    1bfd <exc_page_fault+0x7e>
006b     1bea:	44 89 e6             	mov    %r12d,%esi
006e     1bed:	48 89 df             	mov    %rbx,%rdi
0071     1bf0:	e8 00 00 00 00       	call   1bf5 <exc_page_fault+0x76>	1bf1: R_X86_64_PLT32	__kvm_handle_async_pf-0x4
0076     1bf5:	84 c0                	test   %al,%al
0078     1bf7:	0f 85 b2 00 00 00    	jne    1caf <exc_page_fault+0x130>
007e     1bfd:	48 89 df             	mov    %rbx,%rdi
0081     1c00:	e8 00 00 00 00       	call   1c05 <exc_page_fault+0x86>	1c01: R_X86_64_PLT32	irqentry_enter-0x4
0086     1c05:	41 89 c5             	mov    %eax,%r13d
0089     1c08:	90                   	nop
008a     1c09:	66 90                	xchg   %ax,%ax
008c     1c0b:	eb 61                	jmp    1c6e <exc_page_fault+0xef>
008e     1c0d:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0095     1c14:	74 2a                	je     1c40 <exc_page_fault+0xc1>
0097     1c16:	66 90                	xchg   %ax,%ax
0099     1c18:	eb 54                	jmp    1c6e <exc_page_fault+0xef>
009b     1c1a:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 1c20 <exc_page_fault+0xa1>	1c1c: R_X86_64_PC32	__preempt_count-0x4
00a1     1c20:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1c27 <exc_page_fault+0xa8>	1c23: R_X86_64_PC32	__tracepoint_page_fault_user+0x3c
00a8     1c27:	48 85 c0             	test   %rax,%rax
00ab     1c2a:	74 3c                	je     1c68 <exc_page_fault+0xe9>
00ad     1c2c:	48 8b 78 08          	mov    0x8(%rax),%rdi
00b1     1c30:	48 89 e9             	mov    %rbp,%rcx
00b4     1c33:	48 89 da             	mov    %rbx,%rdx
00b7     1c36:	4c 89 e6             	mov    %r12,%rsi
00ba     1c39:	e8 00 00 00 00       	call   1c3e <exc_page_fault+0xbf>	1c3a: R_X86_64_PLT32	__SCT__tp_func_page_fault_user-0x4
00bf     1c3e:	eb 28                	jmp    1c68 <exc_page_fault+0xe9>
00c1     1c40:	66 90                	xchg   %ax,%ax
00c3     1c42:	eb 2a                	jmp    1c6e <exc_page_fault+0xef>
00c5     1c44:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 1c4a <exc_page_fault+0xcb>	1c46: R_X86_64_PC32	__preempt_count-0x4
00cb     1c4a:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1c51 <exc_page_fault+0xd2>	1c4d: R_X86_64_PC32	__tracepoint_page_fault_kernel+0x3c
00d2     1c51:	48 85 c0             	test   %rax,%rax
00d5     1c54:	74 12                	je     1c68 <exc_page_fault+0xe9>
00d7     1c56:	48 8b 78 08          	mov    0x8(%rax),%rdi
00db     1c5a:	48 89 e9             	mov    %rbp,%rcx
00de     1c5d:	48 89 da             	mov    %rbx,%rdx
00e1     1c60:	4c 89 e6             	mov    %r12,%rsi
00e4     1c63:	e8 00 00 00 00       	call   1c68 <exc_page_fault+0xe9>	1c64: R_X86_64_PLT32	__SCT__tp_func_page_fault_kernel-0x4
00e9     1c68:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 1c6e <exc_page_fault+0xef>	1c6a: R_X86_64_PC32	__preempt_count-0x4
00ef     1c6e:	4c 89 e7             	mov    %r12,%rdi
00f2     1c71:	48 89 ee             	mov    %rbp,%rsi
00f5     1c74:	e8 00 00 00 00       	call   1c79 <exc_page_fault+0xfa>	1c75: R_X86_64_PLT32	fault_in_kernel_space-0x4
00fa     1c79:	4c 89 e2             	mov    %r12,%rdx
00fd     1c7c:	48 89 df             	mov    %rbx,%rdi
0100     1c7f:	84 c0                	test   %al,%al
0102     1c81:	74 07                	je     1c8a <exc_page_fault+0x10b>
0104     1c83:	e8 00 00 00 00       	call   1c88 <exc_page_fault+0x109>	1c84: R_X86_64_PC32	.text+0x637bb
0109     1c88:	eb 13                	jmp    1c9d <exc_page_fault+0x11e>
010b     1c8a:	e8 00 00 00 00       	call   1c8f <exc_page_fault+0x110>	1c8b: R_X86_64_PC32	.text+0x63841
0110     1c8f:	9c                   	pushf
0111     1c90:	58                   	pop    %rax
0112     1c91:	fa                   	cli
0113     1c92:	0f ba e0 09          	bt     $0x9,%eax
0117     1c96:	73 05                	jae    1c9d <exc_page_fault+0x11e>
0119     1c98:	e8 00 00 00 00       	call   1c9d <exc_page_fault+0x11e>	1c99: R_X86_64_PLT32	trace_hardirqs_off-0x4
011e     1c9d:	90                   	nop
011f     1c9e:	44 89 ee             	mov    %r13d,%esi
0122     1ca1:	48 89 df             	mov    %rbx,%rdi
0125     1ca4:	5b                   	pop    %rbx
0126     1ca5:	5d                   	pop    %rbp
0127     1ca6:	41 5c                	pop    %r12
0129     1ca8:	41 5d                	pop    %r13
012b     1caa:	e9 00 00 00 00       	jmp    1caf <exc_page_fault+0x130>	1cab: R_X86_64_PLT32	irqentry_exit-0x4
0130     1caf:	5b                   	pop    %rbx
0131     1cb0:	5d                   	pop    %rbp
0132     1cb1:	41 5c                	pop    %r12
0134     1cb3:	41 5d                	pop    %r13
0136     1cb5:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
