Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D883C0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 01:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ4iFQCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704851007; x=1736387007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+S4XeMOOJvvyOjc3lGPn+71egzVpNFplON5Pq+gaz7k=;
  b=QQ4iFQCsdsz8Sm+W3L8+Ncw55/mXd8rjA5dbquzKsRYiTmRH/cxllvni
   avGVqET7B85VyIZ4NcLC9w55sIziY66aw7kHbwWmEM6GnzkBqILXqEshH
   dvqiQVydHuX5k0TN9o9jPISCj2DyYqFlJ4Hatxb+1TH5WZu6pUpMK2UKc
   fj5Vtl3BHD05nU3kRT76vjmWLFoBlo0K/S31Hj8sF+TgNIj8D5Im3hrwa
   wYoCCWC5rr8Ss4cliqURzWQCmcZdWE1gW9NLMjxNsx3Dq7si2f64GJt/a
   iJ4jNwqIm3Jo6sssvurl7403tMaTWDEjfP/hKTwKjrFrfMFJ2+ymeF+vb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5462751"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5462751"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 17:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1113271163"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="1113271163"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jan 2024 17:43:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNNcn-0006TK-1U;
	Wed, 10 Jan 2024 01:43:21 +0000
Date: Wed, 10 Jan 2024 09:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Heiko Stuebner <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>
Subject: [drm-misc:drm-misc-next 6/21]
 drivers/gpu/drm/rockchip/inno_hdmi.c:499:22: error: implicit declaration of
 function 'drm_atomic_get_new_connector_state'; did you mean
 'drm_atomic_helper_connector_reset'?
Message-ID: <202401100949.ZVRr0pIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   632ca3c92f3840d91ba7ddda0271f84813036a11
commit: d3e040f450ec8e46ff42fa495a433b976ab47686 [6/21] drm/rockchip: inno_hdmi: Get rid of mode_set
config: s390-randconfig-001-20240109 (https://download.01.org/0day-ci/archive/20240110/202401100949.ZVRr0pIa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401100949.ZVRr0pIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401100949.ZVRr0pIa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/inno_hdmi.c: In function 'inno_hdmi_encoder_enable':
>> drivers/gpu/drm/rockchip/inno_hdmi.c:499:22: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
     499 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      drm_atomic_helper_connector_reset
>> drivers/gpu/drm/rockchip/inno_hdmi.c:499:20: warning: assignment to 'struct drm_connector_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     499 |         conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
         |                    ^
>> drivers/gpu/drm/rockchip/inno_hdmi.c:503:22: error: implicit declaration of function 'drm_atomic_get_new_crtc_state'; did you mean 'drm_atomic_helper_swap_state'? [-Werror=implicit-function-declaration]
     503 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      drm_atomic_helper_swap_state
>> drivers/gpu/drm/rockchip/inno_hdmi.c:503:20: warning: assignment to 'struct drm_crtc_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     503 |         crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
         |                    ^
   cc1: some warnings being treated as errors


vim +499 drivers/gpu/drm/rockchip/inno_hdmi.c

   491	
   492	static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
   493					     struct drm_atomic_state *state)
   494	{
   495		struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
   496		struct drm_connector_state *conn_state;
   497		struct drm_crtc_state *crtc_state;
   498	
 > 499		conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
   500		if (WARN_ON(!conn_state))
   501			return;
   502	
 > 503		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
   504		if (WARN_ON(!crtc_state))
   505			return;
   506	
   507		inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
   508		inno_hdmi_set_pwr_mode(hdmi, NORMAL);
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
