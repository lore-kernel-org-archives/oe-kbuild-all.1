Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142E2E63C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 04:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746729; cv=none; b=jBVtTcuROP5pMvRuPr9FXY1b1V8PojfM/NFBQt5O7YjD+2YXn3NEYHlIDme/OyiBh0rHNE2/i1qtp1sf5AvZYbif2/13KMjrmEG1hwtgBkXDi3NUoNgqFCzRFK7FZYHIL1YI/flZ40RPrqnFYVBvuLadl4g2IJeOIGyiOW9qdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746729; c=relaxed/simple;
	bh=3n+Qx0LlSXenCsKKYdT8lCw8SbyrQwrk0/lW9oRgH4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fbkPNejo4jqzXCkD1kVYIUkQyxqCYET3C2Sgv0ljd2huSvQNkUT7JnojGg+cFANgSF8UThVHzHs/qlZFBb4Uh8xvydjPgax6lOb9K/LUUJesGCJzYjYH9jZAa18PJmM2Z2teky/ZR0+8IkE5gqnfbrPgTQpIt7qwRPcnhAVDEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pl25sDr0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pl25sDr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776746728; x=1808282728;
  h=date:from:to:cc:subject:message-id;
  bh=3n+Qx0LlSXenCsKKYdT8lCw8SbyrQwrk0/lW9oRgH4A=;
  b=Pl25sDr07WExUTP+s4zH2a16LszFY7ZiTqtx87A9XsPCkqV+VAMF+uwc
   lJ/IViFeLw4yNC8XCWJCcU/FWn2t/wXBQ69/xnASouKEKzFi3tr5A1Evo
   llwVpiBrVd19jh6BpwxrQysscY9qWD3OgtVFgtnK5F39/ctgeuPMwUWp9
   oEzti1u9/hn6lWB0cX+dm2FcofFsRUjQ5w5I3BS+GZBgRLnjrag3H9shM
   b9NKcw3+J+VsfYDcOXTAb9/fj5Z0WMTFTUNYREXH2TmkBvtB2J545jv/d
   G770GKn6HXBF+BjjpVcz6EbemEkS7iEUZGGwo+ymQEc35dC00i4Awy/EA
   g==;
X-CSE-ConnectionGUID: UH7Zom17Tx2xhnpQ6ee49w==
X-CSE-MsgGUID: F6tMmv8uRuGteQBffbmUjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77374057"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77374057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 21:45:28 -0700
X-CSE-ConnectionGUID: DJ/eUiMgRECGM7OD7I/NUA==
X-CSE-MsgGUID: cY3WnAzhQ9CHEj9Evui3Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="225437872"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Apr 2026 21:45:25 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF2zC-000000003EY-3Yd4;
	Tue, 21 Apr 2026 04:45:22 +0000
Date: Tue, 21 Apr 2026 12:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <202604211202.l5fYUuLq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4e07588e743c989499ca24d49e752c074924a9a
commit: b76f72bea2c601afec81829ea427fc0d20f83216 seqlock: Change do_task_stat() to use scoped_seqlock_read()
date:   6 months ago
config: s390-randconfig-r121-20260421 (https://download.01.org/0day-ci/archive/20260421/202604211202.l5fYUuLq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211202.l5fYUuLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b76f72bea2c6 ("seqlock: Change do_task_stat() to use scoped_seqlock_read()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211202.l5fYUuLq-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/sched/build_policy.o: in function `thread_group_cputime':
   build_policy.c:(.text+0x23958): undefined reference to `__scoped_seqlock_bug'
   s390-linux-ld: fs/proc/array.o: in function `do_task_stat.isra.0':
>> include/linux/seqlock.h:1257:(.text+0x308c): undefined reference to `__scoped_seqlock_bug'


vim +1257 include/linux/seqlock.h

cc39f3872c0865 Peter Zijlstra 2025-10-09  1251  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1252  static inline void
cc39f3872c0865 Peter Zijlstra 2025-10-09  1253  __scoped_seqlock_next(struct ss_tmp *sst, seqlock_t *lock, enum ss_state target)
cc39f3872c0865 Peter Zijlstra 2025-10-09  1254  {
cc39f3872c0865 Peter Zijlstra 2025-10-09  1255  	switch (sst->state) {
cc39f3872c0865 Peter Zijlstra 2025-10-09  1256  	case ss_done:
cc39f3872c0865 Peter Zijlstra 2025-10-09 @1257  		__scoped_seqlock_bug();
cc39f3872c0865 Peter Zijlstra 2025-10-09  1258  		return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1259  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1260  	case ss_lock:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1261  	case ss_lock_irqsave:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1262  		sst->state = ss_done;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1263  		return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1264  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1265  	case ss_lockless:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1266  		if (!read_seqretry(lock, sst->data)) {
cc39f3872c0865 Peter Zijlstra 2025-10-09  1267  			sst->state = ss_done;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1268  			return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1269  		}
cc39f3872c0865 Peter Zijlstra 2025-10-09  1270  		break;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1271  	}
cc39f3872c0865 Peter Zijlstra 2025-10-09  1272  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1273  	switch (target) {
cc39f3872c0865 Peter Zijlstra 2025-10-09  1274  	case ss_done:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1275  		__scoped_seqlock_invalid_target();
cc39f3872c0865 Peter Zijlstra 2025-10-09  1276  		return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1277  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1278  	case ss_lock:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1279  		sst->lock = &lock->lock;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1280  		spin_lock(sst->lock);
cc39f3872c0865 Peter Zijlstra 2025-10-09  1281  		sst->state = ss_lock;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1282  		return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1283  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1284  	case ss_lock_irqsave:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1285  		sst->lock_irqsave = &lock->lock;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1286  		spin_lock_irqsave(sst->lock_irqsave, sst->data);
cc39f3872c0865 Peter Zijlstra 2025-10-09  1287  		sst->state = ss_lock_irqsave;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1288  		return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1289  
cc39f3872c0865 Peter Zijlstra 2025-10-09  1290  	case ss_lockless:
cc39f3872c0865 Peter Zijlstra 2025-10-09  1291  		sst->data = read_seqbegin(lock);
cc39f3872c0865 Peter Zijlstra 2025-10-09  1292  		return;
cc39f3872c0865 Peter Zijlstra 2025-10-09  1293  	}
cc39f3872c0865 Peter Zijlstra 2025-10-09  1294  }
cc39f3872c0865 Peter Zijlstra 2025-10-09  1295  

:::::: The code at line 1257 was first introduced by commit
:::::: cc39f3872c0865bef992b713338df369554fa9e0 seqlock: Introduce scoped_seqlock_read()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
