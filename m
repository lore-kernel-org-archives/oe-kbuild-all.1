Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CC7EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qp+phpHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702519047; x=1734055047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WOZigPxVQFl9wag0R+0M2h5FThcmE4i9MS0ylTEsJHg=;
  b=Qp+phpHb/gLYOZZi4eQnC5KWClAsjN/tXb5XDnFgqgnlm9bF4u8mWNES
   XEVnDyGHNaEOedSf65SIan0c2XiwiQdWYcOqyGmj7p7izLwpiC81Xr9G4
   HXxdVyPeslAOX8QN61O+fAMNbrUGU3BB4XJiX695TaL2GD2oUc6VkOZWB
   6BELz43bqqmtXc7rx7NeGJ0vXPGNc6jZe0/WtE4OGY3OqHDl+mvvgtMKF
   Ultdgslvqb3P4DpKvLkPyx/etXkAyKS71TI2wJNymMwQZ9I5UHzlxq4is
   44ubscYIvV5h7KQdMKTjxGNc5p6AYWMBKh+54aJ2sziT7MQQfK/CdHkls
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8450349"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="8450349"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:57:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844534205"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="844534205"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 17:57:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDayV-000LPL-1y;
	Thu, 14 Dec 2023 01:57:19 +0000
Date: Thu, 14 Dec 2023 09:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-sound@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <202312140917.YddZdAlJ-lkp@intel.com>
References: <20231213095023.3928703-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213095023.3928703-1-jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus drm-tip/drm-tip linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/ASoC-hdmi-codec-drop-drm-drm_edid-h-include/20231213-175633
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213095023.3928703-1-jani.nikula%40intel.com
patch subject: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
config: i386-randconfig-006-20231214 (https://download.01.org/0day-ci/archive/20231214/202312140917.YddZdAlJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140917.YddZdAlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140917.YddZdAlJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/lontium-lt9611.c: In function 'lt9611_hdmi_set_infoframes':
   drivers/gpu/drm/bridge/lontium-lt9611.c:346:8: error: implicit declaration of function 'drm_hdmi_avi_infoframe_from_display_mode'; did you mean 'hdmi_avi_infoframe_pack_only'? [-Werror=implicit-function-declaration]
     ret = drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           hdmi_avi_infoframe_pack_only
   drivers/gpu/drm/bridge/lontium-lt9611.c:359:8: error: implicit declaration of function 'drm_hdmi_vendor_infoframe_from_display_mode'; did you mean 'hdmi_vendor_infoframe_pack_only'? [-Werror=implicit-function-declaration]
     ret = drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
           hdmi_vendor_infoframe_pack_only
   drivers/gpu/drm/bridge/lontium-lt9611.c: In function 'lt9611_bridge_get_edid':
   drivers/gpu/drm/bridge/lontium-lt9611.c:855:9: error: implicit declaration of function 'drm_do_get_edid'; did you mean 'drm_bridge_get_edid'? [-Werror=implicit-function-declaration]
     return drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
            ^~~~~~~~~~~~~~~
            drm_bridge_get_edid
>> drivers/gpu/drm/bridge/lontium-lt9611.c:855:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +855 drivers/gpu/drm/bridge/lontium-lt9611.c

23278bf54afe18 Vinod Koul 2020-07-23  848  
23278bf54afe18 Vinod Koul 2020-07-23  849  static struct edid *lt9611_bridge_get_edid(struct drm_bridge *bridge,
23278bf54afe18 Vinod Koul 2020-07-23  850  					   struct drm_connector *connector)
23278bf54afe18 Vinod Koul 2020-07-23  851  {
23278bf54afe18 Vinod Koul 2020-07-23  852  	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
23278bf54afe18 Vinod Koul 2020-07-23  853  
23278bf54afe18 Vinod Koul 2020-07-23  854  	lt9611_power_on(lt9611);
23278bf54afe18 Vinod Koul 2020-07-23 @855  	return drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
23278bf54afe18 Vinod Koul 2020-07-23  856  }
23278bf54afe18 Vinod Koul 2020-07-23  857  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
