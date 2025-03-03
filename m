Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B971E214A8F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741022482; cv=none; b=gUGuoukaE1XO0CWlSA9aXCTzaLQGi6UulGvat4DjSeTRQjoCqEtW4fpMQi4SdcBiNscMSBwXyRv++K4lAFiWPzKBY9zbyCMjtiP/1cP354Op5o/GTyRknUJQfQvlW5pNxYtsWSfDerX1IwWAmSibggj/49NyHg64EgXSVxKdOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741022482; c=relaxed/simple;
	bh=hCN1V8PnhwADpCIqSSOLH+Z85WPdS7Z8K9/RACOd1Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJOEr0c3s7mMudzF/ci3MTxMzhvFIwoWiq92+5+HTIRFzyk37+TzyLH4kAIP0o8yS8OmMB/6VPC6Hzkq+Lh7+kTdwF295xHhX0skjVc87U31sRvYxazwHH2RTaFlNUilLeBkXK8awntwJTS75lX3EDXd100b2N9srgOvsBWsst8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoOsZ7ia; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoOsZ7ia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741022481; x=1772558481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCN1V8PnhwADpCIqSSOLH+Z85WPdS7Z8K9/RACOd1Cg=;
  b=CoOsZ7iauyGffPXmdIbe1P0c2xviRyy+Iw2K4LxLDr0kwS+Jm2lzdsS7
   wADPgZhO0M4beUGkag9hkMpylVI8fL3y8KhCZ9D2++/fcOaXAIGgT/woh
   OcfPLPvPJA/l+5Op5zktICLU5osEnvA2R3vT2YtM3Htratv1TZzbi4YQ7
   QeVw3ZWAeUTAD+2YKPkdNtrxeFsYr7/0pBIIvSzG8ikY38MP8VF+46DPO
   fVQASt0BfedcmVUqgC0ByiULPMbAMn7cyBAlz1hMsALBj2lLdFa8Qfm+I
   wnsZ5AtKqjCVssa9OGog3G6PZDu9nFa32n7kiQT69/KhtS5mjxOoQlQT6
   A==;
X-CSE-ConnectionGUID: vlsZbYFcT3O+aPEaETBmtQ==
X-CSE-MsgGUID: Yy3/uaBvQ92mR7oQwDfPaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45559123"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="45559123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 09:21:04 -0800
X-CSE-ConnectionGUID: d5dFDnPuSoO37LFWg4nt+A==
X-CSE-MsgGUID: 3YgAVk7sRNWsXHRpxlGNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="118586373"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2025 09:21:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp9TH-000IlB-2p;
	Mon, 03 Mar 2025 17:20:54 +0000
Date: Tue, 4 Mar 2025 01:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 7437/7719]
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:28: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202503040135.fgoyWdLB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f [7437/7719] drm/rockchip: vop2: Add platform specific callback
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250304/202503040135.fgoyWdLB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040135.fgoyWdLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040135.fgoyWdLB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c: In function 'rk3568_set_intf_mux':
>> drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:28: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     833 |                            FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
         |                            ^~~~~~~~~~


vim +/FIELD_PREP +833 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c

   819	
   820	static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
   821	{
   822		struct vop2 *vop2 = vp->vop2;
   823		struct drm_crtc *crtc = &vp->crtc;
   824		u32 die, dip;
   825	
   826		die = vop2_readl(vop2, RK3568_DSP_IF_EN);
   827		dip = vop2_readl(vop2, RK3568_DSP_IF_POL);
   828	
   829		switch (id) {
   830		case ROCKCHIP_VOP2_EP_RGB0:
   831			die &= ~RK3568_SYS_DSP_INFACE_EN_RGB_MUX;
   832			die |= RK3568_SYS_DSP_INFACE_EN_RGB |
 > 833				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
   834			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
   835			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
   836			if (polflags & POLFLAG_DCLK_INV)
   837				regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
   838			else
   839				regmap_write(vop2->sys_grf, RK3568_GRF_VO_CON1, BIT(3 + 16));
   840			break;
   841		case ROCKCHIP_VOP2_EP_HDMI0:
   842			die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
   843			die |= RK3568_SYS_DSP_INFACE_EN_HDMI |
   844				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_HDMI_MUX, vp->id);
   845			dip &= ~RK3568_DSP_IF_POL__HDMI_PIN_POL;
   846			dip |= FIELD_PREP(RK3568_DSP_IF_POL__HDMI_PIN_POL, polflags);
   847			break;
   848		case ROCKCHIP_VOP2_EP_EDP0:
   849			die &= ~RK3568_SYS_DSP_INFACE_EN_EDP_MUX;
   850			die |= RK3568_SYS_DSP_INFACE_EN_EDP |
   851				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_EDP_MUX, vp->id);
   852			dip &= ~RK3568_DSP_IF_POL__EDP_PIN_POL;
   853			dip |= FIELD_PREP(RK3568_DSP_IF_POL__EDP_PIN_POL, polflags);
   854			break;
   855		case ROCKCHIP_VOP2_EP_MIPI0:
   856			die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX;
   857			die |= RK3568_SYS_DSP_INFACE_EN_MIPI0 |
   858				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX, vp->id);
   859			dip &= ~RK3568_DSP_IF_POL__MIPI_PIN_POL;
   860			dip |= FIELD_PREP(RK3568_DSP_IF_POL__MIPI_PIN_POL, polflags);
   861			break;
   862		case ROCKCHIP_VOP2_EP_MIPI1:
   863			die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI1_MUX;
   864			die |= RK3568_SYS_DSP_INFACE_EN_MIPI1 |
   865				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
   866			dip &= ~RK3568_DSP_IF_POL__MIPI_PIN_POL;
   867			dip |= FIELD_PREP(RK3568_DSP_IF_POL__MIPI_PIN_POL, polflags);
   868			break;
   869		case ROCKCHIP_VOP2_EP_LVDS0:
   870			die &= ~RK3568_SYS_DSP_INFACE_EN_LVDS0_MUX;
   871			die |= RK3568_SYS_DSP_INFACE_EN_LVDS0 |
   872				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_LVDS0_MUX, vp->id);
   873			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
   874			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
   875			break;
   876		case ROCKCHIP_VOP2_EP_LVDS1:
   877			die &= ~RK3568_SYS_DSP_INFACE_EN_LVDS1_MUX;
   878			die |= RK3568_SYS_DSP_INFACE_EN_LVDS1 |
   879				   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_LVDS1_MUX, vp->id);
   880			dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
   881			dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
   882			break;
   883		default:
   884			drm_err(vop2->drm, "Invalid interface id %d on vp%d\n", id, vp->id);
   885			return 0;
   886		}
   887	
   888		dip |= RK3568_DSP_IF_POL__CFG_DONE_IMD;
   889	
   890		vop2_writel(vop2, RK3568_DSP_IF_EN, die);
   891		vop2_writel(vop2, RK3568_DSP_IF_POL, dip);
   892	
   893		return crtc->state->adjusted_mode.crtc_clock  * 1000LL;
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
