Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1570DF6C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 04:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173942; cv=none; b=ZaDZHjZtaANanyYbK+q1/f4kI7aldGRPek++XIf9uZKclCvYsP8uubYqKbLF5bgtfyoSuz3oBD1csbI84FHLr6C9xoStTMNXvNogHUqukGCzfH3ux6vbWTqbvGAgZ6nbL8uZY5BEnTstUbIGZJz7G8gJzBbYaWGGG91+H3IzqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173942; c=relaxed/simple;
	bh=Yr7y5fEqesb1ihHgP9nPnxVOrUwHZgXmbWagitFCX/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iu/AH2n1vMMP3eKOf2tVIpNJhSY7h3S5a/VYf2k0Cn0ZA7/+iSJufc69/OqUrKuZG4gMsBdnDgyUEELDCQcVQSuuDId1O00epk9LirWE2D0vDHT15no1KeVi7LnJ4NqosXaf4qvLOoBeOjHNwgr1RQGgGR8u5vdmvRlP8jLhw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NS2s5BN5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NS2s5BN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791173940; x=1822709940;
  h=date:from:to:cc:subject:message-id;
  bh=Yr7y5fEqesb1ihHgP9nPnxVOrUwHZgXmbWagitFCX/Y=;
  b=NS2s5BN5AX9s5NqbUj+vdLznDMIE2TnypsSWomBto5LfGqVBfAOxfB0t
   E+V8tAPRgzXcNu5v9lHuKPvKY4Q4EyYNL6JHXhj/8TtRxycqpB/m8eZm2
   CaYQEf9RiVHlN2mhJYUMw+ZKq7fepvmE2HLULojxiHdlR3XkqNKMF4fxI
   SNiT8YwmEQXS6ILAxNjYKjtkr/vbVaDuguAe0TFAFBjO2Vx0rV+hzm4JG
   wsh/C7ebKCwgH2LCopmbzrAtNfAlhXdAfrJswhxv/YPuLqkXBCZEgYtP4
   +K/6N2seVXJLGivTpsjU3KCounb/1MBJySUcaiM4wDmdYrqhsSCX2g/X6
   Q==;
X-CSE-ConnectionGUID: LdDtue07Tsq5Iu7VW9ALGQ==
X-CSE-MsgGUID: HHyTU141SNS5DFQLnolK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91943807"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91943807"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 21:18:59 -0700
X-CSE-ConnectionGUID: IGEZTCDtTgib/juELVOafQ==
X-CSE-MsgGUID: QlzATRhJT0WX4jFhxKCT3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="284797721"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Oct 2026 21:18:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDaAB-00000000VKn-1V3r;
	Mon, 05 Oct 2026 04:18:55 +0000
Date: Mon, 05 Oct 2026 12:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 15/23]
 drivers/pps/clients/pps-gpio-spin.c:336:11: warning: assignment to 'struct
 pps_gpio_spin *' from 'int' makes pointer from integer without a cast
Message-ID: <202610051207.gvlWOHsT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   eef47b09d53ef553d3089bce6c9a0f6a9c792f29
commit: eb57681e2ecf93179ad3e658a98646183bfb9fdf [15/23] [TEST HACKS] mode-3 differential capture instrumentation
config: i386-buildonly-randconfig-1002-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051207.gvlWOHsT-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051207.gvlWOHsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051207.gvlWOHsT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pps/clients/pps-gpio-spin.c: In function 'spin_do_spin':
   drivers/pps/clients/pps-gpio-spin.c:259:28: error: 'struct pps_event_time' has no member named 'ts_raw'; did you mean 'ts_real'?
     259 |                         ts.ts_raw = ktime_to_timespec64(xt.sys_monoraw);
         |                            ^~~~~~
         |                            ts_real
   drivers/pps/clients/pps-gpio-spin.c: In function 'spin3_start_fn':
   drivers/pps/clients/pps-gpio-spin.c:336:13: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     336 |         d = kzalloc(sizeof(*d), GFP_KERNEL);
         |             ^~~~~~~
>> drivers/pps/clients/pps-gpio-spin.c:336:11: warning: assignment to 'struct pps_gpio_spin *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     336 |         d = kzalloc(sizeof(*d), GFP_KERNEL);
         |           ^
   drivers/pps/clients/pps-gpio-spin.c:342:17: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     342 |                 kfree(d);
         |                 ^~~~~
   cc1: some warnings being treated as errors


vim +336 drivers/pps/clients/pps-gpio-spin.c

   331	
   332	static void spin3_start_fn(struct work_struct *w)
   333	{
   334		struct pps_gpio_spin *d;
   335	
 > 336		d = kzalloc(sizeof(*d), GFP_KERNEL);
   337		if (!d)
   338			return;
   339		d->din = ioremap(din_phys, 4);
   340		if (!d->din) {
   341			pr_warn("mode 3: DIN ioremap failed\n");
   342			kfree(d);
   343			return;
   344		}
   345		d->state = ST_POLL;
   346		d->gpio_prev = 1;
   347		hrtimer_setup(&d->timer, spin_fire, CLOCK_MONOTONIC,
   348			      HRTIMER_MODE_REL_PINNED_HARD);
   349		spin3 = d;
   350		/* runs on CPU1 (schedule_work_on); PINNED keeps it here */
   351		hrtimer_start(&d->timer, ms_to_ktime(10),
   352			      HRTIMER_MODE_REL_PINNED_HARD);
   353		pr_info("mode 3 differential capture started on CPU%d\n",
   354			smp_processor_id());
   355	}
   356	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
