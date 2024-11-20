Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877613B7A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 18:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732128749; cv=none; b=mKG88ujSXczbZDaXNhft3vDDzm+PjbKAkRCiRjdxqkmjrNIHQj/CocGZu3UmlHvqL+hhKR4PlUYn6zPvsCE69XWT3ad3T5Jx6nQSkFerakkdcukKpdwKuzhF7cFzfuRKhOxL1Df7saPjFTDDJoMkx5g/GnETlpIQNotqn7U7GmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732128749; c=relaxed/simple;
	bh=eafCvNvLRSklL6SGBt3zgrhL0bmQtEa6Y6DialaSMDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXFXSdXDdZq82OlBf8YRU6quxhAPtdr4OhwDjePenJinlWLtUmRqqpXRrKmSYhR87vMmTZQ6U5kPeyFmD66xD4JsWvjtIdrLK4Wtkj98VwGiNk/fYsxnpANDF4iwad6riei00twgHHUXDHcsf3jDc2rmJiTAGYBbHKfB//fG1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIusMsgK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIusMsgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732128748; x=1763664748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eafCvNvLRSklL6SGBt3zgrhL0bmQtEa6Y6DialaSMDE=;
  b=HIusMsgK2FYooc/l7hhEcSKygJmN839NpJ48VWN0IrOQvTAUfdam0yKJ
   97HUk/H1EsWT3vz4b/rxLIW00UeZFv1CRGIyGhFmGbCPj9LIiJFibHAVI
   QBtRuqJ64GoiIfztGeU2haEepDryHHETHY0hCnmElSzEPqJm8tbMn6cg7
   e76/PcLnfvOGJUJ4nZlU+2tE055HJooAOLCGhGZ+n2xFKR7NpMItrcUeQ
   yp1UWaVoyeC+Ug77+sSHtZKXBo/FA4wdnNEzfZz1+QwGKIYhs9IxaXO1y
   E0Eflov/dWNi7ARq+1ZMvoNXelnOFTVEqD3+IATs3SP9EFddiq2+KVN9k
   A==;
X-CSE-ConnectionGUID: ZgrI5UlTR7eSOEZ7NkaMGw==
X-CSE-MsgGUID: pxoWvdyNSiWOuNjkPnVMfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31574574"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="31574574"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 10:52:27 -0800
X-CSE-ConnectionGUID: EdLoBS6WThao8UHuN5tEsA==
X-CSE-MsgGUID: 0b8ULvsSQQCkUU6tYgVG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="90122701"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2024 10:52:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDpoN-00016D-0G;
	Wed, 20 Nov 2024 18:52:23 +0000
Date: Thu, 21 Nov 2024 02:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/hid/i2c-hid/i2c-hid-core.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202411210209.vjQZaKD8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f49b713adeb7d09d40da433b7700b1666a7d6e32
commit: 211070f39ed4ec7390dca8351c9fee934b8179e7 [1297/1297] HID: i2c-hid: override HID descriptors for certain devices
config: x86_64-buildonly-randconfig-005-20241117 (https://download.01.org/0day-ci/archive/20241121/202411210209.vjQZaKD8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210209.vjQZaKD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210209.vjQZaKD8-lkp@intel.com/

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
>> drivers/hid/i2c-hid/i2c-hid-core.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
