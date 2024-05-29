Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A618B1B810
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995235; cv=none; b=c2J9cabaC8NDRqxb9Q4wjFNaY8b5zfmC0VrJ3xWIHFNBMPiUL5Odtqad5jJPagH1XhoyjyxeR/trN7gJ4kFGt9moM379iP5YAwLBVlfE0lAcVjNgl0Ymg8dtk6ACRfZxZ/5cmCq6NIyVo9b2a4ETGIjPE7wOi2ZokpPe80H6deY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995235; c=relaxed/simple;
	bh=CGodxGASuTYguxkcnqiOhet+t7dXhdkloOo/a8z2/Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/u7VMPqpD7OhDPeyRXG6gHa/1ZVf25eIs4vV7CwdxuybD8UvSc5nYYClxg9SNIBNXKT2aHNhsAZ41DLwVEe6C5GJurZoyWsrhQylO/64v+f3dLBtvuZ5vy4eBt9hFCTl6QB36hL+X5QuH76VQSiqFO7ue034wlcKSOEK+p40Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sh4z2b/C; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh4z2b/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716995234; x=1748531234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGodxGASuTYguxkcnqiOhet+t7dXhdkloOo/a8z2/Zc=;
  b=Sh4z2b/CNRB9OgWelfJA7NpdludaFzM08E9vAg6d4MAq1boMP9gDmYwN
   ql56POMSX0M7vx3givi/J7weRflNaXJWITeDOPjHDukQRC/8mhF2k/OBb
   jG7FGF1qNEr+pxfKehS5U38bu30WdOU3ux5GS2+s7A5mJBV98p3uNuGKY
   sRgajJp7pMQsBBGzTxNlInX83YUysNXSUNAoWvXOxz6SNdN/JcgRvzEW6
   1320MXpcVbwhfUKMODSddYEQ/LGI6RFCaHVPj3MfcDSbPLqVOMRNvBLVH
   x1zZ61SZnl70O5OiFFtc+tNugAbGRbOAZZNLuEnfaWPAl1Ts+ShxPMAAC
   g==;
X-CSE-ConnectionGUID: evKy2jotTCeqWjH2AwjLng==
X-CSE-MsgGUID: EUFUHJcSShutMFhrNIHdcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13228692"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13228692"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 08:07:11 -0700
X-CSE-ConnectionGUID: UxWPMbaYQY+4O+krefjQxQ==
X-CSE-MsgGUID: iNZGm82rQp2F5L/YhUkxBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="40323826"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2024 08:07:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCKtO-000DqB-2U;
	Wed, 29 May 2024 15:07:06 +0000
Date: Wed, 29 May 2024 23:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5041/22575]
 drivers/hid/i2c-hid/.tmp_i2c-hid-core.o: warning: objtool: missing symbol
 for section .exit.text
Message-ID: <202405292306.oKi0pqkq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   aec283517697385e25d19ae7312a63bad805b4a7
commit: 211070f39ed4ec7390dca8351c9fee934b8179e7 [5041/22575] HID: i2c-hid: override HID descriptors for certain devices
config: x86_64-buildonly-randconfig-005-20240527 (https://download.01.org/0day-ci/archive/20240529/202405292306.oKi0pqkq-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405292306.oKi0pqkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405292306.oKi0pqkq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:21:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'i2c_hid_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1637:1: note: in expansion of macro 'module_exit'
    1637 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/i2c.h:870:9: note: in expansion of macro 'module_driver'
     870 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:1344:1: note: in expansion of macro 'module_i2c_driver'
    1344 | module_i2c_driver(i2c_hid_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/i2c.h:30,
                    from drivers/hid/i2c-hid/i2c-hid-core.c:22:
   drivers/hid/i2c-hid/i2c-hid-core.c:1344:19: note: 'cleanup_module' target declared here
    1344 | module_i2c_driver(i2c_hid_driver);
         |                   ^~~~~~~~~~~~~~
   include/linux/device.h:1633:20: note: in definition of macro 'module_driver'
    1633 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:1344:1: note: in expansion of macro 'module_i2c_driver'
    1344 | module_i2c_driver(i2c_hid_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'i2c_hid_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1632:1: note: in expansion of macro 'module_init'
    1632 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/i2c.h:870:9: note: in expansion of macro 'module_driver'
     870 |         module_driver(__i2c_driver, i2c_add_driver, \
         |         ^~~~~~~~~~~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:1344:1: note: in expansion of macro 'module_i2c_driver'
    1344 | module_i2c_driver(i2c_hid_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:1344:19: note: 'init_module' target declared here
    1344 | module_i2c_driver(i2c_hid_driver);
         |                   ^~~~~~~~~~~~~~
   include/linux/device.h:1628:19: note: in definition of macro 'module_driver'
    1628 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:1344:1: note: in expansion of macro 'module_i2c_driver'
    1344 | module_i2c_driver(i2c_hid_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/hid/i2c-hid/i2c-hid-core.c: In function '__i2c_hid_command':
   drivers/hid/i2c-hid/i2c-hid-core.c:223:26: warning: array subscript 0 is outside array bounds of 'u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
     223 |                 cmd->data[0] = ihid->hdesc_buffer[registerIndex];
         |                 ~~~~~~~~~^~~
   drivers/hid/i2c-hid/i2c-hid-core.c:98:12: note: while referencing 'data'
      98 |         u8 data[0];
         |            ^~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:224:26: warning: array subscript 1 is outside array bounds of 'u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
     224 |                 cmd->data[1] = ihid->hdesc_buffer[registerIndex + 1];
         |                 ~~~~~~~~~^~~
   drivers/hid/i2c-hid/i2c-hid-core.c:98:12: note: while referencing 'data'
      98 |         u8 data[0];
         |            ^~~~
   drivers/hid/i2c-hid/i2c-hid-core.c:327: warning: Function parameter or member 'data_len' not described in 'i2c_hid_set_or_send_report'
   drivers/hid/i2c-hid/i2c-hid-core.c:327: warning: Excess function parameter 'len' description in 'i2c_hid_set_or_send_report'
>> drivers/hid/i2c-hid/.tmp_i2c-hid-core.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
