Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D11E47B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742586318; cv=none; b=inB3l1PKUq6ZtsVsmUVnhOrKVFpWe/VBHIqhyqAFr1cFdOwK23keL1n6qCX+nVz4mZyV/vtOafbjCcp9fw3dC/ou82HL1iHPncyURJtp8op/LYuibEDOn9sda41IW+MhsnYQ3cuVV5tM/egviWhjbxpt09So6HxMspHGzqnMs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742586318; c=relaxed/simple;
	bh=ZjzcgWtcRVfPbYtEgLzi1XbD/ZWsTv4NDRcUdgsn2Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wrnjo3hKuJWMHPJTKBiN5IiYwTwZGr2FHlyC07ofyZhrG2Wty6CoXYjDT0ZNBU12FTFK7Y+CS6HSmVycLlPyVUQoZj5ozJAGEc6D/8h6Qp1BPPzgSVuvp3AL/HjkkGNaYZpP6X7jBcluCyDQx94z4mAq+4YrDzaEJ4M8r3n+v8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmEUnfR4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmEUnfR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742586316; x=1774122316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjzcgWtcRVfPbYtEgLzi1XbD/ZWsTv4NDRcUdgsn2Bk=;
  b=UmEUnfR46Z9mG34OrlqDCivgBsQ9OGl+dtCGRRMjYf+jbWj4Dkc4cPn+
   EmnmCsf4RSbd4EYWjubpYN1IRdVRPh+UyOXj7NBwNyOrGDlxUerrLbrHs
   bBfnPT902uPL0d8QXEskY8Ouw4poqD8GfNjLuoYkLHdPiy/PaWHFrA9Bb
   nWhtvNqyKatBTL7f0Eu1HtxueMCYwK9EUqPpyK+1Nv5LXBIwAsy/ykhuq
   aytFSp/rUaFg4Hpd3izav9QENOEIcIajUDf8MdGeNgO8L1zhu9i/BRORO
   3RMsu91XDfFksSTjYz3fIMYMZY0lx/kTRKSWHtIdhNBro6zAWJNZYGkvJ
   A==;
X-CSE-ConnectionGUID: 2taPNyx5TEq0vQuUBPfetA==
X-CSE-MsgGUID: 0sd25MtYS4WL/N75Eu18cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54079201"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="54079201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 12:45:16 -0700
X-CSE-ConnectionGUID: vLYR6P2ZTnauR/Y3unP/fA==
X-CSE-MsgGUID: kzgzstI5TZi0peEFq9p0uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="124266808"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2025 12:45:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tviIr-0001db-0P;
	Fri, 21 Mar 2025 19:45:13 +0000
Date: Sat, 22 Mar 2025 03:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 11/11]
 drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or
 member 'pol_positive_default' not described in 'mtk_dpi_conf'
Message-ID: <202503220347.ztgEZ5XR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   e55920c8505b7880384227f53e8193da2ef3d64c
commit: e55920c8505b7880384227f53e8193da2ef3d64c [11/11] CHROMIUM: drm/mediatek: fix wrong setting for polarity
config: x86_64-buildonly-randconfig-004-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220347.ztgEZ5XR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220347.ztgEZ5XR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220347.ztgEZ5XR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'dsc_support' not described in 'mtk_dpi_conf'
   drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'use_version_2' not described in 'mtk_dpi_conf'
>> drivers/gpu/drm/mediatek/mtk_dpi_v2.c:182: warning: Function parameter or member 'pol_positive_default' not described in 'mtk_dpi_conf'


vim +182 drivers/gpu/drm/mediatek/mtk_dpi_v2.c

