Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9FD1C16
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 03:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689305914; x=1720841914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pEMJQYjEHxlkbPowvlBM6Iqfl3/rq6R/BJFtfIC5m1I=;
  b=LtOrABrERFu0SPTJZWXay1dW79CxjXh4KcIMjMkxM941TMj5kkfKsi0F
   +/Ah7nfxZ3mYhx6WlZm9tfyZRToo9JuCbfoZ1VbQoDhJ7FrCNyX3fBpPo
   nrfQFC1esr1WPgXpUpSm4yqUQyzrSfkxtR7568VRQmvgXOBtaiOgiWyxX
   XIJ7yzeTmxjD/nZt1G+l0NuGaonuXgAMtfWZyWuBHS4FtIIaVJIxZ7pSe
   JKbrp76QbJRD6idNBswxfbn2UvmOkSG6SfQJ9QXQB0UFuZrp4TzrNAFKX
   Gnfc5mOzQfl3BLlTTp8vkGclvY8MDpynOGjcLXPJrML6WAsRLuNzNjJXo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362845494"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="362845494"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 20:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716181665"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="716181665"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Jul 2023 20:38:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK9dM-000797-21;
	Fri, 14 Jul 2023 03:38:20 +0000
Date: Fri, 14 Jul 2023 11:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 25/57]
 arch/x86/kernel/apic/apic_common.c:47:6: warning: no previous prototype for
 'default_init_apic_ldr'
Message-ID: <202307141110.Q0qDerfU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   39d1f9d6ad3d4b9bf9c298db5685f22d8fe6e2c0
commit: e7719cffb7321ace1a049e51ea5c27e0e9744c47 [25/57] x86/apic: Nuke empty init_apic_ldr() callbacks
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230714/202307141110.Q0qDerfU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141110.Q0qDerfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141110.Q0qDerfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic_common.c:47:6: warning: no previous prototype for 'default_init_apic_ldr' [-Wmissing-prototypes]
      47 | void default_init_apic_ldr(void)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/default_init_apic_ldr +47 arch/x86/kernel/apic/apic_common.c

    42	
    43	/*
    44	 * Set up the logical destination ID when the APIC operates in logical
    45	 * destination mode.
    46	 */
  > 47	void default_init_apic_ldr(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
