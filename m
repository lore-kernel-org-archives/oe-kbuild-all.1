Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97C390C95
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Sep 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269508; cv=none; b=l8ueEIyRf09421Yb/pTJgnfB70h9WprhUoVPPmfX6WlfGY452qezyD7Aai0cmQUBY5eq778vv+odh8TK8cfFW9RtKHv/JUyJgduwMUU4z345VelEIgWYvrPagZIHGmJ2WSjg3UR93RC6FgjBSaZTaaqyTAyqst+W57aNhPZvFzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269508; c=relaxed/simple;
	bh=LtOUIoP4ybNYYYxUleZ6f+wUV5sUY4NJOC21dGHe/xM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ARgXgKBvnbWjfHklKa3AQKO1Nk8NfNFfQlbZWKrpQOyiUznsx9hMR3ihr4QWI1A/7s/XwonEkF7qpnlezNJFktpsEbFRRkosimzf2VhfcLq6kiBxaOiLUe6Dn+kH6BvmFdXt0vDu9rTFSBJVzLlsO+PoNv+ZxYi7hE1afxKBMdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHDzNxR1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHDzNxR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788269506; x=1819805506;
  h=date:from:to:cc:subject:message-id;
  bh=LtOUIoP4ybNYYYxUleZ6f+wUV5sUY4NJOC21dGHe/xM=;
  b=IHDzNxR1hXlJj45mTJq8IyaPBbxiK3z4ZmgRplaFif5PH1CVw6/au+kv
   396cH6L1NcHmScaBaQlVWvqy8VBmQdHlblk48vBJNKVDEqVVK2Ib0wspX
   D8wFz6FD/YboQD19k4vkXEcqurgNoZRpxFYRGN2QH4kFJ6X4i6G7nxZnX
   G4tIr/wro8FxfU8aAdL+W3EWa6idZhwoMrh2UnWseeKI/4ASNuCXPt2PM
   F9SPEhe8weAQEyphe6T48vjE5IX8+KTGc73T6UXwiwwGpG3Ptx97s0Mw5
   6uwLcOIfXDmKVdOBC31Mx2LqijeNqdlkSj6IlMhJUfW8qyB0+khn5BPPQ
   Q==;
X-CSE-ConnectionGUID: Mv8DuaiAR6qWLr2LKacTvw==
X-CSE-MsgGUID: cJCv826gSr6TgIMK/44c6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88723921"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88723921"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 06:31:45 -0700
X-CSE-ConnectionGUID: KTlXE4cvRn2ClgmOfXMVvg==
X-CSE-MsgGUID: KCtqXCRiR66W4A6aa8bTyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="292609547"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2026 06:31:42 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1OaS-000000000pE-1FLA;
	Tue, 01 Sep 2026 13:31:40 +0000
Date: Tue, 01 Sep 2026 21:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-thread-handoff 10/13]
 arch/arm64/include/asm/processor.h:387:43: error: implicit declaration of
 function 'task_stack_page'; did you mean 'task_stack_vm_area'?
Message-ID: <202609012125.eUbNnxYY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-thread-handoff
head:   e787853bf31af505ee20b5a64dd31bdaaca8bedd
commit: d664aea9c73b2f39f16192756888e0c03aa1fa28 [10/13] io_uring: enable handing submitter identity to an io-wq worker
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260901/202609012125.eUbNnxYY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609012125.eUbNnxYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609012125.eUbNnxYY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:13,
                    from io_uring/handoff.c:12:
   io_uring/handoff.c: In function 'io_handoff_resume':
>> arch/arm64/include/asm/processor.h:387:43: error: implicit declaration of function 'task_stack_page'; did you mean 'task_stack_vm_area'? [-Wimplicit-function-declaration]
     387 |         ((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
         |                                           ^~~~~~~~~~~~~~~
   io_uring/handoff.c:307:43: note: in expansion of macro 'task_pt_regs'
     307 |         syscall_set_return_value(current, task_pt_regs(current),
         |                                           ^~~~~~~~~~~~


vim +387 arch/arm64/include/asm/processor.h

2f79d2fc391e4ba Peter Collingbourne 2021-03-18  381  
9cce7a435f89c9e Catalin Marinas     2012-03-05  382  /* Thread switching */
9cce7a435f89c9e Catalin Marinas     2012-03-05  383  extern struct task_struct *cpu_switch_to(struct task_struct *prev,
9cce7a435f89c9e Catalin Marinas     2012-03-05  384  					 struct task_struct *next);
9cce7a435f89c9e Catalin Marinas     2012-03-05  385  
9cce7a435f89c9e Catalin Marinas     2012-03-05  386  #define task_pt_regs(p) \
34be98f4944f990 Ard Biesheuvel      2017-07-20 @387  	((struct pt_regs *)(THREAD_SIZE + task_stack_page(p)) - 1)
9cce7a435f89c9e Catalin Marinas     2012-03-05  388  

:::::: The code at line 387 was first introduced by commit
:::::: 34be98f4944f99076f049a6806fc5f5207a755d3 arm64: kernel: remove {THREAD,IRQ_STACK}_START_SP

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Mark Rutland <mark.rutland@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
