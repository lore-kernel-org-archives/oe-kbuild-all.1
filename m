Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B7281366
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758920387; cv=none; b=JVrZHjPZVkPvdn0FDtkWI+YGUl8xg/N4IiKY0LJ1bcIRSMsIYLdCUpBzhKUyVv+FgCZgINarJyqe3739I5GKRR3tEKmEfdofiZ6CwgIJoGNECLlK+u0hP4T3oijW6cCyaVeIrw2vv2zAC8XbcV/zNahBwfFpHsD8ehbLxVpRlpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758920387; c=relaxed/simple;
	bh=5ShXEXdq0SADyJdekc7MQj0W+eQwAb2eRszFpmFWIvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6FgwNAXSUOWvMtELN4ETDfYPOLU34MhSYKnODnQxESGClggvX+llSYkWjO+KpB/qyHBA/Oa0Gt9umHvBxarfF0wFj4G8Xx0cZ0GMQKgaQqRf1XS68rzBTR4UehXVvT/CBBiBpO5E9OVlNhl0iZcvoE8tF6lqYwbtm42rAssROI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmKPTZEW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmKPTZEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758920385; x=1790456385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ShXEXdq0SADyJdekc7MQj0W+eQwAb2eRszFpmFWIvc=;
  b=nmKPTZEW4YlVNG5zLVEU82D5JZxd8hUMng4S9OpQirLrQpqJCwjPhy0m
   Gc/rUw0V0I4oRuZiY4bxhufnGVBlOz7rcCFATyBt7mbfpXg4+HOJqq8XL
   aSf3UDTDCRh/u3O3bOV8TwNW57bArBB4DEiqELfaaEc46Ar8umJI4IHuU
   7KjvGrD9iiFdvPEkbgp6TAI8zGusglPRpGjGmIrD/LUyx/+wbHzVatR/J
   7jWu+t9RPWjg2HUyN5FQg/Z7MiXEENjx+4X5ioB3JrtSmhXAybC3vtW2O
   zDqk7AwA/g5FtAqMOC89GBG6lVQlGaAapcEuXbdVO1k7S2bTEnm7G8qs4
   g==;
X-CSE-ConnectionGUID: TNCcfxo1Rr+1O1n1aRHKGA==
X-CSE-MsgGUID: wsIPyihhRemUPPyAjq845w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61213292"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61213292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 13:59:45 -0700
X-CSE-ConnectionGUID: PTauouoETHSdKZXYanxbIA==
X-CSE-MsgGUID: TakWQswXSXaoS8dGzKTmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="176983068"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2025 13:59:42 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2FXY-0006b9-0M;
	Fri, 26 Sep 2025 20:59:40 +0000
Date: Sat, 27 Sep 2025 04:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Joan-Na-adi <joan.na.devcode@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Joan Na <joan.na@analog.com>
Subject: Re: [PATCH 2/3] regulator: max77675: Add MAX77675 regulator driver
Message-ID: <202509270412.dpXeCSVU-lkp@intel.com>
References: <20250926053757.480086-3-joan.na@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926053757.480086-3-joan.na@analog.com>

Hi Joan-Na-adi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on robh/for-next linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joan-Na-adi/dt-bindings-regulator-Add-MAX77675-binding-header/20250926-134116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250926053757.480086-3-joan.na%40analog.com
patch subject: [PATCH 2/3] regulator: max77675: Add MAX77675 regulator driver
config: alpha-randconfig-r072-20250927 (https://download.01.org/0day-ci/archive/20250927/202509270412.dpXeCSVU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270412.dpXeCSVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270412.dpXeCSVU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/max77675-regulator.c: In function 'max77675_set_sbb_slew_rate':
   drivers/regulator/max77675-regulator.c:246:18: warning: variable 'value' set but not used [-Wunused-but-set-variable]
     246 |         u8 mask, value;
         |                  ^~~~~
   drivers/regulator/max77675-regulator.c: At top level:
   drivers/regulator/max77675-regulator.c:371:33: warning: initialized field overwritten [-Woverride-init]
     371 |         .list_voltage         = regulator_list_voltage_linear,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/max77675-regulator.c:371:33: note: (near initialization for 'max77675_regulator_ops.list_voltage')
>> drivers/regulator/max77675-regulator.c:783:35: error: 'max77675_of_match' undeclared here (not in a function); did you mean 'max77675_of_parse_cb'?
     783 |                 .of_match_table = max77675_of_match,
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   max77675_of_parse_cb


vim +783 drivers/regulator/max77675-regulator.c

   779	
   780	static struct i2c_driver max77675_regulator_driver = {
   781		.driver = {
   782			.name = "max77675",
 > 783			.of_match_table = max77675_of_match,
   784		},
   785		.probe = max77675_regulator_probe,
   786		.remove = max77675_regulator_remove,
   787		.id_table = max77675_i2c_id,
   788	};
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
