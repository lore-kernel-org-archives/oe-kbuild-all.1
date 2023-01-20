Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188B633C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 17:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674234494; x=1705770494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3iiFcA9m8pM6I4SvLmcpTW51Hnv74dxEXrvbLCMITSM=;
  b=kU6t6iRui3hwhAXCJjL/KGH8ZAWEmzHSJDNxTkK7K8ShZeo5iuPKFHq1
   m5PIRvSRWoNHFvUZXfEKoNnLC68xR8594WBoOvf5Ynljvtyf6/8e4oBfe
   fvXJUWZ22jHmGQC5YIPRNb9sUpcL1hGFqF7M00Sg62g1FEgSINjnEDeko
   d2xwc5I1XXBXnRNUVQqswI8rEQ3QnhKdYQpB5orVsteG44IOGoltbqLpR
   Z/EnzvOC+d9SQfq6tMebhWR/JcuAIDUxQVyItrEvy4OPI2GR7VeDbLMkx
   EryGeqby3XJiUWIY5hCCWjcsqnwtdoZcxgmLTLF5/hVMy8/OHlKGEOxPU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323319020"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="323319020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 09:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691118732"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="691118732"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 09:04:12 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIuoF-0002jG-2V;
	Fri, 20 Jan 2023 17:04:11 +0000
Date: Sat, 21 Jan 2023 01:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yu-chen-surf:sis_v5_nr_llc 2/2] kernel/sched/fair.c:6285:12: error:
 use of undeclared identifier 'sd_llc_size'
Message-ID: <202301210045.nDmUr6sk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yu-chen-surf/linux.git sis_v5_nr_llc
head:   3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735
commit: 3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735 [2/2] sched/fair: Introduce SIS_SHORT to choose the CPU where short task is running during wake up
config: arm-randconfig-r006-20230119 (https://download.01.org/0day-ci/archive/20230121/202301210045.nDmUr6sk-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/yu-chen-surf/linux/commit/3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735
        git remote add yu-chen-surf https://github.com/yu-chen-surf/linux.git
        git fetch --no-tags yu-chen-surf sis_v5_nr_llc
        git checkout 3753aece2c7a2a05e8e4ed4447ce0b1bd1ffb735
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:6285:12: error: use of undeclared identifier 'sd_llc_size'
                   (per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
                            ^
>> kernel/sched/fair.c:6285:12: error: use of undeclared identifier 'sd_llc_size'
>> kernel/sched/fair.c:6285:4: error: indirection requires pointer operand ('void' invalid)
                   (per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:269:28: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/sd_llc_size +6285 kernel/sched/fair.c

  6267	
  6268	/*
  6269	 * If a task switches in and then voluntarily relinquishes the
  6270	 * CPU quickly, it is regarded as a short duration task.
  6271	 *
  6272	 * SIS_SHORT tries to wake up the wakee on current CPU. This
  6273	 * aims to avoid race condition among CPUs due to frequent context
  6274	 * switch.
  6275	 *
  6276	 * Besides, in a system with large number of CPUs per LLC,
  6277	 * the SIS_SHORT inhits the spreading of short task more.
  6278	 * This is because the short duration task is more likely to
  6279	 * trigger race condition among many CPUs.
  6280	 */
  6281	static inline int is_short_task(struct task_struct *p, int cpu)
  6282	{
  6283		return sched_feat(SIS_SHORT) && p->se.dur_avg &&
  6284		       ((p->se.dur_avg * 1024) <
> 6285			(per_cpu(sd_llc_size, cpu) * sysctl_sched_min_granularity));
  6286	}
  6287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
