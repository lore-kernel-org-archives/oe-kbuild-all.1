Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58A2D9ECC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 12:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088939; cv=none; b=oef4VgfjfXQvaJf5yhaEOSV5bOYDcbrB38ZYYTZptekgvYX7BmiXBRBnDtpol9Mk5A7BQQKxNC8jrtfdHeUuzmJQ09GZazB2coHHAfSe+Bfqave3vUjY7ckTHrlC8J/nGahp5HHzW7jxPGGHYUatAsTobSo7DVf+WNgU/B69PrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088939; c=relaxed/simple;
	bh=aDS6XIyiMMqbUPLzU4ZmfvRIatlVjwx2JIn+bXnUaBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQPCZhxCrdI5RvOt5XElaZN18AZafGetBwrQWz2zSca4M+PsWcYJGKaIW0i02N7UF0Zi1dlDBsxi+NByWsfn1A+v7lwwj7buR3ds7LWrODZgYgZ/JADdnuKi8RQ5cJC4ImZMmr1N+obgHhk0ZyE8EFC69vgFMig0awaHnsssUww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbZUIjTJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbZUIjTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755088938; x=1786624938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDS6XIyiMMqbUPLzU4ZmfvRIatlVjwx2JIn+bXnUaBc=;
  b=CbZUIjTJpod5kQbiW5VwbcbNnOn918J9e47E1uSBnsnQWLPE1JLEYEzw
   6BdihqAHo1YlYm37eRixdNclZkhTaqv3LkoAmbjt6e6smTPCNq/b97six
   zXyCgoF/mqfZctJt9U9dwZlGfTPEzoVfJi6CCRZaHQOoAUhB31VODXFia
   wATi3hhPhgcCs2nu9uBAAh++71PBMh+yKL863B3wJnRYFix3nLAlcdAfJ
   QoV5LkvSeU8+o296p6+6ygUtMHVQVLADDwdROLQeelmjNKdmtAGSIvvh+
   FpohEnummJpEK/uUH6BSf7ik6ro7Aqzqecwp6438i7u6tZM4U0s3ldosa
   A==;
X-CSE-ConnectionGUID: b5uLL2xbS3myz/dtXZQsCg==
X-CSE-MsgGUID: yYicsYj8Q1+gUq+IRugj9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68834759"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="68834759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 05:42:18 -0700
X-CSE-ConnectionGUID: EyA3koW/QbmsjhnDh/YN+A==
X-CSE-MsgGUID: W7/ST1FDQxy5cx9b3jGReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171787855"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2025 05:42:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umAo2-0009tf-2J;
	Wed, 13 Aug 2025 12:42:14 +0000
Date: Wed, 13 Aug 2025 20:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 354/354]
 drivers/gpu/drm/mediatek/mtk_dvo.c:213: warning: Function parameter or
 member 'is_dp' not described in 'mtk_dvo_conf'
Message-ID: <202508132055.XdvMLG0B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   db867ccf596a910b85bab8c6052afe59fa921727
commit: d70b2eb9339327df9cb2f3025584ca8779a5a799 [354/354] CHROMIUM: drm/mediatek: add path dvo to dptx
config: arm-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132055.XdvMLG0B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132055.XdvMLG0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508132055.XdvMLG0B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dvo.c:213: warning: Function parameter or member 'out_np_sel' not described in 'mtk_dvo_conf'
   drivers/gpu/drm/mediatek/mtk_dvo.c:213: warning: Function parameter or member 'has_commit' not described in 'mtk_dvo_conf'
>> drivers/gpu/drm/mediatek/mtk_dvo.c:213: warning: Function parameter or member 'is_dp' not described in 'mtk_dvo_conf'
>> drivers/gpu/drm/mediatek/mtk_dvo.c:213: warning: Function parameter or member 'hfp_adjustment_for_bs' not described in 'mtk_dvo_conf'


vim +213 drivers/gpu/drm/mediatek/mtk_dvo.c

