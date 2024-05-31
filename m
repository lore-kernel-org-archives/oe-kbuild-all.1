Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3C7489
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 01:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717118557; cv=none; b=EyMe47pVpMiTccqcJumD2YZrXvYYBpoe8HVz+DamE15zEfB/K/Lc3IqVQMiEHKNbzTwfr3MpzTa9R+vuzsaPRR8jv1EnYx4zK+qAJBJCYSmTlT3Zo6zgeuYpmc63tcNhN8lilSfoBLdkQDdAqRvv9dyUBlqchRbmRv7zgfJ/rJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717118557; c=relaxed/simple;
	bh=VnNHpRzZrBLyR03ZBBRoUhv2fOQNBpllKF4FtcJ17m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtBsbgcgyado+YqzjdKGIi/oWBjaevTvjb+qzjvMyrUdBNTra/OzHTOoLiho4QeoLDPCL1iOCWj7D2zgt2R4KAln0t6mXK4NJp0p15Is2Kpe5kdV7mXBU1e9eCYk7DcWkrxO9EH4SDRnGVeI3uslsBQzxv9V6T+B+7nZLtkVFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS4evS99; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS4evS99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717118556; x=1748654556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VnNHpRzZrBLyR03ZBBRoUhv2fOQNBpllKF4FtcJ17m0=;
  b=SS4evS99hVBkhD77IMUgckbbREgHBlnvvs2I+CYgnn26ej8UuxLWLYk8
   JE0wxweg28iNNn5lOU606VF2+NqKYc4XQYdEdG6RPocAmNmwJQkugFSLT
   Scmgxow1NBJTUqZL0/Dgn6pj0VLAAFPHvqnLpBV4Sfx1nwPIo9m4sqLFn
   sqTfhPnnY225LN/+TZS+dy2tDMHLdJV5VRl9KBsiR4XXH14sAj0AKozjp
   xXC825mx0+Ff7GcYLw6FeEAi547FO4jr71wPCxfWXvtPFJmDcMC1S20eW
   GETHpTlLok76d1vgHgyCd3oFBVunlgYHPb3JNLF0e29TI0l8DMuGNuOlo
   Q==;
X-CSE-ConnectionGUID: ZLAKHyIaQ+WeJA7AFpPqsA==
X-CSE-MsgGUID: EGn3l/TsQXeHweyze5e3gA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13467929"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13467929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 18:22:20 -0700
X-CSE-ConnectionGUID: j1E0OUfnS06d8RjB+9HywA==
X-CSE-MsgGUID: VNerk86RQuOtSvoxCtS2Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40455195"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 May 2024 18:22:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCqyG-000GL3-0P;
	Fri, 31 May 2024 01:22:16 +0000
Date: Fri, 31 May 2024 09:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tick: shift tick_nohz_switch_to_nohz() from
 tick_check_oneshot_change() to hrtimer_run_queues()
Message-ID: <202405310959.9U6sUim5-lkp@intel.com>
References: <20240530124203.GA26990@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530124203.GA26990@redhat.com>

Hi Oleg,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on linus/master v6.10-rc1 next-20240529]
[cannot apply to tip/timers/nohz]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleg-Nesterov/tick-shift-tick_nohz_switch_to_nohz-from-tick_check_oneshot_change-to-hrtimer_run_queues/20240530-204940
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20240530124203.GA26990%40redhat.com
patch subject: [PATCH] tick: shift tick_nohz_switch_to_nohz() from tick_check_oneshot_change() to hrtimer_run_queues()
config: i386-buildonly-randconfig-005-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310959.9U6sUim5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310959.9U6sUim5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310959.9U6sUim5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/hrtimer.o: in function `hrtimer_run_queues':
>> hrtimer.c:(.text+0x1851): undefined reference to `tick_nohz_switch_to_nohz'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
