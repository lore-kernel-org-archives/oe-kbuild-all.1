Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE3E21A931
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548195; cv=none; b=dP+l07zkO//XzRW946mnv3X/5kLbOB2WLqAzPvLpYsSKpyIZ/Ld8PBsI19bRMCFnZrQZWe1DWYSB9Vk2KfX+QuGWqueg9HIr9UCPlaiQ2xFnh4xmCIYHI6CaGYK98bg4ybXA8XQhwl/9GUvCRjhmJ1wUySVpOc3nQtR147EpuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548195; c=relaxed/simple;
	bh=y34S+d8WZvm8Zu/5uu6eGoIVsdJ8ZWOUIyg7hIYg0Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jse26nkgD1n8skeRbzv6l+H2ODwUp5OmiMkQFu2lakd3fL4K5BzK/9M3Q3uHzRZOGJJopnu6sp9sHPf1XnT5raLdU5cqhvSwxvQyXtlCxxSWk12dECAjS4s7OFDkFwHO55sR2PYd5T8y9kUO4+yeS2nmRggDSwEEmHixsS5QT+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3xVK2Ck; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3xVK2Ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754548194; x=1786084194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y34S+d8WZvm8Zu/5uu6eGoIVsdJ8ZWOUIyg7hIYg0Oc=;
  b=N3xVK2Ck2pIIiMPqpweL0tnLiD7NVsLfF8mW4MFohEolOiHPGVJghQsM
   JrBRI2wEEjARBspAx1j44/D1q7P5+v+5vppILDdVwXgP66Bi4ElU+z0IF
   CNa3xg+zH3Rm5CAc4VPPv+wWpOX0lT+GbFClqSTfw9qZoCg8gU43z48x3
   MNuCK7GQuQQGQazgInf4Eu5pkVq7RwN8tPRYPujtzIEgu6w4GErwLeKOq
   fIHfL+KtvPVEqT67Q4CdbIf+O+iEPmGO9+uk+UlnRUC4GEzY4HBSda1f5
   MABEs224Blc39XFWggyBTKZmFgyCKJhWyltHi1hp04slXL6JZeMPk0Gn9
   w==;
X-CSE-ConnectionGUID: Xt+r3TDjQu+hr6+sukxpiA==
X-CSE-MsgGUID: gVOONqSeRGi9AloF3G8lwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82319861"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="82319861"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:29:51 -0700
X-CSE-ConnectionGUID: ae0tlmdAS4mx/bpdpuY/HA==
X-CSE-MsgGUID: 6FS3vc4qThSbwOi4C3rrYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165391496"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2025 23:29:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uju8J-0002Sg-0a;
	Thu, 07 Aug 2025 06:29:47 +0000
Date: Thu, 7 Aug 2025 14:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/arch_timer_mmio 4/5]
 drivers/clocksource/arm_arch_timer.c:1083:34: warning: 'arch_timer_of_match'
 defined but not used
Message-ID: <202508071417.nnMhOekL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/arch_timer_mmio
head:   4b341bbc18d791b6c5a6bc373d303c4d3b35434a
commit: d094e2d0772b8f22c47c9d3e7ab908c82ade83bf [4/5] clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250807/202508071417.nnMhOekL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071417.nnMhOekL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071417.nnMhOekL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/arm_arch_timer.c:1083:34: warning: 'arch_timer_of_match' defined but not used [-Wunused-const-variable=]
    1083 | static const struct of_device_id arch_timer_of_match[] __initconst = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/arch_timer_of_match +1083 drivers/clocksource/arm_arch_timer.c

8a4da6e36c582f Mark Rutland 2012-11-12  1082  
220069945b298d Stephen Boyd 2013-07-18 @1083  static const struct of_device_id arch_timer_of_match[] __initconst = {
220069945b298d Stephen Boyd 2013-07-18  1084  	{ .compatible   = "arm,armv7-timer",    },
220069945b298d Stephen Boyd 2013-07-18  1085  	{ .compatible   = "arm,armv8-timer",    },
220069945b298d Stephen Boyd 2013-07-18  1086  	{},
220069945b298d Stephen Boyd 2013-07-18  1087  };
220069945b298d Stephen Boyd 2013-07-18  1088  

:::::: The code at line 1083 was first introduced by commit
:::::: 220069945b298d3998c6598b081c466dca259929 clocksource: arch_timer: Add support for memory mapped timers

:::::: TO: Stephen Boyd <sboyd@codeaurora.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
