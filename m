Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383736167F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082567; cv=none; b=kh+3wqmaBcU5T9ja/tIKC2TJwjBvm6VsizuRJIFWgU1OYQ7LKGMpHcDMYbAjAwBaDxNSeoy2G23z91x/y7fK/ezRZEmkt/u8ephtpkFZuxNeQW/K1vTatUWTsu2+Ta5MI8bLXwjHZYeVfFyMyUUDUHT7H8ZW6/qTAkziF2w7IpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082567; c=relaxed/simple;
	bh=w0ZyEjxJd7OMr22SSZDu9IrK9rQED4qDX/i51YMI2YM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nPxNQQS3xBIJ4+euCRehdhIoR/vi0mc3mKH5HrXk2W+BC+KLQm2M6kpCT3WA9NU1G+vyYhr/ZBiaV5bGQoo6J+xFdizG4PMcOfXvIAwmBEaowBy8AU6ZIt7/jcwMC5aqqMGNuaKNAckQhXMeFIQijPkrRaghm5AvEYGzPgAU4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oqq7+TUM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oqq7+TUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776082565; x=1807618565;
  h=date:from:to:cc:subject:message-id;
  bh=w0ZyEjxJd7OMr22SSZDu9IrK9rQED4qDX/i51YMI2YM=;
  b=Oqq7+TUMgV0I7RB5+tAzOuFq5EeiLoruEIR4Nv0GilA2YurVQ/rgnfUo
   6J/qQFXdVfuI2BXaW6tzO1hb8ournDT5rI+nGygUecTBKoCMpY/VNWc1T
   LfuOaZSv0W3flagBXf1bzKY8lU+Z+A3b0ChSzTNAynuQhZqwlR7WuveK/
   SQ/fc56SyzpoWsea0A+f3yNwMrGLwdKQ1n2UqnxPHCFD6EMOj8S3HNWkr
   K670TL/b84IHluzWoGIGKeklkXGO/hqDtuWN84dbj8uzTP+4beKT5ERxf
   rxWmJqe8Jc4N4BvbadKOTdUCcSevh020Rn+jFgUTwNRk8pGicoUXrg15X
   g==;
X-CSE-ConnectionGUID: WIn+6odgSeaGfcZdMMw1yw==
X-CSE-MsgGUID: LVf3JiykSDqZcqg0Rc5n1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="94406708"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="94406708"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 05:16:04 -0700
X-CSE-ConnectionGUID: Tk4RLGRiTK6i5YIpzSJbeA==
X-CSE-MsgGUID: h3eBpoUORzKF46YgpjxhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="253172095"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Apr 2026 05:16:02 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCGCt-000000000Uv-2b36;
	Mon, 13 Apr 2026 12:15:59 +0000
Date: Mon, 13 Apr 2026 20:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Subject: drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:53:12: sparse:
 sparse: symbol 'mtk_hdmi_v2_clk_names' was not declared. Should it be static?
Message-ID: <202604132044.fcYjEcU8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   028ef9c96e96197026887c0f092424679298aae8
commit: 8d0f798862731c62b09e7138a9032964d70566c2 drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
date:   5 months ago
config: powerpc64-randconfig-r131-20260413 (https://download.01.org/0day-ci/archive/20260413/202604132044.fcYjEcU8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132044.fcYjEcU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132044.fcYjEcU8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_hdmi_v2.c:53:12: sparse: sparse: symbol 'mtk_hdmi_v2_clk_names' was not declared. Should it be static?
--
>> drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:384:24: sparse: sparse: symbol 'mtk_hdmi_ddc_v2_driver' was not declared. Should it be static?

vim +/mtk_hdmi_v2_clk_names +53 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c

    52	
  > 53	const char *const mtk_hdmi_v2_clk_names[MTK_HDMI_V2_CLK_COUNT] = {
    54		[MTK_HDMI_V2_CLK_HDMI_APB_SEL] = "bus",
    55		[MTK_HDMI_V2_CLK_HDCP_SEL] = "hdcp",
    56		[MTK_HDMI_V2_CLK_HDCP_24M_SEL] = "hdcp24m",
    57		[MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI] = "hdmi-split",
    58	};
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
