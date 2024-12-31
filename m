Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBB1632FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735624921; cv=none; b=djqksQFDcS6Qy0U/V5gcVyiITzeN+pPuQahh3H/IlFFSr/HDU5cnMxZrxspsxS08Sr3FYYkSgBf4rMIZ8iqUl8hZMM77UdKAnujWL+11tbP0TOODGmF6MtGj8u3nPr0VCI6UzH8ncvp/sXHNgsOUYieVmsDcTzu2yCSRjfNlXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735624921; c=relaxed/simple;
	bh=4kPIpscisWZcaceSOijwJw2VSGypuwhF0J5DU/ALuBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI6y7YfD6Wlu7n3PF8F42MnsiPC9qDhlvga91eWyEplyeoMz1YyTGC1QY2UPv0ZEb6dlOGwEl7I/D/YBw104G/inilxF/UU9CHwQ+4PCMkTdcj9ucbEJ31Yd9dAnbL2lbjz0grok4VGbs0+LvC8+SKHfITAdcC71vQndHABRnD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCODHepV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCODHepV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735624920; x=1767160920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4kPIpscisWZcaceSOijwJw2VSGypuwhF0J5DU/ALuBE=;
  b=lCODHepVCKE0cqGc/AO29DJ82BrYGcbAxMbSEvCo6wFx6d6zKaxqWYxf
   Xi2PgatLyLfJ/52DzgXRAJ4cXNPlzcfW3AQ8AzXH6yc3/mI20D+TGKr4x
   OOviKvucuTZM/XdSh31LbJ8w0vsJCS71q5I1kMwmBzZAi6wODWh1c4r9f
   EoTnjLkeB30gMOaBEjwbYenRKGLIMsPvwvMxBIRWiEx8FasIbNzBWK1/Y
   +hctvu3DZhCoXbkd/dTIvwI++1qsshr0+edrZ5WdQVS/Liofp0VcrNhIB
   AMDjnfQ0XaUR7yJVLP9E9tbHNy6zwsuG0+1jgunrN17/i1UJ8Wp5h1dGI
   w==;
X-CSE-ConnectionGUID: nqv8AglKQ/6sM4Vo7zyWUA==
X-CSE-MsgGUID: RAYIAzE3QyONtED4KMdZSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="23498478"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="23498478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 22:01:57 -0800
X-CSE-ConnectionGUID: U59DVGvDRnS5L4l/4v+LeQ==
X-CSE-MsgGUID: GOonl9J5Rg+AAQFsJ8UAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="131810869"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Dec 2024 22:01:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSVKE-0006p9-0H;
	Tue, 31 Dec 2024 06:01:54 +0000
Date: Tue, 31 Dec 2024 14:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 14/14] drm/sched: Resolve all job dependencies in one go
Message-ID: <202412311307.zMjN4cPE-lkp@intel.com>
References: <20241230165259.95855-15-tursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230165259.95855-15-tursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.13-rc5 next-20241220]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Delete-unused-update_job_credits/20241231-011327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20241230165259.95855-15-tursulin%40igalia.com
patch subject: [RFC 14/14] drm/sched: Resolve all job dependencies in one go
config: arm64-randconfig-003-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311307.zMjN4cPE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311307.zMjN4cPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311307.zMjN4cPE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imagination/pvr_context.h:13,
                    from drivers/gpu/drm/imagination/pvr_job.c:4:
   drivers/gpu/drm/imagination/pvr_job.c: In function 'can_combine_jobs':
