Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBB26A1CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 21:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961263; cv=none; b=LhbkPQX4Wf+C81ZRhorq/BBcBQbelCRfk6bJmbH3ZVI/L9k0cH8WPl206fxNqSzsAY/1DEReUtQRhpv3AfhvrC7YbZ65UtF7+fpdGlE01hr5UPKkiP4fx0Mj3yLrK8CfpzLgIwTcvryXEU4lhNgQFh2kmWrFo2OfGj9SojU1NPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961263; c=relaxed/simple;
	bh=PflBi2rPgQ1EdgttHcHKn4P6Fa1vBz0HVP9n3BaZvks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ht+X0PfB7uqFmJNffwjfVfDzxYXY6De/IPjgZdggbMrqwncJ/jX+SX63dkNprvbUY5hMvo0R6t+EUsKm+spxpk4QjAo9cxGNmPpx2fQurDWBkYrUEeXW6RgDFQclvkyFDNXhuUViz2X3rCEGlyUMeTvYekQvsNGGZFdUKznjEIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpPNQZMd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpPNQZMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745961262; x=1777497262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PflBi2rPgQ1EdgttHcHKn4P6Fa1vBz0HVP9n3BaZvks=;
  b=HpPNQZMdGO6HOTAVXF9TSo81zgYAIM1bJsO/xnhIvbqNXQBwiwOIp++N
   CZa8hxSewYlwGUuK73VsZECLQu0LWP1Pgav8W8RBBYIbPH/UfhVZaSh27
   Q1S6eNEI0/tRlIObqy5wFSTQ3oGzk7rKTV+bqFO8HCx+81W6NfKMmIBU6
   ic78cH8W7G8rFmN94XeLkIHONG9KYcz31jpDA1E3OHO2tHqDTU/czrvir
   E8kIsnrTepYD57eIExe/4gZH2Lrr/GntSk+1KCetH6Elbf6kwipx4llAy
   WHdxofEqM58tqr+aHQ3VSehSRh6ghg+GUGbdAxTRzOeBw3eODWAOkZPW7
   g==;
X-CSE-ConnectionGUID: h7QUdOXdSgaIuZ39hzFFnw==
X-CSE-MsgGUID: qBWph2Y6THSR+uuu0h0jaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58969092"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58969092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 14:14:21 -0700
X-CSE-ConnectionGUID: ubYRL+JySqqHvWJ8qKc5Kw==
X-CSE-MsgGUID: kAjx4/nVRzGxQxzdtKfIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134439292"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2025 14:14:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9sHQ-0002xF-2N;
	Tue, 29 Apr 2025 21:14:16 +0000
Date: Wed, 30 Apr 2025 05:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 0/1]
 drivers/gpu/drm/bridge/lt9611.c:886: undefined reference to
 `mipi_dsi_detach'
Message-ID: <202504300539.msyZAwlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bjorn,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: e6a29264cb40ef13183ab065e391f320fbcf3ecc [0/1] ANDROID: drm/bridge: Introduce LT9611 DSI to HDMI bridge
config: i386-randconfig-063-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300539.msyZAwlI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300539.msyZAwlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300539.msyZAwlI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_detach':
>> drivers/gpu/drm/bridge/lt9611.c:886: undefined reference to `mipi_dsi_detach'
>> ld: drivers/gpu/drm/bridge/lt9611.c:887: undefined reference to `mipi_dsi_device_unregister'
>> ld: drivers/gpu/drm/bridge/lt9611.c:890: undefined reference to `mipi_dsi_detach'
   ld: drivers/gpu/drm/bridge/lt9611.c:891: undefined reference to `mipi_dsi_device_unregister'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_attach_dsi':
>> drivers/gpu/drm/bridge/lt9611.c:808: undefined reference to `of_find_mipi_dsi_host_by_node'
>> ld: drivers/gpu/drm/bridge/lt9611.c:814: undefined reference to `mipi_dsi_device_register_full'
>> ld: drivers/gpu/drm/bridge/lt9611.c:825: undefined reference to `mipi_dsi_attach'
   ld: drivers/gpu/drm/bridge/lt9611.c:828: undefined reference to `mipi_dsi_device_unregister'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_attach':
>> drivers/gpu/drm/bridge/lt9611.c:876: undefined reference to `mipi_dsi_device_unregister'


