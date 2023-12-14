Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97260B9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 16:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SE3rxC4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702572146; x=1734108146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I1HR5y8m6AmuFXTWMWxoXGDad2gHC4ZKv2nZ7cj9JN0=;
  b=SE3rxC4fnPQh2g9+1qr+KABHaqtiiPVG5RVDX5f8U/vnP7JwjMynvziP
   g9OqWQGCg1rolgJsiXVSAzj0v59aVGKmqtEiqfpBUT1cS7Vd97KKFSeYc
   ch1iAhC+WMzEfOpfZrKALxshqXszrSQns9LvSI3FqL5uhsO9W26kr8dg7
   TFIK4MEBKYO54R3ouv+2cW72y6ygoAf/WTanoN7/3qVHolaSPiThnb9pA
   V3jXnf+iqTVtpoFD7s8BlL+q5ZtC5X3LEmHxEqQ+wwzpTr4CLnwmZoGsC
   h6yzef8xTCARPBdx48AzBAL+9JNsTKPOnFgF/knOtVC7fZ0HtrQ52z5u2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2302804"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2302804"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767661629"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="767661629"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2023 08:42:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDomz-000MKq-3A;
	Thu, 14 Dec 2023 16:42:22 +0000
Date: Fri, 15 Dec 2023 00:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <202312150021.gTKleTo4-lkp@intel.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.7-rc5]
[cannot apply to next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/hwmon-ltc4282-add-support-for-the-LTC4282-chip/20231124-231842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231124-ltc4282-support-v2-2-952bf926f83c%40analog.com
patch subject: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
config: nios2-randconfig-r111-20231127 (https://download.01.org/0day-ci/archive/20231215/202312150021.gTKleTo4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150021.gTKleTo4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150021.gTKleTo4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/ltc4282.c:347:6: sparse: sparse: symbol 'ltc4282_round_rate' was not declared. Should it be static?
>> drivers/hwmon/ltc4282.c:356:15: sparse: sparse: symbol 'ltc4282_recalc_rate' was not declared. Should it be static?
>> drivers/hwmon/ltc4282.c:967:34: sparse: sparse: dubious: x & !y
   drivers/hwmon/ltc4282.c:1057:34: sparse: sparse: dubious: x & !y
   drivers/hwmon/ltc4282.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini

vim +/ltc4282_round_rate +347 drivers/hwmon/ltc4282.c

   346	
 > 347	long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
   348				unsigned long *parent_rate)
   349	{
   350		int idx = find_closest(rate, ltc4282_out_rates,
   351				       ARRAY_SIZE(ltc4282_out_rates));
   352	
   353		return ltc4282_out_rates[idx];
   354	}
   355	
 > 356	unsigned long ltc4282_recalc_rate(struct clk_hw *hw, unsigned long parent)
   357	{
   358		struct ltc4282_state *st = container_of(hw, struct ltc4282_state,
   359							clk_hw);
   360		u32 clkdiv;
   361		int ret;
   362	
   363		ret = regmap_read(st->map, LTC4282_CLK_DIV, &clkdiv);
   364		if (ret)
   365			return 0;
   366	
   367		clkdiv = FIELD_GET(LTC4282_CLKOUT_MASK, clkdiv);
   368		if (!clkdiv)
   369			return 0;
   370		if (clkdiv == LTC4282_CLKOUT_INT)
   371			return LTC4282_CLKOUT_SYSTEM;
   372	
   373		return LTC4282_CLKOUT_CNV;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
