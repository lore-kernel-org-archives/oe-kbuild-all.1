Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD84623AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 04:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674103594; x=1705639594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkHwTFvlBOXwohRc0KvxOy6IuIg2CxV2ncIB1zbIDnk=;
  b=M3+MZKTIl19I7R8ovuJ7G5rPrv4t/8U2cj3sInm9namWE+8iXH8iL2jI
   AmlfUsDaKgtU8kOeB02FyTwyV+PP1btGeCz3OJwDdIVWpTxS6XAPImtWE
   //sNeLaIWCeNaIPBBpDhQ5WyOc5f+IrxLRzsLZosECAfaKPWefXL4Tp82
   99vZuFTFey+2CMmqi0ryv3iJ/vC9KFh2TiIWxe5P2RtV80bT5t8eSX5Bc
   /Zsy1Fgn/AieAZ1M3rK2DVCM74p6j3A5muqpHgTqjzHOXKvMr/gnBeQRn
   q0WvMb75VWfz8fGnDoESqZ0wpSwJzRRnPwD9hh8QvRyR9BXAqewPigJnS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327266813"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="327266813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 20:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692281220"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="692281220"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Jan 2023 20:46:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIMoq-00015u-06;
	Thu, 19 Jan 2023 04:46:32 +0000
Date: Thu, 19 Jan 2023 12:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 25/27]
 kernel/trace/ftrace.c:5595:22: warning: variable 'err' set but not used
Message-ID: <202301191214.ACiV9GxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   747784185d106a06b429736196d8817cb2d12a6f
commit: 553555d3ff275b63f8edf8a7b20861d4a01c8918 [25/27] ftrace: Add add_direct_functions_hash function
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230119/202301191214.ACiV9GxE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=553555d3ff275b63f8edf8a7b20861d4a01c8918
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout 553555d3ff275b63f8edf8a7b20861d4a01c8918
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:299:5: warning: no previous prototype for '__register_ftrace_function' [-Wmissing-prototypes]
     299 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:342:5: warning: no previous prototype for '__unregister_ftrace_function' [-Wmissing-prototypes]
     342 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4009:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    4009 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'add_direct_functions_hash':
>> kernel/trace/ftrace.c:5595:22: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    5595 |         int size, i, err;
         |                      ^~~


vim +/err +5595 kernel/trace/ftrace.c

  5590	
  5591	static int add_direct_functions_hash(struct ftrace_hash *hash, unsigned long addr,
  5592					     struct ftrace_hash **free_hash)
  5593	{
  5594		struct ftrace_func_entry *entry, *new;
> 5595		int size, i, err;
  5596	
  5597		/* Make sure requested entries are not already registered.. */
  5598		size = 1 << hash->size_bits;
  5599		for (i = 0; i < size; i++) {
  5600			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  5601				if (ftrace_find_rec_direct(entry->ip))
  5602				return -EINVAL;
  5603			}
  5604		}
  5605	
  5606		/* ... and insert them to direct_functions hash. */
  5607		err = -ENOMEM;
  5608		for (i = 0; i < size; i++) {
  5609			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  5610				new = ftrace_add_rec_direct(entry->ip, addr, free_hash);
  5611				if (!new)
  5612					return -ENOMEM;
  5613				entry->direct = addr;
  5614			}
  5615		}
  5616		return 0;
  5617	}
  5618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
