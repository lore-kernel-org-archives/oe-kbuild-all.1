Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49921F951
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807881; cv=none; b=UVtUQ3jF7tAzlmv26XPTZUI+t/4lgg3EgdeOPmgUjO/UeMDRL3GVlgkIeE6AYI50g68lQ50lGKthaVmgJyDGCpMHlv7Qq2khi+Tw0iYXEi385pBZRVTJLhhG+8eieJbvDEsPwPQO3yILrRmtNtvyv01pRxDub+HbnRcyxuWTYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807881; c=relaxed/simple;
	bh=P8T0R3bgnNo7XbABUFSIRJ9UDDpenVNu9fBqff68UMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBEwNN79QHpBoC1xbINOs2977CMAtDPTbjbJuteW97mdJ02fpmaYPjF2ibUp8T4byDpKNKe/WrPj/3BcI8BlWmVyTUY6Q24VOwl4mtWeH9kBfkLEezn/2SVOyO7I1JF1GXzluFE1itP43p43z15S5GxO9DiMKrrRrS4IZQt6EmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvVRk7hB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvVRk7hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726807879; x=1758343879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P8T0R3bgnNo7XbABUFSIRJ9UDDpenVNu9fBqff68UMA=;
  b=hvVRk7hB0aytQ5D62UbbE+1fpZAttToP5GVRTQdSISJ6m29vbI2OlGTD
   ma9cUndzOU6g+gXzKXc+KZmx+N5FsO57tWsKMHg/oHnY5UFtjgkrn5FfV
   KlQIkp7NI1xA30Ms+hzejJ/SnHti+nOUbXpF0DMlBQTr0jTotLXKs8Ssd
   Mju9Ac8m3OWfyG0QVkAmOVs95uyBbdlu5cURQrqmo2byDS7DG2PCC/09X
   X4LLG5eI4Mc4VTieixHvoCW06HXhOQrbqRxOkJbzyuncBIGnxNSS3hu6P
   iaSXLXMD7/JExw84YN3n8sJv1scMRMX2ZJCH5PyiIlf/9WfmvaQ1l1Cqk
   w==;
X-CSE-ConnectionGUID: 6OSdmpp+QaS0MOaZCAeZPw==
X-CSE-MsgGUID: gag56wEXT66Yi9/VWUJO8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37177765"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="37177765"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 21:51:19 -0700
X-CSE-ConnectionGUID: wmHoYF/HQeKKiUSIVdp1nA==
X-CSE-MsgGUID: n/1/rkd7TKux/UntCn6A3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74701940"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2024 21:51:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srVbv-000Dym-2x;
	Fri, 20 Sep 2024 04:51:15 +0000
Date: Fri, 20 Sep 2024 12:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] x86/entry_64: Add a separate unmitigated
 entry/exit path
Message-ID: <202409201200.sXXjTN1J-lkp@intel.com>
References: <20240919-selective-mitigation-v1-1-1846cf41895e@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919-selective-mitigation-v1-1-1846cf41895e@linux.intel.com>

Hi Pawan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawan-Gupta/x86-entry_64-Add-a-separate-unmitigated-entry-exit-path/20240920-055414
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20240919-selective-mitigation-v1-1-1846cf41895e%40linux.intel.com
patch subject: [PATCH RFC 1/2] x86/entry_64: Add a separate unmitigated entry/exit path
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240920/202409201200.sXXjTN1J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201200.sXXjTN1J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201200.sXXjTN1J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __sev_es_ist_enter+0x35: relocation to !ENDBR: entry_SYSCALL_64_unmitigated+0xf7
>> vmlinux.o: warning: objtool: vc_switch_off_ist+0x9f: relocation to !ENDBR: entry_SYSCALL_64_unmitigated+0xf7


