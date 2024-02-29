Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A472816FF4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709248706; cv=none; b=MUUYY3pPZzzbLjEh4ay8pengOJv99AbyEW4kzr8qE0QsSCorzr3kRMlJByLMSM86Ij2QIAcsIIDAwvr7OZD39okclc10msQACa6CZu1AA6VEqybc6LvxIlwQ/HLr6/N+5GCMaeTw9TlHomU3+9poPh8T0kc47tXnuIOaDs+kemI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709248706; c=relaxed/simple;
	bh=oq7wJKMiG45ZD859aUTGS0yfHwKiTDjNBAXXyR0Kv0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lu0tHhS2iAQ6ayapBHtjv22RJCLpTSRb7jkvI/qk9C18WnbuwJeOGnYca39DlJQC/kFWueIdEY7ewQM7wjCixICVp7DywSQzhYWX8dufb/02dcBFw2LY3iTaixs7jB3eOIUmSFbPtqWV+fTWK/I17cSap37vC319gkmuennz5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8Tz4RWZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8Tz4RWZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709248705; x=1740784705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oq7wJKMiG45ZD859aUTGS0yfHwKiTDjNBAXXyR0Kv0c=;
  b=X8Tz4RWZjG+gY7/JHiZAIDQTcIBzCYW4dvqWhFGFHDCa/m/FKSTGj8bS
   zM1fCxdEDeUNseNQmjfEt50bKbWxN1nKxmLkgvxjukMiProROsCsAs78Q
   TklaTCeNcvy6gLXOHiLQOj12MMQkg3I0XPeaTPeZerPRfAyFQ89SG/m+A
   VSmT+kNLkxWQeNyePd1VWsMIp2PPZUdYbwC/tcxnqeyOGLGL7vKNnedkc
   VofyQcWHnMujLMo/JCz5nW2TvKzZ+XSHQqpcCNh74wGxRcfcpKVZbGcW/
   ND/LgY9XVL3ysy7rnIXOFuS5LwSBGs5MbKuHIA3KAC2O/KiMt/2fRrI7h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3692125"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3692125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:18:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8383192"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Feb 2024 15:18:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfpeZ-000DLl-1A;
	Thu, 29 Feb 2024 23:17:39 +0000
Date: Fri, 1 Mar 2024 07:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ran Zhou <zhouran10@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3638/3684] drivers/i2c/busses/i2c-hisi.c:476:
 warning: expecting prototype for i2c_dw_acpi_pin_mux_change(). Prototype was
 for i2c_hisi_pin_mux_change() instead
Message-ID: <202403010757.Yy3swMx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3016126ef302b602feaa8a7b99e4f85987536d65
commit: bdc031294c4d4fd6326f9460ceedd37fa1d79195 [3638/3684] i2c: hisi: Add gpio bus recovery support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010757.Yy3swMx9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010757.Yy3swMx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010757.Yy3swMx9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-hisi.c:476: warning: expecting prototype for i2c_dw_acpi_pin_mux_change(). Prototype was for i2c_hisi_pin_mux_change() instead


vim +476 drivers/i2c/busses/i2c-hisi.c

   465	
   466	/**
   467	 * i2c_dw_acpi_pin_mux_change - Change the I2C controller's pin mux through ACPI
   468	 * @dev: device owns the SCL/SDA pin
   469	 * @to_gpio: true to switch to GPIO, false to switch to SCL/SDA
   470	 *
   471	 * The function invokes the specific ACPI method "PMUX" for changing the
   472	 * pin mux of I2C controller between SCL/SDA and GPIO in order to help on
   473	 * the generic GPIO recovery process.
   474	 */
   475	static void i2c_hisi_pin_mux_change(struct device *dev, bool to_gpio)
 > 476	{
   477		acpi_handle handle = ACPI_HANDLE(dev);
   478		struct acpi_object_list arg_list;
   479		unsigned long long data;
   480		union acpi_object arg;
   481	
   482		arg.type = ACPI_TYPE_INTEGER;
   483		arg.integer.value = to_gpio;
   484		arg_list.count = 1;
   485		arg_list.pointer = &arg;
   486	
   487		acpi_evaluate_integer(handle, HISI_I2C_PIN_MUX_METHOD, &arg_list, &data);
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
