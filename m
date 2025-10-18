Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3E1EE033
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760789200; cv=none; b=PF8MRbMYXqQsT02BkOETs9F2PbLM6h4HHvGNtp7cyu6cHGZY4zvJK7IDEiQqwaG8z9tzMWkZvfOFic8RwoL/V3dhhSthcGi7N+91E8bK9aKCtDFMCl7m+nL7uYSeGUXNB9TfvIR+TMlR5gkMLlvMLtfkmNPJlynX5Td1EOhlQ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760789200; c=relaxed/simple;
	bh=amcyDQ0ZSqfKRHQvB06Ill1m9TP4roTiAJ8m7kuDqWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfS4N6OJjJkkdYnEhpcps8sfU69HBXHA+X5A74UAZvYLrHYyZ9DX52+Esq3jLSmSOiaAKFzRWfhWLjfhnLrOo61B13SRj+ckLZUtSDwnN7nfP24ssOI4po0ZognRnF03VpKB552sXpQIB+KnguSwXHpqMVKXghPiSOCh7GQsJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loOx0PKG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loOx0PKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760789198; x=1792325198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amcyDQ0ZSqfKRHQvB06Ill1m9TP4roTiAJ8m7kuDqWI=;
  b=loOx0PKGOlvVA1DnXH+NykIc76KrnkNBl59xuXKwyCEMwY9oO79jjwnY
   7AaNgoCK9fw9Pukx5wMMrhRDfZ1l1PMQQkZu/s3m6o/l7YtoFGmmXI65F
   XlHbg5cDVFVWXmr8/t6CIVUXNr8rC/t45fgX1NqlxCDmWmQzOF45889Oq
   Xr5wLtBD+jNAO/UvE5BorFGP6fmUQ505JDI3sLEtjabpKoOQrdaecHwvl
   x66a7eKaPk+ojsE6yLQo34Nh5k9a9zy0sNHtkGyxZYz+I+XsdEW7D0Io8
   RFgbCw08SIV25mL90Q5WxqV/4qouIE4PaH1yWA9N9Rltjjaoh375os1Tj
   w==;
X-CSE-ConnectionGUID: 8pyeDcAdSgK+QTDln+Y7Lw==
X-CSE-MsgGUID: qomjwrC6S/uIl0zNABmMxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74426673"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="74426673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 05:06:37 -0700
X-CSE-ConnectionGUID: nfs33RDKS5m+TSeTk1j45w==
X-CSE-MsgGUID: 2VrXg+YDTn6HK9yWeDUEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182957412"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2025 05:06:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA5hT-0008Gf-1J;
	Sat, 18 Oct 2025 12:06:25 +0000
Date: Sat, 18 Oct 2025 20:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, linus.walleij@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] pinctrl: cix: Add pin-controller support for sky1
Message-ID: <202510181916.q32y7Jel-lkp@intel.com>
References: <20251017074646.3344924-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-pinctrl-Add-cix-sky1-pinctrl/20251017-155001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20251017074646.3344924-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] pinctrl: cix: Add pin-controller support for sky1
config: nios2-randconfig-r121-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181916.q32y7Jel-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181916.q32y7Jel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181916.q32y7Jel-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:289:17: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:290:25: sparse:     got unsigned int [usertype] *pin_reg
>> drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:293:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:358:17: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:359:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:372:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *pin_reg @@     got void [noderef] __iomem * @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse:     expected unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:398:17: sparse:     got void [noderef] __iomem *
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:399:25: sparse:     got unsigned int [usertype] *pin_reg
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *pin_reg @@
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/pinctrl/cix/pinctrl-sky1-base.c:403:25: sparse:     got unsigned int [usertype] *pin_reg

vim +289 drivers/pinctrl/cix/pinctrl-sky1-base.c

   282	
   283	static int sky1_pmx_set_one_pin(struct sky1_pinctrl *spctl,
   284					    unsigned int pin, unsigned char muxval)
   285	{
   286		u32 reg_val;
   287		u32 *pin_reg;
   288	
 > 289		pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
 > 290		reg_val = readl(pin_reg);
   291		reg_val &= ~SKY1_MUX_MASK;
   292		reg_val |= muxval << SKY1_MUX_SHIFT;
 > 293		writel(reg_val, pin_reg);
   294	
   295		dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
   296			pin * SKY1_PIN_SIZE, reg_val);
   297		return 0;
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
