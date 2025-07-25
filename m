Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386301BD4F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753447108; cv=none; b=ilDLQiE6pY1TgI93bfYoB43xiTZfwyyqDUzsFgHU3lqhu4peVcfzS4Z2Y1JxFkcZspmTHLdFh6xNoqUJ2cZXH0LjJbN8mYnMmzm7UA+1c/xdgPo8teXEBJGHi3DnRPbUic3BUuXR5AD5fiZyegqhKpUzQMGA/ZqiGtwm4+zMB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753447108; c=relaxed/simple;
	bh=b3VYvDbr1VCzIZoc7sNrC7bcqWoed97uBl7uZlUavYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkYYDYLZrfINisKyfKaWKejRyLfQzv4IWCaqoWG24NIRABRRIN+B1FGMzl467jKsT/wYxZT+v8xaFGHryTlLllwzw3INPIFp5X/L//HQ/HRYHhdJk0KTBon1nvpmtbRvi/0vrs3jKcrqJ66tmjs/e+neIUMWEpCHGkhAuwDxAjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDYJhz3s; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDYJhz3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753447108; x=1784983108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b3VYvDbr1VCzIZoc7sNrC7bcqWoed97uBl7uZlUavYw=;
  b=GDYJhz3s+FJ2pGzCK2px8juj5CqWEoU0FS3TRqOE2dIWiuu5oHtcnonC
   amRanxK4MCm6TIZP5/4sBpoPACg5YDWzYwLBhVwbZ8ec1ofYBvT1BIxxu
   dwzOr5TAskhrI2c4+WydokGzl2SpnW6/PwvU8ddWIAVjsUL9dcVJLkI59
   N0BD+j8FmCO+XiNyx9Nf8zA8LEto5ku16DebVauEKI/u7/n3oPquc2GG7
   8tO6/D49Lc4s/7HXxnjavfr8FkuJbO+NiSL3QuzSD9fZuUoN33ghRvabw
   XurI3ZWQJDTrYagOx6YdvQ8rVJXmYJy+/N8atIzYNHyI/ILUNSuTkI1Qs
   w==;
X-CSE-ConnectionGUID: 7nV+1uIRSqKdO2SRc8cjEg==
X-CSE-MsgGUID: HM+QGtyYRSah1Ckm2z2QzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55660098"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55660098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 05:38:27 -0700
X-CSE-ConnectionGUID: 4KjYnnrMSJOi/WIFh0Cwng==
X-CSE-MsgGUID: FaYnuWvyTP2Q65DuMPDtaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="198037792"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jul 2025 05:38:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufHgu-000LJr-03;
	Fri, 25 Jul 2025 12:38:24 +0000
Date: Fri, 25 Jul 2025 20:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kiran K <kiran.k@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6] Bluetooth: btintel_pcie: Add support for _suspend() /
 _resume()
Message-ID: <202507252052.DRxW5dr4-lkp@intel.com>
References: <20250725090133.1358775-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725090133.1358775-1-kiran.k@intel.com>

Hi Kiran,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on linus/master v6.16-rc7]
[cannot apply to bluetooth-next/master next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiran-K/Bluetooth-btintel_pcie-Add-support-for-_suspend-_resume/20250725-164819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20250725090133.1358775-1-kiran.k%40intel.com
patch subject: [PATCH v6] Bluetooth: btintel_pcie: Add support for _suspend() / _resume()
config: loongarch-randconfig-001-20250725 (https://download.01.org/0day-ci/archive/20250725/202507252052.DRxW5dr4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507252052.DRxW5dr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507252052.DRxW5dr4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:36,
                    from drivers/bluetooth/btintel_pcie.c:9:
>> drivers/bluetooth/btintel_pcie.c:2454:30: error: 'btintel_pcie_pm_ops' undeclared here (not in a function); did you mean 'btintel_pcie_in_op'?
    2454 |         .driver.pm = pm_ptr(&btintel_pcie_pm_ops),
         |                              ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/bluetooth/btintel_pcie.c:2454:22: note: in expansion of macro 'pm_ptr'
    2454 |         .driver.pm = pm_ptr(&btintel_pcie_pm_ops),
         |                      ^~~~~~


vim +2454 drivers/bluetooth/btintel_pcie.c

  2448	
  2449	static struct pci_driver btintel_pcie_driver = {
  2450		.name = KBUILD_MODNAME,
  2451		.id_table = btintel_pcie_table,
  2452		.probe = btintel_pcie_probe,
  2453		.remove = btintel_pcie_remove,
> 2454		.driver.pm = pm_ptr(&btintel_pcie_pm_ops),
  2455	#ifdef CONFIG_DEV_COREDUMP
  2456		.driver.coredump = btintel_pcie_coredump
  2457	#endif
  2458	};
  2459	module_pci_driver(btintel_pcie_driver);
  2460	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
