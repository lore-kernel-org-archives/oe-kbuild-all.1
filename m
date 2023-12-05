Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D58D2E3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 05:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViNIrMqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701754989; x=1733290989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZPB1T1tew0OZTEy1/PsO6BoFkIzrSRICJVKk7s1/S9w=;
  b=ViNIrMqcTxVbMWzjCgEd+b8PKR5W/QBjnSlTVyV4Um1oleksB3wqbZ5R
   ggN5grBIkkWLDCDF4geBkDW6MSz7MhLAzKoqvth+CLM2ATYSjN96qvjZ2
   FFwycPVadm4dNgGFFrO2ZYR3snWo03HNZmYx0VApaT9KXqLNmqysA0Llq
   5dVHFEx0ySciu5u89nTGuxAFavywlqSC0JmNaAKZlAJChtTOz/X5aEw5+
   H/q4Ny5p7nUMYew/xtuy5dDuQCZPUr7oQfMPfwNELlqHHAZcCmlWH9pQm
   SvEuuJMbhhgu+i7DBToLck8Enea5GzG/rCtFMbirctqvk7IPP47ysnt5V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7186190"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7186190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 21:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764212966"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764212966"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 21:43:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAOD3-0008Ov-0G;
	Tue, 05 Dec 2023 05:43:05 +0000
Date: Tue, 5 Dec 2023 13:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [v3 6/6] drm/vs: simple encoder
Message-ID: <202312051351.4LNWoLsD-lkp@intel.com>
References: <20231204123315.28456-7-keith.zhao@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204123315.28456-7-keith.zhao@starfivetech.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.7-rc4]
[cannot apply to drm-misc/drm-misc-next drm/drm-next next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Zhao/dt-bindings-display-Add-yamls-for-JH7110-display-system/20231204-203725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231204123315.28456-7-keith.zhao%40starfivetech.com
patch subject: [v3 6/6] drm/vs: simple encoder
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051351.4LNWoLsD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051351.4LNWoLsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051351.4LNWoLsD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/verisilicon/vs_simple_enc.c:49:6: warning: no previous prototype for 'encoder_atomic_enable' [-Wmissing-prototypes]
      49 | void encoder_atomic_enable(struct drm_encoder *encoder,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/verisilicon/vs_simple_enc.c:58:5: warning: no previous prototype for 'encoder_atomic_check' [-Wmissing-prototypes]
      58 | int encoder_atomic_check(struct drm_encoder *encoder,
         |     ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [y]:
   - DRM_VERISILICON [=y] && HAS_IOMEM [=y] && DRM [=y]


vim +/encoder_atomic_enable +49 drivers/gpu/drm/verisilicon/vs_simple_enc.c

    48	
  > 49	void encoder_atomic_enable(struct drm_encoder *encoder,
    50				   struct drm_atomic_state *state)
    51	{
    52		struct simple_encoder *simple = to_simple_encoder(encoder);
    53	
    54		regmap_update_bits(simple->dss_regmap, simple->offset, simple->mask,
    55				   simple->mask);
    56	}
    57	
  > 58	int encoder_atomic_check(struct drm_encoder *encoder,
    59				 struct drm_crtc_state *crtc_state,
    60				 struct drm_connector_state *conn_state)
    61	{
    62		struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
    63		struct drm_connector *connector = conn_state->connector;
    64		int ret = 0;
    65	
    66		struct drm_bridge *first_bridge = drm_bridge_chain_get_first_bridge(encoder);
    67		struct drm_bridge_state *bridge_state = ERR_PTR(-EINVAL);
    68	
    69		vs_crtc_state->encoder_type = encoder->encoder_type;
    70	
    71		if (first_bridge && first_bridge->funcs->atomic_duplicate_state)
    72			bridge_state = drm_atomic_get_bridge_state(crtc_state->state, first_bridge);
    73	
    74		if (IS_ERR(bridge_state)) {
    75			if (connector->display_info.num_bus_formats)
    76				vs_crtc_state->output_fmt = connector->display_info.bus_formats[0];
    77			else
    78				vs_crtc_state->output_fmt = MEDIA_BUS_FMT_FIXED;
    79		} else {
    80			vs_crtc_state->output_fmt = bridge_state->input_bus_cfg.format;
    81		}
    82	
    83		switch (vs_crtc_state->output_fmt) {
    84		case MEDIA_BUS_FMT_FIXED:
    85		case MEDIA_BUS_FMT_RGB565_1X16:
    86		case MEDIA_BUS_FMT_RGB666_1X18:
    87		case MEDIA_BUS_FMT_RGB888_1X24:
    88		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
    89		case MEDIA_BUS_FMT_RGB101010_1X30:
    90		case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
    91		case MEDIA_BUS_FMT_UYVY8_1X16:
    92		case MEDIA_BUS_FMT_YUV8_1X24:
    93		case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
    94		case MEDIA_BUS_FMT_UYVY10_1X20:
    95		case MEDIA_BUS_FMT_YUV10_1X30:
    96			ret = 0;
    97			break;
    98		default:
    99			ret = -EINVAL;
   100			break;
   101		}
   102	
   103		/* If MEDIA_BUS_FMT_FIXED, set it to default value */
   104		if (vs_crtc_state->output_fmt == MEDIA_BUS_FMT_FIXED)
   105			vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
   106	
   107		return ret;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
