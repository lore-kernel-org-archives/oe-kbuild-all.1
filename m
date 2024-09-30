Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96321A2C38
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727727996; cv=none; b=OeSRTJY4+dIOXntu6bkJ3MRWQLIM1dgEBSELjVktFUuRg3IStmV+EGLssWgBr5vdPY8RFrWm6ApzvJ+hmRb3MXCOIUqrYbwyh0kmv0pzLLwD3qFCKgYtC+R7psq4zpfZdIbn//hblu4PXVfu58Q7keXrX3Jq2ZTvapUbgzL5XJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727727996; c=relaxed/simple;
	bh=b/wHWH5VVhWdzsj3+VEhi9GvXYPVka6tkxOpLiU/s3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T9x1X31p0NWz26vBn5ZWsM5qS+QC5cbCoJ/LVmZdjqcyZ3fdsCPOumDWfu4f2VtFfy4KUwHhBY1V4sJJG0c0joSVoQKeZPrRFjpvUziwRGNtFY7wdVTToQPc5KGBCAYBwcnZt2LMfHnmff7OOuP/8lANkoqAMwffaVq7FWD7jVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpQx+v7C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpQx+v7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727727995; x=1759263995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b/wHWH5VVhWdzsj3+VEhi9GvXYPVka6tkxOpLiU/s3s=;
  b=kpQx+v7CjexHVxwk3inzLUBPKsYJFk9W+uzGy4VWHMT/W71azBDffsOM
   XiWnDQnZxlD/3M8YY4OD6IjszT7m9BOPwiY4Qscfjur9mujRywvxskx4y
   vsxEQ6XHAW7E6H2TDZwUuLUHz+KMxwO8XY0lImS9vEe9KnwAiiOUlaZyB
   7gdGye3mii09UXueNt6IccGo4TojavNJMdQeExRQ9AnOUf1+lNOf5LCo7
   QriQlg4yefh0dpDth0uvpyYNOfX24qk2vnNT8LLeX04zJouK7CHUGZD3v
   WNNq0dgk2u4Yp6sQM5fBxLy+sMQZeJphhaznaGAy4PDxFUHbqQ6vMo4oh
   Q==;
X-CSE-ConnectionGUID: BWykgnxURKm3Tjlb+/qlGg==
X-CSE-MsgGUID: 0rZtquODT5GeDpXrfFBWjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38194377"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="38194377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:26:34 -0700
X-CSE-ConnectionGUID: t5wgOt+dRsu/N6DP2bnWTQ==
X-CSE-MsgGUID: cdVa4RluQi+cuibKOn7lPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73834428"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2024 13:26:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svMyU-000Pqr-1M;
	Mon, 30 Sep 2024 20:26:30 +0000
Date: Tue, 1 Oct 2024 04:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5053/23811]
 drivers/platform/x86/.tmp_intel_atomisp2_pm.o: warning: objtool: missing
 symbol for section .init.text
Message-ID: <202410010410.oqbogdcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 1073f9d006321689fb82bdac7b7af58e8617f128 [5053/23811] platform/x86: Add Intel AtomISP2 dummy / power-management driver
config: x86_64-buildonly-randconfig-004-20240923 (https://download.01.org/0day-ci/archive/20241001/202410010410.oqbogdcw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010410.oqbogdcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010410.oqbogdcw-lkp@intel.com/

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
>> drivers/platform/x86/.tmp_intel_atomisp2_pm.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
