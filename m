Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22699802
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 01:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737162182; cv=none; b=VJD+VnHoG81o1Cw+r+GxJNEcwfL5Uey2Mc+ndGuF50mUDvSGQI9BvHa6CvlT4+ify0LxIF4IdHIPRyJ9y/Q67B4ZJpsK1y97zLjorB3iVm/7njoyu1VAybPIu4k2zwoNTh+283kAqeZ4t8sgMxc9v4zDBNTJ9kY3qF+BXMp/PDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737162182; c=relaxed/simple;
	bh=qtmo58OBdDkOcNYGMJbB5crbE2RIJm6boBaQDmaAE3I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOryIbgSuR6vPG4Xood53sPXOYXtWqBunqX1s6wsqh7TzwMffu9Bm3WvsolqeNt9vNH1PgYVcuFCvWJ8MVr0uhjQ/EKMkDG02DGJyZpp/PRTj7JmtxrvdkDBSiyKyRtPRSDWfn9Ahx9Je2LofaRWiv26fTlGoleJNaeU0oyl40c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qv797+tY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qv797+tY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737162180; x=1768698180;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qtmo58OBdDkOcNYGMJbB5crbE2RIJm6boBaQDmaAE3I=;
  b=Qv797+tYVX8ZIsXO/SwX9INZtIgQbAGLRQe4sF9ZiKU5IvPxHNB1aGon
   bQiEhAad6++58HPiVTnXqGY5BOLNea3NBXK5rmy3+msJQiEmcWlbhRAU/
   NR+huJ8azjDNWenGWZvwmKRbZKBzz7tSrngU8iH241pQz3WvXIp5HqY9k
   UwbXzYdO9FvnGsyOwN85yJVOdaTaz/u0iicMaSbbRzDkHzn71u6Y4vF8w
   SjeAcaN8BDEW3a/9uVcxzLLwsH0Nk/vzT1EGY/L5hIKd3N2RDufV0qOx5
   yQyF6RiovlCX9UOVWWMpYNhCdbLvSjPcoYpfnCSHnR38u6xe//gx+LELD
   A==;
X-CSE-ConnectionGUID: pzv02IBdQ8GtmsE6KN9qfQ==
X-CSE-MsgGUID: e2fi1OgZSp6Y198FnyzoHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36884559"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="36884559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 17:02:59 -0800
X-CSE-ConnectionGUID: IMmneggeRYSD7/ez7lAFqA==
X-CSE-MsgGUID: hvqnbpezS2KWbVv4yP9VzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143234244"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 17:02:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYxEm-000Tu6-0K;
	Sat, 18 Jan 2025 01:02:56 +0000
Date: Sat, 18 Jan 2025 09:02:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>,
	Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.12/linux 0/25]
 drivers/gpu/drm/i915/display/intel_vblank.c:319:13: warning:
 'intel_vblank_section_exit_irqf' defined but not used
Message-ID: <202501180817.NDs7VHY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   e5247e8df469b81bea0d59bde9faf0e99e3bb259
commit: 8bfed71f32b0e6287f1de5c8e8984f660be856eb [0/25] drm/i915: Use preempt_disable/enable_rt() where recommended
config: i386-buildonly-randconfig-001-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180817.NDs7VHY7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180817.NDs7VHY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180817.NDs7VHY7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_vblank.c:319:13: warning: 'intel_vblank_section_exit_irqf' defined but not used [-Wunused-function]
     319 | static void intel_vblank_section_exit_irqf(struct intel_display *display, unsigned long flags)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_vblank.c:312:13: warning: 'intel_vblank_section_enter_irqf' defined but not used [-Wunused-function]
     312 | static void intel_vblank_section_enter_irqf(struct intel_display *display, unsigned long *flags)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_vblank_section_exit_irqf +319 drivers/gpu/drm/i915/display/intel_vblank.c

   311	
 > 312	static void intel_vblank_section_enter_irqf(struct intel_display *display, unsigned long *flags)
   313		__acquires(i915->uncore.lock)
   314	{
   315		struct drm_i915_private *i915 = to_i915(display->drm);
   316		spin_lock_irqsave(&i915->uncore.lock, *flags);
   317	}
   318	
 > 319	static void intel_vblank_section_exit_irqf(struct intel_display *display, unsigned long flags)
   320		__releases(i915->uncore.lock)
   321	{
   322		struct drm_i915_private *i915 = to_i915(display->drm);
   323		spin_unlock_irqrestore(&i915->uncore.lock, flags);
   324	}
   325	#else
   326	static void intel_vblank_section_enter(struct intel_display *display)
   327	{
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
