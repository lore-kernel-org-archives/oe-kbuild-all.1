Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F721E98FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281218; cv=none; b=Gr4j/KjXCZFvqjVfAth/OZTt98TsDr36U6l58G3L/Z48Fheg8xyKmKKgvAY7IPUqfYUYqAIhurl9FlrDunRWNgIZredPgHB9NaybSu9S/e3WnAL43M6LctGV5MKkSRqdb9Zg8NYaYt89uCiRWsLydP1GG3w44jwtPMzSeIdbCN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281218; c=relaxed/simple;
	bh=r/2/CQxDmIZx2c1SVRiSiJVsiQot5v6eeH//DkeyPbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8o6TVwoEnIdQjXlZvgpHmx4n0mWED/FGani+BDriBo3DV4Rj09sJMP1xPx5EDN4Q/nzkKolYhVAtsuA5CjHjrzZUw9mJ3GBYqLqNKxZzEMYfihRl4nhGO/cZXCfTBSrMDuN6Af0i58D45IdkIBpyZvDu1d/fyz0luqwxKxd+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGFu36Xm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGFu36Xm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739281217; x=1770817217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/2/CQxDmIZx2c1SVRiSiJVsiQot5v6eeH//DkeyPbQ=;
  b=jGFu36Xm9rVuA+qsyFzr9wktPrc93GKt/tVePmDydM2WoHK0aSHFhAyW
   dgg5XhWoEc/Ab9KPpxtLb57DM+QWAe9/o5bOAA9glvLpka5LroGrJXvn1
   wY9fWMSg+OJ6dcjwQWi33aspJBZym1qNoCy7Gkj59fG+YksNG0r2Rim32
   zYVTDGm+wMZMn1mxFXcY1+pNr/SbwSRuDB9wqCxVkLLSBp28wyChGb3p7
   xKhmday5js+E+bRNN4s01NDRRVIDKViOfF8LjYb5ZQtePK1x6byx1VLyf
   a7ZnzS3ZjJYpShhD0PLxzNQvWTfaFSLZ3hXzZQDUkj9E3Rb9t8KU2DEjh
   w==;
X-CSE-ConnectionGUID: OywuwdxESwOM3NcKDvCp4A==
X-CSE-MsgGUID: EqFiU8WIS+6vUhI83B3XyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51288909"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="51288909"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:40:15 -0800
X-CSE-ConnectionGUID: Q7aZsfLNTgSQ6MwQjng/MA==
X-CSE-MsgGUID: SZN+ywdZSpWN6mbSsSd7tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116592899"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2025 05:40:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thqUl-0014E0-2U;
	Tue, 11 Feb 2025 13:40:11 +0000
Date: Tue, 11 Feb 2025 21:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 82/82] kernel/rcu/rcutorture.c:2453:67: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 3
 has type 'int'
Message-ID: <202502112142.EW8uJgW3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   31c00ec5301cf02af354d57007bf0d79d5aef1c5
commit: 31c00ec5301cf02af354d57007bf0d79d5aef1c5 [82/82] rcutorture: Check for ->up_read() without matching ->down_read()
config: i386-buildonly-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112142.EW8uJgW3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112142.EW8uJgW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112142.EW8uJgW3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from kernel/rcu/rcutorture.c:16:
   kernel/rcu/rcutorture.c: In function 'rcu_torture_updown_hrt':
>> kernel/rcu/rcutorture.c:2453:67: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~            ~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                                                                             |
         |                                                                                                                             int
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/asm-generic/bug.h:185:41: note: in expansion of macro 'WARN'
     185 | #define WARN_ONCE(condition, format...) WARN(condition, format)
         |                                         ^~~~
   kernel/rcu/rcutorture.c:2453:9: note: in expansion of macro 'WARN_ONCE'
    2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |         ^~~~~~~~~
   kernel/rcu/rcutorture.c:2453:100: note: format string is defined here
    2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                                                                                                  ~~^
         |                                                                                                    |
         |                                                                                                    long unsigned int
         |                                                                                                  %u
   kernel/rcu/rcutorture.c: In function 'rcu_torture_updown_one':
   kernel/rcu/rcutorture.c:2524:75: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    2524 |                 WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~            ~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                                                                                     |
         |                                                                                                                                     int
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/asm-generic/bug.h:185:41: note: in expansion of macro 'WARN'
     185 | #define WARN_ONCE(condition, format...) WARN(condition, format)
         |                                         ^~~~
   kernel/rcu/rcutorture.c:2524:17: note: in expansion of macro 'WARN_ONCE'
    2524 |                 WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                 ^~~~~~~~~
   kernel/rcu/rcutorture.c:2524:108: note: format string is defined here
    2524 |                 WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
         |                                                                                                          ~~^
         |                                                                                                            |
         |                                                                                                            long unsigned int
         |                                                                                                          %u


vim +2453 kernel/rcu/rcutorture.c

  2446	
  2447	static enum hrtimer_restart rcu_torture_updown_hrt(struct hrtimer *hrtp)
  2448	{
  2449		struct rcu_torture_one_read_state_updown *rtorsup;
  2450	
  2451		rtorsup = container_of(hrtp, struct rcu_torture_one_read_state_updown, rtorsu_hrt);
  2452		rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
> 2453		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
  2454		rtorsup->rtorsu_nups++;
  2455		smp_store_release(&rtorsup->rtorsu_inuse, false);
  2456		return HRTIMER_NORESTART;
  2457	}
  2458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
