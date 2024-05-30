Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05C17BA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 02:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717035718; cv=none; b=D66IgRMO2DrAJ3GF45X1KKCJtrATDNeKAxABa0Gt+Y4MYU5veOqBEBBhtGM1eGkb1/hWtD+nlrlhad3bQSNJSuAEwdNAX3sQ1tFDbQl5u97eFHg/RppNPVaA8LWODJLABetBITKF5OIg45VhsxeUEXLwlidCt44xHBYVUQjcZoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717035718; c=relaxed/simple;
	bh=c/0rFJ/1a2FRzC6s/0ld+RSY4aspkThm8rPDUTbEDAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7GEbNA+S6q4UmjyJf1pG26FfnH0t7nITDyflWlQkQB9IneR+d1gSo9Y221RZiruU0cYn56NWX5lkNhOvewkNkC6tIUHusgX6DI5TlE6GN3nEcgfYZ8Vr+DfmLwQfVrSsIjwXqq2FrGuy+91OeowVBod78fceLKdana/FW8huqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZoEdVQB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZoEdVQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717035717; x=1748571717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/0rFJ/1a2FRzC6s/0ld+RSY4aspkThm8rPDUTbEDAQ=;
  b=NZoEdVQB4aI2U4/ku8lWS82NFWDqwkGznu3nl/BtQVvxoIuT1k1fB+qt
   6rZ1yT9hX7txx7N/tAbmU3E5f4UOo440hdDCwlmRoQNATwuacggDtKGrj
   i6uANMC9JhbflYZKkrp4ZoZBNF8+FPwDY+jD25U+wzPj1bzA8qgmP8npq
   5wOnT3s0/ZINcrS/VhkLJxD5nktFnCTPGKRthTBOOPghOVbB1+Tr4f+kv
   SWx/qWkgtuViyhW+UFaxKvidmbjCw1+otCPRZ2GqDAyJt9rkzbGttg3vf
   duNVU6z4gZXxvDAEILQDIxjp0r8moVOPPbnohE615abWy3MaiRr1DXgQ5
   Q==;
X-CSE-ConnectionGUID: wq3VnMUQTnK4LUnqlcaEjg==
X-CSE-MsgGUID: roojBzKzRAOJNHFn3QDEIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24891870"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24891870"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 19:21:56 -0700
X-CSE-ConnectionGUID: H+d185e5RO2Rq+dzi75B5g==
X-CSE-MsgGUID: hjgmDaKURMWnrgTTf1dc6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40112777"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2024 19:21:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCVQO-000ES7-2B;
	Thu, 30 May 2024 02:21:52 +0000
Date: Thu, 30 May 2024 10:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 6/14] drivers/gpio/gpio-mpfs.c:191:23: sparse: sparse:
 symbol 'mpfs_gpio_irqchip' was not declared. Should it be static?
Message-ID: <202405301052.y2iKHvCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   1702b264eba78dd4b382c188937b72327cda2e1c
commit: 9ae5df76283b0b1d5bddbd6e0b7152c6372ea64a [6/14] gpio: mpfs: pass gpio line number as irq data
config: openrisc-randconfig-r111-20240530 (https://download.01.org/0day-ci/archive/20240530/202405301052.y2iKHvCE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240530/202405301052.y2iKHvCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301052.y2iKHvCE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-mpfs.c:191:23: sparse: sparse: symbol 'mpfs_gpio_irqchip' was not declared. Should it be static?

vim +/mpfs_gpio_irqchip +191 drivers/gpio/gpio-mpfs.c

   190	
 > 191	const struct irq_chip mpfs_gpio_irqchip = {
   192		.name = "MPFS GPIO",
   193		.irq_set_type = mpfs_gpio_irq_set_type,
   194		.irq_mask = mpfs_gpio_irq_mask,
   195		.irq_unmask = mpfs_gpio_irq_unmask,
   196		.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
   197		GPIOCHIP_IRQ_RESOURCE_HELPERS,
   198	};
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
