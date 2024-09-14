Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFBF15D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726304093; cv=none; b=P4a3ey10utJ+XXO4FSDfSUPZfr55pqldhCVv3Cu2qBvVMermHslHh4yWZujs7JVpzbQw5itGHzuZZKPXvOuDCA3xyyBsnz2LGkqFYh1RH0g3hpmGiFrY46+Ig6q/wzi3l0kLGcOz+T5LId1i0MtjCtsruqnLR05yAaUZLOf1Q/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726304093; c=relaxed/simple;
	bh=qwAg56FGxjfA5/8uwWH0e8w9OyJHSK14i/v4gBx/RUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhQ28FXch02Xr70kbPpVU2KVVUlmmndV5pdb9YEKpGxefCcXSlF4NAowbXfYdXD+s4FjUrJY7fUDpWxQiv0vMZC28iZlT04tZI0jaJciUKPxkdvPwlKYC0nmcBLzT820QXLfSmJV5px8PdNGGHQtPf1kJBwu3vI4DKyLZxUDpwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6DwQ+7p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6DwQ+7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726304092; x=1757840092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qwAg56FGxjfA5/8uwWH0e8w9OyJHSK14i/v4gBx/RUo=;
  b=O6DwQ+7pb31quil54hgPjhOxocPgauKiaAuxgyQOqSmb50ucy2cVyDGb
   O/qRGm7BST2agO0NZoLKqsI1O8qTayvJmMKet/lIAaO+fxeptR1IXSH0E
   uwJO8kkF4JEaf4JkAXZcqxVCoQ2hwVPo6xjHcbyGBAsgpvFACb8BSJUL8
   XUJrQnFJu+MJYBd4G3cdlCUgw1K4xZQ2TLqLE4ZrEQLXd5U4SSi99VBbV
   6NZRo9Duq9WFZoh4NbXvu2Kcie/uIWBtvfHbDvcnCMQWtW0mGeMcXNPqD
   Y/HwRW6W2Z5JJqPDKZ1AHMkOma1Mvf7r6wNivdTkaFVtEJXBdrAtKp0tP
   g==;
X-CSE-ConnectionGUID: 08z3Hi0dRriXdDyTX2bfPA==
X-CSE-MsgGUID: Pvxws9KsT7WNrdH7EVHiQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="50623302"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="50623302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 01:54:52 -0700
X-CSE-ConnectionGUID: CwQKaOzGTxyAIqdirTJIaA==
X-CSE-MsgGUID: o1ikovGORey2D62YiinoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="67970776"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Sep 2024 01:54:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spOYK-0007YU-1f;
	Sat, 14 Sep 2024 08:54:48 +0000
Date: Sat, 14 Sep 2024 16:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 22/45] drivers/i2c/i2c-core-of-prober.c:214:16:
 warning: assignment to 'struct regulator *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202409141604.8iTm1Wbx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   42c21929aeb3c7ca7b0ce9cacb1d0ff915d3c783
commit: e21fd10d1aa3f6556ed35a5af16f85a9ad14c29a [22/45] i2c: of-prober: Add simple helpers for regulator support
config: i386-buildonly-randconfig-003-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141604.8iTm1Wbx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141604.8iTm1Wbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141604.8iTm1Wbx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/i2c-core-of-prober.c: In function 'i2c_of_probe_simple_get_supply':
   drivers/i2c/i2c-core-of-prober.c:214:18: error: implicit declaration of function 'of_regulator_get_optional'; did you mean 'regulator_get_optional'? [-Werror=implicit-function-declaration]
     214 |         supply = of_regulator_get_optional(dev, node, supply_name);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                  regulator_get_optional
>> drivers/i2c/i2c-core-of-prober.c:214:16: warning: assignment to 'struct regulator *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     214 |         supply = of_regulator_get_optional(dev, node, supply_name);
         |                ^
   cc1: some warnings being treated as errors


vim +214 drivers/i2c/i2c-core-of-prober.c

   197	
   198	static int i2c_of_probe_simple_get_supply(struct device *dev, struct device_node *node,
   199						  struct i2c_of_probe_simple_ctx *ctx)
   200	{
   201		const char *supply_name;
   202		struct regulator *supply;
   203	
   204		/*
   205		 * It's entirely possible for the component's device node to not have regulator
   206		 * supplies. While it does not make sense from a hardware perspective, the
   207		 * supplies could be always on or otherwise not modeled in the device tree, but
   208		 * the device would still work.
   209		 */
   210		supply_name = ctx->opts->supply_name;
   211		if (!supply_name)
   212			return 0;
   213	
 > 214		supply = of_regulator_get_optional(dev, node, supply_name);
   215		if (IS_ERR(supply)) {
   216			return dev_err_probe(dev, PTR_ERR(supply),
   217					     "Failed to get regulator supply \"%s\" from %pOF\n",
   218					     supply_name, node);
   219		}
   220	
   221		ctx->supply = supply;
   222	
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
