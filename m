Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7122A44C7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725002047; cv=none; b=PU8kCjiTrTI/LY/5jixPfi+I0/ucn62QFP6NaDYZNXQg8RcdAbpDjKWXdbBoNpii6eR4pfFr8QxmxMhHRSWe0h+n8l//ox3JNJDgLRmF/mhYCPamcou9qbsfzFkDskd6k08zPzaCyMlbFemZpezPEuSU2gJV7KG48oRJhaVABdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725002047; c=relaxed/simple;
	bh=SiYY2LmBxN7f6gPVQgVlfMW8qnmpulvkHh8xDJatFC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cizdi3l4V9rT411FBZ2kpjeRJWUcXms8ftnyE647yW3WQBJ2XbhVBfZlrUzEVCFSOMyGrcnBdn2k2QMmkVDdyZdR7WAYsFB5tyfDvRQvslrvN9FX4MGDlGKkAeXg/EFs3Gkcazn1ZPzcNKdlfJTowZpgLuAjMQ8fGfT+31CUIRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNxEzNw6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNxEzNw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725002046; x=1756538046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SiYY2LmBxN7f6gPVQgVlfMW8qnmpulvkHh8xDJatFC8=;
  b=KNxEzNw6jXVBChfByLwh7gxJPDm3wGQKwoZO3xQXMsUJpSecBGkTaxHO
   z9XPC/m81zN2cd+dJp+ZvREp+lQ6CvnbdccXBmwYpTQaklzSdKHvNPKTY
   n/ZrOnnr7xoHySzClS6VrJgDjAGzcee4DyBB67TSsb7d9C7F1NxT3nrPN
   XjAERRWMCfo6lDBMtzgfRMNRzD1o1GnzuALfYWi3US1JYdEMXGNOXu6UY
   VeCIO7Lra6TAmsYbl+jZjMdelFilDvjv46XhtqQ02w1AOvBr/xAo5m0O6
   xD+DkNtAnJlm+I77TDwhvLammtguUgo2J+1A48gTARXiUNoJl4E6bLjjz
   A==;
X-CSE-ConnectionGUID: ONFpSEQhSmSRzs9GNX3cWg==
X-CSE-MsgGUID: kjF8MDe3TLKvc8x0zqv0gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23429774"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23429774"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 00:14:00 -0700
X-CSE-ConnectionGUID: zlOBTtqCTCGbFR4zZ8qE7w==
X-CSE-MsgGUID: CSRzS20NQJCavK+6zYq9nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64172588"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Aug 2024 00:13:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjvpT-0001Bj-0k;
	Fri, 30 Aug 2024 07:13:55 +0000
Date: Fri, 30 Aug 2024 15:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	ltuikov89@gmail.com
Subject: Re: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
Message-ID: <202408301500.GD1SE900-lkp@intel.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240826]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.11-rc5 v6.11-rc4 v6.11-rc3 v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-give-examples-of-error-codes-to-use/20240826-202848
base:   next-20240826
patch link:    https://lore.kernel.org/r/20240826122541.85663-1-christian.koenig%40amd.com
patch subject: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240830/202408301500.GD1SE900-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301500.GD1SE900-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301500.GD1SE900-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c: In function 'amdgpu_job_timedout':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:90:33: error: too few arguments to function 'drm_sched_start'
      90 |                                 drm_sched_start(&ring->sched);
         |                                 ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h:28,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h:29,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:43,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_job.c:30:
   include/drm/gpu_scheduler.h:582:6: note: declared here
     582 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
         |      ^~~~~~~~~~~~~~~
--
   drivers/gpu/drm/panthor/panthor_sched.c: In function 'queue_start':
>> drivers/gpu/drm/panthor/panthor_sched.c:2541:9: error: too few arguments to function 'drm_sched_start'
    2541 |         drm_sched_start(&queue->scheduler);
         |         ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/panthor/panthor_sched.c:8:
   include/drm/gpu_scheduler.h:582:6: note: declared here
     582 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
         |      ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/drm_sched_start +90 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

