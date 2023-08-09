Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99BB2453E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 20:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691612566; x=1723148566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4eU9jrAcFCqm7N5EQ5EFxWCY7URuCqrD3UfXXYclx5g=;
  b=BfKemxx8ZvDLdxKc5ldUcSQWFMCqGuqlGyJedfTSGN3+c+BQFwOul/2v
   ympZrlWKm6u0OA0URX7LVV22sJEAHS5X9jgxc3iL8q4N1yDGSpesRA65u
   vvnrL0dLEjBMJkLbqRuK9N5aCO+7FxgJcvdbhTLGz0Fe6tp0SOUTULo6w
   E8wSmPa8Vgu2iT8Q1ggKG/XuRxxjxmZQQ/9bOxWw3yFufl7E4wOKwImiV
   sEVmJ4k3tBed+A2DJ7Q9At9MLgS21RV8KvhMkyffTRNshcUnMRzGu6Ye2
   WmpeaadgsXOTeh10BuOljLSThtNFoJgxQKA7xQPDtWWZRo2LQV2kgQzfl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402180974"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="402180974"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 13:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="797326477"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="797326477"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2023 13:22:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTpha-0006Mo-1s;
	Wed, 09 Aug 2023 20:22:42 +0000
Date: Thu, 10 Aug 2023 04:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.15.y 8868/9999] drivers/scsi/dpt_i2o.c:1644:30:
 error: 'struct cpuinfo_um' has no member named 'x86'
Message-ID: <202308100426.vQp3UB9j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   c275eaaaa34260e6c907bc5e7ee07c096bc45064
commit: 7a20262fa9ee4f690eea359c7ec1227f9b9477bc [8868/9999] scsi: dpt_i2o: Do not process completions with invalid addresses
config: um-randconfig-r034-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100426.vQp3UB9j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100426.vQp3UB9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100426.vQp3UB9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/dpt_i2o.c: In function 'adpt_i386_info':
>> drivers/scsi/dpt_i2o.c:1644:30: error: 'struct cpuinfo_um' has no member named 'x86'
    1644 |         switch (boot_cpu_data.x86) {
         |                              ^


vim +1644 drivers/scsi/dpt_i2o.c

ba3e127ec105e79 Brian Gerst    2015-07-29  1638  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1639  static void adpt_i386_info(sysInfo_S* si)
^1da177e4c3f415 Linus Torvalds 2005-04-16  1640  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  1641  	// This is all the info we need for now
^1da177e4c3f415 Linus Torvalds 2005-04-16  1642  	// We will add more info as our new
^1da177e4c3f415 Linus Torvalds 2005-04-16  1643  	// managmenent utility requires it
^1da177e4c3f415 Linus Torvalds 2005-04-16 @1644  	switch (boot_cpu_data.x86) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  1645  	case CPU_386:
^1da177e4c3f415 Linus Torvalds 2005-04-16  1646  		si->processorType = PROC_386;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1647  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1648  	case CPU_486:
^1da177e4c3f415 Linus Torvalds 2005-04-16  1649  		si->processorType = PROC_486;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1650  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1651  	case CPU_586:
^1da177e4c3f415 Linus Torvalds 2005-04-16  1652  		si->processorType = PROC_PENTIUM;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1653  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1654  	default:  // Just in case 
^1da177e4c3f415 Linus Torvalds 2005-04-16  1655  		si->processorType = PROC_PENTIUM;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1656  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1657  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  1658  }
8b2cc917a02936c Andrew Morton  2008-05-06  1659  #endif
8b2cc917a02936c Andrew Morton  2008-05-06  1660  

:::::: The code at line 1644 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
