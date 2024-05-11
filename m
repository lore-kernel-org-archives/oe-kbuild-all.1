Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52910F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 00:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715389062; cv=none; b=qVev+JEDUMP70+WFFDq1moAKBYfsuXS9c3hsLodPkacSvzLwmrY4iT3MKmR4AEWTyjtFAsAaWyFv8flknKlNeohWPOv/MaGgCcX3ie2K7xQaz/iVIrYB7tXOM8we7KjW3HDojfLtyHxOx6giUQPei2fadmTpr2u8Z6il5xLrmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715389062; c=relaxed/simple;
	bh=Es4drYOOV9LoJAST66n8MJOxZkukfv579nK8EG4d/A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZzFOwcHLIMTvoSMhGVwZ6+poph8z3/pR5oX2wZarchQpgRsX8VbEb8BuRVuH/bNj2QOuM0sf8NhfNnFMPZr21ZdktPHYQdJbkE8f47cUFhWQZjVGu64Tq1NDjPX7vuuLtmg7G/Mvb4pdN0yrVMsyarIIXC4yIjOZ9ZDyz2LTv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmWe2Khk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmWe2Khk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715389061; x=1746925061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Es4drYOOV9LoJAST66n8MJOxZkukfv579nK8EG4d/A8=;
  b=ZmWe2KhkcEXYtStpC/UnzaMaMUY1aaIlK9sE5XMU7BQ0MuOs4348iGiX
   gIclfRbe4NpHswb47lvbSSn6C+b0B6tK9PKrnedQIAUvdY27p7Vd1EtcG
   oNV96JxDdLojfOkie3nvo6HfLIaHlPpYbYsjoHI+Qil6hBFNiO1caSlQS
   tTmHDYfyAIfbpGnrZhkg6SUcBBKhLUKHOBfH8h5PdxXJJllsde2rl9ouQ
   vqLjt9KI4jUimYMCSufe/En2+/UfJ6CmIwOXnKBnjN3D327hAW+674Sn/
   05CBQTVnjXf+ywF2RsHKBH8S0YdPT7/Mh0WbxyFSxCOnIji3C9XjlaiFc
   A==;
X-CSE-ConnectionGUID: OtuLF0X7RliPvSRvcl58cw==
X-CSE-MsgGUID: BECtCvtzR0GqgJ7lgf0QxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11331953"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11331953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 17:57:40 -0700
X-CSE-ConnectionGUID: wkLDQKBiTpubJHe49Q8C4Q==
X-CSE-MsgGUID: 3Yw43eehQPGXXw03qbJFDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="29634596"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 May 2024 17:57:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5b3Q-0006kf-2N;
	Sat, 11 May 2024 00:57:36 +0000
Date: Sat, 11 May 2024 08:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/9] kernel/sched/deadline.c:1543:6:
 warning: no previous prototype for 'dl_server_freeze'
Message-ID: <202405110832.q74GACnl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   a9b51c2494133c012e34a050191e3954b5109747
commit: 16d0ae5e68d0f8b9e3749021fd3599d88b72fc6c [8/9] CHROMIUM: sched/dlserver: Freeze dlserver on system suspend.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240511/202405110832.q74GACnl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110832.q74GACnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110832.q74GACnl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/deadline.c:1543:6: warning: no previous prototype for 'dl_server_freeze' [-Wmissing-prototypes]
    1543 | void dl_server_freeze(struct sched_dl_entity *dl_se)
         |      ^~~~~~~~~~~~~~~~
>> kernel/sched/deadline.c:1552:6: warning: no previous prototype for 'dl_server_thaw' [-Wmissing-prototypes]
    1552 | void dl_server_thaw(struct sched_dl_entity *dl_se)
         |      ^~~~~~~~~~~~~~
   kernel/sched/deadline.c:1372:1: warning: 'update_stats_dequeue_dl' declared 'static' but never defined [-Wunused-function]
    1372 | update_stats_dequeue_dl(struct dl_rq *dl_rq, struct sched_dl_entity *dl_se,
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +/dl_server_freeze +1543 kernel/sched/deadline.c

  1542	
> 1543	void dl_server_freeze(struct sched_dl_entity *dl_se)
  1544	{
  1545		if (dl_se->dl_server_active) {
  1546			update_rq_clock(dl_se->rq);
  1547			__dl_server_stop(dl_se);
  1548		}
  1549		dl_se->dl_server_frozen = 1;
  1550	}
  1551	
> 1552	void dl_server_thaw(struct sched_dl_entity *dl_se)
  1553	{
  1554		if (dl_se->dl_server_active) {
  1555			update_rq_clock(dl_se->rq);
  1556			__dl_server_start(dl_se);
  1557		}
  1558		dl_se->dl_server_frozen = 0;
  1559	}
  1560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
