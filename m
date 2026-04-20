Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F1F376479
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 01:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776649886; cv=none; b=m4pAvr0WSuzv1Y4SqA8HiX3/B5Gk78+cfeBhCLE5HeUYSQRqCmI8M6AEkjzd+HruI9kadw29AFrCv0kTq55LeN2QFWM+B3HcOUjadxH11g6g3zkOfgui3PtuMF3JiywmqXXI6Ybf2anaHJr+DaKUsTibLO8ROnGUdVCIPfn8ILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776649886; c=relaxed/simple;
	bh=vELjZH9JOJNjQpKH1U0W+AA+/wcqokC1UnVU0JRwe8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ktZm41eRwlCD3TpZZhBzRgtRUKDeBc84rh2zRSNXx2iaAJnBP94VSWAvs4BzMa6SXRyzopiwOhtaxI2M841vk/mYUbhZENpGjPeGKsc9mu9l5rAHbEc6uXzi2uQQQK2cutqQdtMZ6LzEMhjmZVOb71ucne7lBwWn9tlECi6XsFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJj04YOY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJj04YOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776649885; x=1808185885;
  h=date:from:to:cc:subject:message-id;
  bh=vELjZH9JOJNjQpKH1U0W+AA+/wcqokC1UnVU0JRwe8c=;
  b=oJj04YOYnPbrp3e4l2zI3gD583yb4F/qOorPgcpVy1vnr8L4TxELKSAy
   kg9Xw0WYr6ViRQ7la7GjD7g4GJEe+FalvBbiIp0204FbDQ1FzL/DF4HOx
   VG1i6K/pG9X1+7+yLeHutmvw4FhbNkKYUiHJpSwjfgAp1gtloVSd9skuG
   AcvBYyJKDbQh8sc8g5fNEDPxEtZopdPBjtiD5rQFEtoEkGg6GYnoySsNy
   pyfh44i2iXAzeyR6ToARywKb/GYSgSZTODTprQfkboI7+pwZoN73P6xv+
   2PWBxqMlB64+9Fi71AkYxl2vWlfQv7N3rFXotVuyBXbjnZX+i27EbyqTu
   A==;
X-CSE-ConnectionGUID: OfBDwLWTQA6B3saGQhBLBw==
X-CSE-MsgGUID: v3jjiWOiRi2KfX3AuQDb9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77438375"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77438375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 18:51:23 -0700
X-CSE-ConnectionGUID: 6kzO8F6LSOKZOfAKMYwpvg==
X-CSE-MsgGUID: UHU/ecmTQ3WcJfLb5/cr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="231461908"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2026 18:51:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEdnD-0000000021C-0Fg2;
	Mon, 20 Apr 2026 01:51:19 +0000
Date: Mon, 20 Apr 2026 09:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Linus Walleij <linusw@kernel.org>
Subject: [drm-misc:drm-misc-next 11/19]
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:1627 jadard_dsi_probe()
 warn: unsigned 'dsi->lanes' is never less than zero.
Message-ID: <202604200838.WvVe32WB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   17394e05b295e4936e0ed50d2f02ed7f08fd4f7d
commit: eb019688f2a97bb95384853072de3a88b981f1f3 [11/19] drm/panel: jadard-jd9365da-h3: support variable DSI configuration
config: openrisc-randconfig-r071-20260420 (https://download.01.org/0day-ci/archive/20260420/202604200838.WvVe32WB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604200838.WvVe32WB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c:1627 jadard_dsi_probe() warn: unsigned 'dsi->lanes' is never less than zero.

vim +1627 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c

  1601	
  1602	static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
  1603	{
  1604		struct device *dev = &dsi->dev;
  1605		const struct jadard_panel_desc *desc;
  1606		struct jadard *jadard;
  1607		int ret;
  1608	
  1609		jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
  1610					      DRM_MODE_CONNECTOR_DSI);
  1611		if (IS_ERR(jadard))
  1612			return PTR_ERR(jadard);
  1613	
  1614		desc = of_device_get_match_data(dev);
  1615	
  1616		if (desc->mode_flags)
  1617			dsi->mode_flags = desc->mode_flags;
  1618		else
  1619			dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
  1620					  MIPI_DSI_MODE_VIDEO_BURST |
  1621					  MIPI_DSI_MODE_NO_EOT_PACKET;
  1622	
  1623		dsi->format = desc->format;
  1624		dsi->lanes = desc->lanes;
  1625		if (!dsi->lanes) {
  1626			dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
> 1627			if (dsi->lanes < 0)
  1628				return dsi->lanes;
  1629			if (dsi->lanes == 4) {
  1630				if (!desc->mode_4ln) {
  1631					dev_err(&dsi->dev, "4-lane config is not supported\n");
  1632					return -EINVAL;
  1633				}
  1634			} else if (dsi->lanes == 2) {
  1635				if (!desc->mode_2ln) {
  1636					dev_err(&dsi->dev, "2-lane config is not supported\n");
  1637					return -EINVAL;
  1638				}
  1639			} else {
  1640				dev_err(&dsi->dev, "Unsupported number of lanes, %d\n", dsi->lanes);
  1641				return -ENODEV;
  1642			}
  1643		}
  1644		dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
  1645	
  1646		jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
  1647		if (IS_ERR(jadard->reset))
  1648			return dev_err_probe(&dsi->dev, PTR_ERR(jadard->reset),
  1649					"failed to get our reset GPIO\n");
  1650	
  1651		jadard->vdd = devm_regulator_get(dev, "vdd");
  1652		if (IS_ERR(jadard->vdd))
  1653			return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vdd),
  1654					"failed to get vdd regulator\n");
  1655	
  1656		jadard->vccio = devm_regulator_get(dev, "vccio");
  1657		if (IS_ERR(jadard->vccio))
  1658			return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
  1659					"failed to get vccio regulator\n");
  1660	
  1661		ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
  1662		if (ret < 0)
  1663			return dev_err_probe(dev, ret, "failed to get orientation\n");
  1664	
  1665		ret = drm_panel_of_backlight(&jadard->panel);
  1666		if (ret)
  1667			return ret;
  1668	
  1669		drm_panel_add(&jadard->panel);
  1670	
  1671		mipi_dsi_set_drvdata(dsi, jadard);
  1672		jadard->dsi = dsi;
  1673		jadard->desc = desc;
  1674	
  1675		ret = mipi_dsi_attach(dsi);
  1676		if (ret < 0)
  1677			drm_panel_remove(&jadard->panel);
  1678	
  1679		return ret;
  1680	}
  1681	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
