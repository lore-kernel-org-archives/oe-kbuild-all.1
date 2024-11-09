Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC57146A71
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731188589; cv=none; b=O4DCg0VAZuCEUzSv7+rDBsTqvC2UWhxygl7GzzCoP/x3V+mMB8K/VLG5K6kUPrF6XCO1feiFgM6HOCELV6ZzvsRclct3TpTM6OLBc01IBGtCIOvxXo+Uws80YKt80MoUzYWdDMXHVdCmwCsjasJVzJZHMKJNvhfS5aQw5RmtT7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731188589; c=relaxed/simple;
	bh=XVHh1wvW7/t3VRmgwy/4LClcVwNBXtb2iyZl3/Jrae0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuNN6W8wEyw8lyFntNoyBbNAiYLdRRqAndB2oh9CPZ6G/8hWAGVY4IEqdp8E8fw0T4++ZUyZB4bfp0V1yBkZ0/ZyQVW3PD+RmdnkoXcV6WKRdvD00aXbGonKefcWtCLSK2GqYVBeHKiHyiQFU9gjlVf55kv9MOttU5Ndz9IDIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqSZsU63; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqSZsU63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731188588; x=1762724588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XVHh1wvW7/t3VRmgwy/4LClcVwNBXtb2iyZl3/Jrae0=;
  b=PqSZsU63tu1YsrfRsp/4nYESlk6S7kUxo+u3oY+fu5SWwwuWXL6m/P40
   Rn2Z7y67sSOVvtvS5N0/J3pIjjdI76AcXpammd+mEV6XuG5yrBWZQLR+n
   WlwWT4qfSLBkjGiZa1uMFnN1/aPAzQHEdzCIp5kSVJJWuZU+EiA8b0RwF
   ChM5T5U/s8inkzm1md20jptzMq0kjhAjjQ7ZsCxUzpl+brGtS8o8mxoif
   IeP6iTIvKjPCK/QlNI/5ps/vthppVBEibPA/iDZaMSL+nO3ovixKVmdg3
   OpdQ6c1Rw2rFavHwwXtZuOdLWVjRn8OX3turNTAgHUbofsTAQ2o6zxzBC
   g==;
X-CSE-ConnectionGUID: OqhbPEQlT2mWJj1ZR+FN2w==
X-CSE-MsgGUID: FXsuv80zSiCrCKwkKcO43Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34732464"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34732464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 13:43:07 -0800
X-CSE-ConnectionGUID: +oFKkOFSSS+neNzi4OyESg==
X-CSE-MsgGUID: 8uhshXGCS8OjrkeoC8LHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="85753859"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2024 13:43:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9tEQ-000sfK-0o;
	Sat, 09 Nov 2024 21:42:58 +0000
Date: Sun, 10 Nov 2024 05:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/7] drm/display/hdmi: implement connector update
 functions
Message-ID: <202411100534.NcuGYZnz-lkp@intel.com>
References: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/ASoC-hdmi-codec-pass-data-to-get_dai_id-too/20241109-205026
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884%40linaro.org
patch subject: [PATCH v3 6/7] drm/display/hdmi: implement connector update functions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100534.NcuGYZnz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100534.NcuGYZnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100534.NcuGYZnz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/ite-it6263.c:19:
>> include/drm/display/drm_hdmi_state_helper.h:24:63: warning: 'struct drm_edid' declared inside parameter list will not be visible outside of this definition or declaration
      24 |                                                  const struct drm_edid *drm_edid);
         |                                                               ^~~~~~~~
--
>> drivers/gpu/drm/display/drm_hdmi_state_helper.c:768: warning: expecting prototype for __drm_atomic_helper_connector_hdmi_update_edid(). Prototype was for drm_atomic_helper_connector_hdmi_update_edid() instead


vim +24 include/drm/display/drm_hdmi_state_helper.h

    10	
    11	void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
    12						      struct drm_connector_state *new_conn_state);
    13	
    14	int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
    15						   struct drm_atomic_state *state);
    16	
    17	int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
    18								    struct hdmi_audio_infoframe *frame);
    19	int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
    20	int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
    21							       struct drm_atomic_state *state);
    22	
    23	int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
  > 24							 const struct drm_edid *drm_edid);
    25	int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
