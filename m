Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C31BBBE5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764141520; cv=none; b=FDtOSl4FO113eQkf1kW7I94Uhxa0CgqUUzH0koFBi+DST3uxbOnA4SBMB4IHx5QHs5ST+tv5005WgoV8y9WIeV3S3r9CiEYhR3dNoS2D5b81JZD2JD7hYSJW+Me1uB2Rwegvr2GPHsAkPG6sUyFl/MHD3lJd0iZpZfnxkMthQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764141520; c=relaxed/simple;
	bh=U6/EYin1BA2wxEC72Y/mVUWSnbj9cU6GToYSSlHrLdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fr17tAw+/tx9h2ZRO2h/WfvqIT6BU7x7ArG5TKNyYJCJfXAmD1DvW62jGaamGJPLjv1aE5TXhQpt9pval0G8O8Lr9etGWtEcTPoBqWcfr2n1fPWYq9NH/fwJzxJ/9q+qXPsmcWTUuRpe2InFQzSQfzxTNzxfU5pI5KKGg5jLzQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8RuV3z7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8RuV3z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764141519; x=1795677519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6/EYin1BA2wxEC72Y/mVUWSnbj9cU6GToYSSlHrLdg=;
  b=l8RuV3z7S6jtvpnkCiNAgmTCMjPBdwy1Gu1fBjUbDrCk10vvCAr9RqTc
   4EmITvdIu1zU8pNfjCMvqul359BGS8g6BPQ2avxM/g2HDIPl8oh3rPpXZ
   p3AUVvmFyWKiQjVvSn/lWLJxEMkSeUejfueD9wYyrUuUho9h2XmvyCxSf
   GQjWRRBq3VAuQP8z8LL89i/ZS655mQTHHi757OVmjMb/Wcp/+Sl5vRm/p
   hvi1XBJ6PJqVKWAQvy6mXysvS2QMb/APpQ+tEHD6GS6XyUb1sQakLXQzA
   tYCqMdcVDtnCSt0iEh0YBykEsCcrLztcLcgK2uvbXl72Ur98RVYskGknX
   g==;
X-CSE-ConnectionGUID: +1XDwPktRsaLZ1W81GdI1Q==
X-CSE-MsgGUID: XX/sMCrGRMOQLhUigJJPOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77646250"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="77646250"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 23:18:37 -0800
X-CSE-ConnectionGUID: buQccHsfQYS3ALshGlASMg==
X-CSE-MsgGUID: +hkT1mPQQjuAQRi2Q8NbSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="192952449"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2025 23:18:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO9nN-000000002ab-0tEm;
	Wed, 26 Nov 2025 07:18:33 +0000
Date: Wed, 26 Nov 2025 15:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>
Subject: [linux-next:master 10912/12060] arch/s390/kernel/entry.S:165: Error:
 Unrecognized opcode: `aghik'
Message-ID: <202511261518.nBbQN5h7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   663d0d1af3faefe673cabf4b6b077149a87ad71f
commit: f5730d44e05efb43a5cb64e5eb04e24994bbb50f [10912/12060] s390: Add stackprotector support
config: s390-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251126/202511261518.nBbQN5h7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261518.nBbQN5h7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261518.nBbQN5h7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kernel/entry.S: Assembler messages:
>> arch/s390/kernel/entry.S:165: Error: Unrecognized opcode: `aghik'


vim +165 arch/s390/kernel/entry.S

   125	
   126		.macro STACKLEAK_ERASE
   127	#ifdef CONFIG_KSTACK_ERASE
   128		brasl	%r14,stackleak_erase_on_task_stack
   129	#endif
   130		.endm
   131	
   132		GEN_BR_THUNK %r14
   133	
   134		.section .kprobes.text, "ax"
   135	.Ldummy:
   136		/*
   137		 * The following nop exists only in order to avoid that the next
   138		 * symbol starts at the beginning of the kprobes text section.
   139		 * In that case there would be several symbols at the same address.
   140		 * E.g. objdump would take an arbitrary symbol when disassembling
   141		 * the code.
   142		 * With the added nop in between this cannot happen.
   143		 */
   144		nop	0
   145	
   146	/*
   147	 * Scheduler resume function, called by __switch_to
   148	 *  gpr2 = (task_struct *)prev
   149	 *  gpr3 = (task_struct *)next
   150	 * Returns:
   151	 *  gpr2 = prev
   152	 */
   153	SYM_FUNC_START(__switch_to_asm)
   154		stmg	%r6,%r15,__SF_GPRS(%r15)	# store gprs of prev task
   155		lghi	%r4,__TASK_stack
   156		lghi	%r1,__TASK_thread
   157		llill	%r5,STACK_INIT_OFFSET
   158		stg	%r15,__THREAD_ksp(%r1,%r2)	# store kernel stack of prev
   159		lg	%r15,0(%r4,%r3)			# start of kernel stack of next
   160		agr	%r15,%r5			# end of kernel stack of next
   161		GET_LC	%r13
   162		stg	%r3,__LC_CURRENT(%r13)		# store task struct of next
   163		stg	%r15,__LC_KERNEL_STACK(%r13)	# store end of kernel stack
   164		lg	%r15,__THREAD_ksp(%r1,%r3)	# load kernel stack of next
 > 165		aghik	%r4,%r3,__TASK_pid
   166		mvc	__LC_CURRENT_PID(4,%r13),0(%r4) # store pid of next
   167		ALTERNATIVE "nop", "lpp _LPP_OFFSET(%r13)", ALT_FACILITY(40)
   168	#ifdef CONFIG_STACKPROTECTOR
   169		lg	%r3,__TASK_stack_canary(%r3)
   170		stg	%r3,__LC_STACK_CANARY(%r13)
   171	#endif
   172		lmg	%r6,%r15,__SF_GPRS(%r15)	# load gprs of next task
   173		BR_EX	%r14
   174	SYM_FUNC_END(__switch_to_asm)
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
