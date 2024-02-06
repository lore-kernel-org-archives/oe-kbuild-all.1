Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58808131E52
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707228012; cv=none; b=ldz3e6fkTrjj1ACGDWwvd0idgIUV1BQHLR+qRTs2SswOQzEBz/RDOfgQn6OA/Q88VsP3SVYhiBkeUyvr9J87FD3VCGsMpeCfVu6BTx/Zl/UrDM7gU/DYELUIIR+7pFfnYoA/gLar/laUpgWYcuPkbty7H/B4LexPesEXJiZ1/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707228012; c=relaxed/simple;
	bh=0MJE2kHMarNpRYNxFT+lefJy0vsxp77D0gUHjl4Awpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJu/5puwffXptqddMf3JcuicYvLPv/qaj1729n7GemrHIpeSOWdHBa0XTPynHWWXOV7zkFtUcQDSFtr3LOcnijudgL6nHuo+9oK1InHP0wjmI9qrDunSKvUZJC3EEXBckaubKgNZeO+q/vZXygRLvUebTlGDEEE12ZZmWosjypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luoPvFF3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luoPvFF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707228011; x=1738764011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0MJE2kHMarNpRYNxFT+lefJy0vsxp77D0gUHjl4Awpk=;
  b=luoPvFF3DNSxvKEiD4GpxhJeKEIMROeiqIkVi9RYvx1tQpbHIRNslv0G
   TsXl2F5LvoWLpoXnwghw1R13yYtcc2gdQFpIDPt+IgleZWM7DW7NZfCJo
   NaeB6NJh2+aVSTnruNXKCWFzgtIG33bma6IXQBHmGE7eaj+D+FPpFWWkv
   1IYtNkLPR8eyCAAfaNwYIhrlILU5VJOe/Z2+thvl1zT1sKPwGjLEChR65
   cDS9muU/kdGwtc8+6JESRU6PvuVZyPteuwOkb9200pqwsBHXKjhRWeypl
   aBOqa/BzJL9MJdQ0zjPyk2TseliWyu0DXednpTmEDPPn8Pk1cHQkyn1/V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="23223400"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="23223400"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1345512"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Feb 2024 06:00:07 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXLzY-0001Ra-0M;
	Tue, 06 Feb 2024 14:00:04 +0000
Date: Tue, 6 Feb 2024 21:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>
Subject: [linux-next:master 3985/4465]
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:113:24: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202402062134.a6CqAt3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac139fc7db67968e5061715508b5fc4aa7c40c56
commit: 059c53e877ca6e723e10490c27c1487a63e66efe [3985/4465] drm/bridge: imx: add driver for HDMI TX Parallel Video Interface
config: arc-randconfig-r113-20240206 (https://download.01.org/0day-ci/archive/20240206/202402062134.a6CqAt3s-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240206/202402062134.a6CqAt3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402062134.a6CqAt3s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:113:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/stackdepot.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +113 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c

    99	
   100	static u32 *
   101	imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
   102						  struct drm_bridge_state *bridge_state,
   103						  struct drm_crtc_state *crtc_state,
   104						  struct drm_connector_state *conn_state,
   105						  u32 output_fmt,
   106						  unsigned int *num_input_fmts)
   107	{
   108		struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
   109		struct drm_bridge *next_bridge = pvi->next_bridge;
   110		struct drm_bridge_state *next_state;
   111	
   112		if (!next_bridge->funcs->atomic_get_input_bus_fmts)
 > 113			return 0;
   114	
   115		next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
   116							     next_bridge);
   117	
   118		return next_bridge->funcs->atomic_get_input_bus_fmts(next_bridge,
   119								     next_state,
   120								     crtc_state,
   121								     conn_state,
   122								     output_fmt,
   123								     num_input_fmts);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
