Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74C13DB9F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 19:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528327; cv=none; b=dBIVLW/wDE3uABio0rc9DfV/GppJQGEu85pPSFZ5F0SlkjxgIqkoczkblIVfIFroGNVt4S/xFvGsUWBZtPv48UPpemRTdsc+WD/nqVhRTGhuOprYkSXaoTfFJus4wbsGxOk7mfNjug2cKnhnJlHju8PChktCTO3veKHvII7YHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528327; c=relaxed/simple;
	bh=LyI/zkbv+v0ZEDA/H25F30hw8W6e4MPf2WVsqfuiPAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cY8++jLqDfw2VT4AUNdPbBB+hi+zTPfk8jggKJ0a13nZCND9TJiR2KwMS8shndgSmcmRZWSF5Sq8XpNWzoFa75CAfyjXC6p5ih7T8IWi4iu3ebclPXD90EZMEY8gxbTPbGLbEAiJTCSQQw8EQBfvStJISWLDWBLtjkR79wjApig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmGDANfH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmGDANfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717528324; x=1749064324;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LyI/zkbv+v0ZEDA/H25F30hw8W6e4MPf2WVsqfuiPAE=;
  b=OmGDANfHzIOpcdobV3UeBIW0JMfqnx+XvtLDBRZ+bUKS2fm8IB/ZGOWl
   WXeMbRt0cM6hhy3tvN/aLCvd5VWb7F+YLMrQfIQzyg3HybkFqJU8TR9xv
   afHgtepcxTZmwd6f3AU7SMGSV4X3vK5IqH9c/qYj8f1dofCNXMJ8utKCQ
   6/0McD6UCo9bAlTSMZax0K4ELI7e+TMMZeztmTtTZHtZEvlS+7BhWlYnJ
   e9wo7LAw7H9EfQ1DAqGnd/vc2Z7zlccvvXollVSS0Dv8Nap3CySoyQVNR
   v9ZUrVZiOp5E1xEZJyytkMsHjf86/bKpQKc5saqiLJB1BHd3wrpgaCDwy
   w==;
X-CSE-ConnectionGUID: K6sJHa3JS8+g0gn0RbUd1A==
X-CSE-MsgGUID: bzK8X3HoRXuINx9d/WJJLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11903248"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="11903248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 12:12:04 -0700
X-CSE-ConnectionGUID: 9xELvH93ScOga6XIwEtUQg==
X-CSE-MsgGUID: OE8/2DoQRbWd7qlNfBlCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="68151662"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2024 12:12:03 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEZZf-0000Rj-1y;
	Tue, 04 Jun 2024 19:11:59 +0000
Date: Wed, 5 Jun 2024 03:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joy Chakraborty <joychakr@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [srini-nvmem:for-next 1/1] drivers/rtc/rtc-cmos.c:938:29: error:
 initialization of 'ssize_t (*)(void *, unsigned int,  void *, size_t)' {aka
 'long int (*)(void *, unsigned int,  void *, long unsigned int)'} from
 incompatible pointer type 'int (*)(void *, unsigned int,  void *, size...
