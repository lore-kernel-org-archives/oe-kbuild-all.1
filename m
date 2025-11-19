Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8B13538A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570660; cv=none; b=pl10I+o9P9If+MaKwiCFSQ6ztTHKvu/oFAnUEeTfgaqC7lxH0FSFOlk6VApTZFmlspogvxhhYCeP/JPXK+lEEszjJx3SL4V0Ifdqzzc0657Oer6VveNn/R365g9iJcUDSy4ErRQ/1z2i88fstIwIwmTGjdj6WuCFNwgXteFgoBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570660; c=relaxed/simple;
	bh=JW+wap/krm+K5UkGuxILt6jdebzJPVk291A6W/hbVUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOPmSR4ZMAIkU67SIeTZkTnDVr0tKawxgiDQ7k1tImq9c9eWggS7j7K9x4hidlxoKV3NqwKi8lvMrvZ6zHX2pkp/wljolFQdcKnB98QXnG0NqaFTt78agaZTg5F2fbGgiH0/gltVP/ET+85rHb62rpAzKat/ZNOOCYDXk/PyaHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2YwGeE2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2YwGeE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763570659; x=1795106659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JW+wap/krm+K5UkGuxILt6jdebzJPVk291A6W/hbVUc=;
  b=A2YwGeE2gaX8nmugyFEIfgN0s/9KkeyjVgW3NbuhFobZqEBIuFM6uK2o
   cERvKfLF1SAdpBGwk2xaBW6mrwF09rzqf1GFHFBasSGTA7b4+KJcq9ND/
   cBtMAdrgsWI/S+e/+WKKeYsPeEMpgbF2OUJluihwB+2m4npg9FEfV+yLd
   tlWk/nYqTPF86y0RoJdF1ILOMq15pAM12yTigkhpkV3mxu83fMfbiXkrn
   0XDDhULTP7mDC22jUzd7yvBKo2+2RE8ybLHbZdKO31Zzjuf08deRjGPXe
   hAxYSqrzJ/EsJsmbnGGEz1LnUQROi9jQRSAbRN0H6CCcN8uoDJ2Urv1Mh
   A==;
X-CSE-ConnectionGUID: LBszjJ7ZTLmZecdq+uDTcQ==
X-CSE-MsgGUID: qkI3+8K+TKm5h1+z1UeOuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77085716"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77085716"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 08:44:12 -0800
X-CSE-ConnectionGUID: fJUsnbo1QPm+LRmhoVv0mA==
X-CSE-MsgGUID: 7l2oVOC4Qt2DQMh1ap14Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228435269"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 08:44:11 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLlHt-00035r-07;
	Wed, 19 Nov 2025 16:44:09 +0000
Date: Thu, 20 Nov 2025 00:43:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine
 lookup
Message-ID: <202511200043.AUTK7uH5-lkp@intel.com>
References: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843@linaro.org>

Hi Bartosz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fe4d0dea039f2befb93f27569593ec209843b0f5]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-support-undefined-GPIO-machine-lookup/20251119-233054
base:   fe4d0dea039f2befb93f27569593ec209843b0f5
patch link:    https://lore.kernel.org/r/20251119-cs42l43-gpio-lookup-v1-1-029b1d9e1843%40linaro.org
patch subject: [PATCH RFT/RFC 1/2] gpiolib: support "undefined" GPIO machine lookup
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511200043.AUTK7uH5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200043.AUTK7uH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200043.AUTK7uH5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpio/gpiolib.c: In function 'gpiod_find':
>> drivers/gpio/gpiolib.c:4560:39: error: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
    4560 |                 if (p->key == PTR_ERR(-ENOENT))
   In file included from include/linux/cleanup.h:6,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/gpio/gpiolib.c:3:
   include/linux/err.h:63:61: note: expected 'const void *' but argument is of type 'int'
      63 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
>> drivers/gpio/gpiolib.c:4560:28: warning: comparison between pointer and integer
    4560 |                 if (p->key == PTR_ERR(-ENOENT))
         |                            ^~


vim +/PTR_ERR +4560 drivers/gpio/gpiolib.c

  4536	
  4537	static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
  4538					    unsigned int idx, unsigned long *flags)
  4539	{
  4540		struct gpio_desc *desc = ERR_PTR(-ENOENT);
  4541		struct gpiod_lookup_table *table;
  4542		struct gpiod_lookup *p;
  4543		struct gpio_chip *gc;
  4544	
  4545		guard(mutex)(&gpio_lookup_lock);
  4546	
  4547		table = gpiod_find_lookup_table(dev);
  4548		if (!table)
  4549			return desc;
  4550	
  4551		for (p = &table->table[0]; p->key; p++) {
  4552			/* idx must always match exactly */
  4553			if (p->idx != idx)
  4554				continue;
  4555	
  4556			/* If the lookup entry has a con_id, require exact match */
  4557			if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
  4558				continue;
  4559	
> 4560			if (p->key == PTR_ERR(-ENOENT))
  4561				return ERR_PTR(-ENOENT);
  4562	
  4563			if (p->chip_hwnum == U16_MAX) {
  4564				desc = gpio_name_to_desc(p->key);
  4565				if (desc) {
  4566					*flags = p->flags;
  4567					return desc;
  4568				}
  4569	
  4570				dev_warn(dev, "cannot find GPIO line %s, deferring\n",
  4571					 p->key);
  4572				return ERR_PTR(-EPROBE_DEFER);
  4573			}
  4574	
  4575			struct gpio_device *gdev __free(gpio_device_put) =
  4576						gpio_device_find_by_label(p->key);
  4577			if (!gdev) {
  4578				/*
  4579				 * As the lookup table indicates a chip with
  4580				 * p->key should exist, assume it may
  4581				 * still appear later and let the interested
  4582				 * consumer be probed again or let the Deferred
  4583				 * Probe infrastructure handle the error.
  4584				 */
  4585				dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
  4586					 p->key);
  4587				return ERR_PTR(-EPROBE_DEFER);
  4588			}
  4589	
  4590			gc = gpio_device_get_chip(gdev);
  4591	
  4592			if (gc->ngpio <= p->chip_hwnum) {
  4593				dev_err(dev,
  4594					"requested GPIO %u (%u) is out of range [0..%u] for chip %s\n",
  4595					idx, p->chip_hwnum, gc->ngpio - 1,
  4596					gc->label);
  4597				return ERR_PTR(-EINVAL);
  4598			}
  4599	
  4600			desc = gpio_device_get_desc(gdev, p->chip_hwnum);
  4601			*flags = p->flags;
  4602	
  4603			return desc;
  4604		}
  4605	
  4606		return desc;
  4607	}
  4608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
