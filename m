Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698C918CC1E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729376346; cv=none; b=AVx2JAhhWtDAyYpHfv3hbFLSQyNGzQYT0HO8V8pYjoJawcMIKrr7AYXy/5kBGxw64ry6f3cYJ5KseC7vgpzonXND5ivV0RH/7DUfSnVzIaEZjT4XPhV5Pan9iCXTmD1wHwoXO1hFjlBGcCTDiOYIkovXmvPilYp0lFkiAMDQwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729376346; c=relaxed/simple;
	bh=UA2YFNwhOJ0nlvkAu0WVPnFsj4+0m6yogC0a31XRUw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgnNaLB9pTEp0X34oZI+pkH4Gkt9LHx6GFbRc/6NmYj743Qar/GY1j23gG+XUQUMRXAFlm6Hy9T5fC6T0j3sG4jQ5ooitPYgs5kr4eR0tO/I177AyGGWxXqe9mkKxnlo2EKmYFwx9mietMztJu1YpQRVmdwntyN83Ux+YPd7kEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nekl3Tmo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nekl3Tmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729376344; x=1760912344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UA2YFNwhOJ0nlvkAu0WVPnFsj4+0m6yogC0a31XRUw0=;
  b=nekl3TmolyR0USAwY0etq+HNM/ElIq5BukZP1Jiqzzq2MEEW70Wh853k
   WE4xo89/1n+3vwL+vlGrMjtGww7NlWz5e0CXVvI76IW9pVCUR5sA6Gyp2
   p9ZvXW83rRUV5FyoXAe95FnleI7GTDqpC4TFkUQ0L0384uaAKbIuhtRsJ
   83RLMCnZVlsqJ3YQosRTmX7uEWMl1jx10j1cae80p8qGuA0VqGo0ohh+U
   unnBEpEjhjstXZwE4LYq1OIJa4vSBPeTSAmpY/VJ18upv3wOnYtUSpw6b
   U6y5yFLGom6di/sD/rPzlyNXWviTQYE/GWBDyVSfII9e2r81X7h5V+PBo
   g==;
X-CSE-ConnectionGUID: pjkIE0IiTZmbUjIn7M0DTA==
X-CSE-MsgGUID: jLQgRYhQTYWEn86Xbfb0jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28984539"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28984539"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 15:19:04 -0700
X-CSE-ConnectionGUID: 41GldZ6iSWOl5LbWUlOYzQ==
X-CSE-MsgGUID: XsC3OylqSf+VWyyR9+3KEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79186772"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2024 15:19:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Hmn-000Pbj-06;
	Sat, 19 Oct 2024 22:19:01 +0000
Date: Sun, 20 Oct 2024 06:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-10 18273/18276]
 mm/page_size_compat.c:326:9: error: 'sysctl_perf_event_mlock' undeclared;
 did you mean 'init_sysctl_perf_event_mlock'?
Message-ID: <202410200623.be7pr7Ig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-10
head:   8adecb593e9b745427da9d61c3cc8bc4857de209
commit: 90ffbf64df06674ed84c7b8a7016c02cd8ca0016 [18273/18276] ANDROID: 16K: Fixup perf_mmap check for metadata page
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241020/202410200623.be7pr7Ig-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200623.be7pr7Ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200623.be7pr7Ig-lkp@intel.com/

Note: the android-common/android15-6.6-2024-10 HEAD 8adecb593e9b745427da9d61c3cc8bc4857de209 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mm/page_size_compat.c: In function 'init_sysctl_perf_event_mlock':
>> mm/page_size_compat.c:326:9: error: 'sysctl_perf_event_mlock' undeclared (first use in this function); did you mean 'init_sysctl_perf_event_mlock'?
     326 |         sysctl_perf_event_mlock = 512 + (__PAGE_SIZE / 1024); /* 'free' kiB per user */
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         init_sysctl_perf_event_mlock
   mm/page_size_compat.c:326:9: note: each undeclared identifier is reported only once for each function it appears in


vim +326 mm/page_size_compat.c

   319	
   320	static int __init init_sysctl_perf_event_mlock(void)
   321	{
   322		if (!static_branch_unlikely(&page_shift_compat_enabled))
   323			return 0;
   324	
   325		/* Minimum for 512 kiB + 1 user control page */
 > 326		sysctl_perf_event_mlock = 512 + (__PAGE_SIZE / 1024); /* 'free' kiB per user */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
