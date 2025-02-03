Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E55202C4A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738625083; cv=none; b=GYfbMucB4KRnbfPTfKN65FwZkS1KZ7z1Q2WGKfdRRuP5MBcY1LA1NlzxkOinI1PkSIkUuHmHB/112AdiAbzxfSLwsJW2ie+dqqdWRX3SSzZRK2Wh7yPExTSph4oNJM9LMw9jft4zsWwxfihUPgQr5O2wWPD3qiHaJbuPgjRQqtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738625083; c=relaxed/simple;
	bh=VDGCWIS3pj3H/ivy9W2pv5o/8aPI6vcX4grrt41ohDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eLS2JCTWlKEzC7elgDgSnkuWlWu083Q0TlDM/7r0LhQ1FPeWIj4VtEip+yQuvBN4r6/4//tTdw6qSzHMCnsR6rt/uNWLuTInXCIsssSshWklnkKU5zEaWFMUts7GRSEzG91pnQs5gQApa01jGhV0WqdOaFDAgJX4c3GSwOHM6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBrR6YOo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBrR6YOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738625082; x=1770161082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDGCWIS3pj3H/ivy9W2pv5o/8aPI6vcX4grrt41ohDc=;
  b=GBrR6YOoOY4oSWgYgbHyVi9x6mQPPwQ/XPSdziCHWKN1NbGEhlhQzzMo
   51CWX23IfgfXdUbT+LDOvU1GG2h2O8+TVi0pNZKIobu39ePbSO8rhyBFm
   3foREDYcWzchAxHP9wjDnfeDpnPcK+MrJoX94kG41oEwI59PY7oM23Mm9
   OUr6V+wmRqOPAM2U88enk7Xo3nVRoswxox+vDlRH+KYic6OR/saOx6rP1
   YmPOeVPOjeJES+AN3VDvGmJqMsHFYEG0vCwADSwNMsvnV5omM+vLNQe93
   IszZtz9v1iHn55dcIy5mP4atn86p24J3ywkZC8NOeR/jsmcuXCkYY52sG
   Q==;
X-CSE-ConnectionGUID: Bd0fu7/jR76vJkbCzoG++A==
X-CSE-MsgGUID: P3qP9TyLQjWJVnS5ietIZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50526437"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="50526437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:24:39 -0800
X-CSE-ConnectionGUID: mk2HC/LESuigLaSrGmk89A==
X-CSE-MsgGUID: kQBjX/ieRDWh4WCD6OSomQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115588148"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2025 15:24:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf5nv-000rfz-0s;
	Mon, 03 Feb 2025 23:24:35 +0000
Date: Tue, 4 Feb 2025 07:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>
Subject: [jic23-iio:testing 23/47] drivers/iio/dac/adi-axi-dac.c:731
 axi_dac_bus_set_io_mode() warn: always true condition '(mode >= 0) =>
 (0-u32max >= 0)'
Message-ID: <202502040758.DJqHqhLO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   315198c0a370da031f5c3d504b99f771a0c545ab
commit: 493122c53af1915b4b5b5f47a8c446973ebff052 [23/47] iio: dac: adi-axi-dac: add bus mode setup
config: m68k-randconfig-r071-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040758.DJqHqhLO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040758.DJqHqhLO-lkp@intel.com/

smatch warnings:
drivers/iio/dac/adi-axi-dac.c:731 axi_dac_bus_set_io_mode() warn: always true condition '(mode >= 0) => (0-u32max >= 0)'

vim +731 drivers/iio/dac/adi-axi-dac.c

   724	
   725	static int axi_dac_bus_set_io_mode(struct iio_backend *back,
   726					   enum ad3552r_io_mode mode)
   727	{
   728		struct axi_dac_state *st = iio_backend_get_priv(back);
   729		int ival, ret;
   730	
 > 731		if (!(mode >= AD3552R_IO_MODE_SPI && mode <= AD3552R_IO_MODE_QSPI))
   732			return -EINVAL;
   733	
   734		guard(mutex)(&st->lock);
   735	
   736		ret = regmap_update_bits(st->regmap, AXI_DAC_CUSTOM_CTRL_REG,
   737				AXI_DAC_CUSTOM_CTRL_MULTI_IO_MODE,
   738				FIELD_PREP(AXI_DAC_CUSTOM_CTRL_MULTI_IO_MODE, mode));
   739		if (ret)
   740			return ret;
   741	
   742		return regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, ival,
   743				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0, 10,
   744				100 * KILO);
   745	}
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
