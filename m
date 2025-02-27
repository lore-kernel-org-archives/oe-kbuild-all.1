Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F342248AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740641694; cv=none; b=t0mwYkvm4O3pECKpn4rO7mSvNmLjtsCe6HS5Ax0oNb1nmIRzNYEKMq+7pn61arvjY86FfW6dOqCiMwFoQHFYrTGVjvnWcN++EISyjgKzXXf6/QSX+a6EymV7UOGVzv7PKJBOH9FsACpxuIB6Lc9DjFWojwCttSJH63OOT97kwpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740641694; c=relaxed/simple;
	bh=H+1QdFAllBrTGdnKX8x+l0yxCH0Wd7NbCVIHk5wj/3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nz2L4RT9WIphkHQyUpIVxfju7YAIo5WoGuBx9Ez2W4o/TOGvhELTIPMxnFcK2stxXQ08m/SgMPZ12adMXEuxGCDIEa9tz7qyTXHTZDu60Y1Xgd6VzxT5wIduq+A2Pi/lGDFrFEOTUI1RYohYwzultO9I+7DUYekm+5wtnwKuRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhYosmso; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhYosmso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740641693; x=1772177693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H+1QdFAllBrTGdnKX8x+l0yxCH0Wd7NbCVIHk5wj/3o=;
  b=OhYosmsoWFBf1uDtY+s2iH9gSdWVOXjIg9BSVdZACrFQHgBqpBauZrpv
   ZGyv8sATTLMUe03Cpgo8Ro0tWRxXW8WDAyYX+hpQyTmlALs5Scm/967NQ
   ZZ8OHDDPMo2GOuHDDtfxoU62Lxmg8/9Kag6+lBNhfwQG/c4ztSyw0sCmM
   Oibwau9pj14AyA+3awpfHCUlxgNHiJUZA6pQL8K7nX7QbV4+emRaD1A5N
   xJ/rm/WaJLhzceyEu/OFHTkZ9fKGOV+ZIossRGBxLZJTAbPph8tqBQXEZ
   VIz576751/8BpXF0xQSetxTKNpiBdajQHBtqmx07xC9AGL7KwJxs+qZT3
   Q==;
X-CSE-ConnectionGUID: CtTtdZH2TImP/Gcbw5Bu6w==
X-CSE-MsgGUID: 1xw+TCkuQWiyUIdPZGZ0XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45297388"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45297388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 23:34:52 -0800
X-CSE-ConnectionGUID: k/5buOWsSTmbwhL7po41dA==
X-CSE-MsgGUID: ECxmdXjyQa2g3mBqB3qwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121069784"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Feb 2025 23:34:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnYPu-000D1e-0t;
	Thu, 27 Feb 2025 07:34:46 +0000
Date: Thu, 27 Feb 2025 15:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-str-2025-02-26 47/47] drivers/fsi/fsi-core.c:286:17:
 error: implicit declaration of function 'str_write_read'
Message-ID: <202502271500.WMVb7B2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-str-2025-02-26
head:   7f39dbcead9f7b6498531131dce3ce435fbfc915
commit: 7f39dbcead9f7b6498531131dce3ce435fbfc915 [47/47] ALSA: Use str_yes_no() helper in core
config: sh-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271500.WMVb7B2E-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271500.WMVb7B2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271500.WMVb7B2E-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:610,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/fsi/fsi-core.c:14:
   drivers/fsi/fsi-core.c: In function 'fsi_slave_handle_error':
>> drivers/fsi/fsi-core.c:286:17: error: implicit declaration of function 'str_write_read' [-Wimplicit-function-declaration]
     286 |                 str_write_read(write), addr, size);
         |                 ^~~~~~~~~~~~~~
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
   drivers/fsi/fsi-core.c:285:9: note: in expansion of macro 'dev_dbg'
     285 |         dev_dbg(&slave->dev, "handling error on %s to 0x%08x[%zd]",
         |         ^~~~~~~
>> drivers/fsi/fsi-core.c:285:30: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
     285 |         dev_dbg(&slave->dev, "handling error on %s to 0x%08x[%zd]",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/fsi/fsi-core.c:285:9: note: in expansion of macro 'dev_dbg'
     285 |         dev_dbg(&slave->dev, "handling error on %s to 0x%08x[%zd]",
         |         ^~~~~~~
   drivers/fsi/fsi-core.c:285:50: note: format string is defined here
     285 |         dev_dbg(&slave->dev, "handling error on %s to 0x%08x[%zd]",
         |                                                 ~^
         |                                                  |
         |                                                  char *
         |                                                 %d


vim +/str_write_read +286 drivers/fsi/fsi-core.c

   270	
   271	static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
   272					  uint32_t addr, size_t size)
   273	{
   274		struct fsi_master *master = slave->master;
   275		int rc, link;
   276		uint32_t reg;
   277		uint8_t id, send_delay, echo_delay;
   278	
   279		if (discard_errors)
   280			return -1;
   281	
   282		link = slave->link;
   283		id = slave->id;
   284	
 > 285		dev_dbg(&slave->dev, "handling error on %s to 0x%08x[%zd]",
 > 286			str_write_read(write), addr, size);
   287	
   288		/* try a simple clear of error conditions, which may fail if we've lost
   289		 * communication with the slave
   290		 */
   291		rc = fsi_slave_report_and_clear_errors(slave);
   292		if (!rc)
   293			return 0;
   294	
   295		/* send a TERM and retry */
   296		if (master->term) {
   297			rc = master->term(master, link, id);
   298			if (!rc) {
   299				rc = fsi_master_read(master, link, id, 0,
   300						&reg, sizeof(reg));
   301				if (!rc)
   302					rc = fsi_slave_report_and_clear_errors(slave);
   303				if (!rc)
   304					return 0;
   305			}
   306		}
   307	
   308		send_delay = slave->t_send_delay;
   309		echo_delay = slave->t_echo_delay;
   310	
   311		/* getting serious, reset the slave via BREAK */
   312		rc = fsi_master_break(master, link);
   313		if (rc)
   314			return rc;
   315	
   316		slave->t_send_delay = send_delay;
   317		slave->t_echo_delay = echo_delay;
   318	
   319		rc = fsi_slave_set_smode(slave);
   320		if (rc)
   321			return rc;
   322	
   323		if (master->link_config)
   324			master->link_config(master, link,
   325					    slave->t_send_delay,
   326					    slave->t_echo_delay);
   327	
   328		return fsi_slave_report_and_clear_errors(slave);
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
