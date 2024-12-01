Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876AC41C64
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733082717; cv=none; b=drD3dBeK7MW/I49+LsLnNRRD83qKPvPSPLqnBk91L+k1RBtWaSE+xhCx2UCVWBAYQfV/kPGZREw9J56ntffCMUDoT5Fv9JxZJFDp5hinIRqPyeSXGYl1Oudr0ZygXDTPvnZ1FnilcreqDxnDShMhEqWL8AK+nYmCj7KYTtVm7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733082717; c=relaxed/simple;
	bh=Xba0MfXHyRYF5opKgN07Qt6aqnJgtlJ250xr9eletC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYfEyLEHcuyW2Y9fh5bxoMATI6+naeQ01bcGcgVv3BRrefhVWd1dgUK8z8qyvv7oY6biMgXKSm+87j14bocOqz6FXyofv/pOw+IT08l+EvQDfyvSc0Jx/dhuH1aOOySXY13AB74nQq0oU6PYXGPj2l5uRX2GRkJSC09Ke6rqmoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6kiBOx9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6kiBOx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733082716; x=1764618716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xba0MfXHyRYF5opKgN07Qt6aqnJgtlJ250xr9eletC8=;
  b=J6kiBOx9BmcDAM89Mbx1KDez8bwHzj54J+osxVbDfIV6GIX0QUWBQv2j
   f900acuQI6evyA2yn8b79fLgIxi070d8bNc32IJuM8NeBxkQA+UUoyTFz
   sxttiD1HouPl548jgFoboAsd+FmNQ8x47WZOyk6UbiQN82DU9a2G12nIZ
   svIiFix6SppazCywlsL32xK/tmogDJ/okomvxfXdSncRAsBr9a00i3Llh
   H374pi1+Oo0YA1F8F69xe/lps4K3qK0XAGGUPBunoBFt6c+cea6nUo6Y/
   A9w+Xt+LhyJaibjlLJubUjcz/lO5KBL/NbwCmJZST7wjCz2pVpJUOwkPC
   Q==;
X-CSE-ConnectionGUID: VGsBj/OKR5CD4Es+uA3Oow==
X-CSE-MsgGUID: JWqqmpxWRXuVZ3/JEGn0wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44626197"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="44626197"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 11:51:52 -0800
X-CSE-ConnectionGUID: J5jERbkHRyutEvDIxcch5w==
X-CSE-MsgGUID: uYZvte0BT3aJJP1OyDiktw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93392887"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2024 11:51:51 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHpyu-0001oP-3C;
	Sun, 01 Dec 2024 19:51:48 +0000
Date: Mon, 2 Dec 2024 03:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298]
 drivers/hid/i2c-hid/i2c-hid-core.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202412020345.oZKo876S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 211070f39ed4ec7390dca8351c9fee934b8179e7 [1298/1298] HID: i2c-hid: override HID descriptors for certain devices
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020345.oZKo876S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020345.oZKo876S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020345.oZKo876S-lkp@intel.com/

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
   drivers/hid/i2c-hid/i2c-hid-core.o: warning: objtool: i2c_hid_parse()+0x41e: sibling call from callable instruction with modified stack frame
   drivers/hid/i2c-hid/i2c-hid-core.o: warning: objtool: i2c_hid_probe()+0x2f: sibling call from callable instruction with modified stack frame
>> drivers/hid/i2c-hid/i2c-hid-core.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
