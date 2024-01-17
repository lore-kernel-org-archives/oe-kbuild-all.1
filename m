Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865822EF8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 19:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705519704; cv=none; b=cMpbO06BDkQTwyjVZmJZcOEWWn66V2MyEszu2bP/J3aExGU1DWV1AvnrEdpd79AkIfz7e5Dj+HL90lfGnaI0THDYv7DlpHBOts86tgiDVsR1S1NYh32KH5yWgQKNkLcL3fwog5/HdWbSD1QF5lmq3VgWSVPqwdLiyDiPvmlXNSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705519704; c=relaxed/simple;
	bh=h8O16ssGriixfGLnUAI/DyE7WjAj+n1hG+HeHsnZnVg=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=KHSM34T56xD08C112NeDW32cAh8BMzW6Ic3xnAbjBaFwLWfNRXE7zmE098EJJFmFP/H2UIDTXUv/zn8I470SvKq3HJMiVL8g2PQ8qW1sSsgSmyp5DiGvbUiipmmrmT0Ew+FpHAI+S8LYdQ0TExjy0R7f57JrJegucEgBvMrow+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbK36d54; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbK36d54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705519702; x=1737055702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8O16ssGriixfGLnUAI/DyE7WjAj+n1hG+HeHsnZnVg=;
  b=FbK36d54t+USKlI2xY4pRYEfo2lnaNil6r7l84mIfhJebF9pRkSZk0/X
   b/OameG/1SgWIXybxbqeCd8AuYLMKii79yZUvjtorhAFbpN6YSwptbytI
   PLeOiOTrvzLqCzap//rqncLnV83Lv1MAZVR/JSWYeIWj5KrlLuPw7L+um
   uqd+AaS2aF0eLjMGDEdsYnUlkBglmdjUtTppJ46raLdSvuaBhLUVmLKXK
   pDmq+d/oSYoqlR1u7fFqszj+wrVSh1+r/dXBGxExRLq3JVDC+l3Oe6Lff
   N9BJMKOfNF7Bx0OIEiXKn6ytln4qA9lAFg1K+J3JHEMYrrkDnRbK2hDOY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13610972"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="13610972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 11:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="156238"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2024 11:28:13 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQBa7-0002HO-0z;
	Wed, 17 Jan 2024 19:28:11 +0000
Date: Thu, 18 Jan 2024 03:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 1757/30000]
 drivers/gpu/drm/bridge/lt9611.c:886: undefined reference to
 `mipi_dsi_detach'
Message-ID: <202401180357.7csE5Lu3-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   6b3eb66c013ce70991bf8a68e1c3c811512312df
commit: e6a29264cb40ef13183ab065e391f320fbcf3ecc [1757/30000] ANDROID: drm/bridge: Introduce LT9611 DSI to HDMI bridge
config: x86_64-randconfig-072-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180357.7csE5Lu3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180357.7csE5Lu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180357.7csE5Lu3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_detach':
>> drivers/gpu/drm/bridge/lt9611.c:886: undefined reference to `mipi_dsi_detach'
>> ld: drivers/gpu/drm/bridge/lt9611.c:887: undefined reference to `mipi_dsi_device_unregister'
>> ld: drivers/gpu/drm/bridge/lt9611.c:890: undefined reference to `mipi_dsi_detach'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_attach_dsi':
>> drivers/gpu/drm/bridge/lt9611.c:808: undefined reference to `of_find_mipi_dsi_host_by_node'
>> ld: drivers/gpu/drm/bridge/lt9611.c:814: undefined reference to `mipi_dsi_device_register_full'
>> ld: drivers/gpu/drm/bridge/lt9611.c:825: undefined reference to `mipi_dsi_attach'
   ld: drivers/gpu/drm/bridge/lt9611.c:828: undefined reference to `mipi_dsi_device_unregister'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_attach':
>> drivers/gpu/drm/bridge/lt9611.c:876: undefined reference to `mipi_dsi_device_unregister'
   ld: drivers/gpu/drm/bridge/lt9611.o: in function `lt9611_bridge_detach':
   drivers/gpu/drm/bridge/lt9611.c:891: undefined reference to `mipi_dsi_device_unregister'


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
