Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431CF510
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442581; cv=none; b=SshEz1sV9qskNwh0oPlPsuUBb6uDY3himjFWszhsHuyMmb5BMl7D/0O+Wln12UeZBn5Yd4E/gbNgdBlR13HEdU7MC7nIL3IWcvDmn9Sn/Ndavh2e94wnkaIHhSS0NzKhj1nu1jAGbeyv1RwV+dr3pZw4BGOpSQ3jcRNwxW6nnpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442581; c=relaxed/simple;
	bh=0NcI3isFf4s9bKClhJQWn0pZWxstPPGoXNun2rXqf/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H482Wn1o3uKmGYJmsHSasmPqLR0kxP9Lma5zhlJ/jEPay/MeDrH2L4IR1m/4t8+xxqC086cPdKUlpLmuLGUoD2xsVQFSXquiJ3Z+N8E9Y7wQDfVnoV+wZJfBl8m2TvaVfUnlNgpUG8ymUi/lRe2IZFipWlgNfELTQKPPzBkdijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ms7MTNDp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ms7MTNDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736442580; x=1767978580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0NcI3isFf4s9bKClhJQWn0pZWxstPPGoXNun2rXqf/Q=;
  b=Ms7MTNDpSEst0ScWeeKbH0MGBdZvSjO5T4YK3vIPnaqLvK3zaGQH0hOB
   VBxS4+2VbTlTmqZIA0bmJaSJ41yhO30r0rrgIhzbyKhpJo/uaRPSS2aPu
   wQ+gZiIyK4sUv6erCjzBw8fGGLEJSU44n+nAVjC/uVdC+EqZHBtC6kH0L
   ZZ8ME298wY31DeMHVp3jKoX3NNKGKzZkb6VbKZjuLgRxxnL99QT3ZYwWe
   JqTmqCILS2puBFFcGbLmS1dAM1v8XZZ8qSxOxzQlS/9Cp2PMeD3FmVXRL
   hHxCadRUIW2aL2fcEY9A12FlgcSBg+rtgbp5gChJsRjRjj4FZwYZX0Y1a
   A==;
X-CSE-ConnectionGUID: mr0oxHuuRKiNGGYinTNZ+w==
X-CSE-MsgGUID: qVG1Zy8tRFSzXzyioYmKlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59187900"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="59187900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:09:40 -0800
X-CSE-ConnectionGUID: zhP0KTNMQRWND84rm+uyyw==
X-CSE-MsgGUID: ffvfynk4TyiIpYV4OlJ+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134366579"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2025 09:09:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVw2K-000HtZ-1U;
	Thu, 09 Jan 2025 17:09:36 +0000
Date: Fri, 10 Jan 2025 01:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/1] pps: clients: gpio: Bypass edge's direction check
 when not needed
Message-ID: <202501100104.zMZYpHsi-lkp@intel.com>
References: <20250108153012.514925-1-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108153012.514925-1-bastien.curutchet@bootlin.com>

Hi Bastien,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Curutchet/pps-clients-gpio-Bypass-edge-s-direction-check-when-not-needed/20250108-233101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250108153012.514925-1-bastien.curutchet%40bootlin.com
patch subject: [PATCH v4 1/1] pps: clients: gpio: Bypass edge's direction check when not needed
config: i386-buildonly-randconfig-002-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100104.zMZYpHsi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100104.zMZYpHsi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100104.zMZYpHsi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/pps/clients/pps-gpio.c:17:
   drivers/pps/clients/pps-gpio.c: In function 'pps_gpio_irq_handler':
>> drivers/pps/clients/pps-gpio.c:66:38: error: passing argument 1 of '_dev_warn' from incompatible pointer type [-Werror=incompatible-pointer-types]
      66 |                 dev_warn_ratelimited(&info->pps->dev, "IRQ did not trigger any PPS event\n");
         |                                      ^~~~~~~~~~~~~~~
         |                                      |
         |                                      struct device **
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
      66 |                 dev_warn_ratelimited(&info->pps->dev, "IRQ did not trigger any PPS event\n");
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:89:37: note: expected 'const struct device *' but argument is of type 'struct device **'
      89 | void _dev_warn(const struct device *dev, const char *fmt, ...)
         |                ~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


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
  > 66			dev_warn_ratelimited(&info->pps->dev, "IRQ did not trigger any PPS event\n");
    67	
    68		return IRQ_HANDLED;
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
