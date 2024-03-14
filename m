Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE55C600
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 07:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710400715; cv=none; b=MuofsztIMagfEfUPfbGE5cwLDOeYVlUSD10KN+N8sUkvPNxhIjCLZRY2PZARd8gvgxZFKnpNgQnehEoUAO8z5tuvJXcZ1trEGdKXbK6DxX373LaIXwYseydmBMQRn6yf3S8QFbT/f2h+6a//zdWHPHkf+7qBzZt/6Q1ZLacVcEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710400715; c=relaxed/simple;
	bh=6Kli6OQIw6MswoMY8Emq7srAFQHdH5yC33All3SJQ0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KkHm90UsI4y/CxGsKsJ39c+IFmB/GsLAVNw/c/OpuCcYehl+CrlBfR2MwJERODxNO8ll8avVakvKmAcCeq8FNnqb80YgIBZn1Cw3UwB9pP4MRRQq0xU0PkQApgHZVQEQnzKXwg6sKCSvIP5aDlkgNIs1qt7M7g2oJaO2NaJyUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ5vIkFN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ5vIkFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710400712; x=1741936712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Kli6OQIw6MswoMY8Emq7srAFQHdH5yC33All3SJQ0Y=;
  b=QQ5vIkFNBNDips+XaE3GSmyIEeQfsajedzoPs7ZmAjImHSLUN9sgeRKo
   jk3v9wunuz3r3OTUCVKmUZbjX3FLqdobMzQIJT97C2dlsYBdcLSMBO77w
   iUh+//MrCm+sSX3xkF4QbsIijp4Ybztm6Tz5/YDqq1xsYGc8eP/+VS3ya
   +M02JOZFANENCk3MmObzWZL7DL/gIs/4LxC5qsdu59ZeqAFjT7S0J+/QT
   Qr1VynWLC6xoW2NGHn/gKv8M+n1gZ3mpU4LvJrzugDtRfWHJagvWHF98g
   m/7jsHDnx/VqLRFd8CFkO7k4LAIgeKA7uZPPf6/Aqi4VqzP72QIVQAJCv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5387344"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5387344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 00:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="49630684"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Mar 2024 00:18:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkfM2-000DCh-17;
	Thu, 14 Mar 2024 07:18:18 +0000
Date: Thu, 14 Mar 2024 15:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 130/29558]
 kernel/locking/rtmutex.c:1577: warning: Excess function parameter
 'detect_deadlock' description in 'rt_mutex_lock_killable'
Message-ID: <202403141532.DLt02tVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: dfdcd02984581457ceb0d24a24deea67eba7e65f [130/29558] rtmutex: Add rtmutex_lock_killable()
config: arc-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240314/202403141532.DLt02tVV-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141532.DLt02tVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141532.DLt02tVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/rtmutex.c:1577: warning: Excess function parameter 'detect_deadlock' description in 'rt_mutex_lock_killable'
   kernel/locking/rtmutex.c:1663: warning: Function parameter or member 'lock' not described in '__rt_mutex_futex_unlock'
   kernel/locking/rtmutex.c:1663: warning: Function parameter or member 'wake_q' not described in '__rt_mutex_futex_unlock'
   kernel/locking/rtmutex.c:1726: warning: Function parameter or member 'name' not described in '__rt_mutex_init'
   kernel/locking/rtmutex.c:1726: warning: Function parameter or member 'key' not described in '__rt_mutex_init'
   kernel/locking/rtmutex.c:1772: warning: Function parameter or member 'proxy_owner' not described in 'rt_mutex_proxy_unlock'


vim +1577 kernel/locking/rtmutex.c

  1564	
  1565	/**
  1566	 * rt_mutex_lock_killable - lock a rt_mutex killable
  1567	 *
  1568	 * @lock:              the rt_mutex to be locked
  1569	 * @detect_deadlock:   deadlock detection on/off
  1570	 *
  1571	 * Returns:
  1572	 *  0          on success
  1573	 * -EINTR      when interrupted by a signal
  1574	 * -EDEADLK    when the lock would deadlock (when deadlock detection is on)
  1575	 */
  1576	int __sched rt_mutex_lock_killable(struct rt_mutex *lock)
> 1577	{
  1578		might_sleep();
  1579	
  1580		return rt_mutex_fastlock(lock, TASK_KILLABLE, rt_mutex_slowlock);
  1581	}
  1582	EXPORT_SYMBOL_GPL(rt_mutex_lock_killable);
  1583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
