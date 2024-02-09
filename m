Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF821D542
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707482188; cv=none; b=LErjA48+BLRbEuhIeDH3vILY5lPV4gDs+uFCJ8lErDme5SZrB0uTyLGk9yA9SBZprENS7gbgxfzL3E37J+k08XRBMPW/OF3fEDvcS//2Qr1/EKUM0QNck4lsAu3hXoeFs7LVTPjCNlSbIgVRxQXbZgF8gMnj9MteZP42EzaJdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707482188; c=relaxed/simple;
	bh=FV8fXky9FG0OtWv83rDAwC7VloGQD4NOk9CdOsVkehU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUz3oLW0o7g/5DF0v9T7Jbl63Bhr8Svq1LMBlVshQeXheQY9KDN/+D9AqtglTVDoj9FT8PvTrU5YaginjY+TVSoZp7aTXbM1qcGALUXZ3+6NS4+JcULxf92CRtFnmg5uic8/sWLYcsHA1JtKV4J/F9ties2mM7r/a83BwwR/OPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J56g6ezx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J56g6ezx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707482186; x=1739018186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FV8fXky9FG0OtWv83rDAwC7VloGQD4NOk9CdOsVkehU=;
  b=J56g6ezxEfZjDJ0fY9xr7iqIM1wP+7oqt4rlOwIbFeznWIDtnufeDGKA
   hMxqsVuuEujJCZfGxn8BK83UJQmz4G0B93lgNoS7sFgz4pySqstqkHcIU
   7w0WPmgxMp+Xp9s3BXBuJ6aZPqkK6KKLRzmSjpph/Tc9WMeYAk99DslxK
   J9WKGICY3kBXYSl1S6HwenHiB2rNXK4gTOmbNLcoNMUbR5RnhjN7ZhSz2
   lI6f1Gbg7klznW0SugNlRZCIm7So8UqhvVGfS8MCv4+oGbC20I6rqY9oY
   QqJHwBEKM1Dcf2TK2TwiRHVrqHIhCoOx1f6AN6ExehPK3qx5kkAQQOnc7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1317043"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1317043"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 04:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="25161859"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2024 04:36:25 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYQ7D-0004jC-0U;
	Fri, 09 Feb 2024 12:36:23 +0000
Date: Fri, 9 Feb 2024 20:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4877/17898]
 drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here
 (not in a function); did you mean 'adp5585_pwm_of_match'?
Message-ID: <202402092010.ID5tvhkh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: b2a8faf2b13f5346016ac80c42173ac714536584 [4877/17898] Merge branch 'pwm/next' into next
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240209/202402092010.ID5tvhkh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402092010.ID5tvhkh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402092010.ID5tvhkh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-adp5585.c:12:
>> drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here (not in a function); did you mean 'adp5585_pwm_of_match'?
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_of__adp5585_of_match_device_table' aliased to undefined symbol 'adp5585_of_match'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/pwm/pwm-adp5585.c:213:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +213 drivers/pwm/pwm-adp5585.c

92c8b45586c149 Clark Wang 2022-03-16  208  
92c8b45586c149 Clark Wang 2022-03-16  209  static const struct of_device_id adp5585_pwm_of_match[] = {
92c8b45586c149 Clark Wang 2022-03-16  210  	{.compatible = "adp5585-pwm", },
92c8b45586c149 Clark Wang 2022-03-16  211  	{ /* sentinel */ }
92c8b45586c149 Clark Wang 2022-03-16  212  };
92c8b45586c149 Clark Wang 2022-03-16 @213  MODULE_DEVICE_TABLE(of, adp5585_of_match);
92c8b45586c149 Clark Wang 2022-03-16  214  

:::::: The code at line 213 was first introduced by commit
:::::: 92c8b45586c149160a8a29356d97cdd721d9717a MLK-25922-1 pwm: adp5585: add adp5585 PWM support

:::::: TO: Clark Wang <xiaoning.wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
