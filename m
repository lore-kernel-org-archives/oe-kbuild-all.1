Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3FA23771E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751945288; cv=none; b=njElfsXPKBEb1AfnJqJ3GSKR4WlqjE0jsuZR0LSVVZkHvwjkREacppPcUgsAyPuEJ1sJy1Vv6tzLNhiP1clLMIFpB1xNylBewBl5Ahs/cFsLBnangcTxPvHSY+PjJh5w+xsYYv9qW9I0C44FCj2c9Np2DRY6qjehXkhfxhFLlo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751945288; c=relaxed/simple;
	bh=qY/S05QuvfBUAsOTIkjfg2DfXMN22Dj9idGGoT44Aps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgRs4xCrpRqOmNIrxgFZPUKC8Oo/RwZwbBYAjtvwffeZYZs7isntpv3/MyBOo9pN1OwUzyVp9wEp8jsrIDKNQApguBxsbGoPXAQr+rkyEEhwvi0dmTNyobS6ngH2eVvs1qjCtQErupIoSU4fy2/l60pb5SBbHeOcf/tgRPgm74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmugHypn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmugHypn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751945287; x=1783481287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qY/S05QuvfBUAsOTIkjfg2DfXMN22Dj9idGGoT44Aps=;
  b=UmugHypnljfjlGGDuJOsUMXJQBotaoN24vAOpci5GNLH4jl7EkLtuj18
   2OlGvyzbcBD9H5sQ4qijb3teK0dF0notMCExN7Uxdaci4yBqKtTw754sz
   U/+ZncPuby4Th3X3YgVuVCwvaRQatU0aUCc31ZCWKSAqsDiGvUtv0VIQ3
   /7kOLFA4lb2fHWBbb9uti072p7oCgcEGMU7oYvpjYBmWcXg8pNgdHN3GT
   3Q+IIpHeOqL/c4XItAxiByxclMidx3fOOkweF0b0NjjS1fOfoyAygPqJN
   X6N0OhZnld2CncMNvSu/bO2DW3LkOfsBWa9mS8TdrC48kXvneH3Rmys/z
   A==;
X-CSE-ConnectionGUID: HJ1LBJWqS/itAeDR+0N30A==
X-CSE-MsgGUID: PneW6x4gR5uLEWTVuLfs0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56786085"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="56786085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 20:28:06 -0700
X-CSE-ConnectionGUID: FM7VNwSfQ8O5vjPQDcuWRA==
X-CSE-MsgGUID: INYHyrvgTk+ouwxYEeysqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="192561072"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Jul 2025 20:28:06 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYyzy-0000xP-3C;
	Tue, 08 Jul 2025 03:28:02 +0000
Date: Tue, 8 Jul 2025 11:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 kernel/locking/ww_mutex.h:294:52: warning: comparison of distinct pointer
 types ('struct mutex *' and 'struct rt_mutex *')
Message-ID: <202507081129.nrdeQHnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d704d6eeb1f202e678a2118fbdae485eab9e7945
commit: 4f9e4406e4981511e1348e4483eae7c21cd5fe24 [1/1] ANDROID: Update proxy-exec logic from v14 to v18
config: arm64-randconfig-002-20250708 (https://download.01.org/0day-ci/archive/20250708/202507081129.nrdeQHnj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507081129.nrdeQHnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507081129.nrdeQHnj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/ww_rt_mutex.c:10:
   In file included from kernel/locking/rtmutex.c:65:
>> kernel/locking/ww_mutex.h:294:52: warning: comparison of distinct pointer types ('struct mutex *' and 'struct rt_mutex *') [-Wcompare-distinct-pointer-types]
     294 |                 WARN_ON_ONCE(__get_task_blocked_on(waiter->task) != lock);
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~
   include/asm-generic/bug.h:184:41: note: expanded from macro 'WARN_ON_ONCE'
     184 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                         ^~~~~~~~~
   include/asm-generic/bug.h:171:25: note: expanded from macro 'WARN_ON'
     171 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning generated.


vim +294 kernel/locking/ww_mutex.h

   267	
   268	/*
   269	 * Wait-Die; wake a lesser waiter context (when locks held) such that it can
   270	 * die.
   271	 *
   272	 * Among waiters with context, only the first one can have other locks acquired
   273	 * already (ctx->acquired > 0), because __ww_mutex_add_waiter() and
   274	 * __ww_mutex_check_kill() wake any but the earliest context.
   275	 */
   276	static bool
   277	__ww_mutex_die(struct MUTEX *lock, struct MUTEX_WAITER *waiter,
   278		       struct ww_acquire_ctx *ww_ctx, struct wake_q_head *wake_q)
   279	{
   280		if (!ww_ctx->is_wait_die)
   281			return false;
   282	
   283		if (waiter->ww_ctx->acquired > 0 && __ww_ctx_less(waiter->ww_ctx, ww_ctx)) {
   284	#ifndef WW_RT
   285			debug_mutex_wake_waiter(lock, waiter);
   286	#endif
   287			 /* nested as we should hold current->blocked_lock already */
   288			raw_spin_lock_nested(&waiter->task->blocked_lock, SINGLE_DEPTH_NESTING);
   289			/*
   290			 * When waking up the task to die, be sure to set the
   291			 * blocked_on_state to BO_WAKING. Otherwise we can see
   292			 * circular blocked_on relationships that can't resolve.
   293			 */
 > 294			WARN_ON_ONCE(__get_task_blocked_on(waiter->task) != lock);
   295			__set_blocked_on_waking(waiter->task);
   296			raw_spin_unlock(&waiter->task->blocked_lock);
   297			wake_q_add(wake_q, waiter->task);
   298		}
   299	
   300		return true;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
