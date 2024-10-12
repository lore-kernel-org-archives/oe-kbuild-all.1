Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BBE15443C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728729905; cv=none; b=Tj5JNu2NwWn6AQ5L6A18VTCkI8Bi0lb6KtzibJx28397YmwWpu4g84T8U+YC9VV1qiVfiIVysRxCrdEMRzqtrQDiGf4mZa4XvIuTy6ODzhXijHyruluebwdHizully3GSdde3HeGEb+8AV1UR3AROMnaVzYApPxjuzEWLaLafU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728729905; c=relaxed/simple;
	bh=dWbtaadhsATU2nHdEmLui+yfpl3m/ta9AAsQYa3ESVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOgn9ilVQWjszYHAZs9Yly+ZYHWmGqkpjhm1ck4+u+W1Jg361/ZT94UdyJN1ljPxfLQ5cuMVNxCkXyA6w8kG3s6KSD6RkfEgG6p0bMNuv2HeslFaPrBpVWuj/jL2M95XamrKrVQSx4FwALTzMg7zNmCImkzcmXWZSuLkGTAuaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+ERUcBS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+ERUcBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728729903; x=1760265903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dWbtaadhsATU2nHdEmLui+yfpl3m/ta9AAsQYa3ESVc=;
  b=P+ERUcBS7vQ/DCB2rM0yu5wXSkMO3LZROHyIdepLDM0+fAe6pFEP0t5J
   4SXg5RGlZlcAm2NFQyA/wSleOSEsqAKNQOjQ+z55PW6SEiBb2Vuwzlimw
   TmT7zih7H1SXTdOXODwhz2pZsUTY5rr/8R8j4OZdy6O8pa/VyZC+doHj8
   8gAUbEMaUTdtTc/LWjxapAf1O25jWa8WpR308EIZt38vZbfrxb2RoTgGg
   BKKRGqlAlNOR1pwpz4mMXx++Fz2QjSDxG+ImBTmoJqn7uJsWgTX8dkjR9
   QndFL4OyA1seJejr0vLYG9j+Z31MUOtaxZHuXhA2qbSWqclqOXcbuz9wA
   Q==;
X-CSE-ConnectionGUID: 9MNvanf4QHGqF23djBEypQ==
X-CSE-MsgGUID: 1CxgzCr6SZKM58BdZSvtvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28298552"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="28298552"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:45:03 -0700
X-CSE-ConnectionGUID: +Mrk0biOSpSqHpRzh+4tcA==
X-CSE-MsgGUID: grR35UEWSJSGv6WDfmGRsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="77608193"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2024 03:45:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szZcI-000DHf-1l;
	Sat, 12 Oct 2024 10:44:58 +0000
Date: Sat, 12 Oct 2024 18:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: jesse.zhang@amd.com, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Alexander.Deucher@amd.com,
	Christian Koenig <christian.koenig@amd.com>,
	"Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: Re: [PATCH 1/2] drm/sched: adding a new scheduling policy
Message-ID: <202410121817.HUe5MN9d-lkp@intel.com>
References: <20241011062136.1019695-1-jesse.zhang@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011062136.1019695-1-jesse.zhang@amd.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc2 next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jesse-zhang-amd-com/drm-amdgpu-add-the-ring-id-schedule-module-parameter-for-amdgpu/20241011-142247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20241011062136.1019695-1-jesse.zhang%40amd.com
patch subject: [PATCH 1/2] drm/sched: adding a new scheduling policy
config: sparc64-randconfig-r073-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121817.HUe5MN9d-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121817.HUe5MN9d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121817.HUe5MN9d-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_drv.c: In function 'panthor_submit_ctx_add_deps_and_arm_jobs':
>> drivers/gpu/drm/panthor/panthor_drv.c:674:17: error: too few arguments to function 'drm_sched_job_arm'
     674 |                 drm_sched_job_arm(ctx->jobs[i].job);
         |                 ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/panthor/panthor_drv.c:20:
   include/drm/gpu_scheduler.h:556:6: note: declared here
     556 | void drm_sched_job_arm(struct drm_sched_job *job, int ring);
         |      ^~~~~~~~~~~~~~~~~
--
   drivers/gpu/drm/scheduler/sched_main.c:405: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'
>> drivers/gpu/drm/scheduler/sched_main.c:828: warning: Function parameter or struct member 'ring' not described in 'drm_sched_job_arm'


vim +/drm_sched_job_arm +674 drivers/gpu/drm/panthor/panthor_drv.c

4bdca11507928a Boris Brezillon 2024-02-29  655  
4bdca11507928a Boris Brezillon 2024-02-29  656  /**
4bdca11507928a Boris Brezillon 2024-02-29  657   * panthor_submit_ctx_add_deps_and_arm_jobs() - Add jobs dependencies and arm jobs
4bdca11507928a Boris Brezillon 2024-02-29  658   * @ctx: Submit context.
4bdca11507928a Boris Brezillon 2024-02-29  659   *
4bdca11507928a Boris Brezillon 2024-02-29  660   * Must be called after the resv preparation has been taken care of.
4bdca11507928a Boris Brezillon 2024-02-29  661   *
4bdca11507928a Boris Brezillon 2024-02-29  662   * Return: 0 on success, a negative error code otherwise.
4bdca11507928a Boris Brezillon 2024-02-29  663   */
4bdca11507928a Boris Brezillon 2024-02-29  664  static int
4bdca11507928a Boris Brezillon 2024-02-29  665  panthor_submit_ctx_add_deps_and_arm_jobs(struct panthor_submit_ctx *ctx)
4bdca11507928a Boris Brezillon 2024-02-29  666  {
4bdca11507928a Boris Brezillon 2024-02-29  667  	for (u32 i = 0; i < ctx->job_count; i++) {
4bdca11507928a Boris Brezillon 2024-02-29  668  		int ret;
4bdca11507928a Boris Brezillon 2024-02-29  669  
4bdca11507928a Boris Brezillon 2024-02-29  670  		ret = panthor_submit_ctx_add_sync_deps_to_job(ctx, i);
4bdca11507928a Boris Brezillon 2024-02-29  671  		if (ret)
4bdca11507928a Boris Brezillon 2024-02-29  672  			return ret;
4bdca11507928a Boris Brezillon 2024-02-29  673  
4bdca11507928a Boris Brezillon 2024-02-29 @674  		drm_sched_job_arm(ctx->jobs[i].job);
4bdca11507928a Boris Brezillon 2024-02-29  675  
4bdca11507928a Boris Brezillon 2024-02-29  676  		ret = panthor_submit_ctx_update_job_sync_signal_fences(ctx, i);
4bdca11507928a Boris Brezillon 2024-02-29  677  		if (ret)
4bdca11507928a Boris Brezillon 2024-02-29  678  			return ret;
4bdca11507928a Boris Brezillon 2024-02-29  679  	}
4bdca11507928a Boris Brezillon 2024-02-29  680  
4bdca11507928a Boris Brezillon 2024-02-29  681  	return 0;
4bdca11507928a Boris Brezillon 2024-02-29  682  }
4bdca11507928a Boris Brezillon 2024-02-29  683  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
