Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A172377EBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833758; cv=none; b=L7iIlGvH4rZDirJLMt3ChF99/WyUMIkDdcfAhmUyQfSeX1UYBWJl+lIOH6+1m32xytZ5Mi7MbrNS9bG46/NRCTbVJTFB2XHHchhtJNc3oVflTMyotpui9ydkP9SyljGYGsiBaltvzHiHQaWGzhHYNN3yEn8y/pTlh5z/QHKODnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833758; c=relaxed/simple;
	bh=ZclFthZd77skOSmXkc5robMrKH8Po4/7YgiZhdHEFFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9TZ41Rj4UEhl5X4TuQeThDSXgfIqCjw20uGvsJxcqac22N6mUGDGSRcNspP+4I5mzSNX5dN2X2MWQNqc2AsHGS9YLK/znluXRijkPe186Lj4nstEA8GJIwzCWPlAb7mIECbrXWhueeKknj9W1X+M9y97ZSPD2oZHGhY0atqvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4aNhFNe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4aNhFNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773833758; x=1805369758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZclFthZd77skOSmXkc5robMrKH8Po4/7YgiZhdHEFFw=;
  b=N4aNhFNenBvDOEGkIb5OVlLx8gN6CvcmcNyj5Ahx7PE78XiQiiSxUNIs
   HAo7H8zQ0DbuMpov19NjO4712m8ork2bpZPe3XQyy5ER+77vk2cbI+DqV
   0IarHNYbHxZTc04bT6nhroqVy+XlH1Z/+cGyAExREPmyzI4kfkb7Dv3Da
   gIGcauW0/tMGkFHmb1DrT3LquskbkO1a0eHtDVax+cZEWn1uuoWceK/oT
   2VuJIWSkZUeTTrNzYiM+2VjIeyAwKM6/vBlgl1+Bhw69UKWkvknmXo9zG
   DmiTGp1q9JYG6IuvxhF/kofntW+Qf0uOhwtLsO+ZyqselRYBVl/TYPDPV
   A==;
X-CSE-ConnectionGUID: 8PR7uK47TFqhxkdbKgNqIw==
X-CSE-MsgGUID: /3JY2OhWREqQGY3SwoC1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74770644"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74770644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 04:35:58 -0700
X-CSE-ConnectionGUID: wxFsSdJrR9yJRjaUCARfHQ==
X-CSE-MsgGUID: X0ORtggNTICqChi69o8byA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222578791"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2026 04:35:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2pBm-000000002qj-2OWn;
	Wed, 18 Mar 2026 11:35:50 +0000
Date: Wed, 18 Mar 2026 19:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Salman Nabi <salman.nabi@arm.com>,
	Vedashree Vidwans <vvidwans@nvidia.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Nirmoy Das <nirmoyd@nvidia.com>, vsethi@nvidia.com,
	vwadekar@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
Message-ID: <202603181913.NFRwBsN4-lkp@intel.com>
References: <20260317103336.1273582-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-8-andre.przywara@arm.com>

Hi Andre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master nferre-at91/at91-next v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/dt-bindings-arm-Add-Live-Firmware-Activation-binding/20260318-082717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260317103336.1273582-8-andre.przywara%40arm.com
patch subject: [PATCH v2 7/8] firmware: smccc: lfa: Register DT interrupt
config: arm64-randconfig-004-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181913.NFRwBsN4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181913.NFRwBsN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181913.NFRwBsN4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/smccc/lfa_fw.c: In function 'lfa_register_dt':
   drivers/firmware/smccc/lfa_fw.c:878:16: error: implicit declaration of function 'devm_request_threaded_irq'; did you mean 'devm_request_region'? [-Werror=implicit-function-declaration]
     878 |         return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                devm_request_region
   drivers/firmware/smccc/lfa_fw.c:880:42: error: 'IRQF_COND_ONESHOT' undeclared (first use in this function)
     880 |                                          IRQF_COND_ONESHOT, NULL, NULL);
         |                                          ^~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/lfa_fw.c:880:42: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/firmware/smccc/lfa_fw.c:881:1: warning: control reaches end of non-void function [-Wreturn-type]
     881 | }
         | ^
   cc1: some warnings being treated as errors


vim +881 drivers/firmware/smccc/lfa_fw.c

   863	
   864	static int lfa_register_dt(struct device *dev)
   865	{
   866		struct device_node *np;
   867		unsigned int irq;
   868	
   869		np = of_find_compatible_node(NULL, NULL, "arm,lfa");
   870		if (!np)
   871			return -ENODEV;
   872	
   873		irq = irq_of_parse_and_map(np, 0);
   874		of_node_put(np);
   875		if (!irq)
   876			return -ENODEV;
   877	
   878		return devm_request_threaded_irq(dev, irq, lfa_irq_handler,
   879						 lfa_irq_handler_thread,
   880						 IRQF_COND_ONESHOT, NULL, NULL);
 > 881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
