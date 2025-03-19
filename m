Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDC35972
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742366217; cv=none; b=DQWOkO80T+JXEujtyj6yge+zwr+nDOfAV0nNCCKAG/FBoCdriLPgwf1L1MRBKZMwQBBFnNgxHVjg582zvwAqeUQFnJxYlGjb/kTQ/Wn/GxUpj2t6DJUOxRXaOqk7ghV2n97j75P3SRLO1NEwZC7q2ADA6tj4GexnzpJ/h7SVYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742366217; c=relaxed/simple;
	bh=z/EyujpUWB6e9vl1ZeuIwZKyB33HIjfRY8kugGydtIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1Pj2gQEnm5b7+KHUySVjQNEPnc+0PxusDy5T4iMyRCCvt7Mkf+nu/t4ig1gM9SbQBDtPCt4zbb9erh262OTNpi6ju4xeqHeQqxAFJPbfl1cExPGsJiHKbKWwaL8MQN7Fmrx/TIU7DkYsB7pSpF5xGpyNGC63b1IfCe6ta5dCBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQODUKdL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQODUKdL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742366215; x=1773902215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/EyujpUWB6e9vl1ZeuIwZKyB33HIjfRY8kugGydtIg=;
  b=YQODUKdLI7parES5zly4hd40cjJ1GjWj6a2FPL3KcOIlQdJz5fO8kHai
   iPiVf8QPVFw7BaezX5MzUwHCJO+poNWycd1AZFobmJCuD0uqf561EUMG2
   KtIsUht8qCkEsUrMyxHm0lSEWb1mxoZwHS9lmLwdI2P3PBkMI4hMPNsUt
   xTZE2vWVk7VYZ8apojk2FlLDd3GO/r/dQD8wWI+FgnOY8UpsJ/j4fv6Vk
   AJAvFLHskACbAFDMGsL3xspDmw1Yw1Y9Cpv+GegeIxqyDBDMK2KHIvhg0
   3s9iTueBgrqNDuTeDN1u4fLL7Shs0c4Vj2S/BiYkK4GipHyyXIF3QJcQA
   g==;
X-CSE-ConnectionGUID: ylAoOzwiQUWxJxFKE5RtWw==
X-CSE-MsgGUID: Iw/E7+WTS9yYDfx0Jg4Vtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43429079"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43429079"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 23:36:53 -0700
X-CSE-ConnectionGUID: UmUmf/pjSuCDXcCe6bcFMw==
X-CSE-MsgGUID: X6RJFmKaQWS1wPS+bYc0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122416675"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Mar 2025 23:36:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tun2n-000ERH-0V;
	Wed, 19 Mar 2025 06:36:49 +0000
Date: Wed, 19 Mar 2025 14:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.14-rc7 57/57] kernel/sched/fair.c:91:50:
 error: initializer element is not constant
Message-ID: <202503191448.0ta1SveL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.14-rc7
head:   4b6c591051a5416e5e26f5a78c3bf6ddc7fd20e9
commit: 4b6c591051a5416e5e26f5a78c3bf6ddc7fd20e9 [57/57] linux6.14.y-bore5.9.6
config: arm64-randconfig-001-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191448.0ta1SveL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191448.0ta1SveL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191448.0ta1SveL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:91:50: error: initializer element is not constant
    __read_mostly uint sysctl_sched_base_slice     = nsecs_per_tick;
                                                     ^~~~~~~~~~~~~~


vim +91 kernel/sched/fair.c

    80	
    81	/*
    82	 * Minimal preemption granularity for CPU-bound tasks:
    83	 *
    84	 * BORE : base_slice = minimum multiple of nsecs_per_tick >= min_base_slice
    85	 * (default min_base_slice = 2000000 constant, units: nanoseconds)
    86	 * EEVDF: default 0.75 msec * (1 + ilog(ncpus)), units: nanoseconds
    87	 */
    88	#ifdef CONFIG_SCHED_BORE
    89	static const unsigned int nsecs_per_tick       = 1000000000ULL / HZ;
    90	unsigned int sysctl_sched_min_base_slice       = CONFIG_MIN_BASE_SLICE_NS;
  > 91	__read_mostly uint sysctl_sched_base_slice     = nsecs_per_tick;
    92	#else // !CONFIG_SCHED_BORE
    93	unsigned int sysctl_sched_base_slice			= 750000ULL;
    94	static unsigned int normalized_sysctl_sched_base_slice	= 750000ULL;
    95	#endif // CONFIG_SCHED_BORE
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
