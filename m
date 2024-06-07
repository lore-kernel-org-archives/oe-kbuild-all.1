Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159747E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717720519; cv=none; b=p4eF5bvUD9740jhhRsdPFnVhB3RRsaQrF1rUFD79aAq9Arv4VlyjoEcG4vnxZgli9fMprOGHmVhLBCRp6yUYKomkFizzUh8q4kyS3VT6ZIYu/Q9UgKr5DFQCo2n0DIHyf/Mam+Bu6b7SdzlPr1lFE9sRHT2hcYC4NM9aA2bzDiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717720519; c=relaxed/simple;
	bh=5clKo/4y9zfnPArbuNcUqPlULvag7jcFzLvgrJIumWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDs0nScv+UZZU6tB0PHKtdr71wTZOpe6VHMM6gl8BjQVTymwZVab07KnKCRyWw3syP92BZXRkx4Yo5UF61kspzaSnAuxA5jSv8EFz/4Iiwvt+sYVd4SJ32sTJ0pzUJI+fafZMRnX0rAmlCvYH5AUxp+lfcgc+M1rbd09PfRs/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c58TQLSI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c58TQLSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717720518; x=1749256518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5clKo/4y9zfnPArbuNcUqPlULvag7jcFzLvgrJIumWU=;
  b=c58TQLSIW4ec/twOt3NPANCoT5/TB8woqsqsx3til1JzRSyF5TVlxbsv
   wxTakxpSMLoOQhu+cXPVwN5mN8klYzNWiMFSGPCFr6PiUIYpVuBeO6LK0
   QiqWI3dGxC0ukOHV5iGPeLUFWLq6ZOEAXxH/c87gFNwyEyAEPAlqHdPwy
   qw3/QswbZRReItjgcOTTW2DVjJA9YUFiik2DAksfYYMescb25v0bi2gID
   tcfC7vrVLrG13PfG2TPLldk85Qb06Pv6MDI2F0YfjP1EcyoxzCkUbo38K
   aGRgV7TGUw7avRSsoBsQKNQT4FjZ2XvVV2YYlmvfYzlY2tFhDPsaET/u0
   w==;
X-CSE-ConnectionGUID: 0P8fX0aPTmSdRb9d4+BkcQ==
X-CSE-MsgGUID: m4nJP+eTSnSXFDRnrRZ2fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="11951504"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="11951504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 17:35:17 -0700
X-CSE-ConnectionGUID: GcZiq0K9RGKK7GwpUn1w0A==
X-CSE-MsgGUID: iz3Xz5yCR6yYBH6duOC27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38216187"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Jun 2024 17:35:13 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFNZX-0003vD-1q;
	Fri, 07 Jun 2024 00:35:11 +0000
Date: Fri, 7 Jun 2024 08:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	ltuikov89@gmail.com, matthew.brost@intel.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
	rostedt@goodmis.org
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v3 1/4] drm/sched: store the drm_device instead of the
 device
Message-ID: <202406070826.ASQuMJ48-lkp@intel.com>
References: <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606130629.214827-2-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc2 next-20240606]
[cannot apply to drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-sched-store-the-drm_device-instead-of-the-device/20240606-211050
base:   linus/master
patch link:    https://lore.kernel.org/r/20240606130629.214827-2-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v3 1/4] drm/sched: store the drm_device instead of the device
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240607/202406070826.ASQuMJ48-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070826.ASQuMJ48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070826.ASQuMJ48-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/drm/drm_print.h:31,
                    from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:42,
                    from drivers/gpu/drm/imagination/pvr_gem.h:12,
                    from drivers/gpu/drm/imagination/pvr_fw.h:9,
                    from drivers/gpu/drm/imagination/pvr_device.h:9,
                    from drivers/gpu/drm/imagination/pvr_context.h:17,
                    from drivers/gpu/drm/imagination/pvr_queue.c:8:
   drivers/gpu/drm/imagination/pvr_queue.c: In function 'pvr_queue_timedout_job':
>> drivers/gpu/drm/imagination/pvr_queue.c:807:22: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Werror=incompatible-pointer-types]
     807 |         dev_err(sched->dev, "Job timeout\n");
         |                 ~~~~~^~~~~
         |                      |
         |                      struct drm_device *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/gpu/drm/imagination/pvr_queue.c:807:9: note: in expansion of macro 'dev_err'
     807 |         dev_err(sched->dev, "Job timeout\n");
         |         ^~~~~~~
   include/linux/dev_printk.h:50:36: note: expected 'const struct device *' but argument is of type 'struct drm_device *'
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |               ~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/_dev_err +807 drivers/gpu/drm/imagination/pvr_queue.c

