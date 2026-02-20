Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DE218C03E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 04:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771560470; cv=none; b=O/KQhkUbXOaDxGOb9juQ4xSJreI0VN8wOv8vZNbEg0Gusq1iiCUZ9Ee9ypZkKoNSTMEUaVEwjZKT0sjFvbxLpOghJrWqexzXsgJHWh/AR6zy+wPbyODBkSXdN5E2DNquINiclfow2G4d4XCwWqhqD8yd86G8Rhygyw4DhU5+prY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771560470; c=relaxed/simple;
	bh=ZZrnVHvWv4HJb1CBnOeX2FOr8IIDlVgEB7sVKM0GQ7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fd1gXhh7icGlT+WqI6cYrClo5f/mz59ZsTx6ID5+r9ZUWR/K8gJnloJ/ykroPy18iDfSDSzpM1PdjqGVyOH07ci/FVc8GuOtE8PfBGMZ6b0qJU6QVtjMEQh9yviOyHOVM1Ii7trFasykCOUwqbC8npWrmtXmWe5UZWt3xbiQbbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEZgbVT+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEZgbVT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771560469; x=1803096469;
  h=date:from:to:cc:subject:message-id;
  bh=ZZrnVHvWv4HJb1CBnOeX2FOr8IIDlVgEB7sVKM0GQ7k=;
  b=TEZgbVT+IpxcVvjzzcixHuFb89YRGw4tmDmybEKZpPfGqRADHJfsnBc1
   kF1ANuyqFSq2NYYQRLlX1sbUPk0QvBrZFuuDCVKl5bThVAI9XCyrfWmqQ
   6wKuTtD+noBxuwmj+GCKAMdipjBcNy2PXytYKPt2r9TJGKCCNffOZINR2
   2dKF/DYZoXGY9PaUdy1XsybWdTeAsbSgJj8RajxtnrYHhzmS/fZF/vaDs
   RThsf7GHb0Bw7S5zVkkO+QbMiyFb+3G5YHfK55C9ICtXoLrRoidMlOwu9
   owL+bgG0Px7PK3Pt/m+zl1C8YSM4zlGag1QRRRjJjyCCemS12VAe1ML4r
   w==;
X-CSE-ConnectionGUID: 53/hDp+yT8yra2YOjqqutQ==
X-CSE-MsgGUID: KydmgEgHSq+25knss4Fh+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90065180"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="90065180"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 20:07:48 -0800
X-CSE-ConnectionGUID: 3gEVA1OoTyq1wKGuTpgJiQ==
X-CSE-MsgGUID: 9RQrSRi/QrSWK/oRtfNhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="214858295"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2026 20:07:47 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtHns-0000000048L-3YYO;
	Fri, 20 Feb 2026 04:07:44 +0000
Date: Fri, 20 Feb 2026 05:07:39 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 25/42]
 kernel/time/hrtimer.c:1252:16: error: too many arguments to function
 'hrtimer_prefer_local'
Message-ID: <202602200509.0cCJg9Ov-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 8a407a52a7bbadb7e60638bdc055bdf5cc8a3311 [25/42] hrtimer: Optimize for local timers
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260220/202602200509.0cCJg9Ov-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200509.0cCJg9Ov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200509.0cCJg9Ov-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c: In function 'hrtimer_keep_base':
>> kernel/time/hrtimer.c:1252:16: error: too many arguments to function 'hrtimer_prefer_local'
    1252 |         return hrtimer_prefer_local(is_local, is_first, is_pinned);
         |                ^~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1239:29: note: declared here
    1239 | static __always_inline bool hrtimer_prefer_local(bool is_local)
         |                             ^~~~~~~~~~~~~~~~~~~~


vim +/hrtimer_prefer_local +1252 kernel/time/hrtimer.c

  1244	
  1245	static inline bool hrtimer_keep_base(struct hrtimer *timer, bool is_local, bool is_first,
  1246					     bool is_pinned)
  1247	{
  1248		/* If the timer is running the callback it has to stay on its CPU base. */
  1249		if (unlikely(timer->base->running == timer))
  1250			return true;
  1251	
> 1252		return hrtimer_prefer_local(is_local, is_first, is_pinned);
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
