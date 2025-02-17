Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF5E22083
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801627; cv=none; b=qQAxNkawsrOepEs/pL3xYTID7pMmv8Q6W7XgpznyrrwwDAZ9XHp5K354lGt1J4VPGvAlXMbqj2s6o5X1MCL1qw9oauR3miMso5SjEgYbeUaYP2qYff1DhzqORe2Xz3cg/OKaetBXhWLC5A/udFiV4dawUj68A8VtAc53yDm3djU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801627; c=relaxed/simple;
	bh=IK+MQO5fjQ2C4VBwea7V0Zu+YVZrYhYtGmndM32gqX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzGKEao0TgKyEvfH7+3H20RN8Sadmr/wGL+HgNboRjuYaaulYQNboTtx6aI9FE002FL2ikQQT7gL0HijoKI+TTKZt86xG+KNVG91oP/hiTy6/x9hOKyywQPPC/up+EAEorukmEJoTwZz0swsiBiLLgMcoxcS2yKM6fAppyA4qqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3ErXseJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3ErXseJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739801627; x=1771337627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IK+MQO5fjQ2C4VBwea7V0Zu+YVZrYhYtGmndM32gqX4=;
  b=H3ErXseJGllBNf5J+IA/qqA/K1mnYSYPt064RppUtQTPsI/hJxnfCu00
   LcfcY8fe92nt3I57JAPmxMsFKcnjXL0USuGH8cdG81B6Mwc8PyE59ZV7l
   IRq3OtqAafzrQhDwmtdDIPF/fnDlP2H6Znra1z9DFYpjI+Bx69KdD68Qe
   YgaLHTSeh6sArRfFmlRBkjd6Bzz+meWfb9BZToFJrfXMpEJeB17SqcR3O
   Qg9UlD2A47a3vdkHhH2nSTDF8C72J174xdZfJFeaTvRd1RHiHWv75NuhF
   inJ30Ovt5tPY/h3T8KSJrKqbLKQ6Dq3u2V0XEuE7k0VtBqsvMwTt3Y5F7
   g==;
X-CSE-ConnectionGUID: wPAtEZkOS22LSAXws4k3Kg==
X-CSE-MsgGUID: 8TX4yckkSxq++TqZCnOlQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="50699817"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="50699817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:13:46 -0800
X-CSE-ConnectionGUID: rqEx+y5jTW2h3jcKIWMACQ==
X-CSE-MsgGUID: PvYpAYuzQRuPf6tvk0s6GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145046870"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 06:13:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk1sU-001DCr-1B;
	Mon, 17 Feb 2025 14:13:42 +0000
Date: Mon, 17 Feb 2025 22:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 22/26]
 include/asm-generic/rqspinlock.h:40:12: error: conflicting types for
 'resilient_tas_spin_lock'; have 'int(rqspinlock_t *, u64)' {aka 'int(struct
 rqspinlock *, long long unsigned int)'}
Message-ID: <202502172203.h8E93U3V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   f998e0817b8a89691123f4a4a6e1277c22523695
commit: 6b89b1fcfbb4a0cc3ff978fdb42667cd3163c785 [22/26] bpf: Introduce rqspinlock kfuncs
config: x86_64-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172203.h8E93U3V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172203.h8E93U3V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172203.h8E93U3V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/rqspinlock.h:27,
                    from include/linux/bpf.h:33,
                    from include/linux/security.h:35,
                    from include/net/scm.h:9,
                    from include/linux/netlink.h:9,
                    from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from include/linux/etherdevice.h:21,
                    from net/devres.c:7:
>> include/asm-generic/rqspinlock.h:40:12: error: conflicting types for 'resilient_tas_spin_lock'; have 'int(rqspinlock_t *, u64)' {aka 'int(struct rqspinlock *, long long unsigned int)'}
      40 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration of 'resilient_tas_spin_lock' with type 'int(struct qspinlock *, u64)' {aka 'int(struct qspinlock *, long long unsigned int)'}
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +40 include/asm-generic/rqspinlock.h

b162e534420623 Kumar Kartikeya Dwivedi 2024-08-27  39  
5effdf8488423d Kumar Kartikeya Dwivedi 2025-02-04 @40  extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
5effdf8488423d Kumar Kartikeya Dwivedi 2025-02-04  41  #ifdef CONFIG_QUEUED_SPINLOCKS
d6a1899b88a315 Kumar Kartikeya Dwivedi 2024-11-18  42  extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
5effdf8488423d Kumar Kartikeya Dwivedi 2025-02-04  43  #endif
d6a1899b88a315 Kumar Kartikeya Dwivedi 2024-11-18  44  

:::::: The code at line 40 was first introduced by commit
:::::: 5effdf8488423d8a573cffea2958bb0ba3e177d0 rqspinlock: Add a test-and-set fallback

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
