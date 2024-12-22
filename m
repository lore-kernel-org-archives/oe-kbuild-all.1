Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC3187872
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734866456; cv=none; b=CoGftD2aSj0rZJfdd8uSYJmjDyclXTHXaSBCk/D93CKZI3GwHPLarbl7igvK18988uk0SatCoI85ugYbhuZsbm9FruHO4EMKohu2Ndw0zD1lfohPKGa1EkaYzehwBWJOSeydl1HWNRLwx+eHwMR9maoMcYYyBHZveLV1EpTcrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734866456; c=relaxed/simple;
	bh=8nrheYwVHCgj0whvqPkXGbIIurmqL6VdRPWHvWCmztI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOeOxXKV+IH8boIU8ECCP4n6vHG7StDWOBMRErG0r02/3+Ek6snI52i1GLBHpwmM/y2AWnb7EwjNKyGKnMuYbMFgE/E7imRhHZsdiPeqUVhF2dLs5j/W/wQX3eQTlo9BKuLZoOgx+dO4/g9VPr9C0c8WL/6p9o/QFDqEj516ecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5yJhDvf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5yJhDvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734866455; x=1766402455;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8nrheYwVHCgj0whvqPkXGbIIurmqL6VdRPWHvWCmztI=;
  b=k5yJhDvfloKWqdRM+Uw/jGLUh6U58WCs+qOzEDMLF1euBvaU8h1BnKwV
   IM7f0DlWreiN1mCQyK79DxZLvDy1RSL5UndsgCbz0yjbhnCoRcDNmo/bd
   Y7NFLuQCtZRoVsM1H6KTV4jYYKStjh2+8eyoEV6NXS/t0TNtaLaXTBBo9
   408dBNbsB2fMsHMhqzXpTn97XQNFoI4V6bABGXBeSdtS1P/AiyrX1WLHC
   1tcOTJjL7c8m7oWCSdytuj9/TIFywm74Ol4pLfWPmxiY0YOeOy3CdSyn3
   QhN+RulcfI69um0XQsuihSxYwDwtPnyVfmLvCLl+wI8OONB//q1v2Mk4n
   g==;
X-CSE-ConnectionGUID: nnFhoA9wTi242Hqv2gggDA==
X-CSE-MsgGUID: JMFDIeCASP2DNB9gfuRbeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="57823680"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="57823680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 03:20:55 -0800
X-CSE-ConnectionGUID: rNmtFSH+Q1iMsMfcsPZP9w==
X-CSE-MsgGUID: +EfWsPJ+QsWHezdZr9fLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122228768"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2024 03:20:52 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPK0w-0002tA-1x;
	Sun, 22 Dec 2024 11:20:50 +0000
Date: Sun, 22 Dec 2024 19:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luben Tuikov <luben.tuikov@amd.com>
Subject: drivers/gpu/drm/scheduler/sched_main.c:266: warning: Function
 parameter or struct member 'result' not described in 'drm_sched_job_done'
Message-ID: <202412221935.0THpOhd5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 539f9ee4b52a8bec95ff064e22dd2fb1e258e818 drm/scheduler: properly forward fence errors
date:   1 year, 8 months ago
config: nios2-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241222/202412221935.0THpOhd5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221935.0THpOhd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221935.0THpOhd5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/sched_main.c:266: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'


vim +266 drivers/gpu/drm/scheduler/sched_main.c

08fb97de03aa22 Andrey Grodzovsky 2022-09-30  258  
71173e787cab9d Luben Tuikov      2020-12-03  259  /**
71173e787cab9d Luben Tuikov      2020-12-03  260   * drm_sched_job_done - complete a job
71173e787cab9d Luben Tuikov      2020-12-03  261   * @s_job: pointer to the job which is done
71173e787cab9d Luben Tuikov      2020-12-03  262   *
71173e787cab9d Luben Tuikov      2020-12-03  263   * Finish the job's fence and wake up the worker thread.
71173e787cab9d Luben Tuikov      2020-12-03  264   */
539f9ee4b52a8b Christian König   2023-04-17  265  static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
71173e787cab9d Luben Tuikov      2020-12-03 @266  {
71173e787cab9d Luben Tuikov      2020-12-03  267  	struct drm_sched_fence *s_fence = s_job->s_fence;
71173e787cab9d Luben Tuikov      2020-12-03  268  	struct drm_gpu_scheduler *sched = s_fence->sched;
71173e787cab9d Luben Tuikov      2020-12-03  269  
71173e787cab9d Luben Tuikov      2020-12-03  270  	atomic_dec(&sched->hw_rq_count);
f2f12eb9c32bc7 Christian König   2021-02-02  271  	atomic_dec(sched->score);
71173e787cab9d Luben Tuikov      2020-12-03  272  
71173e787cab9d Luben Tuikov      2020-12-03  273  	trace_drm_sched_process_job(s_fence);
71173e787cab9d Luben Tuikov      2020-12-03  274  
71173e787cab9d Luben Tuikov      2020-12-03  275  	dma_fence_get(&s_fence->finished);
539f9ee4b52a8b Christian König   2023-04-17  276  	drm_sched_fence_finished(s_fence, result);
71173e787cab9d Luben Tuikov      2020-12-03  277  	dma_fence_put(&s_fence->finished);
71173e787cab9d Luben Tuikov      2020-12-03  278  	wake_up_interruptible(&sched->wake_up_worker);
71173e787cab9d Luben Tuikov      2020-12-03  279  }
71173e787cab9d Luben Tuikov      2020-12-03  280  

:::::: The code at line 266 was first introduced by commit
:::::: 71173e787cab9db4ca1fa6229477cb3d254bc285 drm/scheduler: Essentialize the job done callback

:::::: TO: Luben Tuikov <luben.tuikov@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
