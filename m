Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBB43A5E7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811806; cv=none; b=U1yVx1taEmLuJiI2xotoMbsRI/h40SZjGpQV28r0b3BnqScx6aNoW1Cd3Nh3iOQAljXksM4dWH46I8f0hYXik8w2DXul203djKWfP9Ta4gEwvlPwMostFoTO1fsYpTzZcCzhk2SIVvg83RV+fm/JTAH5at0SSc4UgQHm+sGDFvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811806; c=relaxed/simple;
	bh=6fbCFIelMWqeJ4Qsvlwrs9N66eiF45VTBbflxXKu/KM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BCexChjfuWkeKFJrjDdy4sRmNAJ1oAxSupdDKZ6m/xZWXmvwNDZYDt4x7ETbPOzmnzgLnxzc2HQIC/UMpY9q9q2Pgfos5aAl8onXDOVeZG2ZgK3c2sZ6fcK0aI2NBOl1PrvukUVcnQn2P0Ors+no6tKQ0wQMzVcYR8ZUBwJJHgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDykXG3+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDykXG3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775811804; x=1807347804;
  h=date:from:to:cc:subject:message-id;
  bh=6fbCFIelMWqeJ4Qsvlwrs9N66eiF45VTBbflxXKu/KM=;
  b=UDykXG3+fquPyqG91gwYwpy7hdq67HPL5jugKcCNTGJxOuDkyagmYSd6
   xJcPLOPSdVS0jYhoGDvCslHtXzCXkOg3EhkSCTL21Luzd0wdk1VR1uMmY
   vVcm82QJAZXwistaADn+t5WuxKb2iGFNFR0ZlwWx/7cQ+hMQal5FzJ1b/
   QI+ek3pcqf3yj1KTurq9kBOpuO0R55u2DGd4JUT9tDwUg22c4oPnsQIt1
   BmR0LbyFWYrjfFDVnhJ/CP9kYXApsVPU8IfvrZXAeUwTtJ8GI+HTscJBC
   SO3bHcybG+IS02o5tFz7OCoY9xtmg49k/A+ANr3HFgBTh8yjgS4mcPIQD
   g==;
X-CSE-ConnectionGUID: 08y4FeMoTYaZ+E25QYl/Ug==
X-CSE-MsgGUID: WJNxZTZoQGec/+t1rg3o/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76546508"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76546508"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:03:24 -0700
X-CSE-ConnectionGUID: v8AKnMICTZqT3w71S7RjQA==
X-CSE-MsgGUID: 6oUbTd8RSxykzr5NxvEKNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226318326"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 02:03:22 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB7lo-000000003Vz-085u;
	Fri, 10 Apr 2026 09:03:20 +0000
Date: Fri, 10 Apr 2026 17:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/bridge/lontium-lt9611uxc.c:438:undefined
 reference to `drm_connector_hdmi_audio_plugged_notify'
Message-ID: <202604101732.SBQWKwtT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
date:   4 months ago
config: x86_64-randconfig-004-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101732.SBQWKwtT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101732.SBQWKwtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c08c123d4cd6 ("drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101732.SBQWKwtT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `lt9611uxc_bridge_hpd_notify':
>> drivers/gpu/drm/bridge/lontium-lt9611uxc.c:438:(.text+0xd9d6cb): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
>> ld: drivers/gpu/drm/bridge/lontium-lt9611uxc.c:448:(.text+0xd9d70a): undefined reference to `drm_connector_hdmi_audio_plugged_notify'


vim +438 drivers/gpu/drm/bridge/lontium-lt9611uxc.c

   430	
   431	static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
   432						struct drm_connector *connector,
   433						enum drm_connector_status status)
   434	{
   435		const struct drm_edid *drm_edid;
   436	
   437		if (status == connector_status_disconnected) {
 > 438			drm_connector_hdmi_audio_plugged_notify(connector, false);
   439			drm_edid_connector_update(connector, NULL);
   440			return;
   441		}
   442	
   443		drm_edid = lt9611uxc_bridge_edid_read(bridge, connector);
   444		drm_edid_connector_update(connector, drm_edid);
   445		drm_edid_free(drm_edid);
   446	
   447		if (status == connector_status_connected)
 > 448			drm_connector_hdmi_audio_plugged_notify(connector, true);
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
