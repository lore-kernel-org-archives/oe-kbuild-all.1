Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1C1378
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 01:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706406674; cv=none; b=JqlAYgYzt3UPiSw/5yfapOQyVdjnxqx/vB+KIIlgmHZ94/DqOTBlmXvbrHfoD38Tv4kX67t8hVDvrMJ1VshvTO73c5+imUVFvEI0dkaUVl6XdfEAEU+Z2ak5ZJ3xY8HC2G+aZwTtpbtX4aY14cvf9H9LOHHi4yfe9fVBusyWxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706406674; c=relaxed/simple;
	bh=ANHgGjbGSQNnSfnzZo1SEeldJCLiz9fZW7oyiso+44c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=miSJtnUv1iGHw9p7kL8eD1XKev8Jf8ckxnSWm/79KQPQmESwxPIa+sIJt6Yawll9W7C3pZN8CLgeFkFz9sStFVumnUryOazP462H5j131BVGm0m79A3EBWY/wCLXoKrg9whUyqW4ZLQVyFtrrILkYykXvQNmOa8H1QMZYpFJmYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay4xGS4V; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay4xGS4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706406672; x=1737942672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANHgGjbGSQNnSfnzZo1SEeldJCLiz9fZW7oyiso+44c=;
  b=Ay4xGS4VYOcn0fbWeJbzaMa8N97LqFhDznMumtXm9YTrIgzoIR/DYAPS
   aWKg3zSCKOwyQwPgiRMkCJzJoEQzzrY702hxTrTrNImz9ayb6L95sUsNv
   zGswey2HI8fFNnpWPEgtCEGx0d0xiuezHPoeBX49CS5pKJeHvDpIcoKsz
   yXZL4/7b7qMkSBYiCpUYtK9l2zx/vB/HkhxxPLuJEX1yu39O4OHOcALWx
   F75bf0klhIQfeMFOWaumsBwiynk16LGLeoREhaba7j/I0cyFWzIAKCq49
   rktxwKIsqVEhweGmGvphBi9CcwTQzm/TYAhy5POcm/Uv4oJtXzLAsPxgP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2596798"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2596798"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 17:51:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29172628"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jan 2024 17:51:11 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTuKB-0002y8-2y;
	Sun, 28 Jan 2024 01:51:07 +0000
Date: Sun, 28 Jan 2024 09:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [rt-devel:linux-6.8.y-rt 63/96]
 drivers/gpu/drm/i915/display/intel_vblank.c:284:9: warning: assignment makes
 integer from pointer without a cast
Message-ID: <202401280917.EEXjwpBy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.8.y-rt
head:   ff2361c71bd48a300cf147f5ffa6cd0f67135879
commit: 722e48bb3059ead4fcf48804b314d165a7609029 [63/96] drm/i915: Use preempt_disable/enable_rt() where recommended
config: x86_64-buildonly-randconfig-005-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280917.EEXjwpBy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280917.EEXjwpBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280917.EEXjwpBy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_vblank.c: In function 'intel_vblank_section_enter_irqsave':
>> drivers/gpu/drm/i915/display/intel_vblank.c:284:9: warning: assignment makes integer from pointer without a cast [-Wint-conversion]
     *flags = NULL;
            ^
   drivers/gpu/drm/i915/display/intel_vblank.c: In function 'intel_vblank_section_exit_irqrestore':
   drivers/gpu/drm/i915/display/intel_vblank.c:295:3: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
      ;
      ^


vim +284 drivers/gpu/drm/i915/display/intel_vblank.c

   267	
   268	/*
   269	 * The uncore version of the spin lock functions is used to decide
   270	 * whether we need to lock the uncore lock or not.  This is only
   271	 * needed in i915, not in Xe.
   272	 *
   273	 * This lock in i915 is needed because some old platforms (at least
   274	 * IVB and possibly HSW as well), which are not supported in Xe, need
   275	 * all register accesses to the same cacheline to be serialized,
   276	 * otherwise they may hang.
   277	 */
   278	static void intel_vblank_section_enter_irqsave(struct drm_i915_private *i915, unsigned long *flags)
   279		__acquires(i915->uncore.lock)
   280	{
   281	#ifdef I915
   282		spin_lock_irqsave(&i915->uncore.lock, *flags);
   283	#else
 > 284		*flags = NULL;
   285	#endif
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
