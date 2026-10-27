Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123441;
	b=fd9xmnCzaQsQSo7iA+t86ErQ5Lr8F0d0iF7u27MI3WM9rwfCFAAtK2jCyJrX4GTHx2R+
	 FYxDYMt3XonbGrRWU6Y7UES4QD4GXXhF92g6ZXHDX8bBIhbywJwxq6N19wCeD7JG8SyAm
	 zUOfZabp8GOlf7LdKhmwgZtUlF/zhNbrZPljsX3aLEotD4jZ/KxRlnzxLZ364JYF54ZJO
	 2vYZfP3T05iYEbow+dhivuEpLyZXnbHrJI3JJiJe1Rj7Z1yfUs8tXB7wAZbnaiQFqMmRD
	 2nnVJjWZG+U6aBI8EGw94V4RoZqUomWiu2mudT1tq09lW4fvgAj5+elIvCP/6IUWz9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123441;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iE80t4vY72z6T95VOd72pvf/x6MITL5I+FVejfoRQ3s=;
	b=u2UsvJFITYocFxzb1i6jVUKFpXHiGr4OIWTEooVhu+p5B7BW3iHsvwE8tw4YYY+V/mJ7
	 dnHcspcNsBXBOSohfh/BqTBdeVGz1Q7FK7FvRvwaBt8edqtTkv7cFsIEMl2sAcimhzqlo
	 vVJHt9uukDd+KhAp3Jx2ZGzkVGNwm2x0yXcwTUrK+K2HOFXPW8V8jwKB2asCxrNT0RQRh
	 8di7fJsOem8LphEwNw/3cJLNEzCCrYrYONbfDp714sjWuRIf9yz7nXM6B5BIqUEZcqiCo
	 yRivIqRJULD4enCRrgPA7FvH134z6f3FHTfzK7APFovIM4Mr3nL0VmN4tCB6kmY2k1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EVrjVI0K;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB25606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 17:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB25606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EVrjVI0K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793123440; x=1824659440;
  h=date:from:to:cc:subject:message-id;
  bh=qavb1q2tIfZH5VQGpuaPI1rjr4n2Lm00gszmwcJbarA=;
  b=EVrjVI0KFiAgCRsQJAOTmUkuyj5sh0ko8Bm4sA4i2K+qm/lcAOjGqkI2
   9m2DrtnQXUE8A2BpcNA1mMTtvWCVOXLrWX8dsZ7sXDlUrquPnXTan7/3W
   0kA6cS6KVDvnqO0eBXN8PIub5YxHS7btGNOwIWDhr/P3gsc/s4n7Xia0k
   tb/RKgze1iqoHfaodjZZd43gH5GE+wlB823Ih/bHCuEpqJ4N3h/2fr4Mk
   PtEfqMZ1oH/584CoQ/PxA3ZQgz5MOXKReNdJcejKtnG6qOsFJfK7FMT8X
   EPPNdH+tUwaLpkmTuUc2llDGWOm3x3Md4ZAkYrJI8B2ykb89jJpYcjNAW
   w==;
X-CSE-ConnectionGUID: txBevW0/T+6/uWq/yF015Q==
X-CSE-MsgGUID: MDjru3LvR/StDZfUGnMkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1713990"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1713990"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 10:50:36 -0700
X-CSE-ConnectionGUID: a/XrxoDaQZmXLrXEIC1RzA==
X-CSE-MsgGUID: eyWJFbJHRMyLkMwWjpweTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4686838"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Oct 2026 10:50:34 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLlJg-000000004a7-2Y8n;
	Tue, 27 Oct 2026 17:50:32 +0000
Date: Tue, 27 Oct 2026 18:49:51 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 drivers/clk/imx/clk-composite-7ulp.c:87:24: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202610271857.YWxyE3IO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b83ca11f560a414ae30f680b4c212094f6abdf19
commit: 335426e9740474f8a64ab1444d9201e53e8ea3d6 [2/2] clk: imx: composite-7ulp: Check the PCC present bit
config: arm-randconfig-r2308-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271857.YWxyE3IO-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271857.YWxyE3IO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271857.YWxyE3IO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/imx/clk-composite-7ulp.c:87:24: sparse: sparse: Using plain integer as NULL pointer

