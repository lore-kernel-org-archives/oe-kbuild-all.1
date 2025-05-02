Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EEF221FCE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 21:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222830; cv=none; b=DOTt4dTHYbimeGhCgOFbHHsopAu1TdmcIj+daqyshsEfP3Xf6nUwI1cGpktSu1dGTOTzF8MzmONLMHxMWJ5zzL98/+gsoIeAgZSfooAcZoxWvJTAuvevvQH4oxaElwyRLH7y6yrZ9+9F0H4cwLp/1Y7Yf1YsWDO4Cxrko8cOiac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222830; c=relaxed/simple;
	bh=tNqbACH+DtVdwn9gL6ScdcXl/f2VpCZnhAYuHg/tIcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tozKmQR7orjhopYjTyyvDxIRfJw1ly9M/hRalFSVr51IJQKYU2qE+l8ErDC9jysiV8j34JEjxL/kzvEhL0Xk3GFXFih6lSNR4dc+CwE9rfnLRl9hLldIU/If5LVa0NDB47PLRZCjjVcpgFl74C6bV13PrVzwDWtlWsSxc7Cn/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwmJSyA1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwmJSyA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746222828; x=1777758828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNqbACH+DtVdwn9gL6ScdcXl/f2VpCZnhAYuHg/tIcE=;
  b=UwmJSyA1zodJU+Sdk2CskCdphzJqqkIyuDdIq5j+H8A/dHCcRPwyTrR3
   nhncUrdP02JE1IWo1+aKvbq5ikKOKbS8U3A1iajhRrfJSgm5N4GolJBaf
   gX62M3wUQK8kZCN3fCvvQ46L/qfNTxC/c340+oL6mJ2c6hGbjvbzW+4kO
   DjDtMGKpoyrCs4ui2gEc7NdYb4dBJOhXWh7qU0aR5+2krip9ul4jW1RMQ
   GAxrhfQerhJ+DTPT86v241yinKNsOflMTuIPSFZCinvn6Zg0XmPEw1/XH
   8czsgUKT8erS8+n60hQgkIiYCDVSgA4inkXGHylNuMptylPYQnHCksLLC
   w==;
X-CSE-ConnectionGUID: zuPi7u7xSKKc963P5tJZSw==
X-CSE-MsgGUID: /LcQU+tpT5+Kgu6vPY+ywg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47820839"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="47820839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 14:53:45 -0700
X-CSE-ConnectionGUID: Mkf8ztgqQCajrnXICabLjw==
X-CSE-MsgGUID: 3EkSe+qZTvKuk9CjuecOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="139893962"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 May 2025 14:53:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAyKD-00052T-1E;
	Fri, 02 May 2025 21:53:41 +0000
Date: Sat, 3 May 2025 05:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 01/23] drm/sched: Add some scheduling quality unit tests
Message-ID: <202505030526.st1Yq48K-lkp@intel.com>
References: <20250502123256.50540-2-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502123256.50540-2-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[cannot apply to tj-cgroup/for-next linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250502-203539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250502123256.50540-2-tvrtko.ursulin%40igalia.com
patch subject: [RFC 01/23] drm/sched: Add some scheduling quality unit tests
config: arm64-randconfig-004-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030526.st1Yq48K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030526.st1Yq48K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030526.st1Yq48K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/scheduler/tests/sched_tests.h:7:0,
                    from drivers/gpu/drm/scheduler/tests/tests_scheduler.c:8:
>> drivers/gpu/drm/scheduler/tests/tests_scheduler.c:611:10: error: initializer element is not constant
             drm_sched_scheduler_two_clients_attr),
             ^
   include/kunit/test.h:219:13: note: in definition of macro 'KUNIT_CASE_PARAM_ATTR'
        .attr = attributes, .module_name = KBUILD_MODNAME}
                ^~~~~~~~~~
   drivers/gpu/drm/scheduler/tests/tests_scheduler.c:611:10: note: (near initialization for 'drm_sched_scheduler_two_clients_tests[0].attr')
             drm_sched_scheduler_two_clients_attr),
             ^
   include/kunit/test.h:219:13: note: in definition of macro 'KUNIT_CASE_PARAM_ATTR'
        .attr = attributes, .module_name = KBUILD_MODNAME}
                ^~~~~~~~~~


vim +611 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

   607	
   608	static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
   609		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
   610				      drm_sched_scheduler_two_clients_gen_params,
 > 611				      drm_sched_scheduler_two_clients_attr),
   612		{}
   613	};
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
