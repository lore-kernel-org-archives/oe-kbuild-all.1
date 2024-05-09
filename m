Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFA77BB12
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298092; cv=none; b=QQuFy3j7ylhJMdB4khtE/SriZiFOeQFR+S//9H97uuwE3P0TBBzoviHPq50zSEHMBsv9WXBoi8pJaLXDmj2rLejmM1n7EyACK3RuJtHpRTawVqmKzHn4p6s++GHyIekPStM2ADczeRAys0ElrENdkJTNUStjJr2Vz/Nu0+IWRdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298092; c=relaxed/simple;
	bh=znEBaFet0EUKnW6DeF75wRYAOvn+cw3D1XHGyJcDF2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q4un2tv5tep0NJCwv3q6dbVTm9hGghPCdnjc5qv1xOHSHDW/wuSksD+76/l3bn8f3s9I1P7FhCw0OSjldDI135SoMkfzqiUYuXQwHL8DRMH8cpYcFd2nvWUxHKhTk2X0N0UMSosO76+fTzTLeJ2ybJqPd3Hgwj8V1YOT4rzCK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHZyXkAj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHZyXkAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715298091; x=1746834091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znEBaFet0EUKnW6DeF75wRYAOvn+cw3D1XHGyJcDF2o=;
  b=mHZyXkAjb1jFNijgAc8o+ufmlRPVVZ1Wv/7xPVpNA2jkl04t8yb174KQ
   mG2UfpPWZYX8Pctws3JkfwYlyyYQh8kgDD6VuDVRVE/Zsw16aLQcHw7Ea
   7ZtNxm7ND3spF7/KnpB9RvChnGBNO+Yx1K40JLYpvAZLPmkmU4wWxVJ1K
   tPDOi3D8AXMizQkQDAJFRqVf/42Ovw2SGfun2e0jcB/hIjK2o6VgFyUVV
   RjVAEor1xsoKJXWf6PT3wszP/NRLS7eBIlnypYMx9abPdpE8oBTXd1G4p
   Q0VKJuVs1PDJMoZFoycs7wbnGicLkvZ3aZsVIC1yZYRqWLoo0jgAAFnz7
   g==;
X-CSE-ConnectionGUID: vNfd+X2IRtK+KP35kSdEVQ==
X-CSE-MsgGUID: sl4xuICyS7unLhQWFDwOxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14206953"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="14206953"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 16:41:30 -0700
X-CSE-ConnectionGUID: ofSPgE/cR3OcmsiL0p/NKA==
X-CSE-MsgGUID: UHqViTSWRHGOh7rqsSuM8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="29483802"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2024 16:41:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5DOA-0005Uf-2a;
	Thu, 09 May 2024 23:41:26 +0000
Date: Fri, 10 May 2024 07:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:qwip 12/15] drivers/gpio/gpio-mpfs.c:209:22: warning: unused
 variable 'irq'
Message-ID: <202405100710.NLaOfsa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   520f2563214599bc3abdd1aa6f127f67e084e65f
commit: 92e2da2f671866ae934e08c8e1e31e50d77729b7 [12/15] gpio: mpfs: pass gpio line number as irq data
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405100710.NLaOfsa7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100710.NLaOfsa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100710.NLaOfsa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-mpfs.c: In function 'mpfs_gpio_irq_handler':
>> drivers/gpio/gpio-mpfs.c:209:22: warning: unused variable 'irq' [-Wunused-variable]
     209 |         unsigned int irq;
         |                      ^~~
>> drivers/gpio/gpio-mpfs.c:207:26: warning: unused variable 'child_desc' [-Wunused-variable]
     207 |         struct irq_desc *child_desc;
         |                          ^~~~~~~~~~


vim +/irq +209 drivers/gpio/gpio-mpfs.c

   199	
   200	static void mpfs_gpio_irq_handler(struct irq_desc *desc)
   201	{
   202		struct irq_chip *irqchip = irq_desc_get_chip(desc);
   203		void *handler_data = irq_desc_get_handler_data(desc);
   204		struct gpio_chip *gc = irq_data_get_irq_chip_data(&desc->irq_data);
   205		struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
   206		u8 gpio_index = *((u8 *)handler_data);
 > 207		struct irq_desc *child_desc;
   208		unsigned long status;
 > 209		unsigned int irq;
   210	
   211		/*
   212		 * Since the parent may be a muxed/"non-direct" interrupt, this
   213		 * interrupt may not be for us.
   214		 */
   215		status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
   216		if (!(status & BIT(gpio_index)))
   217			return;
   218	
   219		chained_irq_enter(irqchip, desc);
   220	
   221		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, gpio_index));
   222		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
   223	
   224		chained_irq_exit(irqchip, desc);
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
