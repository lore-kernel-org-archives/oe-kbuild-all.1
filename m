Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB421D3B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691145086; x=1722681086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eLRamm7ok3AVnSvWKnYGFsxqy8tjT5N5KHa6VhHw5gc=;
  b=UqI4+HMTLk9NNcMFwhHnu1Rgf7sahPOOut9Sh35kRTfM8qTuqu2r4a/S
   J49l5RFoQYPuMOuOGTImT+H3uMGPfwf6PlXb3hrSLsrvHYAZRdadvMwJN
   RDMXnGVShR4ExgNy8/pZnx3fXjNJxARpetoiNV7LNVgAnlEB86TkGK5I+
   HCnw/soYTA1ifKjHKeJplogk41T8V6r3OPx46AqdtUhjp8NAqZ+plS1wm
   dYR/y6sd/HlENl6J+QHe1eXjQBXrvHtXrGGV5bXzB2r7FklrIBROyBkH5
   5mLt/Hfk9ERN7zwuKJfS9IYMT3GZedAduta6GJ7o2+1QdeC+TwOlIIrwh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456497775"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="456497775"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="820081982"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="820081982"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2023 03:31:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRs5a-0002nB-2f;
	Fri, 04 Aug 2023 10:31:22 +0000
Date: Fri, 4 Aug 2023 18:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH RESEND v2 1/2] memcg: Add support for zram object
 charge
