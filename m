Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110F34FF74
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315176; cv=none; b=EZ6SM5wKrSoJWl7ETIt7VFs/cxqM+w4wbjllADuX9C4KmL+pSuJM1se2GwucgmVViA08WvmXl2xPzqAM0bO6mSTgDrcZ9YsFWrcsd5z/KX58cafdcT0unFGwPmoj/1bsDvyi3rl22fKlQvGqAwrG55qboqJbnVD3iKfo4L2h5nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315176; c=relaxed/simple;
	bh=pIzO75vcEuHo4cMfx+V3DVPR0nRzld6mhqyg1s+8lxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HMjiGJKuKYcMcWuQ8HK9HBf3aIezowrub4ieTwQcAbI/zAZle9mTFvOsPy5GdulpP0p1uULscKACnpQcTF1fHiQI5SGqJO3t6h71Xp9dPkyMyAOvfL0FtGkLEVi0qd+RilnqZhRJaHMewfAcyTWNzzo0kC2Q5J3bPjEpOMOqF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFsK464q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFsK464q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774315175; x=1805851175;
  h=date:from:to:cc:subject:message-id;
  bh=pIzO75vcEuHo4cMfx+V3DVPR0nRzld6mhqyg1s+8lxY=;
  b=hFsK464qhLgugCrWvdHDhaJdgk2LNXNkdFuBi6jaNQGZHBghpLGZAPbf
   TogOlEMUg4NF8uSGpBOKe1owLuOmN5rSyFZC+8pygRG0NTTKMBKUWB3FG
   IaXocWixlAlaFAyyN5KwTcui6y42wia5NRxobgaqF8DCWS0cq1c/staQJ
   j0EWugrngU+/a3/kknNEZs+Rz6sDy1QTBHPadb0Khq3rVgidZYk1qf0LJ
   fdHnPZd6WtAHQwLQnTVZUgQsvQGDcDpQqFmELfqZnSxR49PWSynj8IlCD
   Mb7TZyR8M6PIWp+oWRuI0lmmxxZ7zLlHBZRwBgPluU6yVw1mKRZoQRNBs
   A==;
X-CSE-ConnectionGUID: /Rmf2OLmSHObgDHfnBPvhw==
X-CSE-MsgGUID: 4qu8+/t7Q4qdQvnE1IcBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86796932"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86796932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:19:32 -0700
X-CSE-ConnectionGUID: nTdKFe1nTpaAxppXZgNa5g==
X-CSE-MsgGUID: u/hDMaGOR7OlKz4SXXY8ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224209259"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 18:19:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qQa-000000003V1-02hL;
	Tue, 24 Mar 2026 01:19:28 +0000
Date: Tue, 24 Mar 2026 09:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/time/tick-sched.c:212:12: warning: 'tick_cpu' is used uninitialized
Message-ID: <202603240938.FzVtsLZC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: a94ba5ab288780f141d741107751b4866bc24be3 [0/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: i386-randconfig-015-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240938.FzVtsLZC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240938.FzVtsLZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240938.FzVtsLZC-lkp@intel.com/

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
