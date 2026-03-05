Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79867366DAD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698297; cv=none; b=XFmkBsXcotnHAn0Km2RNMjKU3r7UlmUxsUrrC1wQ/fNjzN8Fd0he8ggZsemHliOJrD9ovDEF8eaHbM2mD2I3n3FlphHNwRC60sg6xoWm3w2c8HLW1M6skFu+tYZKTtsRe635iWpeZaF41ovjxyDsC0eWYNzkOsilfOUPnGtUqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698297; c=relaxed/simple;
	bh=WAcVTOt8LWd4SNUOQSbrzyqVpf00n3+8WAsCvp5O5do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Crov7moolDTCFKz4LZZdo9vjfS6h0GlYSMqhiPCjMckEmldfaLjpC2ZNqQ0013OQ8Cjb1hfYPCObws6tHpFknXGobKG+9BlgkPnCUVba3UN6DT5Lr/NiqTXmVAa6tYZkk2W/5BGlzA8PcbOGAGGP1kRBjc2vlZwMZ7IZ2jN2R0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuLVcRLa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuLVcRLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772698296; x=1804234296;
  h=date:from:to:cc:subject:message-id;
  bh=WAcVTOt8LWd4SNUOQSbrzyqVpf00n3+8WAsCvp5O5do=;
  b=YuLVcRLajG8asB6hvfqUcRMymF4av8qm2Qsqnt3I1sFGGxPyzq79yqfb
   LI3Yicy6ftuby0rwDRXe9pgTarhdv+nPxN0RWYRhCwKj8FVq7ujShN7lu
   yIWlhk2gov0raGeiOkxQ7bcwosMwbR6sRDda/J4LlQf9NOEJgMlfV5/bB
   eFoG3bHsxjMT8q4pXfuhD+4E2OKkRO6uGrivGs9Lj9eMiMmiLNCqIfzEN
   z3ewL1e1l/aLKXiB85hPoGZw1cWK4zWztP2d8B6asOiFviuMp51nkYdpr
   AgIjLKugBj7SwWdlsVDb1qZ5jFU8kuw+NJliUWXeFqvhbP2U7EbVaF/FM
   Q==;
X-CSE-ConnectionGUID: 7F00IdBcSQevFQL1lY5WNQ==
X-CSE-MsgGUID: vj5b7MhFTJaobEyv6bQEdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77621851"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77621851"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:11:36 -0800
X-CSE-ConnectionGUID: R4hWXw3IQ1msJ0dS7icBcA==
X-CSE-MsgGUID: 9oII6FIvSnirDvZLZ/v8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216418400"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 00:11:35 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy3nw-000000000Gu-0KeK;
	Thu, 05 Mar 2026 08:11:32 +0000
Date: Thu, 05 Mar 2026 16:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 410/410]
 drivers/gpu/drm/meson/meson_vclk.c:402:17: warning: this decimal constant is
 unsigned only in ISO C90
Message-ID: <202603051523.GxjcsddR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   91d48252ad4b17577cf8cc8d3e1353402e4da8f1
commit: 363e639977982308ee6ea99426f98e7a33204545 [410/410] drm/meson: use unsigned long long / Hz for frequency types
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260305/202603051523.GxjcsddR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051523.GxjcsddR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051523.GxjcsddR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/meson/meson_vclk.c:402:17: warning: this decimal constant is unsigned only in ISO C90
     402 |                 .pll_freq = 2970000000,
         |                 ^
   drivers/gpu/drm/meson/meson_vclk.c:414:17: warning: this decimal constant is unsigned only in ISO C90
     414 |                 .pll_freq = 2970000000,
         |                 ^
   drivers/gpu/drm/meson/meson_vclk.c:426:17: warning: this decimal constant is unsigned only in ISO C90
     426 |                 .pll_freq = 2970000000,
         |                 ^
   drivers/gpu/drm/meson/meson_vclk.c:439:17: warning: this decimal constant is unsigned only in ISO C90
     439 |                 .phy_freq = 2970000000,
         |                 ^
   drivers/gpu/drm/meson/meson_vclk.c:463:17: warning: this decimal constant is unsigned only in ISO C90
     463 |                 .phy_freq = 2970000000,
         |                 ^
   drivers/gpu/drm/meson/meson_vclk.c: In function 'meson_vclk_set':
   drivers/gpu/drm/meson/meson_vclk.c:835:17: warning: this decimal constant is unsigned only in ISO C90
     835 |                 case 2970000000:
         |                 ^~~~
   drivers/gpu/drm/meson/meson_vclk.c:853:17: warning: this decimal constant is unsigned only in ISO C90
     853 |                 case 2970000000:
         |                 ^~~~
   drivers/gpu/drm/meson/meson_vclk.c:870:17: warning: this decimal constant is unsigned only in ISO C90
     870 |                 case 2970000000:
         |                 ^~~~


