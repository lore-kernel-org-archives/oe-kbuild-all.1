Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26B13AC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686914606; x=1718450606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMrJq9Y+/6Xp5caEU5g8EAe4GhXoHtVBP+AXHsirLO8=;
  b=fc+f+fp3r//R+yHFOf4i6pTjkmWp3v2kIrPWaqMp9M6di4Co2i1oYnHI
   gy+0AtV1DSQ38ZPo+wPyfBsto8d6X47VlVhGiyWYUO43XTFZ2+zrZpww3
   Y/408NbWOFBNBVRh6OYaHdLlm/ZlbtLmsqZVIG+xFY5FFnFSyBiQ1DxmH
   GfR8EcsR/w853yBvoZzndXNVG8UwuijXKk1g+bzZSKY9AK9ROtttByBs6
   ctIk48r0v/c4OIvDIbkEVUztjifV1z2ZBOxdcZE+MYzMSkR+yl1MGHR4G
   3QjlW5IDw3VqsVJTEmp7mUccSmmTncjLREv7qpztIwHCyohxfB37QfYCi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="356682756"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="356682756"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 04:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857348761"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="857348761"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2023 04:23:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA7Y3-0001Ah-1a;
	Fri, 16 Jun 2023 11:23:23 +0000
Date: Fri, 16 Jun 2023 19:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 19/20]
 mm/compaction.c:3148:9: error: too many arguments to function
 'register_sysctl_init'
Message-ID: <202306161923.WGsSg16p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: 5e772f5e4567129c1d9e7b0dd05316dcd4ffec6b [19/20] sysctl: Add ARRAY_SIZE to the register_sysctl_init call
config: parisc-randconfig-r025-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161923.WGsSg16p-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161923.WGsSg16p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161923.WGsSg16p-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/compaction.c: In function 'kcompactd_init':
>> mm/compaction.c:3148:9: error: too many arguments to function 'register_sysctl_init'
    3148 |         register_sysctl_init("vm", vm_compaction, ARRAY_SIZE(vm_compaction));
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/umh.h:9,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   include/linux/sysctl.h:248:20: note: declared here
     248 | static inline void register_sysctl_init(const char *path, struct ctl_table *table)
         |                    ^~~~~~~~~~~~~~~~~~~~
--
   drivers/tty/tty_io.c: In function 'tty_init':
>> drivers/tty/tty_io.c:3621:9: error: too many arguments to function 'register_sysctl_init'
    3621 |         register_sysctl_init("dev/tty", tty_table, ARRAY_SIZE(tty_table));
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/key.h:17,
                    from include/linux/cred.h:13,
                    from include/linux/sched/signal.h:10,
                    from drivers/tty/tty_io.c:73:
   include/linux/sysctl.h:248:20: note: declared here
     248 | static inline void register_sysctl_init(const char *path, struct ctl_table *table)
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +/register_sysctl_init +3148 mm/compaction.c

  3132	
  3133	static int __init kcompactd_init(void)
  3134	{
  3135		int nid;
  3136		int ret;
  3137	
  3138		ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
  3139						"mm/compaction:online",
  3140						kcompactd_cpu_online, NULL);
  3141		if (ret < 0) {
  3142			pr_err("kcompactd: failed to register hotplug callbacks.\n");
  3143			return ret;
  3144		}
  3145	
  3146		for_each_node_state(nid, N_MEMORY)
  3147			kcompactd_run(nid);
> 3148		register_sysctl_init("vm", vm_compaction, ARRAY_SIZE(vm_compaction));
  3149		return 0;
  3150	}
  3151	subsys_initcall(kcompactd_init)
  3152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