044955e3eece16 Jason-jh Lin 2025-01-17  168  
044955e3eece16 Jason-jh Lin 2025-01-17  169  /**
044955e3eece16 Jason-jh Lin 2025-01-17  170   * struct mtk_dvo_conf - Configuration of mediatek dvo.
044955e3eece16 Jason-jh Lin 2025-01-17  171   * @cal_factor: Callback function to calculate factor value.
044955e3eece16 Jason-jh Lin 2025-01-17  172   * @reg_h_fre_con: Register address of frequency control.
044955e3eece16 Jason-jh Lin 2025-01-17  173   * @max_clock_khz: Max clock frequency supported for this SoCs in khz units.
044955e3eece16 Jason-jh Lin 2025-01-17  174   * @edge_sel_en: Enable of edge selection.
044955e3eece16 Jason-jh Lin 2025-01-17  175   * @output_fmts: Array of supported output formats.
044955e3eece16 Jason-jh Lin 2025-01-17  176   * @num_output_fmts: Quantity of supported output formats.
044955e3eece16 Jason-jh Lin 2025-01-17  177   * @is_ck_de_pol: Support CK/DE polarity.
044955e3eece16 Jason-jh Lin 2025-01-17  178   * @swap_input_support: Support input swap function.
044955e3eece16 Jason-jh Lin 2025-01-17  179   * @support_direct_pin: IP supports direct connection to dvo panels.
044955e3eece16 Jason-jh Lin 2025-01-17  180   * @input_2pixel: Input pixel of dp_intf is 2 pixel per round, so enable this
044955e3eece16 Jason-jh Lin 2025-01-17  181   *		  config to enable this feature.
044955e3eece16 Jason-jh Lin 2025-01-17  182   * @dimension_mask: Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH
044955e3eece16 Jason-jh Lin 2025-01-17  183   *		    (no shift).
044955e3eece16 Jason-jh Lin 2025-01-17  184   * @hvsize_mask: Mask of HSIZE and VSIZE mask (no shift).
044955e3eece16 Jason-jh Lin 2025-01-17  185   * @channel_swap_shift: Shift value of channel swap.
044955e3eece16 Jason-jh Lin 2025-01-17  186   * @yuv422_en_bit: Enable bit of yuv422.
044955e3eece16 Jason-jh Lin 2025-01-17  187   * @csc_enable_bit: Enable bit of CSC.
044955e3eece16 Jason-jh Lin 2025-01-17  188   * @pixels_per_iter: Quantity of transferred pixels per iteration.
044955e3eece16 Jason-jh Lin 2025-01-17  189   * @edge_cfg_in_mmsys: If the edge configuration for DVO's output needs to be set in MMSYS.
044955e3eece16 Jason-jh Lin 2025-01-17  190   */
044955e3eece16 Jason-jh Lin 2025-01-17  191  struct mtk_dvo_conf {
044955e3eece16 Jason-jh Lin 2025-01-17  192  	unsigned int (*cal_factor)(int clock);
044955e3eece16 Jason-jh Lin 2025-01-17  193  	u32 reg_h_fre_con;
044955e3eece16 Jason-jh Lin 2025-01-17  194  	u32 max_clock_khz;
044955e3eece16 Jason-jh Lin 2025-01-17  195  	bool edge_sel_en;
044955e3eece16 Jason-jh Lin 2025-01-17  196  	const u32 *output_fmts;
044955e3eece16 Jason-jh Lin 2025-01-17  197  	u32 num_output_fmts;
044955e3eece16 Jason-jh Lin 2025-01-17  198  	bool is_ck_de_pol;
044955e3eece16 Jason-jh Lin 2025-01-17  199  	bool swap_input_support;
044955e3eece16 Jason-jh Lin 2025-01-17  200  	bool support_direct_pin;
044955e3eece16 Jason-jh Lin 2025-01-17  201  	bool input_2pixel;
044955e3eece16 Jason-jh Lin 2025-01-17  202  	u32 out_np_sel;
044955e3eece16 Jason-jh Lin 2025-01-17  203  	u32 dimension_mask;
044955e3eece16 Jason-jh Lin 2025-01-17  204  	u32 hvsize_mask;
044955e3eece16 Jason-jh Lin 2025-01-17  205  	u32 channel_swap_shift;
044955e3eece16 Jason-jh Lin 2025-01-17  206  	u32 yuv422_en_bit;
044955e3eece16 Jason-jh Lin 2025-01-17  207  	u32 csc_enable_bit;
044955e3eece16 Jason-jh Lin 2025-01-17  208  	u32 pixels_per_iter;
044955e3eece16 Jason-jh Lin 2025-01-17  209  	bool edge_cfg_in_mmsys;
044955e3eece16 Jason-jh Lin 2025-01-17  210  	bool has_commit;
d70b2eb9339327 Tucker Lee   2025-07-04  211  	bool is_dp;
d70b2eb9339327 Tucker Lee   2025-07-04  212  	bool hfp_adjustment_for_bs;
044955e3eece16 Jason-jh Lin 2025-01-17 @213  };
044955e3eece16 Jason-jh Lin 2025-01-17  214  

:::::: The code at line 213 was first introduced by commit
:::::: 044955e3eece16d9c50e1a693c197e4193399d72 CHROMIUM: drm/mediatek: add eDP driver for mt8196

:::::: TO: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