eaf01ee5ba28b9 Sarah Walker 2023-11-22  787  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  788  /**
eaf01ee5ba28b9 Sarah Walker 2023-11-22  789   * pvr_queue_timedout_job() - Handle a job timeout event.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  790   * @s_job: The job this timeout occurred on.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  791   *
eaf01ee5ba28b9 Sarah Walker 2023-11-22  792   * FIXME: We don't do anything here to unblock the situation, we just stop+start
eaf01ee5ba28b9 Sarah Walker 2023-11-22  793   * the scheduler, and re-assign parent fences in the middle.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  794   *
eaf01ee5ba28b9 Sarah Walker 2023-11-22  795   * Return:
eaf01ee5ba28b9 Sarah Walker 2023-11-22  796   *  * DRM_GPU_SCHED_STAT_NOMINAL.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  797   */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  798  static enum drm_gpu_sched_stat
eaf01ee5ba28b9 Sarah Walker 2023-11-22  799  pvr_queue_timedout_job(struct drm_sched_job *s_job)
eaf01ee5ba28b9 Sarah Walker 2023-11-22  800  {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  801  	struct drm_gpu_scheduler *sched = s_job->sched;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  802  	struct pvr_queue *queue = container_of(sched, struct pvr_queue, scheduler);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  803  	struct pvr_device *pvr_dev = queue->ctx->pvr_dev;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  804  	struct pvr_job *job;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  805  	u32 job_count = 0;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  806  
eaf01ee5ba28b9 Sarah Walker 2023-11-22 @807  	dev_err(sched->dev, "Job timeout\n");
eaf01ee5ba28b9 Sarah Walker 2023-11-22  808  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  809  	/* Before we stop the scheduler, make sure the queue is out of any list, so
eaf01ee5ba28b9 Sarah Walker 2023-11-22  810  	 * any call to pvr_queue_update_active_state_locked() that might happen
eaf01ee5ba28b9 Sarah Walker 2023-11-22  811  	 * until the scheduler is really stopped doesn't end up re-inserting the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  812  	 * queue in the active list. This would cause
eaf01ee5ba28b9 Sarah Walker 2023-11-22  813  	 * pvr_queue_signal_done_fences() and drm_sched_stop() to race with each
eaf01ee5ba28b9 Sarah Walker 2023-11-22  814  	 * other when accessing the pending_list, since drm_sched_stop() doesn't
eaf01ee5ba28b9 Sarah Walker 2023-11-22  815  	 * grab the job_list_lock when modifying the list (it's assuming the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  816  	 * only other accessor is the scheduler, and it's safe to not grab the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  817  	 * lock since it's stopped).
eaf01ee5ba28b9 Sarah Walker 2023-11-22  818  	 */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  819  	mutex_lock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  820  	list_del_init(&queue->node);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  821  	mutex_unlock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  822  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  823  	drm_sched_stop(sched, s_job);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  824  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  825  	/* Re-assign job parent fences. */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  826  	list_for_each_entry(job, &sched->pending_list, base.list) {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  827  		job->base.s_fence->parent = dma_fence_get(job->done_fence);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  828  		job_count++;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  829  	}
eaf01ee5ba28b9 Sarah Walker 2023-11-22  830  	WARN_ON(atomic_read(&queue->in_flight_job_count) != job_count);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  831  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  832  	/* Re-insert the queue in the proper list, and kick a queue processing
eaf01ee5ba28b9 Sarah Walker 2023-11-22  833  	 * operation if there were jobs pending.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  834  	 */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  835  	mutex_lock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  836  	if (!job_count) {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  837  		list_move_tail(&queue->node, &pvr_dev->queues.idle);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  838  	} else {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  839  		atomic_set(&queue->in_flight_job_count, job_count);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  840  		list_move_tail(&queue->node, &pvr_dev->queues.active);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  841  		pvr_queue_process(queue);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  842  	}
eaf01ee5ba28b9 Sarah Walker 2023-11-22  843  	mutex_unlock(&pvr_dev->queues.lock);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  844  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  845  	drm_sched_start(sched, true);
eaf01ee5ba28b9 Sarah Walker 2023-11-22  846  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  847  	return DRM_GPU_SCHED_STAT_NOMINAL;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  848  }
eaf01ee5ba28b9 Sarah Walker 2023-11-22  849  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
