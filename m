Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A58344051
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546070; cv=none; b=BBMeLZk8hCXG3NnqxBhXLBFIRKplxOfuW/450OgI3vtGzy0Z97w65WS0SoMdJcXQNyQ0RJf/tuRiYhu6mBqZKAhj9Baywx8LjMCLaypJklITIrZfoCOCesCNDbGNHUZu+Qin0OYW4Dm8hxWhlEKF+zcKS2RDaJ0YdaKeaCZsIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546070; c=relaxed/simple;
	bh=GZKCvfN0CBjxDTVqjNnelOI3bD/3nOrij/bGe02Kfg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oOt2HX/d+S1yEfAwLtbWD9gLSPkBtwIukUe3JDrT80c2c3/BNr3pPX3qnG3KMq4xGq6OjlwW7ZoMdgMqkacuji3VhwvXGyTgE4pQUr1zWFx+3oqavo23Jgtni/1GVeD2O8PRNSFTsdmaClo3Thgdgi/snH3CQti56gNs8PLihMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSsklnHz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSsklnHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763546069; x=1795082069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZKCvfN0CBjxDTVqjNnelOI3bD/3nOrij/bGe02Kfg0=;
  b=jSsklnHzjnWXh3ODrxFHLsdzHvesyClqNWa0eHT+dpTYbVn+VuG6lRA6
   VVuf3It4Z1dDN9GUIsoWDVcsl07IcejivDhZIBqEerNE8rWndnRk+Y9Y2
   nITuuNQ0MbWRynqeNGpLnGN1UYYbb+jy9oyo36D7qRvLoQvUeATT/OLJK
   FY8KOp3LjIwX907Z8L8XgxvE4qPScLFyIk7Ghs7+K8Dw2YHlXTwqIE0v5
   nzQi3gsyVw1RRVMZssb72+D6bMNhRE0a1fzBKbfpy5lPpq7wDzzEuhkx3
   HIHQzBOLe8A4skcPb7GYvXhbqkpRdZgxuYmA1f/5VKK3UD9xYTHRd10Tf
   A==;
X-CSE-ConnectionGUID: /0ORxtzFSvSppe+84WVQrQ==
X-CSE-MsgGUID: j0FvGH6+QwmU/t0cEwbxzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75907849"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="75907849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:54:29 -0800
X-CSE-ConnectionGUID: PyMLN8W+QI+dKFPWZbZmLw==
X-CSE-MsgGUID: P/aFkCMvT46Ut9aweCqdQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="214398741"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2025 01:54:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLetN-0002gx-0Y;
	Wed, 19 Nov 2025 09:54:25 +0000
Date: Wed, 19 Nov 2025 17:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 328/328] mm/oom_kill.c:318:14: sparse:
 sparse: symbol 'bpf_oom_evaluate_task' was not declared. Should it be
 static?
Message-ID: <202511191732.oVVgcOuf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   bb0e74acaf990260e6fbe36e2fe42ec210016242
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [328/328] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: arm64-randconfig-r132-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191732.oVVgcOuf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191732.oVVgcOuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191732.oVVgcOuf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/oom_kill.c:318:14: sparse: sparse: symbol 'bpf_oom_evaluate_task' was not declared. Should it be static?
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:739:9: sparse: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
   mm/oom_kill.c:225:28: sparse: sparse: context imbalance in 'oom_badness' - unexpected unlock
   mm/oom_kill.c:435:9: sparse: sparse: context imbalance in 'dump_task' - unexpected unlock
   include/linux/rcupdate.h:739:9: sparse: sparse: context imbalance in '__oom_kill_process' - unexpected unlock
   mm/oom_kill.c:1243:20: sparse: sparse: context imbalance in '__se_sys_process_mrelease' - unexpected unlock

vim +/bpf_oom_evaluate_task +318 mm/oom_kill.c

   317	
 > 318	noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
   319	{
   320		return NO_BPF_POLICY;
   321	}
   322	ALLOW_ERROR_INJECTION(bpf_oom_evaluate_task, ERRNO);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
