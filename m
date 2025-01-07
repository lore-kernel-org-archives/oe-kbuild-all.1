Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621031D8DFE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242462; cv=none; b=N1ZklRcJa4meelt+SMMgaduKXapORZ4NMMXsiTXZEGbs/3wbRbAJdtm3TXc34sYlq4SQz7Jy479eU6yjTBAM7wJK1r+iBPOkAlarft/rA0PzHlPUelYzo2jLGw3THNygrbxsoSZ1pDQN6pfWC4wNy2Nxrkj/qWv4G6vrjXkecaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242462; c=relaxed/simple;
	bh=aJsHJwYnYv6guoEilIEFWooVmLcUqOWokAY3/3chwzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YjCGwSZoY58EY0ss7riaZRcdc8o9hyYZL6zcvCqYe2ZtW5IPPDBcs2zpMbSBe9hTICB3PKmfQlTkzpLGDNEnKoVz4lQBsGSbKG5VoDx4EgIxYWwWMy95DobksF89Ed4L32Q/2rj4+gkJnv7kQMmBP7ERk5bz1KWmn1TfJ5BPcKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i53cpTrg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i53cpTrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736242459; x=1767778459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJsHJwYnYv6guoEilIEFWooVmLcUqOWokAY3/3chwzI=;
  b=i53cpTrgoypNLkxPQp5o2is8iMVxw63KJKCXtuFPZ57sH1bsPPJ4nJzr
   0RLL050rpxX6uB/bfOMoYp1iirFOMUXi5Sri6GejXVhl4XaCKyCzIjPfA
   twV1XVWl1Fg7WbpI4hH+CPm5zdWuqJ7tzj47cURuj7ppac8l1c+dYu4RF
   O72N9v0DxHIYWZMS4SVxJL1thRsuiSkg1RS8RRwyRBosH80UCgUnWBEpd
   G0SWmpGodUVhL4BpReYccQEXaDtrsbBV+jnS+FXDkpw49DkhVhD+wGoII
   d+QbiJ94wJPVgf3Mag/Lww5bcsa3mKi164jielQFZlSj9WrfsSbJQMc0q
   g==;
X-CSE-ConnectionGUID: 8F0idEiiRlezgxfE3ELRBg==
X-CSE-MsgGUID: epNXNuKVQc+IGllhP+va4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36110395"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="36110395"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 01:34:18 -0800
X-CSE-ConnectionGUID: MKgK8XyiRq+Z9lerkCZt0g==
X-CSE-MsgGUID: ppHY4qr3TH2ZqS97ouxu1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102529678"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2025 01:34:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV5yY-000EV1-0W;
	Tue, 07 Jan 2025 09:34:14 +0000
Date: Tue, 7 Jan 2025 17:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [linux-next:master 540/6768] drivers/gpu/drm/vc4/vc4_plane.c:2013
 vc6_plane_mode_set() warn: inconsistent indenting
Message-ID: <202501071728.SkvmwnpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e16367cfe0ce395f29d0482b78970cce8e1db73
commit: 7687a12153d344b5d97a19f1e156a02da8d0d756 [540/6768] drm/vc4: hvs: Add support for BCM2712 HVS
config: arm64-randconfig-r072-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071728.SkvmwnpM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071728.SkvmwnpM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vc4/vc4_plane.c:2013 vc6_plane_mode_set() warn: inconsistent indenting

