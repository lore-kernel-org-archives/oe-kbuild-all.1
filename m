Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A917BB32
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735905844; cv=none; b=shRYQAbJEJBfjzKUcMabkJnuWmwmlOK7/YF+ZxOYs4tQY2/eFeAntBCrBQc9+ShsCHKGr/CgV5n5ak231zGKonEoEs7ua/CfScF618JGb18z1ohqMkAnoeDwbyGDroyG/PLLwl65hyrDwNEEU0a7rpKYJ2mwy7rEDyC4O/kgVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735905844; c=relaxed/simple;
	bh=/6GmG8dFrYaGA59+Z8LUwDsleCPK/8W7WE/lIk9og0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtSV2gmWt+C9xRXKaFIiOwLt7IkAbPRBSkmr8RTMjBbR+bREsfSdlxp2trvxGNTOVO1ieq9Raizd8qxW33xePfl6DjVPIEYAGStZmYsn3Z3iMQZ2bm3FYH2aXL4m4/GiP+eiG20owIKGAHS8a+Jl/1qdXW5KLlFiIbjjZDbyo04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJTeBtvk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJTeBtvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735905841; x=1767441841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/6GmG8dFrYaGA59+Z8LUwDsleCPK/8W7WE/lIk9og0Y=;
  b=VJTeBtvkzVITaXrqMgdJ9RCxj0NxqjOWMStou3mywb4QenvpqPkADiwK
   KU5WC9qZQ2RzwyaY8WNU1xcg8u5bvjtKgdv3KkoOz5noxVkAxPiJmklUE
   fiZXyR3a6viIXTMdCRs5Flrwf4xVfx1X6QlIE1qQ/T+ar4OhV6zsMDYvs
   N9iMUHTbuPNi72mT0bNL7macb9H8dlJNJWGhrIwE192GEFmMUd7ut6rCX
   A9bcmF7WEJvjPZPBtERu/hiBJUdUeUutpetWt21nSiFgQLsrIgneVnk+K
   mxfCWc6K6A/voE+PGrpr7UgWirFa3J7UHDuhd+Mfd9jzM5B395o+rQtsn
   A==;
X-CSE-ConnectionGUID: poAjjzN+QTmknXqXHkTSvg==
X-CSE-MsgGUID: P+HdZ36CR2eBenQCjVQq8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39920328"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39920328"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 04:04:01 -0800
X-CSE-ConnectionGUID: LthNcco0QBeJ1GmKqERxnA==
X-CSE-MsgGUID: VAW3FI5LT++LxlhaPZ2cig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101645628"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 04:04:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTgPF-0009hV-2s;
	Fri, 03 Jan 2025 12:03:57 +0000
Date: Fri, 3 Jan 2025 20:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line:
                                            for a KUnit test
Message-ID: <202501032001.O6WY1VCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: caa714f86699bcfb01aa2d698db12d91af7d0d81 drm/tests: helpers: Add helper for drm_display_mode_from_cea_vic()
date:   9 weeks ago
config: csky-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20250103/202501032001.O6WY1VCW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032001.O6WY1VCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032001.O6WY1VCW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line:                                            for a KUnit test


vim +324 drivers/gpu/drm/tests/drm_kunit_helpers.c

   321	
   322	/**
   323	 * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC
 > 324						   for a KUnit test
   325	 * @test: The test context object
   326	 * @dev: DRM device
   327	 * @video_code: CEA VIC of the mode
   328	 *
   329	 * Creates a new mode matching the specified CEA VIC for a KUnit test.
   330	 *
   331	 * Resources will be cleaned up automatically.
   332	 *
   333	 * Returns: A new drm_display_mode on success or NULL on failure
   334	 */
   335	struct drm_display_mode *
   336	drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device *dev,
   337					    u8 video_code)
   338	{
   339		struct drm_display_mode *mode;
   340		int ret;
   341	
   342		mode = drm_display_mode_from_cea_vic(dev, video_code);
   343		if (!mode)
   344			return NULL;
   345	
   346		ret = kunit_add_action_or_reset(test,
   347						kunit_action_drm_mode_destroy,
   348						mode);
   349		if (ret)
   350			return NULL;
   351	
   352		return mode;
   353	}
   354	EXPORT_SYMBOL_GPL(drm_kunit_display_mode_from_cea_vic);
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
