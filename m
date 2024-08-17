Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20620E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723878153; cv=none; b=fBOydQ7lk5OpvK4sdkYGx4fG9xiniR/Bimmcv9p9APyoBLJ0CgmG+zS13FfeTkZO9EvUBWe+/IgxDFv7hnAbDHilz7jfyZ2hU4rRzx2yXG4M0RuRblZqFRbGOEP2OIst11eJD0XCO11YCnyor05kZdq8BtKfVsZLJbqGjUPFTZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723878153; c=relaxed/simple;
	bh=iSpF/mCKwP2kMA9RX5SgHuK0KCEdF67H78OBVY1U0B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cN4IA6UaRwLQh3t0z0k07oBNvCN9Vn2WxsQPql/Uy5MJBJ0b43z5AMVqtY48uL1MNyGHNamE7Fu3UEH5y4ZVLGtSvq40XeusXGsyNsjZ2ZwqbOJBvYn7PCDLxYFfzGeWD4febJnWH2Bf28sLW68+7isIcXZ97/3kKpZf6Qe9yvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+FEuZJv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+FEuZJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723878151; x=1755414151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iSpF/mCKwP2kMA9RX5SgHuK0KCEdF67H78OBVY1U0B4=;
  b=M+FEuZJvMNJkhmbVQlNFfsWcDcmP8oEAld6Dh4oRDdZUu/NR5/0EmSUD
   K6oC5VPP/cR8Q6G4kcAfp+APuzR3se2piWAViCBHXMYa0luPNiY+YanYI
   o3Wncn/MWHQgrmtEtn3b2eMY20ZzQz5IEG8eyu/1s7O1RWQgulJA5LBXe
   xk7Y/i60s41iOBVOlgKhANiU8zhvOhsXEAgaF8Cje1dNg8mpJoFo7jTyT
   tCqmRN1T3RUAUQz6xR7hyrFKQkxWjAgu1WkXCRqxHQ2d+2/pWbLgVIlLT
   gSRw5WF4X4T0F3IuHrXbNlbeYVlxCrvWOOL6EHiokjbNLZhRW57lG91qc
   g==;
X-CSE-ConnectionGUID: I5MekLBSRIqWHbGjmgRwzw==
X-CSE-MsgGUID: ZyGpglXUQficAiUaJgQCyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32750522"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="32750522"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 00:02:30 -0700
X-CSE-ConnectionGUID: 6ksG3WbkSVqTxgCLADCezA==
X-CSE-MsgGUID: /meEtEMXTleQY+hJQGGknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="59888404"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2024 00:02:29 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfDSF-0007Fs-0H;
	Sat, 17 Aug 2024 07:02:27 +0000
Date: Sat, 17 Aug 2024 15:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
Message-ID: <202408171404.nikI07eq-lkp@intel.com>
References: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Replace-a-while-loop-by-for-loop/20240817-011616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240816171225.3506844-6-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
config: i386-buildonly-randconfig-001-20240817 (https://download.01.org/0day-ci/archive/20240817/202408171404.nikI07eq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171404.nikI07eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171404.nikI07eq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-platdrv.c:480:36: warning: 'dw_i2c_acpi_match' defined but not used [-Wunused-const-variable=]
     480 | static const struct acpi_device_id dw_i2c_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-designware-platdrv.c:472:34: warning: 'dw_i2c_of_match' defined but not used [-Wunused-const-variable=]
     472 | static const struct of_device_id dw_i2c_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +/dw_i2c_of_match +472 drivers/i2c/busses/i2c-designware-platdrv.c

   471	
 > 472	static const struct of_device_id dw_i2c_of_match[] = {
   473		{ .compatible = "snps,designware-i2c", },
   474		{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
   475		{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
   476		{}
   477	};
   478	MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
