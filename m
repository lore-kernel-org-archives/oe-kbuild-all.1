Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796D3FF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 02:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779589081; cv=none; b=FpvXDFdt5VavR5nTX6KIOkp8gObVJkExxjdqDBX2yHACoIvgUAex9T2e595DunHPztKdDqfidLxdoMhpnc0AMvrgMGIr9kP5/rjwUpKYgABf8wmofOi92htyAz7qvSN6VFBlojlJSL+kHvyciI021EM1uxlf8EAXEwhk1HieWp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779589081; c=relaxed/simple;
	bh=UjLvoBdJ96R3enUDizfhcbo/t/eOTqIn02EGEoUF8B0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UbWb2glhimuTkxCvvsX4JuBbigX6/dHPmgIXWPRC2G/k3F5ytbWXnLx9ooTz8TNaikUxR15kjNa/9IQWOdTqAK3SJ6To+vPvq7112BGviLD0nAzylPi+vGRMaUNHyfm4OTdwWG51n24aS+/YF4+50+kz7p80L+1YuA75vw4nUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLdFuoBY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLdFuoBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779589078; x=1811125078;
  h=date:from:to:cc:subject:message-id;
  bh=UjLvoBdJ96R3enUDizfhcbo/t/eOTqIn02EGEoUF8B0=;
  b=bLdFuoBYOd86+oawzQH2mBTiklSk9V1JuPhOiwMonwC5KwHtfiZRQn91
   dweHzXJRZJ0+v7824Uh33V1EqgN1h0pQIjKEZElT7Hptuo2dEunKkKPVp
   MyLGmM19MopM2UAEliCcTxsxaGTbCpgSbvxiOfypZVImi8PuK+75Do3JF
   b2tMS4Ad33P8nl6VBoYT/QzirEC9zen0wngkxquI9tcNu4FELsI2TENZG
   jv7BKrJYbiLBeTjoIEqNxiBK5cz1Z18KMWZJv/K4WECCm8x2o8j8TY9hk
   ZDXLwRi/4M6IipH99VClDOpInNfpVSJ6y+5nE0SZJvfMlTue2Kev6ZmaA
   A==;
X-CSE-ConnectionGUID: pSbPMtTcQSa27wHif2d/9A==
X-CSE-MsgGUID: 0SLBNwO4QsGtRzsqOblvgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="84081490"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="84081490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:17:58 -0700
X-CSE-ConnectionGUID: TQ+d2jvrS/2SUO1bUmQ3nw==
X-CSE-MsgGUID: /ijOZIuyQiO7U5+AXQtn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="265111987"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 May 2026 19:17:57 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyPa-00000000BpZ-31oe;
	Sun, 24 May 2026 02:17:54 +0000
Date: Sun, 24 May 2026 04:17:03 +0200
From: kernel test robot <lkp@intel.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/i2c/busses/i2c-designware-platdrv.c:192:13: warning:
 variable 'ret' set but not used
Message-ID: <202605240426.c7AhpZ4M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Hardik-Prakash/i2c-designware-defer-probe-if-child-GpioInt-controllers-are-not-bound/20260524-014648
head:   9dbe3a447e3729f4693bb440f0f3e995422dcfaa
commit: 9dbe3a447e3729f4693bb440f0f3e995422dcfaa i2c: designware: defer probe if child GpioInt controllers are not bound
date:   8 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260524/202605240426.c7AhpZ4M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240426.c7AhpZ4M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240426.c7AhpZ4M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-platdrv.c: In function 'check_child_gpioint':
>> drivers/i2c/busses/i2c-designware-platdrv.c:192:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     192 |         int ret;
         |             ^~~


vim +/ret +192 drivers/i2c/busses/i2c-designware-platdrv.c

   187	
   188	static int check_child_gpioint(struct acpi_device *adev, void *data)
   189	{
   190		struct gpio_dep_ctx *ctx = data;
   191		struct list_head res_list;
 > 192		int ret;
   193	
   194		INIT_LIST_HEAD(&res_list);
   195	
   196		ret = acpi_dev_get_resources(adev, &res_list, check_gpioint_resource, ctx);
   197		acpi_dev_free_resource_list(&res_list);
   198	
   199		if (ctx->ret < 0)
   200			return ctx->ret;
   201	
   202		return 0;
   203	}
   204	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
