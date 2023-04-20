Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA9628F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 07:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681976502; x=1713512502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NhVnAVol5gXAIwXYVWqD7i2sY1WMUpuOf8O646Hurhg=;
  b=ZjAz9JDlXtWvGwG7S0kkLK0ijNM2KoCveVnlyvOMjugXvhDkB+p9TpoQ
   y91SLb2nhi0OgvTvzDMcK67LXl3WpFie3KbCXVbo3VoCDxIG+mqM6rPM+
   S+FOMGWSU7IBCxQySCf+z3NYi27sez2clGQZ/dzlxLuUYXmCp2+LugSTB
   0AVCtAN7SVRs972WaH8aiMhzozhz3pRi8FEy4nEjLlnwEp2z5NcBegYms
   2kzqeLw7fDmf4a+LILmHconw2nuzCII6M9qNUZHsgZSmhPIVYPiFd+JKM
   eKJ+aq3WfMBaBNZsealljCimaeR1rodAJ7DNzcV4DekkUV2Hn+GMQ6EGJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431940275"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="431940275"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 00:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815916515"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="815916515"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 00:41:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppOv4-000fak-2x;
	Thu, 20 Apr 2023 07:41:30 +0000
Date: Thu, 20 Apr 2023 15:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, suraj.kandpal@intel.com,
	Mark Yacoub <markyacoub@chromium.org>,
	intel-gfx@lists.freedesktop.org, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
	seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 10/10] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Message-ID: <202304201512.clLNZI0u-lkp@intel.com>
References: <20230419154321.1993419-11-markyacoub@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419154321.1993419-11-markyacoub@google.com>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next-fixes]
[also build test ERROR on linus/master v6.3-rc7]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm/drm-next next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230419-234833
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230419154321.1993419-11-markyacoub%40google.com
patch subject: [PATCH v10 10/10] drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
config: arm64-randconfig-r022-20230416 (https://download.01.org/0day-ci/archive/20230420/202304201512.clLNZI0u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6fb5b032262769c786a7a8c9ed522d936dcf14c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230419-234833
        git checkout 6fb5b032262769c786a7a8c9ed522d936dcf14c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201512.clLNZI0u-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/gpu/drm/msm/msm_atomic.o: in function `msm_atomic_commit_connectors':
>> drivers/gpu/drm/msm/msm_atomic.c:193: undefined reference to `dp_drm_is_bridge_msm_dp'
   drivers/gpu/drm/msm/msm_atomic.c:193:(.text+0x1368): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `dp_drm_is_bridge_msm_dp'
>> aarch64-linux-ld: drivers/gpu/drm/msm/msm_atomic.c:194: undefined reference to `dp_drm_atomic_commit'
   drivers/gpu/drm/msm/msm_atomic.c:194:(.text+0x137c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `dp_drm_atomic_commit'
   aarch64-linux-ld: drivers/gpu/drm/msm/dp/dp_debug.o: in function `dp_hdcp_key_write':
>> drivers/gpu/drm/msm/dp/dp_debug.c:219: undefined reference to `dp_hdcp_ingest_key'
   drivers/gpu/drm/msm/dp/dp_debug.c:219:(.text+0x98): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `dp_hdcp_ingest_key'


vim +193 drivers/gpu/drm/msm/msm_atomic.c

   184	
   185	static void msm_atomic_commit_connectors(struct drm_atomic_state *state)
   186	{
   187		struct drm_device *dev = state->dev;
   188		struct msm_drm_private *priv = dev->dev_private;
   189		int i;
   190	
   191		for (i = 0; i < priv->num_bridges; ++i) {
   192			struct drm_bridge *bridge = priv->bridges[i];
 > 193			if (dp_drm_is_bridge_msm_dp(bridge)) {
 > 194				dp_drm_atomic_commit(bridge, state);
   195			}
   196		}
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