objdump-func vmlinux.o __sev_es_ist_enter:
0000 0000000000000410 <__sev_es_ist_enter>:
0000      410:	f3 0f 1e fa          	endbr64
0004      414:	65 48 8b 0d 00 00 00 00 	mov    %gs:0x0(%rip),%rcx        # 41c <__sev_es_ist_enter+0xc>	418: R_X86_64_PC32	cpu_tss_rw+0x40
000c      41c:	48 8b 87 98 00 00 00 	mov    0x98(%rdi),%rax
0013      423:	f6 87 88 00 00 00 03 	testb  $0x3,0x88(%rdi)
001a      42a:	75 22                	jne    44e <__sev_es_ist_enter+0x3e>
001c      42c:	48 8b 97 80 00 00 00 	mov    0x80(%rdi),%rdx
0023      433:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	436: R_X86_64_32S	entry_SYSCALL_64_unmitigated
002a      43a:	73 2a                	jae    466 <__sev_es_ist_enter+0x56>
002c      43c:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	43f: R_X86_64_32S	entry_SYSRETQ_unsafe_stack_unmitigated
0033      443:	72 33                	jb     478 <__sev_es_ist_enter+0x68>
0035      445:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	448: R_X86_64_32S	entry_SYSRETQ_end_unmitigated
003c      44c:	73 2a                	jae    478 <__sev_es_ist_enter+0x68>
003e      44e:	48 89 c8             	mov    %rcx,%rax
0041      451:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
0045      455:	48 89 48 f8          	mov    %rcx,-0x8(%rax)
0049      459:	65 48 89 15 00 00 00 00 	mov    %rdx,%gs:0x0(%rip)        # 461 <__sev_es_ist_enter+0x51>	45d: R_X86_64_PC32	cpu_tss_rw+0x40
0051      461:	e9 00 00 00 00       	jmp    466 <__sev_es_ist_enter+0x56>	462: R_X86_64_PLT32	__x86_return_thunk-0x4
0056      466:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	469: R_X86_64_32S	entry_SYSCALL_64_safe_stack_unmitigated
005d      46d:	72 df                	jb     44e <__sev_es_ist_enter+0x3e>
005f      46f:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	472: R_X86_64_32S	entry_SYSRETQ_unsafe_stack_unmitigated
0066      476:	73 cd                	jae    445 <__sev_es_ist_enter+0x35>
0068      478:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	47b: R_X86_64_32S	entry_SYSCALL_64_mitigated
006f      47f:	72 09                	jb     48a <__sev_es_ist_enter+0x7a>
0071      481:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	484: R_X86_64_32S	entry_SYSCALL_64_safe_stack_mitigated
0078      488:	72 c4                	jb     44e <__sev_es_ist_enter+0x3e>
007a      48a:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	48d: R_X86_64_32S	entry_SYSRETQ_unsafe_stack_mitigated
0081      491:	72 09                	jb     49c <__sev_es_ist_enter+0x8c>
0083      493:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	496: R_X86_64_32S	entry_SYSRETQ_end_mitigated
008a      49a:	72 b2                	jb     44e <__sev_es_ist_enter+0x3e>
008c      49c:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	49f: R_X86_64_32S	entry_SYSCALL_compat
0093      4a3:	73 39                	jae    4de <__sev_es_ist_enter+0xce>
0095      4a5:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	4a8: R_X86_64_32S	entry_SYSRETL_compat_unsafe_stack
009c      4ac:	72 09                	jb     4b7 <__sev_es_ist_enter+0xa7>
009e      4ae:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	4b1: R_X86_64_32S	entry_SYSRETL_compat_end
00a5      4b5:	72 97                	jb     44e <__sev_es_ist_enter+0x3e>
00a7      4b7:	65 48 8b 15 00 00 00 00 	mov    %gs:0x0(%rip),%rdx        # 4bf <__sev_es_ist_enter+0xaf>	4bb: R_X86_64_PC32	cea_exception_stacks-0x4
00af      4bf:	48 8d b2 00 d0 00 00 	lea    0xd000(%rdx),%rsi
00b6      4c6:	48 39 f0             	cmp    %rsi,%rax
00b9      4c9:	72 83                	jb     44e <__sev_es_ist_enter+0x3e>
00bb      4cb:	48 81 c2 00 f0 00 00 	add    $0xf000,%rdx
00c2      4d2:	48 39 d0             	cmp    %rdx,%rax
00c5      4d5:	48 0f 43 c1          	cmovae %rcx,%rax
00c9      4d9:	e9 73 ff ff ff       	jmp    451 <__sev_es_ist_enter+0x41>
00ce      4de:	48 81 fa 00 00 00 00 	cmp    $0x0,%rdx	4e1: R_X86_64_32S	entry_SYSCALL_compat_safe_stack
00d5      4e5:	0f 82 63 ff ff ff    	jb     44e <__sev_es_ist_enter+0x3e>
00db      4eb:	eb b8                	jmp    4a5 <__sev_es_ist_enter+0x95>
00dd      4ed:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)
00e8      4f8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
