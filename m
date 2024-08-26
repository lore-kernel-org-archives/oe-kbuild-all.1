Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6B13C17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686459; cv=none; b=LAHXpHAfnZokqNBZOpONaC5MMZWeFgD2vWPQeCx239/qroTrVqqNHrZGbgR+3l2enPzlo2s5/s+8v8Gztdko6i8EqSPLayapLX0M/C2IYpohno/IcTfxEzjRJEAr8H64AyViu97iZmlriYGGbubUPoJSyq78CMgIKhjacgTcX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686459; c=relaxed/simple;
	bh=gi8HJl40tWv2dd4MmvKCXCZM2dhIkilsST7oNUF7m24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/TV7vJ5SqHPJNGzr8RPrH49v8frn1UXE4yTWPRH2obQm3YPqyHJ+kvcAIxcWCKud3FsFE1OPwAP3cmeqQNmr9LWkbPerb5Guq5qRf1zVMdMMFhSejC0YUs4K3HSeSJ3FJ4SciuEeQZXdqN+BOYqM30bCQKepIGZzDr2bIkwRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWIF7yYH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWIF7yYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724686457; x=1756222457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gi8HJl40tWv2dd4MmvKCXCZM2dhIkilsST7oNUF7m24=;
  b=jWIF7yYHZnuF8RWBT9Wzs7EQeAXTVWzturWCgiVLDtThgfzGBOeeeTof
   84PBcK4VSDtIpu9OM5P6aWuCdO0ft6/FKPlwu4ciOEyloiKxZXPTr8PGO
   LRlysAa0bgN6/cxCfA/8fitrtemgv9euyEDPLB4VkEZHSgSagsWjmwWwh
   rWoNcN+NZ3+i6Qpse4+nOveFL938/NnTDvGcibRkE4CTLcL2qYbFtxvgZ
   JUGYOY3Lp55MhYKykeDVX31CBPsinkIu8gf/1Ln7reQC8KGD0TPWEyAsD
   QTAsALW1Lkn2xNOOi4ZNkDzZzOEjSNo14675lOYDx1BH4kQHgSPL9UPJH
   w==;
X-CSE-ConnectionGUID: 8RwznYdvTbyTJPdvBKUtFw==
X-CSE-MsgGUID: 8Bj6dKUVSkC28fDwgEbVtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22925950"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22925950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 08:34:16 -0700
X-CSE-ConnectionGUID: OMHXyXqCQh+QanXWuNtozQ==
X-CSE-MsgGUID: yXGUlNmkTCytHGNoeIdG0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="67445374"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Aug 2024 08:34:11 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sibjM-000HEd-27;
	Mon, 26 Aug 2024 15:34:08 +0000
Date: Mon, 26 Aug 2024 23:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] i2c: designware: Consolidate PM ops
Message-ID: <202408262323.oYp5VaxV-lkp@intel.com>
References: <20240823163057.1175381-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823163057.1175381-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on next-20240826]
[cannot apply to linus/master v6.11-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Consolidate-PM-ops/20240826-171118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240823163057.1175381-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] i2c: designware: Consolidate PM ops
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240826/202408262323.oYp5VaxV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262323.oYp5VaxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262323.oYp5VaxV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/i2c/busses/i2c-designware-platdrv.c:11:
>> drivers/i2c/busses/i2c-designware-platdrv.c:383:35: error: 'dw_i2c_dev_pm_ops' undeclared here (not in a function)
     383 |                 .pm     = pm_ptr(&dw_i2c_dev_pm_ops),
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:48:44: note: in definition of macro 'PTR_IF'
      48 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/i2c/busses/i2c-designware-platdrv.c:383:27: note: in expansion of macro 'pm_ptr'
     383 |                 .pm     = pm_ptr(&dw_i2c_dev_pm_ops),
         |                           ^~~~~~


vim +/dw_i2c_dev_pm_ops +383 drivers/i2c/busses/i2c-designware-platdrv.c

2373f6b9744d53 Dirk Brandewie   2011-10-29  375  
2373f6b9744d53 Dirk Brandewie   2011-10-29  376  static struct platform_driver dw_i2c_driver = {
6ad6fde3970c98 Jarkko Nikula    2015-08-31  377  	.probe = dw_i2c_plat_probe,
e190a0c389e601 Uwe Kleine-König 2023-05-08  378  	.remove_new = dw_i2c_plat_remove,
2373f6b9744d53 Dirk Brandewie   2011-10-29  379  	.driver		= {
2373f6b9744d53 Dirk Brandewie   2011-10-29  380  		.name	= "i2c_designware",
231da4058f0ae9 Andy Shevchenko  2024-08-19  381  		.of_match_table = dw_i2c_of_match,
231da4058f0ae9 Andy Shevchenko  2024-08-19  382  		.acpi_match_table = dw_i2c_acpi_match,
a9e4d8b641bc6c Paul Cercueil    2023-07-22 @383  		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
2373f6b9744d53 Dirk Brandewie   2011-10-29  384  	},
61e05bad821cb2 Andy Shevchenko  2024-04-25  385  	.id_table = dw_i2c_platform_ids,
2373f6b9744d53 Dirk Brandewie   2011-10-29  386  };
2373f6b9744d53 Dirk Brandewie   2011-10-29  387  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
