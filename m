Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03658345CDA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771515594; cv=none; b=Z83y9N4z9UDvHqJxG+VuEOhDJVCVUfcRAPcSgQcVwwGfFw/EvE7s62BsRJFc6oOCdgyB3+F6P25dphwjCz3sUccAzU2XfIpIvXwimg4lZO20u5K6SC+b/SqwNSdv/GhhOKOq/uAfytBdvLoZeThYf3FCqSXERYyc1iMsocFLfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771515594; c=relaxed/simple;
	bh=bfrPV8ZmeNa7d0sB05TTxr/aUSziyCeNwt29N5hek3I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hnkhgscxTmvRdyupglj26bMevXpAvWn548t1M4Tz7K7nMEy/VT0nmYdGxAxw5AiGUstcFd6xKkGoLshvBKbhatytVOLEKGAXnE0RW0TlD+GNqUlyWr2PUduB7PyozwNPV8Uo0QfuU2ib9a+W+bAL0pCnNR01UXMlq1JTSgE+TIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJr9HLBJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJr9HLBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771515591; x=1803051591;
  h=date:from:to:cc:subject:message-id;
  bh=bfrPV8ZmeNa7d0sB05TTxr/aUSziyCeNwt29N5hek3I=;
  b=eJr9HLBJwsGOY7wO6JcVMz5uSmNAgT3xT+FmMxuj6gX4z9ifzEdqzrQS
   PYH3HGJkW6271zMkcG+lpqyCNu8UoaWa1Mp84wU9Azqam6fOEul5o3xz6
   l6IV0+hSjAUUfMqBrQ+Oa8iJLSGCmOoiIBWkxJKGiPQKPfBpXaj+SYidF
   3ZpMltPQUwtm7GiswPVtgTXbh1PPT+LwwR9vZFiquJfVx29m2BhyjKyV5
   U9KfYaXxSG5dkUhf9SE/2yOGXDkjRvbn3eA4VedCgNyD1r03xtBDBdY7o
   G6xbux9qkekMtF5EQBVMvjroZGj0YdkQx/QKUT+AvYkiONGTjFivtVsnu
   A==;
X-CSE-ConnectionGUID: u1ZJavOySsmv6wpLtuZsSg==
X-CSE-MsgGUID: GggmFlJsTqC2Vt9exaqriw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="82928191"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="82928191"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 07:39:37 -0800
X-CSE-ConnectionGUID: vZFu4aYTRU+NrA2VpC3F5g==
X-CSE-MsgGUID: yU8dqIWZQR6dNqfm/G9Edg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="245141276"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 07:39:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt67q-000000013Im-1Q2M;
	Thu, 19 Feb 2026 15:39:34 +0000
Date: Thu, 19 Feb 2026 23:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <202602192356.E8iIJTI4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Oleg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
date:   4 months ago
config: s390-randconfig-r113-20260219 (https://download.01.org/0day-ci/archive/20260219/202602192356.E8iIJTI4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602192356.E8iIJTI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602192356.E8iIJTI4-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
>> include/linux/seqlock.h:1257:(.text+0x12f20): undefined reference to `__scoped_seqlock_bug'


vim +1257 include/linux/seqlock.h

cc39f3872c0865b Peter Zijlstra 2025-10-09  1251  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1252  static inline void
cc39f3872c0865b Peter Zijlstra 2025-10-09  1253  __scoped_seqlock_next(struct ss_tmp *sst, seqlock_t *lock, enum ss_state target)
cc39f3872c0865b Peter Zijlstra 2025-10-09  1254  {
cc39f3872c0865b Peter Zijlstra 2025-10-09  1255  	switch (sst->state) {
cc39f3872c0865b Peter Zijlstra 2025-10-09  1256  	case ss_done:
cc39f3872c0865b Peter Zijlstra 2025-10-09 @1257  		__scoped_seqlock_bug();
cc39f3872c0865b Peter Zijlstra 2025-10-09  1258  		return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1259  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1260  	case ss_lock:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1261  	case ss_lock_irqsave:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1262  		sst->state = ss_done;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1263  		return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1264  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1265  	case ss_lockless:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1266  		if (!read_seqretry(lock, sst->data)) {
cc39f3872c0865b Peter Zijlstra 2025-10-09  1267  			sst->state = ss_done;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1268  			return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1269  		}
cc39f3872c0865b Peter Zijlstra 2025-10-09  1270  		break;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1271  	}
cc39f3872c0865b Peter Zijlstra 2025-10-09  1272  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1273  	switch (target) {
cc39f3872c0865b Peter Zijlstra 2025-10-09  1274  	case ss_done:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1275  		__scoped_seqlock_invalid_target();
cc39f3872c0865b Peter Zijlstra 2025-10-09  1276  		return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1277  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1278  	case ss_lock:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1279  		sst->lock = &lock->lock;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1280  		spin_lock(sst->lock);
cc39f3872c0865b Peter Zijlstra 2025-10-09  1281  		sst->state = ss_lock;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1282  		return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1283  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1284  	case ss_lock_irqsave:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1285  		sst->lock_irqsave = &lock->lock;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1286  		spin_lock_irqsave(sst->lock_irqsave, sst->data);
cc39f3872c0865b Peter Zijlstra 2025-10-09  1287  		sst->state = ss_lock_irqsave;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1288  		return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1289  
cc39f3872c0865b Peter Zijlstra 2025-10-09  1290  	case ss_lockless:
cc39f3872c0865b Peter Zijlstra 2025-10-09  1291  		sst->data = read_seqbegin(lock);
cc39f3872c0865b Peter Zijlstra 2025-10-09  1292  		return;
cc39f3872c0865b Peter Zijlstra 2025-10-09  1293  	}
cc39f3872c0865b Peter Zijlstra 2025-10-09  1294  }
cc39f3872c0865b Peter Zijlstra 2025-10-09  1295  

:::::: The code at line 1257 was first introduced by commit
:::::: cc39f3872c0865bef992b713338df369554fa9e0 seqlock: Introduce scoped_seqlock_read()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
