Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F2256C8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437701; cv=none; b=ZdY0MruIQ97OuIBPqEAsYWjKTNTTl1TXAnjcP9I8p7Ssi0AN/+U65g9RuzCuh43BJAKUCoIgHRh935kXsB8dtZ3V9rJMtDTUNn6B1bLolSuYRdPayWoi3YHG4NBUu3i0Jp69lohT+utZ5H9nlxrYmzUFBs0HLaaeT8Ej2qOQcvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437701; c=relaxed/simple;
	bh=zL/mL5k7sNI1KLOqlTuP1CXa7KiwbXlcr+W5YjIBDiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tlN4fOVH0rjg7h2tIwD0iWcGgXj3+Jz2/xE9OCMqdP850THv+ymfuInKb3CnnDcvYoFipbg8VdEzEMwbvewpdfNc4Lavk0R/ScW/Q9avycaoKnF9C1IOazKdpqqZOq3Inc3u/ESeby5gdZAupHKSVtr9J1nbFQYer6pzoJ2am3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkRdmfAK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkRdmfAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776437699; x=1807973699;
  h=date:from:to:cc:subject:message-id;
  bh=zL/mL5k7sNI1KLOqlTuP1CXa7KiwbXlcr+W5YjIBDiM=;
  b=EkRdmfAK0OT/j7Wo8CT5VGS1d+MJ0DlK2scf4jhDe3u6bl7Qn6NIM2TA
   7gS2PHmDKn0Ufs/Y0o4//n9kR3r+mVPfsgVLUKAcdLjQJgC9PPI7+VFEL
   YAq9WzZ4RFxmz2rFrpWap9h/4jXzKR3Wg3bv23gXuYyHm436WtMNWZ+TI
   NdhJm+zzcutwyszGDzZu2V0Xi5dYB9NJE8NXQoT1g+ty0u1NVnJBd6iNy
   FAfPLU+eKBb6LZeld1ssCsz3w2eGG573aDwZMlGifTgNwBm6PoNy0axN8
   TqDkip6r1zM7gWoFnEpBja0yNAzoxAlxFfWWioX3sqDqWml52m6wxXftN
   g==;
X-CSE-ConnectionGUID: o4xST2ChRFy9UnnLGSiUnQ==
X-CSE-MsgGUID: pWmN2Ev0QyGSxr9wk0RZmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77631461"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77631461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 07:54:59 -0700
X-CSE-ConnectionGUID: VBc00ikhQhCpFO5mWzrQug==
X-CSE-MsgGUID: HHCZXdCwSNKw4Bvt6noxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="261464950"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2026 07:54:57 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDkas-000000000TE-1Dkk;
	Fri, 17 Apr 2026 14:54:54 +0000
Date: Fri, 17 Apr 2026 22:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: drivers/gpu/drm/bridge/tda998x_drv.c:1296:24: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202604172257.Imo6GOH9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43cfbdda5af60ffc6272a7b8c5c37d1d0a181ca9
commit: c76a8be4feecebbb39095e3c012b67e0f939543d drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
date:   9 weeks ago
config: openrisc-randconfig-r121-20260417 (https://download.01.org/0day-ci/archive/20260417/202604172257.Imo6GOH9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172257.Imo6GOH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c76a8be4feec ("drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172257.Imo6GOH9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tda998x_drv.c:1296:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/bridge/tda998x_drv.c:1784:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1784:50: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1784:50: sparse:     got unsigned int const [usertype] *
   drivers/gpu/drm/bridge/tda998x_drv.c:1785:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1785:52: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1785:52: sparse:     got unsigned int const [usertype] *

vim +1296 drivers/gpu/drm/bridge/tda998x_drv.c

25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1284  
c76a8be4feecebb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1285) static const struct drm_edid *tda998x_edid_read(struct tda998x_priv *priv,
c76a8be4feecebb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1286) 						struct drm_connector *connector)
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1287  {
78e90e003b96efa drivers/gpu/drm/i2c/tda998x_drv.c    Jani Nikula            2024-05-10  1288  	const struct drm_edid *drm_edid;
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1289  
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1290  	/*
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1291  	 * If we get killed while waiting for the HPD timeout, return
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1292  	 * no modes found: we are not in a restartable path, so we
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1293  	 * can't handle signals gracefully.
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1294  	 */
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1295  	if (tda998x_edid_delay_wait(priv))
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23 @1296  		return 0;
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1297  
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1298  	if (priv->rev == TDA19988)
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1299  		reg_clear(priv, REG_TX4, TX4_PD_RAM);
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1300  
78e90e003b96efa drivers/gpu/drm/i2c/tda998x_drv.c    Jani Nikula            2024-05-10  1301  	drm_edid = drm_edid_read_custom(connector, read_edid_block, priv);
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1302  
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1303  	if (priv->rev == TDA19988)
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1304  		reg_set(priv, REG_TX4, TX4_PD_RAM);
25576733ec6e051 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1305  
c76a8be4feecebb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1306) 	return drm_edid;
c76a8be4feecebb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1307) }
c76a8be4feecebb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1308) 

:::::: The code at line 1296 was first introduced by commit
:::::: 25576733ec6e051e541b13ba77a8e1c63619336f drm/i2c: tda998x: group connector functions and funcs together

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
