Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1521C9E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555666; cv=none; b=NETyRg8l58ytyW4gsjvezL3rKM0VzchHZoL5tHa63gEkDSXwdgOZJfMuSnBNEfpjHM2J6cHzuKY7kCrIgffWUohfGoCaaSGXWHNB/YH+HWAPZift2SUiSjGGYaJlxQE4VibRQftW9UVQm8KaMRFF3xtcfE7gLpH9XsM2EIt5ddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555666; c=relaxed/simple;
	bh=tYhGSIaepO0976+1gT7Meabz2186CYgqiWnCgG+u2oM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfcvOkefUM0djFVrUjCWd/i976I6tpZsPjp4sMWzltyYtNCt7ksEV30Ba7jQirIIP1/ZUQqzhnhvuqqJMuuv2O+jNNZa90qP6a0mNKDtK51nK/jZx+ymBDF2gW/vxWIPFi1HaQ/6fWntw3jr2N8Nvyr7srUG1zIyS6h/tR+Bwas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRdg28/p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRdg28/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742555664; x=1774091664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYhGSIaepO0976+1gT7Meabz2186CYgqiWnCgG+u2oM=;
  b=KRdg28/pZyrhRe+vmJ/DRqywQz4gda4f6PJFd5Vjy24UMdKkzhq+KsjK
   WLoIWMVhd9lfCH1QaMjPqdVyhPPzzBsMzZyt5LqASl5tJCXHSfCxBgKLm
   aHT60DFYKigee012ytE/XuHvTkeSjghRZtDhzXCE/XpSQxbkFTGPuh6Tl
   rhmmvjj0YELydauKm9X4IHXV2DDX+qKp1l8fUXX39xKpGAsnFfNcJY0re
   CyjD/lXDN0vX7bfLTnjFPLYTvnB//5A4Bo90oj8ypAQxrbrzX7IAzqGb1
   q/+oFwRQeIWMNx+aYo25dRQCli6ihOf7MZzctWJLvwW+feV8x7d6IBHzr
   Q==;
X-CSE-ConnectionGUID: Q0wrdl/TTFu4ecm3pETaxA==
X-CSE-MsgGUID: WVTCvGOMSEeH8MGSPogOug==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43831858"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43831858"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 04:14:23 -0700
X-CSE-ConnectionGUID: 4hlW/bMpSp6kqRl/ugsDAQ==
X-CSE-MsgGUID: voXradihSh2ycxQ6Tj5QNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="128200340"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2025 04:14:23 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvaKS-0001IH-1e;
	Fri, 21 Mar 2025 11:14:20 +0000
Date: Fri, 21 Mar 2025 19:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] kernel/time/tick-sched.c:212:5:
 warning: 'tick_cpu' is used uninitialized in this function
Message-ID: <202503211920.6fVdF7n8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   613f708f68ab21b52e3d5b56ab610faf8c7aebf7
commit: a94ba5ab288780f141d741107751b4866bc24be3 [3/3] BACKPORT: timekeeping: Use READ/WRITE_ONCE() for tick_do_timer_cpu
config: arm64-randconfig-r123-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211920.6fVdF7n8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250321/202503211920.6fVdF7n8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211920.6fVdF7n8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/tick-sched.c: In function 'tick_sched_do_timer':
>> kernel/time/tick-sched.c:212:5: warning: 'tick_cpu' is used uninitialized in this function [-Wuninitialized]
     if (tick_cpu == cpu) {
        ^


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
