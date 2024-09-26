Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A717BEB1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727376583; cv=none; b=a/PCajS9t7G1Si6o5jgaPxuMdauys5VwGRbEjwUntE7QQr/K8Te71aicUyjClVc0TEndT8o/XzDhRqC5goA4sEA2MXmjeax1ORtNtphYmLyiT601exki1ZP/6SqRua2nZgwPNmr8Du2LKQMwXoHxsNZgRDCw9XJdsU4vdAMKX0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727376583; c=relaxed/simple;
	bh=Gx9mMqir6Z5KUeNsj3gPpKDtI2CwgP5rpc/M60NLNUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fu74zD2mM5Xux8pofXNhSIYBIvwGJPEai+MesWWM0VFUIc5WDUySmKbC7IUDm9OcxxoHQnFlgNgFqBXzgwakQC/oksoFagZay6WBJAjIc4F90HSspF0s/RQSqy2S9yjhCXxXbhQiFecBXy/qgoPRjyf03+4c0WbROKlvXNElLTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8l0Ip+6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8l0Ip+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727376582; x=1758912582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gx9mMqir6Z5KUeNsj3gPpKDtI2CwgP5rpc/M60NLNUg=;
  b=A8l0Ip+6OcOXFs3LRP0j0wMoB1B7pGUA8W/aAP5kSB7uL7Wj5EtHJEm8
   i9D1ZLOeqovBgkTctxjXOETuEQ0TRJB83YsLYU14nvdPGdSN2lIVPVq93
   9iKm8OypRhaM2SDUAXzqHBzAd4Ne5DwZAg13TFXJwvq1BDuWjtjDxiM25
   NXDcWK48TF/XMTJGWJYl/avvgZIuCPF7ZOvpBtytfw77gKJsoYmPP+DRP
   yk924g1OPvuwLJHEGtwPFyabEetoD8kavHV6ieSCsXo4+aTTjnO3UI72Z
   8jcJmEmD26Z0kl8cLHIQkcBbOlo8gR18ebI09vNl1aAljVntFxkUMGbWq
   A==;
X-CSE-ConnectionGUID: MbnKjwCGSlWii8DsXlEeMQ==
X-CSE-MsgGUID: 4TZzZbNnSfewvdKJ8v2eVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="25969894"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="25969894"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:49:41 -0700
X-CSE-ConnectionGUID: Ujt5+YoGQMCWro2emZwwxA==
X-CSE-MsgGUID: RcacPpWISSSdw40rTu3Mag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="76773504"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 11:49:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sttYX-000L79-1f;
	Thu, 26 Sep 2024 18:49:37 +0000
Date: Fri, 27 Sep 2024 02:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5053/23779]
 drivers/platform/x86/intel_atomisp2_pm.o: warning: objtool: missing symbol
 for section .init.text
Message-ID: <202409270224.SJPfAkVu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b1d54e6f06c518a52f83edade0da2b959e1c9a4e
commit: 1073f9d006321689fb82bdac7b7af58e8617f128 [5053/23779] platform/x86: Add Intel AtomISP2 dummy / power-management driver
config: x86_64-buildonly-randconfig-001-20240926 (https://download.01.org/0day-ci/archive/20240927/202409270224.SJPfAkVu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270224.SJPfAkVu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270224.SJPfAkVu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/x86/intel_atomisp2_pm.c:15:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'isp_pci_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1637:1: note: in expansion of macro 'module_exit'
    1637 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/pci.h:1335:9: note: in expansion of macro 'module_driver'
    1335 |         module_driver(__pci_driver, pci_register_driver, pci_unregister_driver)
         |         ^~~~~~~~~~~~~
   drivers/platform/x86/intel_atomisp2_pm.c:115:1: note: in expansion of macro 'module_pci_driver'
     115 | module_pci_driver(isp_pci_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/pci.h:32,
                    from drivers/platform/x86/intel_atomisp2_pm.c:17:
   drivers/platform/x86/intel_atomisp2_pm.c:115:19: note: 'cleanup_module' target declared here
     115 | module_pci_driver(isp_pci_driver);
         |                   ^~~~~~~~~~~~~~
   include/linux/device.h:1633:20: note: in definition of macro 'module_driver'
    1633 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/platform/x86/intel_atomisp2_pm.c:115:1: note: in expansion of macro 'module_pci_driver'
     115 | module_pci_driver(isp_pci_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'isp_pci_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1632:1: note: in expansion of macro 'module_init'
    1632 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/pci.h:1335:9: note: in expansion of macro 'module_driver'
    1335 |         module_driver(__pci_driver, pci_register_driver, pci_unregister_driver)
         |         ^~~~~~~~~~~~~
   drivers/platform/x86/intel_atomisp2_pm.c:115:1: note: in expansion of macro 'module_pci_driver'
     115 | module_pci_driver(isp_pci_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/platform/x86/intel_atomisp2_pm.c:115:19: note: 'init_module' target declared here
     115 | module_pci_driver(isp_pci_driver);
         |                   ^~~~~~~~~~~~~~
   include/linux/device.h:1628:19: note: in definition of macro 'module_driver'
    1628 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/platform/x86/intel_atomisp2_pm.c:115:1: note: in expansion of macro 'module_pci_driver'
     115 | module_pci_driver(isp_pci_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/platform/x86/intel_atomisp2_pm.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
