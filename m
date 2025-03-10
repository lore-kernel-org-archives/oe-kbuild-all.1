Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2201D5AA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 23:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741648619; cv=none; b=fmX9snIo+ero3uOFuZFmy3BSQWgvuKXkuyRrpe6tRdUrNK1BtN8K7vOz93Oq331KfiBso0hQxQN7gIw+G7zgrSyLI2Nddo0+7Gl0+MGqKnbme0apnbRVHpRHoxuyGwzQHC6k+ZMN57QxTsaJAXAiz7Ehm+MKLpkWsiPCdpnz4IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741648619; c=relaxed/simple;
	bh=F12ilTSPk2OOe+YoInfaoQECfHMh6h/x5efNAPdrOZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G8K854oF25qBWivXHcnTkfDbBQe23dAy3FgFj7WE4+eEPWz5E0yqHf8vmtW3o+a8xmeEoz1kupsK0lAbAAb+vr7+1zJlv075w2mGVDh9hPJA/FlejjQXZC/ZpMBusR8/HcIUYOUneFSStypUz3iXxIlYrUPshcQsSCIXJvmMVkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9KkY39x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9KkY39x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741648617; x=1773184617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F12ilTSPk2OOe+YoInfaoQECfHMh6h/x5efNAPdrOZk=;
  b=Y9KkY39xx1rZPh8Ra+oe92aYVec0AQJwjgDsj2m4LgI7WPU+Q/35KKWl
   fQJjJ/Dj+xylqvhCzeJhBES9Jq/dpf69pGiSneMOyzJDd/mnOoyipav7i
   2oTLzUkndU/3e86nDrlMFBoqBMxrafmkUq0gg665vaJ8WsLqruG44ob6D
   T/wVbKn4Njdu+Yn4iloxqkiICkmq20jwu9sEEq3TlJkaYmqKnf0seZCew
   2XEqcImkW3vTZBEHPQtfPvT4e2AHLOEdN7zd+c63qeWVcUh8JWIEfpMu4
   wEr7AR5/U+9U5RyKO/wcBCSMazqKa3DwRO6pH5bRWJd1IQLvpMPJMf9+m
   w==;
X-CSE-ConnectionGUID: gbsshbWcSKGvWvlKbcXmrQ==
X-CSE-MsgGUID: T3W4vrhrQLW0TJWGVFfIyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60072346"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="60072346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 16:16:57 -0700
X-CSE-ConnectionGUID: M1xiQdMOSQutTMjKRfGikQ==
X-CSE-MsgGUID: OsssdbODTaWyTHur5YBtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="120097508"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2025 16:16:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trmMf-0006B2-0I;
	Mon, 10 Mar 2025 23:16:53 +0000
Date: Tue, 11 Mar 2025 07:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [watchdog-next:v6.15-rc1 4/7]
 drivers/watchdog/lenovo_se30_wdt.c:272:31: error: implicit declaration of
 function 'devm_ioremap'
Message-ID: <202503110752.bb6mPHFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://www.linux-watchdog.org/linux-watchdog-next.git v6.15-rc1
head:   d127d9ce2c8ee87d51fdcfff7895661a3c06fb24
commit: c284153a2c5537db4fec51ac850c17d2eb1ffcfe [4/7] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250311/202503110752.bb6mPHFb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110752.bb6mPHFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110752.bb6mPHFb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/lenovo_se30_wdt.c: In function 'lenovo_se30_wdt_probe':
>> drivers/watchdog/lenovo_se30_wdt.c:272:31: error: implicit declaration of function 'devm_ioremap' [-Wimplicit-function-declaration]
     272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
         |                               ^~~~~~~~~~~~
>> drivers/watchdog/lenovo_se30_wdt.c:272:29: error: assignment to 'unsigned char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     272 |         priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
         |                             ^


vim +/devm_ioremap +272 drivers/watchdog/lenovo_se30_wdt.c

   233	
   234	static int lenovo_se30_wdt_probe(struct platform_device *pdev)
   235	{
   236		struct device *dev = &pdev->dev;
   237		struct lenovo_se30_wdt *priv;
   238		unsigned long base_phys;
   239		unsigned short val;
   240		int err;
   241	
   242		err = superio_enter(UNLOCK_KEY, SIO_REG, LNV_SE30_NAME);
   243		if (err)
   244			return err;
   245	
   246		val = superio_inb(SIO_REG, CHIPID_REG) << 8;
   247		val |= superio_inb(SIO_REG, CHIPID_REG + 1);
   248	
   249		if ((val & CHIPID_MASK) != LNV_SE30_ID) {
   250			superio_exit(LOCK_KEY, SIO_REG);
   251			return -ENODEV;
   252		}
   253	
   254		superio_outb(SIO_REG, LDN_REG, LD_NUM_SHM);
   255		base_phys = (superio_inb(SIO_REG, LD_BASE_ADDR) |
   256				 (superio_inb(SIO_REG, LD_BASE_ADDR + 1) << 8) |
   257				 (superio_inb(SIO_REG, LD_BASE_ADDR + 2) << 16) |
   258				 (superio_inb(SIO_REG, LD_BASE_ADDR + 3) << 24)) &
   259				0xFFFFFFFF;
   260	
   261		superio_exit(LOCK_KEY, SIO_REG);
   262		if (base_phys == 0xFFFFFFFF || base_phys == 0)
   263			return -ENODEV;
   264	
   265		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
   266		if (!priv)
   267			return -ENOMEM;
   268	
   269		if (!devm_request_mem_region(dev, base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
   270			return -EBUSY;
   271	
 > 272		priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
   273	
   274		priv->wdt_cfg.mod = WDT_MODULE;
   275		priv->wdt_cfg.idx = WDT_CFG_INDEX;
   276		priv->wdt_cnt.mod = WDT_MODULE;
   277		priv->wdt_cnt.idx = WDT_CNT_INDEX;
   278	
   279		priv->wdt.ops = &lenovo_se30_wdt_ops;
   280		priv->wdt.info = &lenovo_se30_wdt_info;
   281		priv->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
   282		priv->wdt.min_timeout = MIN_TIMEOUT;
   283		priv->wdt.max_timeout = MAX_TIMEOUT;
   284		priv->wdt.parent = dev;
   285	
   286		watchdog_init_timeout(&priv->wdt, timeout, dev);
   287		watchdog_set_drvdata(&priv->wdt, priv);
   288		watchdog_set_nowayout(&priv->wdt, nowayout);
   289		watchdog_stop_on_reboot(&priv->wdt);
   290		watchdog_stop_on_unregister(&priv->wdt);
   291	
   292		return devm_watchdog_register_device(dev, &priv->wdt);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
