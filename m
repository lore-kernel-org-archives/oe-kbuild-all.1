Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C128373
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 03:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739848134; cv=none; b=uc3nNKZK3u8vhvNd2FS3kcX/4I/1wyozYintEHKxqfaRWbrULXCmdduokam7afyeUSjD+GZfZOAm8z+Lnw3koRgHtDt+XJNN6XlCoS186osWinJlCKqrSEf8DbqdK+wXzc2gKR+lY4ulBL7ibeUY+b0zboKNVBRqDRne03zjGWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739848134; c=relaxed/simple;
	bh=rR4ZeBmlVwjAcB2wYbs5R8VxmKXxiA++oauyLLyhveg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWHdZBaNuy90JIPm5p8XAKpv0wTaN1injlU9+yNG9hzdWyLb97hJVP6PjEE8rLSM59ensuUcajrIGmmZGnkPGsKIXwGHnDs8syiA6mMZEGnzGckMkreQgeqrAYW/b03Avf7q9HX01afeGDl8W+RrQgDQpMS/HVOfOc+g6QKFtxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfLEDDMx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfLEDDMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739848133; x=1771384133;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rR4ZeBmlVwjAcB2wYbs5R8VxmKXxiA++oauyLLyhveg=;
  b=EfLEDDMxNF8+QLuC51gZmwLq5O3bpFyVwYvrHPapa3vkj3PfgU/8RzDi
   gP1wzBCSzg1sK04vSwJEgBncmrRTrfrecL6NX2pv2lVFDzXEDkgpX6B6Y
   m9fW3d/J35iW4EV+aaswFpMTagjMm7uRDmzHA6+CXqSkCB82tI3fAdMax
   5fxGlbl+rb6ou04kYA3Y+JqCrCSY5cJIYfncmJIKPz6dUkdyKUr3WuOV5
   Hav/enT5bopphAxEh61T4tHhs97tl7Kh5zVFboEZiqPCI8/5rJWT8y/wn
   39T69aS37R0VZLNUw2SeldpzW8g7rBJ5TtYlGLAWmwn1iCsIQelGJR2An
   Q==;
X-CSE-ConnectionGUID: 6ANQPWU6RuW6UQJG6SQckw==
X-CSE-MsgGUID: 6hCaC/92SC+TnBPiVSQ7lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51963794"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51963794"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 19:08:52 -0800
X-CSE-ConnectionGUID: z3P9/EXoQTymNzSQaikH2Q==
X-CSE-MsgGUID: badm4eqTSJONDJMGUBX5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151463790"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 19:08:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkDyI-00006x-27
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 03:08:40 +0000
Date: Tue, 18 Feb 2025 11:08:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1]
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c:107:46: warning: variable
 'new_crtc_st' set but not used
Message-ID: <202502181112.tNDSWt3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi james,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 42c729418d9ce8f212ee691a8a91d93bfe9f34de [1/1] drm/komeda: Add komeda_kms_check
config: x86_64-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250218/202502181112.tNDSWt3h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181112.tNDSWt3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181112.tNDSWt3h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/arm/display/komeda/komeda_kms.c: In function 'komeda_kms_check':
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:107:46: warning: variable 'new_crtc_st' set but not used [-Wunused-but-set-variable]
     107 |         struct drm_crtc_state *old_crtc_st, *new_crtc_st;
         |                                              ^~~~~~~~~~~
>> drivers/gpu/drm/arm/display/komeda/komeda_kms.c:107:32: warning: variable 'old_crtc_st' set but not used [-Wunused-but-set-variable]
     107 |         struct drm_crtc_state *old_crtc_st, *new_crtc_st;
         |                                ^~~~~~~~~~~


vim +/new_crtc_st +107 drivers/gpu/drm/arm/display/komeda/komeda_kms.c

   102	
   103	static int komeda_kms_check(struct drm_device *dev,
   104				    struct drm_atomic_state *state)
   105	{
   106		struct drm_crtc *crtc;
 > 107		struct drm_crtc_state *old_crtc_st, *new_crtc_st;
   108		int i, err;
   109	
   110		err = drm_atomic_helper_check_modeset(dev, state);
   111		if (err)
   112			return err;
   113	
   114		/* komeda need to re-calculate resource assumption in every commit
   115		 * so need to add all affected_planes (even unchanged) to
   116		 * drm_atomic_state.
   117		 */
   118		for_each_oldnew_crtc_in_state(state, crtc, old_crtc_st, new_crtc_st, i) {
   119			err = drm_atomic_add_affected_planes(state, crtc);
   120			if (err)
   121				return err;
   122		}
   123	
   124		err = drm_atomic_helper_check_planes(dev, state);
   125		if (err)
   126			return err;
   127	
   128		return 0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
