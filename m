Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96132207A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732505019; cv=none; b=AhsQKT9L7ZUTdb1ma9cMA9u4+rrAL4Z5suuPQJZ6T+rjpPgiIRIb8bNuEX48coPtrx/uP+gjt5lljdpLXqA/Fb2JZNkTpJvmn8XfoqdJeWEOkvkfJK3s4LnkLFKBgFagg4vXWJ0V+8HH1UsabNvi6hGApZMWeZfupfDoWI1JpIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732505019; c=relaxed/simple;
	bh=pc6GsA7lhx4JUb7iGWBtmvRgYcmdMAHN9meKfnrGj2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GnS0HEKl9v7GlefuWE9FyBu87bNJJOK9Tqv5xGv3KYf5pD8l/6Dpf8/LuNeu5MrGU0jO/p47hHKbw8mOyEMf7lUzHoVuoTOizUpSd1n6iv0h1V5Y7cCQISASrHeeGJEdOwkSnT1QCNJogz1BMv2O/Z8h0tTJwfuwqX2uBDhu94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8BcpO3q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8BcpO3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732505018; x=1764041018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pc6GsA7lhx4JUb7iGWBtmvRgYcmdMAHN9meKfnrGj2w=;
  b=O8BcpO3qXhM7GnSCekdieXWfP6ji2/JheAp9wo/DjNxP2Ax7B74jv9Ll
   gSGx2q8Ylj77OHq6GN039XMIMRTFmdVVds+oFzqAoglhfSqDHsh8VSbWP
   wcPDPeHUxO3/Ubbty7+TXiDk/3pV/pFPFRjZgnXhTe0aKO7Zg0FX6Qdov
   hXZnLqrtZCstBO8F9zHf/RsPc6BAmnWtqCWnFlcgBOaeFgtGQubgDm59A
   3JXXVnUx12u8Baji/LdRemDl4oL95d5ia79sgWVcH4ELiptqHYhbPUSFT
   mDVsgKoZeSsMdtBWwBbh8fGxzcH9myJ+Mj0AprdyN4xwyHbaFinRhfX1i
   g==;
X-CSE-ConnectionGUID: 37fm/arhRa6wFDN9gfvsEw==
X-CSE-MsgGUID: QcGjWHvUSiiK9OF3y5e1TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="50003685"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="50003685"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 19:23:38 -0800
X-CSE-ConnectionGUID: 8ilKc53JSFy00cNvGU1k0Q==
X-CSE-MsgGUID: +A08b69JRPSMgCW7csgQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="95902529"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Nov 2024 19:23:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFPhG-0005gj-1R;
	Mon, 25 Nov 2024 03:23:34 +0000
Date: Mon, 25 Nov 2024 11:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:uaccess-hardening-2 6/6] arch/x86/lib/getuser.S:141:
 Error: invalid character '(' in mnemonic
Message-ID: <202411251111.7WP6PZSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   4ad87915543398ef3aacbbece2f72cd0b644ec8d
commit: 6cf65acab0626b6de08baccbfbfb04cfe62c46a3 [6/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
config: i386-buildonly-randconfig-003-20241124 (https://download.01.org/0day-ci/archive/20241125/202411251111.7WP6PZSM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251111.7WP6PZSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251111.7WP6PZSM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/lib/getuser.S: Assembler messages:
>> arch/x86/lib/getuser.S:141: Error: invalid character '(' in mnemonic
   arch/x86/lib/getuser.S:146:  Info: macro invoked from here
>> arch/x86/lib/getuser.S:141: Error: invalid character '(' in mnemonic
   arch/x86/lib/getuser.S:156:  Info: macro invoked from here
>> arch/x86/lib/getuser.S:141: Error: invalid character '(' in mnemonic
   arch/x86/lib/getuser.S:166:  Info: macro invoked from here
>> arch/x86/lib/getuser.S:141: Error: invalid character '(' in mnemonic
   arch/x86/lib/getuser.S:176:  Info: macro invoked from here


vim +141 arch/x86/lib/getuser.S

   113	
   114	
   115	/*
   116	 * If a user address was provided, do pointer masking to prevent a mispredicted
   117	 * branch from accessing a kernel address.  Otherwise, do ASM_BARRIER_NOSPEC.
   118	 *
   119	 * Unfortunately there may still be kernel code out there using __get_user()
   120	 * off-label by skipping access_ok() and passing a kernel address.  Root out
   121	 * the "bad" callers by adding a warning.
   122	 *
   123	 * Once this has run for a bit without any reported warnings, we can delete
   124	 * this nonsense and "#define __get_user get_user" with the eventual goal of
   125	 * getting rid of __get_user() tree-wide.
   126	 */
   127	.macro __get_user_nocheck_nospec
   128	#ifdef CONFIG_X86_64
   129		movq $0x0123456789abcdef, %rdx
   130	 1:
   131	.pushsection runtime_ptr_USER_PTR_MAX, "a"
   132		.long 1b - 8 - .
   133	.popsection
   134		cmp %rax, %rdx
   135		jb 10f
   136		sbb %rdx, %rdx
   137		or %rdx, %rax
   138		jmp 11f
   139	#endif /* CONFIG_X86_64 */
   140	10:	ASM_BARRIER_NOSPEC
 > 141		WARN_ONCE
   142	11:
   143	.endm
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
