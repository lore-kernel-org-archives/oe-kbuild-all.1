Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0C31D58A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214984; cv=none; b=etxep8O2sRwXKRkziVNmJsWmx9VixVxI+BEFUpV+GiV5jGLs7Gew8aLxHIIdMW3UMREGlETXl6Cv54BciQj4GLBrxPbnGEC2EjJcFIVC0LrlTpxwO8D6RyATL8195aRIXctln8jzyX6KycFqmTOgIubaQB462lywQ+dKZ/n6IlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214984; c=relaxed/simple;
	bh=AwkSzTViAIQcrO3OfgZ7tgEnMwh4BQJ8zAHEq6uANVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tG0vtwBd199UfuPmnr9MpFb0geGo00TImKi4ujAosuqBYhMOh1efOBiIVtmrPHH9gNaaVIF6T8JyKgUwszHJ+y530+6idvuCldBybwxjNkr0CrbsBcbARVDY+OfvnYey8tyzPSC6LMXEC5gsEVwSVc6vOG0nfmhJEOPnBgKailo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3V12MCB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3V12MCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726214983; x=1757750983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwkSzTViAIQcrO3OfgZ7tgEnMwh4BQJ8zAHEq6uANVI=;
  b=a3V12MCB1PmSnUJheklwcodyl24kTJoO6CKo9GVuCPxGE6a6O5b/qX3d
   EzyCGVBtgtoBK5QQmI0qtAnAk+rIB1i/8r94tZduxfKA5VVcc/H6dpUgi
   H7aehDldhEooHwFZqQVnxWwmi0CA/LzX68ii3Ya/oXNdVFPi5K6KPz8dc
   vW9bawFhgbGDOMda7y3Qz1E0pIxoFvWi2C5tPnuSDcTijbUppxHVoSOme
   OjP3KbqudMEr77Sh0JP2haaJiI8eLDrgo+V2xnqwgXYPtXRQ/YDeGhlj0
   B9aUsh2WAsWisoUbdEk6LGdjx84FO9NQ1Pfp96KpqYJBqa4iK9HxLgBBy
   Q==;
X-CSE-ConnectionGUID: yDV5BRc3T6eqQmuS7hmnLg==
X-CSE-MsgGUID: TD9aGPxcShu09HEg9JfAHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="50520475"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="50520475"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:09:42 -0700
X-CSE-ConnectionGUID: QfdUhVKMQti2wY8yzw8vgA==
X-CSE-MsgGUID: FnRZjOKOT2G14gUyYsEGBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72574455"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 01:09:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp1N5-0006Bj-1Y;
	Fri, 13 Sep 2024 08:09:39 +0000
Date: Fri, 13 Sep 2024 16:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/8] crypto/api.o: warning: objtool:
 crypto_wait_for_test()+0x97: unreachable instruction
