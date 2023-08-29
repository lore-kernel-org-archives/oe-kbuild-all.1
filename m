Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9351643E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 19:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693335763; x=1724871763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/g8YXesJpd/8cA+G/gZDyCPHp38ZRyPKnVlFRmZ71s=;
  b=SVivpzqu/bPDUpBGt8G9ygmPRJ+oh8T1ZyuCZzRyyqcdE0/Vu3dfLVEI
   ly5502sUmQ5yOzhv+C5moN+O5aZWjAFhxUf79LcEY3gerX6KyvXwMF/MO
   +re8MTF8spKFdXEHn8C3MqVbAAVv9idNA8//R7F25K9YKwzx/P3CZ7I8i
   R/dKm5UEQLyYoFm0DTPp2n46plp8YDi636s6wFqywfFjcEHEjFYSNiHAL
   wPNs4vxGT96Qzno+9jYYoUQ8+s0YGAX7A3jedmDmQdCgLofugevNLoMXj
   IsirG+lDAM0RC6gqgqD5CUbaA2HOBaXOEdQjE+XbGDuITyDsc/oPtU3P3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375413718"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="375413718"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 12:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804228757"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="804228757"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 12:02:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb3z6-00090R-2H;
	Tue, 29 Aug 2023 19:02:40 +0000
Date: Wed, 30 Aug 2023 03:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:vcpu-rmk 14/33] acpi_processor.c:undefined reference to
 `arch_register_cpu'
Message-ID: <202308300215.FNVKPSZ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm vcpu-rmk
head:   0323df7ea91d4251b74aaec23acb6c00d3876786
commit: 1bdc37567e31bfa9efa38d08538cc019c9d554fe [14/33] ACPI: processor: Register CPUs that are online, but not described in the DSDT
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230830/202308300215.FNVKPSZ2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300215.FNVKPSZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300215.FNVKPSZ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L38':
>> acpi_processor.c:(.text+0x1a8): undefined reference to `arch_register_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
