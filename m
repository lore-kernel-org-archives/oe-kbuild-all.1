Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BFC13D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 04:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731818636; cv=none; b=o05g5SGqv+E1mVAnpXQaBY/ijMkXjbBQOrTvY5Dm1oshfC2DcadJngMja+YYKosCZ7tl6bwWc2EbwFe20Wt4oQwevSW8UmLKUNVbFsyu25qPr5pP4/Dc5CnylgDMh+WqwhY7PxbtVHMxrDLeWlaXNJaXOZDfN6k3MDzTvefhP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731818636; c=relaxed/simple;
	bh=jrshYjXuh9BU/j6HoadlG16EE9V1Qnd47gqisWOOUHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXQ9THIYkZnz9Axj51g9n7rht9AGWI+8lmNRzbTpi9SwR4xMrpz7CIXhXQ+wtavnuhyINzWtsB3WFVdEyzX8pZ6eiaBOjqOw1EkwgwTF8PLJ7s3erNh5oi1csb2wcXw86axfra8BjfFHaUp4NqVBfeTCx+hpdW4U/s9/G/xDOUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z14JEN9K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z14JEN9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731818634; x=1763354634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrshYjXuh9BU/j6HoadlG16EE9V1Qnd47gqisWOOUHk=;
  b=Z14JEN9KxHblb3X4N0FfiZ0P0BvbOuF0+mwupiupSx5w5KR1IPgiaXXv
   C61NjgbHv1eUIqfQV9+dWWMHb4mFGWgU7nazKax86YA4LE/aGO1v+Dvpe
   bzYlfxSfKIsypYbHehAZZKPF6IU7URlCS2QIouPJoctPYQeymSdqE3EFp
   lgm9AIeWtTLgiVZIcB3fpKNMBGuwd7r2z04p/9SF2cFUnG/kbBghBVncI
   6XeY2PdAzAo4Ok4pl5SP6eDbcGo1NypczrfVfInSZQd95nPQ9A9ynPYh6
   cXQNKl41+kSGkCG9j+VaKBRqJz7yXt+Gm+iWkFNRTvFMFwNlFQZV0epVe
   A==;
X-CSE-ConnectionGUID: ZUV8felxQRmJcxoEY7SUYQ==
X-CSE-MsgGUID: 6cDY0jffTMGKTVq02q6L7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="35560903"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35560903"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 20:43:54 -0800
X-CSE-ConnectionGUID: xcK4O0W9RZCmEQdw8kel1g==
X-CSE-MsgGUID: buadNhEkSlGmHGQ24eC9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93375795"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2024 20:43:52 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCX8Y-0001Ua-0d;
	Sun, 17 Nov 2024 04:43:50 +0000
Date: Sun, 17 Nov 2024 12:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 5/8] arch/x86/kernel/traps.c:136:21: error:
 implicit declaration of function 'X86_MODRB_RM'; did you mean
 'X86_MODRM_RM'?
Message-ID: <202411171237.YTh4fEM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   72c0a686dca37ac0f2ed213b2be9487ae091bb99
commit: 3b8ca79166ffec0c374f9efa2f30946f335c3442 [5/8] x86/traps: Cleanup and robustify decode_bug()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241117/202411171237.YTh4fEM8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171237.YTh4fEM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171237.YTh4fEM8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/traps.c: In function 'decode_bug':
>> arch/x86/kernel/traps.c:136:21: error: implicit declaration of function 'X86_MODRB_RM'; did you mean 'X86_MODRM_RM'? [-Werror=implicit-function-declaration]
     136 |         case 0: if (X86_MODRB_RM(v) == 5)
         |                     ^~~~~~~~~~~~
         |                     X86_MODRM_RM
   cc1: some warnings being treated as errors


vim +136 arch/x86/kernel/traps.c

    94	
    95	/*
    96	 * Check for UD1 or UD2, accounting for Address Size Override Prefixes.
    97	 * If it's a UD1, further decode to determine its use:
    98	 *
    99	 * UBSan{0}:     67 0f b9 00             ud1    (%eax),%eax
   100	 * UBSan{10}:    67 0f b9 40 10          ud1    0x10(%eax),%eax
   101	 * static_call:  0f b9 cc                ud1    %esp,%ecx
   102	 *
   103	 * Notably UBSAN uses EAX, static_call uses ECX.
   104	 */
   105	__always_inline int decode_bug(unsigned long addr, s32 *imm, int *len)
   106	{
   107		unsigned long start = addr;
   108		u8 v;
   109	
   110		if (addr < TASK_SIZE_MAX)
   111			return BUG_NONE;
   112	
   113		v = *(u8 *)(addr++);
   114		if (v == INSN_ASOP)
   115			v = *(u8 *)(addr++);
   116		if (v != OPCODE_ESCAPE)
   117			return BUG_NONE;
   118	
   119		v = *(u8 *)(addr++);
   120		if (v == SECOND_BYTE_OPCODE_UD2) {
   121			*len = addr - start;
   122			return BUG_UD2;
   123		}
   124	
   125		if (v != SECOND_BYTE_OPCODE_UD1)
   126			return BUG_NONE;
   127	
   128		*imm = 0;
   129		v = *(u8 *)(addr++);		/* ModRM */
   130	
   131		if (X86_MODRM_MOD(v) != 3 && X86_MODRM_RM(v) == 4)
   132			addr++;			/* SIB */
   133	
   134		/* Decode immediate, if present */
   135		switch (X86_MODRM_MOD(v)) {
 > 136		case 0: if (X86_MODRB_RM(v) == 5)
   137				addr += 4; /* RIP + disp32 */
   138			break;
   139	
   140		case 1: *imm = *(s8 *)addr;
   141			addr += 1;
   142			break;
   143	
   144		case 2: *imm = *(s32 *)addr;
   145			addr += 4;
   146			break;
   147	
   148		case 3: break;
   149		}
   150	
   151		/* record instruction length */
   152		*len = addr - start;
   153	
   154		if (X86_MODRM_REG(v) == 0)	/* EAX */
   155			return BUG_UD1_UBSAN;
   156	
   157		return BUG_UD1;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
