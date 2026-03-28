Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9EE33CE92
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 20:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774728543; cv=none; b=jwcaACLi6Z3EM6SXk9MDPAH5YCfSQjMv9rxKME0mDw437HKtRbebEleKIaUV/P7O/yWqPff8I8kUQuiHak8PFVzQNDyPJwy3pBs/t2l9DnnIS3Iu3rpkcXn48uqFR6ewg34xMYZRFEkRQIu9g97my7kWTjRtVXMU3DRuZaEFgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774728543; c=relaxed/simple;
	bh=Zp9Dxd4PmK1+0RXuo19KeVYFCQr5tYZE8oQlIlccaGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFBURgykdb5gVfWYFfK/65xfpUAg4j9LiLUmjK6MrAt2dw5/6JvZzZw/uRGm8o0rV/4DsTGbEJTaYTHXRX7y5WUO0FQWwSmwmGCpeguvbb/OL6fy6X+ctXHA+gRCcV8Iy9bKdwqLQV2TVhIz3P+sCnf4QaYFYIr3+lPTjBve2hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5wWlCqM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5wWlCqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774728540; x=1806264540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zp9Dxd4PmK1+0RXuo19KeVYFCQr5tYZE8oQlIlccaGA=;
  b=S5wWlCqMI4DdIpNwhf2PO95kOX+nBc4gJi4ULHbyhfMCBQRtwce7wrVB
   FR4pgvFHpu5kTuy4gimjJlN5EBng9aG1OrRIvueiQdXyBvQtJ9+w86dL3
   b2bRkCXvkRdc9nCD42wdcaG0xKxZH3PwEs0RLSm/MinJtmJ45nxKexgKi
   Pckx1n5fhUuJVFdf+LnYCG1TM9CxtdLo8QNpxDr7/qfiZdk1Tr4kjfQ2h
   QaCQDA4qq7dALRkRQ6XD6hO5VA8bTPqi81RYMG0VcK62qp169ur77hIaV
   wrBikw/99cLEthN3ULm2WkExJIVMk/u304ZmQBvW27csC60wN/HiQhS5n
   A==;
X-CSE-ConnectionGUID: u4iSaEW4T3mFSqiEekLObA==
X-CSE-MsgGUID: AyzhnYKlStyMRjGlHMS24w==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87158755"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="87158755"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 13:09:00 -0700
X-CSE-ConnectionGUID: 2P3+ksYtQx+PJgUnMnMsKg==
X-CSE-MsgGUID: 8sC0RSNVRjaHZpdvDnQjIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="225883955"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2026 13:08:55 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Zxk-00000000Bjd-1D26;
	Sat, 28 Mar 2026 20:08:52 +0000
Date: Sun, 29 Mar 2026 04:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jay Liu <jay.liu@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v4 6/6] drm/mediatek: Add TDSHP component support for
 MT8196
Message-ID: <202603290406.4CTuDfmw-lkp@intel.com>
References: <20260324125315.4715-7-jay.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324125315.4715-7-jay.liu@mediatek.com>

