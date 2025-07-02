Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D81531C1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 04:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751429988; cv=none; b=jnuByFiYuEESFNhfEUD5SZO3xR3i5nAaAvHoPOsoQTZ5W9EKs0W8wEw11Y04nRmMAwcWPCZ2DU2uxH59q3IsQ7iuAm2yoEJgqw1C9IzDJ1Q+NXgNXKxXOFyYVXuFpJGWTZMR0XZF4I/tNZRXbhsHffkqhTPx4NtnpWQqgIxE/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751429988; c=relaxed/simple;
	bh=1FDkYTnUHRB1dLQ3RHeFsu9icXXfrvI3oeYUF83pw9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9wTpAGifYSt2kCfrpIXhgmnj+sovvA9MaNfjIxnjGiO4SarR54EcBM8YBoJWnT/S2B9SIO2KHfpZ9DjwG1ftjUdGFofAdRSK9Gs1rtmZh6YqYAgGhjDYqKsJ9iWjG9HWogKvnDqzLSQ3PUzNaPCMTrU00s8MriQhFcNcLqJRs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUzmxuMf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUzmxuMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751429987; x=1782965987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1FDkYTnUHRB1dLQ3RHeFsu9icXXfrvI3oeYUF83pw9Y=;
  b=NUzmxuMfeHbP9z3Y7VtDYeOkM18gS9/qDTZu8kJXOSsiiCFvi/UMI4VT
   C1e7k0QHgfRiMDXXaVSQl176fWmNZMfvxEgdVs90LyeQ3kIWUT6HyFGN4
   Hw1CqjfLqNB8h54o7Rmt3rAVerNmxQi8T/iqv6vfZyZ52OZoYfDzcmNNO
   Jf+HzDsU1F6V5YAoV5mbXvjLkE1e5WjwI80IfSm/6kK20M4y0i9TytqJK
   uRkPUpsQqPrTtvCkJIOwr2vxHKO+Jxx4oXy9tOltes9Eh2nlfgtu1NEp6
   4BlOpc6GauPJD4yDoQIt9jHzXAmrZGUGX23Wyt9Wi+/pnz9qEreP9ASZI
   A==;
X-CSE-ConnectionGUID: aAWXON4rSfiwz9ZP8yPXLg==
X-CSE-MsgGUID: ZPdT0CUgSMmuASpEsYR6cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53428867"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="53428867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 21:19:13 -0700
X-CSE-ConnectionGUID: dLCEmO3lSDSep2ARlZ+ZBw==
X-CSE-MsgGUID: UO3FWCHOSvC5OeMZBYZelA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="159478103"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2025 21:19:11 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWow9-0000Dh-1p;
	Wed, 02 Jul 2025 04:19:09 +0000
Date: Wed, 2 Jul 2025 06:18:52 +0200
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 3963/6384] drivers/gpu/drm/xe/xe_pcode.c:342:
 multiple definition of `intel_pcode_read';
 drivers/gpu/drm/i915/intel_pcode.o:drivers/gpu/drm/i915/intel_pcode.c:278:
 first defined here
Message-ID: <202507020633.Qbnj6PRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f804361f3b9af33e00b90ec9cb5afcc96831e60
commit: d9465cc8ac2dd36264c274d4e6c99437276c64c8 [3963/6384] drm/xe/pcode: add struct drm_device based interface
config: x86_64-randconfig-2006-20250702 (https://download.01.org/0day-ci/archive/20250702/202507020633.Qbnj6PRQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020633.Qbnj6PRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020633.Qbnj6PRQ-lkp@intel.com/

Note: the linux-next/master HEAD 3f804361f3b9af33e00b90ec9cb5afcc96831e60 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_read':
>> drivers/gpu/drm/xe/xe_pcode.c:342: multiple definition of `intel_pcode_read'; drivers/gpu/drm/i915/intel_pcode.o:drivers/gpu/drm/i915/intel_pcode.c:278: first defined here
   ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_write_timeout':
>> drivers/gpu/drm/xe/xe_pcode.c:350: multiple definition of `intel_pcode_write_timeout'; drivers/gpu/drm/i915/intel_pcode.o:drivers/gpu/drm/i915/intel_pcode.c:285: first defined here
   ld: drivers/gpu/drm/xe/xe_pcode.o: in function `intel_pcode_request':
>> drivers/gpu/drm/xe/xe_pcode.c:359: multiple definition of `intel_pcode_request'; drivers/gpu/drm/i915/intel_pcode.o:drivers/gpu/drm/i915/intel_pcode.c:293: first defined here


vim +342 drivers/gpu/drm/xe/xe_pcode.c

   339	
   340	/* Helpers with drm device */
   341	int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
 > 342	{
   343		struct xe_device *xe = to_xe_device(drm);
   344		struct xe_tile *tile = xe_device_get_root_tile(xe);
   345	
   346		return xe_pcode_read(tile, mbox, val, val1);
   347	}
   348	
   349	int intel_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
 > 350	{
   351		struct xe_device *xe = to_xe_device(drm);
   352		struct xe_tile *tile = xe_device_get_root_tile(xe);
   353	
   354		return xe_pcode_write_timeout(tile, mbox, val, timeout_ms);
   355	}
   356	
   357	int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
   358				u32 reply_mask, u32 reply, int timeout_base_ms)
 > 359	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
