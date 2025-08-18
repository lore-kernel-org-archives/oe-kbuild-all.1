Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35921FDD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755540038; cv=none; b=o3JmQwz+Qz/ZN57R31ScpVx6gdUDSqXkLTHZPVq6+T0NWiwkH45LwANupLefu3TZe+4q/QtnvenDorTG6eAQ1dXhkkhfsygtOQoJW8x8cTmzONuW0qF4YfpEtAuPbUmQhCCWZagZ7eSinUlYmKrrviHKoZJTNhWDfFsIhhhrF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755540038; c=relaxed/simple;
	bh=vtHpeLSyv91GnY4lKM3eJPH+QARxXc0/YET0J3RP/ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4Ja+h26Bc3tiuur58nkHcWcfcHyZnze2AMiIMiLi/JIAkqm9lmgabfKuaX8h1ZjSZD2KXbQliPQ8l2MBn3jPVuxFntdhb7s5g3nMLs7a/NLZGYYv1FgIiPdfEgrGWMDlO6Yj+Re5ILzlLmH52O785x9hP7ZJ2t3eZV/fkl63+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6iaGsJ/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6iaGsJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755540037; x=1787076037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtHpeLSyv91GnY4lKM3eJPH+QARxXc0/YET0J3RP/ZM=;
  b=k6iaGsJ/BdiNsgU/sMkgFiSXCuWLCb7fbHp6MK3J2v3wHQQgdHCPOVWN
   C4OOa96jiG5ZzethY+zKWotZlUkGg6dsrFDh+HBWx0mi7QFPa92giteNl
   9tEW3PoBEaMKWS9LDN5Moi+g3nLLe8O3KHvPO73wQEiS8vpnrb2SCxHzz
   pAqrHx+YYij5UZ9GtMl3zGMFTe1SAZt5KlB7WOHZvlzMIjRyXMvyT5cYs
   d0uoap51JTJXMMyu9QUjMepeG+lE1X/UvNYNZAFdrDj45LAXwSsy0s/kE
   /5DdznScETG5cHtbcbXDXmD6vDAswgIEO1kwQjEAAy9yKXI+n/vFciXZV
   A==;
X-CSE-ConnectionGUID: m9sF5llLQQiIJQcdSNTCAQ==
X-CSE-MsgGUID: baKwBYWiSjqxGGlo109+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="80354929"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="80354929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 11:00:36 -0700
X-CSE-ConnectionGUID: JSJ4FQu8S7WArvZn6GWePg==
X-CSE-MsgGUID: zHBFdBH3REeVN+IEAHwRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="198652659"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 18 Aug 2025 11:00:35 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo49o-00017b-1I;
	Mon, 18 Aug 2025 18:00:32 +0000
Date: Mon, 18 Aug 2025 19:59:53 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] kernel/time/tick-sched.c:212:12:
 warning: 'tick_cpu' is used uninitialized
Message-ID: <202508181937.JyjjG3lX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   41aa8cef0eb73b59dd8cb361ca0dc35521003bb1
commit: a94ba5ab288780f141d741107751b4866bc24be3 [0/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: x86_64-buildonly-randconfig-2001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181937.JyjjG3lX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181937.JyjjG3lX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181937.JyjjG3lX-lkp@intel.com/

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
