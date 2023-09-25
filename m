Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540336E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695600665; x=1727136665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pAiDJMa6WeWxycppKLbScEBQ9ZHSLM97YPga8zVmI5M=;
  b=Z+grU82igIMf8dMgev/10QCymDNpiMc01bxorzhjKdtm2aU62p0i08NB
   c7jaMv6aeOobXwCREn304jRb/5hYaMtRRwq5sYaMeVLWNrKXmQk8ZVG+n
   B40pyzwBLiNXeM0FLfrX6o/NcZ04f6YS6Fgyf7Y530e5UpRYO5Wb1IWSE
   3XwvzEPLUb7vPx4N7LCelpnYUsxFHcdsXZNeRO3VR2SaTjYEmR3DHCWRo
   9eowAv5GBoWH6i1sO/BS+iwioc4GgEDli/OTQP7d4BP3f+byx3ePDFbjj
   ixeDAW11QVQfT5aq2hpWjkUMlpYIKlqfKCxTKM9jxCsHdzBPcqOTn7fqf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467422889"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="467422889"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 17:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="724803256"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="724803256"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Sep 2023 17:11:02 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkZBk-0000dn-0D;
	Mon, 25 Sep 2023 00:11:00 +0000
Date: Mon, 25 Sep 2023 08:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 41/115] drivers/gpu/drm/apple/dcp.c:189:45:
 warning: variable 'old_state' set but not used
Message-ID: <202309250814.ATvf4pce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   f4266bb9a0d063559ea03f3a46244bb54c167e0c
commit: bd2514bb7f205c34b109c693edfad7853892e33e [41/115] gpu: drm: apple: Add dcp_crtc_atomic_check
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230925/202309250814.ATvf4pce-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250814.ATvf4pce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250814.ATvf4pce-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/apple/dcp.c: In function 'dcp_crtc_atomic_check':
>> drivers/gpu/drm/apple/dcp.c:189:45: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
     189 |         struct drm_plane_state *new_state, *old_state;
         |                                             ^~~~~~~~~


vim +/old_state +189 drivers/gpu/drm/apple/dcp.c

   184	
   185	int dcp_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
   186	{
   187		struct platform_device *pdev = to_apple_crtc(crtc)->dcp;
   188		struct apple_dcp *dcp = platform_get_drvdata(pdev);
 > 189		struct drm_plane_state *new_state, *old_state;
   190		struct drm_plane *plane;
   191		struct drm_crtc_state *crtc_state;
   192		int plane_idx, plane_count = 0;
   193		bool needs_modeset;
   194	
   195		if (dcp->crashed)
   196			return -EINVAL;
   197	
   198		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
   199	
   200		needs_modeset = drm_atomic_crtc_needs_modeset(crtc_state) || !dcp->valid_mode;
   201		if (!needs_modeset && !dcp->connector->connected) {
   202			dev_err(dcp->dev, "crtc_atomic_check: disconnected but no modeset");
   203			return -EINVAL;
   204		}
   205	
   206		for_each_oldnew_plane_in_state(state, plane, old_state, new_state, plane_idx) {
   207			/* skip planes not for this crtc */
   208			if (new_state->crtc != crtc)
   209				continue;
   210	
   211			plane_count += 1;
   212		}
   213	
   214		if (plane_count > DCP_MAX_PLANES) {
   215			dev_err(dcp->dev, "crtc_atomic_check: Blend supports only 2 layers!");
   216			return -EINVAL;
   217		}
   218	
   219		return 0;
   220	}
   221	EXPORT_SYMBOL_GPL(dcp_crtc_atomic_check);
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