Message-ID: <202308041853.kG9rkpcT-lkp@intel.com>
References: <20230804075736.207995-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804075736.207995-1-hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-Add-support-for-zram-object-charge/20230804-155952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230804075736.207995-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH RESEND v2 1/2] memcg: Add support for zram object charge
config: s390-randconfig-r035-20230801 (https://download.01.org/0day-ci/archive/20230804/202308041853.kG9rkpcT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041853.kG9rkpcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041853.kG9rkpcT-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: init/do_mounts.o: in function `obj_cgroup_charge_zram':
>> do_mounts.c:(.text+0x20): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: init/do_mounts.o: in function `obj_cgroup_uncharge_zram':
>> do_mounts.c:(.text+0x28): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/kernel/setup.o: in function `obj_cgroup_charge_zram':
   setup.c:(.text+0x88): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/kernel/setup.o: in function `obj_cgroup_uncharge_zram':
   setup.c:(.text+0x90): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/kernel/uv.o: in function `obj_cgroup_charge_zram':
   uv.c:(.text+0x728): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/kernel/uv.o: in function `obj_cgroup_uncharge_zram':
   uv.c:(.text+0x730): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/init.o: in function `obj_cgroup_charge_zram':
   init.c:(.text+0x0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/init.o: in function `obj_cgroup_uncharge_zram':
   init.c:(.text+0x8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/fault.o: in function `obj_cgroup_charge_zram':
   fault.c:(.text+0x12c0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/fault.o: in function `obj_cgroup_uncharge_zram':
   fault.c:(.text+0x12c8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/vmem.o: in function `obj_cgroup_charge_zram':
   vmem.c:(.text+0x128): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/vmem.o: in function `obj_cgroup_uncharge_zram':
   vmem.c:(.text+0x130): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/pageattr.o: in function `obj_cgroup_charge_zram':
   pageattr.c:(.text+0xa38): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/pageattr.o: in function `obj_cgroup_uncharge_zram':
   pageattr.c:(.text+0xa40): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/pgtable.o: in function `obj_cgroup_charge_zram':
   pgtable.c:(.text+0x160): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/pgtable.o: in function `obj_cgroup_uncharge_zram':
   pgtable.c:(.text+0x168): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/pgalloc.o: in function `obj_cgroup_charge_zram':
   pgalloc.c:(.text+0x648): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/pgalloc.o: in function `obj_cgroup_uncharge_zram':
   pgalloc.c:(.text+0x650): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/cmm.o: in function `obj_cgroup_charge_zram':
   cmm.c:(.text+0x1160): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/cmm.o: in function `obj_cgroup_uncharge_zram':
   cmm.c:(.text+0x1168): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/hugetlbpage.o: in function `obj_cgroup_charge_zram':
   hugetlbpage.c:(.text+0x0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/hugetlbpage.o: in function `obj_cgroup_uncharge_zram':
   hugetlbpage.c:(.text+0x8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: arch/s390/mm/gmap.o: in function `obj_cgroup_charge_zram':
   gmap.c:(.text+0x2588): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: arch/s390/mm/gmap.o: in function `obj_cgroup_uncharge_zram':
   gmap.c:(.text+0x2590): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: virt/kvm/kvm_main.o: in function `obj_cgroup_charge_zram':
   kvm_main.c:(.text+0x3770): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: virt/kvm/kvm_main.o: in function `obj_cgroup_uncharge_zram':
   kvm_main.c:(.text+0x3778): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/fork.o: in function `obj_cgroup_charge_zram':
   fork.c:(.text+0x17a0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/fork.o: in function `obj_cgroup_uncharge_zram':
   fork.c:(.text+0x17a8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/cpu.o: in function `obj_cgroup_charge_zram':
   cpu.c:(.text+0x1c68): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/cpu.o: in function `obj_cgroup_uncharge_zram':
   cpu.c:(.text+0x1c70): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/sysctl.o: in function `obj_cgroup_charge_zram':
   sysctl.c:(.text+0x28d0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/sysctl.o: in function `obj_cgroup_uncharge_zram':
   sysctl.c:(.text+0x28d8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/sys.o: in function `obj_cgroup_charge_zram':
   sys.c:(.text+0x2f78): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/sys.o: in function `obj_cgroup_uncharge_zram':
   sys.c:(.text+0x2f80): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/umh.o: in function `obj_cgroup_charge_zram':
   umh.c:(.text+0x6f8): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/umh.o: in function `obj_cgroup_uncharge_zram':
   umh.c:(.text+0x700): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/pid.o: in function `obj_cgroup_charge_zram':
   pid.c:(.text+0x110): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/pid.o: in function `obj_cgroup_uncharge_zram':
   pid.c:(.text+0x118): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/task_work.o: in function `obj_cgroup_charge_zram':
   task_work.c:(.text+0x48): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/task_work.o: in function `obj_cgroup_uncharge_zram':
   task_work.c:(.text+0x50): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/extable.o: in function `obj_cgroup_charge_zram':
   extable.c:(.text+0x0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/extable.o: in function `obj_cgroup_uncharge_zram':
   extable.c:(.text+0x8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/reboot.o: in function `obj_cgroup_charge_zram':
   reboot.c:(.text+0x590): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/reboot.o: in function `obj_cgroup_uncharge_zram':
   reboot.c:(.text+0x598): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/sched/core.o: in function `obj_cgroup_charge_zram':
   core.c:(.text+0x3908): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/sched/core.o: in function `obj_cgroup_uncharge_zram':
   core.c:(.text+0x3910): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/sched/build_policy.o: in function `obj_cgroup_charge_zram':
   build_policy.c:(.text+0x84d0): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/sched/build_policy.o: in function `obj_cgroup_uncharge_zram':
   build_policy.c:(.text+0x84d8): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/power/process.o: in function `obj_cgroup_charge_zram':
   process.c:(.text+0x618): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/power/process.o: in function `obj_cgroup_uncharge_zram':
   process.c:(.text+0x620): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here
   s390-linux-ld: kernel/rcu/tree.o: in function `obj_cgroup_charge_zram':
   tree.c:(.text+0x9dc8): multiple definition of `obj_cgroup_charge_zram'; init/main.o:main.c:(.text+0x138): first defined here
   s390-linux-ld: kernel/rcu/tree.o: in function `obj_cgroup_uncharge_zram':
   tree.c:(.text+0x9dd0): multiple definition of `obj_cgroup_uncharge_zram'; init/main.o:main.c:(.text+0x140): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
