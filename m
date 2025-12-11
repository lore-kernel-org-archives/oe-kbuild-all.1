Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B761DDC1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765419811; cv=none; b=EaLvxcPhAbTSPvdoq0bWJueEuVtqM5PklV2vKyhT31ZfKFsNgmw8rIL33HyQHUmrTsbZ9p0f3ZqFY4l1JfEQ48yDlwOdff7YmyJKDfqvgN9ZH/SUp4E0xftrQYiIlhPg4qCI7UOQ6Vk2RDlk84WTmqTnbHWfwaCk9GKhkL4qXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765419811; c=relaxed/simple;
	bh=a4itn3LB3Xsv/01tCwXff7Pbw3U7WT8U3INmmNYwrwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUIqFA8On6QixL+sLFs9jjHTcbyScewlHUNgv+IPfPQ+Ml2Jk2OdGFgEATibwiJRSqqEnfHFI9VI2i9lFOZb5xAZHq/h/1fw3OK4J0jQY6I4iKT2BNP4CIFMMMmWAPpR7KYPROVFuBpVS69jSC5OFUVPPuDDM4RcGkL0B9H1isw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDRxyGzQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDRxyGzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765419809; x=1796955809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4itn3LB3Xsv/01tCwXff7Pbw3U7WT8U3INmmNYwrwY=;
  b=mDRxyGzQk8iAfaEyR2HQc2767lC5Q8R9W+FvXaXtkbxJ34T07Qd8pAnh
   Z8oiMiMJk+uKBmLnOc4cPIhUCsOZ2lTK6L/Rsr5fvOlHPqdbJiyWtuAMb
   OtqkkxAXo521D/v9mz5BzdK3zV2/ckY9sWXbIiE4IwUI2jhZu8ZiGtpZi
   XxuH3WldfEfsp3U134IrtUulKIyLDWavwh61M1IpJ27A+FH+XRoZ2FyvN
   3rmBUfE4bGxFdTGJEHKfpYWhQsDIT4FF0wPOa74c628oHrxjCGD1Ii+6F
   DQXBMom3ACTIytWF1ycz/1k9FTv95BD+UMHeYHdTuUEnPtXKexiayQn+0
   g==;
X-CSE-ConnectionGUID: vs806nBsQiO5qiiynLCdFA==
X-CSE-MsgGUID: 4UH9yk6QS7SbuYnsiTkipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66399515"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="66399515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:23:28 -0800
X-CSE-ConnectionGUID: tLIaIzkBQya5A0BKGMn9ow==
X-CSE-MsgGUID: 1WzVhAXBSlCLnHssWXoYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234092319"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 18:23:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWKy-0000000041r-3DTh;
	Thu, 11 Dec 2025 02:23:24 +0000
Date: Thu, 11 Dec 2025 10:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202512111034.9udHScZy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kumar,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: e2082e32fd57976e811086708043c136ee596978 rqspinlock: Add entry to Makefile, MAINTAINERS
date:   9 months ago
config: x86_64-randconfig-121-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111034.9udHScZy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111034.9udHScZy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111034.9udHScZy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/rqspinlock.c:100:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:100:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:100:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:122:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:122:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:122:39: sparse:     got struct rqspinlock_held *
   kernel/bpf/rqspinlock.c:135:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rqspinlock_held * @@
   kernel/bpf/rqspinlock.c:135:51: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/bpf/rqspinlock.c:135:51: sparse:     got struct rqspinlock_held *

vim +100 kernel/bpf/rqspinlock.c

31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   96  
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   97  static noinline int check_deadlock_AA(rqspinlock_t *lock, u32 mask,
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   98  				      struct rqspinlock_timeout *ts)
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15   99  {
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15 @100  	struct rqspinlock_held *rqh = this_cpu_ptr(&rqspinlock_held_locks);
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  101  	int cnt = min(RES_NR_HELD, rqh->cnt);
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  102  
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  103  	/*
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  104  	 * Return an error if we hold the lock we are attempting to acquire.
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  105  	 * We'll iterate over max 32 locks; no need to do is_lock_released.
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  106  	 */
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  107  	for (int i = 0; i < cnt - 1; i++) {
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  108  		if (rqh->locks[i] == lock)
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  109  			return -EDEADLK;
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  110  	}
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  111  	return 0;
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  112  }
31158ad02ddbed Kumar Kartikeya Dwivedi 2025-03-15  113  

:::::: The code at line 100 was first introduced by commit
:::::: 31158ad02ddbed2b0672c9701a0a2f3e5b3bc01a rqspinlock: Add deadlock detection and recovery

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
