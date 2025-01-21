Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022C81F1508
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737470023; cv=none; b=mQFYgIzVaoYLeMuLoXyMyKcQEHgbDZxMCE7oN8IZAXZwOsdtb8GfbF/avsQVBsMTQtkEWGao0/+dAHvlWy4OrEG5hy4v6Wb2V1Ewn7Qim0XVucYN/hL3FIpjgIZzmxcO3sqQPJj71FNHxkpIZ7WtZtxtmH4EHsKElJO5uWwpl5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737470023; c=relaxed/simple;
	bh=cwHAl5HGmm/VB704z6G5If2VMLLnmZa4e4HuXTwfATc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1ufzavAUatjKeOXkfcmX9+7/n2FQadBlSz8NXf2+9aNgN3fQzcHG9aDK5N7l+TKmdXCgilgVJiVWtQNH0an/lBnKk5h24M/dPElTitL4ypbyGFktgDmwONDk9fvnJXO8jSWzQFj33KqVh6SsW5Ad+Z0/iXmqYgrWxVIUdSJL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqxB7z/S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqxB7z/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737470019; x=1769006019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwHAl5HGmm/VB704z6G5If2VMLLnmZa4e4HuXTwfATc=;
  b=VqxB7z/SWGXoLJ2LlqGiejAWVuoWqpCeyXv7O4B+qVHaNH6UbnDyLz9h
   JGKzjnIO1E/1aF0RvDLLF1ZhzmKhAuUMsAZSPuPe+Nvdffqr5s3sohPHT
   PyGHMkAKdX3ncoGaw5dYormM+ToSkX3k0Y8ZIn4rMuUc+P7iW1bq1LakK
   sjeqSPYfwjmw+y3VWzYcBwUz286jbhT/qFEX2tDXrgDuqoqFr4H3B3rel
   mOrd3rTHU8Z2W8/hbeDbPcQIdMAS87/RhEm6kCREM1o/yEromITPvroaa
   FpBO6lgUI+cOVP+6vNDM9blpX8i/bKZVqvGLqyBkemYxt/n8HrmpdXBZ8
   Q==;
X-CSE-ConnectionGUID: ZmyyebgkSQ+83pwZ5+8BbQ==
X-CSE-MsgGUID: 4KQ8UIyHT0uiV/xrTN49FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38036210"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38036210"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 06:33:37 -0800
X-CSE-ConnectionGUID: a8V+ypoPS1OpvCsztM1/1w==
X-CSE-MsgGUID: JgdA5OOsR+G7z3voyLTEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="111808613"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jan 2025 06:33:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taFJu-000Y8c-1P;
	Tue, 21 Jan 2025 14:33:34 +0000
Date: Tue, 21 Jan 2025 22:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc-x86 5/5] arch/x86/lib/crc-pclmul-template.S:57: Error:
 bad register name `%rax'
Message-ID: <202501212223.Y5lJrhGf-lkp@intel.com>
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
commit: 37407214457b7a472e3c17dee7a58977e50bfcc8 [5/5] x86/crc-t10dif: implement crc_t10dif using new template
config: i386-buildonly-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501212223.Y5lJrhGf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501212223.Y5lJrhGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501212223.Y5lJrhGf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/lib/crc-pclmul-template.S: Assembler messages:
>> arch/x86/lib/crc-pclmul-template.S:57: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc16-msb-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc16-msb-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc16-msb-pclmul.S:6:   Info: macro invoked from here
   arch/x86/lib/crc-pclmul-template.S:65: Error: bad register name `%rax'
   arch/x86/lib/crc-pclmul-template.S:527:  Info: macro invoked from here
   arch/x86/lib/crc16-msb-pclmul.S:6:   Info: macro invoked from here


vim +57 arch/x86/lib/crc-pclmul-template.S

