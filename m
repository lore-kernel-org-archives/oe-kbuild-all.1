Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05683134C4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726994507; cv=none; b=KaOITHuRWXnUYevXL76hGS3M0FV0OW2W4HEH7V42lDoSok6KMZrwCYX8zeBb5KPpjDs4VSt671478a0YKlsKGagHQdd6SXd/srCAFZwuo5VyhcfW+GzRU+rLhLpJzqLwIKrFEDplDJzvA+lAnGtvEA8r4lydIiwYW8RYAqR9NlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726994507; c=relaxed/simple;
	bh=Jn1qwtjOGWw87Jbn4x3ihR8z141ybvrqw+dG60ksjgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sH2zbDviRFjEIaaZAZm32Bkoos8+vHUfz89RivsjTd6qSKqVPf95buJhk3OCSwbAWxcESXDeS/VGS/vQLUQQXa+Zms8NbtNVAEcultNn1YbStHQhf5hV2eGXn/+1dLI3VIJcY1+ZySiwyjR3S7i0FnzKrZlWeEyUTaNJWF7vxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9/5BPhW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9/5BPhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726994506; x=1758530506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jn1qwtjOGWw87Jbn4x3ihR8z141ybvrqw+dG60ksjgc=;
  b=W9/5BPhWrQaAicZgTX14UXsWoyCkW6NDZgIn+J7qs4tXjlasQsQnn0nr
   5Q0LqCNAAULRDc4STXpa/tH7mYZZ1gDVLm/I7Y3kD+R+lXYOQ7cgdr0uZ
   RO5n7v4fuuGv/yax0/K2xsh8bPlmIEerqtf7Jh5oYoqWT+UjmJYZhJCjW
   ezK+VeoVx7pxiVakNCAUszJvRz0bhlYeoSLTtxGqj+IoY5MsH5Dzf/dzA
   4JynKsKtVHLvh5kkLgY+Jkrcac7GquDi18vYpQqXG6XiQbYblUHAmn0Hg
   bfVKtpM/e3377sAQNe+1zBlEQQ1Tj5XFSlviB7IwCw5CVoPBaq49lmHq1
   Q==;
X-CSE-ConnectionGUID: j2GTFvQDTiWMT9dKHTilyw==
X-CSE-MsgGUID: tdQLDMFBTZKSo75UEdZK1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25821043"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25821043"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 01:41:45 -0700
X-CSE-ConnectionGUID: YyxWHiXHRNCbwK11J59sPw==
X-CSE-MsgGUID: X4hRBwJITUmquchvNS7P2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="94095781"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2024 01:41:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssIA2-000G9S-0N;
	Sun, 22 Sep 2024 08:41:42 +0000
Date: Sun, 22 Sep 2024 16:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 8696/30000]
 block/keyslot-manager.o: warning: objtool:
 keyslot_manager_crypto_mode_supported()+0x80: unreachable instruction
Message-ID: <202409221631.OQ3kxRg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   1b3964c5e070d088ca4c9591cbadd91a22e438ea
commit: b01c73ea7129745ce9d94b8d3b35663b716cd95b [8696/30000] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240922/202409221631.OQ3kxRg1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221631.OQ3kxRg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409221631.OQ3kxRg1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/keyslot-manager.o: warning: objtool: keyslot_manager_crypto_mode_supported()+0x80: unreachable instruction


