Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6A303C8D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624839; cv=none; b=nVwzOxF1ZE5+J5fwb1BOOXm11GohcHc/4yl/4Xyjy6uyDR9eaK6zo2h3nDo4+2Nr/sZm34xTveqnHk3Zzopstczpt3IsL1qxQ8m6Ey0SmC72UsRExwwAdejii+GJUrQQZ71E/DBOZkVHj7+EhSBWqJ4sea3xgxAvDefP4euyoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624839; c=relaxed/simple;
	bh=PnBicRCA92laoSvPT50Y5NeQix7Zxgj4DC8ex4ufvjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4P5jf196wPbcgGpOpRqWmAZopuJzYZX24/Lf2ELNVapOkKgdwMIAhtzfkW5HYK54kYuzt++K6JtnHLnMgOo01L2Vrja4iYksFIDYKMgIcSdwwaDp+fbNCWzoCVwqEOuwt4CKKBN1Y6ybUQuqhkqaikq6hyOWTwiAf8MySxSyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XImDmMHd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XImDmMHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765624837; x=1797160837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PnBicRCA92laoSvPT50Y5NeQix7Zxgj4DC8ex4ufvjY=;
  b=XImDmMHdJhehXmmC5w35F4LGnxpSmqAVnEuFhDjJAcH4BDW6/dsHfOXl
   uFYkX0s9/KL1hKMvFEzjKdRYRJEQ/sZ9kTvXAcvvszD/uRgX2XFkmzR/q
   1rilSKZ1Agc8BqgPlEK+L0J7qAn1oXbnvaJ5jqhYvlIw8AM3OpCXTM842
   tG2Nat9zP+8Xui2p1hiSdV/+dB2z5gjyDOaw2Y8cRG2MEOdtNMOrdlA4M
   w1hNV48M7UB1h9RTs9Qz2SxwdmsRF0kXc3udayx2DCGyBx5WTAERHs5rq
   /Cbi8zUIfkw8hDvb/a5qkz3ML/aDG2E/s7ka2VJCjRZ5fdjDjgY19DTwV
   g==;
X-CSE-ConnectionGUID: 89ICPjtlQ8WsHcPzNcqhVg==
X-CSE-MsgGUID: t3gZLrXXSJWS/SAAqm9wGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78979785"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78979785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:20:35 -0800
X-CSE-ConnectionGUID: WqlFSmu/R0+571l1uNoY8A==
X-CSE-MsgGUID: Z5hUUSW1TCSoaPu4g3hSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201478719"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 03:20:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNfq-000000007Xd-3Y80;
	Sat, 13 Dec 2025 11:20:30 +0000
Date: Sat, 13 Dec 2025 19:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [CI-ONLY PATCH v2 11/12] PREEMPT_RT injection
Message-ID: <202512131847.zWdP8WbV-lkp@intel.com>
References: <20251212143504.973839-25-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212143504.973839-25-dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master next-20251212]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-i915-display-Fix-intel_lpe_audio_irq_handler-for-PREEMPT-RT/20251213-023952
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251212143504.973839-25-dev%40lankhorst.se
patch subject: [CI-ONLY PATCH v2 11/12] PREEMPT_RT injection
config: x86_64-buildonly-randconfig-005-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131847.zWdP8WbV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131847.zWdP8WbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131847.zWdP8WbV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'alloc_kmem_cache_cpus',
       inlined from 'do_kmem_cache_create' at mm/slub.c:8625:7:
>> include/linux/compiler_types.h:602:45: error: call to '__compiletime_assert_751' declared with attribute error: BUILD_BUG_ON failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH * sizeof(struct kmem_cache_cpu)
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:583:25: note: in definition of macro '__compiletime_assert'
     583 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:602:9: note: in expansion of macro '_compiletime_assert'
     602 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   mm/slub.c:7657:9: note: in expansion of macro 'BUILD_BUG_ON'
    7657 |         BUILD_BUG_ON(PERCPU_DYNAMIC_EARLY_SIZE <
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_751 +602 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  588  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  597   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  599   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  600   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  601  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @602  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
