Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F06DCFF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArfB2knv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702589837; x=1734125837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1FXdVnSYRT6YSvbTKieCL/LuC1JOgaGsZGbW16v/Bw=;
  b=ArfB2knvfyiunVFSa9IVOgQNZRGdMh70GvYwZ4Lc4vuTG7LD6InSCTDI
   9XRek+rMuf8LMg7pYHEIEzBG1r2eTedVcUgXFgkmxaRiUIqcEdc6IRC1u
   XMtQG0doMvoqahFCqklpQKpn2bdW0kbDvCAHE+HsGzDjWIwb+RBCIpMMs
   kRHcy0USz6mXGttFm1ucnWjGOn6D878ntcfKlMGHmQRdy4JOfSIhNJtk0
   GkkQQiVs2mVs0Q4pGmluKo/l4ZAY0t4UlJ+LIG7MtYg+wcrQ65CDG7+nj
   AYic4YiJY1/lnrTjl3kMWOpWxgjlpqvXwxfCtFm+TcWdGmhh/K0XsIn3H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374696272"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="374696272"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 13:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947725913"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="947725913"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 13:37:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDtOL-000MdE-1P;
	Thu, 14 Dec 2023 21:37:13 +0000
Date: Fri, 15 Dec 2023 05:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 11/14] drm/rockchip: vop2: Add support for rk3588
Message-ID: <202312150550.FY5ljXQr-lkp@intel.com>
References: <20231130122439.13374-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130122439.13374-1-andyshrk@163.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on robh/for-next joro-iommu/next linus/master v6.7-rc5]
[cannot apply to rockchip/for-next next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/Revert-drm-rockchip-vop2-Use-regcache_sync-to-fix-suspend-resume/20231201-002355
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231130122439.13374-1-andyshrk%40163.com
patch subject: [PATCH v3 11/14] drm/rockchip: vop2: Add support for rk3588
config: alpha-randconfig-r122-20231202 (https://download.01.org/0day-ci/archive/20231215/202312150550.FY5ljXQr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150550.FY5ljXQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150550.FY5ljXQr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1858:28: sparse: sparse: dubious: x & !y

vim +1858 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

  1787	
  1788	static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
  1789	{
  1790		struct vop2 *vop2 = vp->vop2;
  1791		int dclk_core_div, dclk_out_div, if_pixclk_div, if_dclk_div;
  1792		unsigned long clock;
  1793		u32 die, dip, div, vp_clk_div, val;
  1794	
  1795		clock = rk3588_calc_cru_cfg(vp, id, &dclk_core_div, &dclk_out_div,
  1796					    &if_pixclk_div, &if_dclk_div);
  1797		if (!clock)
  1798			return 0;
  1799	
  1800		vp_clk_div = FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_CORE_DIV, dclk_core_div);
  1801		vp_clk_div |= FIELD_PREP(RK3588_VP_CLK_CTRL__DCLK_OUT_DIV, dclk_out_div);
  1802	
  1803		die = vop2_readl(vop2, RK3568_DSP_IF_EN);
  1804		dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
  1805		div = vop2_readl(vop2, RK3568_DSP_IF_CTRL);
  1806	
  1807		switch (id) {
  1808		case ROCKCHIP_VOP2_EP_HDMI0:
  1809			div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
  1810			div &= ~RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV;
  1811			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
  1812			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
  1813			die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
  1814			die |= RK3588_SYS_DSP_INFACE_EN_HDMI0 |
  1815				    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
  1816			val = rk3588_get_hdmi_pol(polflags);
  1817			regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 1, 1));
  1818			regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 6, 5));
  1819			break;
  1820		case ROCKCHIP_VOP2_EP_HDMI1:
  1821			div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
  1822			div &= ~RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV;
  1823			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV, if_dclk_div);
  1824			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV, if_pixclk_div);
  1825			die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX;
  1826			die |= RK3588_SYS_DSP_INFACE_EN_HDMI1 |
  1827				    FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX, vp->id);
  1828			val = rk3588_get_hdmi_pol(polflags);
  1829			regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 4, 4));
  1830			regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0, HIWORD_UPDATE(val, 8, 7));
  1831			break;
  1832		case ROCKCHIP_VOP2_EP_EDP0:
  1833			div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
  1834			div &= ~RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV;
  1835			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
  1836			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
  1837			die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX;
  1838			die |= RK3588_SYS_DSP_INFACE_EN_EDP0 |
  1839				   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI0_MUX, vp->id);
  1840			regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 0, 0));
  1841			break;
  1842		case ROCKCHIP_VOP2_EP_EDP1:
  1843			div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
  1844			div &= ~RK3588_DSP_IF_EDP_HDMI1_PCLK_DIV;
  1845			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV, if_dclk_div);
  1846			div |= FIELD_PREP(RK3588_DSP_IF_EDP_HDMI0_PCLK_DIV, if_pixclk_div);
  1847			die &= ~RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX;
  1848			die |= RK3588_SYS_DSP_INFACE_EN_EDP1 |
  1849				   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_EDP_HDMI1_MUX, vp->id);
  1850			regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, HIWORD_UPDATE(1, 3, 3));
  1851			break;
  1852		case ROCKCHIP_VOP2_EP_MIPI0:
  1853			div &= ~RK3588_DSP_IF_MIPI0_PCLK_DIV;
  1854			div |= FIELD_PREP(RK3588_DSP_IF_MIPI0_PCLK_DIV, if_pixclk_div);
  1855			die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX;
  1856			val = rk3588_get_mipi_port_mux(vp->id);
  1857			die |= RK3588_SYS_DSP_INFACE_EN_MIPI0 |
> 1858				   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI0_MUX, !!val);
  1859			break;
  1860		case ROCKCHIP_VOP2_EP_MIPI1:
  1861			div &= ~RK3588_DSP_IF_MIPI1_PCLK_DIV;
  1862			div |= FIELD_PREP(RK3588_DSP_IF_MIPI1_PCLK_DIV, if_pixclk_div);
  1863			die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
  1864			val = rk3588_get_mipi_port_mux(vp->id);
  1865			die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
  1866				   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, val);
  1867			break;
  1868		case ROCKCHIP_VOP2_EP_DP0:
  1869			die &= ~RK3588_SYS_DSP_INFACE_EN_DP0_MUX;
  1870			die |= RK3588_SYS_DSP_INFACE_EN_DP0 |
  1871				   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_DP0_MUX, vp->id);
  1872			dip &= ~RK3588_DSP_IF_POL__DP0_PIN_POL;
  1873			dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP0_PIN_POL, polflags);
  1874			break;
  1875		case ROCKCHIP_VOP2_EP_DP1:
  1876			die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
  1877			die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
  1878				   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
  1879			dip &= ~RK3588_DSP_IF_POL__DP1_PIN_POL;
  1880			dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP1_PIN_POL, polflags);
  1881			break;
  1882		default:
  1883			drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
  1884			return 0;
  1885		}
  1886	
  1887		dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
  1888	
  1889		vop2_vp_write(vp, RK3588_VP_CLK_CTRL, vp_clk_div);
  1890		vop2_writel(vop2, RK3568_DSP_IF_EN, die);
  1891		vop2_writel(vop2, RK3568_DSP_IF_CTRL, div);
  1892		vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
  1893	
  1894		return clock;
  1895	}
  1896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
