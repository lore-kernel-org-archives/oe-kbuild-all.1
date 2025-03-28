Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5064DDC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185301; cv=none; b=AteNOGtF5LgTX4WgwUDHRZUu3AHYqtGBjsxaQas3BpNXV01wVCF/jnTXmAmrCRYC7ya142pPyfnXO2drenZ6TmXJNWynd8IdADKBq+UUGlosaXvLA+vObH+xoc5aa3VIdUitqiMnyqqgovuVg8y88Epjkc8coWAFy+F2mlTxcwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185301; c=relaxed/simple;
	bh=1+2OY/R9qEW7BtTYgjOqKZGG1SwSepPaJDRtuO0wMvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5Lh4T3D34VtJvc8Fb1V+EYzFJ7vIB+KvOuli4TFqk4OI2tce5YUUcJMViyFNRb7EulXttBEsqtwBt960ZU53jJZIKM283XMyAI4aNzATgfNoQFL9lm6ApF2pTe54FGWoof6Sn6Sgh1bhK3caDiylxC9bdR7K/ubdAHt1bJVrIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+ySwVjr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+ySwVjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743185300; x=1774721300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+2OY/R9qEW7BtTYgjOqKZGG1SwSepPaJDRtuO0wMvs=;
  b=P+ySwVjrfQlRhWe9B2BcUgZJD1OP7e4MVAUG4RZmvkK9jL3HNcgGMgry
   Xg7FNkLFKZaim0Abyk2OjnV2FFr8C0yNGZz0JzS/u1UYKvcY1m3D0kXGg
   zlIKHzaGMi8yAnVUbQFn9MvamWnroYHJZjYdsFzxi9KakuuMumA2Z2Vdt
   EJlcSxmo65e3QglPKbf+ZBK4/TLRG3qiH/w7n4V0uMh4uVQXhi/Sxy049
   zbfga6D5UsbUv6kcgISeomLz49nc7US1AnVkwn8a4BLvyd4TjooRseNxW
   x+EUW2n3V15PCkvYZXE3mOcET09OUy48Gw0dG2NSw053/8TikVQZG//dC
   A==;
X-CSE-ConnectionGUID: DygCaREfRnan2oAVBqyUGA==
X-CSE-MsgGUID: p8wvgJoTS/q0Pv4jllqksw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44450485"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="44450485"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 11:08:18 -0700
X-CSE-ConnectionGUID: PgxsfXzETOmQOwnwis4GvQ==
X-CSE-MsgGUID: AEySXamASoa25ac/FiphqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125277700"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2025 11:08:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyE7o-0007ci-0U;
	Fri, 28 Mar 2025 18:08:13 +0000
Date: Sat, 29 Mar 2025 02:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] fs/proc/base.c:3819:2-3: Unneeded
 semicolon
Message-ID: <202503290128.GVOos0yH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eafcd29b88b645eaef132d334fd1ffe290c10435
commit: dce8f8ed1de1d9d6d27c5ccd202ce4ec163b100c [2/2] document while_each_thread(), change first_tid() to use for_each_thread()
config: x86_64-randconfig-103-20250326 (https://download.01.org/0day-ci/archive/20250329/202503290128.GVOos0yH-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290128.GVOos0yH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/proc/base.c:3819:2-3: Unneeded semicolon

vim +3819 fs/proc/base.c

  3775	
  3776	/*
  3777	 * Find the first tid of a thread group to return to user space.
  3778	 *
  3779	 * Usually this is just the thread group leader, but if the users
  3780	 * buffer was too small or there was a seek into the middle of the
  3781	 * directory we have more work todo.
  3782	 *
  3783	 * In the case of a short read we start with find_task_by_pid.
  3784	 *
  3785	 * In the case of a seek we start with the leader and walk nr
  3786	 * threads past it.
  3787	 */
  3788	static struct task_struct *first_tid(struct pid *pid, int tid, loff_t f_pos,
  3789						struct pid_namespace *ns)
  3790	{
  3791		struct task_struct *pos, *task;
  3792		unsigned long nr = f_pos;
  3793	
  3794		if (nr != f_pos)	/* 32bit overflow? */
  3795			return NULL;
  3796	
  3797		rcu_read_lock();
  3798		task = pid_task(pid, PIDTYPE_PID);
  3799		if (!task)
  3800			goto fail;
  3801	
  3802		/* Attempt to start with the tid of a thread */
  3803		if (tid && nr) {
  3804			pos = find_task_by_pid_ns(tid, ns);
  3805			if (pos && same_thread_group(pos, task))
  3806				goto found;
  3807		}
  3808	
  3809		/* If nr exceeds the number of threads there is nothing todo */
  3810		if (nr >= get_nr_threads(task))
  3811			goto fail;
  3812	
  3813		/* If we haven't found our starting place yet start
  3814		 * with the leader and walk nr threads forward.
  3815		 */
  3816		for_each_thread(task, pos) {
  3817			if (!nr--)
  3818				goto found;
> 3819		};
  3820	fail:
  3821		pos = NULL;
  3822		goto out;
  3823	found:
  3824		get_task_struct(pos);
  3825	out:
  3826		rcu_read_unlock();
  3827		return pos;
  3828	}
  3829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
