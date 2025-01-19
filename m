Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5402EB1D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 21:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737322413; cv=none; b=hx9iiAjMxJAM98460yoYD/06Xi9cwbyfrkqw02MHVkGbozO0DWiEqGfZeBAkapUXAcUS/JQqhvc/ql08eHqXz+J1ynhaHuq9lNU6Q53+cs5k7gSbj147W1Ik+E06qxaSV7A1ybHInYs5XibHFWK7aDCUWj+GEH67rZnSKYoal6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737322413; c=relaxed/simple;
	bh=ptlhVm5L56Xc726PQBKiX0ymuPgRqol8Vgv1ujs0uUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udDsT6aZv/fhGcunXbWSrpnH2phuFaz8T2u9dlWgMeyn2jKjL7ddiUOPWN8rQ9VnBkcoJzTSIibNg6bupPqBiJZSQk/t8DzcWlb5AqDTRsl1651WDU3zlvCec2HGfk9Wtu1XpWXLKTnYRePEMQHzoIsW5glL9agRN7EeMD9p2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMVN4IUZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMVN4IUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737322411; x=1768858411;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ptlhVm5L56Xc726PQBKiX0ymuPgRqol8Vgv1ujs0uUc=;
  b=eMVN4IUZQunXaJqw204XVaIjlk5aA8JFio6SSNZQaDDTXxXlzW152L1W
   GrNwVKz7v2ucY37YtuFpw19UuKtFaeAF9xrj16HiJM2RVeYZlOawLXGdf
   0jwobu41h+zBcuUipfG7kebTqcIFot8xjgor/TnqBi7oSppocaaZd8tff
   McXoFL5y0V/629M/okg0ghl2ufqeK03hoOjSDEpbh854NRRoRg6ohPcpi
   IJGqEMpO3oZwYHbWAUsdEDc7FUS/+grR+F+SdshXm9NsU7r8/50VHTCDb
   SHq1BLnrgId0WgErzpdZpEBN/iRI0q+lQPfOaMY+7/20GbHr0kxaoVcEd
   Q==;
X-CSE-ConnectionGUID: B6QdirUbQHWlANqquwEtfA==
X-CSE-MsgGUID: wdxHa2aOT+qG7hzLUoCZHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="25280537"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="25280537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 13:33:31 -0800
X-CSE-ConnectionGUID: NFrOGTOzQBWJ3dqXziqB2Q==
X-CSE-MsgGUID: goopxSyNQ4+TnywlAGAytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106856542"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jan 2025 13:33:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZcv9-000Vs7-2a;
	Sun, 19 Jan 2025 21:33:27 +0000
Date: Mon, 20 Jan 2025 05:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: drivers/gpu/drm/scheduler/sched_main.c:405: warning: Function
 parameter or struct member 'result' not described in 'drm_sched_job_done'
Message-ID: <202501200535.SBTvzNWJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9528d418de4d83c7ada69314ddd8d4427b1f703a
commit: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs
date:   1 year, 1 month ago
config: i386-randconfig-011-20240921 (https://download.01.org/0day-ci/archive/20250120/202501200535.SBTvzNWJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200535.SBTvzNWJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200535.SBTvzNWJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/sched_main.c:405: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'


vim +405 drivers/gpu/drm/scheduler/sched_main.c

f7fe64ad0f22ff Matthew Brost    2023-10-30  397  
71173e787cab9d Luben Tuikov     2020-12-03  398  /**
71173e787cab9d Luben Tuikov     2020-12-03  399   * drm_sched_job_done - complete a job
71173e787cab9d Luben Tuikov     2020-12-03  400   * @s_job: pointer to the job which is done
71173e787cab9d Luben Tuikov     2020-12-03  401   *
71173e787cab9d Luben Tuikov     2020-12-03  402   * Finish the job's fence and wake up the worker thread.
71173e787cab9d Luben Tuikov     2020-12-03  403   */
539f9ee4b52a8b Christian König  2023-04-17  404  static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
71173e787cab9d Luben Tuikov     2020-12-03 @405  {
71173e787cab9d Luben Tuikov     2020-12-03  406  	struct drm_sched_fence *s_fence = s_job->s_fence;
71173e787cab9d Luben Tuikov     2020-12-03  407  	struct drm_gpu_scheduler *sched = s_fence->sched;
71173e787cab9d Luben Tuikov     2020-12-03  408  
a78422e9dff366 Danilo Krummrich 2023-11-10  409  	atomic_sub(s_job->credits, &sched->credit_count);
f2f12eb9c32bc7 Christian König  2021-02-02  410  	atomic_dec(sched->score);
71173e787cab9d Luben Tuikov     2020-12-03  411  
71173e787cab9d Luben Tuikov     2020-12-03  412  	trace_drm_sched_process_job(s_fence);
71173e787cab9d Luben Tuikov     2020-12-03  413  
71173e787cab9d Luben Tuikov     2020-12-03  414  	dma_fence_get(&s_fence->finished);
539f9ee4b52a8b Christian König  2023-04-17  415  	drm_sched_fence_finished(s_fence, result);
71173e787cab9d Luben Tuikov     2020-12-03  416  	dma_fence_put(&s_fence->finished);
67dd1d8c9f6543 Tvrtko Ursulin   2023-11-02  417  	__drm_sched_run_free_queue(sched);
71173e787cab9d Luben Tuikov     2020-12-03  418  }
71173e787cab9d Luben Tuikov     2020-12-03  419  

:::::: The code at line 405 was first introduced by commit
:::::: 71173e787cab9db4ca1fa6229477cb3d254bc285 drm/scheduler: Essentialize the job done callback

:::::: TO: Luben Tuikov <luben.tuikov@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
