Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE09289824
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 17:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765646650; cv=none; b=DHbI6efpiPrxXAswZv6Raszy8x3vN3i1LNpidtGtpEOWt43TdTUgBSyDL8lXjK3gCW2YVhdpIwaDYhPhbaetJR+p6iq/IFGJ3hd/VHBHeDV0lBEbmonW9cUJnY6suTT6mFAjFElNluTl7EQ35XqXNbPQv56Uhyse40ZjWZIcc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765646650; c=relaxed/simple;
	bh=atm5Mh9iAaLkSQlB9w/3XhOwd6ejpXJrcWevGPWP6wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fABSRkZtfDlGTCQw+53h0UktIpHvzXyNK2aKYYXJJSdcMc1bW1+YWY5yL0dOlEfebP43DYqqorbp7iAMo7S1VIGbrtUtudh3mXras3mZ0PYqOGJDP2FFpEZHTbfihXCscYCV4yft6pTIXUr5kRT6p/NSNbs8MbvGeRUyamZR6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWTxly8P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWTxly8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765646649; x=1797182649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=atm5Mh9iAaLkSQlB9w/3XhOwd6ejpXJrcWevGPWP6wQ=;
  b=FWTxly8PS74joowLG37apRsQv0ADwwPt9fqIld0yGQgw618ZUwkNFdpY
   jcFzR1bBJyWs4Ak7Ive/Vw+RLWhDcAzhtrTMs/3d5o7cHetAJwfAVhq+s
   6NL5xUiUBBmIKYsw6Y1knkrxTvIWmUtmE1Nq1IQl1sO1Jhqp6kf/9Vgmq
   xVHc1Wrnc2YoBr242C8RjBbcEno9eA85WMS4lOgV+siy/S32y3YVfAJ+0
   RRYSdcjp/G7STWAjNsts2nQhagteM/CuTpsPOK+3OpvyvXS55RrJ6s1Hf
   xMfxcNm/3/0NUc9r1N3KaHEeJ5bmzv8k+0ljpheHDGuThZPU2XL1cHY7w
   Q==;
X-CSE-ConnectionGUID: +tVNdgZbRmK88j/Fvb3zyg==
X-CSE-MsgGUID: 8GxI5TTSQMmH545pv39mfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85211061"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85211061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 09:24:08 -0800
X-CSE-ConnectionGUID: NB2EiI2YQTurxqpKvhvHEA==
X-CSE-MsgGUID: HYbxvd8EQs2DT6zrk9/WfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197405035"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 09:24:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUTLg-000000007z7-2Q2h;
	Sat, 13 Dec 2025 17:24:04 +0000
Date: Sun, 14 Dec 2025 01:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941]
 drivers/platform/x86/intel_speed_select_if/isst_if_common.c:66: warning:
 Function parameter or member 'bus_no' not described in 'isst_if_get_pci_dev'
Message-ID: <202512140153.vqXFeYh3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: a29d78a07cb2dc27dd74e4c2642ff110fd6528ea [1941/1941] Intel: platform/x86: ISST: Store per CPU information
config: x86_64-randconfig-101-20251212 (https://download.01.org/0day-ci/archive/20251214/202512140153.vqXFeYh3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140153.vqXFeYh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140153.vqXFeYh3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.
>> drivers/platform/x86/intel_speed_select_if/isst_if_common.c:66: warning: Function parameter or member 'bus_no' not described in 'isst_if_get_pci_dev'
   drivers/platform/x86/intel_speed_select_if/isst_if_common.c:66: warning: Excess function parameter 'bus_number' description in 'isst_if_get_pci_dev'


vim +66 drivers/platform/x86/intel_speed_select_if/isst_if_common.c

    52	
    53	/**
    54	 * isst_if_get_pci_dev() - Get the PCI device instance for a CPU
    55	 * @cpu: Logical CPU number.
    56	 * @bus_number: The bus number assigned by the hardware.
    57	 * @dev: The device number assigned by the hardware.
    58	 * @fn: The function number assigned by the hardware.
    59	 *
    60	 * Using cached bus information, find out the PCI device for a bus number,
    61	 * device and function.
    62	 *
    63	 * Return: Return pci_dev pointer or NULL.
    64	 */
    65	struct pci_dev *isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn)
  > 66	{
    67		int bus_number;
    68	
    69		if (bus_no < 0 || bus_no > 1 || cpu < 0 || cpu >= nr_cpu_ids ||
    70		    cpu >= num_possible_cpus())
    71			return NULL;
    72	
    73		bus_number = isst_cpu_info[cpu].bus_info[bus_no];
    74		if (bus_number < 0)
    75			return NULL;
    76	
    77		return pci_get_domain_bus_and_slot(0, bus_number, PCI_DEVFN(dev, fn));
    78	}
    79	EXPORT_SYMBOL_GPL(isst_if_get_pci_dev);
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