objdump-func vmlinux.o keyslot_manager_crypto_mode_supported:
0000 0000000000bfc78b <keyslot_manager_crypto_mode_supported>:
0000   bfc78b:	e8 00 00 00 00       	call   bfc790 <keyslot_manager_crypto_mode_supported+0x5>	bfc78c: R_X86_64_PLT32	__fentry__-0x4
0005   bfc790:	55                   	push   %rbp
0006   bfc791:	48 89 e5             	mov    %rsp,%rbp
0009   bfc794:	41 57                	push   %r15
000b   bfc796:	41 56                	push   %r14
000d   bfc798:	53                   	push   %rbx
000e   bfc799:	89 d3                	mov    %edx,%ebx
0010   bfc79b:	41 89 f7             	mov    %esi,%r15d
0013   bfc79e:	49 89 fe             	mov    %rdi,%r14
0016   bfc7a1:	e8 00 00 00 00       	call   bfc7a6 <keyslot_manager_crypto_mode_supported+0x1b>	bfc7a2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001b   bfc7a6:	4d 85 f6             	test   %r14,%r14
001e   bfc7a9:	74 3f                	je     bfc7ea <keyslot_manager_crypto_mode_supported+0x5f>
0020   bfc7ab:	41 83 ff 04          	cmp    $0x4,%r15d
0024   bfc7af:	73 47                	jae    bfc7f8 <keyslot_manager_crypto_mode_supported+0x6d>
0026   bfc7b1:	8d 43 ff             	lea    -0x1(%rbx),%eax
0029   bfc7b4:	89 d9                	mov    %ebx,%ecx
002b   bfc7b6:	31 c1                	xor    %eax,%ecx
002d   bfc7b8:	39 c1                	cmp    %eax,%ecx
002f   bfc7ba:	76 53                	jbe    bfc80f <keyslot_manager_crypto_mode_supported+0x84>
0031   bfc7bc:	e8 00 00 00 00       	call   bfc7c1 <keyslot_manager_crypto_mode_supported+0x36>	bfc7bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0036   bfc7c1:	67 41 8d 07          	lea    (%r15d),%eax
003a   bfc7c5:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0044   bfc7cf:	4d 8d 74 86 18       	lea    0x18(%r14,%rax,4),%r14
0049   bfc7d4:	4c 89 f0             	mov    %r14,%rax
004c   bfc7d7:	48 c1 e8 03          	shr    $0x3,%rax
0050   bfc7db:	8a 04 08             	mov    (%rax,%rcx,1),%al
0053   bfc7de:	84 c0                	test   %al,%al
0055   bfc7e0:	75 44                	jne    bfc826 <keyslot_manager_crypto_mode_supported+0x9b>
0057   bfc7e2:	41 85 1e             	test   %ebx,(%r14)
005a   bfc7e5:	0f 95 c0             	setne  %al
005d   bfc7e8:	eb 07                	jmp    bfc7f1 <keyslot_manager_crypto_mode_supported+0x66>
005f   bfc7ea:	e8 00 00 00 00       	call   bfc7ef <keyslot_manager_crypto_mode_supported+0x64>	bfc7eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0064   bfc7ef:	31 c0                	xor    %eax,%eax
0066   bfc7f1:	5b                   	pop    %rbx
0067   bfc7f2:	41 5e                	pop    %r14
0069   bfc7f4:	41 5f                	pop    %r15
006b   bfc7f6:	5d                   	pop    %rbp
006c   bfc7f7:	c3                   	ret
006d   bfc7f8:	e8 00 00 00 00       	call   bfc7fd <keyslot_manager_crypto_mode_supported+0x72>	bfc7f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0072   bfc7fd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	bfc800: R_X86_64_32S	.rodata+0x525020
0079   bfc804:	e8 00 00 00 00       	call   bfc809 <keyslot_manager_crypto_mode_supported+0x7e>	bfc805: R_X86_64_PLT32	printk-0x4
007e   bfc809:	0f 0b                	ud2
0080   bfc80b:	31 c0                	xor    %eax,%eax
0082   bfc80d:	eb e2                	jmp    bfc7f1 <keyslot_manager_crypto_mode_supported+0x66>
0084   bfc80f:	e8 00 00 00 00       	call   bfc814 <keyslot_manager_crypto_mode_supported+0x89>	bfc810: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0089   bfc814:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	bfc817: R_X86_64_32S	.rodata+0x525020
0090   bfc81b:	e8 00 00 00 00       	call   bfc820 <keyslot_manager_crypto_mode_supported+0x95>	bfc81c: R_X86_64_PLT32	printk-0x4
0095   bfc820:	0f 0b                	ud2
0097   bfc822:	31 c0                	xor    %eax,%eax
0099   bfc824:	eb cb                	jmp    bfc7f1 <keyslot_manager_crypto_mode_supported+0x66>
009b   bfc826:	44 89 f1             	mov    %r14d,%ecx
009e   bfc829:	80 e1 07             	and    $0x7,%cl
00a1   bfc82c:	80 c1 03             	add    $0x3,%cl
00a4   bfc82f:	38 c1                	cmp    %al,%cl
00a6   bfc831:	7c af                	jl     bfc7e2 <keyslot_manager_crypto_mode_supported+0x57>
00a8   bfc833:	4c 89 f7             	mov    %r14,%rdi
00ab   bfc836:	e8 00 00 00 00       	call   bfc83b <keyslot_manager_crypto_mode_supported+0xb0>	bfc837: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
00b0   bfc83b:	eb a5                	jmp    bfc7e2 <keyslot_manager_crypto_mode_supported+0x57>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
