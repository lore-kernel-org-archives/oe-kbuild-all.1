Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE014331A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753605; cv=none; b=d7PLywS1WNIof+z3Bw0AiCkQocmOrbr0/ul5uTUgpR4v8S5DyuXxt938nCWLpDCVu+D1mXTznqLTrorsTOZAOQyZNBl/BWvH1HzsCE8AILJ+J1HFScjc1h+tDD/pBIrzQA871OZDhFsiKq2hyYSyVKsBydfdMhMG4HC2pA1mukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753605; c=relaxed/simple;
	bh=m55AU/Ws+KMw8bQ9UvwzPVJMVypcLgUCiww7I4E5I3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IXYRuuthc3yesopRoleKCE7pJktTJFGIeTZf3tQEZQNICwpSki6z9Q+BiIKuHTu7ouTPx/dJWd5BOunKnfS2fpyJgPuXfXyynSRRNG4JB8Gg1JhLeimmkysaqcjIZzkV2/RAaVOhMrNs54F6C8ZxZFP5it4VJIgRvzKAZtGYcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+l33+uK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+l33+uK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753604; x=1805289604;
  h=date:from:to:cc:subject:message-id;
  bh=m55AU/Ws+KMw8bQ9UvwzPVJMVypcLgUCiww7I4E5I3M=;
  b=C+l33+uK5eZyWXCgjhJCfuPB0hK3okP15wXU88v61gLGhYvHx3MZTtxo
   qJxVZnwun/lYGGeXZWksQEUUi1wxsSdMwnyQpEmC3EACkx/IlY4RWGmCi
   GOL1JWHtpcm2LqqhC+8k0ENbEVaZH2vL7FKfKRGMGYodjC5h1jJ+BNh/D
   J5sFvS2rPm28UPxW4O/3DyyNxOEtfpW5Hsz/WLYzLl+QsTESl6Djt6+vg
   NcMC1A3Ozaq+8UMR453xVzSHzfHCY8+c7A4Yaid6bbeDsmHv4FtBZYq/p
   oA7UqN0aux7WnWgcrBwAQZqqWrt4Zpgm7uIenzgicZHhhdt1Ha0IDjDhe
   g==;
X-CSE-ConnectionGUID: BKZxvSD1RSS55HfDHUP6Sw==
X-CSE-MsgGUID: wkxDn27FTBCn0y7IWN5puw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85411394"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85411394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:20:03 -0700
X-CSE-ConnectionGUID: koyPVixnQ7WBdJ+Xf9QyBw==
X-CSE-MsgGUID: um1z6FaTTJi86muRVt6THw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221495550"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 06:20:02 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2UL0-000000000SF-374y;
	Tue, 17 Mar 2026 13:19:58 +0000
Date: Tue, 17 Mar 2026 21:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 50/50]
 drivers/gpu/drm/mediatek/mtk_crtc.c:1643:5: warning: no previous prototype
 for 'mtk_crtc_atomic_check'
Message-ID: <202603172157.uNuwNu7r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6030dcaf55c159496b17c680fc1e744454dd74be
commit: cb0626f69e9a9e0cb81a94ff264cbdc2895a6906 [50/50] CHROMIUM: drm/mediatek: Fix kms_color fail for invalid gamma lut size
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260317/202603172157.uNuwNu7r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603172157.uNuwNu7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603172157.uNuwNu7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c: In function 'mtk_crtc_update_srt_state':
   drivers/gpu/drm/mediatek/mtk_crtc.c:598:32: warning: variable 'state' set but not used [-Wunused-but-set-variable]
     598 |         struct mtk_crtc_state *state;
         |                                ^~~~~
   drivers/gpu/drm/mediatek/mtk_crtc.c: At top level:
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1643:5: warning: no previous prototype for 'mtk_crtc_atomic_check' [-Wmissing-prototypes]
    1643 | int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/mtk_crtc_atomic_check +1643 drivers/gpu/drm/mediatek/mtk_crtc.c

  1642	
> 1643	int mtk_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
  1644	{
  1645		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
  1646		struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
  1647		struct drm_property_blob *gamma_lut = crtc_state->gamma_lut;
  1648		int i;
  1649	
  1650		if (gamma_lut) {
  1651			for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
  1652				int lut_size = mtk_ddp_gamma_get_lut_size(mtk_crtc->ddp_comp[i]);
  1653	
  1654				if (lut_size &&
  1655				    gamma_lut->length != (lut_size * sizeof(struct drm_color_lut)))
  1656					return -EINVAL;
  1657			}
  1658		}
  1659	
  1660		return 0;
  1661	}
  1662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
