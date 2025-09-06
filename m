Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DD130A73
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757158056; cv=none; b=CgAhkxwihM1TL5U/QqOziKGjK7LMeUZb0gjBBHB4WW0UyPO9jGoiRsyJ3eHglf/WRO0tAOQ/Ggp184cLZybRIHQR3eRNh/uE8BTlm+wqHMUtIAtYfmplvxu3WJihkBI/zW0qkATAkj6NisIeKrXAfgjSGd75PIA5OdfunTaZuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757158056; c=relaxed/simple;
	bh=gtt+QkW89qQ/xiE4F1ORAwE6JL5LfqecUfOhg9hp7B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1zDQ949VsrJpuIjC6A3OK6A4qkToB5wWvUaeiMTIxfaLIWAzFVi16O6CRq4rZ0A/dfCiw+SgUlwSZvLEQPH29IKzd1746uyrcFgyVkNTJI02chJV7JNi0gWhwy1jTv+cEH3St2uCvN2b/ZvicqHS1RECfuQGpKTDgMfcvHmGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTOeL49+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTOeL49+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757158055; x=1788694055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gtt+QkW89qQ/xiE4F1ORAwE6JL5LfqecUfOhg9hp7B8=;
  b=nTOeL49+Hz1HWapD7r13kQOIgtMvYevFIGa2KDpHU2Jk5UW2TJUI2wiN
   qQq0FvH+a6BXLBIGvdKChMfmnM6Wu3ABhmGinpV56tKaj9F86kB132L69
   WQPnAxINJ5EfzmTfBn+AGuBygp/2X58NJ9B8xIv56he8jqlpr75WdTESK
   cbAcXgt/rQT0F4XE2n7RL0AB4j3dDgMShmuR3K8WBn/TR+AKwXrMs3ljj
   6sXub9bcjWm/VEu4DkjxAcxWgV3kF+GAkWsYWM4x1E5zdCtwW6j4PwAuw
   rtAon/ieGcZdcJRsu6miPAJ3b196gOkQvNVuWA/GVQWHIZU86FCq7faEX
   w==;
X-CSE-ConnectionGUID: e3L6iFM1QW2eO4jZ5rNENQ==
X-CSE-MsgGUID: imJ6ttaMTvuqE0ENzoO/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58525539"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58525539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 04:27:34 -0700
X-CSE-ConnectionGUID: OWRVGH4MTcqWp+tpytIhAw==
X-CSE-MsgGUID: P4w+HXhvSIeDmXPIiyKcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="177626327"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2025 04:27:30 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uur4p-0001O3-18;
	Sat, 06 Sep 2025 11:27:27 +0000
Date: Sat, 6 Sep 2025 19:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH v3 2/2] clk: amlogic: add video-related clocks for S4 SoC
Message-ID: <202509061948.3VcIfqLx-lkp@intel.com>
References: <20250905-add_video_clk-v3-2-8304c91b8b94@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-add_video_clk-v3-2-8304c91b8b94@amlogic.com>

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-add-video-clock-indices-for-Amlogic-S4-SoC/20250905-171121
base:   01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
patch link:    https://lore.kernel.org/r/20250905-add_video_clk-v3-2-8304c91b8b94%40amlogic.com
patch subject: [PATCH v3 2/2] clk: amlogic: add video-related clocks for S4 SoC
config: arm64-randconfig-002-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061948.3VcIfqLx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061948.3VcIfqLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061948.3VcIfqLx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/s4-peripherals.c:1135:26: error: 'mux_table_cts_sel' undeclared here (not in a function)
    1135 |                 .table = mux_table_cts_sel,
         |                          ^~~~~~~~~~~~~~~~~
>> drivers/clk/meson/s4-peripherals.c:1140:31: error: 's4_cts_parent_hws' undeclared here (not in a function); did you mean 's4_cts_parents'?
    1140 |                 .parent_hws = s4_cts_parent_hws,
         |                               ^~~~~~~~~~~~~~~~~
         |                               s4_cts_parents
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from include/linux/of.h:15,
                    from include/linux/clk-provider.h:9,
                    from drivers/clk/meson/s4-peripherals.c:9:
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/clk/meson/s4-peripherals.c:1141:32: note: in expansion of macro 'ARRAY_SIZE'
    1141 |                 .num_parents = ARRAY_SIZE(s4_cts_parent_hws),
         |                                ^~~~~~~~~~


vim +/mux_table_cts_sel +1135 drivers/clk/meson/s4-peripherals.c

  1129	
  1130	static struct clk_regmap s4_cts_encl_sel = {
  1131		.data = &(struct clk_regmap_mux_data){
  1132			.offset = CLKCTRL_VIID_CLK_DIV,
  1133			.mask = 0xf,
  1134			.shift = 12,
> 1135			.table = mux_table_cts_sel,
  1136		},
  1137		.hw.init = &(struct clk_init_data){
  1138			.name = "cts_encl_sel",
  1139			.ops = &clk_regmap_mux_ops,
> 1140			.parent_hws = s4_cts_parent_hws,
  1141			.num_parents = ARRAY_SIZE(s4_cts_parent_hws),
  1142			.flags = CLK_SET_RATE_PARENT,
  1143		},
  1144	};
  1145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
