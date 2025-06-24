Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270A2248F64
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750430; cv=none; b=otjIVoUDXPf2UDb5naMie4wwR89UjuQAiMmDTgS6FFiK81V4+/gg2Ilvsm17m79HxM7ZD6oRMCI+Rci+SV7epq6+kDU4AY5WcWWxSN722VpqfIxUowzUszWQ/rwGEC8n6ulshvZ+QlcMwSd9iZ3oby7DRsY20TNcVhfPuo81xLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750430; c=relaxed/simple;
	bh=PKV9c/lsGQc1Lfg8W9yxKSsMGfV1QfYb+yKQY/6y6uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpFTH/fS4OsH7NN/G+9xOZSfFpUhm7Hdd0pX0lHq4+FLVe63caZMRS9j218ve0M0czRnaxkVWth2ccI5YrnFwNVuXm0LByGmzO8wTtLMYStHu3TYnHGuTGZW7jyauOxGPHFyg/tHoZkG3lbibz2oEpsqpb1I6+mQZMp+diKOKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mro7t4WO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mro7t4WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750750428; x=1782286428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PKV9c/lsGQc1Lfg8W9yxKSsMGfV1QfYb+yKQY/6y6uc=;
  b=Mro7t4WO8nRfbo/dLxu0BzrYxAji6PnkAHzN7iEHS1TVUTvJbOSIWrsv
   lQlMUGPajPmdeaMjNLP8AOizsE6GbJ+mEuaU0s/nc2bMt0a3yuc6B1z9S
   GMHaW/Mlvult17bWIdTj+jjAsNj5ZOXwP8W1m+sbw71Che3o7RY8uJpP4
   234dnOaZkN/YPVbYQ99/B+pcof6rYpZ9oURk328acABdo+h9BHZU7NiXm
   8U6OEU9czhlMZDW6z01v9/J+t9WgQ3EwzB/kFhSMMWqW/Avdxvbilgh9E
   O6ecxECgH+fyw4x68fZ7kfS7seYB4PZO9FnfWMWTQ1bnc87Hg28Bnn/Jk
   Q==;
X-CSE-ConnectionGUID: rbhWWndHTaG8reQ9dwUdpQ==
X-CSE-MsgGUID: p/EtNExqQ5yPa9v9f1vQIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70547319"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="70547319"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 00:33:47 -0700
X-CSE-ConnectionGUID: qvT++gUTSrGUu7p13G5RMQ==
X-CSE-MsgGUID: LAt0UfglSIeUb7XCr0jgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157336325"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2025 00:33:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTyA3-000Rry-0d;
	Tue, 24 Jun 2025 07:33:43 +0000
Date: Tue, 24 Jun 2025 15:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH v5 14/16] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
Message-ID: <202506241518.ufRm4IS8-lkp@intel.com>
References: <20250623122746.46478-15-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623122746.46478-15-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20250623]
[cannot apply to linus/master drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250623-202942
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250623122746.46478-15-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v5 14/16] drm/sched: Remove FIFO and RR and simplify to a single run queue
config: i386-buildonly-randconfig-002-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241518.ufRm4IS8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241518.ufRm4IS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241518.ufRm4IS8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/scheduler/sched_rq.c:96 Excess function parameter 'ts' description in 'drm_sched_rq_add_entity'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
