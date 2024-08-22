Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04401CB147
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724342302; cv=none; b=b0VLAgCjrL2oiYqlsbTmf1XChp0hRLIUErc0pSA5kEBedg3Y2TuwfkromFpBLFnny5GL2oNUqX4ReiJwlOoBVbwsFQBchETktq2RQSbEJhOshXsAEydPLqFjVZ+Btt1149fp4LYHQX2aB0aSwa3eLan3WkPb46u/KciPXn67Dzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724342302; c=relaxed/simple;
	bh=XIptDBLCCqt5FOXBzZdJ4OucwXoIh5zSpHSMDsw74BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGKbQcMtCist8j7ljhkk2TbPY8eENl+z2hRbW6tpLd6lYUFkCeldPgZ1/Vs9RbDU4X/+hE9B532/NCUVDiw5hP1EJSbdJQ5bVEBphLeL8o+swry9/3mBLolx/Ofdcbre8EjqNdKiH+76D75ahjTmAr+hPDR3eBHNRkpHw7tOzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0IagWbU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0IagWbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724342300; x=1755878300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XIptDBLCCqt5FOXBzZdJ4OucwXoIh5zSpHSMDsw74BM=;
  b=G0IagWbUX6P0N8gOC84HPMK1jasBC6LaWdl918K5Dckr1t2v2Yr6DsHQ
   TbO2Qu2xZd8VlFnUF6pV0SV40RqyY/s4yir//VeLeYb9yaa+vFJJ9XY3q
   p/Om2uNjT1zWh1FY6vOGKbXvtMJ8K5v3mxKeCxJpM0AA6GMzYceYQGqKb
   kII/R2wChPzMLiLKsk/kQ+rPGITO9g1jyxW5q5F+aTD5spdkxkGs72BH1
   BACkyesD3RoN2iQ40cafHo9zZnLwzYyAsNK8OCDbgqUs47hodDxGd4q/s
   +icvtPspCE/FZ/04ofVmuWrutbMBxoFWZ9foXBro8kpspQtdol83f2ulX
   Q==;
X-CSE-ConnectionGUID: PNaEarW2S+quEI8VfTiIxg==
X-CSE-MsgGUID: wv12WsTBQEa3gR644PcQww==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22931113"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22931113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 08:58:20 -0700
X-CSE-ConnectionGUID: pQu39yspT7+vJ5q1GDxmoA==
X-CSE-MsgGUID: wQ1euIs0RsOGOf0ZIbICrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61341876"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Aug 2024 08:58:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shACV-000CxA-1O;
	Thu, 22 Aug 2024 15:58:15 +0000
Date: Thu, 22 Aug 2024 23:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Melki <christian.melki@t2data.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/12] nvmem: microchip-otpc: Enable main RC
 oscillator clock
Message-ID: <202408222300.BEv0hBO5-lkp@intel.com>
References: <20240821105943.230281-12-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821105943.230281-12-ada@thorsis.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47ac09b91befbb6a235ab620c32af719f8208399]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Dahl/nvmem-microchip-otpc-Avoid-writing-a-write-only-register/20240821-193942
base:   47ac09b91befbb6a235ab620c32af719f8208399
patch link:    https://lore.kernel.org/r/20240821105943.230281-12-ada%40thorsis.com
patch subject: [PATCH v1 11/12] nvmem: microchip-otpc: Enable main RC oscillator clock
config: x86_64-buildonly-randconfig-001-20240822 (https://download.01.org/0day-ci/archive/20240822/202408222300.BEv0hBO5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222300.BEv0hBO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222300.BEv0hBO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/microchip-otpc.c:61: warning: Function parameter or struct member 'clk' not described in 'mchp_otpc'


vim +61 drivers/nvmem/microchip-otpc.c

98830350d3fc82 Claudiu Beznea 2022-07-06  47  
98830350d3fc82 Claudiu Beznea 2022-07-06  48  /**
98830350d3fc82 Claudiu Beznea 2022-07-06  49   * struct mchp_otpc - OTPC private data structure
98830350d3fc82 Claudiu Beznea 2022-07-06  50   * @base: base address
98830350d3fc82 Claudiu Beznea 2022-07-06  51   * @dev: struct device pointer
98830350d3fc82 Claudiu Beznea 2022-07-06  52   * @packets: list of packets in OTP memory
98830350d3fc82 Claudiu Beznea 2022-07-06  53   * @npackets: number of packets in OTP memory
98830350d3fc82 Claudiu Beznea 2022-07-06  54   */
98830350d3fc82 Claudiu Beznea 2022-07-06  55  struct mchp_otpc {
98830350d3fc82 Claudiu Beznea 2022-07-06  56  	void __iomem *base;
98830350d3fc82 Claudiu Beznea 2022-07-06  57  	struct device *dev;
1acc431703527a Alexander Dahl 2024-08-21  58  	struct clk *clk;
98830350d3fc82 Claudiu Beznea 2022-07-06  59  	struct list_head packets;
98830350d3fc82 Claudiu Beznea 2022-07-06  60  	u32 npackets;
98830350d3fc82 Claudiu Beznea 2022-07-06 @61  };
98830350d3fc82 Claudiu Beznea 2022-07-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