vim +2013 drivers/gpu/drm/vc4/vc4_plane.c

  1675	
  1676	static int vc6_plane_mode_set(struct drm_plane *plane,
  1677				      struct drm_plane_state *state)
  1678	{
  1679		struct drm_device *drm = plane->dev;
  1680		struct vc4_dev *vc4 = to_vc4_dev(drm);
  1681		struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
  1682		struct drm_framebuffer *fb = state->fb;
  1683		const struct hvs_format *format = vc4_get_hvs_format(fb->format->format);
  1684		u64 base_format_mod = fourcc_mod_broadcom_mod(fb->modifier);
  1685		int num_planes = fb->format->num_planes;
  1686		u32 h_subsample = fb->format->hsub;
  1687		u32 v_subsample = fb->format->vsub;
  1688		bool mix_plane_alpha;
  1689		bool covers_screen;
  1690		u32 scl0, scl1, pitch0;
  1691		u32 tiling, src_x, src_y;
  1692		u32 width, height;
  1693		u32 hvs_format = format->hvs;
  1694		u32 offsets[3] = { 0 };
  1695		unsigned int rotation;
  1696		int ret, i;
  1697	
  1698		if (vc4_state->dlist_initialized)
  1699			return 0;
  1700	
  1701		ret = vc4_plane_setup_clipping_and_scaling(state);
  1702		if (ret)
  1703			return ret;
  1704	
  1705		width = vc4_state->src_w[0] >> 16;
  1706		height = vc4_state->src_h[0] >> 16;
  1707	
  1708		/* SCL1 is used for Cb/Cr scaling of planar formats.  For RGB
  1709		 * and 4:4:4, scl1 should be set to scl0 so both channels of
  1710		 * the scaler do the same thing.  For YUV, the Y plane needs
  1711		 * to be put in channel 1 and Cb/Cr in channel 0, so we swap
  1712		 * the scl fields here.
  1713		 */
  1714		if (num_planes == 1) {
  1715			scl0 = vc4_get_scl_field(state, 0);
  1716			scl1 = scl0;
  1717		} else {
  1718			scl0 = vc4_get_scl_field(state, 1);
  1719			scl1 = vc4_get_scl_field(state, 0);
  1720		}
  1721	
  1722		rotation = drm_rotation_simplify(state->rotation,
  1723						 DRM_MODE_ROTATE_0 |
  1724						 DRM_MODE_REFLECT_X |
  1725						 DRM_MODE_REFLECT_Y);
  1726	
  1727		/* We must point to the last line when Y reflection is enabled. */
  1728		src_y = vc4_state->src_y >> 16;
  1729		if (rotation & DRM_MODE_REFLECT_Y)
  1730			src_y += height - 1;
  1731	
  1732		src_x = vc4_state->src_x >> 16;
  1733	
  1734		switch (base_format_mod) {
  1735		case DRM_FORMAT_MOD_LINEAR:
  1736			tiling = SCALER6_CTL0_ADDR_MODE_LINEAR;
  1737	
  1738			/* Adjust the base pointer to the first pixel to be scanned
  1739			 * out.
  1740			 */
  1741			for (i = 0; i < num_planes; i++) {
  1742				offsets[i] += src_y / (i ? v_subsample : 1) * fb->pitches[i];
  1743				offsets[i] += src_x / (i ? h_subsample : 1) * fb->format->cpp[i];
  1744			}
  1745	
  1746			break;
  1747	
  1748		case DRM_FORMAT_MOD_BROADCOM_SAND128:
  1749		case DRM_FORMAT_MOD_BROADCOM_SAND256: {
  1750			uint32_t param = fourcc_mod_broadcom_param(fb->modifier);
  1751			u32 components_per_word;
  1752			u32 starting_offset;
  1753			u32 fetch_count;
  1754	
  1755			if (param > SCALER_TILE_HEIGHT_MASK) {
  1756				DRM_DEBUG_KMS("SAND height too large (%d)\n",
  1757					      param);
  1758				return -EINVAL;
  1759			}
  1760	
  1761			if (fb->format->format == DRM_FORMAT_P030) {
  1762				hvs_format = HVS_PIXEL_FORMAT_YCBCR_10BIT;
  1763				tiling = SCALER6_CTL0_ADDR_MODE_128B;
  1764			} else {
  1765				hvs_format = HVS_PIXEL_FORMAT_YCBCR_YUV420_2PLANE;
  1766	
  1767				switch (base_format_mod) {
  1768				case DRM_FORMAT_MOD_BROADCOM_SAND128:
  1769					tiling = SCALER6_CTL0_ADDR_MODE_128B;
  1770					break;
  1771				case DRM_FORMAT_MOD_BROADCOM_SAND256:
  1772					tiling = SCALER6_CTL0_ADDR_MODE_256B;
  1773					break;
  1774				default:
  1775					return -EINVAL;
  1776				}
  1777			}
  1778	
  1779			/* Adjust the base pointer to the first pixel to be scanned
  1780			 * out.
  1781			 *
  1782			 * For P030, y_ptr [31:4] is the 128bit word for the start pixel
  1783			 * y_ptr [3:0] is the pixel (0-11) contained within that 128bit
  1784			 * word that should be taken as the first pixel.
  1785			 * Ditto uv_ptr [31:4] vs [3:0], however [3:0] contains the
  1786			 * element within the 128bit word, eg for pixel 3 the value
  1787			 * should be 6.
  1788			 */
  1789			for (i = 0; i < num_planes; i++) {
  1790				u32 tile_w, tile, x_off, pix_per_tile;
  1791	
  1792				if (fb->format->format == DRM_FORMAT_P030) {
  1793					/*
  1794					 * Spec says: bits [31:4] of the given address
  1795					 * should point to the 128-bit word containing
  1796					 * the desired starting pixel, and bits[3:0]
  1797					 * should be between 0 and 11, indicating which
  1798					 * of the 12-pixels in that 128-bit word is the
  1799					 * first pixel to be used
  1800					 */
  1801					u32 remaining_pixels = src_x % 96;
  1802					u32 aligned = remaining_pixels / 12;
  1803					u32 last_bits = remaining_pixels % 12;
  1804	
  1805					x_off = aligned * 16 + last_bits;
  1806					tile_w = 128;
  1807					pix_per_tile = 96;
  1808				} else {
  1809					switch (base_format_mod) {
  1810					case DRM_FORMAT_MOD_BROADCOM_SAND128:
  1811						tile_w = 128;
  1812						break;
  1813					case DRM_FORMAT_MOD_BROADCOM_SAND256:
  1814						tile_w = 256;
  1815						break;
  1816					default:
  1817						return -EINVAL;
  1818					}
  1819					pix_per_tile = tile_w / fb->format->cpp[0];
  1820					x_off = (src_x % pix_per_tile) /
  1821						(i ? h_subsample : 1) *
  1822						fb->format->cpp[i];
  1823				}
  1824	
  1825				tile = src_x / pix_per_tile;
  1826	
  1827				offsets[i] += param * tile_w * tile;
  1828				offsets[i] += src_y / (i ? v_subsample : 1) * tile_w;
  1829				offsets[i] += x_off & ~(i ? 1 : 0);
  1830			}
  1831	
  1832			components_per_word = fb->format->format == DRM_FORMAT_P030 ? 24 : 32;
  1833			starting_offset = src_x % components_per_word;
  1834			fetch_count = (width + starting_offset + components_per_word - 1) /
  1835				components_per_word;
  1836	
  1837			pitch0 = VC4_SET_FIELD(param, SCALER6_PTR2_PITCH) |
  1838				 VC4_SET_FIELD(fetch_count - 1, SCALER6_PTR2_FETCH_COUNT);
  1839			break;
  1840		}
  1841	
  1842		default:
  1843			DRM_DEBUG_KMS("Unsupported FB tiling flag 0x%16llx",
  1844				      (long long)fb->modifier);
  1845			return -EINVAL;
  1846		}
  1847	
  1848		/* fetch an extra pixel if we don't actually line up with the left edge. */
  1849		if ((vc4_state->src_x & 0xffff) && vc4_state->src_x < (state->fb->width << 16))
  1850			width++;
  1851	
  1852		/* same for the right side */
  1853		if (((vc4_state->src_x + vc4_state->src_w[0]) & 0xffff) &&
  1854		    vc4_state->src_x + vc4_state->src_w[0] < (state->fb->width << 16))
  1855			width++;
  1856	
  1857		/* now for the top */
  1858		if ((vc4_state->src_y & 0xffff) && vc4_state->src_y < (state->fb->height << 16))
  1859			height++;
  1860	
  1861		/* and the bottom */
  1862		if (((vc4_state->src_y + vc4_state->src_h[0]) & 0xffff) &&
  1863		    vc4_state->src_y + vc4_state->src_h[0] < (state->fb->height << 16))
  1864			height++;
  1865	
  1866		/* for YUV444 hardware wants double the width, otherwise it doesn't
  1867		 * fetch full width of chroma
  1868		 */
  1869		if (format->drm == DRM_FORMAT_YUV444 || format->drm == DRM_FORMAT_YVU444)
  1870			width <<= 1;
  1871	
  1872		/* Don't waste cycles mixing with plane alpha if the set alpha
  1873		 * is opaque or there is no per-pixel alpha information.
  1874		 * In any case we use the alpha property value as the fixed alpha.
  1875		 */
  1876		mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
  1877				  fb->format->has_alpha;
  1878	
  1879		/* Control Word 0: Scaling Configuration & Element Validity*/
  1880		vc4_dlist_write(vc4_state,
  1881				SCALER6_CTL0_VALID |
  1882				VC4_SET_FIELD(tiling, SCALER6_CTL0_ADDR_MODE) |
  1883				VC4_SET_FIELD(0, SCALER6_CTL0_ALPHA_MASK) |
  1884				(vc4_state->is_unity ? SCALER6_CTL0_UNITY : 0) |
  1885				VC4_SET_FIELD(format->pixel_order_hvs5, SCALER6_CTL0_ORDERRGBA) |
  1886				VC4_SET_FIELD(scl1, SCALER6_CTL0_SCL1_MODE) |
  1887				VC4_SET_FIELD(scl0, SCALER6_CTL0_SCL0_MODE) |
  1888				VC4_SET_FIELD(hvs_format, SCALER6_CTL0_PIXEL_FORMAT));
  1889	
  1890		/* Position Word 0: Image Position */
  1891		vc4_state->pos0_offset = vc4_state->dlist_count;
  1892		vc4_dlist_write(vc4_state,
  1893				VC4_SET_FIELD(vc4_state->crtc_y, SCALER6_POS0_START_Y) |
  1894				(rotation & DRM_MODE_REFLECT_X ? SCALER6_POS0_HFLIP : 0) |
  1895				VC4_SET_FIELD(vc4_state->crtc_x, SCALER6_POS0_START_X));
  1896	
  1897		/* Control Word 2: Alpha Value & CSC */
  1898		vc4_dlist_write(vc4_state,
  1899				vc6_plane_get_csc_mode(vc4_state) |
  1900				vc4_hvs5_get_alpha_blend_mode(state) |
  1901				(mix_plane_alpha ? SCALER6_CTL2_ALPHA_MIX : 0) |
  1902				VC4_SET_FIELD(state->alpha >> 4, SCALER5_CTL2_ALPHA));
  1903	
  1904		/* Position Word 1: Scaled Image Dimensions */
  1905		if (!vc4_state->is_unity)
  1906			vc4_dlist_write(vc4_state,
  1907					VC4_SET_FIELD(vc4_state->crtc_h - 1,
  1908						      SCALER6_POS1_SCL_LINES) |
  1909					VC4_SET_FIELD(vc4_state->crtc_w - 1,
  1910						      SCALER6_POS1_SCL_WIDTH));
  1911	
  1912		/* Position Word 2: Source Image Size */
  1913		vc4_state->pos2_offset = vc4_state->dlist_count;
  1914		vc4_dlist_write(vc4_state,
  1915				VC4_SET_FIELD(height - 1,
  1916					      SCALER6_POS2_SRC_LINES) |
  1917				VC4_SET_FIELD(width - 1,
  1918					      SCALER6_POS2_SRC_WIDTH));
  1919	
  1920		/* Position Word 3: Context */
  1921		vc4_dlist_write(vc4_state, 0xc0c0c0c0);
  1922	
  1923		/*
  1924		 * TODO: This only covers Raster Scan Order planes
  1925		 */
  1926		for (i = 0; i < num_planes; i++) {
  1927			struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, i);
  1928			dma_addr_t paddr = bo->dma_addr + fb->offsets[i] + offsets[i];
  1929	
  1930			/* Pointer Word 0 */
  1931			vc4_state->ptr0_offset[i] = vc4_state->dlist_count;
  1932			vc4_dlist_write(vc4_state,
  1933					(rotation & DRM_MODE_REFLECT_Y ? SCALER6_PTR0_VFLIP : 0) |
  1934					/*
  1935					 * The UPM buffer will be allocated in
  1936					 * vc6_plane_allocate_upm().
  1937					 */
  1938					VC4_SET_FIELD(upper_32_bits(paddr) & 0xff,
  1939						      SCALER6_PTR0_UPPER_ADDR));
  1940	
  1941			/* Pointer Word 1 */
  1942			vc4_dlist_write(vc4_state, lower_32_bits(paddr));
  1943	
  1944			/* Pointer Word 2 */
  1945			if (base_format_mod != DRM_FORMAT_MOD_BROADCOM_SAND128 &&
  1946			    base_format_mod != DRM_FORMAT_MOD_BROADCOM_SAND256) {
  1947				vc4_dlist_write(vc4_state,
  1948						VC4_SET_FIELD(fb->pitches[i],
  1949							      SCALER6_PTR2_PITCH));
  1950			} else {
  1951				vc4_dlist_write(vc4_state, pitch0);
  1952			}
  1953		}
  1954	
  1955		/*
  1956		 * Palette Word 0
  1957		 * TODO: We're not using the palette mode
  1958		 */
  1959	
  1960		/*
  1961		 * Trans Word 0
  1962		 * TODO: It's only relevant if we set the trans_rgb bit in the
  1963		 * control word 0, and we don't at the moment.
  1964		 */
  1965	
  1966		vc4_state->lbm_offset = 0;
  1967	
  1968		if (!vc4_state->is_unity || fb->format->is_yuv) {
  1969			/*
  1970			 * Reserve a slot for the LBM Base Address. The real value will
  1971			 * be set when calling vc4_plane_allocate_lbm().
  1972			 */
  1973			if (vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
  1974			    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
  1975				vc4_state->lbm_offset = vc4_state->dlist_count;
  1976				vc4_dlist_counter_increment(vc4_state);
  1977			}
  1978	
  1979			if (vc4_state->x_scaling[0] != VC4_SCALING_NONE ||
  1980			    vc4_state->x_scaling[1] != VC4_SCALING_NONE ||
  1981			    vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
  1982			    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
  1983				if (num_planes > 1)
  1984					/*
  1985					 * Emit Cb/Cr as channel 0 and Y as channel
  1986					 * 1. This matches how we set up scl0/scl1
  1987					 * above.
  1988					 */
  1989					vc4_write_scaling_parameters(state, 1);
  1990	
  1991				vc4_write_scaling_parameters(state, 0);
  1992			}
  1993	
  1994			/*
  1995			 * If any PPF setup was done, then all the kernel
  1996			 * pointers get uploaded.
  1997			 */
  1998			if (vc4_state->x_scaling[0] == VC4_SCALING_PPF ||
  1999			    vc4_state->y_scaling[0] == VC4_SCALING_PPF ||
  2000			    vc4_state->x_scaling[1] == VC4_SCALING_PPF ||
  2001			    vc4_state->y_scaling[1] == VC4_SCALING_PPF) {
  2002				u32 kernel =
  2003					VC4_SET_FIELD(vc4->hvs->mitchell_netravali_filter.start,
  2004						      SCALER_PPF_KERNEL_OFFSET);
  2005	
  2006				/* HPPF plane 0 */
  2007				vc4_dlist_write(vc4_state, kernel);
  2008				/* VPPF plane 0 */
  2009				vc4_dlist_write(vc4_state, kernel);
  2010				/* HPPF plane 1 */
  2011				vc4_dlist_write(vc4_state, kernel);
  2012				/* VPPF plane 1 */
> 2013					vc4_dlist_write(vc4_state, kernel);
  2014			}
  2015		}
  2016	
  2017		vc4_dlist_write(vc4_state, SCALER6_CTL0_END);
  2018	
  2019		vc4_state->dlist[0] |=
  2020			VC4_SET_FIELD(vc4_state->dlist_count, SCALER6_CTL0_NEXT);
  2021	
  2022		/* crtc_* are already clipped coordinates. */
  2023		covers_screen = vc4_state->crtc_x == 0 && vc4_state->crtc_y == 0 &&
  2024				vc4_state->crtc_w == state->crtc->mode.hdisplay &&
  2025				vc4_state->crtc_h == state->crtc->mode.vdisplay;
  2026	
  2027		/*
  2028		 * Background fill might be necessary when the plane has per-pixel
  2029		 * alpha content or a non-opaque plane alpha and could blend from the
  2030		 * background or does not cover the entire screen.
  2031		 */
  2032		vc4_state->needs_bg_fill = fb->format->has_alpha || !covers_screen ||
  2033					   state->alpha != DRM_BLEND_ALPHA_OPAQUE;
  2034	
  2035		/*
  2036		 * Flag the dlist as initialized to avoid checking it twice in case
  2037		 * the async update check already called vc4_plane_mode_set() and
  2038		 * decided to fallback to sync update because async update was not
  2039		 * possible.
  2040		 */
  2041		vc4_state->dlist_initialized = 1;
  2042	
  2043		vc4_plane_calc_load(state);
  2044	
  2045		drm_dbg_driver(drm, "[PLANE:%d:%s] Computed DLIST size: %u\n",
  2046			       plane->base.id, plane->name, vc4_state->dlist_count);
  2047	
  2048		return 0;
  2049	}
  2050	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
