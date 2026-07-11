Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30032DB7BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 20:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803172; cv=none; b=kmFdLxE3XM6UCh6yttyrsw+l9Pl+O0goJYV/UkSbAC1l+msBvNn5991RJt5xipCzRqiZWJn18P2T35WI4DBxV4VEO2lp6xIipHhk/JF+01vc8j3x/F+qVZRDpPrrTShxDHysZ4WuOy7bJI1ZlvHdPd7GBoXFbvr1U3u20aZfU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803172; c=relaxed/simple;
	bh=mXThV1Lw/xWUNFnrTf+XI1QJjEQe60+4Drfgz3j56PQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=njE9o9B0QlPsYjroqeFR1nk2beiU1TcXtMeli/7GNzOidnOg7TjpPJ9rjLXvsVSzyW9aDGYxleT9pnZPfymreeP4mS1TzR1g6i5ezrE5nq+70PnrYjsSKMPQr0f4uwLrNqTUYnCj3OhzMJqmYPr8zMJ5zbkr7WX5K+6p9GwHqTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deNC36Ta; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deNC36Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783803170; x=1815339170;
  h=date:from:to:cc:subject:message-id;
  bh=mXThV1Lw/xWUNFnrTf+XI1QJjEQe60+4Drfgz3j56PQ=;
  b=deNC36Tajgewp8s7Pd7mVB5zfrXJSMzIZ4uiNVrGeDAjIUnECT2HWw9o
   /potM6+a/j55OFvEHuPZ0JGcv341/ZA07xU3SlzkTHsf7c30WzksyUJ3z
   JyOnDS7QBdZoX4kvwN0dG10cuzgGZtvWZvTIScgzylCbwvF+fGUdz9zEw
   BWLx8Gvof46J9dVbj7eRzOt8upIXJChwT3pVfxhIIvDdwvLnQ1DtNam+k
   l9PX8KjZPiCH+CglIEOhHqpYAtRfdY1JYY0DCUR3TOqo16WkqpHCQTM9q
   2U/IhGXFHzGMrjYDs5Ov5kpzUdSPlwzhXHde2XKtpleTpiZxFRu8m9nzu
   A==;
X-CSE-ConnectionGUID: rRH8HaqGTF6BkwIZ3sC9kA==
X-CSE-MsgGUID: tlUXucDcRvuu1TVqu4h0Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88155599"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88155599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 13:52:50 -0700
X-CSE-ConnectionGUID: 1Ob6Gi6xSJCd5r9Nl+P7dg==
X-CSE-MsgGUID: +uYqqMvtTPShV0xmsO5/GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259058008"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2026 13:52:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiegn-00000000KNy-2Npy;
	Sat, 11 Jul 2026 20:52:45 +0000
Date: Sun, 12 Jul 2026 04:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-01 1/1]
 kernel/time/tick-sched.c:212:12: warning: 'tick_cpu' is used uninitialized
Message-ID: <202607120414.jw7PeLo2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   ef3981c98298123ce7d52b6e12707f16d9f5d254
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: i386-buildonly-randconfig-006-20260708 (https://download.01.org/0day-ci/archive/20260712/202607120414.jw7PeLo2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120414.jw7PeLo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120414.jw7PeLo2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/tick-sched.c: In function 'tick_sched_do_timer':
>> kernel/time/tick-sched.c:212:12: warning: 'tick_cpu' is used uninitialized [-Wuninitialized]
     212 |         if (tick_cpu == cpu) {
         |            ^
   kernel/time/tick-sched.c:188:13: note: 'tick_cpu' was declared here
     188 |         int tick_cpu, cpu = smp_processor_id();
         |             ^~~~~~~~


vim +/tick_cpu +212 kernel/time/tick-sched.c

   210	
   211		/* Check, if the jiffies need an update */
 > 212		if (tick_cpu == cpu) {
   213			tick_do_update_jiffies64(now);
   214			trace_android_vh_jiffies_update(NULL);
   215		}
   216	
   217		/*
   218		 * If jiffies update stalled for too long (timekeeper in stop_machine()
   219		 * or VMEXIT'ed for several msecs), force an update.
   220		 */
   221		if (ts->last_tick_jiffies != jiffies) {
   222			ts->stalled_jiffies = 0;
   223			ts->last_tick_jiffies = READ_ONCE(jiffies);
   224		} else {
   225			if (++ts->stalled_jiffies == MAX_STALLED_JIFFIES) {
   226				tick_do_update_jiffies64(now);
   227				ts->stalled_jiffies = 0;
   228				ts->last_tick_jiffies = READ_ONCE(jiffies);
   229			}
   230		}
   231	
   232		if (ts->inidle)
   233			ts->got_idle_tick = 1;
   234	}
   235	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
