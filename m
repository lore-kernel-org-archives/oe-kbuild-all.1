Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9444D6BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322376; cv=none; b=FdvDNejTmXZ5T6vYdhMskxXMcPUnurwqzF7iEfIIK/X9NB/uAYhY8ikhiu/Wyy++zRZ8nnkOoeN8v1GWYQ5GBFEvuln13YoBCJoDltCAkrhQNG3YCnM3Xtt/sR4Efn+mVzYhO9+vgxVPo8TDxWT9kxnUhQTQdQSxQlMTDHwoFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322376; c=relaxed/simple;
	bh=5nWEHDAcMi8DHwq0ZhsLnSHD73oaM2jNGFgzvfFwSyM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y9pt4yATouY6YVu/RX53lndo7nk0Cx4+ymaF92vb7/d2cQi855WYWZ+AH651jVTBARZ9NG4thIcjoTqOJd3GejstnFZoQ2iNps4+YVzoR3xpBJASZCLC0Q14crsArVMt/JoHGj+GCER4klOGJ+vXWMZb7qaEsegybZjr+J/bT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LETWvwvM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LETWvwvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785322370; x=1816858370;
  h=date:from:to:cc:subject:message-id;
  bh=5nWEHDAcMi8DHwq0ZhsLnSHD73oaM2jNGFgzvfFwSyM=;
  b=LETWvwvMGEgdo0iiNYPmLvZcwdUggTIHluyA299CQI0AdK7HALxc4P/O
   a8HWWx1cQo21mdTyeaqObX+Bn0Tyqz/Sn1Zj42+Kg6nMvzc8L1kbtUmSz
   ts4oF/Vr8d+XsDtNKKzS8JtFjxt8VX5O/8vx4x5ry08nhSnT9zIupxiI/
   WaRApXZUuzgFZDyguYjG78L7RmzQQLAXHpUc87l5kCWEZR2lyphtiXOSW
   SKhDXYsLAXE2/LuM2ss8FGQIPUAvzlxTxKLoYTC/NXzaF8YLtHU2mYW4H
   ISXHZlL6KK1++J3bib0A95fOe0F2FHPhB54JIg89O44jtMb9YxbN8mEfb
   g==;
X-CSE-ConnectionGUID: RskYXIuWS3iTm151XC9hPg==
X-CSE-MsgGUID: N3gp292QRTyQL8IDy4/ucg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103330546"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="103330546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 03:52:36 -0700
X-CSE-ConnectionGUID: ropU2JhaT7CJHllqEhgODg==
X-CSE-MsgGUID: Um4kzYuZQ2GFCqthLr3dSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="284531790"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2026 03:52:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp1to-00000000fHn-09sU;
	Wed, 29 Jul 2026 10:52:32 +0000
Date: Wed, 29 Jul 2026 18:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 6/700]
 drivers/clk/mstar/clk-msc313-mux.c:27:9: error: implicit declaration of
 function 'regmap_field_read'; did you mean 'regmap_field_write'?
Message-ID: <202607291817.T3BHMhL0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: b4e750e9c28b84519ef454234db2feb4664b72af [6/700] clk: mstar: msc313 clock mux base
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260729/202607291817.T3BHMhL0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291817.T3BHMhL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291817.T3BHMhL0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/clk/mstar/clk-msc313-mux.c: In function 'msc313_mux_mux_get_parent':
>> drivers/clk/mstar/clk-msc313-mux.c:27:9: error: implicit declaration of function 'regmap_field_read'; did you mean 'regmap_field_write'? [-Werror=implicit-function-declaration]
      27 |         regmap_field_read(mux->mux, &index);
         |         ^~~~~~~~~~~~~~~~~
         |         regmap_field_write
   drivers/clk/mstar/clk-msc313-mux.c: In function 'msc313_mux_register_muxes':
