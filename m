Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A36C944
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681851373; x=1713387373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C41dt3v/8BijTKzP97CuhzgscrnYDTBFRURCgPGBuHc=;
  b=XXpoJ3nD4TlCH9YS6xWvnhOX1oTlBqGZ06mwOfcsGGUPToOS4dAZLkaG
   qurr0LqBGEvIA90ydyQxH3R1VUPVbnhsZ0QKX1rvgEdC4WNpq2Og8BUB4
   CVVGYmeSMOcATib106LAQku7n77RX472otgN/uQ8WmfPymwoHwa/WyZIJ
   8STlQemrYgJvGBQ27To3arZ4HBLmiQWwq5NivsiLAShB53NMOypF3byZd
   MwznhJzkiL81QvHdtRzh2EJ1hDfukbqFViwf7FIsDnQ4G2JCPwEL5m/qY
   7S8PozigdjuyNSsFzrpYdscRFyMtK4zwqqFA2SL8HOi5f97PBIOcg3IJq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431566018"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431566018"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 13:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="691244419"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="691244419"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2023 13:56:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1posMy-000e2H-0W;
	Tue, 18 Apr 2023 20:56:08 +0000
Date: Wed, 19 Apr 2023 04:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12115/12616] mm/page_alloc.c:6244:9: error: too
 many arguments to function 'cpu_vm_stats_fold'
Message-ID: <202304190402.keC5huSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4aa1da8d99724f6c0b762b58a71cee7c5e2e109b
commit: 938b4fea29fd04e2e7dc7fbb15bacedeafaa765d [12115/12616] vmstat: add pcp remote node draining via cpu_vm_stats_fold
config: i386-randconfig-a016-20211118 (https://download.01.org/0day-ci/archive/20230419/202304190402.keC5huSY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=938b4fea29fd04e2e7dc7fbb15bacedeafaa765d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 938b4fea29fd04e2e7dc7fbb15bacedeafaa765d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190402.keC5huSY-lkp@intel.com/

Note: the linux-next/master HEAD 4aa1da8d99724f6c0b762b58a71cee7c5e2e109b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'page_alloc_cpu_dead':
>> mm/page_alloc.c:6244:9: error: too many arguments to function 'cpu_vm_stats_fold'
    6244 |         cpu_vm_stats_fold(cpu, false);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/mm.h:2116,
                    from mm/page_alloc.c:19:
   include/linux/vmstat.h:411:20: note: declared here
     411 | static inline void cpu_vm_stats_fold(int cpu) { }
         |                    ^~~~~~~~~~~~~~~~~


vim +/cpu_vm_stats_fold +6244 mm/page_alloc.c

  6223	
  6224	static int page_alloc_cpu_dead(unsigned int cpu)
  6225	{
  6226		struct zone *zone;
  6227	
  6228		lru_add_drain_cpu(cpu);
  6229		mlock_drain_remote(cpu);
  6230		drain_pages(cpu);
  6231	
  6232		/*
  6233		 * Spill the event counters of the dead processor
  6234		 * into the current processors event counters.
  6235		 * This artificially elevates the count of the current
  6236		 * processor.
  6237		 */
  6238		vm_events_fold_cpu(cpu);
  6239	
  6240		/*
  6241		 * Zero the differential counters of the dead processor
  6242		 * so that the vm statistics are consistent.
  6243		 */
> 6244		cpu_vm_stats_fold(cpu, false);
  6245	
  6246		for_each_populated_zone(zone)
  6247			zone_pcp_update(zone, 0);
  6248	
  6249		return 0;
  6250	}
  6251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
