Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938036405B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 02:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772765209; cv=none; b=hPSsmZNdToJ8oNMw5vRQMb6SrrKUjuroR5vFk4FLv0NpreELjLc1CmfgCjoQGsx6Hbk1vzUSWPU0Wvr/ITs+6KTjG9hlq2GSuAjvvRctoh3pKiOq2SamcuAU6ZeQ0xtr8IoJHdn18rE+xnFzeS9JwAe7UZFs6cgNwnTFG5rAJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772765209; c=relaxed/simple;
	bh=doMVUVqbemJYUxeDypRQhGJM1zLEQQwioqlwDp/xqf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT4nWacP46XYvlyt0lLqZ2VBjbYXq7V3oqpPTVNKDU5atc0FRWb79/4kTeMAMUbhoSR2VCCaUJAtec26YE77aNyJ4aKQYjqgjsf7Ho8k952aE8OMNmX+OS2yIQgSub5+hGPuJvL6n/CWJfIDsjJrVBXR6qDQzvWESu5KmYMdpSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWQPvK3X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWQPvK3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772765207; x=1804301207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=doMVUVqbemJYUxeDypRQhGJM1zLEQQwioqlwDp/xqf4=;
  b=iWQPvK3XDFITrEKOZXmFmRepyZzcJhlg2c2+YP3vBLFl+ptSjwj9AHHW
   upN47e7CMNqW7Ol5OoeTM918SOmDkhosyCLlTuIey8lquS7HMR0RKZB6v
   NEO5fdlyyHTgWfvBDDxlYRx8rUsmTzPLuNOVeo5Wri3OE5/z4bKuQXBDH
   F61x2EAZQ+fWvU/EJRvzQLobP88uoS42swYr9pcV8Q9vKn9b6kMS0j7jN
   CvvT3OoFLj4j558OUYVfnF8h6/fZBzWxvCpSWZe0kH9Do/d1XOXcHD1Bd
   S7Vakjh0sbl2hUzRC+Yunyu5R3c7/J7llkl7AZMQSeCB7ZbzTNMruSHdZ
   g==;
X-CSE-ConnectionGUID: T+nZ1DIiSbabtXGislDzLQ==
X-CSE-MsgGUID: r8GvBkGqQoG+7lhUI3Xj7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61444923"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="61444923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 18:46:46 -0800
X-CSE-ConnectionGUID: wQ09Wkg0SkuH6gYWLCW+fA==
X-CSE-MsgGUID: GjehhDxyQuC4TU/vuAofwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="215604967"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 18:46:44 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyLD7-000000000EP-2LIH;
	Fri, 06 Mar 2026 02:46:41 +0000
Date: Fri, 6 Mar 2026 10:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Swapnil Jakhade <sjakhade@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] phy: cadence: Sierra: Do not modify register when
 getting parent clock
Message-ID: <202603061235.hrl27Jvj-lkp@intel.com>
References: <20260305-fix_sierra_get_parent-v1-1-a7c18e9e6c58@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-fix_sierra_get_parent-v1-1-a7c18e9e6c58@bootlin.com>

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-CLEMENT/phy-cadence-Sierra-Do-not-modify-register-when-getting-parent-clock/20260306-000915
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260305-fix_sierra_get_parent-v1-1-a7c18e9e6c58%40bootlin.com
patch subject: [PATCH] phy: cadence: Sierra: Do not modify register when getting parent clock
config: xtensa-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061235.hrl27Jvj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061235.hrl27Jvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061235.hrl27Jvj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/phy/cadence/phy-cadence-sierra.c: In function 'cdns_sierra_pll_mux_get_parent':
>> drivers/phy/cadence/phy-cadence-sierra.c:702:23: warning: unused variable 'termen_field' [-Wunused-variable]
     struct regmap_field *termen_field = mux->termen_field;
                          ^~~~~~~~~~~~
>> drivers/phy/cadence/phy-cadence-sierra.c:701:23: warning: unused variable 'plllc1en_field' [-Wunused-variable]
     struct regmap_field *plllc1en_field = mux->plllc1en_field;
                          ^~~~~~~~~~~~~~


vim +/termen_field +702 drivers/phy/cadence/phy-cadence-sierra.c

d88ca22d6f0c924 Aswath Govindraju      2022-01-28  697  
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  698  static u8 cdns_sierra_pll_mux_get_parent(struct clk_hw *hw)
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  699  {
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  700  	struct cdns_sierra_pll_mux *mux = to_cdns_sierra_pll_mux(hw);
da08aab940092a0 Swapnil Jakhade        2021-12-23 @701  	struct regmap_field *plllc1en_field = mux->plllc1en_field;
da08aab940092a0 Swapnil Jakhade        2021-12-23 @702  	struct regmap_field *termen_field = mux->termen_field;
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  703  	struct regmap_field *field = mux->pfdclk_sel_preg;
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  704  	unsigned int val;
da08aab940092a0 Swapnil Jakhade        2021-12-23  705  	int index;
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  706  
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  707  	regmap_field_read(field, &val);
da08aab940092a0 Swapnil Jakhade        2021-12-23  708  
4f20466dcc453ec Gregory CLEMENT        2026-03-05  709  	if (strstr(clk_hw_get_name(hw), clk_names[CDNS_SIERRA_PLL_CMNLC1]))
da08aab940092a0 Swapnil Jakhade        2021-12-23  710  		index = clk_mux_val_to_index(hw, cdns_sierra_pll_mux_table[CMN_PLLLC1], 0, val);
4f20466dcc453ec Gregory CLEMENT        2026-03-05  711  	else
da08aab940092a0 Swapnil Jakhade        2021-12-23  712  		index = clk_mux_val_to_index(hw, cdns_sierra_pll_mux_table[CMN_PLLLC], 0, val);
da08aab940092a0 Swapnil Jakhade        2021-12-23  713  
da08aab940092a0 Swapnil Jakhade        2021-12-23  714  	return index;
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  715  }
28081b72859f0fa Kishon Vijay Abraham I 2021-03-19  716  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
