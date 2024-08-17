Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14051C27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 00:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723853749; cv=none; b=rDWJKdTi+s7E2fP8RlbDx4f2wlx6FgKxi1mouynDTSlslGdFbMWGO9DZsPPYarfmCTqOczYSAccA1oTfHeXryUquwRHEkIkNYFpZVWFb/ZS9LUflJjXfejnSB5XJNkZ8czaOE6ZSOZ3aaGXzMZCInmcYGdzDeICkPx2Lt+HINO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723853749; c=relaxed/simple;
	bh=3bZ4b3rNqSIzNj97d/7MF7OYM1XKcoIDSsRbga+VupM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1JtWSQL2eyLvwn0Q0+X+4rP5wm++sUsPzxdcPU6fcgNV+55WPah27uQwnTgg3SgftnjCUIIW12msWkildpRKj/bOBcxK7I3ukGsmn2W9Zv8PqJSGydnTLO+jbl24B0oaewWjXXIUzowH52B+gFt4J4t/Sm9kz36hgXfu2ZMu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tl7PA+f9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tl7PA+f9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723853747; x=1755389747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3bZ4b3rNqSIzNj97d/7MF7OYM1XKcoIDSsRbga+VupM=;
  b=Tl7PA+f9dcVN0UYzpOvuCil0Yg3FQ1BR1FIA+aeyixxPzVAhwYoYT9rs
   TTlg6ZuuGkmS4wrb1ZGR66l8/LlzdAmA+D1nCfpZoVNN52Rvy8rTowtxw
   CB77lb3wbg/DQBuCZDtB8k4N9KnwrVbr9Fc/2QFEYxbzvRdY2JwOOgcq8
   5cHzwzQ8t8qM5v7IMFxTcObCTiAw7blUi3murc0N4V/FtrwjO3wH0sz8a
   XBFtZL9ZJv7TYj1gjEiUYITHiQtlqMeR8sSCpLX8qEQ/4RBGcCIaOQJAy
   nas/WswfTlnHd+OXCcjcA3keqhJR0lVO8epx8fFnEGJtgx2tGVBkeoeWf
   g==;
X-CSE-ConnectionGUID: z3nLC1ZKQ1ilieuuQffaRw==
X-CSE-MsgGUID: Entj4Rk+ScOXJpvFBhTtDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32737338"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="32737338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 17:15:22 -0700
X-CSE-ConnectionGUID: qHtpNhyzQYuZqIwaCH5dGg==
X-CSE-MsgGUID: xp7FHasQSoOWgxvBylfJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="60097474"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Aug 2024 17:15:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf76E-00073C-02;
	Sat, 17 Aug 2024 00:15:18 +0000
Date: Sat, 17 Aug 2024 08:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
Message-ID: <202408170954.uH9BvYNE-lkp@intel.com>
References: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Replace-a-while-loop-by-for-loop/20240817-011616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240816171225.3506844-6-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408170954.uH9BvYNE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170954.uH9BvYNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170954.uH9BvYNE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-platdrv.c:480:36: warning: 'dw_i2c_acpi_match' defined but not used [-Wunused-const-variable=]
     480 | static const struct acpi_device_id dw_i2c_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~


vim +/dw_i2c_acpi_match +480 drivers/i2c/busses/i2c-designware-platdrv.c

   479	
 > 480	static const struct acpi_device_id dw_i2c_acpi_match[] = {
   481		{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
   482		{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
   483		{ "AMD0010", ACCESS_INTR_MASK },
   484		{ "AMDI0010", ACCESS_INTR_MASK },
   485		{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
   486		{ "AMDI0510", 0 },
   487		{ "APMC0D0F", 0 },
   488		{ "HISI02A1", 0 },
   489		{ "HISI02A2", 0 },
   490		{ "HISI02A3", 0 },
   491		{ "HYGO0010", ACCESS_INTR_MASK },
   492		{ "INT33C2", 0 },
   493		{ "INT33C3", 0 },
   494		{ "INT3432", 0 },
   495		{ "INT3433", 0 },
   496		{}
   497	};
   498	MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
