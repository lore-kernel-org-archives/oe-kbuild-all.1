Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31021FF46
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980541; cv=none; b=YhJgA2XPAugqllNPAytbxL/1E5WTI4SsUiNW/QhZU00bM5HHn5KOdnCXeLY6IwFahbgXSAnBoZzIKuq8Yz09mBZSWOJhd0+ozpNljpXmqGXUpyptgefyRjoZQhsx17inmkvblqV1CVOA4JV4GBo62rjNZHaZ+pjpeTUC8rtLwuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980541; c=relaxed/simple;
	bh=uZT+ZqYkEzIpgxQu6uKjGBgTFtUhDym2H7X+nO42P5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIi6S5fF0YhLhNum3EMEOMVOHUAO9Zipg8SVs6MqwFVUTWezi8U1kjXwRmL/k+ML4CaXdWTY/9Hmi2d9ASnbg0J2H240o+o/54Lh8z8yX4Zc9sKxuh8UiqFkdg4lmQcVMRg0jQV1xaJY+ZjMKrarXJE2yUeIyz/Y5Igy5Ea2kRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbHmLSuW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbHmLSuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754980539; x=1786516539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZT+ZqYkEzIpgxQu6uKjGBgTFtUhDym2H7X+nO42P5Q=;
  b=CbHmLSuWys+MqySGpIU/QbaR7HbVZh3JpFWts7rrfz/NbFDeXR4KDgpa
   IaCW6IIiv1E/qd3vc2+49bP5k8ub1HNZzAodZYu46oFOBylwSo1UjK23L
   KScgyl8QQTcGUF1sUiULgIcUAA0nNikNEJiBkR1gfsW3wRoMdXWmNNAVW
   QmZp4pQJONZtceU/A+k+7riTlYri1EdcVoPKh+xCzLtQIp+159yAxpFT7
   5pTo5Vi9cwdXUPfeLmyV8bu3X5Lox0STCsXzxOCo6VdsHSgugJT1FCJOK
   bFQqTpfYHpGfXVLGCqzKc3RkA4ieZj9SOotD5bWOGqp6XFR/JTFEsB68Z
   A==;
X-CSE-ConnectionGUID: P68JhMcIR6OBMbO6X7DYkg==
X-CSE-MsgGUID: QUcaJkUrSxOWfdGcDTO0cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67846754"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67846754"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 23:35:36 -0700
X-CSE-ConnectionGUID: 0GenSXyBT6W1CUWhagzqew==
X-CSE-MsgGUID: eYEL3f5YS5mD1BVZb+SG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170559194"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Aug 2025 23:35:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulibR-0006TM-00;
	Tue, 12 Aug 2025 06:35:25 +0000
Date: Tue, 12 Aug 2025 14:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20250731_joy_zou_regulator_add_new_pmic_pf0900_support
 2/2] drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol
 'regu_irqs' was not declared. Should it be static?
Message-ID: <202508121440.t5Wog2rG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20250731_joy_zou_regulator_add_new_pmic_pf0900_support
head:   162e23657e5379f07c6404dbfbf4367cb438ea7d
commit: 162e23657e5379f07c6404dbfbf4367cb438ea7d [2/2] regulator: pf0900: Add PMIC PF0900 support
config: alpha-randconfig-r122-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121440.t5Wog2rG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250812/202508121440.t5Wog2rG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121440.t5Wog2rG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol 'regu_irqs' was not declared. Should it be static?

vim +/regu_irqs +774 drivers/regulator/pf0900-regulator.c

   773	
 > 774	struct pf0900_regulator_irq regu_irqs[] = {
   775		PF0900_REGU_IRQ(PF0900_REG_SW_ILIM_INT, PF0900_SW, REGULATOR_ERROR_OVER_CURRENT_WARN),
   776		PF0900_REGU_IRQ(PF0900_REG_LDO_ILIM_INT, PF0900_LDO, REGULATOR_ERROR_OVER_CURRENT_WARN),
   777		PF0900_REGU_IRQ(PF0900_REG_SW_UV_INT, PF0900_SW, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   778		PF0900_REGU_IRQ(PF0900_REG_LDO_UV_INT, PF0900_LDO, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   779		PF0900_REGU_IRQ(PF0900_REG_SW_OV_INT, PF0900_SW, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   780		PF0900_REGU_IRQ(PF0900_REG_LDO_OV_INT, PF0900_LDO, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   781	};
   782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
