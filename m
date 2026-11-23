Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445879;
	b=OWROOvRUnmqJGy1JIZufkSRTwfU8rCgNJbnyll4yoVKS/+OyMhpIRqzwYbSQYmWEDuYz
	 bx74szvIxqlLncPMX+k/pLEOLADsTlfyu58QB7j/vQonD2852XWB7MUu3hx4Nk5h2J/SJ
	 BJjCBpxPXe4y3vLA3tZF9hnFzJqF8pPnKEhTvvYy5hIdiPJTnF7a7QYlmdpZDY22jG0P+
	 z6dwgmMxLv8hTpqQVqayFS0QctFcXjlcvufce2ckpMUmSt+SwncSENKrBP1m9mdQR8+E4
	 iRuIjr8LUsxb/HZLegJTvsCzKRon0zcUHcZR9sWbUeLRnBAH3d25veILCzMpVS75T8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445879;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=SvA56YhUXqy8qG6L3bTNd5t0euu8QWKpYA9XGtN04HQ=;
	b=HaNjw/Ke6HygIh9Vfz7N7Wcc2kdZaBTWQtU3YpJLccF+hwRydcUCqZ0AA01klRGmG0Xp
	 I4DAXK/Jduk/BXPOODaIKuMHMeL5cCE4xoAuS2Y/e2+xQeOzMczMDSxh0w/GA75cF5f5v
	 jW+OgSUK9QT59p1xMcepbTj+c29VPeZSJaVHkKHoOToyUFJAw4XVtGrW622td4Brii+Ph
	 Dk55KEYkUV5v9F8M2S5G+QBc9vYzt91uHebCVrygKzaayEBSv3JSne1bcqnbnPCPJ5iD4
	 3gBDYqahjzpHWv0pLAjfLjblDlhaa9YAHUUv4+fj0SM4VExPCidnbhhHzq/NAzkOMsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bRthz5dq;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA7606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 14:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98AA7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bRthz5dq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795445878; x=1826981878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+Vwzq993X3wnXGXIiVmauKOMMRuPG5uhhqHYpDtvbk=;
  b=bRthz5dqqCvc/vgsLTmPusVAzJaw7T0q7DtUZZjULRW814nWMPNKyz9l
   fBOeEFRKcpQuXmYw4bHn5MSDTM8s03DXW3vikEY1bzPbE/hagcVefr5p8
   hdp4GK1Ab0oJNvx+ciHnd4dSw1+SWRH9ll3nmWvCrStS5PmQqqGeo7yPw
   RdvQ09tY8k4l4/9AXnbn6VrnI+Qzz+z1Xl19PXEzr0T/fQJ+tDKLc4SWJ
   oOnCr+hpPRij07VUvrzzR28ZJ9qras3qLZwB1K/4DqmkAURGU+tKAOUNp
   lSS4z/zEOaaltZFCGc1RVYhfGWbJcryvDgTKArPJqI3h/NmVXDdcZpywk
   w==;
X-CSE-ConnectionGUID: c6SpJbEtQAWx8NjXbFpnvw==
X-CSE-MsgGUID: gsML8lb4QH+ovdGwTNDMuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4267453"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4267453"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:57:58 -0800
X-CSE-ConnectionGUID: rUoFUvPbRDmRouK7ykExdQ==
X-CSE-MsgGUID: BHMF5GfuTjG0/LVQa9v2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13017670"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 23 Nov 2026 06:57:57 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVVUP-000000004rJ-23AC;
	Mon, 23 Nov 2026 14:57:53 +0000
Date: Mon, 23 Nov 2026 15:57:09 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Oleg Nesterov <oleg@redhat.com>
Subject: [mic:next 1/1] security/landlock/tsync.c:492:9: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <20261123155122.GQ2URc4f-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   afa0df0854578e41f8fb321bddf61c9e5bdb49df
commit: afa0df0854578e41f8fb321bddf61c9e5bdb49df [1/1] landlock: Do not hold exec_update_lock across the TSYNC wait
config: hexagon-randconfig-r2301-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123155122.GQ2URc4f-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123155122.GQ2URc4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123155122.GQ2URc4f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/tsync.c:492:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   security/landlock/tsync.c:492:9: sparse:     expected struct spinlock [usertype] *_T
   security/landlock/tsync.c:492:9: sparse:     got struct spinlock [noderef] __rcu *
   security/landlock/tsync.c:515:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@
   security/landlock/tsync.c:515:9: sparse:     expected struct spinlock [usertype] *_T
   security/landlock/tsync.c:515:9: sparse:     got struct spinlock [noderef] __rcu *

vim +492 security/landlock/tsync.c

   482	
   483	/*
   484	 * try_set_current_tsync_marker - mark the current thread group as under TSYNC
   485	 *
   486	 * Returns false if another TSYNC operation, group exit, or exec is in progress.
   487	 */
   488	static bool try_set_current_tsync_marker(void)
   489	{
   490		struct signal_struct *const signal = current->signal;
   491	
 > 492		guard(spinlock_irq)(&current->sighand->siglock);
   493	
   494		/*
   495		 * Group-exit paths may replace all signal flags, including an active
   496		 * marker.  Treat SIGNAL_GROUP_EXIT as a held marker to prevent another
   497		 * TSYNC operation from starting during group teardown.
   498		 *
   499		 * Like de_thread(), also treat an ongoing exec as a group action in
   500		 * progress.  de_thread() sets group_exec_task in the same siglock
   501		 * critical section that sends SIGKILL to all other threads, including
   502		 * current.  Instead of queuing task_work for exiting threads,
   503		 * restart_syscall() lets current handle its pending SIGKILL.
   504		 */
   505		if ((signal->flags & (SIGNAL_GROUP_EXIT | SIGNAL_LANDLOCK_TSYNC)) ||
   506		    signal->group_exec_task)
   507			return false;
   508	
   509		signal->flags |= SIGNAL_LANDLOCK_TSYNC;
   510		return true;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
