Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7282AEE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728958163; cv=none; b=fw6njfovl6f7e4KLVz5AA6gF/mTiiHZWGT78xCXj7854DiMsk5hPGlkW1nkfnUNTTQLUQwvDpVxk1oFCMoqolW45/EzvTZ3PPxPkDV1ELl9jOhlUQWisa0eFFkemGpfdhlEa/F+Qk5RRxTnSM6GrPu8V4JGgd6wad/s5Sko7xZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728958163; c=relaxed/simple;
	bh=dHPiu04LxvOTr4MrVl8vP+OKvFiiRf/QFTEeJcy5lIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWcW1uXk1xfoLfOmEBIwV4IwvsL/KKhCyB7DZMeVEOuZGDohg7ITyYBKa7t4+oVU+BM1OhZk4g+qoHIrnu5VTYhXWKlaNkxenGoJr8ciZ7d/nDjOw6QyazO9UdtK5derIx3Cr3BPwSArTfz2JRaauVyKBLH5MEKaYXQh+cXgKT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaYHg+Bj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaYHg+Bj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728958161; x=1760494161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dHPiu04LxvOTr4MrVl8vP+OKvFiiRf/QFTEeJcy5lIc=;
  b=ZaYHg+BjZteyTi5hAC2a2jjVEuaGnRiRKnMG5RE+5Ft5dZ6N8tVvdGMc
   yjdb08ABp1In98xUI3BPm63LGImGfDjY3O83EfGYkXtpX6LGlUDzfc8t/
   dfmkjYZTbGVyEXHCQKdS6s9J5ZWZT3PT+YfoCzgpvtZRasbU1xh6wPGTN
   4jlH04wEVy9/ZS86bd+W9teoCOsXUaULwUudqd+YLrGDFiObjdv2HDYPm
   I/F7DDY8sEhVSyZZCuw1xzIQIvS/lPSc1/0dEtx9v+ThIQzEPgG+vzRR2
   GTZTVq53EcF3lPSG5vzgceJXOPshu9/IPLYX++iReHZwGF3WDcchHndZo
   g==;
X-CSE-ConnectionGUID: /KzBRndlRfGQvC74fAt03A==
X-CSE-MsgGUID: F6L/h3+3QmqUqRDWcVJNWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32129041"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32129041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 19:09:21 -0700
X-CSE-ConnectionGUID: 6DxmKyt/TxegrvPeSZXJYw==
X-CSE-MsgGUID: yu3oCnU5R6asCvz5fOE6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="108517071"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2024 19:09:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Wzu-000HTW-00;
	Tue, 15 Oct 2024 02:09:18 +0000
Date: Tue, 15 Oct 2024 10:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Duan Chenghao <duanchenghao@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] USB: Fix the issue of task recovery failure caused by
 USB status when S4 wakes up
Message-ID: <202410151019.CAuGw6eQ-lkp@intel.com>
References: <20241012094633.126736-1-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012094633.126736-1-duanchenghao@kylinos.cn>

Hi Duan,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.12-rc3 next-20241014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Duan-Chenghao/USB-Fix-the-issue-of-task-recovery-failure-caused-by-USB-status-when-S4-wakes-up/20241012-174830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20241012094633.126736-1-duanchenghao%40kylinos.cn
patch subject: [PATCH v3] USB: Fix the issue of task recovery failure caused by USB status when S4 wakes up
config: i386-randconfig-005-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151019.CAuGw6eQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151019.CAuGw6eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151019.CAuGw6eQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/core/hcd-pci.c:637:27: error: 'hcd_pci_freeze' undeclared here (not in a function); did you mean 'hcd_pci_resume'?
     637 |         .freeze         = hcd_pci_freeze,
         |                           ^~~~~~~~~~~~~~
         |                           hcd_pci_resume

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +637 drivers/usb/core/hcd-pci.c

   631	
   632	const struct dev_pm_ops usb_hcd_pci_pm_ops = {
   633		.suspend	= hcd_pci_suspend,
   634		.suspend_noirq	= hcd_pci_suspend_noirq,
   635		.resume_noirq	= hcd_pci_resume_noirq,
   636		.resume		= hcd_pci_resume,
 > 637		.freeze		= hcd_pci_freeze,
   638		.freeze_noirq	= check_root_hub_suspended,
   639		.thaw_noirq	= NULL,
   640		.thaw		= hcd_pci_resume,
   641		.poweroff	= hcd_pci_suspend,
   642		.poweroff_late	= hcd_pci_poweroff_late,
   643		.poweroff_noirq	= hcd_pci_suspend_noirq,
   644		.restore_noirq	= hcd_pci_resume_noirq,
   645		.restore	= hcd_pci_restore,
   646		.runtime_suspend = hcd_pci_runtime_suspend,
   647		.runtime_resume	= hcd_pci_runtime_resume,
   648	};
   649	EXPORT_SYMBOL_GPL(usb_hcd_pci_pm_ops);
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
