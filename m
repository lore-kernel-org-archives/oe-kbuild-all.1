Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135D328B0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDWDB+N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696707144; x=1728243144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eID2xs7VOjDGE/n0dMfVMDLO7I/6XXyQDyHm/wPwt1w=;
  b=fDWDB+N4xLaclqAE3pRVrPIANlDevHtIelCKipqRojHNnUlwBtjL7T8C
   ZZM85shxzza93Ctr0mf7v8rFGoOzjGIncf4ncF/H2ME4LYwUVG4MGXIQO
   HOS5VUi+pUwmclHhrfUmmuu66FUaTJc6BtTTAVueJ0nX7ZtG3UaWUsaTk
   uUOe1tsTjF63hIhy/+EzeFdu8MlNMbDFoIARwqJsEtJ5FBqOujunJLyjL
   +ERg52bKouJyx9M2qVWJt9ZNCsbNvZlyFG3U9mlQ4yesN1INeO1hyERAb
   S7uzPpPBZGh0427dgdbswtVs1KK5vzCSib/cPY9Thma2EzzsX0Q9pFZuy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="374282567"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="374282567"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 12:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="876369100"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="876369100"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Oct 2023 12:32:23 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpD2D-0004hh-2P;
	Sat, 07 Oct 2023 19:32:21 +0000
Date: Sun, 8 Oct 2023 03:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.6.y-rt-rebase 134/170]
 kernel/printk/printk.c:462:1: sparse: sparse: symbol 'legacy_wait' was not
 declared. Should it be static?
Message-ID: <202310080305.GjEqKJOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt-rebase
head:   74b543a7453ca4381247a1e26d71e6e74d1875e4
commit: 56b1722b8c6518a96a900aeea1eba187ccac32c3 [134/170] printk: Add kthread for all legacy consoles
config: i386-randconfig-062-20231007 (https://download.01.org/0day-ci/archive/20231008/202310080305.GjEqKJOh-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310080305.GjEqKJOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310080305.GjEqKJOh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/printk/printk.c:462:1: sparse: sparse: symbol 'legacy_wait' was not declared. Should it be static?
   kernel/printk/printk.c:284:5: sparse: sparse: context imbalance in 'console_srcu_read_lock' - wrong count at exit
   kernel/printk/printk.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:301:9: sparse: sparse: context imbalance in 'console_srcu_read_unlock' - unexpected unlock

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
