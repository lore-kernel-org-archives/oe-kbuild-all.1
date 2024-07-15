Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF81B7E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721064796; cv=none; b=q2XOwveURMvk2SoiJYGdol/u64RlEQfzQ1OrqLofzdPhLnBgBWNA/DFbyq3MMAj2wU0UV5S27QaWFcFtX+gQbrg+d3snA4DRTpGkQ6BntdDDqLQwpmh3vknmBtZbywhS+trl71uNcFEkGCHrqeB3hP/p5RMEdCPo1CIPwPsgqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721064796; c=relaxed/simple;
	bh=zTszMZkp+jtf7diXqnKLRkBuUAa7MiaXTScDezXz6vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXKPCtFN42JooUZphOg3ufsItuzpqLSalh7jB5IVDeMYRylxgfPYZbapGMERKAQfvtXXpYWK9bW5FL/RTZIhNhAa4ZBQLef5zEcrIBKu2szoE1DjaCZgTEPU0kc65XAHESOa+dP4H5GNdfPmqUeDFJ7LYcWjWHjM+BO0eb2Or2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4r4Nkhb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4r4Nkhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721064794; x=1752600794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTszMZkp+jtf7diXqnKLRkBuUAa7MiaXTScDezXz6vg=;
  b=l4r4Nkhbq6b3/MEbq3NjUCQaGRVzGxaqN7dDp4OVLpUKuNeSkCFpRsno
   NV20EjjFBK9s+hvL+ZzslTMwUo4mb/edi0ATmjtM48d1ncCBst+hKSopo
   ot2MWn5kDS4Vykbcqn5Ba+SqJTw8hrfwNESeEHr1EQeYDNROLnvOFrt70
   f4N1P8nr/P3HZ9RDzs5NIh6RSIe3lV1WOQVDW5sKV3Zf95OewM7l7N6NN
   wCAHGP9/V28p3eaqo47Lw1Gjc7bjkldrA6PKhm50uuLLFy4FaaH6JjVeo
   lrlQRji8vQixTadLvFtoFIyOAazACnyaCvElFzRAe7B6dObhbU4Sojd5P
   w==;
X-CSE-ConnectionGUID: WpMUZwJCS5+Em0v9vosRgA==
X-CSE-MsgGUID: 66SdchOeS7i2i0noRsApAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18592334"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="18592334"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 10:33:14 -0700
X-CSE-ConnectionGUID: +Ko1gxxUTM66KZVDO8/adA==
X-CSE-MsgGUID: iodIhe7iRJ2OCr1a289Gbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="54869829"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2024 10:33:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTPZX-000eRW-0Y;
	Mon, 15 Jul 2024 17:33:11 +0000
Date: Tue, 16 Jul 2024 01:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1768/30000]
 drivers/gpu/drm/bridge/lt9611.c:886:undefined reference to `mipi_dsi_detach'
Message-ID: <202407160116.qI0lkesr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   dc1385281a63d08948c1bd1d7e064e0705ed1829
commit: e6a29264cb40ef13183ab065e391f320fbcf3ecc [1768/30000] ANDROID: drm/bridge: Introduce LT9611 DSI to HDMI bridge
config: i386-randconfig-002-20240715 (https://download.01.org/0day-ci/archive/20240716/202407160116.qI0lkesr-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160116.qI0lkesr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407160116.qI0lkesr-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_detach':
>> drivers/gpu/drm/bridge/lt9611.c:886:(.text+0x606): undefined reference to `mipi_dsi_detach'
>> ld: drivers/gpu/drm/bridge/lt9611.c:887:(.text+0x611): undefined reference to `mipi_dsi_device_unregister'
>> ld: drivers/gpu/drm/bridge/lt9611.c:890:(.text+0x61c): undefined reference to `mipi_dsi_detach'
   ld: drivers/gpu/drm/bridge/lt9611.c:891:(.text+0x627): undefined reference to `mipi_dsi_device_unregister'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_attach_dsi':
>> drivers/gpu/drm/bridge/lt9611.c:808:(.text+0x934): undefined reference to `of_find_mipi_dsi_host_by_node'
>> ld: drivers/gpu/drm/bridge/lt9611.c:814:(.text+0x940): undefined reference to `mipi_dsi_device_register_full'
>> ld: drivers/gpu/drm/bridge/lt9611.c:825:(.text+0x96c): undefined reference to `mipi_dsi_attach'
   ld: drivers/gpu/drm/bridge/lt9611.c:828:(.text+0x9a1): undefined reference to `mipi_dsi_device_unregister'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_attach':
>> drivers/gpu/drm/bridge/lt9611.c:876:(.text+0xa99): undefined reference to `mipi_dsi_device_unregister'


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
