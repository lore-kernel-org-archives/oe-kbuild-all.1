Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B34968EC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024400; cv=none; b=bXBFzV9//9IJHIPXiDygJzsBMyr9h7loqzoWbCgd2wo1dtdhn7gYYG7YqymCoMATUhBXW5eLkdsLW3ny75frKm3gtoF3pJLZj/csGF/wd7FMOI5fAUWJrOxYqJ2UgdQqwhtb3FflKlWjvVQ4PROuP9+lfcDVkFwZQt2HS/MLfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024400; c=relaxed/simple;
	bh=rbk8LuAeM8hU2bwQxcla0HfqP9V+z4b1gglrjPQWbJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L0SK09wFs+X2ptpOZKqeTJN8wovBVqIHWVpBBRefOlZh/GFHv1RCjGDNF6kmHCpCH9EfvvvgTZ3k1Envk9kH2bQZAOSTzrma+uEQZ0uvfbrrKgpz2APQ1w9CUu28Bf9ziOinnSUVr7nPgDfBBg+lLs5Y/VKPMNH/90kX80DxUOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nu0yCd/l; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nu0yCd/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781024399; x=1812560399;
  h=date:from:to:cc:subject:message-id;
  bh=rbk8LuAeM8hU2bwQxcla0HfqP9V+z4b1gglrjPQWbJc=;
  b=nu0yCd/ljjVgrssNKIHDSYBbm4h7aXXWW5cizgNC3IeQ/J505IKaQ9kW
   EKWh60ATx74bHuVXoXz/KEk3Qj/R/Y10pNxg8bn6RWxX3lWYFyIGSjI1v
   jA1IsKgp9auRuvIrmNg0ohNg7SImKlAAUlq0io2sIjx1ZWEIDWX51y9zv
   qRBvQuCpmrAJBbyT6B8z5Io3TNcRDXx5PloGrryCfSCi7Pf2v8gLvOW+z
   UzBIQiZZNkR44lpni5ZnUqYQTSs7PRVuaHE8aAmLF3YLRRPbWhtKysvUW
   n+d3QKBfkjhKzFQTWvSaWGMvPZ0W6Uyk0WKSWLt0Trlkik2XSsX/CIOAJ
   w==;
X-CSE-ConnectionGUID: NQ611wVEQsyjH4sWhMS5KA==
X-CSE-MsgGUID: gvMC6q5jSgucpC3Dibu7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81700947"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="81700947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 09:59:58 -0700
X-CSE-ConnectionGUID: W3pZ8iz6R1uSSn5wGSqFGw==
X-CSE-MsgGUID: 1/ouQuPVTMap2S2BmTuhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="244774255"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jun 2026 09:59:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWznt-00000000KKA-2fIq;
	Tue, 09 Jun 2026 16:59:53 +0000
Date: Wed, 10 Jun 2026 00:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 31/31]
 drivers/hid/spi-hid/spi-hid-core.c:406: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202606100119.Ao2G6d6E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a4d01e77dd885e0545ecd445e2facf156ddf42f5
commit: 667bc515971290b51b8c92d1ad647810d117ed92 [31/31] CHROMIUM: HID: spi_hid: add device tree support for SPI over HID
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260610/202606100119.Ao2G6d6E-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100119.Ao2G6d6E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100119.Ao2G6d6E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-core.c:361:8: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     361 | static const u32 spi_hid_get_timeout(struct spi_hid *shid)
         |        ^~~~~
   drivers/hid/spi-hid/spi-hid-core.c:252:13: warning: 'spi_hid_resume' defined but not used [-Wunused-function]
     252 | static void spi_hid_resume(struct spi_hid *shid)
         |             ^~~~~~~~~~~~~~
   drivers/hid/spi-hid/spi-hid-core.c:247:13: warning: 'spi_hid_suspend' defined but not used [-Wunused-function]
     247 | static void spi_hid_suspend(struct spi_hid *shid)
         |             ^~~~~~~~~~~~~~~
--
>> drivers/hid/spi-hid/spi-hid-core.c:406: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Handle the reset response from the FW by sending a request for the device


vim +406 drivers/hid/spi-hid/spi-hid-core.c

