Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D02E6118
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752856058; cv=none; b=nwerN9IN13ZOLpI3ABMtm5kaN8q4V6mDZ4Kz10nsVwxASBwmtSIgG/oIFAJT7iEIxByb+Jw/UIkWaNP4m5pqCY7sycDdC312M1KhdmrwKPeUWpyv2cfelPWi7gzXvFyWfILt80+hlvmsR5vkHjlpSahoGsCX62gHdkue8KEkWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752856058; c=relaxed/simple;
	bh=jjlnDnEvqq9IGza9KiVBktIyuO7nvtY3jpyGwInL6x0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLGZRmh4akjKV4cJYhJnRuN4QC88ZMiDlhwWSf4bKkqlaiIttUYlQLYr1zyN8l5ltmMHJbCRE+GHzikV1rJeNk0lRVQkYp5LXRwNeEWVTiJhf8eEha1E4aY3nqrrPWNh9M6c65UqHV9Tx+PRYfI6pgtI7TzNFS2LI71nTHHdqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvwvIFgz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvwvIFgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752856056; x=1784392056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jjlnDnEvqq9IGza9KiVBktIyuO7nvtY3jpyGwInL6x0=;
  b=KvwvIFgz94LFyPWfgE35Kd3OUqfpB9AKdpwBsOuzs4YofTkeNQIrxSP5
   2+XYqPpH9iPs0ZlfLnw663H5aXMc4MsvNdSFBy4PlOWc3sbavsVzC9EPO
   08wAU00YaMDfsuF1cz7S0DE75SJhkTjMAfHkyTzaWDQJ1S1Zi2y4Ba/gZ
   uK21N2YbyKhHsZlJX2s4N+v/RYKV3flJ79yLRWY6YjOOQRRHeDu9dTeC3
   Veu/MqxegfduXl8p/vVks3YLv6hX5syuTcHAoHbHji/kWHt9fcSPZz2JC
   uTxZuhVSxpS9KYV65i4hP3FNyRXXnJTupVXcN65bak791dHuLWkmiAcNy
   g==;
X-CSE-ConnectionGUID: f+3nhUwuRDmhQ/LNNAuhBQ==
X-CSE-MsgGUID: 81TVZLwRSDaAkRgZipA58w==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="66219287"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="66219287"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 09:27:33 -0700
X-CSE-ConnectionGUID: tf95AEP8SJu8Zu9fUJT2eA==
X-CSE-MsgGUID: xxzQnEemTJK8Vj2NYHUgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="189050156"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2025 09:27:32 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucnvl-000Eqd-0T;
	Fri, 18 Jul 2025 16:27:29 +0000
Date: Sat, 19 Jul 2025 00:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-07-18 120/157]
 drivers/media/rc/rc-loopback.c:168:60: error: implicit declaration of
 function 'str_enabling_disabling'
Message-ID: <202507190032.M6yH0RaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-07-18
head:   ea52943b017c3b53f3f8c9ff679ccfb8eaae222a
commit: db060bfe2b3ff750a7d9bd8d44e4eb14e2090b62 [120/157] media: rc: use string choices helper
config: csky-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190032.M6yH0RaU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190032.M6yH0RaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190032.M6yH0RaU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:623,
                    from include/asm-generic/bug.h:28,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/media/rc/rc-loopback.c:12:
   drivers/media/rc/rc-loopback.c: In function 'loop_set_carrier_report':
>> drivers/media/rc/rc-loopback.c:168:60: error: implicit declaration of function 'str_enabling_disabling' [-Wimplicit-function-declaration]
     168 |                 dev_dbg(&dev->dev, "%s carrier reports\n", str_enabling_disabling(enable));
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/rc/rc-loopback.c:168:17: note: in expansion of macro 'dev_dbg'
     168 |                 dev_dbg(&dev->dev, "%s carrier reports\n", str_enabling_disabling(enable));
         |                 ^~~~~~~
>> drivers/media/rc/rc-loopback.c:168:36: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
     168 |                 dev_dbg(&dev->dev, "%s carrier reports\n", str_enabling_disabling(enable));
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/media/rc/rc-loopback.c:168:17: note: in expansion of macro 'dev_dbg'
     168 |                 dev_dbg(&dev->dev, "%s carrier reports\n", str_enabling_disabling(enable));
         |                 ^~~~~~~
   drivers/media/rc/rc-loopback.c:168:38: note: format string is defined here
     168 |                 dev_dbg(&dev->dev, "%s carrier reports\n", str_enabling_disabling(enable));
         |                                     ~^
         |                                      |
         |                                      char *
         |                                     %d


vim +/str_enabling_disabling +168 drivers/media/rc/rc-loopback.c

   162	
   163	static int loop_set_carrier_report(struct rc_dev *dev, int enable)
   164	{
   165		struct loopback_dev *lodev = dev->priv;
   166	
   167		if (lodev->carrierreport != enable) {
 > 168			dev_dbg(&dev->dev, "%s carrier reports\n", str_enabling_disabling(enable));
   169			lodev->carrierreport = !!enable;
   170		}
   171	
   172		return 0;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
