Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA820E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693396967; x=1724932967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=olszEydngych9ZGjGVI+L2CzfyWaMgI3ngfC5STnP3M=;
  b=LxS66KJ23030zwzzTPm1P/eTbhW0VWRArWOS3VQ9AUt65jSRmdQMZIZV
   Ag14UQQAEPCpzCAnbglDT8dUaKYIIsHCPNyo4oDFD6wR4hGydGLsmSFUU
   xevKDulAjGYb5BbHhPJ70owq1ra4jcjNlUnMYaFe4IN/3qBco2Ee4tTxe
   oHwV4ADviAx6xGl5VBVN6uAsOtAMHWiDKqu2hLJ3ykSA3q+5WNdWBp8wi
   xO64y+BVXyvuD3aEozzS6DxFU3Mw0GcxqJ8VpI3LuXmbZ3TnVjSZy0wr1
   PyPDZTD+cfNtfbgGrKoM+afwwrMawWYNPNxn45+/U/tVGJusYARNZnEPq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374531773"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="374531773"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 05:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804503730"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="804503730"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 05:02:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbJuG-0009nH-2C;
	Wed, 30 Aug 2023 12:02:44 +0000
Date: Wed, 30 Aug 2023 20:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 8811/11214] arch/x86/pci/amd_bus.c:59:16: sparse:
 sparse: cast truncates bits from constant value (fcffffffff becomes
 ffffffff)
Message-ID: <202308301929.UtNM1sWc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   56585460cc2ec44fc5d66924f0a116f57080f0dc
commit: 7fe99c836ebd8e02d5cde4dae7d7559fa1ff2f01 [8811/11214] range.h: Move resource API and constant to respective files
config: i386-randconfig-061-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301929.UtNM1sWc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301929.UtNM1sWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301929.UtNM1sWc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/pci/amd_bus.c:59:16: sparse: sparse: cast truncates bits from constant value (fcffffffff becomes ffffffff)

vim +59 arch/x86/pci/amd_bus.c

    53	
    54	static inline resource_size_t cap_resource(u64 val)
    55	{
    56		if (val > RESOURCE_SIZE_MAX)
    57			return RESOURCE_SIZE_MAX;
    58	
  > 59		return val;
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