Message-ID: <202406050356.LGDJ3PPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   f5de138db5b76de7d96d4cf92f871ba893ba0119
commit: f5de138db5b76de7d96d4cf92f871ba893ba0119 [1/1] nvmem: Change return type of reg read/write to ssize_t
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240605/202406050356.LGDJ3PPU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050356.LGDJ3PPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050356.LGDJ3PPU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-cmos.c: In function 'cmos_do_probe':
>> drivers/rtc/rtc-cmos.c:938:29: error: initialization of 'ssize_t (*)(void *, unsigned int,  void *, size_t)' {aka 'long int (*)(void *, unsigned int,  void *, long unsigned int)'} from incompatible pointer type 'int (*)(void *, unsigned int,  void *, size_t)' {aka 'int (*)(void *, unsigned int,  void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
     938 |                 .reg_read = cmos_nvram_read,
         |                             ^~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c:938:29: note: (near initialization for 'nvmem_cfg.reg_read')
   drivers/rtc/rtc-cmos.c:939:30: error: initialization of 'ssize_t (*)(void *, unsigned int,  void *, size_t)' {aka 'long int (*)(void *, unsigned int,  void *, long unsigned int)'} from incompatible pointer type 'int (*)(void *, unsigned int,  void *, size_t)' {aka 'int (*)(void *, unsigned int,  void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
     939 |                 .reg_write = cmos_nvram_write,
         |                              ^~~~~~~~~~~~~~~~
   drivers/rtc/rtc-cmos.c:939:30: note: (near initialization for 'nvmem_cfg.reg_write')
   cc1: some warnings being treated as errors
--
   drivers/rtc/rtc-m48t59.c: In function 'm48t59_rtc_probe':
>> drivers/rtc/rtc-m48t59.c:368:29: error: initialization of 'ssize_t (*)(void *, unsigned int,  void *, size_t)' {aka 'long int (*)(void *, unsigned int,  void *, long unsigned int)'} from incompatible pointer type 'int (*)(void *, unsigned int,  void *, size_t)' {aka 'int (*)(void *, unsigned int,  void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
     368 |                 .reg_read = m48t59_nvram_read,
         |                             ^~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m48t59.c:368:29: note: (near initialization for 'nvmem_cfg.reg_read')
   drivers/rtc/rtc-m48t59.c:369:30: error: initialization of 'ssize_t (*)(void *, unsigned int,  void *, size_t)' {aka 'long int (*)(void *, unsigned int,  void *, long unsigned int)'} from incompatible pointer type 'int (*)(void *, unsigned int,  void *, size_t)' {aka 'int (*)(void *, unsigned int,  void *, long unsigned int)'} [-Werror=incompatible-pointer-types]
     369 |                 .reg_write = m48t59_nvram_write,
         |                              ^~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-m48t59.c:369:30: note: (near initialization for 'nvmem_cfg.reg_write')
   cc1: some warnings being treated as errors


vim +938 drivers/rtc/rtc-cmos.c

2546e7083f2ea96 Guenter Roeck       2023-08-17   925  
7be2c7c96aff287 David Brownell      2007-02-10   926  static int INITSECTION
7be2c7c96aff287 David Brownell      2007-02-10   927  cmos_do_probe(struct device *dev, struct resource *ports, int rtc_irq)
7be2c7c96aff287 David Brownell      2007-02-10   928  {
97a92e77ca5d3d8 Jingoo Han          2013-11-12   929  	struct cmos_rtc_board_info	*info = dev_get_platdata(dev);
7be2c7c96aff287 David Brownell      2007-02-10   930  	int				retval = 0;
7be2c7c96aff287 David Brownell      2007-02-10   931  	unsigned char			rtc_control;
e07e232cd96ef00 David Brownell      2008-02-06   932  	unsigned			address_space;
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   933  	u32				flags = 0;
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   934  	struct nvmem_config nvmem_cfg = {
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   935  		.name = "cmos_nvram",
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   936  		.word_size = 1,
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   937  		.stride = 1,
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12  @938  		.reg_read = cmos_nvram_read,
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   939  		.reg_write = cmos_nvram_write,
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   940  		.priv = &cmos_rtc,
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12   941  	};
7be2c7c96aff287 David Brownell      2007-02-10   942  
7be2c7c96aff287 David Brownell      2007-02-10   943  	/* there can be only one ... */
7be2c7c96aff287 David Brownell      2007-02-10   944  	if (cmos_rtc.dev)
7be2c7c96aff287 David Brownell      2007-02-10   945  		return -EBUSY;
7be2c7c96aff287 David Brownell      2007-02-10   946  
7be2c7c96aff287 David Brownell      2007-02-10   947  	if (!ports)
7be2c7c96aff287 David Brownell      2007-02-10   948  		return -ENODEV;
7be2c7c96aff287 David Brownell      2007-02-10   949  
05440dfcfcabde6 David Brownell      2007-10-16   950  	/* Claim I/O ports ASAP, minimizing conflict with legacy driver.
05440dfcfcabde6 David Brownell      2007-10-16   951  	 *
05440dfcfcabde6 David Brownell      2007-10-16   952  	 * REVISIT non-x86 systems may instead use memory space resources
05440dfcfcabde6 David Brownell      2007-10-16   953  	 * (needing ioremap etc), not i/o space resources like this ...
05440dfcfcabde6 David Brownell      2007-10-16   954  	 */
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   955  	if (RTC_IOMAPPED)
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   956  		ports = request_region(ports->start, resource_size(ports),
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   957  				       driver_name);
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   958  	else
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   959  		ports = request_mem_region(ports->start, resource_size(ports),
05440dfcfcabde6 David Brownell      2007-10-16   960  					   driver_name);
05440dfcfcabde6 David Brownell      2007-10-16   961  	if (!ports) {
05440dfcfcabde6 David Brownell      2007-10-16   962  		dev_dbg(dev, "i/o registers already in use\n");
05440dfcfcabde6 David Brownell      2007-10-16   963  		return -EBUSY;
05440dfcfcabde6 David Brownell      2007-10-16   964  	}
05440dfcfcabde6 David Brownell      2007-10-16   965  
7be2c7c96aff287 David Brownell      2007-02-10   966  	cmos_rtc.irq = rtc_irq;
7be2c7c96aff287 David Brownell      2007-02-10   967  	cmos_rtc.iomem = ports;
7be2c7c96aff287 David Brownell      2007-02-10   968  
e07e232cd96ef00 David Brownell      2008-02-06   969  	/* Heuristic to deduce NVRAM size ... do what the legacy NVRAM
e07e232cd96ef00 David Brownell      2008-02-06   970  	 * driver did, but don't reject unknown configs.   Old hardware
c8fc40cd345bfd8 David Brownell      2008-10-18   971  	 * won't address 128 bytes.  Newer chips have multiple banks,
c8fc40cd345bfd8 David Brownell      2008-10-18   972  	 * though they may not be listed in one I/O resource.
e07e232cd96ef00 David Brownell      2008-02-06   973  	 */
e07e232cd96ef00 David Brownell      2008-02-06   974  #if	defined(CONFIG_ATARI)
e07e232cd96ef00 David Brownell      2008-02-06   975  	address_space = 64;
95abd0dfaf5d274 Wu Zhangjin         2009-11-05   976  #elif defined(__i386__) || defined(__x86_64__) || defined(__arm__) \
8cb7c71bda16e2d Srikanth Krishnakar 2010-10-14   977  			|| defined(__sparc__) || defined(__mips__) \
739d875dd698261 David Howells       2018-03-08   978  			|| defined(__powerpc__)
e07e232cd96ef00 David Brownell      2008-02-06   979  	address_space = 128;
e07e232cd96ef00 David Brownell      2008-02-06   980  #else
e07e232cd96ef00 David Brownell      2008-02-06   981  #warning Assuming 128 bytes of RTC+NVRAM address space, not 64 bytes.
e07e232cd96ef00 David Brownell      2008-02-06   982  	address_space = 128;
e07e232cd96ef00 David Brownell      2008-02-06   983  #endif
c8fc40cd345bfd8 David Brownell      2008-10-18   984  	if (can_bank2 && ports->end > (ports->start + 1))
c8fc40cd345bfd8 David Brownell      2008-10-18   985  		address_space = 256;
e07e232cd96ef00 David Brownell      2008-02-06   986  
87ac84f42a7a580 David Brownell      2007-05-08   987  	/* For ACPI systems extension info comes from the FADT.  On others,
87ac84f42a7a580 David Brownell      2007-05-08   988  	 * board specific setup provides it as appropriate.  Systems where
87ac84f42a7a580 David Brownell      2007-05-08   989  	 * the alarm IRQ isn't automatically a wakeup IRQ (like ACPI, and
87ac84f42a7a580 David Brownell      2007-05-08   990  	 * some almost-clones) can provide hooks to make that behave.
e07e232cd96ef00 David Brownell      2008-02-06   991  	 *
e07e232cd96ef00 David Brownell      2008-02-06   992  	 * Note that ACPI doesn't preclude putting these registers into
e07e232cd96ef00 David Brownell      2008-02-06   993  	 * "extended" areas of the chip, including some that we won't yet
e07e232cd96ef00 David Brownell      2008-02-06   994  	 * expect CMOS_READ and friends to handle.
7be2c7c96aff287 David Brownell      2007-02-10   995  	 */
7be2c7c96aff287 David Brownell      2007-02-10   996  	if (info) {
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   997  		if (info->flags)
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   998  			flags = info->flags;
31632dbdba85aaf Maciej W. Rozycki   2014-06-06   999  		if (info->address_space)
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1000  			address_space = info->address_space;
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1001  
7be2c7c96aff287 David Brownell      2007-02-10  1002  		cmos_rtc.day_alrm = info->rtc_day_alarm;
7be2c7c96aff287 David Brownell      2007-02-10  1003  		cmos_rtc.mon_alrm = info->rtc_mon_alarm;
7be2c7c96aff287 David Brownell      2007-02-10  1004  		cmos_rtc.century = info->rtc_century;
87ac84f42a7a580 David Brownell      2007-05-08  1005  
87ac84f42a7a580 David Brownell      2007-05-08  1006  		if (info->wake_on && info->wake_off) {
87ac84f42a7a580 David Brownell      2007-05-08  1007  			cmos_rtc.wake_on = info->wake_on;
87ac84f42a7a580 David Brownell      2007-05-08  1008  			cmos_rtc.wake_off = info->wake_off;
87ac84f42a7a580 David Brownell      2007-05-08  1009  		}
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1010  	} else {
d13e9ad9f5146f0 Rafael J. Wysocki   2022-11-09  1011  		acpi_cmos_wake_setup(dev);
7be2c7c96aff287 David Brownell      2007-02-10  1012  	}
7be2c7c96aff287 David Brownell      2007-02-10  1013  
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1014  	if (cmos_rtc.day_alrm >= 128)
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1015  		cmos_rtc.day_alrm = 0;
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1016  
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1017  	if (cmos_rtc.mon_alrm >= 128)
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1018  		cmos_rtc.mon_alrm = 0;
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1019  
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1020  	if (cmos_rtc.century >= 128)
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1021  		cmos_rtc.century = 0;
508ccdfb86b21da Rafael J. Wysocki   2022-11-09  1022  
6ba8bcd457d9fc7 Dan Carpenter       2010-05-24  1023  	cmos_rtc.dev = dev;
6ba8bcd457d9fc7 Dan Carpenter       2010-05-24  1024  	dev_set_drvdata(dev, &cmos_rtc);
6ba8bcd457d9fc7 Dan Carpenter       2010-05-24  1025  
53d29e0a3afe056 Alexandre Belloni   2018-02-12  1026  	cmos_rtc.rtc = devm_rtc_allocate_device(dev);
05440dfcfcabde6 David Brownell      2007-10-16  1027  	if (IS_ERR(cmos_rtc.rtc)) {
05440dfcfcabde6 David Brownell      2007-10-16  1028  		retval = PTR_ERR(cmos_rtc.rtc);
05440dfcfcabde6 David Brownell      2007-10-16  1029  		goto cleanup0;
05440dfcfcabde6 David Brownell      2007-10-16  1030  	}
7be2c7c96aff287 David Brownell      2007-02-10  1031  
2546e7083f2ea96 Guenter Roeck       2023-08-17  1032  	if (cmos_rtc.mon_alrm)
2546e7083f2ea96 Guenter Roeck       2023-08-17  1033  		cmos_rtc.rtc->alarm_offset_max = SECS_PER_YEAR - 1;
2546e7083f2ea96 Guenter Roeck       2023-08-17  1034  	else if (cmos_rtc.day_alrm)
2546e7083f2ea96 Guenter Roeck       2023-08-17  1035  		cmos_rtc.rtc->alarm_offset_max = SECS_PER_MONTH - 1;
2546e7083f2ea96 Guenter Roeck       2023-08-17  1036  	else
2546e7083f2ea96 Guenter Roeck       2023-08-17  1037  		cmos_rtc.rtc->alarm_offset_max = SECS_PER_DAY - 1;
2546e7083f2ea96 Guenter Roeck       2023-08-17  1038  
d4afc76c0b59a37 Kay Sievers         2009-01-06  1039  	rename_region(ports, dev_name(&cmos_rtc.rtc->dev));
7be2c7c96aff287 David Brownell      2007-02-10  1040  
ea6fa4961aab8f9 Mateusz Jończyk     2021-12-10  1041  	if (!mc146818_does_rtc_work()) {
ea6fa4961aab8f9 Mateusz Jończyk     2021-12-10  1042  		dev_warn(dev, "broken or not accessible\n");
211e5db19d15a72 Thomas Gleixner     2021-01-26  1043  		retval = -ENXIO;
211e5db19d15a72 Thomas Gleixner     2021-01-26  1044  		goto cleanup1;
211e5db19d15a72 Thomas Gleixner     2021-01-26  1045  	}
211e5db19d15a72 Thomas Gleixner     2021-01-26  1046  
ea6fa4961aab8f9 Mateusz Jończyk     2021-12-10  1047  	spin_lock_irq(&rtc_lock);
ea6fa4961aab8f9 Mateusz Jończyk     2021-12-10  1048  
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1049  	if (!(flags & CMOS_RTC_FLAGS_NOFREQ)) {
7be2c7c96aff287 David Brownell      2007-02-10  1050  		/* force periodic irq to CMOS reset default of 1024Hz;
7be2c7c96aff287 David Brownell      2007-02-10  1051  		 *
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1052  		 * REVISIT it's been reported that at least one x86_64 ALI
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1053  		 * mobo doesn't use 32KHz here ... for portability we might
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1054  		 * need to do something about other clock frequencies.
7be2c7c96aff287 David Brownell      2007-02-10  1055  		 */
7be2c7c96aff287 David Brownell      2007-02-10  1056  		cmos_rtc.rtc->irq_freq = 1024;
311ee9c151ad7f2 Zhang Rui           2018-03-26  1057  		if (use_hpet_alarm())
35d3fdd5f304c06 David Brownell      2008-07-23  1058  			hpet_set_periodic_freq(cmos_rtc.rtc->irq_freq);
9d8af78b07976d4 Bernhard Walle      2008-02-06  1059  		CMOS_WRITE(RTC_REF_CLCK_32KHZ | 0x06, RTC_FREQ_SELECT);
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1060  	}
7be2c7c96aff287 David Brownell      2007-02-10  1061  
7e2a31da854dcf8 David Brownell      2008-07-23  1062  	/* disable irqs */
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1063  	if (is_valid_irq(rtc_irq))
7e2a31da854dcf8 David Brownell      2008-07-23  1064  		cmos_irq_disable(&cmos_rtc, RTC_PIE | RTC_AIE | RTC_UIE);
35d3fdd5f304c06 David Brownell      2008-07-23  1065  
7e2a31da854dcf8 David Brownell      2008-07-23  1066  	rtc_control = CMOS_READ(RTC_CONTROL);
7be2c7c96aff287 David Brownell      2007-02-10  1067  
7be2c7c96aff287 David Brownell      2007-02-10  1068  	spin_unlock_irq(&rtc_lock);
7be2c7c96aff287 David Brownell      2007-02-10  1069  
3804a89bfb84fb8 Arnaud Patard       2010-04-29  1070  	if (is_valid_irq(rtc_irq) && !(rtc_control & RTC_24H)) {
3804a89bfb84fb8 Arnaud Patard       2010-04-29  1071  		dev_warn(dev, "only 24-hr supported\n");
7be2c7c96aff287 David Brownell      2007-02-10  1072  		retval = -ENXIO;
7be2c7c96aff287 David Brownell      2007-02-10  1073  		goto cleanup1;
7be2c7c96aff287 David Brownell      2007-02-10  1074  	}
7be2c7c96aff287 David Brownell      2007-02-10  1075  
311ee9c151ad7f2 Zhang Rui           2018-03-26  1076  	if (use_hpet_alarm())
970fc7f4afd52d6 Pratyush Anand      2016-09-15  1077  		hpet_rtc_timer_init();
970fc7f4afd52d6 Pratyush Anand      2016-09-15  1078  
9d8af78b07976d4 Bernhard Walle      2008-02-06  1079  	if (is_valid_irq(rtc_irq)) {
9d8af78b07976d4 Bernhard Walle      2008-02-06  1080  		irq_handler_t rtc_cmos_int_handler;
9d8af78b07976d4 Bernhard Walle      2008-02-06  1081  
311ee9c151ad7f2 Zhang Rui           2018-03-26  1082  		if (use_hpet_alarm()) {
9d8af78b07976d4 Bernhard Walle      2008-02-06  1083  			rtc_cmos_int_handler = hpet_rtc_interrupt;
24b34472e2e6e38 Andrew Morton       2014-01-23  1084  			retval = hpet_register_irq_handler(cmos_interrupt);
24b34472e2e6e38 Andrew Morton       2014-01-23  1085  			if (retval) {
970fc7f4afd52d6 Pratyush Anand      2016-09-15  1086  				hpet_mask_rtc_irq_bit(RTC_IRQMASK);
ee4433573b02f81 Jingoo Han          2013-02-21  1087  				dev_warn(dev, "hpet_register_irq_handler "
9d8af78b07976d4 Bernhard Walle      2008-02-06  1088  						" failed in rtc_init().");
9d8af78b07976d4 Bernhard Walle      2008-02-06  1089  				goto cleanup1;
9d8af78b07976d4 Bernhard Walle      2008-02-06  1090  			}
9d8af78b07976d4 Bernhard Walle      2008-02-06  1091  		} else
9d8af78b07976d4 Bernhard Walle      2008-02-06  1092  			rtc_cmos_int_handler = cmos_interrupt;
9d8af78b07976d4 Bernhard Walle      2008-02-06  1093  
9d8af78b07976d4 Bernhard Walle      2008-02-06  1094  		retval = request_irq(rtc_irq, rtc_cmos_int_handler,
b6da197a2e9670d Andy Shevchenko     2020-01-23  1095  				0, dev_name(&cmos_rtc.rtc->dev),
ab6a2d70d18edc7 David Brownell      2007-05-08  1096  				cmos_rtc.rtc);
7be2c7c96aff287 David Brownell      2007-02-10  1097  		if (retval < 0) {
7be2c7c96aff287 David Brownell      2007-02-10  1098  			dev_dbg(dev, "IRQ %d is already in use\n", rtc_irq);
7be2c7c96aff287 David Brownell      2007-02-10  1099  			goto cleanup1;
7be2c7c96aff287 David Brownell      2007-02-10  1100  		}
fbb974ba693bbfb Hans de Goede       2018-09-04  1101  	} else {
30f5bd537fdb612 Alexandre Belloni   2021-01-11  1102  		clear_bit(RTC_FEATURE_ALARM, cmos_rtc.rtc->features);
fbb974ba693bbfb Hans de Goede       2018-09-04  1103  	}
fbb974ba693bbfb Hans de Goede       2018-09-04  1104  
30f5bd537fdb612 Alexandre Belloni   2021-01-11  1105  	cmos_rtc.rtc->ops = &cmos_rtc_ops;
30f5bd537fdb612 Alexandre Belloni   2021-01-11  1106  
fdcfd854333be5b Bartosz Golaszewski 2020-11-09  1107  	retval = devm_rtc_register_device(cmos_rtc.rtc);
53d29e0a3afe056 Alexandre Belloni   2018-02-12  1108  	if (retval)
e07e232cd96ef00 David Brownell      2008-02-06  1109  		goto cleanup2;
7be2c7c96aff287 David Brownell      2007-02-10  1110  
b0ecd8e8c5ef376 Thomas Gleixner     2020-12-06  1111  	/* Set the sync offset for the periodic 11min update correct */
69eca258c850005 Thomas Gleixner     2020-12-06  1112  	cmos_rtc.rtc->set_offset_nsec = NSEC_PER_SEC / 2;
b0ecd8e8c5ef376 Thomas Gleixner     2020-12-06  1113  
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12  1114  	/* export at least the first block of NVRAM */
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12  1115  	nvmem_cfg.size = address_space - NVRAM_OFFSET;
6746bc095bbd1da Bartosz Golaszewski 2020-11-09  1116  	devm_rtc_nvmem_register(cmos_rtc.rtc, &nvmem_cfg);
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12  1117  
375bbba09692fe4 Rafael J. Wysocki   2022-11-09  1118  	/*
375bbba09692fe4 Rafael J. Wysocki   2022-11-09  1119  	 * Everything has gone well so far, so by default register a handler for
375bbba09692fe4 Rafael J. Wysocki   2022-11-09  1120  	 * the ACPI RTC fixed event.
375bbba09692fe4 Rafael J. Wysocki   2022-11-09  1121  	 */
375bbba09692fe4 Rafael J. Wysocki   2022-11-09  1122  	if (!info)
d13e9ad9f5146f0 Rafael J. Wysocki   2022-11-09  1123  		acpi_rtc_event_setup(dev);
375bbba09692fe4 Rafael J. Wysocki   2022-11-09  1124  
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12  1125  	dev_info(dev, "%s%s, %d bytes nvram%s\n",
6d029b645175ae7 Krzysztof Halasa    2009-04-21  1126  		 !is_valid_irq(rtc_irq) ? "no alarms" :
6d029b645175ae7 Krzysztof Halasa    2009-04-21  1127  		 cmos_rtc.mon_alrm ? "alarms up to one year" :
6d029b645175ae7 Krzysztof Halasa    2009-04-21  1128  		 cmos_rtc.day_alrm ? "alarms up to one month" :
6d029b645175ae7 Krzysztof Halasa    2009-04-21  1129  		 "alarms up to one day",
35d3fdd5f304c06 David Brownell      2008-07-23  1130  		 cmos_rtc.century ? ", y3k" : "",
8b5b7958fd1cac5 Alexandre Belloni   2018-02-12  1131  		 nvmem_cfg.size,
311ee9c151ad7f2 Zhang Rui           2018-03-26  1132  		 use_hpet_alarm() ? ", hpet irqs" : "");
7be2c7c96aff287 David Brownell      2007-02-10  1133  
7be2c7c96aff287 David Brownell      2007-02-10  1134  	return 0;
7be2c7c96aff287 David Brownell      2007-02-10  1135  
e07e232cd96ef00 David Brownell      2008-02-06  1136  cleanup2:
e07e232cd96ef00 David Brownell      2008-02-06  1137  	if (is_valid_irq(rtc_irq))
e07e232cd96ef00 David Brownell      2008-02-06  1138  		free_irq(rtc_irq, cmos_rtc.rtc);
7be2c7c96aff287 David Brownell      2007-02-10  1139  cleanup1:
05440dfcfcabde6 David Brownell      2007-10-16  1140  	cmos_rtc.dev = NULL;
05440dfcfcabde6 David Brownell      2007-10-16  1141  cleanup0:
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1142  	if (RTC_IOMAPPED)
28f65c11f2ffb39 Joe Perches         2011-06-09  1143  		release_region(ports->start, resource_size(ports));
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1144  	else
31632dbdba85aaf Maciej W. Rozycki   2014-06-06  1145  		release_mem_region(ports->start, resource_size(ports));
7be2c7c96aff287 David Brownell      2007-02-10  1146  	return retval;
7be2c7c96aff287 David Brownell      2007-02-10  1147  }
7be2c7c96aff287 David Brownell      2007-02-10  1148  

:::::: The code at line 938 was first introduced by commit
:::::: 8b5b7958fd1cac54bdca62ec5552c6be0b38def4 rtc: cmos: use generic nvmem

:::::: TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
