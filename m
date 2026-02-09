Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C092D8767
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770658557; cv=none; b=o9mfsh9f5k44BzXeDzo3fGlW9rph75irZAKJLisZZ7MbFiW1hV9o+R2gmErFQKpWfqRO9BYPTaAUBPKwJQnrpqs4EGT3zs7SKLIoGowMx/aarrkHk4/nULHBWzompQCQC8OJO5m12Zo0Fr9GAeMpvkpaV6cqPF50QzwupeQuujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770658557; c=relaxed/simple;
	bh=73LGh3J5tomwn6vZ9HuVNxSPnB+51GM8Nl0zJ+5ENEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0oOvPzdmsQ3RBBqJBMijSDIXzJDMCop35JE3W7oxO/9Hsynertz2PqpDiCapURq+9P/GjNiOVvbjBChoOzIUWBba79eFtZltWDapf4Yw0QHA3lbZcvVxMtO3nJGNDmnI/+JQAfESy7ZX5WjoQH1Cfp3Q6jPvNUdXsehCR1Jljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkVx5MLJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkVx5MLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770658556; x=1802194556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=73LGh3J5tomwn6vZ9HuVNxSPnB+51GM8Nl0zJ+5ENEU=;
  b=NkVx5MLJPoiyWFpijH0Nt9yHmW9VTEPAAdeltUIH2VkGaY/OdGPQJ5k4
   c842KsVuNePT3W9+IuSit80CKcGha1jBnlcOZTDhlQ1jUxrxiU21VNvAg
   gk+dRxr61A+NiT5mU72md6KX4Q8Y5EmThYIgIZri0zYvvoF5GjUtqijda
   q9V1wzpER7ZmL4xqoLvJ0WIlmcLHCUwukc0rGKkqCPR3+vbsJAr/5WIe6
   UT52OAOpYU0rIW2BJm+mrG6mY+YVb56EyJSVGOdCNsR+o0U9yRBrzuB49
   ZcLPIRh70yBDurSYk82Z+sGg+EONmz+HPE48yzt98xHbSF1rxfts1NwP9
   w==;
X-CSE-ConnectionGUID: XAC+UpqhQtSSoZVpTcJq0g==
X-CSE-MsgGUID: g2NAUNRrRfeamaA4pC7f8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74375236"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="74375236"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:35:56 -0800
X-CSE-ConnectionGUID: zfdlWZZpTma6abgQOL91Bw==
X-CSE-MsgGUID: 5kpuJEo+TR6RTYSj1OKZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216622484"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 09:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVAp-00000000oB2-2v2D;
	Mon, 09 Feb 2026 17:35:47 +0000
Date: Tue, 10 Feb 2026 01:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 08/13] clk: amlogic: Add PLL driver
Message-ID: <202602100115.ykL6A0lh-lkp@intel.com>
References: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d310797262f0ddf129e76c2aad2b950adaf1fda]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A9-standardized-model-clock-control-units/20260209-135334
base:   4d310797262f0ddf129e76c2aad2b950adaf1fda
patch link:    https://lore.kernel.org/r/20260209-a9_clock_driver-v1-8-a9198dc03d2a%40amlogic.com
patch subject: [PATCH 08/13] clk: amlogic: Add PLL driver
config: arm-randconfig-004-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100115.ykL6A0lh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100115.ykL6A0lh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100115.ykL6A0lh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.o: in function `aml_pll_get_rate_range':
>> drivers/clk/amlogic/clk-pll.c:554:(.text+0x700): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:567:(.text+0x728): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:554:(.text+0x814): undefined reference to `__aeabi_uldivmod'


vim +554 drivers/clk/amlogic/clk-pll.c

   536	
   537	static int aml_pll_get_best_rate(unsigned long rate, unsigned long step_rate,
   538					 u64 min_vco_rate, u64 max_vco_rate,
   539					 u8 od_max, enum round_type round,
   540					 unsigned long *out_rate)
   541	{
   542		int i;
   543		u64 vco_rate;
   544		unsigned long now_rate, best_rate = 0;
   545	
   546		for (i = 0; i <= od_max; i++) {
   547			vco_rate = rate << i;
   548			if (vco_rate < min_vco_rate)
   549				continue;
   550	
   551			if (vco_rate > max_vco_rate)
   552				break;
   553	
 > 554			if (vco_rate % step_rate == 0) {
   555				best_rate = rate;
   556	
   557				break;
   558			}
   559	
   560			if (round == ROUND_DOWN) {
   561				vco_rate = vco_rate - (vco_rate % step_rate);
   562				now_rate = vco_rate >> i;
   563				if ((rate - now_rate) < (rate - best_rate))
   564					best_rate = now_rate;
   565			} else {
   566				vco_rate = vco_rate + step_rate;
 > 567				vco_rate = vco_rate - (vco_rate % step_rate);
   568				now_rate = vco_rate >> i;
   569				if ((now_rate - rate) < (best_rate - rate))
   570					best_rate = now_rate;
   571			}
   572		}
   573	
   574		if (!best_rate)
   575			return -EINVAL;
   576	
   577		*out_rate = best_rate;
   578	
   579		return 0;
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
