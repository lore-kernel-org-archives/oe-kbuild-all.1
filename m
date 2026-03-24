Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25B3909A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774322393; cv=none; b=nC7DvuWaZBaB3YgSvV/WgDfLx5FjSsqDk9WB7avA/ef1QjVGR9zNZZg8djAWnyxTfBnLRZz2mg7R3ZPSgcu998yTwSXysTJOSSVL2UImAdsPazgEX6oN1K5B16SHQ7NbnY2V6NYhI3Lj39zbNwCVMwmhmusjOcBHY4O/N7bhLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774322393; c=relaxed/simple;
	bh=Kqn1ZHmxgJQK1N+SWDxlzSRoZ4itD+LIqHWAZDu+VVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rryQbS6tSjjcz4SZ7AaDV+iPmaASvI6vrKEJYm3HbsXO5UZ96JthXj6xpZ5oOwxJRpi72NjdbMYhNH7QzfA9NcFFhWhdNSKfdSxkK+OlOE5FBMS7PKIsI2/P3YfCmqFYHcBxfAGspG8YvSy9m6xdY5J08k34tGHPflrAork+Pug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGaANlYm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGaANlYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774322391; x=1805858391;
  h=date:from:to:cc:subject:message-id;
  bh=Kqn1ZHmxgJQK1N+SWDxlzSRoZ4itD+LIqHWAZDu+VVs=;
  b=iGaANlYm8PpwgeDjmvKPNTBtMjDo6O0hsKkKX2/N7yD8ZCR5QAALwlwT
   Q69d6Nckx4I1D0QfOh69L9CmNogscpirVl3i7eCBDbH+iHwUI8DnKbPNE
   3ZHGbrdG499qWjL3UjMcX0AgbN4vLtDcOsBJLFNjGgZUgFiTOlYDGGzMc
   ZD1cryrVcl6KZ7GhFIMjGFGEfRB/W0R79XJnuAdQmIP8PncKsXsAL7//0
   J8+1ZKpBNNnbiCKnOBhc/45gRweBTKcHK5ZA8QVLq0g/FhA077o/xYRDn
   UDkZOGG9nrORi4GCtbRhKcpSpyfh/fnzoS3CpkPUjFfA01NcFI0rmUHKm
   A==;
X-CSE-ConnectionGUID: Gkp26C8QQkClH43gEnDJTQ==
X-CSE-MsgGUID: gKhhh4bSR6O3cz0oI6q+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86700615"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86700615"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 20:19:50 -0700
X-CSE-ConnectionGUID: Gh0usI9BR3GK0LvGvRbdYQ==
X-CSE-MsgGUID: jc/rTO40QNSfZFrsSr4quw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228710826"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 20:19:49 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4sIz-000000003j7-2JSj;
	Tue, 24 Mar 2026 03:19:45 +0000
Date: Tue, 24 Mar 2026 11:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/irqchip/irq-meson-gpio.c:125:34: warning: unused variable
 'meson_irq_gpio_matches'
Message-ID: <202603241120.ZJiYrPdK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Neil,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   4245ca9177fc8433bf9e3dd66b5fbbec23250334
commit: 95d5435480680dc25fa85a8b47d2ef4a5c086ba3 [0/1] FROMLIST: irqchip: irq-meson-gpio: make it possible to build as a module
config: x86_64-buildonly-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241120.ZJiYrPdK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241120.ZJiYrPdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241120.ZJiYrPdK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-meson-gpio.c:125:34: warning: unused variable 'meson_irq_gpio_matches' [-Wunused-const-variable]
     125 | static const struct of_device_id meson_irq_gpio_matches[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/meson_irq_gpio_matches +125 drivers/irqchip/irq-meson-gpio.c

8f78bd62bdd7a7 Qianggui Song       2019-12-16  124  
215f4cc0fb2086 Jerome Brunet       2017-09-18 @125  static const struct of_device_id meson_irq_gpio_matches[] = {
4e4cb1b183d6e9 Martin Blumenstingl 2017-10-30  126  	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  127  	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  128  	{ .compatible = "amlogic,meson-gxbb-gpio-intc", .data = &gxbb_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  129  	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
868c4e07533c67 Yixun Lan           2018-04-08  130  	{ .compatible = "amlogic,meson-axg-gpio-intc", .data = &axg_params },
c64a9e804ccf86 Xingyu Chen         2019-06-08  131  	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
b2fb4b77994abc Jerome Brunet       2019-08-29  132  	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
8f78bd62bdd7a7 Qianggui Song       2019-12-16  133  	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
215f4cc0fb2086 Jerome Brunet       2017-09-18  134  	{ }
215f4cc0fb2086 Jerome Brunet       2017-09-18  135  };
215f4cc0fb2086 Jerome Brunet       2017-09-18  136  

:::::: The code at line 125 was first introduced by commit
:::::: 215f4cc0fb208665dd15a524ec57edf4d7e215e6 irqchip/meson: Add support for gpio interrupt controller

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
