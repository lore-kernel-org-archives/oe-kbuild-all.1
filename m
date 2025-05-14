Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F6199949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747196564; cv=none; b=PFUY2nWWZqDXYsLOyIipC80rsuR0VSasQlKPiGQ7QaYlgHTDbuqoPcdmMdzzWYaIusoTXn8X7P92sm6BNDAyNmncY0VtCKlscf5xocMzyd1DSYq1dIQtb1CJD7+E6aziN7PH1VufyHfRUIhxOx1I8xh/G6NzQ0vOZp61lWjt8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747196564; c=relaxed/simple;
	bh=tsx+CPXk7KF1jRRPvTIBQ3r+6ckhVSASL3H3eotLYsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sA7UUohLtlELIRpGG3epcrxppCBvcxEMbhzTbCG3xE2t5B0jlfTV/b6KcgvQZ8pyUNL5U1AJdZqwLSVjAv7+0M08co6DUDzoFTuQsBoGr7+y3AUxmTOTFAq0I7qR+yruzNifHOfiJfwRfEAnNBC9zY8VLOr55xWnkqaJGfH6xJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irJBsBWi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irJBsBWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747196563; x=1778732563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsx+CPXk7KF1jRRPvTIBQ3r+6ckhVSASL3H3eotLYsQ=;
  b=irJBsBWiIOgAe4EcDPrzxAhFKD0Z3CpRjBfW4LR9GOhnxtDO1u3BDyEE
   2YjMTRCLd2oz2E6kPF+iR3Gms46Kjtislvf3k/X6fcHlIVZHai0Ljnbr6
   9y9z4ykIyW/9CLSS7DutgnDy9dfnH2J0pHHgKttBaJpUlBDQwCHilhvpy
   knUtadZ6z/+wBh8QFenDeaCGh1r4V1+PhxZ+np94XwAOxZcPvYsqchUN2
   bcqcS0KEZiTgUHqPfK1iUuy7+UQVZH1TWqDLCcqnygrtyMCZ5d5n6dvl8
   T10MZYwqNhQIgz17dXE9De079OsE/15XN0pdUX/NTygrnk1f14SpAt7xc
   w==;
X-CSE-ConnectionGUID: OtCqpl+4ToeOsmSv/r+Syg==
X-CSE-MsgGUID: MTL+a1O2SsKn5azyQ/buGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60410991"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="60410991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 21:22:42 -0700
X-CSE-ConnectionGUID: nzJni+78RguW47J1bPoPAQ==
X-CSE-MsgGUID: /vjpFF6tRaKZPn6v7SvGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="169016677"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 May 2025 21:22:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF3de-000GfV-2z;
	Wed, 14 May 2025 04:22:38 +0000
Date: Wed, 14 May 2025 12:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 77/77]
 drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or
 member 'hfp_adjustment_for_bs' not described in 'mtk_dpi_conf'
