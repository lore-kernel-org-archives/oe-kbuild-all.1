Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A611494D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737467492; cv=none; b=Eab+pOUdRXmFpfh85XApsfuKTIJ4dy/jkRXcy2TcnUGW+dvYp6QTUcSixyd6sAEjMjT0z0FYf8KMOSG61iAaDkLikuX0YvS5XeVjHefXCLiPBAijvxntaBagw8yl3jfMmCHNEfq2YRIKwqQj6rn/xd25T44fICxCV6liXE11BAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737467492; c=relaxed/simple;
	bh=7aKFF6vYMjgR8XgrRGurhg2jKXAry1arqJHJE+AiS1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoGo9J+gkNU3BGyF7/Mwv/SWoVyNyHKS46hjgPsIV2hTzcyyRkBrFsbGV0dCJEAjYz1zLLwiOhdaiH6pEj5pWI2Fx4wpDtN9XJtJI00frNbZNc1/ir4Izl+n4RtP//H9MQqt4RhCnzR3Sk/Krlxyc2qy67V/JZRjsUvpYbHULzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvHqTXmt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvHqTXmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737467490; x=1769003490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aKFF6vYMjgR8XgrRGurhg2jKXAry1arqJHJE+AiS1c=;
  b=jvHqTXmtniXs06fExo2UlgWWKoWt7i4gCReRzSGRUoJ8Kq9VEWuu020X
   6hwWt/8SoJiNoLkZEaNIA1OwFw7pRv0LMzReN6nxQ53SamWN6mXforOoM
   x9JG7TIcUlhzIYCpsTi5tZsgVcuRC4EJsQOsrxio0rXtsEo57D4t30VSK
   2+HonxmBUjBFMRY19lZgRya0aMGktHJagvydxSF7QQg+XUCVtwamJbuUO
   T/Cm2fOyng1kCDd34pQoyAsN9sBKRKYnTfQaU7jeq2kBX4tReWP1nSz+s
   ZskKfMimUKWFsNS82SpN3wcRvNibgtV86uN5LUuANbv9I6FN4prRUYGOF
   w==;
X-CSE-ConnectionGUID: rTntuav8QFGJsNZBCtmGwQ==
X-CSE-MsgGUID: 0zpO3w0uToGlFH44H1CyGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41803421"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="41803421"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 05:51:29 -0800
X-CSE-ConnectionGUID: qfLQryPpSViwIk2RKcdmLw==
X-CSE-MsgGUID: 6Gib4BeFT42tEVRYOeM+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110864775"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2025 05:51:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taEf8-000Y5Z-1d;
	Tue, 21 Jan 2025 13:51:26 +0000
