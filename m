Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D01818C932
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 23:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353608; cv=none; b=f/jgKSlNDPA1186m39HBxrFCi+OMbwr6Cz/TT4Lp4C6qxlRh6BUNKgqTbFeqojyNIJUDIHjZd1H03vPRUMHgJur933UnmqqR4Q17kfEWVSQwg5VsKBi+gGMsnA3stJhXaMeRahZNHW1yMYga5TXRAIErFMzFS7LJbzsFsVhyol4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353608; c=relaxed/simple;
	bh=koiMz0fDKOuLidEAQ+nga/7v6Z9afTyRlbvi6ygh4s0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Shf4+J9vOJeLLyyb7Tl78Fw8Pw5w/4+vdP3ZVtXyzZoc1bEpRRbvmGriC8+m9HXrj15l6MeebKDQNQL+UMSZ1HxWRzutIp9/2Bmv3sLh95Oe+X20bCzU1JLh1wYN1fvVcy6RpC8Cx+e6KPdvmX2fQd4sxpxxEtvHbYG72wwbMWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8jz6Tjg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8jz6Tjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733353606; x=1764889606;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=koiMz0fDKOuLidEAQ+nga/7v6Z9afTyRlbvi6ygh4s0=;
  b=S8jz6TjgDwy3caNz47gwLGACbEJeH190some4dqu9thsXnMPIn12ZdHq
   xP85pBsSI1iqjOGACCb92ZnVi+wWuy6KbequKY+r4a3TwhpOfDrIuPZFi
   hNlIP5yZeT2aMCni2lQ2CLNFsKGQZF+Gg1TYdtr/qluAlM7YtNnKsSFTb
   QMQbDrHLXgP7CFkeGBkz1mlmRnSNPL5ZEBc2C0SAmDULE77+zlJq0cYd/
   SFCKT1bwRdxOc2pvp9aL5L0rjcDDjLuGSfmqUoqC6YEMssopQrcR7sfJj
   jrI3Wjl/atZedozOduMqG/JxjIuoDRdrm6WAYTzzVglgENLA22X/0d/U8
   g==;
X-CSE-ConnectionGUID: G0ZgyyXWSnqtbULf6puOGw==
X-CSE-MsgGUID: 1JSdvJL6QsKHK0LiQKsP3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51179859"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="51179859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 15:06:45 -0800
X-CSE-ConnectionGUID: ve+y8JwUQa2cNcIFf7o9hg==
X-CSE-MsgGUID: Wje+ANa6RwqdKZ0DTdRRQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94095520"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 15:06:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIyS9-0003Zp-2s;
	Wed, 04 Dec 2024 23:06:41 +0000
Date: Thu, 5 Dec 2024 07:05:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.1/linux 1776/2351]
 drivers/gpu/drm/scheduler/sched_main.c:266: warning: Function parameter or
 member 'result' not described in 'drm_sched_job_done'
Message-ID: <202412050610.5yq98yia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   04072584e676a7bd8bd14677b7b87274efc36169
commit: 02c166feebf49d024a257a35ad691c5d151d97a1 [1776/2351] drm/scheduler: properly forward fence errors
config: i386-buildonly-randconfig-004-20240107 (https://download.01.org/0day-ci/archive/20241205/202412050610.5yq98yia-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050610.5yq98yia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050610.5yq98yia-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/sched_main.c:266: warning: Function parameter or member 'result' not described in 'drm_sched_job_done'


vim +266 drivers/gpu/drm/scheduler/sched_main.c

1eab8e81978ea36 Andrey Grodzovsky 2022-09-30  258  
71173e787cab9db Luben Tuikov      2020-12-03  259  /**
71173e787cab9db Luben Tuikov      2020-12-03  260   * drm_sched_job_done - complete a job
71173e787cab9db Luben Tuikov      2020-12-03  261   * @s_job: pointer to the job which is done
71173e787cab9db Luben Tuikov      2020-12-03  262   *
71173e787cab9db Luben Tuikov      2020-12-03  263   * Finish the job's fence and wake up the worker thread.
71173e787cab9db Luben Tuikov      2020-12-03  264   */
02c166feebf49d0 Christian König   2023-04-17  265  static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
71173e787cab9db Luben Tuikov      2020-12-03 @266  {
71173e787cab9db Luben Tuikov      2020-12-03  267  	struct drm_sched_fence *s_fence = s_job->s_fence;
71173e787cab9db Luben Tuikov      2020-12-03  268  	struct drm_gpu_scheduler *sched = s_fence->sched;
71173e787cab9db Luben Tuikov      2020-12-03  269  
71173e787cab9db Luben Tuikov      2020-12-03  270  	atomic_dec(&sched->hw_rq_count);
f2f12eb9c32bc7a Christian König   2021-02-02  271  	atomic_dec(sched->score);
71173e787cab9db Luben Tuikov      2020-12-03  272  
71173e787cab9db Luben Tuikov      2020-12-03  273  	trace_drm_sched_process_job(s_fence);
71173e787cab9db Luben Tuikov      2020-12-03  274  
71173e787cab9db Luben Tuikov      2020-12-03  275  	dma_fence_get(&s_fence->finished);
02c166feebf49d0 Christian König   2023-04-17  276  	drm_sched_fence_finished(s_fence, result);
71173e787cab9db Luben Tuikov      2020-12-03  277  	dma_fence_put(&s_fence->finished);
71173e787cab9db Luben Tuikov      2020-12-03  278  	wake_up_interruptible(&sched->wake_up_worker);
71173e787cab9db Luben Tuikov      2020-12-03  279  }
71173e787cab9db Luben Tuikov      2020-12-03  280  

:::::: The code at line 266 was first introduced by commit
:::::: 71173e787cab9db4ca1fa6229477cb3d254bc285 drm/scheduler: Essentialize the job done callback

:::::: TO: Luben Tuikov <luben.tuikov@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
