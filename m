Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D517B50F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539329; cv=none; b=fTNgdJI09kQT96uT6Z2hyQ5WVnJpXdWi2gGVac116gnO+9ON+X/KgSzdJa/e3EickSFvlD7BeyFJbqXRn1e2HtR9nDvLPxVRVMlBzUMqpLqcZE3tBsS8eMPvAq1Phc7ZAtLPYi68b9qQ9vof27CG+N7dK6ZJp33NWUJ8+p5wR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539329; c=relaxed/simple;
	bh=6aRFjONqgF1SrmAUE83waiU1aE/oJZxrngEzJql3dvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lT2L+/IJenuVB2rXfsl512vIeXlNccyGFPVe6nQhmoHbv+2buDDbhGpr+kN9lBt/pYs9FQaIjZQkzAElX4u9r77/snRUPaLuIKzC096D05m20maEqiTCkoW+NTGcB1Lg6lQ+g/QDj2HlHBGmgxEpoRQiT0cLyJgTH0XGjJuPQ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/p7aERm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/p7aERm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760539328; x=1792075328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6aRFjONqgF1SrmAUE83waiU1aE/oJZxrngEzJql3dvY=;
  b=T/p7aERm7kF7couFiGh40kpbtnbR9NO7YZrVVnKstImGR4yswKKM284b
   xHsNS8BtGrXCLmbzeOYSPBLHstjKzidMgGXvmJMqqryhdTMUhSzMo3TIg
   JHc+eKTG/eObLSFNnZ/G5+2lowSIjfIz935TNS4eAZ5/nNYquM+Z+i766
   A91AACBbki25JIX3/FrsMCFRwqDdopdcB/6v/T0Z5/reiKeXED0GHl84x
   kQa7nfb0tOoqDOcL2L/P0NacEH7HzXsZKu+0n+f18QQPDGpRTUUCpMViI
   gUinWZSehvkR4K0Cdli6RinCKjsIX6M3AKc1Lky24ZPShNBDuPYSAg+wO
   w==;
X-CSE-ConnectionGUID: A4J9AY/0Te+sDRFuuoAJkw==
X-CSE-MsgGUID: W+ERcuZwT6OQ0/jsus498g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="50283644"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="50283644"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 07:42:05 -0700
X-CSE-ConnectionGUID: 32bEMPYCRhOc5mYczZthQg==
X-CSE-MsgGUID: c2CgthouQqu5OKlRt6DfXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="187485769"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2025 07:42:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v92hW-0003v9-0U;
	Wed, 15 Oct 2025 14:42:02 +0000
Date: Wed, 15 Oct 2025 22:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 111/113]
 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:66:29: warning:
 initialization of 'int' from 'const struct mtk_gate_regs *' makes integer
 from pointer without a cast
Message-ID: <202510152210.peZ9fvLW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   1647e8b0f77cd242969efa444a594d834476c62f
commit: b48042f17536424110d41582a4cf625b5969d84b [111/113] Revert "clk: mediatek: clk-gate: Add ops for gates with HW voter"
config: powerpc-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152210.peZ9fvLW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510152210.peZ9fvLW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510152210.peZ9fvLW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:66:18: error: 'const struct mtk_gate' has no member named 'hwv_regs'
      66 |                 .hwv_regs = &impn_hwv_regs,             \
         |                  ^~~~~~~~
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:76:9: note: in expansion of macro 'GATE_HWV_IMPN'
      76 |         GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
         |         ^~~~~~~~~~~~~
>> drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:66:29: warning: initialization of 'int' from 'const struct mtk_gate_regs *' makes integer from pointer without a cast [-Wint-conversion]
      66 |                 .hwv_regs = &impn_hwv_regs,             \
         |                             ^
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:76:9: note: in expansion of macro 'GATE_HWV_IMPN'
      76 |         GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
         |         ^~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:66:29: note: (near initialization for 'impn_clks[3].shift')
      66 |                 .hwv_regs = &impn_hwv_regs,             \
         |                             ^
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:76:9: note: in expansion of macro 'GATE_HWV_IMPN'
      76 |         GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
         |         ^~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:76:64: warning: initialized field overwritten [-Woverride-init]
      76 |         GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
         |                                                                ^
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:67:26: note: in definition of macro 'GATE_HWV_IMPN'
      67 |                 .shift = _shift,                        \
         |                          ^~~~~~
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:76:64: note: (near initialization for 'impn_clks[3].shift')
      76 |         GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
         |                                                                ^
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:67:26: note: in definition of macro 'GATE_HWV_IMPN'
      67 |                 .shift = _shift,                        \
         |                          ^~~~~~
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:68:25: error: 'mtk_clk_gate_hwv_ops_setclr' undeclared here (not in a function); did you mean 'mtk_clk_gate_ops_setclr'?
      68 |                 .ops = &mtk_clk_gate_hwv_ops_setclr,    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c:76:9: note: in expansion of macro 'GATE_HWV_IMPN'
      76 |         GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
         |         ^~~~~~~~~~~~~


vim +66 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c

8f61d9d319915e Laura Nao 2025-09-15  60  
8f61d9d319915e Laura Nao 2025-09-15  61  #define GATE_HWV_IMPN(_id, _name, _parent, _shift) {	\
8f61d9d319915e Laura Nao 2025-09-15  62  		.id = _id,				\
8f61d9d319915e Laura Nao 2025-09-15  63  		.name = _name,				\
8f61d9d319915e Laura Nao 2025-09-15  64  		.parent_name = _parent,			\
8f61d9d319915e Laura Nao 2025-09-15  65  		.regs = &imp_cg_regs,			\
8f61d9d319915e Laura Nao 2025-09-15 @66  		.hwv_regs = &impn_hwv_regs,		\
8f61d9d319915e Laura Nao 2025-09-15  67  		.shift = _shift,			\
8f61d9d319915e Laura Nao 2025-09-15  68  		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
8f61d9d319915e Laura Nao 2025-09-15  69  		.flags = CLK_OPS_PARENT_ENABLE,		\
8f61d9d319915e Laura Nao 2025-09-15  70  	}
8f61d9d319915e Laura Nao 2025-09-15  71  

:::::: The code at line 66 was first introduced by commit
:::::: 8f61d9d319915eb84511773dfa57fb0c60ead0f7 clk: mediatek: Add MT8196 I2C clock support

:::::: TO: Laura Nao <laura.nao@collabora.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