>> drivers/gpu/drm/imagination/pvr_job.c:612:36: error: 'struct drm_sched_job' has no member named 'dependencies'
     612 |         xa_for_each(&frag_job->base.dependencies, index, fence) {
         |                                    ^
   include/linux/xarray.h:453:30: note: in definition of macro 'xa_for_each_range'
     453 |              entry = xa_find(xa, &index, last, XA_PRESENT);             \
         |                              ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_job.c:612:9: note: in expansion of macro 'xa_for_each'
     612 |         xa_for_each(&frag_job->base.dependencies, index, fence) {
         |         ^~~~~~~~~~~
>> drivers/gpu/drm/imagination/pvr_job.c:612:36: error: 'struct drm_sched_job' has no member named 'dependencies'
     612 |         xa_for_each(&frag_job->base.dependencies, index, fence) {
         |                                    ^
   include/linux/xarray.h:455:36: note: in definition of macro 'xa_for_each_range'
     455 |              entry = xa_find_after(xa, &index, last, XA_PRESENT))
         |                                    ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_job.c:612:9: note: in expansion of macro 'xa_for_each'
     612 |         xa_for_each(&frag_job->base.dependencies, index, fence) {
         |         ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/imagination/pvr_context.h:13,
                    from drivers/gpu/drm/imagination/pvr_queue.c:8:
   drivers/gpu/drm/imagination/pvr_queue.c: In function 'job_count_remaining_native_deps':
>> drivers/gpu/drm/imagination/pvr_queue.c:361:31: error: 'struct drm_sched_job' has no member named 'dependencies'
     361 |         xa_for_each(&job->base.dependencies, index, fence) {
         |                               ^
   include/linux/xarray.h:453:30: note: in definition of macro 'xa_for_each_range'
     453 |              entry = xa_find(xa, &index, last, XA_PRESENT);             \
         |                              ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:361:9: note: in expansion of macro 'xa_for_each'
     361 |         xa_for_each(&job->base.dependencies, index, fence) {
         |         ^~~~~~~~~~~
>> drivers/gpu/drm/imagination/pvr_queue.c:361:31: error: 'struct drm_sched_job' has no member named 'dependencies'
     361 |         xa_for_each(&job->base.dependencies, index, fence) {
         |                               ^
   include/linux/xarray.h:455:36: note: in definition of macro 'xa_for_each_range'
     455 |              entry = xa_find_after(xa, &index, last, XA_PRESENT))
         |                                    ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:361:9: note: in expansion of macro 'xa_for_each'
     361 |         xa_for_each(&job->base.dependencies, index, fence) {
         |         ^~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c: In function 'pvr_queue_get_paired_frag_job_dep':
   drivers/gpu/drm/imagination/pvr_queue.c:471:36: error: 'struct drm_sched_job' has no member named 'dependencies'
     471 |         xa_for_each(&frag_job->base.dependencies, index, f) {
         |                                    ^
   include/linux/xarray.h:453:30: note: in definition of macro 'xa_for_each_range'
     453 |              entry = xa_find(xa, &index, last, XA_PRESENT);             \
         |                              ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:471:9: note: in expansion of macro 'xa_for_each'
     471 |         xa_for_each(&frag_job->base.dependencies, index, f) {
         |         ^~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:471:36: error: 'struct drm_sched_job' has no member named 'dependencies'
     471 |         xa_for_each(&frag_job->base.dependencies, index, f) {
         |                                    ^
   include/linux/xarray.h:455:36: note: in definition of macro 'xa_for_each_range'
     455 |              entry = xa_find_after(xa, &index, last, XA_PRESENT))
         |                                    ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:471:9: note: in expansion of macro 'xa_for_each'
     471 |         xa_for_each(&frag_job->base.dependencies, index, f) {
         |         ^~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c: In function 'pvr_queue_submit_job_to_cccb':
   drivers/gpu/drm/imagination/pvr_queue.c:618:31: error: 'struct drm_sched_job' has no member named 'dependencies'
     618 |         xa_for_each(&job->base.dependencies, index, fence) {
         |                               ^
   include/linux/xarray.h:453:30: note: in definition of macro 'xa_for_each_range'
     453 |              entry = xa_find(xa, &index, last, XA_PRESENT);             \
         |                              ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:618:9: note: in expansion of macro 'xa_for_each'
     618 |         xa_for_each(&job->base.dependencies, index, fence) {
         |         ^~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:618:31: error: 'struct drm_sched_job' has no member named 'dependencies'
     618 |         xa_for_each(&job->base.dependencies, index, fence) {
         |                               ^
   include/linux/xarray.h:455:36: note: in definition of macro 'xa_for_each_range'
     455 |              entry = xa_find_after(xa, &index, last, XA_PRESENT))
         |                                    ^~
   include/linux/xarray.h:505:9: note: in expansion of macro 'xa_for_each_start'
     505 |         xa_for_each_start(xa, index, entry, 0)
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_queue.c:618:9: note: in expansion of macro 'xa_for_each'
     618 |         xa_for_each(&job->base.dependencies, index, fence) {
         |         ^~~~~~~~~~~


vim +612 drivers/gpu/drm/imagination/pvr_job.c

eaf01ee5ba28b9 Sarah Walker 2023-11-22  596  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  597  static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
eaf01ee5ba28b9 Sarah Walker 2023-11-22  598  {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  599  	struct pvr_job *geom_job = a, *frag_job = b;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  600  	struct dma_fence *fence;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  601  	unsigned long index;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  602  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  603  	/* Geometry and fragment jobs can be combined if they are queued to the
eaf01ee5ba28b9 Sarah Walker 2023-11-22  604  	 * same context and targeting the same HWRT.
eaf01ee5ba28b9 Sarah Walker 2023-11-22  605  	 */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  606  	if (a->type != DRM_PVR_JOB_TYPE_GEOMETRY ||
eaf01ee5ba28b9 Sarah Walker 2023-11-22  607  	    b->type != DRM_PVR_JOB_TYPE_FRAGMENT ||
eaf01ee5ba28b9 Sarah Walker 2023-11-22  608  	    a->ctx != b->ctx ||
eaf01ee5ba28b9 Sarah Walker 2023-11-22  609  	    a->hwrt != b->hwrt)
eaf01ee5ba28b9 Sarah Walker 2023-11-22  610  		return false;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  611  
eaf01ee5ba28b9 Sarah Walker 2023-11-22 @612  	xa_for_each(&frag_job->base.dependencies, index, fence) {
eaf01ee5ba28b9 Sarah Walker 2023-11-22  613  		/* We combine when we see an explicit geom -> frag dep. */
eaf01ee5ba28b9 Sarah Walker 2023-11-22  614  		if (&geom_job->base.s_fence->scheduled == fence)
eaf01ee5ba28b9 Sarah Walker 2023-11-22  615  			return true;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  616  	}
eaf01ee5ba28b9 Sarah Walker 2023-11-22  617  
eaf01ee5ba28b9 Sarah Walker 2023-11-22  618  	return false;
eaf01ee5ba28b9 Sarah Walker 2023-11-22  619  }
eaf01ee5ba28b9 Sarah Walker 2023-11-22  620  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