b92291c9316fb3 Angela Czubak  2023-03-24  360  
890ead8d6ab51b Jingyuan Liang 2026-01-15 @361  static const u32 spi_hid_get_timeout(struct spi_hid *shid)
890ead8d6ab51b Jingyuan Liang 2026-01-15  362  {
890ead8d6ab51b Jingyuan Liang 2026-01-15  363  	struct device *dev = &shid->spi->dev;
890ead8d6ab51b Jingyuan Liang 2026-01-15  364  	u32 timeout;
890ead8d6ab51b Jingyuan Liang 2026-01-15  365  
890ead8d6ab51b Jingyuan Liang 2026-01-15  366  	timeout = READ_ONCE(shid->ops->response_timeout_ms);
890ead8d6ab51b Jingyuan Liang 2026-01-15  367  
890ead8d6ab51b Jingyuan Liang 2026-01-15  368  	if (timeout < SPI_HID_RESPONSE_TIMEOUT_MS || timeout > 10000) {
890ead8d6ab51b Jingyuan Liang 2026-01-15  369  		dev_warn(dev, "Response timeout is out of range, using default %d",
890ead8d6ab51b Jingyuan Liang 2026-01-15  370  			SPI_HID_RESPONSE_TIMEOUT_MS);
890ead8d6ab51b Jingyuan Liang 2026-01-15  371  		timeout = SPI_HID_RESPONSE_TIMEOUT_MS;
890ead8d6ab51b Jingyuan Liang 2026-01-15  372  	}
890ead8d6ab51b Jingyuan Liang 2026-01-15  373  
890ead8d6ab51b Jingyuan Liang 2026-01-15  374  	return timeout;
890ead8d6ab51b Jingyuan Liang 2026-01-15  375  }
890ead8d6ab51b Jingyuan Liang 2026-01-15  376  
b92291c9316fb3 Angela Czubak  2023-03-24  377  static int spi_hid_sync_request(struct spi_hid *shid,
b92291c9316fb3 Angela Czubak  2023-03-24  378  				struct spi_hid_output_report *report)
b92291c9316fb3 Angela Czubak  2023-03-24  379  {
b92291c9316fb3 Angela Czubak  2023-03-24  380  	struct device *dev = &shid->spi->dev;
890ead8d6ab51b Jingyuan Liang 2026-01-15  381  	u32 timeout;
b92291c9316fb3 Angela Czubak  2023-03-24  382  	int ret = 0;
b92291c9316fb3 Angela Czubak  2023-03-24  383  
b92291c9316fb3 Angela Czubak  2023-03-24  384  	ret = spi_hid_send_output_report(shid, report);
b92291c9316fb3 Angela Czubak  2023-03-24  385  	if (ret)
b92291c9316fb3 Angela Czubak  2023-03-24  386  		return ret;
890ead8d6ab51b Jingyuan Liang 2026-01-15  387  
890ead8d6ab51b Jingyuan Liang 2026-01-15  388  	if (shid->quirks & SPI_HID_QUIRK_MODE_SWITCH)
890ead8d6ab51b Jingyuan Liang 2026-01-15  389  		timeout = spi_hid_get_timeout(shid);
890ead8d6ab51b Jingyuan Liang 2026-01-15  390  	else
890ead8d6ab51b Jingyuan Liang 2026-01-15  391  		timeout = SPI_HID_RESPONSE_TIMEOUT_MS;
890ead8d6ab51b Jingyuan Liang 2026-01-15  392  
b92291c9316fb3 Angela Czubak  2023-03-24  393  	mutex_lock(&shid->data_lock);
b92291c9316fb3 Angela Czubak  2023-03-24  394  	ret = wait_for_completion_interruptible_timeout(&shid->output_done,
890ead8d6ab51b Jingyuan Liang 2026-01-15  395  							msecs_to_jiffies(timeout));
b92291c9316fb3 Angela Czubak  2023-03-24  396  	mutex_unlock(&shid->data_lock);
b92291c9316fb3 Angela Czubak  2023-03-24  397  	if (ret == 0) {
b92291c9316fb3 Angela Czubak  2023-03-24  398  		dev_err(dev, "Response timed out.");
b92291c9316fb3 Angela Czubak  2023-03-24  399  		return -ETIMEDOUT;
b92291c9316fb3 Angela Czubak  2023-03-24  400  	}
b92291c9316fb3 Angela Czubak  2023-03-24  401  
b92291c9316fb3 Angela Czubak  2023-03-24  402  	return 0;
b92291c9316fb3 Angela Czubak  2023-03-24  403  }
b92291c9316fb3 Angela Czubak  2023-03-24  404  
b92291c9316fb3 Angela Czubak  2023-03-24  405  /**
b92291c9316fb3 Angela Czubak  2023-03-24 @406   * Handle the reset response from the FW by sending a request for the device
b92291c9316fb3 Angela Czubak  2023-03-24  407   * descriptor.
b92291c9316fb3 Angela Czubak  2023-03-24  408   */
b92291c9316fb3 Angela Czubak  2023-03-24  409  static void spi_hid_reset_response_work(struct work_struct *work)
b92291c9316fb3 Angela Czubak  2023-03-24  410  {
b92291c9316fb3 Angela Czubak  2023-03-24  411  	struct spi_hid *shid =
b92291c9316fb3 Angela Czubak  2023-03-24  412  		container_of(work, struct spi_hid, reset_response_work);
b92291c9316fb3 Angela Czubak  2023-03-24  413  	struct device *dev = &shid->spi->dev;
b92291c9316fb3 Angela Czubak  2023-03-24  414  	struct spi_hid_output_report report = {
b92291c9316fb3 Angela Czubak  2023-03-24  415  		.report_type = DEVICE_DESCRIPTOR,
b92291c9316fb3 Angela Czubak  2023-03-24  416  		.content_length = 0x0,
b92291c9316fb3 Angela Czubak  2023-03-24  417  		.content_id = SPI_HID_OUTPUT_REPORT_CONTENT_ID_DESC_REQUEST,
b92291c9316fb3 Angela Czubak  2023-03-24  418  		.content = NULL,
b92291c9316fb3 Angela Czubak  2023-03-24  419  	};
b92291c9316fb3 Angela Czubak  2023-03-24  420  	int ret;
b92291c9316fb3 Angela Czubak  2023-03-24  421  
1505afcc64152d Jingyuan Liang 2025-07-13  422  	trace_spi_hid_reset_response_work(shid);
1505afcc64152d Jingyuan Liang 2025-07-13  423  
b92291c9316fb3 Angela Czubak  2023-03-24  424  	if (shid->ready) {
b92291c9316fb3 Angela Czubak  2023-03-24  425  		dev_err(dev, "Spontaneous FW reset!");
b92291c9316fb3 Angela Czubak  2023-03-24  426  		shid->ready = false;
b92291c9316fb3 Angela Czubak  2023-03-24  427  		shid->dir_count++;
b92291c9316fb3 Angela Czubak  2023-03-24  428  	}
b92291c9316fb3 Angela Czubak  2023-03-24  429  
b92291c9316fb3 Angela Czubak  2023-03-24  430  	if (shid->power_state == HIDSPI_OFF)
b92291c9316fb3 Angela Czubak  2023-03-24  431  		return;
b92291c9316fb3 Angela Czubak  2023-03-24  432  
b92291c9316fb3 Angela Czubak  2023-03-24  433  	if (flush_work(&shid->create_device_work))
b92291c9316fb3 Angela Czubak  2023-03-24  434  		dev_err(dev, "Reset handler waited for create_device_work");
b92291c9316fb3 Angela Czubak  2023-03-24  435  
b92291c9316fb3 Angela Czubak  2023-03-24  436  	if (flush_work(&shid->refresh_device_work))
b92291c9316fb3 Angela Czubak  2023-03-24  437  		dev_err(dev, "Reset handler waited for refresh_device_work");
b92291c9316fb3 Angela Czubak  2023-03-24  438  
b92291c9316fb3 Angela Czubak  2023-03-24  439  	ret = spi_hid_sync_request(shid, &report);
b92291c9316fb3 Angela Czubak  2023-03-24  440  	if (ret) {
b92291c9316fb3 Angela Czubak  2023-03-24  441  		dev_WARN_ONCE(dev, true,
b92291c9316fb3 Angela Czubak  2023-03-24  442  			      "Failed to send device descriptor request.");
b92291c9316fb3 Angela Czubak  2023-03-24  443  		schedule_work(&shid->error_work);
b92291c9316fb3 Angela Czubak  2023-03-24  444  	}
b92291c9316fb3 Angela Czubak  2023-03-24  445  }
b92291c9316fb3 Angela Czubak  2023-03-24  446  

:::::: The code at line 406 was first introduced by commit
:::::: b92291c9316fb3a648229c33c00c2420aa9e83f4 CHROMIUM: HID: spi-hid: add transport driver for HID over SPI bus

:::::: TO: Angela Czubak <acz@semihalf.com>
:::::: CC: chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
