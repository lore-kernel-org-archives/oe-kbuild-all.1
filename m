Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999AE2DF717
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285000; cv=none; b=GHdaJhLFLu300LssolPWxpCd6MASKGAbnFPITecL10zpZKGiZkldJxE48PuLF63lt8y/AGS1lgM1h7oB4+yloyd1L8+oabhkM5w3IwhGROYx6vaEPHdqjghnJFoHoe1gVnoSRZVLnbWsq2pdOuo9+or/etogtGs2adgI8hjAOJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285000; c=relaxed/simple;
	bh=dPJf/aaO1OICuzpPK0wNp/U/7fygd93SVYJT9Uh/GdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BQ1Ebm5qJ6veZQ23fNt+/gBwnTXgd7vW8gtcvKbhqZ+uwtndMuYBfnFEnjVBLkGNcNpn8OJ0PtYAFyZWxSKqCdcgb7L0BIpmXWTdWOPARS3F7Hh+PRpOSxmiTL8oxR2fFCn4namN1urPlHPBqlf1fExIBhwehv+hypwlnxqrNfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiwvQ9FT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiwvQ9FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781284990; x=1812820990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dPJf/aaO1OICuzpPK0wNp/U/7fygd93SVYJT9Uh/GdE=;
  b=QiwvQ9FTOB5eefk4tbUrt8HWcCUKEdJy5Vx5o7Mc1HO1x+0p5VtdfTvk
   EWKPejuMsL5gOUOkhe5adkCTWnPNy4OqdRsN2Qbcx6hwXJXI5SXooPK+r
   nmJjRZQsAQ06Zx0IUSc3kfheWIDui6iyP81QZ8x9LWJfYM9uOUoB2yM7E
   VZkOhj/lRpJLLSHimZQQtAh+fjPwglFLN1/SHBIqvjy3kI8EQPSzSAIbl
   P4lzIbaVoUJGAqlZimkTABCuHse/AArWL/wrqU5T3SgWSFKH/srkwWo6u
   Cyvdo56ZfQ95P5AEorddgTlXo/NvAHsBoNoX9L6xLkekEvgfpiHXWWXyC
   Q==;
X-CSE-ConnectionGUID: gAm+Ep6PRge6fzGIcqTYDA==
X-CSE-MsgGUID: OZVFs1f8TmShfOa6Igx98A==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82310727"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="82310727"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 10:23:09 -0700
X-CSE-ConnectionGUID: glBKzg7sQrC7wXBF4pjx8g==
X-CSE-MsgGUID: p2D9+gH7QPWLhXm09Ibr3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="242728286"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2026 10:23:07 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY5ay-00000000P7l-32OT;
	Fri, 12 Jun 2026 17:23:04 +0000
Date: Sat, 13 Jun 2026 01:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9768/9870]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/displ?=
 =?us-ascii?Q?ay=5Fmode=5Fvba=5F32.c:3763:1:?= warning: the frame size of
 3104 bytes is larger than 3072 bytes
Message-ID: <202606130112.8WxdtTXb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
commit: c5a3fe7d54a77d614b35dcbcfa6a1b9fc40f6a68 [9768/9870] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606130112.8WxdtTXb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130112.8WxdtTXb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130112.8WxdtTXb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function 'dml32_ModeSupportAndSystemConfigurationFull':
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3763:1: warning: the frame size of 3104 bytes is larger than 3072 bytes [-Wframe-larger-than=]
    3763 | } // ModeSupportAndSystemConfigurationFull
         | ^


vim +3763 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c

dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1739  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1740  	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  1741  	if (mode_lib->validate_max_state)
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  1742  		start_state = v->soc.num_states - 1;
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  1743  	else
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  1744  		start_state = 0;
59b4c07892d8cc Martin Leung              2022-12-12  1745  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1746  	/*Scale Ratio, taps Support Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1747  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1748  	mode_lib->vba.ScaleRatioAndTapsSupport = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1749  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1750  		if (mode_lib->vba.ScalerEnabled[k] == false
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1751  				&& ((mode_lib->vba.SourcePixelFormat[k] != dm_444_64
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1752  						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1753  						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1754  						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1755  						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_8
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1756  						&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1757  						&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe_alpha)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1758  						|| mode_lib->vba.HRatio[k] != 1.0 || mode_lib->vba.htaps[k] != 1.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1759  						|| mode_lib->vba.VRatio[k] != 1.0 || mode_lib->vba.vtaps[k] != 1.0)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1760  			mode_lib->vba.ScaleRatioAndTapsSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1761  		} else if (mode_lib->vba.vtaps[k] < 1.0 || mode_lib->vba.vtaps[k] > 8.0 || mode_lib->vba.htaps[k] < 1.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1762  				|| mode_lib->vba.htaps[k] > 8.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1763  				|| (mode_lib->vba.htaps[k] > 1.0 && (mode_lib->vba.htaps[k] % 2) == 1)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1764  				|| mode_lib->vba.HRatio[k] > mode_lib->vba.MaxHSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1765  				|| mode_lib->vba.VRatio[k] > mode_lib->vba.MaxVSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1766  				|| mode_lib->vba.HRatio[k] > mode_lib->vba.htaps[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1767  				|| mode_lib->vba.VRatio[k] > mode_lib->vba.vtaps[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1768  				|| (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1769  						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1770  						&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1771  						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1772  						&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_8
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1773  						&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1774  						&& (mode_lib->vba.VTAPsChroma[k] < 1
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1775  								|| mode_lib->vba.VTAPsChroma[k] > 8
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1776  								|| mode_lib->vba.HTAPsChroma[k] < 1
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1777  								|| mode_lib->vba.HTAPsChroma[k] > 8
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1778  								|| (mode_lib->vba.HTAPsChroma[k] > 1
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1779  										&& mode_lib->vba.HTAPsChroma[k] % 2
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1780  												== 1)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1781  								|| mode_lib->vba.HRatioChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1782  										> mode_lib->vba.MaxHSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1783  								|| mode_lib->vba.VRatioChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1784  										> mode_lib->vba.MaxVSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1785  								|| mode_lib->vba.HRatioChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1786  										> mode_lib->vba.HTAPsChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1787  								|| mode_lib->vba.VRatioChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1788  										> mode_lib->vba.VTAPsChroma[k]))) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1789  			mode_lib->vba.ScaleRatioAndTapsSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1790  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1791  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1792  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1793  	/*Source Format, Pixel Format and Scan Support Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1794  	mode_lib->vba.SourceFormatPixelAndScanSupport = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1795  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1796  		if (mode_lib->vba.SurfaceTiling[k] == dm_sw_linear
ce19bbe46fcfb8 Chandan Vurdigere Nataraj 2022-06-07  1797  			&& (!(!IsVertical((enum dm_rotation_angle) mode_lib->vba.SourceScan[k]))
ce19bbe46fcfb8 Chandan Vurdigere Nataraj 2022-06-07  1798  				|| mode_lib->vba.DCCEnable[k] == true)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1799  			mode_lib->vba.SourceFormatPixelAndScanSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1800  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1801  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1802  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1803  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1804  		dml32_CalculateBytePerPixelAndBlockSizes(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1805  				mode_lib->vba.SourcePixelFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1806  				mode_lib->vba.SurfaceTiling[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1807  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1808  				/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1809  				&mode_lib->vba.BytePerPixelY[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1810  				&mode_lib->vba.BytePerPixelC[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1811  				&mode_lib->vba.BytePerPixelInDETY[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1812  				&mode_lib->vba.BytePerPixelInDETC[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1813  				&mode_lib->vba.Read256BlockHeightY[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1814  				&mode_lib->vba.Read256BlockHeightC[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1815  				&mode_lib->vba.Read256BlockWidthY[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1816  				&mode_lib->vba.Read256BlockWidthC[k],
827e3c9caa77d3 Aric Cyr                  2022-08-24  1817  				&mode_lib->vba.MacroTileHeightY[k],
827e3c9caa77d3 Aric Cyr                  2022-08-24  1818  				&mode_lib->vba.MacroTileHeightC[k],
827e3c9caa77d3 Aric Cyr                  2022-08-24  1819  				&mode_lib->vba.MacroTileWidthY[k],
827e3c9caa77d3 Aric Cyr                  2022-08-24  1820  				&mode_lib->vba.MacroTileWidthC[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1821  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1822  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1823  	/*Bandwidth Support Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1824  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1825  		if (!IsVertical(mode_lib->vba.SourceRotation[k])) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1826  			v->SwathWidthYSingleDPP[k] = mode_lib->vba.ViewportWidth[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1827  			v->SwathWidthCSingleDPP[k] = mode_lib->vba.ViewportWidthChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1828  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1829  			v->SwathWidthYSingleDPP[k] = mode_lib->vba.ViewportHeight[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1830  			v->SwathWidthCSingleDPP[k] = mode_lib->vba.ViewportHeightChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1831  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1832  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1833  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1834  		v->ReadBandwidthLuma[k] = v->SwathWidthYSingleDPP[k] * dml_ceil(v->BytePerPixelInDETY[k], 1.0)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1835  				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1836  		v->ReadBandwidthChroma[k] = v->SwathWidthYSingleDPP[k] / 2 * dml_ceil(v->BytePerPixelInDETC[k], 2.0)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1837  				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1838  				/ 2.0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1839  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1840  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1841  		if (mode_lib->vba.WritebackEnable[k] == true && mode_lib->vba.WritebackPixelFormat[k] == dm_444_64) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1842  			v->WriteBandwidth[k] = mode_lib->vba.WritebackDestinationWidth[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1843  					* mode_lib->vba.WritebackDestinationHeight[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1844  					/ (mode_lib->vba.WritebackSourceHeight[k] * mode_lib->vba.HTotal[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1845  							/ mode_lib->vba.PixelClock[k]) * 8.0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1846  		} else if (mode_lib->vba.WritebackEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1847  			v->WriteBandwidth[k] = mode_lib->vba.WritebackDestinationWidth[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1848  					* mode_lib->vba.WritebackDestinationHeight[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1849  					/ (mode_lib->vba.WritebackSourceHeight[k] * mode_lib->vba.HTotal[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1850  							/ mode_lib->vba.PixelClock[k]) * 4.0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1851  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1852  			v->WriteBandwidth[k] = 0.0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1853  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1854  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1855  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1856  	/*Writeback Latency support check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1857  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1858  	mode_lib->vba.WritebackLatencySupport = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1859  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1860  		if (mode_lib->vba.WritebackEnable[k] == true
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1861  				&& (v->WriteBandwidth[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1862  						> mode_lib->vba.WritebackInterfaceBufferSize * 1024
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1863  								/ mode_lib->vba.WritebackLatency)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1864  			mode_lib->vba.WritebackLatencySupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1865  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1866  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1867  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1868  	/*Writeback Mode Support Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1869  	mode_lib->vba.EnoughWritebackUnits = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1870  	mode_lib->vba.TotalNumberOfActiveWriteback = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1871  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1872  		if (mode_lib->vba.WritebackEnable[k] == true)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1873  			mode_lib->vba.TotalNumberOfActiveWriteback = mode_lib->vba.TotalNumberOfActiveWriteback + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1874  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1875  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1876  	if (mode_lib->vba.TotalNumberOfActiveWriteback > mode_lib->vba.MaxNumWriteback)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1877  		mode_lib->vba.EnoughWritebackUnits = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1878  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1879  	/*Writeback Scale Ratio and Taps Support Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1880  	mode_lib->vba.WritebackScaleRatioAndTapsSupport = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1881  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1882  		if (mode_lib->vba.WritebackEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1883  			if (mode_lib->vba.WritebackHRatio[k] > mode_lib->vba.WritebackMaxHSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1884  					|| mode_lib->vba.WritebackVRatio[k] > mode_lib->vba.WritebackMaxVSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1885  					|| mode_lib->vba.WritebackHRatio[k] < mode_lib->vba.WritebackMinHSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1886  					|| mode_lib->vba.WritebackVRatio[k] < mode_lib->vba.WritebackMinVSCLRatio
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1887  					|| mode_lib->vba.WritebackHTaps[k] > mode_lib->vba.WritebackMaxHSCLTaps
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1888  					|| mode_lib->vba.WritebackVTaps[k] > mode_lib->vba.WritebackMaxVSCLTaps
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1889  					|| mode_lib->vba.WritebackHRatio[k] > mode_lib->vba.WritebackHTaps[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1890  					|| mode_lib->vba.WritebackVRatio[k] > mode_lib->vba.WritebackVTaps[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1891  					|| (mode_lib->vba.WritebackHTaps[k] > 2.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1892  							&& ((mode_lib->vba.WritebackHTaps[k] % 2) == 1))) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1893  				mode_lib->vba.WritebackScaleRatioAndTapsSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1894  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1895  			if (2.0 * mode_lib->vba.WritebackDestinationWidth[k] * (mode_lib->vba.WritebackVTaps[k] - 1)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1896  					* 57 > mode_lib->vba.WritebackLineBufferSize) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1897  				mode_lib->vba.WritebackScaleRatioAndTapsSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1898  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1899  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1900  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1901  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1902  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1903  		dml32_CalculateSinglePipeDPPCLKAndSCLThroughput(mode_lib->vba.HRatio[k], mode_lib->vba.HRatioChroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1904  				mode_lib->vba.VRatio[k], mode_lib->vba.VRatioChroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1905  				mode_lib->vba.MaxDCHUBToPSCLThroughput, mode_lib->vba.MaxPSCLToLBThroughput,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1906  				mode_lib->vba.PixelClock[k], mode_lib->vba.SourcePixelFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1907  				mode_lib->vba.htaps[k], mode_lib->vba.HTAPsChroma[k], mode_lib->vba.vtaps[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1908  				mode_lib->vba.VTAPsChroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1909  				/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1910  				&mode_lib->vba.PSCL_FACTOR[k], &mode_lib->vba.PSCL_FACTOR_CHROMA[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1911  				&mode_lib->vba.MinDPPCLKUsingSingleDPP[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1912  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1913  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1914  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1915  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1916  		if (mode_lib->vba.SurfaceTiling[k] == dm_sw_linear) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1917  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 8192;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1918  		} else if (!IsVertical(mode_lib->vba.SourceRotation[k]) && v->BytePerPixelC[k] > 0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1919  				&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe_alpha) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1920  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 7680;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1921  		} else if (IsVertical(mode_lib->vba.SourceRotation[k]) && v->BytePerPixelC[k] > 0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1922  				&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe_alpha) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1923  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 4320;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1924  		} else if (mode_lib->vba.SourcePixelFormat[k] == dm_rgbe_alpha) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1925  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 3840;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1926  		} else if (IsVertical(mode_lib->vba.SourceRotation[k]) && v->BytePerPixelY[k] == 8 &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1927  				mode_lib->vba.DCCEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1928  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 3072;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1929  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1930  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma = 6144;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1931  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1932  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1933  		if (mode_lib->vba.SourcePixelFormat[k] == dm_420_8 || mode_lib->vba.SourcePixelFormat[k] == dm_420_10
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1934  				|| mode_lib->vba.SourcePixelFormat[k] == dm_420_12) {
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  1935  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportChroma = (unsigned int)(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma / 2.0);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1936  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1937  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportChroma = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1938  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1939  		v->MaximumSwathWidthInLineBufferLuma = mode_lib->vba.LineBufferSizeFinal
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1940  				* dml_max(mode_lib->vba.HRatio[k], 1.0) / mode_lib->vba.LBBitPerPixel[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1941  				/ (mode_lib->vba.vtaps[k] + dml_max(dml_ceil(mode_lib->vba.VRatio[k], 1.0) - 2, 0.0));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1942  		if (v->BytePerPixelC[k] == 0.0) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1943  			v->MaximumSwathWidthInLineBufferChroma = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1944  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1945  			v->MaximumSwathWidthInLineBufferChroma = mode_lib->vba.LineBufferSizeFinal
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1946  					* dml_max(mode_lib->vba.HRatioChroma[k], 1.0) / mode_lib->vba.LBBitPerPixel[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1947  					/ (mode_lib->vba.VTAPsChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1948  							+ dml_max(dml_ceil(mode_lib->vba.VRatioChroma[k], 1.0) - 2,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1949  									0.0));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1950  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1951  		v->MaximumSwathWidthLuma[k] = dml_min(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1952  				v->MaximumSwathWidthInLineBufferLuma);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1953  		v->MaximumSwathWidthChroma[k] = dml_min(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaximumSwathWidthSupportChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1954  				v->MaximumSwathWidthInLineBufferChroma);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1955  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1956  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1957  	dml32_CalculateSwathAndDETConfiguration(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1958  			mode_lib->vba.DETSizeOverride,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1959  			mode_lib->vba.UsesMALLForPStateChange,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1960  			mode_lib->vba.ConfigReturnBufferSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1961  			mode_lib->vba.MaxTotalDETInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1962  			mode_lib->vba.MinCompressedBufferSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1963  			1, /* ForceSingleDPP */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1964  			mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1965  			mode_lib->vba.nomDETInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1966  			mode_lib->vba.UseUnboundedRequesting,
f4b4e41a2e0527 Jun Lei                   2022-06-24  1967  			mode_lib->vba.DisableUnboundRequestIfCompBufReservedSpaceNeedAdjustment,
f4b4e41a2e0527 Jun Lei                   2022-06-24  1968  			mode_lib->vba.ip.pixel_chunk_size_kbytes,
f4b4e41a2e0527 Jun Lei                   2022-06-24  1969  			mode_lib->vba.ip.rob_buffer_size_kbytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1970  			mode_lib->vba.CompressedBufferSegmentSizeInkByteFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1971  			mode_lib->vba.Output,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1972  			mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1973  			mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1974  			mode_lib->vba.MaximumSwathWidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1975  			mode_lib->vba.MaximumSwathWidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1976  			mode_lib->vba.SourceRotation,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1977  			mode_lib->vba.ViewportStationary,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1978  			mode_lib->vba.SourcePixelFormat,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1979  			mode_lib->vba.SurfaceTiling,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1980  			mode_lib->vba.ViewportWidth,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1981  			mode_lib->vba.ViewportHeight,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1982  			mode_lib->vba.ViewportXStartY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1983  			mode_lib->vba.ViewportYStartY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1984  			mode_lib->vba.ViewportXStartC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1985  			mode_lib->vba.ViewportYStartC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1986  			mode_lib->vba.SurfaceWidthY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1987  			mode_lib->vba.SurfaceWidthC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1988  			mode_lib->vba.SurfaceHeightY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1989  			mode_lib->vba.SurfaceHeightC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1990  			mode_lib->vba.Read256BlockHeightY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1991  			mode_lib->vba.Read256BlockHeightC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1992  			mode_lib->vba.Read256BlockWidthY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1993  			mode_lib->vba.Read256BlockWidthC,
7acc487ab57e07 Alex Deucher              2022-07-20  1994  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_odm_mode,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1995  			mode_lib->vba.BlendingAndTiming,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1996  			mode_lib->vba.BytePerPixelY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1997  			mode_lib->vba.BytePerPixelC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1998  			mode_lib->vba.BytePerPixelInDETY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  1999  			mode_lib->vba.BytePerPixelInDETC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2000  			mode_lib->vba.HActive,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2001  			mode_lib->vba.HRatio,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2002  			mode_lib->vba.HRatioChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2003  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[0], /*  Integer DPPPerSurface[] */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2004  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2005  			/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2006  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[1], /* Long            swath_width_luma_ub[] */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2007  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[2], /* Long            swath_width_chroma_ub[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2008  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_double_array[0], /* Long            SwathWidth[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2009  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_double_array[1], /* Long            SwathWidthChroma[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2010  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[3], /* Integer         SwathHeightY[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2011  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[4], /* Integer         SwathHeightC[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2012  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[5], /* Long            DETBufferSizeInKByte[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2013  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[6], /* Long            DETBufferSizeY[]  */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2014  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[7], /* Long            DETBufferSizeC[]  */
01cf387b1c7f60 Alex Deucher              2022-06-22  2015  			&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[0][0], /* bool           *UnboundedRequestEnabled  */
01cf387b1c7f60 Alex Deucher              2022-06-22  2016  			&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[0][0], /* Long           *CompressedBufferSizeInkByte  */
f4b4e41a2e0527 Jun Lei                   2022-06-24  2017  			&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[1][0], /* Long           *CompBufReservedSpaceKBytes */
f4b4e41a2e0527 Jun Lei                   2022-06-24  2018  			&CompBufReservedSpaceNeedAdjustmentSingleDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2019  			mode_lib->vba.SingleDPPViewportSizeSupportPerSurface,/* bool ViewportSizeSupportPerSurface[] */
01cf387b1c7f60 Alex Deucher              2022-06-22  2020  			&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[1][0]); /* bool           *ViewportSizeSupport */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2021  
7acc487ab57e07 Alex Deucher              2022-07-20  2022  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
7acc487ab57e07 Alex Deucher              2022-07-20  2023  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2024  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2025  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2026  		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_reduce_voltage_and_clocks)
7acc487ab57e07 Alex Deucher              2022-07-20  2027  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2028  		if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_always_when_possible)
7acc487ab57e07 Alex Deucher              2022-07-20  2029  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2030  	}
7acc487ab57e07 Alex Deucher              2022-07-20  2031  	mode_lib->vba.MPCCombineMethodIncompatible = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsNeededForPStateChangeAndVoltage
7acc487ab57e07 Alex Deucher              2022-07-20  2032  			&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MPCCombineMethodAsPossible;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2033  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2034  	for (i = start_state; i < (int)v->soc.num_states; i++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2035  		for (j = 0; j < 2; j++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2036  			mode_lib->vba.TotalNumberOfActiveDPP[i][j] = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2037  			mode_lib->vba.TotalAvailablePipesSupport[i][j] = true;
7acc487ab57e07 Alex Deucher              2022-07-20  2038  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC = dm_odm_combine_mode_disabled;
7acc487ab57e07 Alex Deucher              2022-07-20  2039  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC = dm_odm_combine_mode_disabled;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2040  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2041  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2042  				dml32_CalculateODMMode(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2043  						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2044  						mode_lib->vba.HActive[k],
16e5859d9faee7 Chris Park                2022-09-12  2045  						mode_lib->vba.OutputFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2046  						mode_lib->vba.Output[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2047  						mode_lib->vba.ODMUse[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2048  						mode_lib->vba.MaxDispclk[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2049  						mode_lib->vba.MaxDispclk[v->soc.num_states - 1],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2050  						false,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2051  						mode_lib->vba.TotalNumberOfActiveDPP[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2052  						mode_lib->vba.MaxNumDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2053  						mode_lib->vba.PixelClock[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2054  						mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2055  						mode_lib->vba.DISPCLKRampingMargin,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2056  						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
572200db77ecbd Taimur Hassan             2022-08-12  2057  						mode_lib->vba.NumberOfDSCSlices[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2058  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2059  						/* Output */
7acc487ab57e07 Alex Deucher              2022-07-20  2060  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportNoDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2061  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPNoDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2062  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2063  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceNoDSC);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2064  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2065  				dml32_CalculateODMMode(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2066  						mode_lib->vba.MaximumPixelsPerLinePerDSCUnit,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2067  						mode_lib->vba.HActive[k],
16e5859d9faee7 Chris Park                2022-09-12  2068  						mode_lib->vba.OutputFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2069  						mode_lib->vba.Output[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2070  						mode_lib->vba.ODMUse[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2071  						mode_lib->vba.MaxDispclk[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2072  						mode_lib->vba.MaxDispclk[v->soc.num_states - 1],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2073  						true,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2074  						mode_lib->vba.TotalNumberOfActiveDPP[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2075  						mode_lib->vba.MaxNumDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2076  						mode_lib->vba.PixelClock[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2077  						mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2078  						mode_lib->vba.DISPCLKRampingMargin,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2079  						mode_lib->vba.DISPCLKDPPCLKVCOSpeed,
572200db77ecbd Taimur Hassan             2022-08-12  2080  						mode_lib->vba.NumberOfDSCSlices[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2081  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2082  						/* Output */
7acc487ab57e07 Alex Deucher              2022-07-20  2083  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2084  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2085  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2086  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceDSC);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2087  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2088  				dml32_CalculateOutputLink(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2089  						mode_lib->vba.PHYCLKPerState[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2090  						mode_lib->vba.PHYCLKD18PerState[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2091  						mode_lib->vba.PHYCLKD32PerState[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2092  						mode_lib->vba.Downspreading,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2093  						(mode_lib->vba.BlendingAndTiming[k] == k),
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2094  						mode_lib->vba.Output[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2095  						mode_lib->vba.OutputFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2096  						mode_lib->vba.HTotal[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2097  						mode_lib->vba.HActive[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2098  						mode_lib->vba.PixelClockBackEnd[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2099  						mode_lib->vba.ForcedOutputLinkBPP[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2100  						mode_lib->vba.DSCInputBitPerComponent[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2101  						mode_lib->vba.NumberOfDSCSlices[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2102  						mode_lib->vba.AudioSampleRate[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2103  						mode_lib->vba.AudioSampleLayout[k],
7acc487ab57e07 Alex Deucher              2022-07-20  2104  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC,
7acc487ab57e07 Alex Deucher              2022-07-20  2105  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2106  						mode_lib->vba.DSCEnable[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2107  						(int)mode_lib->vba.OutputLinkDPLanes[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2108  						mode_lib->vba.OutputLinkDPRate[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2109  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2110  						/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2111  						&mode_lib->vba.RequiresDSC[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2112  						&mode_lib->vba.RequiresFEC[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2113  						&mode_lib->vba.OutputBppPerState[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2114  						&mode_lib->vba.OutputTypePerState[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2115  						&mode_lib->vba.OutputRatePerState[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2116  						&mode_lib->vba.RequiredSlots[i][k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2117  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2118  				if (mode_lib->vba.RequiresDSC[i][k] == false) {
7acc487ab57e07 Alex Deucher              2022-07-20  2119  					mode_lib->vba.ODMCombineEnablePerState[i][k] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeNoDSC;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2120  					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
7acc487ab57e07 Alex Deucher              2022-07-20  2121  							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceNoDSC;
7acc487ab57e07 Alex Deucher              2022-07-20  2122  					if (!v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportNoDSC)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2123  						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2124  					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
7acc487ab57e07 Alex Deucher              2022-07-20  2125  							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPNoDSC;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2126  				} else {
7acc487ab57e07 Alex Deucher              2022-07-20  2127  					mode_lib->vba.ODMCombineEnablePerState[i][k] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ODMModeDSC;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2128  					mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k] =
7acc487ab57e07 Alex Deucher              2022-07-20  2129  							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.RequiredDISPCLKPerSurfaceDSC;
7acc487ab57e07 Alex Deucher              2022-07-20  2130  					if (!v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalAvailablePipesSupportDSC)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2131  						mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2132  					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
7acc487ab57e07 Alex Deucher              2022-07-20  2133  							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NumberOfDPPDSC;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2134  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2135  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2136  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2137  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2138  				if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2139  					mode_lib->vba.MPCCombine[i][j][k] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2140  					mode_lib->vba.NoOfDPP[i][j][k] = 4;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2141  				} else if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2142  					mode_lib->vba.MPCCombine[i][j][k] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2143  					mode_lib->vba.NoOfDPP[i][j][k] = 2;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2144  				} else if (mode_lib->vba.MPCCombineUse[k] == dm_mpc_never) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2145  					mode_lib->vba.MPCCombine[i][j][k] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2146  					mode_lib->vba.NoOfDPP[i][j][k] = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2147  				} else if (dml32_RoundToDFSGranularity(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2148  						mode_lib->vba.MinDPPCLKUsingSingleDPP[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2149  								* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2150  												/ 100), 1,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2151  						mode_lib->vba.DISPCLKDPPCLKVCOSpeed) <= mode_lib->vba.MaxDppclk[i] &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2152  				mode_lib->vba.SingleDPPViewportSizeSupportPerSurface[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2153  					mode_lib->vba.MPCCombine[i][j][k] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2154  					mode_lib->vba.NoOfDPP[i][j][k] = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2155  				} else if (mode_lib->vba.TotalNumberOfActiveDPP[i][j] < mode_lib->vba.MaxNumDPP) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2156  					mode_lib->vba.MPCCombine[i][j][k] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2157  					mode_lib->vba.NoOfDPP[i][j][k] = 2;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2158  					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2159  							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2160  				} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2161  					mode_lib->vba.MPCCombine[i][j][k] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2162  					mode_lib->vba.NoOfDPP[i][j][k] = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2163  					mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2164  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2165  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2166  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2167  			mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] = 0;
7acc487ab57e07 Alex Deucher              2022-07-20  2168  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2169  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2170  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2171  				if (mode_lib->vba.NoOfDPP[i][j][k] == 1)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2172  					mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2173  							mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2174  				if (mode_lib->vba.SourcePixelFormat[k] == dm_420_8
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2175  						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_10
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2176  						|| mode_lib->vba.SourcePixelFormat[k] == dm_420_12
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2177  						|| mode_lib->vba.SourcePixelFormat[k] == dm_rgbe_alpha) {
7acc487ab57e07 Alex Deucher              2022-07-20  2178  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2179  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2180  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2181  
f4b4e41a2e0527 Jun Lei                   2022-06-24  2182  			// if TotalNumberOfActiveDPP is > 1, then there should be no unbounded req mode (hw limitation), the comp buf reserved adjustment is not needed regardless
f4b4e41a2e0527 Jun Lei                   2022-06-24  2183  			// if TotalNumberOfActiveDPP is == 1, then will use the SingleDPP version of unbounded_req for the decision
f4b4e41a2e0527 Jun Lei                   2022-06-24  2184  			CompBufReservedSpaceNeedAdjustment = (mode_lib->vba.TotalNumberOfActiveDPP[i][j] > 1) ? 0 : CompBufReservedSpaceNeedAdjustmentSingleDPP;
f4b4e41a2e0527 Jun Lei                   2022-06-24  2185  
f4b4e41a2e0527 Jun Lei                   2022-06-24  2186  
f4b4e41a2e0527 Jun Lei                   2022-06-24  2187  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2188  			if (j == 1 && !dml32_UnboundedRequest(mode_lib->vba.UseUnboundedRequesting,
7acc487ab57e07 Alex Deucher              2022-07-20  2189  					mode_lib->vba.TotalNumberOfActiveDPP[i][j], v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NoChroma,
f4b4e41a2e0527 Jun Lei                   2022-06-24  2190  					mode_lib->vba.Output[0],
f4b4e41a2e0527 Jun Lei                   2022-06-24  2191  					mode_lib->vba.SurfaceTiling[0],
f4b4e41a2e0527 Jun Lei                   2022-06-24  2192  					CompBufReservedSpaceNeedAdjustment,
f4b4e41a2e0527 Jun Lei                   2022-06-24  2193  					mode_lib->vba.DisableUnboundRequestIfCompBufReservedSpaceNeedAdjustment)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2194  				while (!(mode_lib->vba.TotalNumberOfActiveDPP[i][j] >= mode_lib->vba.MaxNumDPP
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2195  						|| mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] == 0)) {
7acc487ab57e07 Alex Deucher              2022-07-20  2196  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
7acc487ab57e07 Alex Deucher              2022-07-20  2197  					NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2198  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2199  					for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2200  						if (mode_lib->vba.MPCCombineUse[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2201  							!= dm_mpc_never &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2202  							mode_lib->vba.MPCCombineUse[k] != dm_mpc_reduce_voltage &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2203  							mode_lib->vba.ReadBandwidthLuma[k] +
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2204  							mode_lib->vba.ReadBandwidthChroma[k] >
7acc487ab57e07 Alex Deucher              2022-07-20  2205  							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2206  							(mode_lib->vba.ODMCombineEnablePerState[i][k] !=
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2207  							dm_odm_combine_mode_2to1 &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2208  							mode_lib->vba.ODMCombineEnablePerState[i][k] !=
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2209  							dm_odm_combine_mode_4to1) &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2210  								mode_lib->vba.MPCCombine[i][j][k] == false) {
7acc487ab57e07 Alex Deucher              2022-07-20  2211  							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.BWOfNonCombinedSurfaceOfMaximumBandwidth =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2212  								mode_lib->vba.ReadBandwidthLuma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2213  								+ mode_lib->vba.ReadBandwidthChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2214  							NumberOfNonCombinedSurfaceOfMaximumBandwidth = k;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2215  						}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2216  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2217  					mode_lib->vba.MPCCombine[i][j][NumberOfNonCombinedSurfaceOfMaximumBandwidth] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2218  							true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2219  					mode_lib->vba.NoOfDPP[i][j][NumberOfNonCombinedSurfaceOfMaximumBandwidth] = 2;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2220  					mode_lib->vba.TotalNumberOfActiveDPP[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2221  							mode_lib->vba.TotalNumberOfActiveDPP[i][j] + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2222  					mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2223  							mode_lib->vba.TotalNumberOfSingleDPPSurfaces[i][j] - 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2224  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2225  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2226  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2227  			//DISPCLK/DPPCLK
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2228  			mode_lib->vba.WritebackRequiredDISPCLK = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2229  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2230  				if (mode_lib->vba.WritebackEnable[k]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2231  					mode_lib->vba.WritebackRequiredDISPCLK = dml_max(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2232  							mode_lib->vba.WritebackRequiredDISPCLK,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2233  							dml32_CalculateWriteBackDISPCLK(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2234  									mode_lib->vba.WritebackPixelFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2235  									mode_lib->vba.PixelClock[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2236  									mode_lib->vba.WritebackHRatio[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2237  									mode_lib->vba.WritebackVRatio[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2238  									mode_lib->vba.WritebackHTaps[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2239  									mode_lib->vba.WritebackVTaps[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2240  									mode_lib->vba.WritebackSourceWidth[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2241  									(long)mode_lib->vba.WritebackDestinationWidth[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2242  									mode_lib->vba.HTotal[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2243  									(unsigned int)mode_lib->vba.WritebackLineBufferSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2244  									mode_lib->vba.DISPCLKDPPCLKVCOSpeed));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2245  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2246  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2247  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2248  			mode_lib->vba.RequiredDISPCLK[i][j] = mode_lib->vba.WritebackRequiredDISPCLK;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2249  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2250  				mode_lib->vba.RequiredDISPCLK[i][j] = dml_max(mode_lib->vba.RequiredDISPCLK[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2251  						mode_lib->vba.RequiredDISPCLKPerSurface[i][j][k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2252  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2253  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2254  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2255  				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2256  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2257  			dml32_CalculateDPPCLK(mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2258  					mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2259  					mode_lib->vba.DISPCLKDPPCLKVCOSpeed, mode_lib->vba.MinDPPCLKUsingSingleDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2260  					mode_lib->vba.NoOfDPPThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2261  					/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2262  					&mode_lib->vba.GlobalDPPCLK, mode_lib->vba.RequiredDPPCLKThisState);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2263  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2264  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2265  				mode_lib->vba.RequiredDPPCLK[i][j][k] = mode_lib->vba.RequiredDPPCLKThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2266  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2267  			mode_lib->vba.DISPCLK_DPPCLK_Support[i][j] = !((mode_lib->vba.RequiredDISPCLK[i][j]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2268  					> mode_lib->vba.MaxDispclk[i])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2269  					|| (mode_lib->vba.GlobalDPPCLK > mode_lib->vba.MaxDppclk[i]));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2270  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2271  			if (mode_lib->vba.TotalNumberOfActiveDPP[i][j] > mode_lib->vba.MaxNumDPP)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2272  				mode_lib->vba.TotalAvailablePipesSupport[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2273  		} // j
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2274  	} // i (VOLTAGE_STATE)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2275  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2276  	/* Total Available OTG, HDMIFRL, DP Support Check */
7acc487ab57e07 Alex Deucher              2022-07-20  2277  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG = 0;
7acc487ab57e07 Alex Deucher              2022-07-20  2278  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveHDMIFRL = 0;
7acc487ab57e07 Alex Deucher              2022-07-20  2279  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 = 0;
7acc487ab57e07 Alex Deucher              2022-07-20  2280  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2281  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2282  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2283  		if (mode_lib->vba.BlendingAndTiming[k] == k) {
7acc487ab57e07 Alex Deucher              2022-07-20  2284  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2285  			if (mode_lib->vba.Output[k] == dm_dp2p0) {
7acc487ab57e07 Alex Deucher              2022-07-20  2286  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2287  				if (mode_lib->vba.OutputMultistreamId[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2288  						== k || mode_lib->vba.OutputMultistreamEn[k] == false) {
7acc487ab57e07 Alex Deucher              2022-07-20  2289  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2290  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2291  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2292  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2293  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2294  
7acc487ab57e07 Alex Deucher              2022-07-20  2295  	mode_lib->vba.NumberOfOTGSupport = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveOTG <= mode_lib->vba.MaxNumOTG);
7acc487ab57e07 Alex Deucher              2022-07-20  2296  	mode_lib->vba.NumberOfHDMIFRLSupport = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveHDMIFRL <= mode_lib->vba.MaxNumHDMIFRLOutputs);
7acc487ab57e07 Alex Deucher              2022-07-20  2297  	mode_lib->vba.NumberOfDP2p0Support = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0 <= mode_lib->vba.MaxNumDP2p0Streams
7acc487ab57e07 Alex Deucher              2022-07-20  2298  			&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalNumberOfActiveDP2p0Outputs <= mode_lib->vba.MaxNumDP2p0Outputs);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2299  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2300  	/* Display IO and DSC Support Check */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2301  	mode_lib->vba.NonsupportedDSCInputBPC = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2302  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2303  		if (!(mode_lib->vba.DSCInputBitPerComponent[k] == 12.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2304  				|| mode_lib->vba.DSCInputBitPerComponent[k] == 10.0
a3daede4757603 Rodrigo Siqueira          2022-09-22  2305  				|| mode_lib->vba.DSCInputBitPerComponent[k] == 8.0)
a3daede4757603 Rodrigo Siqueira          2022-09-22  2306  				|| mode_lib->vba.DSCInputBitPerComponent[k] > mode_lib->vba.MaximumDSCBitsPerComponent) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2307  			mode_lib->vba.NonsupportedDSCInputBPC = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2308  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2309  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2310  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2311  	for (i = start_state; i < (int)v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2312  		mode_lib->vba.ExceededMultistreamSlots[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2313  		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2314  			if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2315  				TotalSlots = mode_lib->vba.RequiredSlots[i][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2316  				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2317  					if (mode_lib->vba.OutputMultistreamId[j] == k)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2318  						TotalSlots = TotalSlots + mode_lib->vba.RequiredSlots[i][j];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2319  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2320  				if (mode_lib->vba.Output[k] == dm_dp && TotalSlots > 63)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2321  					mode_lib->vba.ExceededMultistreamSlots[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2322  				if (mode_lib->vba.Output[k] == dm_dp2p0 && TotalSlots > 64)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2323  					mode_lib->vba.ExceededMultistreamSlots[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2324  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2325  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2326  		mode_lib->vba.LinkCapacitySupport[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2327  		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2328  			if (mode_lib->vba.BlendingAndTiming[k] == k
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2329  				&& (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_dp2p0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2330  					|| mode_lib->vba.Output[k] == dm_edp
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2331  					|| mode_lib->vba.Output[k] == dm_hdmi)
87f0c16e0eeb67 Alvin Lee                 2023-04-17  2332  				&& mode_lib->vba.OutputBppPerState[i][k] == 0 &&
87f0c16e0eeb67 Alvin Lee                 2023-04-17  2333  				(mode_lib->vba.UsesMALLForPStateChange[k] != dm_use_mall_pstate_change_phantom_pipe)) {
87f0c16e0eeb67 Alvin Lee                 2023-04-17  2334  				/* Phantom pipes don't consider DSC in DML, so it could fail link check.
87f0c16e0eeb67 Alvin Lee                 2023-04-17  2335  				 * However, we don't care about the link for phantom pipes.
87f0c16e0eeb67 Alvin Lee                 2023-04-17  2336  				 */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2337  				mode_lib->vba.LinkCapacitySupport[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2338  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2339  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2340  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2341  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2342  	mode_lib->vba.P2IWith420 = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2343  	mode_lib->vba.DSCOnlyIfNecessaryWithBPP = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2344  	mode_lib->vba.DSC422NativeNotSupported = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2345  	mode_lib->vba.LinkRateDoesNotMatchDPVersion = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2346  	mode_lib->vba.LinkRateForMultistreamNotIndicated = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2347  	mode_lib->vba.BPPForMultistreamNotIndicated = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2348  	mode_lib->vba.MultistreamWithHDMIOreDP = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2349  	mode_lib->vba.MSOOrODMSplitWithNonDPLink = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2350  	mode_lib->vba.NotEnoughLanesForMSO = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2351  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2352  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2353  		if (mode_lib->vba.BlendingAndTiming[k] == k
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2354  				&& (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_dp2p0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2355  						|| mode_lib->vba.Output[k] == dm_edp
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2356  						|| mode_lib->vba.Output[k] == dm_hdmi)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2357  			if (mode_lib->vba.OutputFormat[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2358  					== dm_420 && mode_lib->vba.Interlace[k] == 1 &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2359  					mode_lib->vba.ProgressiveToInterlaceUnitInOPP == true)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2360  				mode_lib->vba.P2IWith420 = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2361  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2362  			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2363  				mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
e26b51c79bac2b Deepak R Varma            2023-02-10  2364  			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.OutputFormat[k] == dm_n422
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2365  					&& !mode_lib->vba.DSC422NativeSupport)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2366  				mode_lib->vba.DSC422NativeNotSupported = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2367  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2368  			if (((mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_hbr
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2369  					|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_hbr2
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2370  					|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_hbr3)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2371  					&& mode_lib->vba.Output[k] != dm_dp && mode_lib->vba.Output[k] != dm_edp)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2372  					|| ((mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_uhbr10
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2373  							|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_uhbr13p5
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2374  							|| mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_uhbr20)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2375  							&& mode_lib->vba.Output[k] != dm_dp2p0))
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2376  				mode_lib->vba.LinkRateDoesNotMatchDPVersion = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2377  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2378  			if (mode_lib->vba.OutputMultistreamEn[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2379  				if (mode_lib->vba.OutputMultistreamId[k] == k
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2380  					&& mode_lib->vba.OutputLinkDPRate[k] == dm_dp_rate_na)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2381  					mode_lib->vba.LinkRateForMultistreamNotIndicated = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2382  				if (mode_lib->vba.OutputMultistreamId[k] == k && mode_lib->vba.ForcedOutputLinkBPP[k] == 0)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2383  					mode_lib->vba.BPPForMultistreamNotIndicated = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2384  				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
a3daede4757603 Rodrigo Siqueira          2022-09-22  2385  					if (mode_lib->vba.OutputMultistreamId[k] == j
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2386  						&& mode_lib->vba.ForcedOutputLinkBPP[k] == 0)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2387  						mode_lib->vba.BPPForMultistreamNotIndicated = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2388  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2389  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2390  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2391  			if ((mode_lib->vba.Output[k] == dm_edp || mode_lib->vba.Output[k] == dm_hdmi)) {
a3daede4757603 Rodrigo Siqueira          2022-09-22  2392  				if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == k)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2393  					mode_lib->vba.MultistreamWithHDMIOreDP = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2394  				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2395  					if (mode_lib->vba.OutputMultistreamEn[k] == true && mode_lib->vba.OutputMultistreamId[k] == j)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2396  						mode_lib->vba.MultistreamWithHDMIOreDP = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2397  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2398  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2399  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2400  			if (mode_lib->vba.Output[k] != dm_dp
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2401  					&& (mode_lib->vba.ODMUse[k] == dm_odm_split_policy_1to2
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2402  							|| mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to2
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2403  							|| mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to4))
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2404  				mode_lib->vba.MSOOrODMSplitWithNonDPLink = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2405  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2406  			if ((mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to2
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2407  					&& mode_lib->vba.OutputLinkDPLanes[k] < 2)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2408  					|| (mode_lib->vba.ODMUse[k] == dm_odm_mso_policy_1to4
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2409  							&& mode_lib->vba.OutputLinkDPLanes[k] < 4))
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2410  				mode_lib->vba.NotEnoughLanesForMSO = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2411  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2412  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2413  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2414  	for (i = start_state; i < (int)v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2415  		mode_lib->vba.DTBCLKRequiredMoreThanSupported[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2416  		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2417  			if (mode_lib->vba.BlendingAndTiming[k] == k
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2418  					&& dml32_RequiredDTBCLK(mode_lib->vba.RequiresDSC[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2419  							mode_lib->vba.PixelClockBackEnd[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2420  							mode_lib->vba.OutputFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2421  							mode_lib->vba.OutputBppPerState[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2422  							mode_lib->vba.NumberOfDSCSlices[k], mode_lib->vba.HTotal[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2423  							mode_lib->vba.HActive[k], mode_lib->vba.AudioSampleRate[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2424  							mode_lib->vba.AudioSampleLayout[k])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2425  							> mode_lib->vba.DTBCLKPerState[i]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2426  				mode_lib->vba.DTBCLKRequiredMoreThanSupported[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2427  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2428  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2429  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2430  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2431  	for (i = start_state; i < (int)v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2432  		mode_lib->vba.ODMCombine2To1SupportCheckOK[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2433  		mode_lib->vba.ODMCombine4To1SupportCheckOK[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2434  		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2435  			if (mode_lib->vba.BlendingAndTiming[k] == k
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2436  					&& mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2437  					&& mode_lib->vba.Output[k] == dm_hdmi) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2438  				mode_lib->vba.ODMCombine2To1SupportCheckOK[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2439  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2440  			if (mode_lib->vba.BlendingAndTiming[k] == k
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2441  					&& mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2442  					&& (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_edp
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2443  							|| mode_lib->vba.Output[k] == dm_hdmi)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2444  				mode_lib->vba.ODMCombine4To1SupportCheckOK[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2445  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2446  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2447  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2448  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2449  	for (i = start_state; i < (int)v->soc.num_states; i++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2450  		mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2451  		for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2452  			if (mode_lib->vba.BlendingAndTiming[k] == k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2453  				if (mode_lib->vba.Output[k] == dm_dp || mode_lib->vba.Output[k] == dm_dp2p0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2454  						|| mode_lib->vba.Output[k] == dm_edp) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2455  					if (mode_lib->vba.OutputFormat[k] == dm_420) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2456  						mode_lib->vba.DSCFormatFactor = 2;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2457  					} else if (mode_lib->vba.OutputFormat[k] == dm_444) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2458  						mode_lib->vba.DSCFormatFactor = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2459  					} else if (mode_lib->vba.OutputFormat[k] == dm_n422) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2460  						mode_lib->vba.DSCFormatFactor = 2;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2461  					} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2462  						mode_lib->vba.DSCFormatFactor = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2463  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2464  					if (mode_lib->vba.RequiresDSC[i][k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2465  						if (mode_lib->vba.ODMCombineEnablePerState[i][k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2466  								== dm_odm_combine_mode_4to1) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2467  							if (mode_lib->vba.PixelClockBackEnd[k] / 12.0 / mode_lib->vba.DSCFormatFactor > (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2468  								mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2469  						} else if (mode_lib->vba.ODMCombineEnablePerState[i][k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2470  								== dm_odm_combine_mode_2to1) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2471  							if (mode_lib->vba.PixelClockBackEnd[k] / 6.0 / mode_lib->vba.DSCFormatFactor > (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2472  								mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2473  						} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2474  							if (mode_lib->vba.PixelClockBackEnd[k] / 3.0 / mode_lib->vba.DSCFormatFactor > (1.0 - mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0) * mode_lib->vba.MaxDSCCLK[i])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2475  								mode_lib->vba.DSCCLKRequiredMoreThanSupported[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2476  						}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2477  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2478  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2479  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2480  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2481  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2482  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2483  	/* Check DSC Unit and Slices Support */
7acc487ab57e07 Alex Deucher              2022-07-20  2484  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2485  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2486  	for (i = start_state; i < (int)v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2487  		mode_lib->vba.NotEnoughDSCUnits[i] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2488  		mode_lib->vba.NotEnoughDSCSlices[i] = false;
7acc487ab57e07 Alex Deucher              2022-07-20  2489  		v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2490  		mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2491  		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2492  			if (mode_lib->vba.RequiresDSC[i][k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2493  				if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_4to1) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2494  					if (mode_lib->vba.HActive[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2495  							> 4 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2496  						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
7acc487ab57e07 Alex Deucher              2022-07-20  2497  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 4;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2498  					if (mode_lib->vba.NumberOfDSCSlices[k] > 16)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2499  						mode_lib->vba.NotEnoughDSCSlices[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2500  				} else if (mode_lib->vba.ODMCombineEnablePerState[i][k] == dm_odm_combine_mode_2to1) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2501  					if (mode_lib->vba.HActive[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2502  							> 2 * mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2503  						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
7acc487ab57e07 Alex Deucher              2022-07-20  2504  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 2;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2505  					if (mode_lib->vba.NumberOfDSCSlices[k] > 8)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2506  						mode_lib->vba.NotEnoughDSCSlices[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2507  				} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2508  					if (mode_lib->vba.HActive[k] > mode_lib->vba.MaximumPixelsPerLinePerDSCUnit)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2509  						mode_lib->vba.PixelsPerLinePerDSCUnitSupport[i] = false;
7acc487ab57e07 Alex Deucher              2022-07-20  2510  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2511  					if (mode_lib->vba.NumberOfDSCSlices[k] > 4)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2512  						mode_lib->vba.NotEnoughDSCSlices[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2513  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2514  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2515  		}
7acc487ab57e07 Alex Deucher              2022-07-20  2516  		if (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.TotalDSCUnitsRequired > mode_lib->vba.NumberOfDSC)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2517  			mode_lib->vba.NotEnoughDSCUnits[i] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2518  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2519  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2520  	/*DSC Delay per state*/
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2521  	for (i = start_state; i < (int)v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2522  		for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2523  			mode_lib->vba.DSCDelayPerState[i][k] = dml32_DSCDelayRequirement(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2524  					mode_lib->vba.RequiresDSC[i][k], mode_lib->vba.ODMCombineEnablePerState[i][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2525  					mode_lib->vba.DSCInputBitPerComponent[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2526  					mode_lib->vba.OutputBppPerState[i][k], mode_lib->vba.HActive[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2527  					mode_lib->vba.HTotal[k], mode_lib->vba.NumberOfDSCSlices[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2528  					mode_lib->vba.OutputFormat[k], mode_lib->vba.Output[k],
f30508e918b401 George Shen               2022-10-14  2529  					mode_lib->vba.PixelClock[k], mode_lib->vba.PixelClockBackEnd[k],
f30508e918b401 George Shen               2022-10-14  2530  					mode_lib->vba.ip.dsc_delay_factor_wa);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2531  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2532  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2533  		for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2534  			for (m = 0; m <= mode_lib->vba.NumberOfActiveSurfaces - 1; m++) {
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2535  				for (j = 0; j < mode_lib->vba.NumberOfActiveSurfaces; j++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2536  					if (mode_lib->vba.BlendingAndTiming[k] == m &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2537  							mode_lib->vba.RequiresDSC[i][m] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2538  						mode_lib->vba.DSCDelayPerState[i][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2539  							mode_lib->vba.DSCDelayPerState[i][m];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2540  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2541  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2542  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2543  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2544  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2545  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2546  	//Calculate Swath, DET Configuration, DCFCLKDeepSleep
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2547  	//
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  2548  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2549  		for (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2550  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2551  				mode_lib->vba.RequiredDPPCLKThisState[k] = mode_lib->vba.RequiredDPPCLK[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2552  				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2553  				mode_lib->vba.ODMCombineEnableThisState[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2554  						mode_lib->vba.ODMCombineEnablePerState[i][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2555  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2556  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2557  			dml32_CalculateSwathAndDETConfiguration(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2558  					mode_lib->vba.DETSizeOverride,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2559  					mode_lib->vba.UsesMALLForPStateChange,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2560  					mode_lib->vba.ConfigReturnBufferSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2561  					mode_lib->vba.MaxTotalDETInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2562  					mode_lib->vba.MinCompressedBufferSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2563  					false, /* ForceSingleDPP */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2564  					mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2565  					mode_lib->vba.nomDETInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2566  					mode_lib->vba.UseUnboundedRequesting,
f4b4e41a2e0527 Jun Lei                   2022-06-24  2567  					mode_lib->vba.DisableUnboundRequestIfCompBufReservedSpaceNeedAdjustment,
f4b4e41a2e0527 Jun Lei                   2022-06-24  2568  					mode_lib->vba.ip.pixel_chunk_size_kbytes,
f4b4e41a2e0527 Jun Lei                   2022-06-24  2569  					mode_lib->vba.ip.rob_buffer_size_kbytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2570  					mode_lib->vba.CompressedBufferSegmentSizeInkByteFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2571  					mode_lib->vba.Output,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2572  					mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2573  					mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2574  					mode_lib->vba.MaximumSwathWidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2575  					mode_lib->vba.MaximumSwathWidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2576  					mode_lib->vba.SourceRotation,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2577  					mode_lib->vba.ViewportStationary,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2578  					mode_lib->vba.SourcePixelFormat,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2579  					mode_lib->vba.SurfaceTiling,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2580  					mode_lib->vba.ViewportWidth,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2581  					mode_lib->vba.ViewportHeight,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2582  					mode_lib->vba.ViewportXStartY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2583  					mode_lib->vba.ViewportYStartY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2584  					mode_lib->vba.ViewportXStartC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2585  					mode_lib->vba.ViewportYStartC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2586  					mode_lib->vba.SurfaceWidthY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2587  					mode_lib->vba.SurfaceWidthC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2588  					mode_lib->vba.SurfaceHeightY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2589  					mode_lib->vba.SurfaceHeightC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2590  					mode_lib->vba.Read256BlockHeightY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2591  					mode_lib->vba.Read256BlockHeightC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2592  					mode_lib->vba.Read256BlockWidthY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2593  					mode_lib->vba.Read256BlockWidthC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2594  					mode_lib->vba.ODMCombineEnableThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2595  					mode_lib->vba.BlendingAndTiming,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2596  					mode_lib->vba.BytePerPixelY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2597  					mode_lib->vba.BytePerPixelC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2598  					mode_lib->vba.BytePerPixelInDETY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2599  					mode_lib->vba.BytePerPixelInDETC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2600  					mode_lib->vba.HActive,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2601  					mode_lib->vba.HRatio,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2602  					mode_lib->vba.HRatioChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2603  					mode_lib->vba.NoOfDPPThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2604  					/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2605  					mode_lib->vba.swath_width_luma_ub_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2606  					mode_lib->vba.swath_width_chroma_ub_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2607  					mode_lib->vba.SwathWidthYThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2608  					mode_lib->vba.SwathWidthCThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2609  					mode_lib->vba.SwathHeightYThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2610  					mode_lib->vba.SwathHeightCThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2611  					mode_lib->vba.DETBufferSizeInKByteThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2612  					mode_lib->vba.DETBufferSizeYThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2613  					mode_lib->vba.DETBufferSizeCThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2614  					&mode_lib->vba.UnboundedRequestEnabledThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2615  					&mode_lib->vba.CompressedBufferSizeInkByteThisState,
7acc487ab57e07 Alex Deucher              2022-07-20  2616  					&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0], /* Long CompBufReservedSpaceKBytes */
7acc487ab57e07 Alex Deucher              2022-07-20  2617  					&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean[0], /* bool CompBufReservedSpaceNeedAdjustment */
01cf387b1c7f60 Alex Deucher              2022-06-22  2618  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2619  					&mode_lib->vba.ViewportSizeSupport[i][j]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2620  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2621  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2622  				mode_lib->vba.swath_width_luma_ub_all_states[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2623  						mode_lib->vba.swath_width_luma_ub_this_state[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2624  				mode_lib->vba.swath_width_chroma_ub_all_states[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2625  						mode_lib->vba.swath_width_chroma_ub_this_state[k];
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2626  				mode_lib->vba.SwathWidthYAllStates[i][j][k] = (unsigned int)mode_lib->vba.SwathWidthYThisState[k];
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2627  				mode_lib->vba.SwathWidthCAllStates[i][j][k] = (unsigned int)mode_lib->vba.SwathWidthCThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2628  				mode_lib->vba.SwathHeightYAllStates[i][j][k] = mode_lib->vba.SwathHeightYThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2629  				mode_lib->vba.SwathHeightCAllStates[i][j][k] = mode_lib->vba.SwathHeightCThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2630  				mode_lib->vba.UnboundedRequestEnabledAllStates[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2631  						mode_lib->vba.UnboundedRequestEnabledThisState;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2632  				mode_lib->vba.CompressedBufferSizeInkByteAllStates[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2633  						mode_lib->vba.CompressedBufferSizeInkByteThisState;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2634  				mode_lib->vba.DETBufferSizeInKByteAllStates[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2635  						mode_lib->vba.DETBufferSizeInKByteThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2636  				mode_lib->vba.DETBufferSizeYAllStates[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2637  						mode_lib->vba.DETBufferSizeYThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2638  				mode_lib->vba.DETBufferSizeCAllStates[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2639  						mode_lib->vba.DETBufferSizeCThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2640  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2641  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2642  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2643  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2644  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2645  		mode_lib->vba.cursor_bw[k] = mode_lib->vba.NumberOfCursors[k] * mode_lib->vba.CursorWidth[k][0]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2646  				* mode_lib->vba.CursorBPP[k][0] / 8.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2647  				/ (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * mode_lib->vba.VRatio[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2648  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2649  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2650  	dml32_CalculateSurfaceSizeInMall(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2651  			mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2652  			mode_lib->vba.MALLAllocatedForDCNFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2653  			mode_lib->vba.UseMALLForStaticScreen,
a21005e4d2026e Dillon Varone             2022-12-08  2654  			mode_lib->vba.UsesMALLForPStateChange,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2655  			mode_lib->vba.DCCEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2656  			mode_lib->vba.ViewportStationary,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2657  			mode_lib->vba.ViewportXStartY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2658  			mode_lib->vba.ViewportYStartY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2659  			mode_lib->vba.ViewportXStartC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2660  			mode_lib->vba.ViewportYStartC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2661  			mode_lib->vba.ViewportWidth,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2662  			mode_lib->vba.ViewportHeight,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2663  			mode_lib->vba.BytePerPixelY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2664  			mode_lib->vba.ViewportWidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2665  			mode_lib->vba.ViewportHeightChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2666  			mode_lib->vba.BytePerPixelC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2667  			mode_lib->vba.SurfaceWidthY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2668  			mode_lib->vba.SurfaceWidthC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2669  			mode_lib->vba.SurfaceHeightY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2670  			mode_lib->vba.SurfaceHeightC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2671  			mode_lib->vba.Read256BlockWidthY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2672  			mode_lib->vba.Read256BlockWidthC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2673  			mode_lib->vba.Read256BlockHeightY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2674  			mode_lib->vba.Read256BlockHeightC,
827e3c9caa77d3 Aric Cyr                  2022-08-24  2675  			mode_lib->vba.MacroTileWidthY,
827e3c9caa77d3 Aric Cyr                  2022-08-24  2676  			mode_lib->vba.MacroTileWidthC,
827e3c9caa77d3 Aric Cyr                  2022-08-24  2677  			mode_lib->vba.MacroTileHeightY,
827e3c9caa77d3 Aric Cyr                  2022-08-24  2678  			mode_lib->vba.MacroTileHeightC,
95c454ca923bf6 Dillon Varone             2022-12-08  2679  			mode_lib->vba.DCCMetaPitchY,
95c454ca923bf6 Dillon Varone             2022-12-08  2680  			mode_lib->vba.DCCMetaPitchC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2681  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2682  			/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2683  			mode_lib->vba.SurfaceSizeInMALL,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2684  			&mode_lib->vba.ExceededMALLSize);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2685  
faaeeecef94ad3 Gaghik Khachatrian        2026-04-18  2686  	for (i = start_state; i < (int)v->soc.num_states; i++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2687  		for (j = 0; j < 2; j++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2688  			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2689  				mode_lib->vba.swath_width_luma_ub_this_state[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2690  						mode_lib->vba.swath_width_luma_ub_all_states[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2691  				mode_lib->vba.swath_width_chroma_ub_this_state[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2692  						mode_lib->vba.swath_width_chroma_ub_all_states[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2693  				mode_lib->vba.SwathWidthYThisState[k] = mode_lib->vba.SwathWidthYAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2694  				mode_lib->vba.SwathWidthCThisState[k] = mode_lib->vba.SwathWidthCAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2695  				mode_lib->vba.SwathHeightYThisState[k] = mode_lib->vba.SwathHeightYAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2696  				mode_lib->vba.SwathHeightCThisState[k] = mode_lib->vba.SwathHeightCAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2697  				mode_lib->vba.DETBufferSizeInKByteThisState[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2698  						mode_lib->vba.DETBufferSizeInKByteAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2699  				mode_lib->vba.DETBufferSizeYThisState[k] =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2700  						(unsigned int)mode_lib->vba.DETBufferSizeYAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2701  				mode_lib->vba.DETBufferSizeCThisState[k] =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2702  						(unsigned int)mode_lib->vba.DETBufferSizeCAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2703  				mode_lib->vba.RequiredDPPCLKThisState[k] = mode_lib->vba.RequiredDPPCLK[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2704  				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2705  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2706  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2707  			mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j] = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2708  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2709  				if (mode_lib->vba.DCCEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2710  					mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2711  							mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2712  									+ mode_lib->vba.NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2713  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2714  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2715  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2716  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2717  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2718  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].PixelClock = mode_lib->vba.PixelClock[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2719  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2720  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SourceRotation = mode_lib->vba.SourceRotation[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2721  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportHeight = mode_lib->vba.ViewportHeight[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2722  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportHeightChroma = mode_lib->vba.ViewportHeightChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2723  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2724  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2725  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2726  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
827e3c9caa77d3 Aric Cyr                  2022-08-24  2727  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidthY = mode_lib->vba.MacroTileWidthY[k];
827e3c9caa77d3 Aric Cyr                  2022-08-24  2728  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeightY = mode_lib->vba.MacroTileHeightY[k];
827e3c9caa77d3 Aric Cyr                  2022-08-24  2729  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockWidthC = mode_lib->vba.MacroTileWidthC[k];
827e3c9caa77d3 Aric Cyr                  2022-08-24  2730  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BlockHeightC = mode_lib->vba.MacroTileHeightC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2731  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].InterlaceEnable = mode_lib->vba.Interlace[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2732  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].HTotal = mode_lib->vba.HTotal[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2733  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DCCEnable = mode_lib->vba.DCCEnable[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2734  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2735  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SurfaceTiling = mode_lib->vba.SurfaceTiling[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2736  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2737  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2738  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ProgressiveToInterlaceUnitInOPP =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2739  				mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2740  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VRatio = mode_lib->vba.VRatio[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2741  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VRatioChroma = mode_lib->vba.VRatioChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2742  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VTaps = mode_lib->vba.vtaps[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2743  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].VTapsChroma = mode_lib->vba.VTAPsChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2744  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].PitchY = mode_lib->vba.PitchY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2745  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DCCMetaPitchY = mode_lib->vba.DCCMetaPitchY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2746  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].PitchC = mode_lib->vba.PitchC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2747  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].DCCMetaPitchC = mode_lib->vba.DCCMetaPitchC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2748  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportStationary = mode_lib->vba.ViewportStationary[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2749  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportXStart = mode_lib->vba.ViewportXStartY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2750  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportYStart = mode_lib->vba.ViewportYStartY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2751  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportXStartC = mode_lib->vba.ViewportXStartC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2752  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].ViewportYStartC = mode_lib->vba.ViewportYStartC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2753  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].FORCE_ONE_ROW_FOR_FRAME = mode_lib->vba.ForceOneRowForFrame[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2754  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SwathHeightY = mode_lib->vba.SwathHeightYThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2755  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters[k].SwathHeightC = mode_lib->vba.SwathHeightCThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2756  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2757  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2758  			{
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2759  				dml32_CalculateVMRowAndSwath(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2760  						mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2761  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SurfParameters,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2762  						mode_lib->vba.SurfaceSizeInMALL,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2763  						mode_lib->vba.PTEBufferSizeInRequestsLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2764  						mode_lib->vba.PTEBufferSizeInRequestsChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2765  						mode_lib->vba.DCCMetaBufferSizeBytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2766  						mode_lib->vba.UseMALLForStaticScreen,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2767  						mode_lib->vba.UsesMALLForPStateChange,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2768  						mode_lib->vba.MALLAllocatedForDCNFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2769  						mode_lib->vba.SwathWidthYThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2770  						mode_lib->vba.SwathWidthCThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2771  						mode_lib->vba.GPUVMEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2772  						mode_lib->vba.HostVMEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2773  						mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2774  						mode_lib->vba.GPUVMMaxPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2775  						mode_lib->vba.GPUVMMinPageSizeKBytes,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2776  						(unsigned int)mode_lib->vba.HostVMMinPageSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2777  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2778  						/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2779  						mode_lib->vba.PTEBufferSizeNotExceededPerState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2780  						mode_lib->vba.DCCMetaBufferSizeNotExceededPerState,
01cf387b1c7f60 Alex Deucher              2022-06-22  2781  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[0],
01cf387b1c7f60 Alex Deucher              2022-06-22  2782  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[1],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2783  						mode_lib->vba.dpte_row_height,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2784  						mode_lib->vba.dpte_row_height_chroma,
01cf387b1c7f60 Alex Deucher              2022-06-22  2785  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[2],
01cf387b1c7f60 Alex Deucher              2022-06-22  2786  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[3],
01cf387b1c7f60 Alex Deucher              2022-06-22  2787  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[4],
01cf387b1c7f60 Alex Deucher              2022-06-22  2788  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[5],
01cf387b1c7f60 Alex Deucher              2022-06-22  2789  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[6],
01cf387b1c7f60 Alex Deucher              2022-06-22  2790  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[7],
01cf387b1c7f60 Alex Deucher              2022-06-22  2791  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[8],
01cf387b1c7f60 Alex Deucher              2022-06-22  2792  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[9],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2793  						mode_lib->vba.meta_row_height,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2794  						mode_lib->vba.meta_row_height_chroma,
01cf387b1c7f60 Alex Deucher              2022-06-22  2795  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[10],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2796  						mode_lib->vba.dpte_group_bytes,
01cf387b1c7f60 Alex Deucher              2022-06-22  2797  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[11],
01cf387b1c7f60 Alex Deucher              2022-06-22  2798  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[12],
01cf387b1c7f60 Alex Deucher              2022-06-22  2799  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[13],
01cf387b1c7f60 Alex Deucher              2022-06-22  2800  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[14],
01cf387b1c7f60 Alex Deucher              2022-06-22  2801  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[15],
01cf387b1c7f60 Alex Deucher              2022-06-22  2802  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[16],
01cf387b1c7f60 Alex Deucher              2022-06-22  2803  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[17],
01cf387b1c7f60 Alex Deucher              2022-06-22  2804  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[18],
01cf387b1c7f60 Alex Deucher              2022-06-22  2805  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[19],
01cf387b1c7f60 Alex Deucher              2022-06-22  2806  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[20],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2807  						mode_lib->vba.PrefetchLinesYThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2808  						mode_lib->vba.PrefetchLinesCThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2809  						mode_lib->vba.PrefillY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2810  						mode_lib->vba.PrefillC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2811  						mode_lib->vba.MaxNumSwY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2812  						mode_lib->vba.MaxNumSwC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2813  						mode_lib->vba.meta_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2814  						mode_lib->vba.dpte_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2815  						mode_lib->vba.DPTEBytesPerRowThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2816  						mode_lib->vba.PDEAndMetaPTEBytesPerFrameThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2817  						mode_lib->vba.MetaRowBytesThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2818  						mode_lib->vba.use_one_row_for_frame_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2819  						mode_lib->vba.use_one_row_for_frame_flip_this_state,
01cf387b1c7f60 Alex Deucher              2022-06-22  2820  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[0], // Boolean UsesMALLForStaticScreen[]
01cf387b1c7f60 Alex Deucher              2022-06-22  2821  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_boolean_array[1], // Boolean PTE_BUFFER_MODE[]
01cf387b1c7f60 Alex Deucher              2022-06-22  2822  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer_array[21]); // Long BIGK_FRAGMENT_SIZE[]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2823  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2824  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2825  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2826  				mode_lib->vba.PrefetchLinesY[i][j][k] = mode_lib->vba.PrefetchLinesYThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2827  				mode_lib->vba.PrefetchLinesC[i][j][k] = mode_lib->vba.PrefetchLinesCThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2828  				mode_lib->vba.meta_row_bandwidth[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2829  						mode_lib->vba.meta_row_bandwidth_this_state[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2830  				mode_lib->vba.dpte_row_bandwidth[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2831  						mode_lib->vba.dpte_row_bandwidth_this_state[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2832  				mode_lib->vba.DPTEBytesPerRow[i][j][k] = mode_lib->vba.DPTEBytesPerRowThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2833  				mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2834  						mode_lib->vba.PDEAndMetaPTEBytesPerFrameThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2835  				mode_lib->vba.MetaRowBytes[i][j][k] = mode_lib->vba.MetaRowBytesThisState[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2836  				mode_lib->vba.use_one_row_for_frame[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2837  						mode_lib->vba.use_one_row_for_frame_this_state[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2838  				mode_lib->vba.use_one_row_for_frame_flip[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2839  						mode_lib->vba.use_one_row_for_frame_flip_this_state[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2840  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2841  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2842  			mode_lib->vba.PTEBufferSizeNotExceeded[i][j] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2843  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2844  				if (mode_lib->vba.PTEBufferSizeNotExceededPerState[k] == false)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2845  					mode_lib->vba.PTEBufferSizeNotExceeded[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2846  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2847  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2848  			mode_lib->vba.DCCMetaBufferSizeNotExceeded[i][j] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2849  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2850  				if (mode_lib->vba.DCCMetaBufferSizeNotExceededPerState[k] == false)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2851  					mode_lib->vba.DCCMetaBufferSizeNotExceeded[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2852  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2853  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2854  			mode_lib->vba.UrgLatency[i] = dml32_CalculateUrgentLatency(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2855  					mode_lib->vba.UrgentLatencyPixelDataOnly,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2856  					mode_lib->vba.UrgentLatencyPixelMixedWithVMData,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2857  					mode_lib->vba.UrgentLatencyVMDataOnly, mode_lib->vba.DoUrgentLatencyAdjustment,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2858  					mode_lib->vba.UrgentLatencyAdjustmentFabricClockComponent,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2859  					mode_lib->vba.UrgentLatencyAdjustmentFabricClockReference,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2860  					mode_lib->vba.FabricClockPerState[i]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2861  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2862  			//bool   NotUrgentLatencyHiding[DC__NUM_DPP__MAX];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2863  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2864  				dml32_CalculateUrgentBurstFactor(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2865  						mode_lib->vba.UsesMALLForPStateChange[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2866  						mode_lib->vba.swath_width_luma_ub_this_state[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2867  						mode_lib->vba.swath_width_chroma_ub_this_state[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2868  						mode_lib->vba.SwathHeightYThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2869  						mode_lib->vba.SwathHeightCThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2870  						(double) mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2871  						mode_lib->vba.UrgLatency[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2872  						mode_lib->vba.CursorBufferSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2873  						mode_lib->vba.CursorWidth[k][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2874  						mode_lib->vba.CursorBPP[k][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2875  						mode_lib->vba.VRatio[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2876  						mode_lib->vba.VRatioChroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2877  						mode_lib->vba.BytePerPixelInDETY[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2878  						mode_lib->vba.BytePerPixelInDETC[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2879  						mode_lib->vba.DETBufferSizeYThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2880  						mode_lib->vba.DETBufferSizeCThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2881  						/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2882  						&mode_lib->vba.UrgentBurstFactorCursor[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2883  						&mode_lib->vba.UrgentBurstFactorLuma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2884  						&mode_lib->vba.UrgentBurstFactorChroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2885  						&mode_lib->vba.NoUrgentLatencyHiding[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2886  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2887  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2888  			dml32_CalculateDCFCLKDeepSleep(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2889  					mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2890  					mode_lib->vba.BytePerPixelY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2891  					mode_lib->vba.BytePerPixelC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2892  					mode_lib->vba.VRatio,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2893  					mode_lib->vba.VRatioChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2894  					mode_lib->vba.SwathWidthYThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2895  					mode_lib->vba.SwathWidthCThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2896  					mode_lib->vba.NoOfDPPThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2897  					mode_lib->vba.HRatio,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2898  					mode_lib->vba.HRatioChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2899  					mode_lib->vba.PixelClock,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2900  					mode_lib->vba.PSCL_FACTOR,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2901  					mode_lib->vba.PSCL_FACTOR_CHROMA,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2902  					mode_lib->vba.RequiredDPPCLKThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2903  					mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2904  					mode_lib->vba.ReadBandwidthChroma,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2905  					(int)mode_lib->vba.ReturnBusWidth,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2906  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2907  					/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2908  					&mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2909  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2910  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2911  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2912  	//Calculate Return BW
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  2913  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2914  		for (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2915  			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2916  				if (mode_lib->vba.BlendingAndTiming[k] == k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2917  					if (mode_lib->vba.WritebackEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2918  						mode_lib->vba.WritebackDelayTime[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2919  							mode_lib->vba.WritebackLatency
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2920  						+ dml32_CalculateWriteBackDelay(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2921  							mode_lib->vba.WritebackPixelFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2922  							mode_lib->vba.WritebackHRatio[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2923  							mode_lib->vba.WritebackVRatio[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2924  							mode_lib->vba.WritebackVTaps[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2925  							(long)mode_lib->vba.WritebackDestinationWidth[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2926  							(int)mode_lib->vba.WritebackDestinationHeight[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2927  							(int)mode_lib->vba.WritebackSourceHeight[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2928  							mode_lib->vba.HTotal[k])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2929  							/ mode_lib->vba.RequiredDISPCLK[i][j];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2930  					} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2931  						mode_lib->vba.WritebackDelayTime[k] = 0.0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2932  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2933  					for (m = 0; m <= mode_lib->vba.NumberOfActiveSurfaces - 1; m++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2934  						if (mode_lib->vba.BlendingAndTiming[m]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2935  								== k && mode_lib->vba.WritebackEnable[m] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2936  							mode_lib->vba.WritebackDelayTime[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2937  								dml_max(mode_lib->vba.WritebackDelayTime[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2938  									mode_lib->vba.WritebackLatency
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2939  								+ dml32_CalculateWriteBackDelay(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2940  									mode_lib->vba.WritebackPixelFormat[m],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2941  									mode_lib->vba.WritebackHRatio[m],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2942  									mode_lib->vba.WritebackVRatio[m],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2943  									mode_lib->vba.WritebackVTaps[m],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2944  									(int)mode_lib->vba.WritebackDestinationWidth[m],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2945  									(int)mode_lib->vba.WritebackDestinationHeight[m],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2946  									(int)mode_lib->vba.WritebackSourceHeight[m],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2947  									mode_lib->vba.HTotal[m]) /
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2948  									mode_lib->vba.RequiredDISPCLK[i][j]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2949  						}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2950  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2951  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2952  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2953  			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2954  				for (m = 0; m <= mode_lib->vba.NumberOfActiveSurfaces - 1; m++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2955  					if (mode_lib->vba.BlendingAndTiming[k] == m) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2956  						mode_lib->vba.WritebackDelayTime[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2957  								mode_lib->vba.WritebackDelayTime[m];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2958  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2959  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2960  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2961  			mode_lib->vba.MaxMaxVStartup[i][j] = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2962  			for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2963  				mode_lib->vba.MaximumVStartup[i][j][k] = ((mode_lib->vba.Interlace[k] &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2964  								!mode_lib->vba.ProgressiveToInterlaceUnitInOPP) ?
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2965  								dml_floor((mode_lib->vba.VTotal[k] -
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2966  									mode_lib->vba.VActive[k]) / 2.0, 1.0) :
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2967  								mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k])
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2968  								- dml_max(1.0, dml_ceil(1.0 *
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2969  									mode_lib->vba.WritebackDelayTime[k] /
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2970  									(mode_lib->vba.HTotal[k] /
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2971  									mode_lib->vba.PixelClock[k]), 1.0));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2972  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2973  				// Clamp to max OTG vstartup register limit
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2974  				if (mode_lib->vba.MaximumVStartup[i][j][k] > 1023)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2975  					mode_lib->vba.MaximumVStartup[i][j][k] = 1023;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2976  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2977  				mode_lib->vba.MaxMaxVStartup[i][j] = dml_max(mode_lib->vba.MaxMaxVStartup[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2978  						mode_lib->vba.MaximumVStartup[i][j][k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2979  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2980  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2981  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2982  
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2983  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes = (unsigned int)(mode_lib->vba.NumberOfChannels
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2984  			* dml_max3(mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelDataOnly,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2985  					mode_lib->vba.UrgentOutOfOrderReturnPerChannelPixelMixedWithVMData,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  2986  					mode_lib->vba.UrgentOutOfOrderReturnPerChannelVMDataOnly));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2987  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2988  	dml32_CalculateMinAndMaxPrefetchMode(mode_lib->vba.AllowForPStateChangeOrStutterInVBlankFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2989  			&mode_lib->vba.MinPrefetchMode,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2990  			&mode_lib->vba.MaxPrefetchMode);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2991  
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  2992  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2993  		for (j = 0; j <= 1; ++j)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2994  			mode_lib->vba.DCFCLKState[i][j] = mode_lib->vba.DCFCLKPerState[i];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2995  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2996  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2997  	/* Immediate Flip and MALL parameters */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2998  	mode_lib->vba.ImmediateFlipRequiredFinal = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  2999  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3000  		mode_lib->vba.ImmediateFlipRequiredFinal = mode_lib->vba.ImmediateFlipRequiredFinal
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3001  				|| (mode_lib->vba.ImmediateFlipRequirement[k] == dm_immediate_flip_required);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3002  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3003  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3004  	mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3005  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3006  		mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3007  				mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3008  						|| ((mode_lib->vba.ImmediateFlipRequirement[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3009  								!= dm_immediate_flip_required)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3010  								&& (mode_lib->vba.ImmediateFlipRequirement[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3011  										!= dm_immediate_flip_not_required));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3012  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3013  	mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3014  			mode_lib->vba.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3015  					&& mode_lib->vba.ImmediateFlipRequiredFinal;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3016  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3017  	mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3018  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3019  		mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3020  			mode_lib->vba.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe ||
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3021  			((mode_lib->vba.HostVMEnable == true || mode_lib->vba.ImmediateFlipRequirement[k] !=
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3022  					dm_immediate_flip_not_required) &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3023  			(mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame ||
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3024  			mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3025  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3026  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3027  	mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3028  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3029  		mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3030  			mode_lib->vba.InvalidCombinationOfMALLUseForPStateAndStaticScreen
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3031  			|| ((mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_enable
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3032  			|| mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_optimize)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3033  			&& (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe))
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3034  			|| ((mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_disable
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3035  			|| mode_lib->vba.UseMALLForStaticScreen[k] == dm_use_mall_static_screen_optimize)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3036  			&& (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3037  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3038  
7acc487ab57e07 Alex Deucher              2022-07-20  3039  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod = false;
7acc487ab57e07 Alex Deucher              2022-07-20  3040  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod = false;
7acc487ab57e07 Alex Deucher              2022-07-20  3041  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3042  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3043  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3044  		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_full_frame)
7acc487ab57e07 Alex Deucher              2022-07-20  3045  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3046  		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_sub_viewport)
7acc487ab57e07 Alex Deucher              2022-07-20  3047  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3048  		if (mode_lib->vba.UsesMALLForPStateChange[k] == dm_use_mall_pstate_change_phantom_pipe)
7acc487ab57e07 Alex Deucher              2022-07-20  3049  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3050  	}
7acc487ab57e07 Alex Deucher              2022-07-20  3051  	mode_lib->vba.InvalidCombinationOfMALLUseForPState = (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod
7acc487ab57e07 Alex Deucher              2022-07-20  3052  			!= v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.PhantomPipeMALLPStateMethod) || (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.SubViewportMALLPStateMethod && v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.FullFrameMALLPStateMethod);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3053  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3054  	if (mode_lib->vba.UseMinimumRequiredDCFCLK == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3055  		dml32_UseMinimumDCFCLK(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3056  				mode_lib->vba.UsesMALLForPStateChange,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3057  				mode_lib->vba.DRRDisplay,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3058  				mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3059  				mode_lib->vba.MaxInterDCNTileRepeaters,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3060  				mode_lib->vba.MaxPrefetchMode,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3061  				mode_lib->vba.DRAMClockChangeLatency,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3062  				mode_lib->vba.FCLKChangeLatency,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3063  				mode_lib->vba.SREnterPlusExitTime,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3064  				(int)mode_lib->vba.ReturnBusWidth,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3065  				(int)mode_lib->vba.RoundTripPingLatencyCycles,
7acc487ab57e07 Alex Deucher              2022-07-20  3066  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3067  				mode_lib->vba.PixelChunkSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3068  				mode_lib->vba.MetaChunkSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3069  				mode_lib->vba.GPUVMEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3070  				mode_lib->vba.GPUVMMaxPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3071  				mode_lib->vba.HostVMEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3072  				mode_lib->vba.NumberOfActiveSurfaces,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3073  				(unsigned int)mode_lib->vba.HostVMMinPageSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3074  				mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3075  				mode_lib->vba.DynamicMetadataVMEnabled,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3076  				mode_lib->vba.ImmediateFlipRequiredFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3077  				mode_lib->vba.ProgressiveToInterlaceUnitInOPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3078  				mode_lib->vba.MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3079  				mode_lib->vba.PercentOfIdealFabricAndSDPPortBWReceivedAfterUrgLatency,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3080  				mode_lib->vba.VTotal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3081  				mode_lib->vba.VActive,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3082  				mode_lib->vba.DynamicMetadataTransmittedBytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3083  				mode_lib->vba.DynamicMetadataLinesBeforeActiveRequired,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3084  				mode_lib->vba.Interlace,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3085  				mode_lib->vba.RequiredDPPCLK,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3086  				mode_lib->vba.RequiredDISPCLK,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3087  				mode_lib->vba.UrgLatency,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3088  				mode_lib->vba.NoOfDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3089  				mode_lib->vba.ProjectedDCFCLKDeepSleep,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3090  				mode_lib->vba.MaximumVStartup,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3091  				mode_lib->vba.TotalNumberOfActiveDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3092  				mode_lib->vba.TotalNumberOfDCCActiveDPP,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3093  				mode_lib->vba.dpte_group_bytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3094  				mode_lib->vba.PrefetchLinesY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3095  				mode_lib->vba.PrefetchLinesC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3096  				mode_lib->vba.swath_width_luma_ub_all_states,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3097  				mode_lib->vba.swath_width_chroma_ub_all_states,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3098  				mode_lib->vba.BytePerPixelY,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3099  				mode_lib->vba.BytePerPixelC,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3100  				mode_lib->vba.HTotal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3101  				mode_lib->vba.PixelClock,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3102  				mode_lib->vba.PDEAndMetaPTEBytesPerFrame,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3103  				mode_lib->vba.DPTEBytesPerRow,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3104  				mode_lib->vba.MetaRowBytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3105  				mode_lib->vba.DynamicMetadataEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3106  				mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3107  				mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3108  				mode_lib->vba.DCFCLKPerState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3109  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3110  				/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3111  				mode_lib->vba.DCFCLKState);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3112  	} // UseMinimumRequiredDCFCLK == true
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3113  
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  3114  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3115  		for (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3116  			mode_lib->vba.ReturnBWPerState[i][j] = dml32_get_return_bw_mbps(&mode_lib->vba.soc, i,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3117  					mode_lib->vba.HostVMEnable, mode_lib->vba.DCFCLKState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3118  					mode_lib->vba.FabricClockPerState[i], mode_lib->vba.DRAMSpeedPerState[i]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3119  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3120  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3121  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3122  	//Re-ordering Buffer Support Check
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  3123  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3124  		for (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3125  			if ((mode_lib->vba.ROBBufferSizeInKByte - mode_lib->vba.PixelChunkSizeInKByte) * 1024
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3126  					/ mode_lib->vba.ReturnBWPerState[i][j]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3127  					> (mode_lib->vba.RoundTripPingLatencyCycles + 32)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3128  							/ mode_lib->vba.DCFCLKState[i][j]
7acc487ab57e07 Alex Deucher              2022-07-20  3129  							+ v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes / mode_lib->vba.ReturnBWPerState[i][j]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3130  				mode_lib->vba.ROBSupport[i][j] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3131  			} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3132  				mode_lib->vba.ROBSupport[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3133  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3134  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3135  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3136  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3137  	//Vertical Active BW support check
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3138  	v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaxTotalVActiveRDBandwidth = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3139  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3140  	for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3141  		v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaxTotalVActiveRDBandwidth += mode_lib->vba.ReadBandwidthLuma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3142  				+ mode_lib->vba.ReadBandwidthChroma[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3143  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3144  
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  3145  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3146  		for (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3147  			mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][j] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3148  				dml_min3(mode_lib->vba.ReturnBusWidth * mode_lib->vba.DCFCLKState[i][j]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3149  					* mode_lib->vba.MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation / 100,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3150  					mode_lib->vba.FabricClockPerState[i]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3151  					* mode_lib->vba.FabricDatapathToDCNDataReturn
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3152  					* mode_lib->vba.MaxAveragePercentOfIdealFabricBWDisplayCanUseInNormalSystemOperation / 100,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3153  					mode_lib->vba.DRAMSpeedPerState[i]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3154  					* mode_lib->vba.NumberOfChannels
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3155  					* mode_lib->vba.DRAMChannelWidth
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3156  					* (i < 2 ? mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperationSTROBE : mode_lib->vba.MaxAveragePercentOfIdealDRAMBWDisplayCanUseInNormalSystemOperation) / 100);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3157  
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3158  			if (v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.MaxTotalVActiveRDBandwidth
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3159  					<= mode_lib->vba.MaxTotalVerticalActiveAvailableBandwidth[i][j]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3160  				mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][j] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3161  			} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3162  				mode_lib->vba.TotalVerticalActiveBandwidthSupport[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3163  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3164  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3165  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3166  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3167  	/* Prefetch Check */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3168  
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  3169  	for (i = start_state; i < (int) v->soc.num_states; ++i) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3170  		for (j = 0; j <= 1; ++j) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3171  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3172  			mode_lib->vba.TimeCalc = 24 / mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3173  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3174  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3175  				mode_lib->vba.NoOfDPPThisState[k] = mode_lib->vba.NoOfDPP[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3176  				mode_lib->vba.swath_width_luma_ub_this_state[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3177  						mode_lib->vba.swath_width_luma_ub_all_states[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3178  				mode_lib->vba.swath_width_chroma_ub_this_state[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3179  						mode_lib->vba.swath_width_chroma_ub_all_states[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3180  				mode_lib->vba.SwathWidthYThisState[k] = mode_lib->vba.SwathWidthYAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3181  				mode_lib->vba.SwathWidthCThisState[k] = mode_lib->vba.SwathWidthCAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3182  				mode_lib->vba.SwathHeightYThisState[k] = mode_lib->vba.SwathHeightYAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3183  				mode_lib->vba.SwathHeightCThisState[k] = mode_lib->vba.SwathHeightCAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3184  				mode_lib->vba.UnboundedRequestEnabledThisState =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3185  						mode_lib->vba.UnboundedRequestEnabledAllStates[i][j];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3186  				mode_lib->vba.CompressedBufferSizeInkByteThisState =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3187  						mode_lib->vba.CompressedBufferSizeInkByteAllStates[i][j];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3188  				mode_lib->vba.DETBufferSizeInKByteThisState[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3189  						mode_lib->vba.DETBufferSizeInKByteAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3190  				mode_lib->vba.DETBufferSizeYThisState[k] =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3191  						(unsigned int)mode_lib->vba.DETBufferSizeYAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3192  				mode_lib->vba.DETBufferSizeCThisState[k] =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3193  						(unsigned int)mode_lib->vba.DETBufferSizeCAllStates[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3194  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3195  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3196  			mode_lib->vba.VActiveBandwithSupport[i][j] = dml32_CalculateVActiveBandwithSupport(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3197  					mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3198  					mode_lib->vba.ReturnBWPerState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3199  					mode_lib->vba.NoUrgentLatencyHiding,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3200  					mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3201  					mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3202  					mode_lib->vba.cursor_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3203  					mode_lib->vba.meta_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3204  					mode_lib->vba.dpte_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3205  					mode_lib->vba.NoOfDPPThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3206  					mode_lib->vba.UrgentBurstFactorLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3207  					mode_lib->vba.UrgentBurstFactorChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3208  					mode_lib->vba.UrgentBurstFactorCursor);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3209  
6d4727c80947de Dillon Varone             2022-11-08  3210  			mode_lib->vba.NotEnoughDETSwathFillLatencyHidingPerState[i][j] = dml32_CalculateDETSwathFillLatencyHiding(
6d4727c80947de Dillon Varone             2022-11-08  3211  					mode_lib->vba.NumberOfActiveSurfaces,
6d4727c80947de Dillon Varone             2022-11-08  3212  					mode_lib->vba.ReturnBWPerState[i][j],
6d4727c80947de Dillon Varone             2022-11-08  3213  					mode_lib->vba.UrgLatency[i],
6d4727c80947de Dillon Varone             2022-11-08  3214  					mode_lib->vba.SwathHeightYThisState,
6d4727c80947de Dillon Varone             2022-11-08  3215  					mode_lib->vba.SwathHeightCThisState,
6d4727c80947de Dillon Varone             2022-11-08  3216  					mode_lib->vba.swath_width_luma_ub_this_state,
6d4727c80947de Dillon Varone             2022-11-08  3217  					mode_lib->vba.swath_width_chroma_ub_this_state,
6d4727c80947de Dillon Varone             2022-11-08  3218  					mode_lib->vba.BytePerPixelInDETY,
6d4727c80947de Dillon Varone             2022-11-08  3219  					mode_lib->vba.BytePerPixelInDETC,
6d4727c80947de Dillon Varone             2022-11-08  3220  					mode_lib->vba.DETBufferSizeYThisState,
6d4727c80947de Dillon Varone             2022-11-08  3221  					mode_lib->vba.DETBufferSizeCThisState,
6d4727c80947de Dillon Varone             2022-11-08  3222  					mode_lib->vba.NoOfDPPThisState,
6d4727c80947de Dillon Varone             2022-11-08  3223  					mode_lib->vba.HTotal,
6d4727c80947de Dillon Varone             2022-11-08  3224  					mode_lib->vba.PixelClock,
6d4727c80947de Dillon Varone             2022-11-08  3225  					mode_lib->vba.VRatio,
6d4727c80947de Dillon Varone             2022-11-08  3226  					mode_lib->vba.VRatioChroma,
de930140bb578e Alvin Lee                 2023-02-24  3227  					mode_lib->vba.UsesMALLForPStateChange,
de930140bb578e Alvin Lee                 2023-02-24  3228  					mode_lib->vba.UseUnboundedRequesting);
6d4727c80947de Dillon Varone             2022-11-08  3229  
7acc487ab57e07 Alex Deucher              2022-07-20  3230  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.VMDataOnlyReturnBWPerState = dml32_get_return_bw_mbps_vm_only(&mode_lib->vba.soc, i,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3231  					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.FabricClockPerState[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3232  					mode_lib->vba.DRAMSpeedPerState[i]);
7acc487ab57e07 Alex Deucher              2022-07-20  3233  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3234  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3235  			if (mode_lib->vba.GPUVMEnable && mode_lib->vba.HostVMEnable)
7acc487ab57e07 Alex Deucher              2022-07-20  3236  				v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor = mode_lib->vba.ReturnBWPerState[i][j]
7acc487ab57e07 Alex Deucher              2022-07-20  3237  						/ v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.VMDataOnlyReturnBWPerState;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3238  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3239  			mode_lib->vba.ExtraLatency = dml32_CalculateExtraLatency(
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3240  					(int)mode_lib->vba.RoundTripPingLatencyCycles, v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.ReorderingBytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3241  					mode_lib->vba.DCFCLKState[i][j], mode_lib->vba.TotalNumberOfActiveDPP[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3242  					mode_lib->vba.PixelChunkSizeInKByte,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3243  					mode_lib->vba.TotalNumberOfDCCActiveDPP[i][j], mode_lib->vba.MetaChunkSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3244  					mode_lib->vba.ReturnBWPerState[i][j], mode_lib->vba.GPUVMEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3245  					mode_lib->vba.HostVMEnable, mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3246  					mode_lib->vba.NoOfDPPThisState, mode_lib->vba.dpte_group_bytes,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3247  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor, (unsigned int)mode_lib->vba.HostVMMinPageSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3248  					mode_lib->vba.HostVMMaxNonCachedPageTableLevels);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3249  
7acc487ab57e07 Alex Deucher              2022-07-20  3250  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState = mode_lib->vba.MinPrefetchMode;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3251  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3252  			mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3253  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3254  			do {
7acc487ab57e07 Alex Deucher              2022-07-20  3255  				mode_lib->vba.PrefetchModePerState[i][j] = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3256  				mode_lib->vba.MaxVStartup = mode_lib->vba.NextMaxVStartup;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3257  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3258  				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3259  					mode_lib->vba.TWait = dml32_CalculateTWait(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3260  							mode_lib->vba.PrefetchModePerState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3261  							mode_lib->vba.UsesMALLForPStateChange[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3262  							mode_lib->vba.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3263  							mode_lib->vba.DRRDisplay[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3264  							mode_lib->vba.DRAMClockChangeLatency,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3265  							mode_lib->vba.FCLKChangeLatency, mode_lib->vba.UrgLatency[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3266  							mode_lib->vba.SREnterPlusExitTime);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3267  
a1b6667ef90b38 Aurabindo Pillai          2022-10-20  3268  					memset(&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull, 0, sizeof(DmlPipe));
7acc487ab57e07 Alex Deucher              2022-07-20  3269  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dppclk = mode_lib->vba.RequiredDPPCLK[i][j][k];
7acc487ab57e07 Alex Deucher              2022-07-20  3270  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.Dispclk = mode_lib->vba.RequiredDISPCLK[i][j];
7acc487ab57e07 Alex Deucher              2022-07-20  3271  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.PixelClock = mode_lib->vba.PixelClock[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3272  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DCFClkDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[i][j];
7acc487ab57e07 Alex Deucher              2022-07-20  3273  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DPPPerSurface = mode_lib->vba.NoOfDPP[i][j][k];
7acc487ab57e07 Alex Deucher              2022-07-20  3274  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ScalerEnabled = mode_lib->vba.ScalerEnabled[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3275  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.SourceRotation = mode_lib->vba.SourceRotation[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3276  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockWidth256BytesY = mode_lib->vba.Read256BlockWidthY[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3277  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockHeight256BytesY = mode_lib->vba.Read256BlockHeightY[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3278  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockWidth256BytesC = mode_lib->vba.Read256BlockWidthC[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3279  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BlockHeight256BytesC = mode_lib->vba.Read256BlockHeightC[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3280  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.InterlaceEnable = mode_lib->vba.Interlace[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3281  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.NumberOfCursors = mode_lib->vba.NumberOfCursors[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3282  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.VBlank = mode_lib->vba.VTotal[k] - mode_lib->vba.VActive[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3283  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.HTotal = mode_lib->vba.HTotal[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3284  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.HActive = mode_lib->vba.HActive[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3285  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.DCCEnable = mode_lib->vba.DCCEnable[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3286  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ODMMode = mode_lib->vba.ODMCombineEnablePerState[i][k];
7acc487ab57e07 Alex Deucher              2022-07-20  3287  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.SourcePixelFormat = mode_lib->vba.SourcePixelFormat[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3288  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BytePerPixelY = mode_lib->vba.BytePerPixelY[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3289  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.BytePerPixelC = mode_lib->vba.BytePerPixelC[k];
7acc487ab57e07 Alex Deucher              2022-07-20  3290  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe.ProgressiveToInterlaceUnitInOPP =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3291  							mode_lib->vba.ProgressiveToInterlaceUnitInOPP;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3292  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3293  					mode_lib->vba.NoTimeForPrefetch[i][j][k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3294  						dml32_CalculatePrefetchSchedule(
3b4e83a232244e Nathan Chancellor         2022-08-30  3295  							v,
3b4e83a232244e Nathan Chancellor         2022-08-30  3296  							k,
7acc487ab57e07 Alex Deucher              2022-07-20  3297  							v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
7acc487ab57e07 Alex Deucher              2022-07-20  3298  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.myPipe,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3299  							(unsigned int)v->DSCDelayPerState[i][k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3300  							(unsigned int)(v->SwathWidthYThisState[k] / v->HRatio[k]),
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3301  							(unsigned int)dml_min(v->MaxVStartup, v->MaximumVStartup[i][j][k]),
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3302  							(unsigned int)v->MaximumVStartup[i][j][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3303  							v->UrgLatency[i],
3b4e83a232244e Nathan Chancellor         2022-08-30  3304  							v->ExtraLatency,
3b4e83a232244e Nathan Chancellor         2022-08-30  3305  							v->TimeCalc,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3306  							(unsigned int)v->PDEAndMetaPTEBytesPerFrame[i][j][k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3307  							(unsigned int)v->MetaRowBytes[i][j][k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3308  							(unsigned int)v->DPTEBytesPerRow[i][j][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3309  							v->PrefetchLinesY[i][j][k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3310  							(unsigned int)v->SwathWidthYThisState[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3311  							(unsigned int)v->PrefillY[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3312  							v->MaxNumSwY[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3313  							v->PrefetchLinesC[i][j][k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3314  							(unsigned int)v->SwathWidthCThisState[k],
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3315  							(unsigned int)v->PrefillC[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3316  							v->MaxNumSwC[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3317  							v->swath_width_luma_ub_this_state[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3318  							v->swath_width_chroma_ub_this_state[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3319  							v->SwathHeightYThisState[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3320  							v->SwathHeightCThisState[k], v->TWait,
7e60ab4eb3e4ba Alvin Lee                 2023-05-11  3321  							(v->DRAMSpeedPerState[i] <= MEM_STROBE_FREQ_MHZ || v->DCFCLKState[i][j] <= DCFCLK_FREQ_EXTRA_PREFETCH_REQ_MHZ) ?
01c0c124b9ecaa Dillon Varone             2022-10-27  3322  									mode_lib->vba.ip.min_prefetch_in_strobe_us : 0,
dd4e4bb2884339 Alvin Lee                 2023-12-06  3323  							mode_lib->vba.PrefetchModePerState[i][j] > 0 || mode_lib->vba.DRAMClockChangeRequirementFinal == false,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3324  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3325  							/* Output */
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3326  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler[k],
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3327  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTYAfterScaler[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3328  							&v->LineTimesForPrefetch[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3329  							&v->PrefetchBW[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3330  							&v->LinesForMetaPTE[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3331  							&v->LinesForMetaAndDPTERow[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3332  							&v->VRatioPreY[i][j][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3333  							&v->VRatioPreC[i][j][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3334  							&v->RequiredPrefetchPixelDataBWLuma[0][0][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3335  							&v->RequiredPrefetchPixelDataBWChroma[0][0][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3336  							&v->NoTimeForDynamicMetadata[i][j][k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3337  							&v->Tno_bw[k],
3b4e83a232244e Nathan Chancellor         2022-08-30  3338  							&v->prefetch_vmrow_bw[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3339  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0],         // double *Tdmdl_vm
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3340  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1],         // double *Tdmdl
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3341  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[2],         // double *TSetup
7acc487ab57e07 Alex Deucher              2022-07-20  3342  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0],         							    // unsigned int   *VUpdateOffsetPix
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3343  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[3],         // unsigned int   *VUpdateWidthPix
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3344  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[4]);        // unsigned int   *VReadyOffsetPix
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3345  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3346  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3347  				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3348  					dml32_CalculateUrgentBurstFactor(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3349  							mode_lib->vba.UsesMALLForPStateChange[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3350  							mode_lib->vba.swath_width_luma_ub_this_state[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3351  							mode_lib->vba.swath_width_chroma_ub_this_state[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3352  							mode_lib->vba.SwathHeightYThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3353  							mode_lib->vba.SwathHeightCThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3354  							mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3355  							mode_lib->vba.UrgLatency[i], mode_lib->vba.CursorBufferSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3356  							mode_lib->vba.CursorWidth[k][0], mode_lib->vba.CursorBPP[k][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3357  							mode_lib->vba.VRatioPreY[i][j][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3358  							mode_lib->vba.VRatioPreC[i][j][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3359  							mode_lib->vba.BytePerPixelInDETY[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3360  							mode_lib->vba.BytePerPixelInDETC[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3361  							mode_lib->vba.DETBufferSizeYThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3362  							mode_lib->vba.DETBufferSizeCThisState[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3363  							/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3364  							&mode_lib->vba.UrgentBurstFactorCursorPre[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3365  							&mode_lib->vba.UrgentBurstFactorLumaPre[k],
385c3e4c29e1d4 Paul Hsieh                2023-03-22  3366  							&mode_lib->vba.UrgentBurstFactorChromaPre[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3367  							&mode_lib->vba.NotUrgentLatencyHidingPre[k]);
074b3a886713f6 Alvin Lee                 2024-06-20  3368  
074b3a886713f6 Alvin Lee                 2024-06-20  3369  					v->cursor_bw_pre[k] = mode_lib->vba.NumberOfCursors[k] * mode_lib->vba.CursorWidth[k][0] * mode_lib->vba.CursorBPP[k][0] /
074b3a886713f6 Alvin Lee                 2024-06-20  3370  							8.0 / (mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]) * v->VRatioPreY[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3371  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3372  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3373  				{
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3374  					dml32_CalculatePrefetchBandwithSupport(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3375  							mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3376  							mode_lib->vba.ReturnBWPerState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3377  							mode_lib->vba.NotUrgentLatencyHidingPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3378  							mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3379  							mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3380  							mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3381  							mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3382  							mode_lib->vba.cursor_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3383  							mode_lib->vba.meta_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3384  							mode_lib->vba.dpte_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3385  							mode_lib->vba.cursor_bw_pre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3386  							mode_lib->vba.prefetch_vmrow_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3387  							mode_lib->vba.NoOfDPPThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3388  							mode_lib->vba.UrgentBurstFactorLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3389  							mode_lib->vba.UrgentBurstFactorChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3390  							mode_lib->vba.UrgentBurstFactorCursor,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3391  							mode_lib->vba.UrgentBurstFactorLumaPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3392  							mode_lib->vba.UrgentBurstFactorChromaPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3393  							mode_lib->vba.UrgentBurstFactorCursorPre,
3a61570415690e Alvin Lee                 2023-01-31  3394  							v->PrefetchBW,
3a61570415690e Alvin Lee                 2023-01-31  3395  							v->VRatio,
3a61570415690e Alvin Lee                 2023-01-31  3396  							v->MaxVRatioPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3397  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3398  							/* output */
01cf387b1c7f60 Alex Deucher              2022-06-22  3399  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0],   // Single  *PrefetchBandwidth
01cf387b1c7f60 Alex Deucher              2022-06-22  3400  							&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1],   // Single  *FractionOfUrgentBandwidth
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3401  							&mode_lib->vba.PrefetchSupported[i][j]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3402  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3403  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3404  				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3405  					if (mode_lib->vba.LineTimesForPrefetch[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3406  							< 2.0 || mode_lib->vba.LinesForMetaPTE[k] >= 32.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3407  							|| mode_lib->vba.LinesForMetaAndDPTERow[k] >= 16.0
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3408  							|| mode_lib->vba.NoTimeForPrefetch[i][j][k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3409  						mode_lib->vba.PrefetchSupported[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3410  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3411  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3412  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3413  				mode_lib->vba.DynamicMetadataSupported[i][j] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3414  				for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3415  					if (mode_lib->vba.NoTimeForDynamicMetadata[i][j][k] == true)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3416  						mode_lib->vba.DynamicMetadataSupported[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3417  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3418  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3419  				mode_lib->vba.VRatioInPrefetchSupported[i][j] = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3420  				for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
7cd07d9de8711a Alvin Lee                 2023-01-25  3421  					if (mode_lib->vba.VRatioPreY[i][j][k] > mode_lib->vba.MaxVRatioPre
7cd07d9de8711a Alvin Lee                 2023-01-25  3422  							|| mode_lib->vba.VRatioPreC[i][j][k] > mode_lib->vba.MaxVRatioPre
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3423  							|| mode_lib->vba.NoTimeForPrefetch[i][j][k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3424  						mode_lib->vba.VRatioInPrefetchSupported[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3425  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3426  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3427  				mode_lib->vba.AnyLinesForVMOrRowTooLarge = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3428  				for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3429  					if (mode_lib->vba.LinesForMetaAndDPTERow[k] >= 16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3430  							|| mode_lib->vba.LinesForMetaPTE[k] >= 32) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3431  						mode_lib->vba.AnyLinesForVMOrRowTooLarge = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3432  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3433  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3434  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3435  				if (mode_lib->vba.PrefetchSupported[i][j] == true
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3436  						&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3437  					mode_lib->vba.BandwidthAvailableForImmediateFlip =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3438  							dml32_CalculateBandwidthAvailableForImmediateFlip(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3439  							mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3440  							mode_lib->vba.ReturnBWPerState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3441  							mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3442  							mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3443  							mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3444  							mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3445  							mode_lib->vba.cursor_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3446  							mode_lib->vba.cursor_bw_pre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3447  							mode_lib->vba.NoOfDPPThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3448  							mode_lib->vba.UrgentBurstFactorLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3449  							mode_lib->vba.UrgentBurstFactorChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3450  							mode_lib->vba.UrgentBurstFactorCursor,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3451  							mode_lib->vba.UrgentBurstFactorLumaPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3452  							mode_lib->vba.UrgentBurstFactorChromaPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3453  							mode_lib->vba.UrgentBurstFactorCursorPre);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3454  
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3455  					mode_lib->vba.TotImmediateFlipBytes = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3456  					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3457  						if (!(mode_lib->vba.ImmediateFlipRequirement[k] ==
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3458  								dm_immediate_flip_not_required)) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3459  							mode_lib->vba.TotImmediateFlipBytes =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3460  									(unsigned int)(mode_lib->vba.TotImmediateFlipBytes
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3461  								+ mode_lib->vba.NoOfDPP[i][j][k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3462  								* mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k]
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3463  								+ mode_lib->vba.MetaRowBytes[i][j][k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3464  							if (mode_lib->vba.use_one_row_for_frame_flip[i][j][k]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3465  								mode_lib->vba.TotImmediateFlipBytes =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3466  									(unsigned int)(mode_lib->vba.TotImmediateFlipBytes + 2
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3467  								* mode_lib->vba.DPTEBytesPerRow[i][j][k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3468  							} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3469  								mode_lib->vba.TotImmediateFlipBytes =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3470  									(unsigned int)(mode_lib->vba.TotImmediateFlipBytes
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3471  								+ mode_lib->vba.DPTEBytesPerRow[i][j][k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3472  							}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3473  						}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3474  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3475  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3476  					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
7acc487ab57e07 Alex Deucher              2022-07-20  3477  						dml32_CalculateFlipSchedule(v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.HostVMInefficiencyFactor,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3478  							mode_lib->vba.ExtraLatency,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3479  							mode_lib->vba.UrgLatency[i],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3480  							mode_lib->vba.GPUVMMaxPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3481  							mode_lib->vba.HostVMEnable,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3482  							mode_lib->vba.HostVMMaxNonCachedPageTableLevels,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3483  							mode_lib->vba.GPUVMEnable,
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3484  							(unsigned int)mode_lib->vba.HostVMMinPageSize,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3485  							mode_lib->vba.PDEAndMetaPTEBytesPerFrame[i][j][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3486  							mode_lib->vba.MetaRowBytes[i][j][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3487  							mode_lib->vba.DPTEBytesPerRow[i][j][k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3488  							mode_lib->vba.BandwidthAvailableForImmediateFlip,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3489  							mode_lib->vba.TotImmediateFlipBytes,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3490  							mode_lib->vba.SourcePixelFormat[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3491  							(mode_lib->vba.HTotal[k] / mode_lib->vba.PixelClock[k]),
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3492  							mode_lib->vba.VRatio[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3493  							mode_lib->vba.VRatioChroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3494  							mode_lib->vba.Tno_bw[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3495  								mode_lib->vba.DCCEnable[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3496  							mode_lib->vba.dpte_row_height[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3497  							mode_lib->vba.meta_row_height[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3498  							mode_lib->vba.dpte_row_height_chroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3499  							mode_lib->vba.meta_row_height_chroma[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3500  							mode_lib->vba.use_one_row_for_frame_flip[i][j][k], // 24
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3501  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3502  							/* Output */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3503  							&mode_lib->vba.DestinationLinesToRequestVMInImmediateFlip[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3504  							&mode_lib->vba.DestinationLinesToRequestRowInImmediateFlip[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3505  							&mode_lib->vba.final_flip_bw[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3506  							&mode_lib->vba.ImmediateFlipSupportedForPipe[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3507  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3508  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3509  					{
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3510  						dml32_CalculateImmediateFlipBandwithSupport(mode_lib->vba.NumberOfActiveSurfaces,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3511  								mode_lib->vba.ReturnBWPerState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3512  								mode_lib->vba.ImmediateFlipRequirement,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3513  								mode_lib->vba.final_flip_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3514  								mode_lib->vba.ReadBandwidthLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3515  								mode_lib->vba.ReadBandwidthChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3516  								mode_lib->vba.RequiredPrefetchPixelDataBWLuma[0][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3517  								mode_lib->vba.RequiredPrefetchPixelDataBWChroma[0][0],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3518  								mode_lib->vba.cursor_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3519  								mode_lib->vba.meta_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3520  								mode_lib->vba.dpte_row_bandwidth_this_state,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3521  								mode_lib->vba.cursor_bw_pre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3522  								mode_lib->vba.prefetch_vmrow_bw,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3523  								mode_lib->vba.DPPPerPlane,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3524  								mode_lib->vba.UrgentBurstFactorLuma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3525  								mode_lib->vba.UrgentBurstFactorChroma,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3526  								mode_lib->vba.UrgentBurstFactorCursor,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3527  								mode_lib->vba.UrgentBurstFactorLumaPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3528  								mode_lib->vba.UrgentBurstFactorChromaPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3529  								mode_lib->vba.UrgentBurstFactorCursorPre,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3530  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3531  								/* output */
01cf387b1c7f60 Alex Deucher              2022-06-22  3532  								&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[0], //  Single  *TotalBandwidth
01cf387b1c7f60 Alex Deucher              2022-06-22  3533  								&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single[1], //  Single  *FractionOfUrgentBandwidth
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3534  								&mode_lib->vba.ImmediateFlipSupportedForState[i][j]); // Boolean *ImmediateFlipBandwidthSupport
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3535  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3536  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3537  					for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3538  						if (!(mode_lib->vba.ImmediateFlipRequirement[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3539  								== dm_immediate_flip_not_required)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3540  								&& (mode_lib->vba.ImmediateFlipSupportedForPipe[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3541  										== false))
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3542  							mode_lib->vba.ImmediateFlipSupportedForState[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3543  					}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3544  				} else { // if prefetch not support, assume iflip not supported
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3545  					mode_lib->vba.ImmediateFlipSupportedForState[i][j] = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3546  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3547  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3548  				if (mode_lib->vba.MaxVStartup <= __DML_VBA_MIN_VSTARTUP__
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3549  						|| mode_lib->vba.AnyLinesForVMOrRowTooLarge == false) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3550  					mode_lib->vba.NextMaxVStartup = mode_lib->vba.MaxMaxVStartup[i][j];
7acc487ab57e07 Alex Deucher              2022-07-20  3551  					v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState = v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState + 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3552  				} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3553  					mode_lib->vba.NextMaxVStartup = mode_lib->vba.NextMaxVStartup - 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3554  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3555  			} while (!((mode_lib->vba.PrefetchSupported[i][j] == true
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3556  					&& mode_lib->vba.DynamicMetadataSupported[i][j] == true
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3557  					&& mode_lib->vba.VRatioInPrefetchSupported[i][j] == true &&
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3558  					// consider flip support is okay if when there is no hostvm and the
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3559  					// user does't require a iflip OR the flip bw is ok
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3560  					// If there is hostvm, DCN needs to support iflip for invalidation
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3561  					((mode_lib->vba.HostVMEnable == false
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3562  							&& !mode_lib->vba.ImmediateFlipRequiredFinal)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3563  							|| mode_lib->vba.ImmediateFlipSupportedForState[i][j] == true))
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3564  					|| (mode_lib->vba.NextMaxVStartup == mode_lib->vba.MaxMaxVStartup[i][j]
7acc487ab57e07 Alex Deucher              2022-07-20  3565  							&& v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.NextPrefetchModeState > mode_lib->vba.MaxPrefetchMode)));
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3566  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3567  			for (k = 0; k < mode_lib->vba.NumberOfActiveSurfaces; ++k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3568  				mode_lib->vba.use_one_row_for_frame_this_state[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3569  						mode_lib->vba.use_one_row_for_frame[i][j][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3570  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3571  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3572  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3573  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.UrgentLatency = mode_lib->vba.UrgLatency[i];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3574  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.ExtraLatency = mode_lib->vba.ExtraLatency;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3575  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.WritebackLatency = mode_lib->vba.WritebackLatency;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3576  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.DRAMClockChangeLatency = mode_lib->vba.DRAMClockChangeLatency;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3577  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.FCLKChangeLatency = mode_lib->vba.FCLKChangeLatency;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3578  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SRExitTime = mode_lib->vba.SRExitTime;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3579  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SREnterPlusExitTime = mode_lib->vba.SREnterPlusExitTime;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3580  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SRExitZ8Time = mode_lib->vba.SRExitZ8Time;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3581  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SREnterPlusExitZ8Time = mode_lib->vba.SREnterPlusExitZ8Time;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3582  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.USRRetrainingLatency = mode_lib->vba.USRRetrainingLatency;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3583  			v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters.SMNLatency = mode_lib->vba.SMNLatency;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3584  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3585  			{
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3586  				dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
1df7e569522486 Nathan Chancellor         2022-08-30  3587  						v,
1df7e569522486 Nathan Chancellor         2022-08-30  3588  						v->PrefetchModePerState[i][j],
1df7e569522486 Nathan Chancellor         2022-08-30  3589  						v->DCFCLKState[i][j],
1df7e569522486 Nathan Chancellor         2022-08-30  3590  						v->ReturnBWPerState[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3591  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.mSOCParameters,
1df7e569522486 Nathan Chancellor         2022-08-30  3592  						v->SOCCLKPerState[i],
1df7e569522486 Nathan Chancellor         2022-08-30  3593  						v->ProjectedDCFCLKDeepSleep[i][j],
1df7e569522486 Nathan Chancellor         2022-08-30  3594  						v->DETBufferSizeYThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3595  						v->DETBufferSizeCThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3596  						v->SwathHeightYThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3597  						v->SwathHeightCThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3598  						v->SwathWidthYThisState, // 24
1df7e569522486 Nathan Chancellor         2022-08-30  3599  						v->SwathWidthCThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3600  						v->NoOfDPPThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3601  						v->BytePerPixelInDETY,
1df7e569522486 Nathan Chancellor         2022-08-30  3602  						v->BytePerPixelInDETC,
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3603  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTXAfterScaler,
d6aa8424bcac64 Aurabindo Pillai          2022-06-10  3604  						v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.DSTYAfterScaler,
1df7e569522486 Nathan Chancellor         2022-08-30  3605  						v->UnboundedRequestEnabledThisState,
1df7e569522486 Nathan Chancellor         2022-08-30  3606  						v->CompressedBufferSizeInkByteThisState,
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3607  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3608  						/* Output */
1df7e569522486 Nathan Chancellor         2022-08-30  3609  						&v->DRAMClockChangeSupport[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3610  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[0], // double *MaxActiveDRAMClockChangeLatencySupported
7acc487ab57e07 Alex Deucher              2022-07-20  3611  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_integer[0], // Long SubViewportLinesNeededInMALL[]
1df7e569522486 Nathan Chancellor         2022-08-30  3612  						&v->FCLKChangeSupport[i][j],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3613  						&v->dummy_vars.dml32_ModeSupportAndSystemConfigurationFull.dummy_single2[1], // double *MinActiveFCLKChangeLatencySupported
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3614  						&mode_lib->vba.USRRetrainingSupport[i][j],
a3c9b4c7a75a66 Alvin Lee                 2022-08-15  3615  						mode_lib->vba.ActiveDRAMClockChangeLatencyMarginPerState[i][j]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3616  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3617  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3618  	} // End of Prefetch Check
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3619  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3620  	/*Cursor Support Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3621  	mode_lib->vba.CursorSupport = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3622  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3623  		if (mode_lib->vba.CursorWidth[k][0] > 0.0) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3624  			if (mode_lib->vba.CursorBPP[k][0] == 64 && mode_lib->vba.Cursor64BppSupport == false)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3625  				mode_lib->vba.CursorSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3626  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3627  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3628  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3629  	/*Valid Pitch Check*/
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3630  	mode_lib->vba.PitchSupport = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3631  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3632  		mode_lib->vba.AlignedYPitch[k] = dml_ceil(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3633  				dml_max(mode_lib->vba.PitchY[k], mode_lib->vba.SurfaceWidthY[k]),
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3634  				mode_lib->vba.MacroTileWidthY[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3635  		if (mode_lib->vba.DCCEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3636  			mode_lib->vba.AlignedDCCMetaPitchY[k] = dml_ceil(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3637  					dml_max(mode_lib->vba.DCCMetaPitchY[k], mode_lib->vba.SurfaceWidthY[k]),
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3638  					64.0 * mode_lib->vba.Read256BlockWidthY[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3639  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3640  			mode_lib->vba.AlignedDCCMetaPitchY[k] = mode_lib->vba.DCCMetaPitchY[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3641  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3642  		if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64 && mode_lib->vba.SourcePixelFormat[k] != dm_444_32
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3643  				&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3644  				&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3645  				&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3646  				&& mode_lib->vba.SourcePixelFormat[k] != dm_mono_8) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3647  			mode_lib->vba.AlignedCPitch[k] = dml_ceil(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3648  					dml_max(mode_lib->vba.PitchC[k], mode_lib->vba.SurfaceWidthC[k]),
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3649  					mode_lib->vba.MacroTileWidthC[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3650  			if (mode_lib->vba.DCCEnable[k] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3651  				mode_lib->vba.AlignedDCCMetaPitchC[k] = dml_ceil(
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3652  						dml_max(mode_lib->vba.DCCMetaPitchC[k],
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3653  								mode_lib->vba.SurfaceWidthC[k]),
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3654  						64.0 * mode_lib->vba.Read256BlockWidthC[k]);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3655  			} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3656  				mode_lib->vba.AlignedDCCMetaPitchC[k] = mode_lib->vba.DCCMetaPitchC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3657  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3658  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3659  			mode_lib->vba.AlignedCPitch[k] = mode_lib->vba.PitchC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3660  			mode_lib->vba.AlignedDCCMetaPitchC[k] = mode_lib->vba.DCCMetaPitchC[k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3661  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3662  		if (mode_lib->vba.AlignedYPitch[k] > mode_lib->vba.PitchY[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3663  				|| mode_lib->vba.AlignedCPitch[k] > mode_lib->vba.PitchC[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3664  				|| mode_lib->vba.AlignedDCCMetaPitchY[k] > mode_lib->vba.DCCMetaPitchY[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3665  				|| mode_lib->vba.AlignedDCCMetaPitchC[k] > mode_lib->vba.DCCMetaPitchC[k]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3666  			mode_lib->vba.PitchSupport = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3667  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3668  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3669  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3670  	mode_lib->vba.ViewportExceedsSurface = false;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3671  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3672  		if (mode_lib->vba.ViewportWidth[k] > mode_lib->vba.SurfaceWidthY[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3673  				|| mode_lib->vba.ViewportHeight[k] > mode_lib->vba.SurfaceHeightY[k]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3674  			mode_lib->vba.ViewportExceedsSurface = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3675  			if (mode_lib->vba.SourcePixelFormat[k] != dm_444_64
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3676  					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_32
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3677  					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_16
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3678  					&& mode_lib->vba.SourcePixelFormat[k] != dm_444_8
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3679  					&& mode_lib->vba.SourcePixelFormat[k] != dm_rgbe) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3680  				if (mode_lib->vba.ViewportWidthChroma[k] > mode_lib->vba.SurfaceWidthC[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3681  						|| mode_lib->vba.ViewportHeightChroma[k]
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3682  								> mode_lib->vba.SurfaceHeightC[k]) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3683  					mode_lib->vba.ViewportExceedsSurface = true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3684  				}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3685  			}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3686  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3687  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3688  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3689  	/*Mode Support, Voltage State and SOC Configuration*/
1b54a0121dba12 Rodrigo Siqueira          2022-07-22  3690  	mode_support_configuration(v, mode_lib);
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3691  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3692  	MaximumMPCCombine = 0;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3693  
3a9c6f9a6159d8 Ilya Bakoulin             2022-11-24  3694  	for (i = v->soc.num_states; i >= start_state; i--) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3695  		if (i == v->soc.num_states || mode_lib->vba.ModeSupport[i][0] == true ||
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3696  				mode_lib->vba.ModeSupport[i][1] == true) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3697  			mode_lib->vba.VoltageLevel = i;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3698  			mode_lib->vba.ModeIsSupported = mode_lib->vba.ModeSupport[i][0] == true
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3699  					|| mode_lib->vba.ModeSupport[i][1] == true;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3700  
7e6d5cf8e3e3f8 Rodrigo Siqueira          2022-09-22  3701  			if (mode_lib->vba.ModeSupport[i][0] == true)
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3702  				MaximumMPCCombine = 0;
7e6d5cf8e3e3f8 Rodrigo Siqueira          2022-09-22  3703  			else
80fb575678b488 Samson Tam                2022-04-11  3704  				MaximumMPCCombine = 1;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3705  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3706  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3707  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3708  	mode_lib->vba.ImmediateFlipSupport =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3709  			mode_lib->vba.ImmediateFlipSupportedForState[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3710  	mode_lib->vba.UnboundedRequestEnabled =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3711  			mode_lib->vba.UnboundedRequestEnabledAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3712  	mode_lib->vba.CompressedBufferSizeInkByte =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3713  			mode_lib->vba.CompressedBufferSizeInkByteAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine]; // Not used, informational
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3714  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3715  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3716  		mode_lib->vba.MPCCombineEnable[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3717  				mode_lib->vba.MPCCombine[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3718  		mode_lib->vba.DPPPerPlane[k] = mode_lib->vba.NoOfDPP[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3719  		mode_lib->vba.SwathHeightY[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3720  				mode_lib->vba.SwathHeightYAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3721  		mode_lib->vba.SwathHeightC[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3722  				mode_lib->vba.SwathHeightCAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3723  		mode_lib->vba.DETBufferSizeInKByte[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3724  			mode_lib->vba.DETBufferSizeInKByteAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3725  		mode_lib->vba.DETBufferSizeY[k] =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3726  				(unsigned int)mode_lib->vba.DETBufferSizeYAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3727  		mode_lib->vba.DETBufferSizeC[k] =
1547752eea0ff5 Gaghik Khachatrian        2026-04-14  3728  				(unsigned int)mode_lib->vba.DETBufferSizeCAllStates[mode_lib->vba.VoltageLevel][MaximumMPCCombine][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3729  		mode_lib->vba.OutputType[k] = mode_lib->vba.OutputTypePerState[mode_lib->vba.VoltageLevel][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3730  		mode_lib->vba.OutputRate[k] = mode_lib->vba.OutputRatePerState[mode_lib->vba.VoltageLevel][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3731  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3732  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3733  	mode_lib->vba.DCFCLK = mode_lib->vba.DCFCLKState[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3734  	mode_lib->vba.DRAMSpeed = mode_lib->vba.DRAMSpeedPerState[mode_lib->vba.VoltageLevel];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3735  	mode_lib->vba.FabricClock = mode_lib->vba.FabricClockPerState[mode_lib->vba.VoltageLevel];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3736  	mode_lib->vba.SOCCLK = mode_lib->vba.SOCCLKPerState[mode_lib->vba.VoltageLevel];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3737  	mode_lib->vba.ReturnBW = mode_lib->vba.ReturnBWPerState[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3738  	mode_lib->vba.DISPCLK = mode_lib->vba.RequiredDISPCLK[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3739  	mode_lib->vba.maxMpcComb = MaximumMPCCombine;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3740  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3741  	for (k = 0; k <= mode_lib->vba.NumberOfActiveSurfaces - 1; k++) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3742  		if (mode_lib->vba.BlendingAndTiming[k] == k) {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3743  			mode_lib->vba.ODMCombineEnabled[k] =
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3744  					mode_lib->vba.ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3745  		} else {
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3746  			mode_lib->vba.ODMCombineEnabled[k] = dm_odm_combine_mode_disabled;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3747  		}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3748  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3749  		mode_lib->vba.DSCEnabled[k] = mode_lib->vba.RequiresDSC[mode_lib->vba.VoltageLevel][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3750  		mode_lib->vba.FECEnable[k] = mode_lib->vba.RequiresFEC[mode_lib->vba.VoltageLevel][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3751  		mode_lib->vba.OutputBpp[k] = mode_lib->vba.OutputBppPerState[mode_lib->vba.VoltageLevel][k];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3752  	}
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3753  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3754  	mode_lib->vba.UrgentWatermark = mode_lib->vba.Watermark.UrgentWatermark;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3755  	mode_lib->vba.StutterEnterPlusExitWatermark = mode_lib->vba.Watermark.StutterEnterPlusExitWatermark;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3756  	mode_lib->vba.StutterExitWatermark = mode_lib->vba.Watermark.StutterExitWatermark;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3757  	mode_lib->vba.WritebackDRAMClockChangeWatermark = mode_lib->vba.Watermark.WritebackDRAMClockChangeWatermark;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3758  	mode_lib->vba.DRAMClockChangeWatermark = mode_lib->vba.Watermark.DRAMClockChangeWatermark;
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3759  	mode_lib->vba.UrgentLatency = mode_lib->vba.UrgLatency[mode_lib->vba.VoltageLevel];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3760  	mode_lib->vba.DCFCLKDeepSleep = mode_lib->vba.ProjectedDCFCLKDeepSleep[mode_lib->vba.VoltageLevel][MaximumMPCCombine];
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3761  
dda4fb85e433f7 Aurabindo Pillai          2022-02-21  3762  	/* VBA has Error type to Error Msg output here, but not necessary for DML-C */
dda4fb85e433f7 Aurabindo Pillai          2022-02-21 @3763  } // ModeSupportAndSystemConfigurationFull

:::::: The code at line 3763 was first introduced by commit
:::::: dda4fb85e433f761eedaed0005a2bc20d705d504 drm/amd/display: DML changes for DCN32/321

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
