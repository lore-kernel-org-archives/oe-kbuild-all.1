Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AD238F91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288616; cv=none; b=qMLVi5hG8cHBscbBZG/sEEu4sopcUR79DXg+fUYTnVxOE2gnQga3iL8Mcw5RoKpCd0Fe6rA6LkOy+cQgDGP8gybO5WGyI1JQFqi7QFNOEi4W2vgB5q1sZBxOe3Iwqs32OZfyqxSy0d3V1xwMaltTGBVhwf685QKNvTivd0ODP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288616; c=relaxed/simple;
	bh=cTEZjh8VwU/41ytw447//ocxy+lx4oYgmFPylVkKQoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V68Jcqzm9wpsXT+2EwPe9JXf9z3MhyZLgzllOrThbF3b0Co3+VEMVHVAhyD5oGHzrO/nJQAD03v9e0/3IiLifUvnbyRNh/7vZqIfbPU/SvdkOqjGwyAckTqVKF0V/nx2zZMkegtO+qx8Ve3JNY1smwfIxxOxvpH6Z75fSVkRj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3qoAeRi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3qoAeRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748288614; x=1779824614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cTEZjh8VwU/41ytw447//ocxy+lx4oYgmFPylVkKQoI=;
  b=e3qoAeRihoAmugAeUtH8lxaouShzJJOewBOHwKkeooyx5PSh85EB+Qpc
   QCtBRjoET7wWTZOx2yduvbPL9PD8qk5SOzhLumqOWv4DmEimR71iYVkZY
   0ivWkVCVIHeMJlft/ZrXqk3NWIDq26OtUlmP2cee0ELTHBao9SS1G35AD
   kIq4tlFp5qQ+cDeCcNAVxuAA94FCqBzVvoTAUoThPX+BpZHhxbqPF6puZ
   3UNQ9/WMCCMP52TqTxUPTcefLHa2tDZbR40Jp6lwOueuyiL+SANQTfnSf
   7mU9KOFz/ZKys7cfN4KcPs2xLzO3yxEeSnN/1cA90C0XV9oqnjij75cKA
   g==;
X-CSE-ConnectionGUID: cSJFo5ThThu80qUPudZJJw==
X-CSE-MsgGUID: O7VzFcjHRLWO4gJvCpOspg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53925029"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="53925029"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 12:43:33 -0700
X-CSE-ConnectionGUID: nz4G+YKFRKCYHIUK8nsZoA==
X-CSE-MsgGUID: O3xuK29cSReWpa9KOlcXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="147512459"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2025 12:43:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJdjO-000SgY-0Y;
	Mon, 26 May 2025 19:43:30 +0000
Date: Tue, 27 May 2025 03:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1652/1652]
 drivers/gpio/gpio-phytium-core.c:346:5: sparse: sparse: undefined
 preprocessor identifier 'CONFIG_SMP'
Message-ID: <202505270343.9khwGBNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5ae76523ccf96ec8b8d73d541e305bf15b6b697e
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [1652/1652] gpio: add phytium gpio driver
config: x86_64-randconfig-122-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270343.9khwGBNH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270343.9khwGBNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270343.9khwGBNH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-phytium-core.c:346:5: sparse: sparse: undefined preprocessor identifier 'CONFIG_SMP'
   drivers/gpio/gpio-phytium-core.c:346:5: warning: "CONFIG_SMP" is not defined, evaluates to 0 [-Wundef]
     346 | #if CONFIG_SMP
         |     ^~~~~~~~~~

vim +/CONFIG_SMP +346 drivers/gpio/gpio-phytium-core.c

   345	
 > 346	#if CONFIG_SMP
   347	int
   348	phytium_gpio_irq_set_affinity(struct irq_data *d,
   349					const struct cpumask *mask_val, bool force)
   350	{
   351		struct gpio_chip *chip_data = irq_data_get_irq_chip_data(d);
   352		struct irq_chip *chip = irq_get_chip(chip_data->irq.num_parents);
   353		struct irq_data *data = irq_get_irq_data(chip_data->irq.num_parents);
   354	
   355		if (chip && chip->irq_set_affinity)
   356			return chip->irq_set_affinity(data, mask_val, force);
   357	
   358		return -EINVAL;
   359	}
   360	EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_affinity);
   361	#endif
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
