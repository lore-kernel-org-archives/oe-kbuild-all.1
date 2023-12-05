Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E95D6DD18
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUBMZHKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701807595; x=1733343595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+sO3tPg+0yesqijDj+LCNYPdq4zKvypZxitJf8XaVKo=;
  b=fUBMZHKssxCmkEEm0DQHybV9HzJZPadWyhuGXARN1lgy5df8NBzeogrz
   LvCbURCPZZl/n8U2PGaZwWHLIkgyEFZdgYpQ1y7CByWnlDHe7lbofDXRe
   HJOiUuFg82hX4QMak4klMXX8zz7Nk4GbOjvYl8VBj7K+ovhlnxwNo2zaJ
   S2i2AAq7g4nVxotVBYwo7br+5oKiMnScqmv/rxOYaT4IWJCXfbbqmBfpD
   vaDnf4mwzv6MSGvn03WVRuXiQAOyhJNkmQwApvdjl2KHmvDtqNs3JJ0sK
   IRix8oQa5pcf116qpipGRM2t7ONjHk4qRBNA/Ha2asy7yz890Gm+w6+cR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="849895"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="849895"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841594386"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841594386"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 12:19:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbtR-0009fI-0p;
	Tue, 05 Dec 2023 20:19:45 +0000
Date: Wed, 6 Dec 2023 04:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: oe-kbuild-all@lists.linux.dev, Carl Philipp Klemm <philipp@uvos.xyz>,
	devicetree@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Merlijn Wajer <merlijn@wizzup.org>,
	Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 09/10] drm/bridge: tc358775: Add support for tc358765
Message-ID: <202312060419.B8qmgrsh-lkp@intel.com>
References: <20231202075514.44474-10-tony@atomide.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202075514.44474-10-tony@atomide.com>

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/dt-bindings-display-bridge-tc358775-make-stby-gpio-and-vdd-supplies-optional/20231202-160622
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231202075514.44474-10-tony%40atomide.com
patch subject: [PATCH v2 09/10] drm/bridge: tc358775: Add support for tc358765
config: x86_64-randconfig-121-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060419.B8qmgrsh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060419.B8qmgrsh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060419.B8qmgrsh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/tc358775.c:661:13: warning: cast to smaller integer type 'enum tc3587x5_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           tc->type = (enum tc3587x5_type)of_device_get_match_data(dev);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +661 drivers/gpu/drm/bridge/tc358775.c

   648	
   649	static int tc_probe(struct i2c_client *client)
   650	{
   651		struct device *dev = &client->dev;
   652		struct tc_data *tc;
   653		int ret;
   654	
   655		tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
   656		if (!tc)
   657			return -ENOMEM;
   658	
   659		tc->dev = dev;
   660		tc->i2c = client;
 > 661		tc->type = (enum tc3587x5_type)of_device_get_match_data(dev);
   662	
   663		tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
   664							  TC358775_LVDS_OUT0, 0);
   665		if (IS_ERR(tc->panel_bridge))
   666			return PTR_ERR(tc->panel_bridge);
   667	
   668		ret = tc358775_parse_dt(dev->of_node, tc);
   669		if (ret)
   670			return ret;
   671	
   672		tc->vddio = devm_regulator_get(dev, "vddio-supply");
   673		if (IS_ERR(tc->vddio)) {
   674			ret = PTR_ERR(tc->vddio);
   675			dev_err(dev, "vddio-supply not found\n");
   676			return ret;
   677		}
   678	
   679		tc->vdd = devm_regulator_get(dev, "vdd-supply");
   680		if (IS_ERR(tc->vdd)) {
   681			ret = PTR_ERR(tc->vdd);
   682			dev_err(dev, "vdd-supply not found\n");
   683			return ret;
   684		}
   685	
   686		tc->stby_gpio = devm_gpiod_get_optional(dev, "stby", GPIOD_OUT_HIGH);
   687		if (IS_ERR(tc->stby_gpio))
   688			return PTR_ERR(tc->stby_gpio);
   689	
   690		tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
   691		if (IS_ERR(tc->reset_gpio)) {
   692			ret = PTR_ERR(tc->reset_gpio);
   693			dev_err(dev, "cannot get reset-gpios %d\n", ret);
   694			return ret;
   695		}
   696	
   697		tc->bridge.funcs = &tc_bridge_funcs;
   698		tc->bridge.of_node = dev->of_node;
   699		tc->bridge.pre_enable_prev_first = true;
   700		drm_bridge_add(&tc->bridge);
   701	
   702		i2c_set_clientdata(client, tc);
   703	
   704		ret = tc_attach_host(tc);
   705		if (ret)
   706			goto err_bridge_remove;
   707	
   708		return 0;
   709	
   710	err_bridge_remove:
   711		drm_bridge_remove(&tc->bridge);
   712		return ret;
   713	}
   714	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
