Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BFFC8C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690544859; x=1722080859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agJmsIIOuqxpAiEre2MzMwpGqGHVSKPyFwa0mMlT2SA=;
  b=LM/Ijt4qCw7K79XUytk81W2aI+NCxDDpo70De68chAKpvGoSZQSiOEQF
   lSV1Gy8AT1rmXVLRAAM2je/bsDqbnBK9KYOSrlORaCGBAmZ3bzkVQt0T6
   bg2/cNFandEpyoCCeNhBLDcBVbN/I1NtfZZdRe7zQ91/+yskE/UtJA+Vr
   25mk8zIHHhE0a+0K+CcwMsIDH0v8R2bJQJ/6wYGbyPUnz1ffeX169KtAv
   q/LYqTtKVxsDZrisAJzwqAlQuC/OSHtmhwExli0N2Ub3F0XLJ2paMosAH
   Hgoqtfle0JggLp/dX5ZLJXFNsAepk499xcw42bsI8/6bIHGkSm9Lx6zdM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348859961"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="348859961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 04:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="851182894"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="851182894"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 04:47:34 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPLwU-0003AN-1E;
	Fri, 28 Jul 2023 11:47:34 +0000
Date: Fri, 28 Jul 2023 19:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [hverkuil-media-tree:hdmi-dbg 25/34]
 drivers/gpu/drm/vc4/vc4_hdmi.c:573:51: warning: passing argument 1 of
 'conn_state_to_vc4_hdmi_conn_state' discards 'const' qualifier from pointer
 target type
Message-ID: <202307281910.MAyCRJ4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   7cbf796fd240aa51fe399866ae7c223133457a0e
commit: 3b0ea91f7f9721432d165bb0ad18c28eb776be25 [25/34] drm/vc4: hdmi: Add Broadcast RGB property to allow override of RGB range
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230728/202307281910.MAyCRJ4O-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281910.MAyCRJ4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281910.MAyCRJ4O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_connector_get_property':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:573:51: warning: passing argument 1 of 'conn_state_to_vc4_hdmi_conn_state' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     573 |                 conn_state_to_vc4_hdmi_conn_state(state);
         |                                                   ^~~~~
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:56:
   drivers/gpu/drm/vc4/vc4_hdmi.h:255:63: note: expected 'struct drm_connector_state *' but argument is of type 'const struct drm_connector_state *'
     255 | conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~


vim +573 drivers/gpu/drm/vc4/vc4_hdmi.c

   563	
   564	static int vc4_hdmi_connector_get_property(struct drm_connector *connector,
   565						   const struct drm_connector_state *state,
   566						   struct drm_property *property,
   567						   uint64_t *val)
   568	{
   569		struct drm_device *drm = connector->dev;
   570		struct vc4_hdmi *vc4_hdmi =
   571			connector_to_vc4_hdmi(connector);
   572		const struct vc4_hdmi_connector_state *vc4_conn_state =
 > 573			conn_state_to_vc4_hdmi_conn_state(state);
   574	
   575		if (property == vc4_hdmi->broadcast_rgb_property) {
   576			*val = vc4_conn_state->broadcast_rgb;
   577		} else {
   578			drm_dbg(drm, "Unknown property [PROP:%d:%s]\n",
   579				property->base.id, property->name);
   580			return -EINVAL;
   581		}
   582	
   583		return 0;
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