Hi Jay,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next pza/reset/next linus/master v7.0-rc5 next-20260327]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jay-Liu/dt-bindings-display-mediatek-gamma-Add-support-for-MT8196/20260328-083359
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260324125315.4715-7-jay.liu%40mediatek.com
patch subject: [PATCH v4 6/6] drm/mediatek: Add TDSHP component support for MT8196
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260329/202603290406.4CTuDfmw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290406.4CTuDfmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603290406.4CTuDfmw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:509:10: error: 'DDP_COMPONENT_CCORR0' undeclared here (not in a function); did you mean 'DDP_COMPONENT_CCORR'?
     509 |         [DDP_COMPONENT_CCORR0]          = { MTK_DISP_CCORR,             0, &ddp_ccorr },
         |          ^~~~~~~~~~~~~~~~~~~~
         |          DDP_COMPONENT_CCORR
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:509:10: error: array index in initializer not of integer type
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:509:10: note: (near initialization for 'mtk_ddp_matches')
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:510:10: error: 'DDP_COMPONENT_CCORR1' undeclared here (not in a function); did you mean 'DDP_COMPONENT_CCORR'?
     510 |         [DDP_COMPONENT_CCORR1]          = { MTK_DISP_CCORR,             1, &ddp_ccorr },
         |          ^~~~~~~~~~~~~~~~~~~~
         |          DDP_COMPONENT_CCORR
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:510:10: error: array index in initializer not of integer type
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:510:10: note: (near initialization for 'mtk_ddp_matches')
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:511:43: warning: initialized field overwritten [-Woverride-init]
     511 |         [DDP_COMPONENT_COLOR0]          = { MTK_DISP_COLOR,             0, &ddp_color },
         |                                           ^
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:511:43: note: (near initialization for 'mtk_ddp_matches[4]')
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:547:10: error: 'DDP_COMPONENT_TDSHP0' undeclared here (not in a function); did you mean 'DDP_COMPONENT_DSI0'?
     547 |         [DDP_COMPONENT_TDSHP0]          = { MTK_DISP_TDSHP,             0, &ddp_tdshp },
         |          ^~~~~~~~~~~~~~~~~~~~
         |          DDP_COMPONENT_DSI0
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:547:10: error: array index in initializer not of integer type
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:547:10: note: (near initialization for 'mtk_ddp_matches')
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:548:43: warning: initialized field overwritten [-Woverride-init]
     548 |         [DDP_COMPONENT_UFOE]            = { MTK_DISP_UFOE,              0, &ddp_ufoe },
         |                                           ^
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:548:43: note: (near initialization for 'mtk_ddp_matches[57]')


vim +547 drivers/gpu/drm/mediatek/mtk_ddp_comp.c

   504	
   505	static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX] = {
   506		[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
   507		[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
   508		[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
   509		[DDP_COMPONENT_CCORR0]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
 > 510		[DDP_COMPONENT_CCORR1]		= { MTK_DISP_CCORR,		1, &ddp_ccorr },
   511		[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
   512		[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
   513		[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
   514		[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0, &ddp_dpi },
   515		[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1, &ddp_dpi },
   516		[DDP_COMPONENT_DPI0]		= { MTK_DPI,			0, &ddp_dpi },
   517		[DDP_COMPONENT_DPI1]		= { MTK_DPI,			1, &ddp_dpi },
   518		[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
   519		[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		0, &ddp_dsc },
   520		[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		1, &ddp_dsc },
   521		[DDP_COMPONENT_DSI0]		= { MTK_DSI,			0, &ddp_dsi },
   522		[DDP_COMPONENT_DSI1]		= { MTK_DSI,			1, &ddp_dsi },
   523		[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
   524		[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
   525		[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
   526		[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
   527		[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
   528		[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,		2, &ddp_merge },
   529		[DDP_COMPONENT_MERGE3]		= { MTK_DISP_MERGE,		3, &ddp_merge },
   530		[DDP_COMPONENT_MERGE4]		= { MTK_DISP_MERGE,		4, &ddp_merge },
   531		[DDP_COMPONENT_MERGE5]		= { MTK_DISP_MERGE,		5, &ddp_merge },
   532		[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,		0, &ddp_od },
   533		[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,		1, &ddp_od },
   534		[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,		0, &ddp_ovl },
   535		[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,		1, &ddp_ovl },
   536		[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,		0, &ddp_ovl },
   537		[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,		1, &ddp_ovl },
   538		[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,		2, &ddp_ovl },
   539		[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,		0, &ddp_postmask },
   540		[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,		0, NULL },
   541		[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,		1, NULL },
   542		[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,		2, NULL },
   543		[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,		0, &ddp_rdma },
   544		[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,		1, &ddp_rdma },
   545		[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,		2, &ddp_rdma },
   546		[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,		4, &ddp_rdma },
 > 547		[DDP_COMPONENT_TDSHP0]		= { MTK_DISP_TDSHP,		0, &ddp_tdshp },
   548		[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,		0, &ddp_ufoe },
   549		[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,		0, NULL },
   550		[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
   551	};
   552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
