Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E0F408F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 04:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686371956; x=1717907956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4xz4XkPwI0i5FFgpnID3pgqRuERUILkXUqai/JNiGdk=;
  b=D12WGt67otgqMi/97z6sOb3ef/+4pDeXN0keo8Ba4MCAEwgsZzgBztbP
   /A80/BpHfxfiKABCScoZKR2VAUo9sJ7R6t3/h3iGtFEfM3zM9OFzmIIzt
   vjfJrKL28+fGdQMiAadcubjoBE82Y2fbuqXEXIBPjKbroLHvCYBsqF1Q7
   9NsqrOQkxCDTHnmgnd8pENngOFZYoNwJ3MQpsiu0zT7Hky8enz2Cb7zEz
   p95gAOFeQ0m78dT8T19hUjLOObSKB9jU8ZnElo9EvyyOjotma7Q1kKsiN
   L7PMDT3WaGPkmEi/kVKegzM1IsQirLZApx4v9n2Yi9+wvhRhMIHWcDx4V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338091982"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338091982"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 21:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823288974"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="823288974"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 21:39:14 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7qNd-0009iy-2D;
	Sat, 10 Jun 2023 04:39:13 +0000
Date: Sat, 10 Jun 2023 12:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-determine-rate 66/68]
 sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate()
 warn: unsigned 'rate' is never less than zero.
Message-ID: <202306101217.08CRVGcK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-determine-rate
head:   326cc42f9fdc3030676e949d5cea3ccc923fd1de
commit: 25d43ec352eaefbfaee0912d02b6f10ea606931f [66/68] ASoC: tlv320aic32x4: pll: Switch to determine_rate
config: x86_64-randconfig-m001-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101217.08CRVGcK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101217.08CRVGcK-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate() warn: unsigned 'rate' is never less than zero.

vim +/rate +219 sound/soc/codecs/tlv320aic32x4-clk.c

   206	
   207	static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
   208						  struct clk_rate_request *req)
   209	{
   210		struct clk_aic32x4_pll_muldiv settings;
   211		unsigned long rate;
   212		int ret;
   213	
   214		ret = clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_parent_rate);
   215		if (ret < 0)
   216			return -EINVAL;
   217	
   218		rate = clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
 > 219		if (rate < 0)
   220			return rate;
   221	
   222		req->rate = rate;
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
