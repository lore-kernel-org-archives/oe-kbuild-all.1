Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E6249E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498078; cv=none; b=YZ26jqktHSCPWnxrH/uu1GAPsh89uIwvVyPwHWOJelHwKfW/piB/sBwJ3DHuWG1A29UGRcX1E5vSdX4xZKgCHDyTIHLcArrtgywheindtuOT3wwx3EVGcgDwabbZHAa8Z9QdeygDKSKIs+4VeZ+PEr0FrAEQWKKVr6I286ffEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498078; c=relaxed/simple;
	bh=sYKaVMfPlJDJOizKNUs5P0Lnylv/xB5WWz5PNsScXrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5cCckZE93FKtBwjli7m+jaYNyaOaSgBNJLkOEh7vUo7l/7HQwg4FVF381RYxwhHC+jKoAafjie/tdqClNquhwl8CAIjK4qze29s8Hf8wkVzTr5aZPj9ejdaw7ARnXXHZ1hPooBKz0mDcKnRzSfRK23EaMsACyBJazuEUXW2ECE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LLYmkVEm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LLYmkVEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748498077; x=1780034077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sYKaVMfPlJDJOizKNUs5P0Lnylv/xB5WWz5PNsScXrw=;
  b=LLYmkVEmLGGTiN5aroK71cgQiIxn+rX3vetumAboEjN1K4zBznrd63z0
   +BKfUE7hx+BJzLTNBmJOZX5QuGJQozgK+n5pOfSFHBhDcSeTHLrrrzOQ0
   S0qxFSzciJcrGj90oSCQOO/KLhP91QV/9IMnbiVRlAVOuc1J6Ldkg33L8
   JoTJ6E7KDLgHZbqW+Wx3CwGT7bbO0A0YXNabTMnIY9BB8zcmFn9noeTxJ
   7XcaD+sOildGL0i8nJjV7tdLHh2V8Y1Lw9mSstjPn28dw94mpQ/GBDPll
   3OK7WfEC8vZrrr3yuInu21PplrgsS/ijXLpsG43lLtpekzenEI6osVzja
   A==;
X-CSE-ConnectionGUID: a+78TOiqRhq6hJNCovruLA==
X-CSE-MsgGUID: ChAQR4QXTl2TTY4pX7dChg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53172752"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="53172752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 22:54:35 -0700
X-CSE-ConnectionGUID: ALqoB9PEQs+pWfc8sHyQLg==
X-CSE-MsgGUID: N4L3GQniRv+JZFXObhJAKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; 
   d="scan'208";a="148745649"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2025 22:54:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKWDn-000WMq-28;
	Thu, 29 May 2025 05:54:31 +0000
Date: Thu, 29 May 2025 13:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 139/139]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:3040:6: warning: no previous prototype
 for function 'mtk_dp_phy_flip_enable_v2'
