Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8B79EB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688838874; x=1720374874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6Tk7aKNAksNU3O0nnkh4EekyJwRkD0HWox2xRCx0Mg=;
  b=iVa920c0dADILlNCVrrhm122fC1i1p6hN/NDwnip+SvOTwdwKPeZEAX9
   CRPYOIeVnqERp5Tkj5yrHI2b9VThL/XzF2jKWbmpRQNEGETz/sYjJK4sf
   w13OoKkSJx5iewQr2YH1b1Q403condcdE2Glnf29V8WI/uv+QAjETZ1Jp
   2Cp3IElEhi/WN6it188sYmX/tP69q5FykgJzeyxg5Aa5dJ770hVNQgkY2
   8OpC6OIO6hXa95iRBwQA6eQUBmYj+/OUVxvR3xz1NXn6G0tYu6Iu6N//3
   sJJtkjLnlQMhmNFC9XQZfz1Panxjgowb79IhAfdmqhlciz+Zt72fplSBk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="362952942"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="362952942"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 10:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="810374492"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="810374492"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2023 10:54:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIC8d-0002q8-2g;
	Sat, 08 Jul 2023 17:54:31 +0000
Date: Sun, 9 Jul 2023 01:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.15.y 9675/9999] drivers/scsi/dpt_i2o.c:1644:30:
 error: 'struct cpuinfo_um' has no member named 'x86'
Message-ID: <202307090133.c0VE2MCo-lkp@intel.com>
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
head:   d54cfc420586425d418a53871290cc4a59d33501
commit: 7a20262fa9ee4f690eea359c7ec1227f9b9477bc [9675/9999] scsi: dpt_i2o: Do not process completions with invalid addresses
config: um-randconfig-r015-20230709 (https://download.01.org/0day-ci/archive/20230709/202307090133.c0VE2MCo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090133.c0VE2MCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307090133.c0VE2MCo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/dpt_i2o.c: In function 'adpt_i386_info':
>> drivers/scsi/dpt_i2o.c:1644:30: error: 'struct cpuinfo_um' has no member named 'x86'
    1644 |         switch (boot_cpu_data.x86) {
         |                              ^


vim +1644 drivers/scsi/dpt_i2o.c

ba3e127ec105e7 Brian Gerst    2015-07-29  1638  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1639  static void adpt_i386_info(sysInfo_S* si)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1640  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1641  	// This is all the info we need for now
^1da177e4c3f41 Linus Torvalds 2005-04-16  1642  	// We will add more info as our new
^1da177e4c3f41 Linus Torvalds 2005-04-16  1643  	// managmenent utility requires it
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1644  	switch (boot_cpu_data.x86) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1645  	case CPU_386:
^1da177e4c3f41 Linus Torvalds 2005-04-16  1646  		si->processorType = PROC_386;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1647  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1648  	case CPU_486:
^1da177e4c3f41 Linus Torvalds 2005-04-16  1649  		si->processorType = PROC_486;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1650  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1651  	case CPU_586:
^1da177e4c3f41 Linus Torvalds 2005-04-16  1652  		si->processorType = PROC_PENTIUM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1653  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1654  	default:  // Just in case 
^1da177e4c3f41 Linus Torvalds 2005-04-16  1655  		si->processorType = PROC_PENTIUM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1656  		break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1657  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  1658  }
8b2cc917a02936 Andrew Morton  2008-05-06  1659  #endif
8b2cc917a02936 Andrew Morton  2008-05-06  1660  

:::::: The code at line 1644 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
