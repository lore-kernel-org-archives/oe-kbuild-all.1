Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792941CAA78
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 19:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739962; cv=none; b=C0U366hRkICwUCR92UdcsJQ4sPKb00WvH04qDojd3dFbTAPFDdwGrscLG7lSckNOykIgI2emPn+Ftk1eEdayOgD41InNPxQkDw80uGAEIGTkCI7uUPb8K1llhudNpnIXLKJCHnWVVbJwnglQrGO/UimpnH0Hn000EOkoh7B8MTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739962; c=relaxed/simple;
	bh=RReiofGCrUO6nwMX8iVoBq69kNrZZw8cQVjsjE/iCag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZlGfNn8smVtAN5M1bI/InqX3x+++22A/eUjCzaa2GloWQet5OXAILyrVopi9qKGZ+bcbTpZ0mL42lMep3FWlIeIQv7MyZSUxH+xKCy5nEYNQ9uWe8SNKaH4+gNtMmdoiPeilTyFC27m81L5BhM9n9mo8s/mpgV9H5YnxODYJ3Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAsfmR5s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAsfmR5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772739960; x=1804275960;
  h=date:from:to:cc:subject:message-id;
  bh=RReiofGCrUO6nwMX8iVoBq69kNrZZw8cQVjsjE/iCag=;
  b=hAsfmR5sICsInbu9v3Zt3CgE0ZfYepextgL/9K5zpd8DkIKkGtqK9tHC
   KkUmPonitzczZDnz+io2ra/1o72X5Tpz3kVuuNSI5S0+WiJ67+L2CXk/T
   ztPnjosgI4gfyXROlFX8c/7ycCwSb2GbrLJf6SKePijB1LH5oCMzAz7zP
   m62IgUrTHcSNDJ2c3XQOf53IdUxH6hitGAjhFWxnE2l8og54UgXewbgs0
   H+TYWBXzVvN5XjnUeMEvwjHxA6NfsLb2lLwLsIGzM+WBSHb+F3X+a66ut
   LShRTAZS6IQp3daZtfmvja+NqAMqp5Av7kC+lOiE8lHIYOEj/Gntregp8
   A==;
X-CSE-ConnectionGUID: FZ/1u8SRTTqQcyBsoqNLiA==
X-CSE-MsgGUID: cwpWY9iaSH2/y/IXunLuWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73808814"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73808814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 11:46:00 -0800
X-CSE-ConnectionGUID: 9YFxGyCfTqm5sqt1bLibLA==
X-CSE-MsgGUID: DavUr5aaQ/WJ1d87OTLZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="221641858"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 11:45:58 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyEdv-0000000019w-2QSk;
	Thu, 05 Mar 2026 19:45:55 +0000
Date: Fri, 06 Mar 2026 03:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Joseph Guo <qijian.guo@nxp.com>
Subject: [linux-next:master 3018/4342]
 drivers/gpu/drm/bridge/waveshare-dsi.c:70 ws_bridge_attach_dsi() warn:
 unsigned 'dsi->lanes' is never less than zero.
Message-ID: <202603060341.hNj0pl9L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f9cd19e764b782706dbaacc69e502099cb014ba
commit: fca11428425e92bf21d4a7f5865708c5e64430e4 [3018/4342] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes
config: powerpc-randconfig-r073-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060341.hNj0pl9L-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060341.hNj0pl9L-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/waveshare-dsi.c:70 ws_bridge_attach_dsi() warn: unsigned 'dsi->lanes' is never less than zero.

vim +70 drivers/gpu/drm/bridge/waveshare-dsi.c

    38	
    39	static int ws_bridge_attach_dsi(struct ws_bridge *ws)
    40	{
    41		const struct mipi_dsi_device_info info = {
    42			.type = "ws-bridge",
    43			.channel = 0,
    44			.node = NULL,
    45		};
    46		struct device_node *dsi_host_node;
    47		struct device *dev = ws->dev;
    48		struct mipi_dsi_device *dsi;
    49		struct mipi_dsi_host *host;
    50		int ret;
    51	
    52		dsi_host_node = of_graph_get_remote_node(dev->of_node, 0, 0);
    53		if (!dsi_host_node) {
    54			dev_err(dev, "Failed to get remote port\n");
    55			return -ENODEV;
    56		}
    57		host = of_find_mipi_dsi_host_by_node(dsi_host_node);
    58		of_node_put(dsi_host_node);
    59		if (!host)
    60			return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find dsi_host\n");
    61	
    62		dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
    63		if (IS_ERR(dsi))
    64			return dev_err_probe(dev, PTR_ERR(dsi), "Failed to create dsi device\n");
    65	
    66		dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
    67				  MIPI_DSI_CLOCK_NON_CONTINUOUS;
    68		dsi->format = MIPI_DSI_FMT_RGB888;
    69		dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
  > 70		if (dsi->lanes < 0) {
    71			dev_warn(dev, "Invalid or missing DSI lane count %d, falling back to 2 lanes\n",
    72				 dsi->lanes);
    73			dsi->lanes = 2;	/* Old DT backward compatibility */
    74		}
    75	
    76		ret = devm_mipi_dsi_attach(dev, dsi);
    77		if (ret < 0)
    78			return dev_err_probe(dev, ret, "Failed to attach dsi to host\n");
    79	
    80		return 0;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