Message-ID: <202505141254.wOnB5ACv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   2aacb303738beffe5a274491ed38aaa5648f1dfe
commit: 2aacb303738beffe5a274491ed38aaa5648f1dfe [77/77] CHROMIUM: drm/mediatek: Correct Hsync and polarity settings to fix timing unstable issue
config: arm64-randconfig-001-20250514 (https://download.01.org/0day-ci/archive/20250514/202505141254.wOnB5ACv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141254.wOnB5ACv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141254.wOnB5ACv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'dsc_support' not described in 'mtk_dpi_conf'
   drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'use_version_2' not described in 'mtk_dpi_conf'
   drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'pol_positive_default' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'hfp_adjustment_for_bs' not described in 'mtk_dpi_conf'


vim +182 drivers/gpu/drm/mediatek/mtk_dpi_v2.c

8fd26707ff2ec9 mac.shen    2025-01-27  137  
8fd26707ff2ec9 mac.shen    2025-01-27  138  /**
8fd26707ff2ec9 mac.shen    2025-01-27  139   * struct mtk_dpi_conf - Configuration of mediatek dpi.
8fd26707ff2ec9 mac.shen    2025-01-27  140   * @cal_factor: Callback function to calculate factor value.
8fd26707ff2ec9 mac.shen    2025-01-27  141   * @reg_h_fre_con: Register address of frequency control.
8fd26707ff2ec9 mac.shen    2025-01-27  142   * @max_clock_khz: Max clock frequency supported for this SoCs in khz units.
8fd26707ff2ec9 mac.shen    2025-01-27  143   * @edge_sel_en: Enable of edge selection.
8fd26707ff2ec9 mac.shen    2025-01-27  144   * @output_fmts: Array of supported output formats.
8fd26707ff2ec9 mac.shen    2025-01-27  145   * @num_output_fmts: Quantity of supported output formats.
8fd26707ff2ec9 mac.shen    2025-01-27  146   * @is_ck_de_pol: Support CK/DE polarity.
8fd26707ff2ec9 mac.shen    2025-01-27  147   * @swap_input_support: Support input swap function.
8fd26707ff2ec9 mac.shen    2025-01-27  148   * @support_direct_pin: IP supports direct connection to dpi panels.
8fd26707ff2ec9 mac.shen    2025-01-27  149   * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable this
8fd26707ff2ec9 mac.shen    2025-01-27  150   *		  config to enable this feature.
8fd26707ff2ec9 mac.shen    2025-01-27  151   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
8fd26707ff2ec9 mac.shen    2025-01-27  152   *		    (no shift).
8fd26707ff2ec9 mac.shen    2025-01-27  153   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
8fd26707ff2ec9 mac.shen    2025-01-27  154   * @channel_swap_shift: Shift value of channel swap.
8fd26707ff2ec9 mac.shen    2025-01-27  155   * @yuv422_en_bit: Enable bit of yuv422.
8fd26707ff2ec9 mac.shen    2025-01-27  156   * @csc_enable_bit: Enable bit of CSC.
8fd26707ff2ec9 mac.shen    2025-01-27  157   * @pixels_per_iter: Quantity of transferred pixels per iteration.
8fd26707ff2ec9 mac.shen    2025-01-27  158   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
8fd26707ff2ec9 mac.shen    2025-01-27  159   */
8fd26707ff2ec9 mac.shen    2025-01-27  160  struct mtk_dpi_conf {
8fd26707ff2ec9 mac.shen    2025-01-27  161  	unsigned int (*cal_factor)(int clock);
8fd26707ff2ec9 mac.shen    2025-01-27  162  	u32 reg_h_fre_con;
8fd26707ff2ec9 mac.shen    2025-01-27  163  	u32 max_clock_khz;
8fd26707ff2ec9 mac.shen    2025-01-27  164  	bool edge_sel_en;
8fd26707ff2ec9 mac.shen    2025-01-27  165  	const u32 *output_fmts;
8fd26707ff2ec9 mac.shen    2025-01-27  166  	u32 num_output_fmts;
8fd26707ff2ec9 mac.shen    2025-01-27  167  	bool is_ck_de_pol;
8fd26707ff2ec9 mac.shen    2025-01-27  168  	bool swap_input_support;
8fd26707ff2ec9 mac.shen    2025-01-27  169  	bool support_direct_pin;
8fd26707ff2ec9 mac.shen    2025-01-27  170  	bool input_2pixel;
8fd26707ff2ec9 mac.shen    2025-01-27  171  	u32 dimension_mask;
8fd26707ff2ec9 mac.shen    2025-01-27  172  	u32 hvsize_mask;
8fd26707ff2ec9 mac.shen    2025-01-27  173  	u32 channel_swap_shift;
8fd26707ff2ec9 mac.shen    2025-01-27  174  	u32 yuv422_en_bit;
8fd26707ff2ec9 mac.shen    2025-01-27  175  	u32 csc_enable_bit;
8fd26707ff2ec9 mac.shen    2025-01-27  176  	u32 pixels_per_iter;
8fd26707ff2ec9 mac.shen    2025-01-27  177  	bool edge_cfg_in_mmsys;
85764b2d198329 mac.shen    2025-01-27  178  	bool dsc_support;
8fd26707ff2ec9 mac.shen    2025-01-27  179  	bool use_version_2;
e55920c8505b78 macshen27   2025-03-11  180  	bool pol_positive_default;
2aacb303738bef Ives Chenjh 2025-04-09  181  	bool hfp_adjustment_for_bs;
8fd26707ff2ec9 mac.shen    2025-01-27 @182  };
8fd26707ff2ec9 mac.shen    2025-01-27  183  

:::::: The code at line 182 was first introduced by commit
:::::: 8fd26707ff2ec98f3a31cafc54c74a1399171b24 CHROMIUM: drm/mediatek: Add dp and dp_intf base

:::::: TO: mac.shen <mac.shen@mediatek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
