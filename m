Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D421218E97
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222828; cv=none; b=toL23hOp8Fs5phTl0OXb6B1Q0Vseh5gLnLAdpa4Rs2Ld2P25G+8kywQhVytPktFzzE3irgoIs60gMJlIlqNrdEffdZqvbVSrMzyMz1wIK2Q1UXtf3lrOHNRz4xmYUt6ZxVnBvNB4ULAOJmpASAdXVZkg5POKyEDahMXWL7xWbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222828; c=relaxed/simple;
	bh=7X2FHIhnuqd7vGZ7IPLTl9trlAFc4zigXhVrpfUmcVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTG+XCg2/VKvJRtzbYBsyt4W3OZFdOV0D8G0VnSG37cENWKfUN3WTKxN/ulhB3tilQ0mvUENV18p8QEYqN++mAprQLFbyPII5kFfKZpAgnF1a0C7mzZ8DIJ7QvMJKChwW0I+Ag6ZkRG+N4ZxWCq250RyY53IE+KQSdjRixILZ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7vxsXVr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7vxsXVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746222825; x=1777758825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7X2FHIhnuqd7vGZ7IPLTl9trlAFc4zigXhVrpfUmcVM=;
  b=O7vxsXVrizJvolibS81GiUlmodWXKknmUbh7jcE3CKyjrNgNDywwhVFQ
   nRG1cchd0pZQWJQ83WxZOq6kflb2wPhwPJs8rhXvq8SmpwFI2f4RZpfhq
   bOqM3/yENWKG8ta2c55cdrtLt2ESO2gJYovy/sau3TfnSTumLCKv224z1
   npeAEx2ibNZuxiuYS4fPwiZDHJa0tGyVBbX6Vv4DmoQNGs9TCpOBx1eC/
   pmq2azpy9Pxs0J8yUXfIhAfI2adV2XxN+DkeG7qqTpPxs1nYubQVb7Tuw
   LVDjoj2tfivq0eTMJApBxCUazMlE3U2hM0Hw/xNcj5zbw1UB1j2M5VRju
   w==;
X-CSE-ConnectionGUID: MjTNIUoASlCFJaUqtiie9g==
X-CSE-MsgGUID: FUtUMpGXSraD/NYLlJ9kQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47820838"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="47820838"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 14:53:44 -0700
X-CSE-ConnectionGUID: XCNyckaXRyOkK/GfpKNM4A==
X-CSE-MsgGUID: wwh6D7jHTTudATQDu8o2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="139893961"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 May 2025 14:53:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAyKD-00052V-1I;
	Fri, 02 May 2025 21:53:41 +0000
Date: Sat, 3 May 2025 05:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 22/23] drm/sched: Add helper for DRM cgroup controller
 weight notifications
Message-ID: <202505030555.En1zikYz-lkp@intel.com>
References: <20250502123256.50540-23-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502123256.50540-23-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on next-20250502]
[cannot apply to tj-cgroup/for-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250502-203539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250502123256.50540-23-tvrtko.ursulin%40igalia.com
patch subject: [RFC 22/23] drm/sched: Add helper for DRM cgroup controller weight notifications
config: arc-randconfig-002-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030555.En1zikYz-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030555.En1zikYz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030555.En1zikYz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/scheduler/sched_internal.h:6,
                    from drivers/gpu/drm/scheduler/sched_rq.c:6:
>> include/linux/cgroup_drm.h:24:13: warning: 'drmcgroup_client_migrate' defined but not used [-Wunused-function]
      24 | static void drmcgroup_client_migrate(struct drm_file *file_priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/drmcgroup_client_migrate +24 include/linux/cgroup_drm.h

07bc19971ccecd Tvrtko Ursulin 2025-05-02  23  
07bc19971ccecd Tvrtko Ursulin 2025-05-02 @24  static void drmcgroup_client_migrate(struct drm_file *file_priv)
07bc19971ccecd Tvrtko Ursulin 2025-05-02  25  {
07bc19971ccecd Tvrtko Ursulin 2025-05-02  26  }
07bc19971ccecd Tvrtko Ursulin 2025-05-02  27  #endif
07bc19971ccecd Tvrtko Ursulin 2025-05-02  28  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
