Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA9212548
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766296378; cv=none; b=nqhPjKwDFYctFqxQW/TNQkNYJXTv9bWB32r/f7a46neKy9a5yMssbXwW3H3+LRyPZ1pUYpAp/uXKtLvKOhdEsrkX9j0hdwn/n6Vqt1R+blJqd4R6z1SeHQXjMTlYWGitJsi4i1nzn4yztivKB6MNkJPFZ10UOAxAItjOi7vRjZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766296378; c=relaxed/simple;
	bh=31t0vbs5zXQFvnhYnhE0DRbSqHuGdr3/9e7XTNYOb4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmEb+sOUCuH68CZKauNAmW8ndzX4MtEFpjCb6FHiWuhPordZ7GBhnZxauJmlKxrSXlnk2I0LEweWEqHkARo1MMwZamZj6Utnc7SAcNkikBMYN4fh13lO9TBiOE0C1frGY2ZFsilQ6dhrQxQdNB/+WCvV9b1TIwUTWB1+uym7xi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1BqGqWt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1BqGqWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766296377; x=1797832377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=31t0vbs5zXQFvnhYnhE0DRbSqHuGdr3/9e7XTNYOb4E=;
  b=n1BqGqWtTRa6kk/bPcPkFyS2clzZo9AvNDo1Sui6SuU4KGnv4EZzm/GB
   mgZC49Gcc5Q9eK3ca2gHXE0L4pjAz/PMOikDZjZUXm2ekgd3BmbSrd6Of
   Rg4Siwh3onJXSVIYZJ2pbp8NJsnjocEJ24anvbiCrUQvTl2WoZpWVeE8e
   ZfU1aogkoUI4ty59N0XtFVqvIgwCRc/A/vBwgChd8fxMUaLhv7irKoH6X
   4jUbSyDIA/n0Gmo0fheKiSAI+tG9ihTbmtBm2Q3/xCTPuxCgq6zTMrVDx
   OApraFF8hnVAvQ1Z7AKF98OX2U8o/x3OoK9joAjByIroZYDpJf3apkG9O
   A==;
X-CSE-ConnectionGUID: 0T3rgD5HS8aya8WTizG1aQ==
X-CSE-MsgGUID: 2ms9eA3YQB2q2P/74NZcKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68240821"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68240821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 21:52:56 -0800
X-CSE-ConnectionGUID: U6X5XGt2R3yPLTeLTx5xsg==
X-CSE-MsgGUID: 0t1KnQotRvqnhy8rLmOZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203759881"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 21:52:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXCNA-000000004wq-3rMP;
	Sun, 21 Dec 2025 05:52:52 +0000
Date: Sun, 21 Dec 2025 06:52:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kernel/time/tick-sched.c:212:12:
 warning: 'tick_cpu' is used uninitialized
Message-ID: <202512210629.02xLGyoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   16aa689262af24cd0897f463b3d0dd9ecee6b37c
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512210629.02xLGyoN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210629.02xLGyoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210629.02xLGyoN-lkp@intel.com/

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
