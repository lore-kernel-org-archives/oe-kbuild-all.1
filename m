Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0891D18C03B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278644; cv=none; b=b4jYVnMmWtPGpYboHmiUoBsoXMpERw1pUeXJRgZzpmOqeYstfwsZr69rTuzeOyUxua0/EYxIXJomvLcroXVckrB4aHbvmA6bdcSxPkNpusv0oBvhe4Tj3BQlXZsM9q+9bS2k2gOPzsSaNGBO0+wJ3DNPg4P0HSm6bniiPegXIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278644; c=relaxed/simple;
	bh=QCVc9Bm3Cj8QW92AQAh44QmDM6/6Z/8K5DFRA24PAqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aL5UoEmEdsz92MuhBXEJsRQxEjS2F6/WdY7J9H/+1VDo6c6bTcRNjMkrNWVb3rXdAdydPD9WwRyRm2uItv3EjpiRukjqKEEh8NhWzlyzekmFBLH+dQz+EUYJj4XMbehdUMl2YXw9nRs52egCPQrnSsYxLXfm6UFnscB2vvFTwGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxjpeUPW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxjpeUPW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736278641; x=1767814641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QCVc9Bm3Cj8QW92AQAh44QmDM6/6Z/8K5DFRA24PAqM=;
  b=bxjpeUPWgIvZAogVw4mrHaAbEP3dfrA5dp0LtJbgJUHhPOtpE5JhLOq5
   rgbSmtDpUznQW7ruD0S/+ki97EzwqwxpNPJboyf6abuRBQQfHCbsKqDVU
   hwiKMmORW4msa3rssBq1J0ie+7LvbSFcDGBQumRlNw7LFsp19jenJLc+U
   grt6hxozFyIFR+g5607RtsNZAPXGUrOF8dd24Bc106E7r31mIkE4NqNkq
   FdhxC6EUAUyN5Fl2CLhQm9/niUfz0IE38j1K4clbINyaT/Dftx4sMgr65
   OpBipWDzlMDG12ODgAoXnTnMHzVcobO6piSgxdE8GwpdtF5Cf76/B/wrG
   w==;
X-CSE-ConnectionGUID: 19n4ingIQgWk7jPBH01hGg==
X-CSE-MsgGUID: cR+K03pgTjSF+tJaAxGVaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36700658"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36700658"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 11:37:20 -0800
X-CSE-ConnectionGUID: oB8VJKDNR2KTj4CyuQ8N3w==
X-CSE-MsgGUID: veUYcUAyRq+TrtnFEi/Q1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103366314"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jan 2025 11:37:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVFO8-000F91-32;
	Tue, 07 Jan 2025 19:37:16 +0000
Date: Wed, 8 Jan 2025 03:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 34/74]
 drivers/pps/clients/pps-gpio.c:66:47: error: incompatible type for argument
 1 of '_dev_warn'
Message-ID: <202501080313.MmWpjmSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   daec45916d68bc14406f20f547a8c39a3eab88b3
commit: 8aa0545f419e5bffbb27354e0221997cb6e87cbd [34/74] pps: clients: gpio: Bypass edge's direction check when not needed
config: arm-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080313.MmWpjmSe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080313.MmWpjmSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080313.MmWpjmSe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pps/clients/pps-gpio.c:17:
   drivers/pps/clients/pps-gpio.c: In function 'pps_gpio_irq_handler':
>> drivers/pps/clients/pps-gpio.c:66:47: error: incompatible type for argument 1 of '_dev_warn'
      66 |                 dev_warn_ratelimited(info->pps->dev, "IRQ did not trigger any PPS event\n");
         |                                      ~~~~~~~~~^~~~~
         |                                               |
         |                                               struct device
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:215:17: note: in expansion of macro 'dev_warn'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                 ^~~~~~~~~
   include/linux/dev_printk.h:227:9: note: in expansion of macro 'dev_level_ratelimited'
     227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/pps/clients/pps-gpio.c:66:17: note: in expansion of macro 'dev_warn_ratelimited'
      66 |                 dev_warn_ratelimited(info->pps->dev, "IRQ did not trigger any PPS event\n");
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:52:37: note: expected 'const struct device *' but argument is of type 'struct device'
      52 | void _dev_warn(const struct device *dev, const char *fmt, ...);
         |                ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/_dev_warn +66 drivers/pps/clients/pps-gpio.c

    39	
    40	/*
    41	 * Report the PPS event
    42	 */
    43	
    44	static irqreturn_t pps_gpio_irq_handler(int irq, void *data)
    45	{
    46		const struct pps_gpio_device_data *info;
    47		struct pps_event_time ts;
    48		int rising_edge;
    49	
    50		/* Get the time stamp first */
    51		pps_get_ts(&ts);
    52	
    53		info = data;
    54	
    55		/* Small trick to bypass the check on edge's direction when capture_clear is unset */
    56		rising_edge = info->capture_clear ?
    57			      gpiod_get_value(info->gpio_pin) : !info->assert_falling_edge;
    58		if ((rising_edge && !info->assert_falling_edge) ||
    59				(!rising_edge && info->assert_falling_edge))
    60			pps_event(info->pps, &ts, PPS_CAPTUREASSERT, data);
    61		else if (info->capture_clear &&
    62				((rising_edge && info->assert_falling_edge) ||
    63				(!rising_edge && !info->assert_falling_edge)))
    64			pps_event(info->pps, &ts, PPS_CAPTURECLEAR, data);
    65		else
  > 66			dev_warn_ratelimited(info->pps->dev, "IRQ did not trigger any PPS event\n");
    67	
    68		return IRQ_HANDLED;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