>> drivers/clk/mstar/clk-msc313-mux.c:163:30: error: variable 'gate_field' has initializer but incomplete type
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                              ^~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:163:53: error: implicit declaration of function 'REG_FIELD' [-Werror=implicit-function-declaration]
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                                                     ^~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:163:40: error: storage size of 'gate_field' isn't known
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                                        ^~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:165:30: error: variable 'mux_field' has initializer but incomplete type
     165 |                 const struct reg_field mux_field = REG_FIELD(mux_data->offset,
         |                              ^~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:165:40: error: storage size of 'mux_field' isn't known
     165 |                 const struct reg_field mux_field = REG_FIELD(mux_data->offset,
         |                                        ^~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:167:30: error: variable 'deglitch_field' has initializer but incomplete type
     167 |                 const struct reg_field deglitch_field = REG_FIELD(mux_data->offset,
         |                              ^~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:167:40: error: storage size of 'deglitch_field' isn't known
     167 |                 const struct reg_field deglitch_field = REG_FIELD(mux_data->offset,
         |                                        ^~~~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:174:37: error: implicit declaration of function 'devm_regmap_field_alloc' [-Werror=implicit-function-declaration]
     174 |                         mux->gate = devm_regmap_field_alloc(dev, regmap, gate_field);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:167:40: warning: unused variable 'deglitch_field' [-Wunused-variable]
     167 |                 const struct reg_field deglitch_field = REG_FIELD(mux_data->offset,
         |                                        ^~~~~~~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:165:40: warning: unused variable 'mux_field' [-Wunused-variable]
     165 |                 const struct reg_field mux_field = REG_FIELD(mux_data->offset,
         |                                        ^~~~~~~~~
>> drivers/clk/mstar/clk-msc313-mux.c:163:40: warning: unused variable 'gate_field' [-Wunused-variable]
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +27 drivers/clk/mstar/clk-msc313-mux.c

    21	
    22	static u8 msc313_mux_mux_get_parent(struct clk_hw *hw)
    23	{
    24		struct msc313_mux *mux = mux_to_mux(hw);
    25		unsigned int index;
    26	
  > 27		regmap_field_read(mux->mux, &index);
    28	
    29		return index;
    30	}
    31	
    32	static int msc313_mux_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
    33	{
    34		struct msc313_mux *mux = mux_to_mux(hw);
    35	
    36		return clk_mux_determine_rate_flags(hw, req, clk_hw_get_flags(&mux->mux_hw));
    37	}
    38	
    39	static const struct clk_ops msc313_mux_mux_ops = {
    40		.set_parent = msc313_mux_mux_set_parent,
    41		.get_parent = msc313_mux_mux_get_parent,
    42		.determine_rate = msc313_mux_mux_determine_rate,
    43	};
    44	
    45	static int msc313_mux_deglitch_enable(struct clk_hw *hw)
    46	{
    47		struct msc313_mux *mux = deglitch_to_mux(hw);
    48	
    49		if (mux->gate)
    50			regmap_field_write(mux->gate, 0);
    51	
    52		return 0;
    53	}
    54	
    55	static void msc313_mux_deglitch_disable(struct clk_hw *hw)
    56	{
    57		struct msc313_mux *mux = deglitch_to_mux(hw);
    58	
    59		if (mux->gate)
    60			regmap_field_write(mux->gate, 1);
    61	}
    62	
    63	static int msc313_mux_deglitch_is_enabled(struct clk_hw *hw)
    64	{
    65		struct msc313_mux *mux = deglitch_to_mux(hw);
    66		unsigned int notgated;
    67	
    68		if (mux->gate) {
    69			regmap_field_read(mux->gate, &notgated);
    70			return !notgated;
    71		}
    72	
    73		return 1;
    74	}
    75	
    76	static int msc313_mux_deglitch_set_parent(struct clk_hw *hw, u8 index)
    77	{
    78		struct msc313_mux *mux = deglitch_to_mux(hw);
    79	
    80		if (!mux->deglitch)
    81			return -ENOTSUPP;
    82	
    83		return regmap_field_write(mux->deglitch, index);
    84	}
    85	
    86	static u8 msc313_mux_deglitch_get_parent(struct clk_hw *hw)
    87	{
    88		struct msc313_mux *mux = deglitch_to_mux(hw);
    89		unsigned int index = 0;
    90	
    91		if (mux->deglitch) {
    92			regmap_field_read(mux->deglitch, &index);
    93		}
    94	
    95		return index;
    96	}
    97	
    98	static int msc313_mux_deglitch_determine_rate(struct clk_hw *hw,
    99			struct clk_rate_request *req)
   100	{
   101		struct msc313_mux *mux = deglitch_to_mux(hw);
   102	
   103		return clk_mux_determine_rate_flags(hw, req, clk_hw_get_flags(&mux->deglitch_hw));
   104	}
   105	
   106	static const struct clk_ops msc313_mux_deglitch_ops = {
   107		.enable = msc313_mux_deglitch_enable,
   108		.disable = msc313_mux_deglitch_disable,
   109		.is_enabled = msc313_mux_deglitch_is_enabled,
   110		.set_parent = msc313_mux_deglitch_set_parent,
   111		.get_parent = msc313_mux_deglitch_get_parent,
   112		.determine_rate = msc313_mux_deglitch_determine_rate,
   113	};
   114	
   115	struct clk_hw *msc313_mux_xlate(struct of_phandle_args *clkspec, void *data)
   116	{
   117		struct msc313_muxes *muxes = data;
   118		unsigned int of_idx = clkspec->args[0];
   119		unsigned int idx = of_idx / 2;
   120	
   121		/* mux, deglitch, mux, deglitch,.. */
   122		if (of_idx >= muxes->muxes_data->num_muxes * 2)
   123			return ERR_PTR(-EINVAL);
   124	
   125		if (of_idx % 2)
   126			return &muxes->muxes[idx].deglitch_hw;
   127	
   128		return &muxes->muxes[idx].mux_hw;
   129	}
   130	
   131	struct msc313_muxes *msc313_mux_register_muxes(struct device *dev,
   132			struct regmap *regmap, const struct msc313_muxes_data *muxes_data,
   133			int (*fill_clk_parent_data)(struct clk_parent_data*, void*, const void*, const struct msc313_muxes*, unsigned int, unsigned int), void *data)
   134	{
   135		const struct msc313_mux_data *mux_data = muxes_data->muxes;
   136		struct clk_init_data mux_init = {
   137			.ops = &msc313_mux_mux_ops,
   138		};
   139		struct clk_init_data deglitch_init = {
   140			.ops = &msc313_mux_deglitch_ops,
   141		};
   142		struct clk_parent_data *dynamic_parent_data = NULL;
   143		struct msc313_muxes *muxes;
   144		struct msc313_mux *mux;
   145		struct clk_hw *clk_hw;
   146		int i, ret, mux_parent;
   147	
   148		/*
   149		 * If using the dynamic clk_parent_data mode you have to have both
   150		 * a callback and data.
   151		 */
   152		if ((fill_clk_parent_data && !data) || (!fill_clk_parent_data && data))
   153			return ERR_PTR(-EINVAL);
   154	
   155		muxes = devm_kzalloc(dev, struct_size(muxes, muxes, muxes_data->num_muxes), GFP_KERNEL);
   156		if (!muxes)
   157			return ERR_PTR(-ENOMEM);
   158	
   159		muxes->muxes_data = muxes_data;
   160		mux = muxes->muxes;
   161	
   162		for (i = 0; i < muxes_data->num_muxes; i++, mux++, mux_data++) {
 > 163			const struct reg_field gate_field = REG_FIELD(mux_data->offset,
   164					mux_data->gate_shift, mux_data->gate_shift);
 > 165			const struct reg_field mux_field = REG_FIELD(mux_data->offset,
   166					mux_data->mux_shift, mux_data->mux_shift + (mux_data->mux_width - 1));
 > 167			const struct reg_field deglitch_field = REG_FIELD(mux_data->offset,
   168					mux_data->deglitch_shift, mux_data->deglitch_shift);
   169	
   170			if(!mux_data->name)
   171				continue;
   172	
   173			if (mux_data->gate_shift != -1) {
 > 174				mux->gate = devm_regmap_field_alloc(dev, regmap, gate_field);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
