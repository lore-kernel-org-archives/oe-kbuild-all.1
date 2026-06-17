Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE9218C2C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 00:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781655544; cv=none; b=R49yhRXF4rsnrkO0orYO+pB5J21RJzbLh/dLU520apQtckIc04hD8ML3h3NxRECz2N2IoQtoPGlAPjeYp0FuphM0Plxd4lk3knp6FclCYI9aePDG8FiYDr5L6PAWd4kcSzW0k8xjRuTH0P4trC7YtxOcxnCjlJzL1eAdpwxTXvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781655544; c=relaxed/simple;
	bh=wzyIyGZV/VwivuBMLya19vUeFTeSlptWqUJ6xCqVDqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obROzF1ff9SR2tKSJmkIAoeEaNkIpEaFBWIWNTpbMT6NGv544Ds0kK6W7yRqJv992zXFCYJyJx/FaYcUfs7XhJ1NiScdyasmeSk275Jjd5n2vI0aurlTWqU3JLnn1yTamSLAO3773bTAEFx7FL9kA+QN5OOUM3oYofi4Mbwk4GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/4psTHy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/4psTHy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781655542; x=1813191542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wzyIyGZV/VwivuBMLya19vUeFTeSlptWqUJ6xCqVDqw=;
  b=E/4psTHyLPP/eL/6IstvllEZwLmMwh6xmdM5IvR8w45PKuUcb4y72npW
   HmEC1rC2KDTHgNXFm9XEUO6dXtA1PlNvqMDNtwmvgtW4xhPq63JrdGT/r
   pF+ehZZJL5PTq5mzMUVyXoWa7zur+zXXl0yA6fgCJSzt6/liHnYxBKXV6
   Wlf7MOAmRdch6xujmRloajEVgUIZY8+lYeZh0G3jvGNg4YT952vx8vJQy
   yOU+8xMVmsMHSD9bifC+l5BGZ0B0PZX7F0siv0RipptajPOCJuk1WOS/l
   mTtiasMMPNdoTIvh5/OHMAjeatA5BYoHiHk7HVcEbPKGTQS/Bb9oVK1s2
   Q==;
X-CSE-ConnectionGUID: CmB6NS3MRHqNr13ZyAT15w==
X-CSE-MsgGUID: 5Y4CbVi6RC2jP0GCgR3cbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86357853"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="86357853"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 17:19:01 -0700
X-CSE-ConnectionGUID: jcgiUuSZQcGe+APTVVpoog==
X-CSE-MsgGUID: zS6Mf9W1S+S/zyG5hWyLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="271987984"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2026 17:18:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZdzc-00000000TwY-0ddU;
	Wed, 17 Jun 2026 00:18:56 +0000
Date: Wed, 17 Jun 2026 08:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jad Keskes <inasj268@gmail.com>, Mark Brown <broonie@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: Re: [PATCH v3] regulator: max14577: fix set_mode clobbering enable
 on MAX77836 LDOs
Message-ID: <202606170855.NFp0dIU9-lkp@intel.com>
References: <20260616170256.1659595-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616170256.1659595-1-inasj268@gmail.com>

Hi Jad,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v7.1 next-20260616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jad-Keskes/regulator-max14577-fix-set_mode-clobbering-enable-on-MAX77836-LDOs/20260617-024714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260616170256.1659595-1-inasj268%40gmail.com
patch subject: [PATCH v3] regulator: max14577: fix set_mode clobbering enable on MAX77836 LDOs
config: powerpc64-randconfig-r071-20260617 (https://download.01.org/0day-ci/archive/20260617/202606170855.NFp0dIU9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170855.NFp0dIU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170855.NFp0dIU9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/max14577-regulator.c:208:3: error: field designator 'of_map_mode' does not refer to any field in type 'const struct regulator_ops'
     208 |         .of_map_mode            = max77836_ldo_of_map_mode,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +208 drivers/regulator/max14577-regulator.c

   197	
   198	static const struct regulator_ops max77836_ldo_ops = {
   199		.is_enabled		= regulator_is_enabled_regmap,
   200		.enable			= max77836_ldo_enable,
   201		.disable		= max77836_ldo_disable,
   202		.list_voltage		= regulator_list_voltage_linear,
   203		.map_voltage		= regulator_map_voltage_linear,
   204		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
   205		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
   206		.get_mode		= max77836_ldo_get_mode,
   207		.set_mode		= max77836_ldo_set_mode,
 > 208		.of_map_mode		= max77836_ldo_of_map_mode,
   209	};
   210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