3bd7e844db281b Eric Biggers 2025-01-20  20  
3bd7e844db281b Eric Biggers 2025-01-20  21  // Emit a VEX (or EVEX) coded instruction if allowed, or emulate it using the
3bd7e844db281b Eric Biggers 2025-01-20  22  // corresponding non-VEX instruction plus any needed moves.  \insn gives the
3bd7e844db281b Eric Biggers 2025-01-20  23  // instruction without a "v" prefix and including any immediate argument, and
3bd7e844db281b Eric Biggers 2025-01-20  24  // \arg1-\arg3 give up to three non-immediate arguments as expected by the
3bd7e844db281b Eric Biggers 2025-01-20  25  // VEX-coded form of the instruction.  If \arg1 is an unaligned mem operand,
3bd7e844db281b Eric Biggers 2025-01-20  26  // \unaligned_mem_tmp must be specified as a temporary register.  If \arg3 is
3bd7e844db281b Eric Biggers 2025-01-20  27  // given and \arg2 != \arg3, then it is required that \arg1 != \arg3.
3bd7e844db281b Eric Biggers 2025-01-20  28  .macro	_cond_vex	insn:req, arg1:req, arg2:req, arg3, unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  29  .if AVX_LEVEL == 0
3bd7e844db281b Eric Biggers 2025-01-20  30    // VEX not allowed.  Emulate it.
3bd7e844db281b Eric Biggers 2025-01-20  31    .ifnb \arg3 // Three arguments
3bd7e844db281b Eric Biggers 2025-01-20  32      .ifc "\arg2", "\arg3" // arg2 == arg3?
3bd7e844db281b Eric Biggers 2025-01-20  33        .ifnb \unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  34  	movdqu		\arg1, \unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  35  	\insn		\unaligned_mem_tmp, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  36        .else
3bd7e844db281b Eric Biggers 2025-01-20  37  	\insn		\arg1, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  38        .endif
3bd7e844db281b Eric Biggers 2025-01-20  39      .else // arg2 != arg3
3bd7e844db281b Eric Biggers 2025-01-20  40        .ifc "\arg1", "\arg3"
3bd7e844db281b Eric Biggers 2025-01-20  41  	.error "Can't have arg1 == arg3 when arg2 != arg3"
3bd7e844db281b Eric Biggers 2025-01-20  42        .endif
3bd7e844db281b Eric Biggers 2025-01-20  43        .ifnb \unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  44  	movdqu		\arg1, \unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  45  	movdqa		\arg2, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  46  	\insn		\unaligned_mem_tmp, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  47        .else
3bd7e844db281b Eric Biggers 2025-01-20  48  	movdqa		\arg2, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  49  	\insn		\arg1, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  50        .endif
3bd7e844db281b Eric Biggers 2025-01-20  51      .endif
3bd7e844db281b Eric Biggers 2025-01-20  52    .else // Only two arguments
3bd7e844db281b Eric Biggers 2025-01-20  53      .ifnb \unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  54  	movdqu		\arg1, \unaligned_mem_tmp
3bd7e844db281b Eric Biggers 2025-01-20  55  	\insn		\unaligned_mem_tmp, \arg2
3bd7e844db281b Eric Biggers 2025-01-20  56      .else
3bd7e844db281b Eric Biggers 2025-01-20 @57  	\insn		\arg1, \arg2
3bd7e844db281b Eric Biggers 2025-01-20  58      .endif
3bd7e844db281b Eric Biggers 2025-01-20  59    .endif
3bd7e844db281b Eric Biggers 2025-01-20  60  .else
3bd7e844db281b Eric Biggers 2025-01-20  61    // VEX is allowed.  Emit the desired instruction directly.
3bd7e844db281b Eric Biggers 2025-01-20  62    .ifnb \arg3
3bd7e844db281b Eric Biggers 2025-01-20  63  	v\insn		\arg1, \arg2, \arg3
3bd7e844db281b Eric Biggers 2025-01-20  64    .else
3bd7e844db281b Eric Biggers 2025-01-20  65  	v\insn		\arg1, \arg2
3bd7e844db281b Eric Biggers 2025-01-20  66    .endif
3bd7e844db281b Eric Biggers 2025-01-20  67  .endif
3bd7e844db281b Eric Biggers 2025-01-20  68  .endm
3bd7e844db281b Eric Biggers 2025-01-20  69  

:::::: The code at line 57 was first introduced by commit
:::::: 3bd7e844db281b29970bffe661fb38fa157123e1 x86/crc: add "template" for [V]PCLMULQDQ based CRC functions

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
