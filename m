Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29471FA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 06:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687241267; x=1718777267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QRwt0+wQJQr9Fc9FbYYJmuPtRRT8lilg7cfIDO2wFb4=;
  b=mo+lJ3l0nPhjPp4gU5y6C3OmHD/CKHXToDaPE0ip+0LKVsOX9bXJw8Ea
   nZB4Hp4fiK45Iofuw+BkefUsHX0bd2ANg4VNBnrjKJdrQI7X4pbXZa2HM
   xf5pFZAXEA23je9YU8mQCZlKzlBsL2iQEq6OxtP7zZZosA4VoWKW2619a
   kpqQX4nKVk8cqkCQzf3QJUC6BfR3Zg/9pLr2rQrWs5GzRB7TM+VWgW+L8
   PoK3EG8RbFbl2MhRM0ZtkVGs2lZguwwaunyBq9py+Uspk8j3fpBXX6fok
   PCO3NnLYOVfpRyMSmaGWtLrGoqO/FFl7EU/QFukSL63Up9v+pd4vi0Zts
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="446154018"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="446154018"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 23:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="838092897"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="838092897"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jun 2023 23:06:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBUW1-0005Zq-1c;
	Tue, 20 Jun 2023 06:06:57 +0000
Date: Tue, 20 Jun 2023 14:06:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 18/37]
 drivers/gpu/drm/i915/i915_pmu.c:259:7: error: this statement may fall
 through
Message-ID: <202306201407.CkuPbIie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   a9728f9d57d7458743dad615048675784738fe7e
commit: a3f070eb406565726d7c67bbac22c30fee9b68a2 [18/37] UPSTREAM: drm/i915/pmu: Expose a PMU interface for perf queries
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230620/202306201407.CkuPbIie-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201407.CkuPbIie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201407.CkuPbIie-lkp@intel.com/

Note: the chrome-os/chromeos-4.14 HEAD a9728f9d57d7458743dad615048675784738fe7e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/i915_pmu.c: In function 'i915_pmu_event_init':
>> drivers/gpu/drm/i915/i915_pmu.c:259:7: error: this statement may fall through [-Werror=implicit-fallthrough=]
       if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
          ^
   drivers/gpu/drm/i915/i915_pmu.c:262:3: note: here
      case I915_PMU_REQUESTED_FREQUENCY:
      ^~~~
   cc1: all warnings being treated as errors


vim +259 drivers/gpu/drm/i915/i915_pmu.c

   228	
   229	static int i915_pmu_event_init(struct perf_event *event)
   230	{
   231		struct drm_i915_private *i915 =
   232			container_of(event->pmu, typeof(*i915), pmu.base);
   233		int cpu, ret;
   234	
   235		if (event->attr.type != event->pmu->type)
   236			return -ENOENT;
   237	
   238		/* unsupported modes and filters */
   239		if (event->attr.sample_period) /* no sampling */
   240			return -EINVAL;
   241	
   242		if (has_branch_stack(event))
   243			return -EOPNOTSUPP;
   244	
   245		if (event->cpu < 0)
   246			return -EINVAL;
   247	
   248		cpu = cpumask_any_and(&i915_pmu_cpumask,
   249				      topology_sibling_cpumask(event->cpu));
   250		if (cpu >= nr_cpu_ids)
   251			return -ENODEV;
   252	
   253		if (is_engine_event(event)) {
   254			ret = engine_event_init(event);
   255		} else {
   256			ret = 0;
   257			switch (event->attr.config) {
   258			case I915_PMU_ACTUAL_FREQUENCY:
 > 259				if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
   260					 /* Requires a mutex for sampling! */
   261					ret = -ENODEV;
   262			case I915_PMU_REQUESTED_FREQUENCY:
   263				if (INTEL_GEN(i915) < 6)
   264					ret = -ENODEV;
   265				break;
   266			default:
   267				ret = -ENOENT;
   268				break;
   269			}
   270		}
   271		if (ret)
   272			return ret;
   273	
   274		event->cpu = cpu;
   275		if (!event->parent)
   276			event->destroy = i915_pmu_event_destroy;
   277	
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
