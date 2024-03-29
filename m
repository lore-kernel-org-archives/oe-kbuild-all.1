Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC713CF8F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711744510; cv=none; b=X1Hbt2VNahJQOLEzzSEIzcP2UDRZocp6h08E0xc8dwM+EvFBJ4uifgQ4gd2rfU/dt1l/Vgm1DY1qgEjFWOzCNL+deDmSIo3Zeu5U9AyH6TSewssAa+fnmgKEOHNQZg3TfW/naG8SogMOICum6sVipqjXHzoV1TvC6y2+V8jpLqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711744510; c=relaxed/simple;
	bh=zf0dGGUtAWMBa6YQqTvJvFSwra34TleOUqknZtJJlUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGR0K3Xt32tFuf/bviHU+l+K/lJS+Rt0g1/Bd1ryK+V1TAMV30lxx0x1fF9BZgJfy0/QTnmt4ZwFXMukeBa8VRoC/nBFEhAJfamm5io0RJyRtpUn5GbQuyti1upb39zjTJtwguz6z9vGohIsYpv27YufV/c8afvopA+DVySk4EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxODdEnj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxODdEnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711744508; x=1743280508;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zf0dGGUtAWMBa6YQqTvJvFSwra34TleOUqknZtJJlUU=;
  b=IxODdEnjuAqccM1Hgsw18efx5/8V9qEAD+aNnsiCY1uFjQAqVT/hGhW/
   SqayYatyVzd2XkSoUMYvELOTQMqchffIxZ2UVolvTJz2toqAtZUfJuddZ
   V1lhgoXkDcTnB8b3uunUzqZeocCRDdAc7CoWjKMtJKvchbZ6+RgesnkGv
   IDKpNycS8Vmqqa36jaw4eL9ScOgiQKeuUdRTyT9hnv6isdCRim7U7DFvH
   ijXtKU6l+jWeh/dh4er5BnNrLQfpgGpBfp2Vo4mc7ivh3fc3xQFGXhqbP
   IjcbiTnFqpPAgx13ZxWJu5W3oNqGZXVeP0qIE5FPG54W6kPOhzmNZ8p2y
   w==;
X-CSE-ConnectionGUID: Kl9JBvi6SFuyjLhxmGjzBQ==
X-CSE-MsgGUID: 5WekjWavQq+/CR9fbdvQDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7052363"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7052363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 13:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="48045871"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Mar 2024 13:35:06 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqIwJ-0003bC-0A;
	Fri, 29 Mar 2024 20:35:03 +0000
Date: Sat, 30 Mar 2024 04:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-classmap-add-trace 64/64]
 include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member
 named 'ctrl'
