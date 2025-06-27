Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7F31E8322
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 21:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058758; cv=none; b=I2IBm/HGzFB89BInbPCH5EsfqWo5t1iGit/RW49uMsI/W+4VKI4TqZh0UMqyY0DjsiGzm8LcZDoX/ty7Axl660LaNAHnr+nDT1QV7GdL8m7AeBcVzB2PJUhAgpzlc14fVl7my/hs6DktaYRxxOH1eOh98dSeyDbyytPHsLJGXNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058758; c=relaxed/simple;
	bh=rnMpCnl99pURIeGk595kL4DsqhWvPsXPGYY8/MIT1Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYH4Nnxq/hgoxr3iyJUH4JYQaRg7FzzOP7YtQ3YXwp/P0frUbTzGop1XErY590KlNBmmsSsD2QS0FU1B077cSRPrIqzPk6eE3h3CwbRkMXrQq5YdeQiBzu7rQufOl60qTarZfVj/zJuI48fUNDIIRlH9QJ7OF9OkM0BQjHNVqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoH5Nfwb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoH5Nfwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751058757; x=1782594757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnMpCnl99pURIeGk595kL4DsqhWvPsXPGYY8/MIT1Ig=;
  b=PoH5Nfwb5QP3i12Qd73uKke02b+TBmeJmWigLHbvSzx7bFT7HKDMWqIt
   0nw2izni/HIL4MLu3YY8BzZLJAyEFfr5qqbdU6K5bOvosaUHj5oS/BcQD
   JkhidMrel5UXDW5Adr+0r9fqq0uId7pDGyP/cBoWSI1bLtEFCJYblr0iI
   91b48YY7izH0sglhXlxAxN147nVftOKa/ZCnowstKR0yg+YornDJGuxOm
   xFwYicCJNUb2NIfysxqM1a9CgvLcM43agWLWdJZpYAs698YPhshyk7CgB
   Gp+eyLp8kn9tV+ByXVQTmyGqXDBfspCx+BCnBK4MQMCnTRx6JzI+Bduiv
   A==;
X-CSE-ConnectionGUID: jpoO7qJvTqi9orcl6Usirw==
X-CSE-MsgGUID: OXxn35+oSleHSe3ZsdgtEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53464884"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53464884"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 14:12:34 -0700
X-CSE-ConnectionGUID: kWfOvAFYSluyudlZ5IZQ+Q==
X-CSE-MsgGUID: ZoFiyhrIQ1Kvq0Bh1AcGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="158631627"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 14:12:33 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVGN4-0000hj-1Y;
	Fri, 27 Jun 2025 21:12:30 +0000
Date: Fri, 27 Jun 2025 23:11:49 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb Connolly <caleb@connolly.tech>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 1287/5998]
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0
 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202506272333.rzB7d4x9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 9c59059fcf27ccd93d7dddc99727fd2c9deca309 [1287/5998] dt-bindings: display: visionox-rm69299: document new compatible string
config: arm64-randconfig-2053-20250626 (https://download.01.org/0day-ci/archive/20250627/202506272333.rzB7d4x9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506272333.rzB7d4x9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272333.rzB7d4x9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts:477.10-498.4: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4762.27-4813.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1221.44-1224.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: /soc@0/geniqup@8c0000/i2c@894000/touchscreen@38: failed to match any schema with compatible: ['focaltech,fts8719']
>> arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