vim +87 drivers/clk/imx/clk-composite-7ulp.c

    70	
    71	static struct clk_hw *imx_ulp_clk_hw_composite(const char *name,
    72					     const char * const *parent_names,
    73					     int num_parents, bool mux_present,
    74					     bool rate_present, bool gate_present,
    75					     void __iomem *reg, bool has_swrst)
    76	{
    77		struct clk_hw *mux_hw = NULL, *fd_hw = NULL, *gate_hw = NULL;
    78		struct clk_fractional_divider *fd = NULL;
    79		struct clk_gate *gate = NULL;
    80		struct clk_mux *mux = NULL;
    81		struct clk_hw *hw;
    82		u32 val;
    83	
    84		val = readl(reg);
    85		if (!(val & PCG_PR_MASK)) {
    86			pr_info("PCC PR is 0 for clk:%s, bypass\n", name);
  > 87			return 0;
    88		}
    89	
    90		if (mux_present) {
    91			mux = kzalloc(sizeof(*mux), GFP_KERNEL);
    92			if (!mux)
    93				return ERR_PTR(-ENOMEM);
    94			mux_hw = &mux->hw;
    95			mux->reg = reg;
    96			mux->shift = PCG_PCS_SHIFT;
    97			mux->mask = PCG_PCS_MASK;
    98			if (has_swrst)
    99				mux->lock = &imx_ccm_lock;
   100		}
   101	
   102		if (rate_present) {
   103			fd = kzalloc(sizeof(*fd), GFP_KERNEL);
   104			if (!fd) {
   105				kfree(mux);
   106				return ERR_PTR(-ENOMEM);
   107			}
   108			fd_hw = &fd->hw;
   109			fd->reg = reg;
   110			fd->mshift = PCG_FRAC_SHIFT;
   111			fd->mwidth = PCG_FRAC_WIDTH;
   112			fd->mmask  = PCG_FRAC_MASK;
   113			fd->nshift = PCG_PCD_SHIFT;
   114			fd->nwidth = PCG_PCD_WIDTH;
   115			fd->nmask = PCG_PCD_MASK;
   116			fd->flags = CLK_FRAC_DIVIDER_ZERO_BASED;
   117			if (has_swrst)
   118				fd->lock = &imx_ccm_lock;
   119		}
   120	
   121		if (gate_present) {
   122			gate = kzalloc(sizeof(*gate), GFP_KERNEL);
   123			if (!gate) {
   124				kfree(mux);
   125				kfree(fd);
   126				return ERR_PTR(-ENOMEM);
   127			}
   128			gate_hw = &gate->hw;
   129			gate->reg = reg;
   130			gate->bit_idx = PCG_CGC_SHIFT;
   131			if (has_swrst)
   132				gate->lock = &imx_ccm_lock;
   133			/*
   134			 * make sure clock is gated during clock tree initialization,
   135			 * the HW ONLY allow clock parent/rate changed with clock gated,
   136			 * during clock tree initialization, clocks could be enabled
   137			 * by bootloader, so the HW status will mismatch with clock tree
   138			 * prepare count, then clock core driver will allow parent/rate
   139			 * change since the prepare count is zero, but HW actually
   140			 * prevent the parent/rate change due to the clock is enabled.
   141			 */
   142			val = readl_relaxed(reg);
   143			val &= ~(1 << PCG_CGC_SHIFT);
   144			writel_relaxed(val, reg);
   145		}
   146	
   147		hw = clk_hw_register_composite(NULL, name, parent_names, num_parents,
   148					       mux_hw, &clk_mux_ops, fd_hw,
   149					       &clk_fractional_divider_ops, gate_hw,
   150					       has_swrst ? &pcc_gate_ops : &clk_gate_ops, CLK_SET_RATE_GATE |
   151					       CLK_SET_PARENT_GATE | CLK_SET_RATE_NO_REPARENT);
   152		if (IS_ERR(hw)) {
   153			kfree(mux);
   154			kfree(fd);
   155			kfree(gate);
   156		}
   157	
   158		return hw;
   159	}
   160	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
