Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF078471
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 05:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695878182; x=1727414182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dkqVz7022XxkrMjxlSeuvl9YoVg6YDGT/NRmddJsGfY=;
  b=NVi0dnwF5NPw/5RuwakugCMW44UZvxfeXEV5GUhf2x5ASOIlSMgRFvuP
   cy3hJSlhwJ1uzKaW9zMCeV71lhOdv0xXqO51ZxVR9KJAaMtp8fBDfAvCb
   VRZ8Y8hXqMmOjqyClOwZy2suCNHSXOO0QSu+o2R1bUML+WFBG/V0N4cnN
   hzSyH4a//uxWfWFPG9wD+mU1i0HEKLSdyVSsUY0mULP2scFeNeAscNCHR
   oVaiCN5YUlemuLrUaVZQK5m9UOZk/VmSOFK8WGLWOuntIq0yIXJ4uk/QM
   cm+mvds9jfQc5UpdOnl5PhWhkcUjqw6bvkvkEBPF3GNWYeJS9wfJW7vUy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448479557"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="448479557"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 22:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892888621"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="892888621"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2023 22:15:10 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qljNq-00018f-0D;
	Thu, 28 Sep 2023 05:16:18 +0000
Date: Thu, 28 Sep 2023 13:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 81/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:1659: undefined reference to
 `__udivdi3'
Message-ID: <202309281315.24lwSlJE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3897e2d444b49105470ddf8b6beed3f183bc4886
commit: 331ab451ba3754ceb865f9559b9540d00657ee7f [81/88] drm/nouveau/disp/r535: initial support
config: i386-randconfig-053-20230928 (https://download.01.org/0day-ci/archive/20230928/202309281315.24lwSlJE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281315.24lwSlJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281315.24lwSlJE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst':
>> drivers/gpu/drm/nouveau/dispnv50/disp.c:1659: undefined reference to `__udivdi3'
>> ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1664: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1665: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1665: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.c:1694: undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:drivers/gpu/drm/nouveau/dispnv50/disp.c:1695: more undefined references to `__udivdi3' follow

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:667:42-46: ERROR: invalid reference to the index variable of the iterator on line 656

vim +1659 drivers/gpu/drm/nouveau/dispnv50/disp.c

  1600	
  1601	static bool
  1602	nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
  1603				  struct nv50_head *head, struct nv50_head_atom *asyh)
  1604	{
  1605		bool enhancedFraming = outp->dp.dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
  1606		u64 minRate = outp->dp.link_bw * 1000;
  1607		unsigned tuSize = 64;
  1608		unsigned waterMark;
  1609		unsigned hBlankSym;
  1610		unsigned vBlankSym;
  1611		unsigned watermarkAdjust = DP_CONFIG_WATERMARK_ADJUST;
  1612		unsigned watermarkMinimum = DP_CONFIG_WATERMARK_LIMIT;
  1613		// depth is multiplied by 16 in case of DSC enable
  1614		s32 hblank_symbols;
  1615		// number of link clocks per line.
  1616		int vblank_symbols	  = 0;
  1617		bool bEnableDsc = false;
  1618		unsigned surfaceWidth = asyh->mode.h.blanks - asyh->mode.h.blanke;
  1619		unsigned rasterWidth = asyh->mode.h.active;
  1620		unsigned depth = asyh->or.bpc * 3;
  1621		unsigned DSC_FACTOR = bEnableDsc ? 16 : 1;
  1622		u64 pixelClockHz = asyh->mode.clock * 1000;
  1623		u64 PrecisionFactor = 100000, ratioF, watermarkF;
  1624		u32 numLanesPerLink = outp->dp.link_nr;
  1625		u32 numSymbolsPerLine;
  1626		u32 BlankingBits;
  1627		u32 surfaceWidthPerLink;
  1628		u32 PixelSteeringBits;
  1629		u64 NumBlankingLinkClocks;
  1630		u32 MinHBlank;
  1631	
  1632		if (outp->outp.info.dp.increased_wm) {
  1633			watermarkAdjust = DP_CONFIG_INCREASED_WATERMARK_ADJUST;
  1634			watermarkMinimum = DP_CONFIG_INCREASED_WATERMARK_LIMIT;
  1635		}
  1636	
  1637		if ((pixelClockHz * depth) >= (8 * minRate * outp->dp.link_nr * DSC_FACTOR))
  1638		{
  1639			return false;
  1640		}
  1641	
  1642		//
  1643		// For DSC, if (pclk * bpp) < (1/64 * orclk * 8 * lanes) then some TU may end up with
  1644		// 0 active symbols. This may cause HW hang. Bug 200379426
  1645		//
  1646		if ((bEnableDsc) &&
  1647			((pixelClockHz * depth) < ((8 * minRate * outp->dp.link_nr * DSC_FACTOR) / 64)))
  1648		{
  1649			return false;
  1650		}
  1651	
  1652		//
  1653		//  Perform the SST calculation.
  1654		//	For auto mode the watermark calculation does not need to track accumulated error the
  1655		//	formulas for manual mode will not work.  So below calculation was extracted from the DTB.
  1656		//
  1657		ratioF = ((u64)pixelClockHz * depth * PrecisionFactor) / DSC_FACTOR;
  1658	
> 1659		ratioF /= 8 * (u64) minRate * outp->dp.link_nr;
  1660	
  1661		if (PrecisionFactor < ratioF) // Assert if we will end up with a negative number in below
  1662			return false;
  1663	
> 1664		watermarkF = ratioF * tuSize * (PrecisionFactor - ratioF)  / PrecisionFactor;
  1665		waterMark = (unsigned)(watermarkAdjust + ((2 * (depth * PrecisionFactor / (8 * numLanesPerLink * DSC_FACTOR)) + watermarkF) / PrecisionFactor));
  1666	
  1667		//
  1668		//  Bounds check the watermark
  1669		//
  1670		numSymbolsPerLine = (surfaceWidth * depth) / (8 * outp->dp.link_nr * DSC_FACTOR);
  1671	
  1672		if (WARN_ON(waterMark > 39 || waterMark > numSymbolsPerLine))
  1673			return false;
  1674	
  1675		//
  1676		//  Clamp the low side
  1677		//
  1678		if (waterMark < watermarkMinimum)
  1679			waterMark = watermarkMinimum;
  1680	
  1681		//Bits to send BS/BE/Extra symbols due to pixel padding
  1682		//Also accounts for enhanced framing.
  1683		BlankingBits = 3*8*numLanesPerLink + (enhancedFraming ? 3*8*numLanesPerLink : 0);
  1684	
  1685		//VBID/MVID/MAUD sent 4 times all the time
  1686		BlankingBits += 3*8*4;
  1687	
  1688		surfaceWidthPerLink = surfaceWidth;
  1689	
  1690		//Extra bits sent due to pixel steering
  1691		PixelSteeringBits = (surfaceWidthPerLink % numLanesPerLink) ? (((numLanesPerLink - surfaceWidthPerLink % numLanesPerLink) * depth) / DSC_FACTOR) : 0;
  1692	
  1693		BlankingBits += PixelSteeringBits;
  1694		NumBlankingLinkClocks = (u64)BlankingBits * PrecisionFactor / (8 * numLanesPerLink);
  1695		MinHBlank = (u32)(NumBlankingLinkClocks * pixelClockHz/ minRate / PrecisionFactor);
  1696		MinHBlank += 12;
  1697	
  1698		if (WARN_ON(MinHBlank > rasterWidth - surfaceWidth))
  1699			return false;
  1700	
  1701		// Bug 702290 - Active Width should be greater than 60
  1702		if (WARN_ON(surfaceWidth <= 60))
  1703			return false;
  1704	
  1705	
  1706		hblank_symbols = (s32)(((u64)(rasterWidth - surfaceWidth - MinHBlank) * minRate) / pixelClockHz);
  1707	
  1708		//reduce HBlank Symbols to account for secondary data packet
  1709		hblank_symbols -= 1; //Stuffer latency to send BS
  1710		hblank_symbols -= 3; //SPKT latency to send data to stuffer
  1711	
  1712		hblank_symbols -= numLanesPerLink == 1 ? 9  : numLanesPerLink == 2 ? 6 : 3;
  1713	
  1714		hBlankSym = (hblank_symbols < 0) ? 0 : hblank_symbols;
  1715	
  1716		// Refer to dev_disp.ref for more information.
  1717		// # symbols/vblank = ((SetRasterBlankEnd.X + SetRasterSize.Width - SetRasterBlankStart.X - 40) * link_clk / pclk) - Y - 1;
  1718		// where Y = (# lanes == 4) 12 : (# lanes == 2) ? 21 : 39
  1719		if (surfaceWidth < 40)
  1720		{
  1721			vblank_symbols = 0;
  1722		}
  1723		else
  1724		{
  1725			vblank_symbols = (s32)(((u64)(surfaceWidth - 40) * minRate) /  pixelClockHz) - 1;
  1726	
  1727			vblank_symbols -= numLanesPerLink == 1 ? 39  : numLanesPerLink == 2 ? 21 : 12;
  1728		}
  1729	
  1730		vBlankSym = (vblank_symbols < 0) ? 0 : vblank_symbols;
  1731	
  1732		return nvif_outp_dp_sst(&outp->outp, head->base.index, waterMark, hBlankSym, vBlankSym);
  1733	}
  1734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
