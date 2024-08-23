Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC41C6F7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724445224; cv=none; b=Fh11jm0O7ksZvKso7onXHsWFRHEPQcKJi/zQZTISLlf+gZn+TTW/FjTyxPc1TTc5pBne1Wl8Q3JVMqDI4VWUcUde7GaoNLm/JGZjItq+SfXkqg2ggAkfALOVKDXsOaY72D5fCQ5jk4ckAn5b++Vmn8ePrgJzB04EciPJud5atwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724445224; c=relaxed/simple;
	bh=LopYwxx1tg/7XmUw6Jey2eKchJDf5p4JnyxyRYcrXD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lg0rr69Ctddr83Puq4IoayGM04bXQEJCrsN0T4WBzfMjuXPNUaO0vQKV+3H0sNby05wBjA3KfGno3K/OBb7rXCNpYVOdMvG4hbxWVvQoLm7qZZ6joqCaUIbzjEWFPRRQTMt/TutrvQbUTCYxtsn9tM+rGQlR6oa5xzFUgNqG8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUX2T3sa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUX2T3sa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724445222; x=1755981222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LopYwxx1tg/7XmUw6Jey2eKchJDf5p4JnyxyRYcrXD4=;
  b=ZUX2T3sa+VjS4XTyJ2HjTXz/Z/rz/PU+7DrAU+0U9jir6TeqLSGcIK2B
   3jTWUqEZwl9m76b6G6mNE0nXueEW3BAWZmJMsZ25Ev4NyJdyhjdRC5/pc
   +8HOiey6M76cXQ0v6ZYA7kCEC6+BUzAWSX+BHhsYcQsvJ0JuosqdOkMmg
   OWN74ORIgGKHWyvqfOHXRjzYIQIJd8XhcAZwkbyn8ClEKKrdPHRuD0aNe
   aST6HqL/h/TDvQ6SzP/ST7ck8uSA5kf+UojjLzP1GFFWpAdK192PPXTFt
   Gqwl9NG3CMtowfEyx2VnvRFFhCpcrl3L0mzvg/3R8Fxpx0pzx+S3I1bgW
   Q==;
X-CSE-ConnectionGUID: uDrWHN3+TCmDigidAgvY6g==
X-CSE-MsgGUID: AVOVkwWZRraU9SGrA/KRbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22744744"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="22744744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 13:33:41 -0700
X-CSE-ConnectionGUID: yeQmMtKDQnOPHwdU95HTDA==
X-CSE-MsgGUID: PU703nbKQaSsUQQhwhM/Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="66096752"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Aug 2024 13:33:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shayY-000E16-1A;
	Fri, 23 Aug 2024 20:33:38 +0000
Date: Sat, 24 Aug 2024 04:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kernel/time/tick-sched.c:212:12:
 warning: 'tick_cpu' is used uninitialized
Message-ID: <202408240419.ZDf9fwVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8da6283ef36c5c684bcfdd59631aba622c11749c
commit: a94ba5ab288780f141d741107751b4866bc24be3 [1/1] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: i386-buildonly-randconfig-003-20240823 (https://download.01.org/0day-ci/archive/20240824/202408240419.ZDf9fwVP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408240419.ZDf9fwVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240419.ZDf9fwVP-lkp@intel.com/

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
