Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388016D9C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735073115; cv=none; b=uC0oo4UvunTInxsf2XG7BXCq+sYeW+nAswt/wuXe+NqecAYijdtodbo4bYVy5VY3x/kJ4aaT/DWji8oVtNORawTLo8/ywtv4EjPGul3MT285z1sjwd+mPE6nPT/nZokR6iniHn613MWJ4eLoDCZh9fibo+W7KIv5ND6mOgLcAIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735073115; c=relaxed/simple;
	bh=UFgVDJfgzYV1XJ45Z945dvSUoBZD3tv4rbeH3Ll9cLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvWBBZR1CbVeaGe49BuahuIrzAIqa9yVScTMvhuRPv7I6vLQTwG0Ect4VUN70IrvxrJCNubFki2epNxF9kaGZEUtY9H4+MHgGRmsmgvW9qAWZqoIaYacj9WBX9j3A1GHUVRYC0wZB9W8BN0DecCO52ul2eF7W+jgtZUF5YCc0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaYNIPro; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaYNIPro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735073113; x=1766609113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFgVDJfgzYV1XJ45Z945dvSUoBZD3tv4rbeH3Ll9cLo=;
  b=HaYNIProKe8hFU4i5ztQuq6zS6Unyt58X3m61yXMEft3wzphAFKBKHuH
   9JozYaKRyJHAIJT462QjeTRInCN6gg7mDTipC2ecBJpsXsRmeUWOGadcN
   TLnif7wo5ZODIAd1AUAdmKlyJT+NYC/ABK9ld4BJSp6PlzkRsZ3jpgWK3
   GIydOkQiw1hWimILxCY8fTlWSGP1iPQQyHSUrTXlGWmBDCKnOCPtJfRmH
   zxS5rv4k8wmQT3wtrG2/LV+F7TKye+oT5pGdJzLsWlqS4fhk7sXwPUZj+
   z6LZzYGTbdMw72yqva3RHPK6E+RCv6CGQ3fTD+7GcbwpbMwUfOVKyQTm3
   g==;
X-CSE-ConnectionGUID: rfckuyXMR4mGZR9BDNa1oA==
X-CSE-MsgGUID: pxxGuo7pTbmhAv8t4jOSSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="53070829"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="53070829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 12:45:12 -0800
X-CSE-ConnectionGUID: DR2JDLWlTc6/SNSF/Q3jDQ==
X-CSE-MsgGUID: +SBGrvMBTYq58Ds5WZ6g3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="104530192"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2024 12:45:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQBm7-0001RU-3B;
	Tue, 24 Dec 2024 20:45:07 +0000
Date: Wed, 25 Dec 2024 04:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1345/1345]
 drivers/hid/i2c-hid/.tmp_i2c-hid-core.o: warning: objtool: missing symbol
 for section .init.text
Message-ID: <202412250406.LdESsxQc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33267d4a7f512d371a3ea853568832174be4caba
commit: 211070f39ed4ec7390dca8351c9fee934b8179e7 [1345/1345] HID: i2c-hid: override HID descriptors for certain devices
config: x86_64-buildonly-randconfig-002-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250406.LdESsxQc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250406.LdESsxQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250406.LdESsxQc-lkp@intel.com/

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
   drivers/hid/i2c-hid/i2c-hid-core.c:327: warning: Function parameter or member 'data_len' not described in 'i2c_hid_set_or_send_report'
   drivers/hid/i2c-hid/i2c-hid-core.c:327: warning: Excess function parameter 'len' description in 'i2c_hid_set_or_send_report'
   drivers/hid/i2c-hid/.tmp_i2c-hid-core.o: warning: objtool: i2c_hid_parse()+0x302: sibling call from callable instruction with modified stack frame
   drivers/hid/i2c-hid/.tmp_i2c-hid-core.o: warning: objtool: i2c_hid_probe()+0x20: sibling call from callable instruction with modified stack frame
>> drivers/hid/i2c-hid/.tmp_i2c-hid-core.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
