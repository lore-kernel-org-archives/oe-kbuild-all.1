Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15206DD0D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJzo0cjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701807592; x=1733343592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWYPY30mNp3Wtvw/deae/n0+Z++eMkk5yMql4r8Xmok=;
  b=ZJzo0cjOAF77neZ+ZYuUO5tbcMvhAEvMwHHIDNH/YIpD14P/5KECycjJ
   dK0pzYBJXiTO5Xslx7vbZZpoa9+MHyzmZ6IoITOZ4e4eddp+EhHa6WYY5
   dHsKy7FCituIYE43IQPCAsopbG+Z9GzGxVlPL89PvB/DIzmP6QCP1c6t0
   usqAl9XT8rLWu0FbNFdDIfmLiLWILiD5ogrFrM5WkdlDt2KSA0JQCYA1H
   CyhyJkF6Mdj6a/y2fGh/rXn7HQ7zMy6fXlVj0aYiv10Q/IhdA6Zux6JDs
   SJRaFa4QjtNywwT+JZ+l5DgMDf41m98W46ws4I9C7ldSpTFFConsjK7YJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1041519"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1041519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764455695"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="764455695"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2023 12:19:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbtR-0009fN-1G;
	Tue, 05 Dec 2023 20:19:45 +0000
Date: Wed, 6 Dec 2023 04:19:17 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Jonker <jbx6244@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 1690/4884]
 drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:22: error: implicit declaration
 of function 'drm_atomic_get_new_connector_state'; did you mean
 'drm_atomic_helper_connector_reset'?
Message-ID: <202312060423.LEZ1ttyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: ae3436a5e7c2ef4f92938133bd99f92fc47ea34e [1690/4884] drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
config: x86_64-buildonly-randconfig-006-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060423.LEZ1ttyo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060423.LEZ1ttyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060423.LEZ1ttyo-lkp@intel.com/

Note: the linux-next/master HEAD 0f5f12ac05f36f117e793656c3f560625e927f1b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/rk3066_hdmi.c: In function 'rk3066_hdmi_encoder_enable':
>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:22: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
     397 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      drm_atomic_helper_connector_reset
   drivers/gpu/drm/rockchip/rk3066_hdmi.c:397:20: warning: assignment to 'struct drm_connector_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     397 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
         |                    ^
>> drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:22: error: implicit declaration of function 'drm_atomic_get_new_crtc_state'; did you mean 'drm_atomic_helper_swap_state'? [-Werror=implicit-function-declaration]
     401 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      drm_atomic_helper_swap_state
   drivers/gpu/drm/rockchip/rk3066_hdmi.c:401:20: warning: assignment to 'struct drm_crtc_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     401 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
         |                    ^
   cc1: some warnings being treated as errors


vim +397 drivers/gpu/drm/rockchip/rk3066_hdmi.c

   388	
   389	static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
   390					       struct drm_atomic_state *state)
   391	{
   392		struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
   393		struct drm_connector_state *conn_state;
   394		struct drm_crtc_state *crtc_state;
   395		int mux, val;
   396	
 > 397		conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
   398		if (WARN_ON(!conn_state))
   399			return;
   400	
 > 401		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
   402		if (WARN_ON(!crtc_state))
   403			return;
   404	
   405		mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
   406		if (mux)
   407			val = (HDMI_VIDEO_SEL << 16) | HDMI_VIDEO_SEL;
   408		else
   409			val = HDMI_VIDEO_SEL << 16;
   410	
   411		regmap_write(hdmi->grf_regmap, GRF_SOC_CON0, val);
   412	
   413		DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder enable select: vop%s\n",
   414			      (mux) ? "1" : "0");
   415	
   416		rk3066_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
