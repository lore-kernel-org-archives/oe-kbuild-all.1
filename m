Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8A364024
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777822260; cv=none; b=TvRVzFYi57UrHWjZZtsRdSBEqUoJnM7yusToS6tlvMResAW8rnLDdwnNEINewStM6Hi7Yg/1qJwuKFTh1BDXjrkrHRJPobaEPw0WlPQF23naTp/YON1q/BxzF4PWPuCRdOQyBq+8NoWjeF9/Xc6aZ8HcAJjdvTJyXQPHcWIPJ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777822260; c=relaxed/simple;
	bh=Dmk1KO4/LLsL0ljU7PEapoOIE1+9hAmuOGmfWVEVHUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EsioOlTGKa3RqzCoAwCmgz7TaABOKz8Z9rlb6TJdcstT+Qkp18C23fRKbkiZaaxCimi4RV7jEXjcvsKITsZTqafYg0tWSK8qOVDtL/lcmh3oQwyFGx9eanoDbgerDfKSmbITImhacQatReH6F6qb1OTDotIEd/UfZYycf0p0h84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XkE/f2v+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XkE/f2v+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777822258; x=1809358258;
  h=date:from:to:cc:subject:message-id;
  bh=Dmk1KO4/LLsL0ljU7PEapoOIE1+9hAmuOGmfWVEVHUs=;
  b=XkE/f2v+2KcFnFKQJHcvU9/eHNbpzTd6ZxHfwqohNevZf/T5nX/NZSQd
   L/egEjdWnxhAL03SzrjEudl/UqYSWW9PXg9ylDVCg83lu4Xev5qC0rZIj
   54dGzUWlJHx+eUTc1n+ZZPhMb0DCMuXuIc4tX9ThWgPLA7YiUy0wm57FY
   XSQKB56vCJfJZ/furBtdE5DIYY+G/7MccvNL9yi2/nzZAmqIrgyj7akdK
   IVme3kIP6YLtO4hCS7kXXHXZxmryWzgVjlPTSJjbV14dV+ILbwTxdDP9K
   qyEWqqo/BEEf6cS2pNKKUouB2We7tsAeVLcB9i4e5ieujxwKiQ7drPKCZ
   Q==;
X-CSE-ConnectionGUID: bULX7FGbTZaunqqOHYpCIA==
X-CSE-MsgGUID: QSFmEgO6TkKKc1wOmU/EUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78899239"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78899239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:30:57 -0700
X-CSE-ConnectionGUID: 5QSb0AUVSniaUco3+6kz7Q==
X-CSE-MsgGUID: fi/wAzQNRyGEDSCDrA9yrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="232153677"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2026 08:30:55 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJYmT-000000002gL-12Ce;
	Sun, 03 May 2026 15:30:53 +0000
Date: Sun, 03 May 2026 23:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 509/2395]
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1488:6-12: inconsistent
 IS_ERR and PTR_ERR on line 1489.
Message-ID: <202605032334.MuQfn1mP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 1b86a69b61df411354da70d9528f022833bee4d7 [509/2395] drm/bridge: analogix_dp: Apply panel_bridge helper
config: x86_64-randconfig-102 (https://download.01.org/0day-ci/archive/20260503/202605032334.MuQfn1mP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032334.MuQfn1mP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1488:6-12: inconsistent IS_ERR and PTR_ERR on line 1489.

vim +1488 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c

  1461	
  1462	int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
  1463	{
  1464		struct drm_bridge *bridge = &dp->bridge;
  1465		int ret;
  1466	
  1467		dp->drm_dev = drm_dev;
  1468		dp->encoder = dp->plat_data->encoder;
  1469	
  1470		dp->aux.drm_dev = drm_dev;
  1471	
  1472		ret = drm_dp_aux_register(&dp->aux);
  1473		if (ret) {
  1474			DRM_ERROR("failed to register AUX (%d)\n", ret);
  1475			return ret;
  1476		}
  1477	
  1478		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
  1479		bridge->of_node = dp->dev->of_node;
  1480		bridge->type = DRM_MODE_CONNECTOR_eDP;
  1481		ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
  1482		if (ret)
  1483			goto err_unregister_aux;
  1484	
  1485		if (dp->plat_data->panel) {
  1486			dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
  1487									       dp->plat_data->panel);
> 1488			if (IS_ERR(dp->plat_data->next_bridge)) {
> 1489				ret = PTR_ERR(bridge);
  1490				goto err_unregister_aux;
  1491			}
  1492		}
  1493	
  1494		ret = drm_bridge_attach(dp->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
  1495		if (ret) {
  1496			DRM_ERROR("failed to create bridge (%d)\n", ret);
  1497			goto err_unregister_aux;
  1498		}
  1499	
  1500		return 0;
  1501	
  1502	err_unregister_aux:
  1503		drm_dp_aux_unregister(&dp->aux);
  1504	
  1505		return ret;
  1506	}
  1507	EXPORT_SYMBOL_GPL(analogix_dp_bind);
  1508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