vim +402 drivers/gpu/drm/meson/meson_vclk.c

   364	
   365	struct meson_vclk_params {
   366		unsigned long long pll_freq;
   367		unsigned long long phy_freq;
   368		unsigned long long vclk_freq;
   369		unsigned long long venc_freq;
   370		unsigned long long pixel_freq;
   371		unsigned int pll_od1;
   372		unsigned int pll_od2;
   373		unsigned int pll_od3;
   374		unsigned int vid_pll_div;
   375		unsigned int vclk_div;
   376	} params[] = {
   377		[MESON_VCLK_HDMI_ENCI_54000] = {
   378			.pll_freq = 4320000000,
   379			.phy_freq = 270000000,
   380			.vclk_freq = 54000000,
   381			.venc_freq = 54000000,
   382			.pixel_freq = 54000000,
   383			.pll_od1 = 4,
   384			.pll_od2 = 4,
   385			.pll_od3 = 1,
   386			.vid_pll_div = VID_PLL_DIV_5,
   387			.vclk_div = 1,
   388		},
   389		[MESON_VCLK_HDMI_DDR_54000] = {
   390			.pll_freq = 4320000000,
   391			.phy_freq = 270000000,
   392			.vclk_freq = 54000000,
   393			.venc_freq = 54000000,
   394			.pixel_freq = 27000000,
   395			.pll_od1 = 4,
   396			.pll_od2 = 4,
   397			.pll_od3 = 1,
   398			.vid_pll_div = VID_PLL_DIV_5,
   399			.vclk_div = 1,
   400		},
   401		[MESON_VCLK_HDMI_DDR_148500] = {
 > 402			.pll_freq = 2970000000,
   403			.phy_freq = 742500000,
   404			.vclk_freq = 148500000,
   405			.venc_freq = 148500000,
   406			.pixel_freq = 74250000,
   407			.pll_od1 = 4,
   408			.pll_od2 = 1,
   409			.pll_od3 = 1,
   410			.vid_pll_div = VID_PLL_DIV_5,
   411			.vclk_div = 1,
   412		},
   413		[MESON_VCLK_HDMI_74250] = {
   414			.pll_freq = 2970000000,
   415			.phy_freq = 742500000,
   416			.vclk_freq = 74250000,
   417			.venc_freq = 74250000,
   418			.pixel_freq = 74250000,
   419			.pll_od1 = 2,
   420			.pll_od2 = 2,
   421			.pll_od3 = 2,
   422			.vid_pll_div = VID_PLL_DIV_5,
   423			.vclk_div = 1,
   424		},
   425		[MESON_VCLK_HDMI_148500] = {
   426			.pll_freq = 2970000000,
   427			.phy_freq = 1485000000,
   428			.vclk_freq = 148500000,
   429			.venc_freq = 148500000,
   430			.pixel_freq = 148500000,
   431			.pll_od1 = 1,
   432			.pll_od2 = 2,
   433			.pll_od3 = 2,
   434			.vid_pll_div = VID_PLL_DIV_5,
   435			.vclk_div = 1,
   436		},
   437		[MESON_VCLK_HDMI_297000] = {
   438			.pll_freq = 5940000000,
   439			.phy_freq = 2970000000,
   440			.venc_freq = 297000000,
   441			.vclk_freq = 297000000,
   442			.pixel_freq = 297000000,
   443			.pll_od1 = 2,
   444			.pll_od2 = 1,
   445			.pll_od3 = 1,
   446			.vid_pll_div = VID_PLL_DIV_5,
   447			.vclk_div = 2,
   448		},
   449		[MESON_VCLK_HDMI_594000] = {
   450			.pll_freq = 5940000000,
   451			.phy_freq = 5940000000,
   452			.venc_freq = 594000000,
   453			.vclk_freq = 594000000,
   454			.pixel_freq = 594000000,
   455			.pll_od1 = 1,
   456			.pll_od2 = 1,
   457			.pll_od3 = 2,
   458			.vid_pll_div = VID_PLL_DIV_5,
   459			.vclk_div = 1,
   460		},
   461		[MESON_VCLK_HDMI_594000_YUV420] = {
   462			.pll_freq = 5940000000,
   463			.phy_freq = 2970000000,
   464			.venc_freq = 594000000,
   465			.vclk_freq = 594000000,
   466			.pixel_freq = 297000000,
   467			.pll_od1 = 2,
   468			.pll_od2 = 1,
   469			.pll_od3 = 1,
   470			.vid_pll_div = VID_PLL_DIV_5,
   471			.vclk_div = 1,
   472		},
   473		{ /* sentinel */ },
   474	};
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
