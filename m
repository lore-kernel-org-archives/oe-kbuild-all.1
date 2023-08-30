Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558B848C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693431903; x=1724967903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haiPdjRwG5k27xJYemhxLWfYDVLX15VbjWtZ8pknZW0=;
  b=IacFJTBz9/BSVPZYx2mbI0myOQW4lEKBmIQJ/bcSqEXKXHvRDnjvPogm
   OVPjrTvZJItqTFX2PpYUDUN3elWYmAHx9u9HvrtH8vkTqi4YTCaPPIOgZ
   xpCC68AfxyfwvQD/Vg9VHftet8WhFKv3Ttt3aCpsKw9uf5s5YrpZlnwQY
   UKG2JTgtOAb3Up9qz6wIhA7t9yP3zTdOfhzTVm18a7UhfwGqkkOnG8abk
   Ch3WEcVO3mTbkNEQu2KIPd5oc6re9/Whsz02fkH48i2MSKk9TpbdWdatk
   Ry+7FnCYxG1VCZtpVMEa5C9loKLiikXZClA8EXtchntVfNajviiawnf4x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378472223"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="378472223"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 14:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804704779"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="804704779"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 14:45:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbSzk-000AFt-0u;
	Wed, 30 Aug 2023 21:45:00 +0000
Date: Thu, 31 Aug 2023 05:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 41/107] drivers/gpu/drm/apple/dcp.c:189:45:
 warning: variable 'old_state' set but not used
Message-ID: <202308310513.eCbvPAhI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   9fbd4119b479213bf020ab631beb0b0468bbdf61
commit: 390fe317d2aed351dd6f8bce01e5cbfba934f89b [41/107] gpu: drm: apple: Add dcp_crtc_atomic_check
config: arm64-randconfig-r035-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310513.eCbvPAhI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310513.eCbvPAhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310513.eCbvPAhI-lkp@intel.com/

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