Message-ID: <202403300431.RczcBci8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/jimc/linux.git dd-fix-classmap-add-trace
head:   9cf8914e3a113c16ba8cd3da48422401f20cfc33
commit: 3341029059d1eb4ef9a6b48d5c2075e3f694daaf [64/64] dyndbg: grind out ctrl
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240330/202403300431.RczcBci8-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403300431.RczcBci8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403300431.RczcBci8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from drivers/usb/phy/phy.c:7:
   drivers/usb/phy/phy.c: In function 'usb_get_phy':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:335:9: note: in expansion of macro '_dynamic_func_call'
     335 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/usb/phy/phy.c:502:17: note: in expansion of macro 'pr_debug'
     502 |                 pr_debug("PHY: unable to find transceiver of type %s\n",
         |                 ^~~~~~~~
   drivers/usb/phy/phy.c: In function 'devm_usb_get_phy_by_node':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy.c:545:17: note: in expansion of macro 'dev_dbg'
     545 |                 dev_dbg(dev, "failed to allocate memory for devres\n");
         |                 ^~~~~~~
   drivers/usb/phy/phy.c: In function 'devm_usb_get_phy_by_phandle':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy.c:601:17: note: in expansion of macro 'dev_dbg'
     601 |                 dev_dbg(dev, "device does not have a device node entry\n");
         |                 ^~~~~~~
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy.c:607:17: note: in expansion of macro 'dev_dbg'
     607 |                 dev_dbg(dev, "failed to get %s phandle in %pOF node\n", phandle,
         |                 ^~~~~~~
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/usb/phy/phy-generic.c:14:
   drivers/usb/phy/phy-generic.c: In function 'usb_phy_gen_create_phy':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy-generic.c:251:17: note: in expansion of macro 'dev_dbg'
     251 |                 dev_dbg(dev, "Can't get phy clock: %ld\n",
         |                 ^~~~~~~
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:10,
                    from drivers/usb/phy/phy-tahvo.c:15:
   drivers/usb/phy/phy-tahvo.c: In function 'tahvo_usb_set_suspend':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy-tahvo.c:180:9: note: in expansion of macro 'dev_dbg'
     180 |         dev_dbg(&tu->pt_dev->dev, "%s\n", __func__);
         |         ^~~~~~~
--
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from drivers/usb/phy/phy-gpio-vbus-usb.c:8:
   drivers/usb/phy/phy-gpio-vbus-usb.c: In function 'gpio_vbus_irq':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy-gpio-vbus-usb.c:153:9: note: in expansion of macro 'dev_dbg'
     153 |         dev_dbg(&pdev->dev, "VBUS %s (gadget: %s)\n",
         |         ^~~~~~~
   drivers/usb/phy/phy-gpio-vbus-usb.c: In function 'gpio_vbus_set_peripheral':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy-gpio-vbus-usb.c:176:17: note: in expansion of macro 'dev_dbg'
     176 |                 dev_dbg(&pdev->dev, "unregistering gadget '%s'\n",
         |                 ^~~~~~~
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy-gpio-vbus-usb.c:193:9: note: in expansion of macro 'dev_dbg'
     193 |         dev_dbg(&pdev->dev, "registered gadget '%s'\n", gadget->name);
         |         ^~~~~~~
   drivers/usb/phy/phy-gpio-vbus-usb.c: In function 'gpio_vbus_probe':
>> include/linux/dynamic_debug.h:271:28: error: 'struct _ddebug' has no member named 'ctrl'
     271 |         unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:289:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     289 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:314:9: note: in expansion of macro '__dynamic_func_call_cls'
     314 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:316:9: note: in expansion of macro '_dynamic_func_call_cls'
     316 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:339:9: note: in expansion of macro '_dynamic_func_call'
     339 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/usb/phy/phy-gpio-vbus-usb.c:310:17: note: in expansion of macro 'dev_dbg'
     310 |                 dev_dbg(&pdev->dev, "can't get vbus_draw regulator, err: %ld\n",
         |                 ^~~~~~~


vim +271 include/linux/dynamic_debug.h

9049fc745300c5 Jason Baron     2016-08-03  265  
9049fc745300c5 Jason Baron     2016-08-03  266  #ifdef DEBUG
9049fc745300c5 Jason Baron     2016-08-03  267  #define DYNAMIC_DEBUG_BRANCH(descriptor) \
94c6ab312b15d1 Łukasz Bartosik 2024-02-11  268  	likely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
9049fc745300c5 Jason Baron     2016-08-03  269  #else
9049fc745300c5 Jason Baron     2016-08-03  270  #define DYNAMIC_DEBUG_BRANCH(descriptor) \
94c6ab312b15d1 Łukasz Bartosik 2024-02-11 @271  	unlikely(descriptor.ctrl.flags & _DPRINTK_FLAGS_ENABLED)
9049fc745300c5 Jason Baron     2016-08-03  272  #endif
9049fc745300c5 Jason Baron     2016-08-03  273  

:::::: The code at line 271 was first introduced by commit
:::::: 94c6ab312b15d10bcdda044613388bb1bf8ae406 dyndbg: move flags field to a new structure

:::::: TO: Łukasz Bartosik <ukaszb@chromium.org>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