Message-ID: <202505291338.exCzfxPw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   440b9574f183038ca61c05c969b3aa9ae081e115
commit: 440b9574f183038ca61c05c969b3aa9ae081e115 [139/139] CHROMIUM: drm/mediatek: add common for reusable
config: arm-randconfig-004-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291338.exCzfxPw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291338.exCzfxPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291338.exCzfxPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2532:6: warning: no previous prototype for function 'mtk_dp_dsc_support_v2' [-Wmissing-prototypes]
    2532 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2532:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2532 | void mtk_dp_dsc_support_v2(struct mtk_dp *mtk_dp)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2540:6: warning: no previous prototype for function 'mtk_dp_dsc_enable_v2' [-Wmissing-prototypes]
    2540 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2540:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2540 | void mtk_dp_dsc_enable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2570:6: warning: no previous prototype for function 'mtk_dp_dsc_disable_v2' [-Wmissing-prototypes]
    2570 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2570:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2570 | void mtk_dp_dsc_disable_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2600:6: warning: no previous prototype for function 'mtk_dp_set_chunk_size_v2' [-Wmissing-prototypes]
    2600 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2600:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2600 | void mtk_dp_set_chunk_size_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2619:6: warning: no previous prototype for function 'mtk_dp_dsc_set_param_v2' [-Wmissing-prototypes]
    2619 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2619:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2619 | void mtk_dp_dsc_set_param_v2(struct mtk_dp *mtk_dp,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2645:6: warning: no previous prototype for function 'mtk_dp_dsc_set_pps_v2' [-Wmissing-prototypes]
    2645 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2645:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2645 | void mtk_dp_dsc_set_pps_v2(struct mtk_dp *mtk_dp,
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2665:6: warning: no previous prototype for function 'mtk_dp_dsc_pps_send_v2' [-Wmissing-prototypes]
    2665 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2665:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2665 | void mtk_dp_dsc_pps_send_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2671:6: warning: no previous prototype for function 'mtk_dp_dsc_parse_pps_param_v2' [-Wmissing-prototypes]
    2671 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:2671:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2671 | void mtk_dp_dsc_parse_pps_param_v2(struct mtk_dp *mtk_dp, const enum dp_encoder_id encoder_id, u8 *pps)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:3040:6: warning: no previous prototype for function 'mtk_dp_phy_flip_enable_v2' [-Wmissing-prototypes]
    3040 | void mtk_dp_phy_flip_enable_v2(struct mtk_dp *mtk_dp)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3040:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3040 | void mtk_dp_phy_flip_enable_v2(struct mtk_dp *mtk_dp)
         | ^
         | static 
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:3058:6: warning: no previous prototype for function 'mtk_dp_phy_flip_disable_v2' [-Wmissing-prototypes]
    3058 | void mtk_dp_phy_flip_disable_v2(struct mtk_dp *mtk_dp)
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3058:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3058 | void mtk_dp_phy_flip_disable_v2(struct mtk_dp *mtk_dp)
         | ^
         | static 
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3619:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
    3619 |         u8 data;
         |            ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4287:6: warning: no previous prototype for function 'mtk_dp_hdcp_atomic_check' [-Wmissing-prototypes]
    4287 | void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
         |      ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4287 | void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, enum dp_encoder_id id,
         | ^
         | static 
   12 warnings generated.


vim +/mtk_dp_phy_flip_enable_v2 +3040 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  3039	
> 3040	void mtk_dp_phy_flip_enable_v2(struct mtk_dp *mtk_dp)
  3041	{
  3042		u32 tmp;
  3043	
  3044		if (mtk_dp->data->need_phy_flip_set) {
  3045			PHY_WRITE_BYTE(mtk_dp, 0x01a0, 0x47);
  3046			PHY_WRITE_BYTE(mtk_dp, 0x02a0, 0x47);
  3047			PHY_WRITE_BYTE(mtk_dp, 0x03a0, 0x46);
  3048			PHY_WRITE_BYTE(mtk_dp, 0x04a0, 0x46);
  3049		}
  3050	
  3051		tmp = readl(mtk_dp->phy_mux_regs);
  3052		tmp |= mtk_dp->data->phy_flip_ctrl_bit;
  3053		writel(tmp, mtk_dp->phy_mux_regs);
  3054	
  3055		drm_dbg_kms(mtk_dp->drm_dev, "[DPTX] Swap enable\n");
  3056	}
  3057	
> 3058	void mtk_dp_phy_flip_disable_v2(struct mtk_dp *mtk_dp)
  3059	{
  3060		u32 tmp;
  3061	
  3062		if (mtk_dp->data->need_phy_flip_set) {
  3063			PHY_WRITE_BYTE(mtk_dp, 0x01a0, 0x46);
  3064			PHY_WRITE_BYTE(mtk_dp, 0x02a0, 0x46);
  3065			PHY_WRITE_BYTE(mtk_dp, 0x03a0, 0x47);
  3066			PHY_WRITE_BYTE(mtk_dp, 0x04a0, 0x47);
  3067		}
  3068	
  3069		tmp = readl(mtk_dp->phy_mux_regs);
  3070		tmp &= ~mtk_dp->data->phy_flip_ctrl_bit;
  3071		writel(tmp, mtk_dp->phy_mux_regs);
  3072	
  3073		drm_dbg_kms(mtk_dp->drm_dev, "[DPTX] Swap disable\n");
  3074	}
  3075	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
