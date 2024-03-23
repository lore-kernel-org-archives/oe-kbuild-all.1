Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AC15664
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711177318; cv=none; b=J1RmHk07Ti66urpw/6Qulg5eI38GVxbAMTOsaErSFOczpFpeBJMuiFi0GVbCojn25L0VNqzIC1aknb2qW+JTLsOxMtEvd0/ThFQ8mdEs1ArbAsBRROelkqpZdJpBsJdzOQwlBaRTWLVR0ZdzkCMoxxYGxkFU4XjTYjkxEGLs9cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711177318; c=relaxed/simple;
	bh=yhbjA5niZQhSFgh07i14d0fXkDpexeMQw2/j5Wlv5v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFfkxFWFwKWG0HdHv92RSJytKiSKZrax5kPE63kWlpSP5ErL5tgfgPc+orIvrW507Gpzz9R/HsB70yvJAggUEkMqLeZHatFoFDGW4u3NZUioTGRV+XlY9M89qwaRpUgvK7/5h38OutNataV3Xlsv62tjPL/9OIq1/upXHltbdTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihJsGJVb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihJsGJVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711177315; x=1742713315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yhbjA5niZQhSFgh07i14d0fXkDpexeMQw2/j5Wlv5v8=;
  b=ihJsGJVb9TuAtV/twgKI5E5lM0mTJypxBbdkVFDmEwCf20p/SpPvqZba
   IAObMGn6Zec8IGjjzcEmAprYUH86G01YFn97xV04fXKjcaxM0B0wCPYQY
   vazMhhUYTclep1YtHt2dIGrKsrlFN0n91Q8a20HqMHLXxIGvxNdMlXd9X
   m60sB5YwCF0iWFFPnEkjeGCYAAIFVLYsh5u1QPUI8m6zS6dREvXqZCQ2X
   3Lvv6Xk6d9+GhFaOpVktWYzfogWbVmscHUbMFs37RIa7Yp5rpz2p4SOXs
   FSCB4+RxH2wrP6y9hP6gcEiQHffa9RJo9CkZD3FmGlYAMdzkudzd69cIC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10021884"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="10021884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 00:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="19815686"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2024 00:01:50 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnvO0-000KwJ-06;
	Sat, 23 Mar 2024 07:01:48 +0000
Date: Sat, 23 Mar 2024 15:01:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Bee <knaerzche@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH 2/5] mfd: rk8xx: Add RK816 support
Message-ID: <202403231417.oV6q6CGc-lkp@intel.com>
References: <20240321143911.90210-5-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321143911.90210-5-knaerzche@gmail.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-regulator/for-next robh/for-next linus/master v6.8 next-20240322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Bee/dt-bindings-mfd-Add-rk816-binding/20240321-224318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240321143911.90210-5-knaerzche%40gmail.com
patch subject: [PATCH 2/5] mfd: rk8xx: Add RK816 support
config: arc-randconfig-001-20240322 (https://download.01.org/0day-ci/archive/20240323/202403231417.oV6q6CGc-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231417.oV6q6CGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231417.oV6q6CGc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/rk8xx-core.c:395:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     395 | static const unsigned int rk816_get_irq_reg(struct regmap_irq_chip_data *data,
         |        ^~~~~


vim +395 drivers/mfd/rk8xx-core.c

   394	
 > 395	static const unsigned int rk816_get_irq_reg(struct regmap_irq_chip_data *data,
   396						    unsigned int base, int index)
   397	{
   398		unsigned int irq_reg = base;
   399	
   400		switch (base) {
   401		case RK816_INT_STS_REG1:
   402			irq_reg += rk816_irq_status_offsets[index];
   403			break;
   404		case RK816_INT_STS_MSK_REG1:
   405			irq_reg += rk816_irq_mask_offsets[index];
   406			break;
   407		}
   408	
   409		return irq_reg;
   410	};
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