vim +886 drivers/gpu/drm/bridge/lt9611.c

   799	
   800	static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
   801							 struct device_node *dsi_node)
   802	{
   803		const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
   804		struct mipi_dsi_device *dsi;
   805		struct mipi_dsi_host *host;
   806		int ret;
   807	
 > 808		host = of_find_mipi_dsi_host_by_node(dsi_node);
   809		if (!host) {
   810			dev_err(lt9611->dev, "failed to find dsi host\n");
   811			return ERR_PTR(-EPROBE_DEFER);
   812		}
   813	
 > 814		dsi = mipi_dsi_device_register_full(host, &info);
   815		if (IS_ERR(dsi)) {
   816			dev_err(lt9611->dev, "failed to create dsi device\n");
   817			return dsi;
   818		}
   819	
   820		dsi->lanes = 4;
   821		dsi->format = MIPI_DSI_FMT_RGB888;
   822		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
   823				  MIPI_DSI_MODE_VIDEO_HSE;
   824	
 > 825		ret = mipi_dsi_attach(dsi);
   826		if (ret < 0) {
   827			dev_err(lt9611->dev, "failed to attach dsi to host\n");
   828			mipi_dsi_device_unregister(dsi);
   829			return ERR_PTR(ret);
   830		}
   831	
   832		return dsi;
   833	}
   834	
   835	static int lt9611_bridge_attach(struct drm_bridge *bridge)
   836	{
   837		struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
   838		int ret;
   839	
   840		dev_dbg(lt9611->dev, "bridge attach\n");
   841	
   842		ret = drm_connector_init(bridge->dev, &lt9611->connector,
   843					 &lt9611_bridge_connector_funcs,
   844					 DRM_MODE_CONNECTOR_HDMIA);
   845		if (ret) {
   846			DRM_ERROR("Failed to initialize connector with drm\n");
   847			return ret;
   848		}
   849	
   850		drm_connector_helper_add(&lt9611->connector,
   851					 &lt9611_bridge_connector_helper_funcs);
   852		drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
   853	
   854		if (!bridge->encoder) {
   855			DRM_ERROR("Parent encoder object not found");
   856			return -ENODEV;
   857		}
   858	
   859		/* Attach primary DSI */
   860		lt9611->dsi0 = lt9611_attach_dsi(lt9611, lt9611->dsi0_node);
   861		if (IS_ERR(lt9611->dsi0))
   862			return PTR_ERR(lt9611->dsi0);
   863	
   864		/* Attach secondary DSI, if specified */
   865		if (lt9611->dsi1_node) {
   866			lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
   867			if (IS_ERR(lt9611->dsi1)) {
   868				ret = PTR_ERR(lt9611->dsi1);
   869				goto err_unregister_dsi0;
   870			}
   871		}
   872	
   873		return 0;
   874	
   875	err_unregister_dsi0:
 > 876		mipi_dsi_device_unregister(lt9611->dsi0);
   877	
   878		return ret;
   879	}
   880	
   881	static void lt9611_bridge_detach(struct drm_bridge *bridge)
   882	{
   883		struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
   884	
   885		if (lt9611->dsi1) {
 > 886			mipi_dsi_detach(lt9611->dsi1);
 > 887			mipi_dsi_device_unregister(lt9611->dsi1);
   888		}
   889	
 > 890		mipi_dsi_detach(lt9611->dsi0);
   891		mipi_dsi_device_unregister(lt9611->dsi0);
   892	}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
