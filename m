Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C22FE566
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 01:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769650378; cv=none; b=XlW1cR3m24kH1KrfAQaJoaJAfoh3OPwjSwRjh/zKP9aAW+eUbl3P77C9nDsQCIyJxJAOLe+tVgJsWCPEVEbqRXba7Wq5UfcieUuqxLQNCTZilCZvxFfbpFPsbndh1FQbWge2ia3h5d3PVTvQfsjQ1oEG4LjX/2Nx4jQjTiyqf4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769650378; c=relaxed/simple;
	bh=ObcMj4lUWNcYGP3us00nHDWPFEHEnYgcB3eAt5WcayM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h/KYF8WkB2jtxVQcj4GajtPvOEL4iX86icpvirzBoDvnQocMbjPlgxam3l2FFKvBMrXHPFhLV/atzGE5HnQt6hbjgmlip0jDCdtbICFyMGE9KAJGnRO5djqmQy64DHdjojv8AabGJKJ/GOMSFmZCULwL7H4apvSmravLOcsYquU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy+yEzhU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy+yEzhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769650377; x=1801186377;
  h=date:from:to:cc:subject:message-id;
  bh=ObcMj4lUWNcYGP3us00nHDWPFEHEnYgcB3eAt5WcayM=;
  b=Zy+yEzhUoCyD0hVQJ/xbO9kaPN2H3ec1Pd20k4mvJ3uyMHK2XyzK2eIW
   qUgZKoTnUQQlWb9IiBBfUux0xJl5Sa6HfOxilI6pwz8sqdTOoQgT0oS5O
   xZN0sTaFTPLKRIC9X1k2WeLV465NS9AX0ffH7sG0RO40QBuT847xCWPDc
   DMIgzAfKUCpV5Xt6l0aWCw+FpOOmZphHbNWrnjsBIlhB2dwVrmzH2E/oz
   zqWVdQ6aauDWzYqqyX4bg03bDZvmj031WJqTEzpSI78OiDKaGIIwLU+Gs
   /0KLagiIveUj+1ChDl53+JlvWkuHJquw7l6AClO/Uu8/QGzwcNdxgFeSN
   A==;
X-CSE-ConnectionGUID: jLlvf/AZREWgxfSnL5E7+A==
X-CSE-MsgGUID: VAPfSPkGR/C1ftuAnc8omg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70851628"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70851628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 17:32:57 -0800
X-CSE-ConnectionGUID: o3Mw/nb5TieBileOGFW3CQ==
X-CSE-MsgGUID: IIlDaWuMRIenf4vNnFhRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="231356543"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2026 17:32:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlGtv-00000000axI-2ToZ;
	Thu, 29 Jan 2026 01:32:51 +0000
Date: Thu, 29 Jan 2026 09:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <202601290910.uwScjRjc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Oleg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
date:   3 months ago
config: s390-randconfig-002-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290910.uwScjRjc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290910.uwScjRjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290910.uwScjRjc-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
>> include/linux/seqlock.h:1257:(.text+0x3ee04): undefined reference to `__scoped_seqlock_bug'


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