Date: Tue, 21 Jan 2025 21:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc-x86 11/11] arch/x86/lib/crc-pclmul-template.S:37:
 Error: `pinsrq' is only supported in 64-bit mode
Message-ID: <202501212145.RSrHZBcf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-x86
head:   f31bd31f442cdda8a269eca5bf673a3066d40233
commit: f31bd31f442cdda8a269eca5bf673a3066d40233 [11/11] x86/crc64: add [V]PCLMULQDQ optimized CRC64 functions
config: i386-buildonly-randconfig-004-20250121 (https://download.01.org/0day-ci/archive/20250121/202501212145.RSrHZBcf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501212145.RSrHZBcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212145.RSrHZBcf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/lib/crc-pclmul-template.S: Assembler messages:
>> arch/x86/lib/crc-pclmul-template.S:37: Error: `pinsrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:274:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:57: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
>> arch/x86/lib/crc-pclmul-template.S:63: Error: `vpinsrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:274:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
>> arch/x86/lib/crc-pclmul-template.S:63: Error: `vpinsrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:274:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
>> arch/x86/lib/crc-pclmul-template.S:63: Error: `vpinsrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:274:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:57: Error: `pextrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:510:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:7:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: `vpextrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:510:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:7:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: `vpextrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:510:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:7:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: `vpextrq' is only supported in 64-bit mode
   arch/x86/lib/crc-pclmul-template.S:510:  Info: macro invoked from here
   arch/x86/lib/crc64-pclmul.S:7:   Info: macro invoked from here


vim +37 arch/x86/lib/crc-pclmul-template.S

8f10817155a8f5 Eric Biggers 2025-01-20  20  
8f10817155a8f5 Eric Biggers 2025-01-20  21  // Emit a VEX (or EVEX) coded instruction if allowed, or emulate it using the
8f10817155a8f5 Eric Biggers 2025-01-20  22  // corresponding non-VEX instruction plus any needed moves.  \insn gives the
8f10817155a8f5 Eric Biggers 2025-01-20  23  // instruction without a "v" prefix and including any immediate argument, and
8f10817155a8f5 Eric Biggers 2025-01-20  24  // \arg1-\arg3 give up to three non-immediate arguments as expected by the
8f10817155a8f5 Eric Biggers 2025-01-20  25  // VEX-coded form of the instruction.  If \arg1 is an unaligned mem operand,
8f10817155a8f5 Eric Biggers 2025-01-20  26  // \unaligned_mem_tmp must be specified as a temporary register.  If \arg3 is
8f10817155a8f5 Eric Biggers 2025-01-20  27  // given and \arg2 != \arg3, then it is required that \arg1 != \arg3.
8f10817155a8f5 Eric Biggers 2025-01-20  28  .macro	_cond_vex	insn:req, arg1:req, arg2:req, arg3, unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  29  .if AVX_LEVEL == 0
8f10817155a8f5 Eric Biggers 2025-01-20  30    // VEX not allowed.  Emulate it.
8f10817155a8f5 Eric Biggers 2025-01-20  31    .ifnb \arg3 // Three arguments
8f10817155a8f5 Eric Biggers 2025-01-20  32      .ifc "\arg2", "\arg3" // arg2 == arg3?
8f10817155a8f5 Eric Biggers 2025-01-20  33        .ifnb \unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  34  	movdqu		\arg1, \unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  35  	\insn		\unaligned_mem_tmp, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  36        .else
8f10817155a8f5 Eric Biggers 2025-01-20 @37  	\insn		\arg1, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  38        .endif
8f10817155a8f5 Eric Biggers 2025-01-20  39      .else // arg2 != arg3
8f10817155a8f5 Eric Biggers 2025-01-20  40        .ifc "\arg1", "\arg3"
8f10817155a8f5 Eric Biggers 2025-01-20  41  	.error "Can't have arg1 == arg3 when arg2 != arg3"
8f10817155a8f5 Eric Biggers 2025-01-20  42        .endif
8f10817155a8f5 Eric Biggers 2025-01-20  43        .ifnb \unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  44  	movdqu		\arg1, \unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  45  	movdqa		\arg2, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  46  	\insn		\unaligned_mem_tmp, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  47        .else
8f10817155a8f5 Eric Biggers 2025-01-20  48  	movdqa		\arg2, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  49  	\insn		\arg1, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  50        .endif
8f10817155a8f5 Eric Biggers 2025-01-20  51      .endif
8f10817155a8f5 Eric Biggers 2025-01-20  52    .else // Only two arguments
8f10817155a8f5 Eric Biggers 2025-01-20  53      .ifnb \unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  54  	movdqu		\arg1, \unaligned_mem_tmp
8f10817155a8f5 Eric Biggers 2025-01-20  55  	\insn		\unaligned_mem_tmp, \arg2
8f10817155a8f5 Eric Biggers 2025-01-20  56      .else
8f10817155a8f5 Eric Biggers 2025-01-20  57  	\insn		\arg1, \arg2
8f10817155a8f5 Eric Biggers 2025-01-20  58      .endif
8f10817155a8f5 Eric Biggers 2025-01-20  59    .endif
8f10817155a8f5 Eric Biggers 2025-01-20  60  .else
8f10817155a8f5 Eric Biggers 2025-01-20  61    // VEX is allowed.  Emit the desired instruction directly.
8f10817155a8f5 Eric Biggers 2025-01-20  62    .ifnb \arg3
8f10817155a8f5 Eric Biggers 2025-01-20 @63  	v\insn		\arg1, \arg2, \arg3
8f10817155a8f5 Eric Biggers 2025-01-20  64    .else
8f10817155a8f5 Eric Biggers 2025-01-20  65  	v\insn		\arg1, \arg2
8f10817155a8f5 Eric Biggers 2025-01-20  66    .endif
8f10817155a8f5 Eric Biggers 2025-01-20  67  .endif
8f10817155a8f5 Eric Biggers 2025-01-20  68  .endm
8f10817155a8f5 Eric Biggers 2025-01-20  69  

:::::: The code at line 37 was first introduced by commit
:::::: 8f10817155a8f5f38d1501d81816504e9f799f78 x86/crc: add "template" for [V]PCLMULQDQ based CRC functions

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