c1b69ed0c62f9d8 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c Chunming Zhou     2015-07-21   33  
a6a1f036c74e3d2 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Luben Tuikov      2021-01-20   34  static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
0de2479c953ae07 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Monk Liu          2016-03-04   35  {
3320b8d2acd3d48 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-07-13   36  	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
3320b8d2acd3d48 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-07-13   37  	struct amdgpu_job *job = to_amdgpu_job(s_job);
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   38  	struct amdgpu_task_info *ti;
95a2f917387a23c drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Yintian Tao       2020-04-07   39  	struct amdgpu_device *adev = ring->adev;
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   40  	int idx;
7258fa31eabd882 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Surbhi Kakarya    2022-01-26   41  	int r;
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   42  
c58a863b1ccf638 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Guchun Chen       2021-10-08   43  	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
7d570f56f1e1005 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-07-08   44  		dev_info(adev->dev, "%s - device unplugged skipping recovery on scheduler:%s",
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   45  			 __func__, s_job->sched->name);
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   46  
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   47  		/* Effectively the job is aborted as the device is gone */
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   48  		return DRM_GPU_SCHED_STAT_ENODEV;
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   49  	}
0346bfd9fe5ade3 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Trigger Huang     2018-12-18   50  
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   51  
194eb174cbe4fe2 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Victor Zhao       2022-06-24   52  	adev->job_hang = true;
0e51a772e2014db drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2016-05-18   53  
cc063ea2ec7cc09 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Marek Olšák       2020-07-06   54  	if (amdgpu_gpu_recovery &&
cc063ea2ec7cc09 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Marek Olšák       2020-07-06   55  	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
7d570f56f1e1005 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-07-08   56  		dev_err(adev->dev, "ring %s timeout, but soft recovered\n",
7876fa4f55fda4a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-08-21   57  			s_job->sched->name);
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12   58  		goto exit;
7876fa4f55fda4a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-08-21   59  	}
7876fa4f55fda4a drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-08-21   60  
7d570f56f1e1005 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-07-08   61  	dev_err(adev->dev, "ring %s timeout, signaled seq=%u, emitted seq=%u\n",
3320b8d2acd3d48 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-07-13   62  		job->base.sched->name, atomic_read(&ring->fence_drv.last_seq),
3320b8d2acd3d48 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Christian König   2018-07-13   63  		ring->fence_drv.sync_seq);
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   64  
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   65  	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   66  	if (ti) {
7d570f56f1e1005 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-07-08   67  		dev_err(adev->dev,
7d570f56f1e1005 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-07-08   68  			"Process information: process %s pid %d thread %s pid %d\n",
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   69  			ti->process_name, ti->tgid, ti->task_name, ti->pid);
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   70  		amdgpu_vm_put_task_info(ti);
b8f67b9ddf4f8fe drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Shashank Sharma   2024-01-18   71  	}
4fbf87e2fe47211 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Monk Liu          2017-05-05   72  
7a66ad6c087ee38 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   ZhenGuo Yin       2023-05-09   73  	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
7a66ad6c087ee38 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   ZhenGuo Yin       2023-05-09   74  
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   75  	/* attempt a per ring reset */
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   76  	if (amdgpu_gpu_recovery &&
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   77  	    ring->funcs->reset) {
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   78  		/* stop the scheduler, but don't mess with the
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   79  		 * bad job yet because if ring reset fails
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   80  		 * we'll fall back to full GPU reset.
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   81  		 */
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   82  		drm_sched_wqueue_stop(&ring->sched);
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   83  		r = amdgpu_ring_reset(ring, job->vmid);
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   84  		if (!r) {
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   85  			if (amdgpu_ring_sched_ready(ring))
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   86  				drm_sched_stop(&ring->sched, s_job);
fb0a5834a338329 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Prike Liang       2024-06-12   87  			atomic_inc(&ring->adev->gpu_reset_counter);
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   88  			amdgpu_fence_driver_force_completion(ring);
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   89  			if (amdgpu_ring_sched_ready(ring))
8a591034b0b5338 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Stephen Rothwell  2024-08-26  @90  				drm_sched_start(&ring->sched);
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   91  			goto exit;
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   92  		}
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   93  	}
15789fa0f0e29cf drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-06-03   94  
95a2f917387a23c drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Yintian Tao       2020-04-07   95  	if (amdgpu_device_should_recover_gpu(ring->adev)) {
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08   96  		struct amdgpu_reset_context reset_context;
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08   97  		memset(&reset_context, 0, sizeof(reset_context));
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08   98  
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08   99  		reset_context.method = AMD_RESET_METHOD_NONE;
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08  100  		reset_context.reset_req_dev = adev;
bac640ddb51e806 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Eric Huang        2024-06-04  101  		reset_context.src = AMDGPU_RESET_SRC_JOB;
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08  102  		clear_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08  103  
f1549c09c520877 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Likun Gao         2022-07-08  104  		r = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
7258fa31eabd882 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Surbhi Kakarya    2022-01-26  105  		if (r)
7d570f56f1e1005 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Alex Deucher      2024-07-08  106  			dev_err(adev->dev, "GPU Recovery Failed: %d\n", r);
95a2f917387a23c drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Yintian Tao       2020-04-07  107  	} else {
c3b6c6074166499 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Monk Liu          2019-05-13  108  		drm_sched_suspend_timeout(&ring->sched);
95a2f917387a23c drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Yintian Tao       2020-04-07  109  		if (amdgpu_sriov_vf(adev))
95a2f917387a23c drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Yintian Tao       2020-04-07  110  			adev->virt.tdr_debug = true;
95a2f917387a23c drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Yintian Tao       2020-04-07  111  	}
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12  112  
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12  113  exit:
194eb174cbe4fe2 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Victor Zhao       2022-06-24  114  	adev->job_hang = false;
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12  115  	drm_dev_exit(idx);
ca4e17244bd213e drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Andrey Grodzovsky 2021-05-12  116  	return DRM_GPU_SCHED_STAT_NOMINAL;
0de2479c953ae07 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Monk Liu          2016-03-04  117  }
0de2479c953ae07 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   Monk Liu          2016-03-04  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
