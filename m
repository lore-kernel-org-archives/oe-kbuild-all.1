Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB333DFC65
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686446; cv=none; b=E4duJcThGmHVW79XRsNId09TleXyW5tGI4AZSVpb/IzXocdsS91nXwPEwt5rZ10O3xFpGIOTH5MeggmB0FUVg3YualP8aAGXBsmXaLLXr4phEznytHC9oc579W6gAyAGhYBfGgTXcJT2nz+Wj4H7i+lpMe7Xkk/FFR8HW6W2nmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686446; c=relaxed/simple;
	bh=tvk7FwQmwrmOto60C1Yi2LZeag4vqKfklK0VRp6KsRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eobjRyXAJ3DZhDVsbCfmn8ZtnVGTdX95bgFhBaTpDwpMv2e26xsKd4Pgof0e4SzQ9VcgMkNQwfpTUJ21atKj4vfC2pKpPM7/fNG7+yzMCHWSFba9GpabdGERhRq5vnLT3H1OiO6iAwcjfgcFtCRQ4dhLi20cIzqc1VTBb52aapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl1SvxcI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl1SvxcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773686426; x=1805222426;
  h=date:from:to:cc:subject:message-id;
  bh=tvk7FwQmwrmOto60C1Yi2LZeag4vqKfklK0VRp6KsRw=;
  b=Hl1SvxcIjMBHpnbbQI2bI+0msHodGJDxeY0bR4ei3zRdRCWci9Ywr8o4
   QTrXAt+SZUuqcC9rSEbnKrXTFKJAZ5O690nsjnLNIaspIdJBm2auzrhNc
   xKOzrq2KMNhazmk51gaJ/SRtK/L6mVlACN9LjWu1koCBj3tKEg9VmpTcK
   Yvim4MFLV1vdqukVmeBTiJVVu52qHY28+XcOoqlKB5dniWFPfGyH1uzyf
   sidjMwmDBqol+yCBiRQioidHxvAYJ/1h/CWGZrwxGKJf4KLxpbYq1ZG2g
   NYHskA0Q/WzdxyrsJxuWnpPRRPsT9pnwM2Sv0XPHH5oG1524Sk4aScPXv
   w==;
X-CSE-ConnectionGUID: qpt6U/8LT4i5JKaQZhKWLQ==
X-CSE-MsgGUID: SIT9YqsTRsiVtZQ1QmKMYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74747248"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74747248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 11:40:25 -0700
X-CSE-ConnectionGUID: USi379XtRgShM8B2H9dzpQ==
X-CSE-MsgGUID: hsTbXMbLT5aAVJJl/IFvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="259901127"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Mar 2026 11:40:24 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2CrV-0000000017S-11o1;
	Mon, 16 Mar 2026 18:40:21 +0000
Date: Tue, 17 Mar 2026 02:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 2100/6488]
 drivers/gpu/drm/bridge/tda998x_drv.c:1296:24: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202603170230.STdaD98w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b84a0ebe421ca56995ff78b66307667b62b3a900
commit: 21f6bcdf2be72e750dbe430b7227a66763a58466 [2100/6488] Merge tag 'drm-misc-next-2026-02-26' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
config: x86_64-randconfig-121-20260316 (https://download.01.org/0day-ci/archive/20260317/202603170230.STdaD98w-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170230.STdaD98w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170230.STdaD98w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/tda998x_drv.c:1296:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/bridge/tda998x_drv.c:1784:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1784:50: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1784:50: sparse:     got unsigned int const [usertype] *
   drivers/gpu/drm/bridge/tda998x_drv.c:1785:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/gpu/drm/bridge/tda998x_drv.c:1785:52: sparse:     expected restricted __be32 const [usertype] *p
   drivers/gpu/drm/bridge/tda998x_drv.c:1785:52: sparse:     got unsigned int const [usertype] *

vim +1296 drivers/gpu/drm/bridge/tda998x_drv.c

25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1284  
c76a8be4feeceb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1285) static const struct drm_edid *tda998x_edid_read(struct tda998x_priv *priv,
c76a8be4feeceb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1286) 						struct drm_connector *connector)
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1287  {
78e90e003b96ef drivers/gpu/drm/i2c/tda998x_drv.c    Jani Nikula            2024-05-10  1288  	const struct drm_edid *drm_edid;
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1289  
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1290  	/*
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1291  	 * If we get killed while waiting for the HPD timeout, return
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1292  	 * no modes found: we are not in a restartable path, so we
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1293  	 * can't handle signals gracefully.
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1294  	 */
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1295  	if (tda998x_edid_delay_wait(priv))
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23 @1296  		return 0;
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1297  
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1298  	if (priv->rev == TDA19988)
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1299  		reg_clear(priv, REG_TX4, TX4_PD_RAM);
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1300  
78e90e003b96ef drivers/gpu/drm/i2c/tda998x_drv.c    Jani Nikula            2024-05-10  1301  	drm_edid = drm_edid_read_custom(connector, read_edid_block, priv);
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1302  
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1303  	if (priv->rev == TDA19988)
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1304  		reg_set(priv, REG_TX4, TX4_PD_RAM);
25576733ec6e05 drivers/gpu/drm/i2c/tda998x_drv.c    Russell King           2016-10-23  1305  
c76a8be4feeceb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1306) 	return drm_edid;
c76a8be4feeceb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1307) }
c76a8be4feeceb drivers/gpu/drm/bridge/tda998x_drv.c Kory Maincent (TI.com  2026-01-23  1308) 

:::::: The code at line 1296 was first introduced by commit
:::::: 25576733ec6e051e541b13ba77a8e1c63619336f drm/i2c: tda998x: group connector functions and funcs together

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
