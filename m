Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2821401B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721668974; cv=none; b=K/VPzagfUWAomMyeBwPQk9hkv7dXAz1oHRMfqufIlWHhNQV8IizAIAPt29+01MxxTT7qfSxEsrwWj+wqKGUb8OnOKVdMPgZsR+H6sjf4VvfYkfsDRNryr9ehmNt73BUb0QXwjKpUFGasUIFi6/l3I+/tgk6Pj8ONUsEd7IDGBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721668974; c=relaxed/simple;
	bh=rs823YSDSVlAD1TUzONACq10bjApNhkxujuVuCtMNxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0RFiCG1NxyxW3Q20fsw2bIUDIW/ILGrG5QGmGPoM9Z6SScF0ftrF3rk8h5XxGTO4jCz9PTDoPB43uCjb7nxAxzxwChUPWYozs8TkXJrr5+ZXudHVtulfVait/3W2hDArLRoyUcNynsRmwHxEqdNOhHJLPn80icMm6ff/j3NHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6sxG8sM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6sxG8sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721668971; x=1753204971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rs823YSDSVlAD1TUzONACq10bjApNhkxujuVuCtMNxc=;
  b=h6sxG8sM8OJbCGt39xTEZBrwyB1e3HiOtb9w16C7AslndvfITssDwOx9
   nlH/YKEdQWFjIRQe05TTAAmt/VEkBvasgf44ytTZD1DBi+w4wLmqbmJst
   8Btc0H4I7sJZJ6KGj/GaBnpqoO7Log8LHMrxZBUYdx/B0lo+QCNU2asaE
   vtJU/UE/6rJqvPbhUYFtmQBNtnOrCv6h/oJh+k9aZOADeqH3EN/cJEUhM
   7CrVDJcKjHTUzzl78c+P7M4ps3e/4cUoxEKXIPBdtGPCvzwYb2X+Iw/YZ
   XbH52dkexA+1rkbaM7rwkOVucbiUEbgg4hgPKozdBtuu3dV2LAa78lk19
   Q==;
X-CSE-ConnectionGUID: IgkjTXIjQ0eJxKhGRuzGLg==
X-CSE-MsgGUID: /yL/UZzjRpOwms0/H2qH9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19437540"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="19437540"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 10:22:49 -0700
X-CSE-ConnectionGUID: p86OpwJoRoiJ81vfrQk9kg==
X-CSE-MsgGUID: Cci/A9l7QW2EzvdTx6VAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="51657254"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2024 10:22:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVwkI-000lGS-19;
	Mon, 22 Jul 2024 17:22:46 +0000
Date: Tue, 23 Jul 2024 01:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1505/23347] drivers/spi/spi.c:2040:7:
 error: implicit declaration of function 'gpiod_count'; did you mean
 'cpuid_count'?
Message-ID: <202407230136.x5FmFlxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8d2f09e210f079f53eb6c1ba1ef639d73a17d61b
commit: 708663738592c63da3c851ed86ce6c084409f6c8 [1505/23347] spi: add ACPI support for SPI controller chip select lines(cs-gpios)
config: x86_64-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240723/202407230136.x5FmFlxg-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230136.x5FmFlxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407230136.x5FmFlxg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi.c: In function '__spi_register_controller':
>> drivers/spi/spi.c:2040:7: error: implicit declaration of function 'gpiod_count'; did you mean 'cpuid_count'? [-Werror=implicit-function-declaration]
     nb = gpiod_count(&ctlr->dev, "cs");
          ^~~~~~~~~~~
          cpuid_count
>> drivers/spi/spi.c:2064:11: error: implicit declaration of function 'devm_gpiod_get_index'; did you mean 'devm_gpio_free'? [-Werror=implicit-function-declaration]
       desc = devm_gpiod_get_index(&ctlr->dev, "cs",
              ^~~~~~~~~~~~~~~~~~~~
              devm_gpio_free
>> drivers/spi/spi.c:2065:14: error: 'GPIOD_ASIS' undeclared (first use in this function); did you mean 'GPIOF_IN'?
              i, GPIOD_ASIS);
                 ^~~~~~~~~~
                 GPIOF_IN
   drivers/spi/spi.c:2065:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/spi/spi.c:2068:12: error: implicit declaration of function 'desc_to_gpio'; did you mean 'irq_to_gpio'? [-Werror=implicit-function-declaration]
       cs[i] = desc_to_gpio(desc);
               ^~~~~~~~~~~~
               irq_to_gpio
   drivers/spi/spi.c: In function 'spi_unregister_controller':
   drivers/spi/spi.c:2306:6: warning: variable 'dummy' set but not used [-Wunused-but-set-variable]
     int dummy;
         ^~~~~
   cc1: some warnings being treated as errors


vim +2040 drivers/spi/spi.c

  2033	
  2034	static int __spi_register_controller(struct spi_controller *ctlr)
  2035	{
  2036		int nb, i, *cs;
  2037		struct device_node *np = ctlr->dev.of_node;
  2038		struct gpio_desc *desc;
  2039	
> 2040		nb = gpiod_count(&ctlr->dev, "cs");
  2041		ctlr->num_chipselect = max_t(int, nb, ctlr->num_chipselect);
  2042	
  2043		/* Return error only for an incorrectly formed cs-gpios property */
  2044		if (nb == 0 || nb == -ENOENT)
  2045			return 0;
  2046		else if (nb < 0)
  2047			return nb;
  2048	
  2049		cs = devm_kcalloc(&ctlr->dev, ctlr->num_chipselect, sizeof(int),
  2050				  GFP_KERNEL);
  2051		ctlr->cs_gpios = cs;
  2052	
  2053		if (!ctlr->cs_gpios)
  2054			return -ENOMEM;
  2055	
  2056		for (i = 0; i < ctlr->num_chipselect; i++)
  2057			cs[i] = -ENOENT;
  2058	
  2059		if (IS_ENABLED(CONFIG_OF) && np) {
  2060			for (i = 0; i < nb; i++)
  2061				cs[i] = of_get_named_gpio(np, "cs-gpios", i);
  2062		} else if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(&ctlr->dev)) {
  2063			for (i = 0; i < nb; i++) {
> 2064				desc = devm_gpiod_get_index(&ctlr->dev, "cs",
> 2065							    i, GPIOD_ASIS);
  2066				if (IS_ERR(desc))
  2067					continue;
> 2068				cs[i] = desc_to_gpio(desc);
  2069			}
  2070		}
  2071		return 0;
  2072	}
  2073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
