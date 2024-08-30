Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8A017C7BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725013089; cv=none; b=tmYYaZsJEbnroyGAcLMvJzrSXKhRLeT4jllH7ZEB0Fm71UadQU/ihPkSMpsly8Sk9p0rq+tYQDyksL6ZAWB9LPRYN+thfOsP00/cXqJqYefsl5xu8zfiIZRZHyJCuXsbfmWVMTrsYp8X0rE3e0Y25ajvtrcDMY8srsRxv3KsMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725013089; c=relaxed/simple;
	bh=pUaUWoyq6ppty/XcLqs6PvJMVgwwZVdRfIO5YjGw+/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EMr3xtBWJ0YmpR+z+j7fvhe5+xdXjSEgq7w4f0cvuaIWYooK2nF87kTgHit2I1K/EMVe7rzYbTSkfPoz8dZtPFrcjVjx82HCZTZGTM3SNYlzQH0LKMs+NwVlhyjKL+8pSVPTsQvq4ggFfXkwFooIVelVHJfJgQ/1PK6SueRTwXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTAO+dLA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTAO+dLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725013088; x=1756549088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pUaUWoyq6ppty/XcLqs6PvJMVgwwZVdRfIO5YjGw+/M=;
  b=FTAO+dLAL15p0owEbUcz0XEusjoqz+uX0TyzHs6MOnV7e/0oMCAk0VZ4
   XgxtptkOBjqQMHByCVFIj+G3CqotRgIweWAa2DdiWqXyR3rQNpjh42yHJ
   m0tDDPClGET9CJKmvEligVvhyj7rc7k4r+RJpxmuz2Jw6FvPHMbxjOC4U
   kZfF4e6sBcSv6TWI0z/5VB0sTXeDfSithcJHshIt6qhPo2RWvL1IZJRR/
   8O/piISMoDCxoyfbpmegxRuO+8hl5cG/weWo29XEO/ZUxi0W3NcMKBXIj
   SU0TyH4lh530mPVbcLEE/JaStSxLldpIGLCgcjB4NXmFEDFmbB8s3aCVs
   w==;
X-CSE-ConnectionGUID: UoNhfI51R3W9AgeMa7AoPA==
X-CSE-MsgGUID: il/vieLaQm6M0JAuET1BGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526789"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27526789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:18:07 -0700
X-CSE-ConnectionGUID: zMh7ybQBREq1S5kWLHWakA==
X-CSE-MsgGUID: bOGvuwASTMyiqQjy1f47WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68695629"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Aug 2024 03:18:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjyhe-0001ME-2P;
	Fri, 30 Aug 2024 10:18:02 +0000
Date: Fri, 30 Aug 2024 18:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 7644/8126]
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:15: error: implicit
 declaration of function 'devm_regulator_bulk_get_const'; did you mean
 'devm_regulator_bulk_get_enable'?
Message-ID: <202408301813.TesFuSbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: e0cb0c785250d0565c19ba17fc95bd7ab97670ba [7644/8126] drm/panel: visionox-vtdr6130: switch to devm_regulator_bulk_get_const
config: openrisc-randconfig-r022-20230730 (https://download.01.org/0day-ci/archive/20240830/202408301813.TesFuSbh-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301813.TesFuSbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301813.TesFuSbh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c: In function 'visionox_vtdr6130_probe':
>> drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:15: error: implicit declaration of function 'devm_regulator_bulk_get_const'; did you mean 'devm_regulator_bulk_get_enable'? [-Werror=implicit-function-declaration]
     255 |         ret = devm_regulator_bulk_get_const(&dsi->dev,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               devm_regulator_bulk_get_enable
   cc1: some warnings being treated as errors


vim +255 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c

   244	
   245	static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
   246	{
   247		struct device *dev = &dsi->dev;
   248		struct visionox_vtdr6130 *ctx;
   249		int ret;
   250	
   251		ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
   252		if (!ctx)
   253			return -ENOMEM;
   254	
 > 255		ret = devm_regulator_bulk_get_const(&dsi->dev,
   256						    ARRAY_SIZE(visionox_vtdr6130_supplies),
   257						    visionox_vtdr6130_supplies,
   258						    &ctx->supplies);
   259		if (ret < 0)
   260			return ret;
   261	
   262		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
   263		if (IS_ERR(ctx->reset_gpio))
   264			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   265					     "Failed to get reset-gpios\n");
   266	
   267		ctx->dsi = dsi;
   268		mipi_dsi_set_drvdata(dsi, ctx);
   269	
   270		dsi->lanes = 4;
   271		dsi->format = MIPI_DSI_FMT_RGB888;
   272		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
   273				  MIPI_DSI_CLOCK_NON_CONTINUOUS;
   274		ctx->panel.prepare_prev_first = true;
   275	
   276		drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
   277			       DRM_MODE_CONNECTOR_DSI);
   278	
   279		ctx->panel.backlight = visionox_vtdr6130_create_backlight(dsi);
   280		if (IS_ERR(ctx->panel.backlight))
   281			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   282					     "Failed to create backlight\n");
   283	
   284		drm_panel_add(&ctx->panel);
   285	
   286		ret = mipi_dsi_attach(dsi);
   287		if (ret < 0) {
   288			dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
   289			drm_panel_remove(&ctx->panel);
   290			return ret;
   291		}
   292	
   293		return 0;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
