Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4169226CFE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771761; cv=none; b=rXnex1ekPonQZW3KPj9jtYIBb/QTjU+ifn27WKsnK8x2DDWoFPM0Xc7MNO/53UBVTNYUZMVadczwiMeMLgV44hl+Scftqs8GbA1yA9bMuuyt5z2Z/vGUBoXKb+0H7QMKY6q3GjuqXVXxjDnFJ4ncSRS/4Dd38a4GmcF3jAqccBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771761; c=relaxed/simple;
	bh=WofjSumylFUoJ4q5SH2aE+/EGSJbUIgylep6Wgpxd94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iKDzRiPKfGAlM8uip5chaT8YejFZkCHnXFQVmzv1IZijOmwgqPoLb6GWISV2kghNUTE8eLnzDon+rjOgV5113318SjimmRJ9veEuFsGzZTLR5m2qnAukLZj1XoKKaftlSGGR2VOLbrpXHneqSuVvkbcbbuy/O1hxecTPwP5z+Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2WoO1wn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2WoO1wn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764771760; x=1796307760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WofjSumylFUoJ4q5SH2aE+/EGSJbUIgylep6Wgpxd94=;
  b=V2WoO1wn647x0g/6wjwuvZ/kwgrGHUcVmeFSmCV5reAAV6kQe5EridS9
   vKhYQokwwVVWiSHiFNQQGzPbNMQJuiu0K7oNXxPY5e26Nx6bT4mW8wXZt
   5qOvYfExaGDcVQWcqexRrCBbLe4kiK6Bj1X06JvkTx9qMdmngc/2ejXEF
   r+Exq+1IKpz+pm6pE/7H0blpx7KoGaCVlqoxexwf5ZUPgr0xwAIWbDP3i
   zntcI80MDxaq2DECjIFbRBWo/GihEsFF1U23rq6bHXQuWk5cPRpDoIaVh
   7odYpb3q9DetBn90PjU5oXePFCAhrd0lQZJ2SW39O7hsj94IVHpx4w3NG
   g==;
X-CSE-ConnectionGUID: HE+7ZNGxQnOGYQG3KmfM2w==
X-CSE-MsgGUID: 7/QsdB/1TJqUkD/b/km9ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89416478"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="89416478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 06:22:40 -0800
X-CSE-ConnectionGUID: yUz7a4SoQQ+2wrDOONBBww==
X-CSE-MsgGUID: apEtzXbpQKGyufxQZknbhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="193964780"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Dec 2025 06:22:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQnkZ-00000000B2v-1Ihc;
	Wed, 03 Dec 2025 14:22:35 +0000
Date: Wed, 3 Dec 2025 22:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <202512032230.5pqkcg8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
date:   6 weeks ago
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20251203/202512032230.5pqkcg8x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032230.5pqkcg8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032230.5pqkcg8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
>> include/linux/seqlock.h:1257:(.text+0x96a0): undefined reference to `__scoped_seqlock_bug'


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