8fd26707ff2ec98 mac.shen  2025-01-27  138  
8fd26707ff2ec98 mac.shen  2025-01-27  139  /**
8fd26707ff2ec98 mac.shen  2025-01-27  140   * struct mtk_dpi_conf - Configuration of mediatek dpi.
8fd26707ff2ec98 mac.shen  2025-01-27  141   * @cal_factor: Callback function to calculate factor value.
8fd26707ff2ec98 mac.shen  2025-01-27  142   * @reg_h_fre_con: Register address of frequency control.
8fd26707ff2ec98 mac.shen  2025-01-27  143   * @max_clock_khz: Max clock frequency supported for this SoCs in khz units.
8fd26707ff2ec98 mac.shen  2025-01-27  144   * @edge_sel_en: Enable of edge selection.
8fd26707ff2ec98 mac.shen  2025-01-27  145   * @output_fmts: Array of supported output formats.
8fd26707ff2ec98 mac.shen  2025-01-27  146   * @num_output_fmts: Quantity of supported output formats.
8fd26707ff2ec98 mac.shen  2025-01-27  147   * @is_ck_de_pol: Support CK/DE polarity.
8fd26707ff2ec98 mac.shen  2025-01-27  148   * @swap_input_support: Support input swap function.
8fd26707ff2ec98 mac.shen  2025-01-27  149   * @support_direct_pin: IP supports direct connection to dpi panels.
8fd26707ff2ec98 mac.shen  2025-01-27  150   * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable this
8fd26707ff2ec98 mac.shen  2025-01-27  151   *		  config to enable this feature.
8fd26707ff2ec98 mac.shen  2025-01-27  152   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
8fd26707ff2ec98 mac.shen  2025-01-27  153   *		    (no shift).
8fd26707ff2ec98 mac.shen  2025-01-27  154   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
8fd26707ff2ec98 mac.shen  2025-01-27  155   * @channel_swap_shift: Shift value of channel swap.
8fd26707ff2ec98 mac.shen  2025-01-27  156   * @yuv422_en_bit: Enable bit of yuv422.
8fd26707ff2ec98 mac.shen  2025-01-27  157   * @csc_enable_bit: Enable bit of CSC.
8fd26707ff2ec98 mac.shen  2025-01-27  158   * @pixels_per_iter: Quantity of transferred pixels per iteration.
8fd26707ff2ec98 mac.shen  2025-01-27  159   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
8fd26707ff2ec98 mac.shen  2025-01-27  160   */
8fd26707ff2ec98 mac.shen  2025-01-27  161  struct mtk_dpi_conf {
8fd26707ff2ec98 mac.shen  2025-01-27  162  	unsigned int (*cal_factor)(int clock);
8fd26707ff2ec98 mac.shen  2025-01-27  163  	u32 reg_h_fre_con;
8fd26707ff2ec98 mac.shen  2025-01-27  164  	u32 max_clock_khz;
8fd26707ff2ec98 mac.shen  2025-01-27  165  	bool edge_sel_en;
8fd26707ff2ec98 mac.shen  2025-01-27  166  	const u32 *output_fmts;
8fd26707ff2ec98 mac.shen  2025-01-27  167  	u32 num_output_fmts;
8fd26707ff2ec98 mac.shen  2025-01-27  168  	bool is_ck_de_pol;
8fd26707ff2ec98 mac.shen  2025-01-27  169  	bool swap_input_support;
8fd26707ff2ec98 mac.shen  2025-01-27  170  	bool support_direct_pin;
8fd26707ff2ec98 mac.shen  2025-01-27  171  	bool input_2pixel;
8fd26707ff2ec98 mac.shen  2025-01-27  172  	u32 dimension_mask;
8fd26707ff2ec98 mac.shen  2025-01-27  173  	u32 hvsize_mask;
8fd26707ff2ec98 mac.shen  2025-01-27  174  	u32 channel_swap_shift;
8fd26707ff2ec98 mac.shen  2025-01-27  175  	u32 yuv422_en_bit;
8fd26707ff2ec98 mac.shen  2025-01-27  176  	u32 csc_enable_bit;
8fd26707ff2ec98 mac.shen  2025-01-27  177  	u32 pixels_per_iter;
8fd26707ff2ec98 mac.shen  2025-01-27  178  	bool edge_cfg_in_mmsys;
85764b2d1983291 mac.shen  2025-01-27  179  	bool dsc_support;
8fd26707ff2ec98 mac.shen  2025-01-27  180  	bool use_version_2;
e55920c8505b788 macshen27 2025-03-11  181  	bool pol_positive_default;
8fd26707ff2ec98 mac.shen  2025-01-27 @182  };
8fd26707ff2ec98 mac.shen  2025-01-27  183  

:::::: The code at line 182 was first introduced by commit
:::::: 8fd26707ff2ec98f3a31cafc54c74a1399171b24 CHROMIUM: drm/mediatek: Add dp and dp_intf base

:::::: TO: mac.shen <mac.shen@mediatek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
