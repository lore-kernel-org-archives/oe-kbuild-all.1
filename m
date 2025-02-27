Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF0145A05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 01:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740620085; cv=none; b=UPTVrM+XRwU+3BdORWd7dkPJXQQy8cSyHf2+dR4DqwqFyhgB8f7fhHWcPa+oce4SRsBw1JnHa/34gEu7HA0SdhcVYntFFxX0aB9Yy6x88Y31fos3Q2fHbRkUHyvh3hiVdELMz2lXEcPsXB1zqIjvV+SVnhNKEBzw8AFNefhZRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740620085; c=relaxed/simple;
	bh=HDJRYgnh/GggDASG30fi6jXRvYmsWiehtPJsKSP+12s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GomD7hzmhe4Y/A6MeACDg418GShMhUGKTvnjC/N/xD4PiAETKRf0D8RkbAPQyG7ms9Wp44gkvMsQ2VlFcSsFRJl579zvzqu6uYzam1MH4yeUKCBhK818kKlx2eQahlrrnuqpSEnUOMMbaG9wBwFkcShE+y/BvDTyBqTUuFeYKYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVyNBWFh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVyNBWFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740620084; x=1772156084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HDJRYgnh/GggDASG30fi6jXRvYmsWiehtPJsKSP+12s=;
  b=MVyNBWFhj1mvxEXZ/wFmXljtsDQpOcBaiEZtGegsrDb8GM77OuRMxHmu
   xM3zRZG26YR6Zkrva5wiiPjrXzSk9xDsaGYlenVnWphR++58hYKgPqroe
   nYwDEistY9ROXoosPMQ2srV+8A/0p08/M+7N/XgmBsKNpxFTmSXhz2FA6
   PLFmFYwSHukQitooiudQ0KQ9ASdru0P/vvRa6oZswcxeXqX5cY14eERNN
   ZThk5eSuK61K9IoQ+XX9JmdnE1VcWBS3mSlee+yM4bVleSFDc2VZ7WPJk
   cVJd66i+GC5jG30oLs+XWC9tUwMZJUk5TPsoDQgsgxRvEoAJYAfLZW9hl
   Q==;
X-CSE-ConnectionGUID: syiPnarLRk+6tEEuL1T+sQ==
X-CSE-MsgGUID: 46as1kMnSU6KPPuprxhFyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41377394"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41377394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 17:34:40 -0800
X-CSE-ConnectionGUID: MZAeHxpTT8OrvJnYCzk5kQ==
X-CSE-MsgGUID: RSFZ/sNRRX+RN/M7rk1jTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117793694"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Feb 2025 17:34:39 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnSnM-000Ch6-1i;
	Thu, 27 Feb 2025 01:34:36 +0000
Date: Thu, 27 Feb 2025 09:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Jesse.zhang" <Jesse.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Jesse Zhang <jesse.zhang@amd.com>
Subject: [linux-next:master 6191/6583]
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:578 amdgpu_sdma_reset_engine()
 warn: inconsistent indenting
Message-ID: <202502270930.4zSuFssC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
commit: 4c02f730165765ad412a1ce8de6ea0d7abc7a333 [6191/6583] drm/amdgpu: Introduce conditional user queue suspension for SDMA resets
config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502270930.4zSuFssC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270930.4zSuFssC-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:578 amdgpu_sdma_reset_engine() warn: inconsistent indenting

vim +578 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c

   484	
   485	/**
   486	 * amdgpu_sdma_reset_engine - Reset a specific SDMA engine
   487	 * @adev: Pointer to the AMDGPU device
   488	 * @instance_id: ID of the SDMA engine instance to reset
   489	 * @suspend_user_queues: check if suspend user queue.
   490	 *
   491	 * This function performs the following steps:
   492	 * 1. Calls all registered pre_reset callbacks to allow KFD and AMDGPU to save their state.
   493	 * 2. Resets the specified SDMA engine instance.
   494	 * 3. Calls all registered post_reset callbacks to allow KFD and AMDGPU to restore their state.
   495	 *
   496	 * Returns: 0 on success, or a negative error code on failure.
   497	 */
   498	int amdgpu_sdma_reset_engine(struct amdgpu_device *adev, uint32_t instance_id, bool suspend_user_queues)
   499	{
   500		struct sdma_on_reset_funcs *funcs;
   501		int ret = 0;
   502		struct amdgpu_sdma_instance *sdma_instance = &adev->sdma.instance[instance_id];;
   503		struct amdgpu_ring *gfx_ring = &sdma_instance->ring;
   504		struct amdgpu_ring *page_ring = &sdma_instance->page;
   505		bool gfx_sched_stopped = false, page_sched_stopped = false;
   506	
   507		/* Suspend KFD if suspend_user_queues is true.
   508		 * prevent the destruction of in-flight healthy user queue packets and
   509		 * avoid race conditions between KFD and KGD during the reset process.
   510		 */
   511		if (suspend_user_queues)
   512			amdgpu_amdkfd_suspend(adev, false);
   513	
   514		/* Stop the scheduler's work queue for the GFX and page rings if they are running.
   515		* This ensures that no new tasks are submitted to the queues while
   516		* the reset is in progress.
   517		*/
   518		if (!amdgpu_ring_sched_ready(gfx_ring)) {
   519			drm_sched_wqueue_stop(&gfx_ring->sched);
   520			gfx_sched_stopped = true;;
   521		}
   522	
   523		if (adev->sdma.has_page_queue && !amdgpu_ring_sched_ready(page_ring)) {
   524			drm_sched_wqueue_stop(&page_ring->sched);
   525			page_sched_stopped = true;
   526		}
   527	
   528		/* Invoke all registered pre_reset callbacks */
   529		list_for_each_entry(funcs, &adev->sdma.reset_callback_list, list) {
   530			if (funcs->pre_reset) {
   531				ret = funcs->pre_reset(adev, instance_id);
   532				if (ret) {
   533					dev_err(adev->dev,
   534					"beforeReset callback failed for instance %u: %d\n",
   535						instance_id, ret);
   536					goto exit;
   537				}
   538			}
   539		}
   540	
   541		/* Perform the SDMA reset for the specified instance */
   542		ret = amdgpu_dpm_reset_sdma(adev, 1 << instance_id);
   543		if (ret) {
   544			dev_err(adev->dev, "Failed to reset SDMA instance %u\n", instance_id);
   545			goto exit;
   546		}
   547	
   548		/* Invoke all registered post_reset callbacks */
   549		list_for_each_entry(funcs, &adev->sdma.reset_callback_list, list) {
   550			if (funcs->post_reset) {
   551				ret = funcs->post_reset(adev, instance_id);
   552				if (ret) {
   553					dev_err(adev->dev,
   554					"afterReset callback failed for instance %u: %d\n",
   555						instance_id, ret);
   556					goto exit;
   557				}
   558			}
   559		}
   560	
   561	exit:
   562		/* Restart the scheduler's work queue for the GFX and page rings
   563		 * if they were stopped by this function. This allows new tasks
   564		 * to be submitted to the queues after the reset is complete.
   565		 */
   566		if (ret) {
   567			if (gfx_sched_stopped && amdgpu_ring_sched_ready(gfx_ring)) {
   568				drm_sched_wqueue_start(&gfx_ring->sched);
   569			}
   570			if (page_sched_stopped && amdgpu_ring_sched_ready(page_ring)) {
   571				drm_sched_wqueue_start(&page_ring->sched);
   572			}
   573		}
   574	
   575		if (suspend_user_queues)
   576			amdgpu_amdkfd_resume(adev, false);
   577	
 > 578	       return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
