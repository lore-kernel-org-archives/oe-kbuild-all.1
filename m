Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170134CF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695750299; x=1727286299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DaZs7qehyilZPAfyL04fRhkzAqwlTg9Xp/6o/VCdsXM=;
  b=gM+lFYzeumbSksa/naMx7gKK3DpkQOnC9b4k2j/qpOe4T1sTX9RNot8q
   wyNRyvChK12+XVFyU0aJMQk4/+Fhi2PvnLH7VFH12T3zDng2zZIeF/xkj
   RiOEX8ZBdZe6r53s0MRDjcRfyK3DkyTqfs549gSV0Fqskx/2krHfY9b6P
   jS423RdOZdIIgRrRzB1Arp9g1QUVNRhbRj1AX0drxGOxBvFjYwEx2QFDk
   dGWlBkEdGM1kEvCkaMJJiX9iIAwULbe5HTx3cKlRXyQeHx4wfPmBTMkrb
   sSS20eLfH0r7wnfqWyn3IzMEmhJCz+buIO+kLyeEPowd01RBiI/9b633g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361007185"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361007185"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922505743"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="922505743"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Sep 2023 10:44:55 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlC7A-0003C8-1l;
	Tue, 26 Sep 2023 17:44:52 +0000
Date: Wed, 27 Sep 2023 01:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 57/92] arch/x86/hyperv/hv_vtl.c:30:25:
 error: 'struct x86_init_mpparse' has no member named 'get_smp_config'
Message-ID: <202309270119.aIRKcVgM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   5fbf54acdbd566c7573587a76105f844685e3ec7
commit: 81e5cc3c3a566261686e43856a7bce622dc53dbe [57/92] x86/mpparse: Switch to new init callbacks
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230927/202309270119.aIRKcVgM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270119.aIRKcVgM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270119.aIRKcVgM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_vtl.c: In function 'hv_vtl_init_platform':
   arch/x86/hyperv/hv_vtl.c:29:25: error: 'struct x86_init_mpparse' has no member named 'find_smp_config'
      29 |         x86_init.mpparse.find_smp_config = x86_init_noop;
         |                         ^
>> arch/x86/hyperv/hv_vtl.c:30:25: error: 'struct x86_init_mpparse' has no member named 'get_smp_config'
      30 |         x86_init.mpparse.get_smp_config = x86_init_uint_noop;
         |                         ^


vim +30 arch/x86/hyperv/hv_vtl.c

3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  18  
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  19  void __init hv_vtl_init_platform(void)
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  20  {
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  21  	pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  22  
cb6aeeb69af06b Saurabh Sengar 2023-04-24  23  	x86_platform.realmode_reserve = x86_init_noop;
cb6aeeb69af06b Saurabh Sengar 2023-04-24  24  	x86_platform.realmode_init = x86_init_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  25  	x86_init.irqs.pre_vector_init = x86_init_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  26  	x86_init.timers.timer_init = x86_init_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  27  
9e2d0c33652470 Saurabh Sengar 2023-06-23  28  	/* Avoid searching for BIOS MP tables */
9e2d0c33652470 Saurabh Sengar 2023-06-23  29  	x86_init.mpparse.find_smp_config = x86_init_noop;
9e2d0c33652470 Saurabh Sengar 2023-06-23 @30  	x86_init.mpparse.get_smp_config = x86_init_uint_noop;
9e2d0c33652470 Saurabh Sengar 2023-06-23  31  
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  32  	x86_platform.get_wallclock = get_rtc_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  33  	x86_platform.set_wallclock = set_rtc_noop;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  34  	x86_platform.get_nmi_reason = hv_get_nmi_reason;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  35  
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  36  	x86_platform.legacy.i8042 = X86_LEGACY_I8042_PLATFORM_ABSENT;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  37  	x86_platform.legacy.rtc = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  38  	x86_platform.legacy.warm_reset = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  39  	x86_platform.legacy.reserve_bios_regions = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  40  	x86_platform.legacy.devices.pnpbios = 0;
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  41  }
3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  42  

:::::: The code at line 30 was first introduced by commit
:::::: 9e2d0c336524706fb327e9b87477f5f3337ad7a6 x86/hyperv: add noop functions to x86_init mpparse functions

:::::: TO: Saurabh Sengar <ssengar@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