Message-ID: <202409131650.m1JMCmTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   86ee4e128a0567a5376adfb5627312aa717009bb
commit: 46d85d752a0657488495fad423c15eb4048c5ac7 [1/8] UPSTREAM: crypto: api - Fix built-in testing dependency failures
config: x86_64-buildonly-randconfig-003-20240912 (https://download.01.org/0day-ci/archive/20240913/202409131650.m1JMCmTu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131650.m1JMCmTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131650.m1JMCmTu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/api.o: warning: objtool: crypto_wait_for_test()+0x97: unreachable instruction


objdump-func vmlinux.o crypto_wait_for_test:
0000 0000000000543c80 <crypto_wait_for_test>:
0000   543c80:	e8 00 00 00 00       	call   543c85 <crypto_wait_for_test+0x5>	543c81: R_X86_64_PLT32	__fentry__-0x4
0005   543c85:	55                   	push   %rbp
0006   543c86:	48 89 e5             	mov    %rsp,%rbp
0009   543c89:	41 57                	push   %r15
000b   543c8b:	41 56                	push   %r14
000d   543c8d:	53                   	push   %rbx
000e   543c8e:	48 89 fb             	mov    %rdi,%rbx
0011   543c91:	48 81 c7 80 01 00 00 	add    $0x180,%rdi
0018   543c98:	e8 00 00 00 00       	call   543c9d <crypto_wait_for_test+0x1d>	543c99: R_X86_64_PLT32	__asan_load8_noabort-0x4
001d   543c9d:	4c 8b b3 80 01 00 00 	mov    0x180(%rbx),%r14
0024   543ca4:	be 01 00 00 00       	mov    $0x1,%esi
0029   543ca9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543cac: R_X86_64_32S	crypto_chain
0030   543cb0:	4c 89 f2             	mov    %r14,%rdx
0033   543cb3:	e8 00 00 00 00       	call   543cb8 <crypto_wait_for_test+0x38>	543cb4: R_X86_64_PLT32	blocking_notifier_call_chain-0x4
0038   543cb8:	85 c0                	test   %eax,%eax
003a   543cba:	74 09                	je     543cc5 <crypto_wait_for_test+0x45>
003c   543cbc:	3d 01 80 00 00       	cmp    $0x8001,%eax
0041   543cc1:	75 2e                	jne    543cf1 <crypto_wait_for_test+0x71>
0043   543cc3:	eb 7c                	jmp    543d41 <crypto_wait_for_test+0xc1>
0045   543cc5:	bf 01 00 00 00       	mov    $0x1,%edi
004a   543cca:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	543ccd: R_X86_64_32S	.rodata+0x57fe40
0051   543cd1:	e8 00 00 00 00       	call   543cd6 <crypto_wait_for_test+0x56>	543cd2: R_X86_64_PLT32	__request_module-0x4
0056   543cd6:	be 01 00 00 00       	mov    $0x1,%esi
005b   543cdb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543cde: R_X86_64_32S	crypto_chain
0062   543ce2:	4c 89 f2             	mov    %r14,%rdx
0065   543ce5:	e8 00 00 00 00       	call   543cea <crypto_wait_for_test+0x6a>	543ce6: R_X86_64_PLT32	blocking_notifier_call_chain-0x4
006a   543cea:	3d 01 80 00 00       	cmp    $0x8001,%eax
006f   543cef:	74 50                	je     543d41 <crypto_wait_for_test+0xc1>
0071   543cf1:	45 31 f6             	xor    %r14d,%r14d
0074   543cf4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543cf7: R_X86_64_32S	_ftrace_annotated_branch+0x92af0
007b   543cfb:	41 89 c7             	mov    %eax,%r15d
007e   543cfe:	85 c0                	test   %eax,%eax
0080   543d00:	41 0f 95 c6          	setne  %r14b
0084   543d04:	31 d2                	xor    %edx,%edx
0086   543d06:	31 c9                	xor    %ecx,%ecx
0088   543d08:	44 89 f6             	mov    %r14d,%esi
008b   543d0b:	e8 00 00 00 00       	call   543d10 <crypto_wait_for_test+0x90>	543d0c: R_X86_64_PLT32	ftrace_likely_update-0x4
0090   543d10:	45 85 ff             	test   %r15d,%r15d
0093   543d13:	74 0b                	je     543d20 <crypto_wait_for_test+0xa0>
0095   543d15:	0f 0b                	ud2
0097   543d17:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543d1a: R_X86_64_32S	_ftrace_annotated_branch+0x92b20
009e   543d1e:	eb 5a                	jmp    543d7a <crypto_wait_for_test+0xfa>
00a0   543d20:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543d23: R_X86_64_32S	_ftrace_annotated_branch+0x92b20
00a7   543d27:	44 89 f6             	mov    %r14d,%esi
00aa   543d2a:	31 d2                	xor    %edx,%edx
00ac   543d2c:	31 c9                	xor    %ecx,%ecx
00ae   543d2e:	e8 00 00 00 00       	call   543d33 <crypto_wait_for_test+0xb3>	543d2f: R_X86_64_PLT32	ftrace_likely_update-0x4
00b3   543d33:	48 8d bb b8 00 00 00 	lea    0xb8(%rbx),%rdi
00ba   543d3a:	31 f6                	xor    %esi,%esi
00bc   543d3c:	e8 00 00 00 00       	call   543d41 <crypto_wait_for_test+0xc1>	543d3d: R_X86_64_PLT32	crypto_alg_tested-0x4
00c1   543d41:	48 8d bb 88 01 00 00 	lea    0x188(%rbx),%rdi
00c8   543d48:	e8 00 00 00 00       	call   543d4d <crypto_wait_for_test+0xcd>	543d49: R_X86_64_PLT32	wait_for_completion_killable-0x4
00cd   543d4d:	45 31 f6             	xor    %r14d,%r14d
00d0   543d50:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543d53: R_X86_64_32S	_ftrace_annotated_branch+0x92b50
00d7   543d57:	41 89 c7             	mov    %eax,%r15d
00da   543d5a:	85 c0                	test   %eax,%eax
00dc   543d5c:	41 0f 95 c6          	setne  %r14b
00e0   543d60:	31 d2                	xor    %edx,%edx
00e2   543d62:	31 c9                	xor    %ecx,%ecx
00e4   543d64:	44 89 f6             	mov    %r14d,%esi
00e7   543d67:	e8 00 00 00 00       	call   543d6c <crypto_wait_for_test+0xec>	543d68: R_X86_64_PLT32	ftrace_likely_update-0x4
00ec   543d6c:	45 85 ff             	test   %r15d,%r15d
00ef   543d6f:	74 17                	je     543d88 <crypto_wait_for_test+0x108>
00f1   543d71:	0f 0b                	ud2
00f3   543d73:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543d76: R_X86_64_32S	_ftrace_annotated_branch+0x92b80
00fa   543d7a:	44 89 f6             	mov    %r14d,%esi
00fd   543d7d:	31 d2                	xor    %edx,%edx
00ff   543d7f:	31 c9                	xor    %ecx,%ecx
0101   543d81:	e8 00 00 00 00       	call   543d86 <crypto_wait_for_test+0x106>	543d82: R_X86_64_PLT32	ftrace_likely_update-0x4
0106   543d86:	eb 27                	jmp    543daf <crypto_wait_for_test+0x12f>
0108   543d88:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543d8b: R_X86_64_32S	_ftrace_annotated_branch+0x92b80
010f   543d8f:	44 89 f6             	mov    %r14d,%esi
0112   543d92:	31 d2                	xor    %edx,%edx
0114   543d94:	31 c9                	xor    %ecx,%ecx
0116   543d96:	e8 00 00 00 00       	call   543d9b <crypto_wait_for_test+0x11b>	543d97: R_X86_64_PLT32	ftrace_likely_update-0x4
011b   543d9b:	be 02 00 00 00       	mov    $0x2,%esi
0120   543da0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	543da3: R_X86_64_32S	crypto_chain
0127   543da7:	48 89 da             	mov    %rbx,%rdx
012a   543daa:	e8 00 00 00 00       	call   543daf <crypto_wait_for_test+0x12f>	543dab: R_X86_64_PLT32	blocking_notifier_call_chain-0x4
012f   543daf:	48 89 df             	mov    %rbx,%rdi
0132   543db2:	e8 00 00 00 00       	call   543db7 <crypto_wait_for_test+0x137>	543db3: R_X86_64_PLT32	crypto_larval_kill-0x4
0137   543db7:	5b                   	pop    %rbx
0138   543db8:	41 5e                	pop    %r14
013a   543dba:	41 5f                	pop    %r15
013c   543dbc:	5d                   	pop    %rbp
013d   543dbd:	e9 00 00 00 00       	jmp    543dc2 <crypto_wait_for_test+0x142>	543dbe: R_X86_64_PLT32	__x86_return_thunk-0x4
0142   543dc2:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
014c   543dcc:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
