Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571621FF2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753530279; cv=none; b=qX9ghWLpTKNPFqTpeeFBq6K8LqTUNx4lNxK/oBefOokQHMKIT2xRwnkrf1OKIrwUGXI685aPjcRqTPqHgPIPy3/gq9FRHVKzYiYa3P2DsP831xtBSwcwE5OlxJxGHgAnFeEujj1AMf7PJTYvBUlhS4iKnTpINccSb3N2I0Me8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753530279; c=relaxed/simple;
	bh=MV6++QthUMub01RcMWTpNpGOQeuB+uJoIsbEdqh8jxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KbnrG8CdiiekZHN42gNFIdcLzF/3Wj3GYfC9cuYwdQEXMfmATMK1+UKgmgmqT5M8e41/aVLr2t4CJfE4GlcZFSWN7xyKTXNXX3VM7JYIIY3sngiv0U9bDxu6jtjobNY0+PRZpkJvG4vucvAsu3WOM/hDSrg2j+kaFcLR2cdPuAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwXgkIkl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwXgkIkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753530278; x=1785066278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MV6++QthUMub01RcMWTpNpGOQeuB+uJoIsbEdqh8jxM=;
  b=nwXgkIklwMmjKCsJPSjRJiy6JFvd+CSzK+yR+/SP7UkA0pZOCv+SqCxL
   Fz96L/fONtvzpaqi3Wf0wF98AzWiQlgqPJfRmsdYLDrpxLYSoVQK0fDwR
   h6y+twMVd6q5McLGwz2IQrSG0Qyl0lNXGqg8v18cC8GxXhhLbiAqp73sX
   sjaC6rEQUG62hdVYchhs9/rRdPSm2DHPluXmyBKSWfiteOcf2uF0W54hK
   tEVp5K4zTNwWhY1am4iaJblFQ6N5H00THGRbBpN3toCQCxgW3/5EnhIel
   8OBu5Ve6can4Ll3tjD/3rkNO2JAMbOCQeFEhBcCShU7X/F0606vgm5c3x
   A==;
X-CSE-ConnectionGUID: ZXwh/FchSPStnFDWamHH1g==
X-CSE-MsgGUID: hgTLFPl8QS2z6nbrlboocA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="78399352"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="78399352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:44:36 -0700
X-CSE-ConnectionGUID: 05R0wGsYQ/6cHFSfZfBLYQ==
X-CSE-MsgGUID: QlvWnxnhRDiAqJT8rG5n/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161854315"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 04:44:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufdKK-000LwP-1o;
	Sat, 26 Jul 2025 11:44:32 +0000
Date: Sat, 26 Jul 2025 19:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12137/12319] include/linux/kstack_erase.h:29:37:
 error: passing 'const struct task_struct *' to parameter of type 'struct
 task_struct *' discards qualifiers
Message-ID: <202507261908.eBMSznZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: 897627bc44d228f00cc8595c9b2fa747d3e8c64f [12137/12319] kstack_erase: Support Clang stack depth tracking
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250726/202507261908.eBMSznZw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261908.eBMSznZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261908.eBMSznZw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:96:
>> include/linux/kstack_erase.h:29:37: error: passing 'const struct task_struct *' to parameter of type 'struct task_struct *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      29 |         return (unsigned long)end_of_stack(tsk) + sizeof(unsigned long);
         |                                            ^~~
   include/linux/sched/task_stack.h:56:63: note: passing argument to parameter 'p' here
      56 | static inline unsigned long *end_of_stack(struct task_struct *p)
         |                                                               ^
   1 error generated.


vim +29 include/linux/kstack_erase.h

afaef01c001537 include/linux/stackleak.h Alexander Popov 2018-08-17  18  
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  19  /*
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  20   * The lowest address on tsk's stack which we can plausibly erase.
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  21   */
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  22  static __always_inline unsigned long
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  23  stackleak_task_low_bound(const struct task_struct *tsk)
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  24  {
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  25  	/*
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  26  	 * The lowest unsigned long on the task stack contains STACK_END_MAGIC,
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  27  	 * which we must not corrupt.
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  28  	 */
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27 @29  	return (unsigned long)end_of_stack(tsk) + sizeof(unsigned long);
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  30  }
9ec79840d6afaf include/linux/stackleak.h Mark Rutland    2022-04-27  31  

:::::: The code at line 29 was first introduced by commit
:::::: 9ec79840d6afaf472294588a6bbe145bcdffa28b stackleak: rework stack low bound handling

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
