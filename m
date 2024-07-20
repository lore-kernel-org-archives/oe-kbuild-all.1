Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7072BD0D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721504872; cv=none; b=ZxntsX+reEThLUgsfhdRW/cIKepMKpxC/wXgVrePUORapwzW3SiAe13QnqY4Of9VTaSJGxOGw7D/bidjSfTPHL8LKcg3IPQEcC7xqCJovPEta6r7Xs168qB1vXnQ8HyVlRZC85uSgFx5h6gP1WbLESX8FEUe6OrTrBp50mGSMHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721504872; c=relaxed/simple;
	bh=dU3MdKQmXUX8ZYEDKVY5SPwiWmCgrwiV7koeOrmzWws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+XThmiyttUCtW3DuAkwqR2nVqK/eS2pKFBL9OljapwuNE1oMoMOrS7UvkkiOxkl5YUkAxVGmj+uhQqDLRQ7rtXOQse9MUSolaoWvvgukRm+PcZGSazkX7vNqtqmMtbBdW2ebj4hdqQh/AQlmg5zxAsY8bMGQ/VSFYFD11cC3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYR/SWDY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYR/SWDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721504870; x=1753040870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dU3MdKQmXUX8ZYEDKVY5SPwiWmCgrwiV7koeOrmzWws=;
  b=jYR/SWDYGI5/XlD8jTroA+1uoUxOWSrrAmaw06FSm0oUV61R0y8/4lls
   NJctgIU03MixHUcsXo8Jz7CnXAKMZjDFATfn7n36mvoHps1l4V2vASgHC
   uySyzhh73v2wC7dGWNY8tPsx6qUa9aItvfRwXoQqpbPgoIoF/DEluUWUN
   QiCLcNR8wXHHedUfnEqMjfE9kFttuX13wnUKMVtlTlGAeHykZ6qKWrmCY
   U8/YPt7kvvgKTrBCAg/M+hwTZNaCzDGwjl0nLk+s1QlfdVrqdUD89fCGJ
   4XtiJ0+f3futoSPq6BFt5fV3LNN/SkZ7GfxMxHh66shyDFziwQTOHewDT
   Q==;
X-CSE-ConnectionGUID: NuiUFifFRVyx44t9jWt5ug==
X-CSE-MsgGUID: O/dPv+U8SHaWlJVgJ3kklw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18953479"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="18953479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 12:47:49 -0700
X-CSE-ConnectionGUID: fVplVZ6lRgKpGCmYWBrDKA==
X-CSE-MsgGUID: wmw+6NB5SX6HDPDMY24gdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51341466"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2024 12:47:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVG3W-000jai-06;
	Sat, 20 Jul 2024 19:47:46 +0000
Date: Sun, 21 Jul 2024 03:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [drm-misc:drm-misc-next 3/4]
 drivers/gpu/drm/drm_crtc_internal.h:324: multiple definition of
 `drm_panic_is_enabled';
 drivers/gpu/drm/drm_atomic_helper.o:drivers/gpu/drm/drm_crtc_internal.h:324:
 first defined here
Message-ID: <202407210342.prqxRmZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   7e33fc2ff6754b5ff39b11297f713cd0841d9962
commit: c2c2a91f3868515969a758042887fdc722216525 [3/4] drm/fb-helper: Set skip_panic if the drm driver supports drm panic
config: i386-randconfig-011-20240720 (https://download.01.org/0day-ci/archive/20240721/202407210342.prqxRmZF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210342.prqxRmZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210342.prqxRmZF-lkp@intel.com/

Note: the drm-misc/drm-misc-next HEAD 7e33fc2ff6754b5ff39b11297f713cd0841d9962 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_panic_is_enabled':
>> drivers/gpu/drm/drm_crtc_internal.h:324: multiple definition of `drm_panic_is_enabled'; drivers/gpu/drm/drm_atomic_helper.o:drivers/gpu/drm/drm_crtc_internal.h:324: first defined here


vim +324 drivers/gpu/drm/drm_crtc_internal.h

d70ca9069042c3 Jani Nikula     2024-03-08  319  
9f774c42a908af Jocelyn Falempe 2024-07-17  320  /* drm_panic.c */
9f774c42a908af Jocelyn Falempe 2024-07-17  321  #ifdef CONFIG_DRM_PANIC
9f774c42a908af Jocelyn Falempe 2024-07-17  322  bool drm_panic_is_enabled(struct drm_device *dev);
9f774c42a908af Jocelyn Falempe 2024-07-17  323  #else
9f774c42a908af Jocelyn Falempe 2024-07-17 @324  bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
9f774c42a908af Jocelyn Falempe 2024-07-17  325  #endif
9f774c42a908af Jocelyn Falempe 2024-07-17  326  

:::::: The code at line 324 was first introduced by commit
:::::: 9f774c42a908affba615bbed7463dd4f904dd5f1 drm/panic: Add drm_panic_is_enabled()

:::::: TO: Jocelyn Falempe <jfalempe@redhat.com>
:::::: CC: Jocelyn Falempe <jfalempe@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
