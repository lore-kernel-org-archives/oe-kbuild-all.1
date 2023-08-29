Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAF714AAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693342932; x=1724878932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZD6j11WkEG/FCLikzxDvY+KUxcWAydC8eoDS0DSPg0=;
  b=ZQSMLolVEuSGnaWg140aGXeBUMwE6+bz6nFuK8ZPEGfb7SFl6VT5gmZZ
   F1bo1s6BNdbEwN25zZoFy15hgZvwfUgL95R9zv0J9gNBA+u+AMJl+Cfq6
   h4gIh+FkpCiaLO+z6p+i39jEwQ2msXQcy+GCHYE5eXPZHSR35irejFuhc
   g07z28vhNk+buzTXKo6JuNH1Qjgnx+DU3Er97xjMt0cNgc2+h20ay919M
   daLt5EEQJmMquD5RiYPr1/mto0LieCjENfjnJX+sAK4Bslqhf4GKoHbjd
   9x4yzNtbwCjHJrAFT3Wm5oXDTvMhWfV6DkT4sH94PNMeHASiDyiTMny6y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406474827"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="406474827"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 14:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985470346"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="985470346"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2023 14:02:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb5qh-00094y-2p;
	Tue, 29 Aug 2023 21:02:07 +0000
Date: Wed, 30 Aug 2023 05:02:05 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:vcpu-rmk 31/33] acpi_processor.c:undefined reference to
 `arch_unregister_cpu'
Message-ID: <202308300439.Cdlb0WA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm vcpu-rmk
head:   b74a4ba60fbf9e3f5fbcca347176c214dee19a68
commit: 2cffbed2eaeecbf929d5c36313f2f90de5db8702 [31/33] ACPI: add support to register CPUs based on the _STA enabled bit
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230830/202308300439.Cdlb0WA9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300439.Cdlb0WA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300439.Cdlb0WA9-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L38':
   acpi_processor.c:(.text+0x1a8): undefined reference to `arch_register_cpu'
   riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `.L0 ':
   acpi_processor.c:(.text+0x560): undefined reference to `arch_register_cpu'
   riscv64-linux-ld: drivers/acpi/acpi_processor.o: in function `acpi_processor_post_eject':
>> acpi_processor.c:(.text+0x95c): undefined reference to `arch_unregister_cpu'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
