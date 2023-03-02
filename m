Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F41C10
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 08:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677745752; x=1709281752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JbvEOgRD/9yBlnpYnj5dg0KCkibhWhc0cCGA/A13VhM=;
  b=f3GXI2EAmdJFzvJc8WpvKDgnNh7UCv4/101CxQuM85t3BcAptL6/2Ujf
   UidczYQG8RMi5fVMWB4GehhR663wBY+G6qtgX+HiVKuyS/9pZtdqfW3Ay
   4IphYUYSrD+EtDjczeVGiyftZeqc+qliViP4Ay9bCIZuNAqVXOM3nvP1B
   cgoGsFztTL9mxgMo1kngkHYCPkg8sv3Fk+9hVjpi3ozesMkbR2sblcd/z
   xPNzjxgTNpe9QvGd2AkE4KVbszPmoDytXK2tAQZa+1ta2bRV3ESk/UWF3
   VWNGKXnP6olSQDdENwqikEDySxzRFf82eDHTuOLgGJfUUeMFcOidErldS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420918894"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="420918894"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 00:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="652325477"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="652325477"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Mar 2023 00:29:09 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXeJI-0000Lg-1H;
	Thu, 02 Mar 2023 08:29:08 +0000
Date: Thu, 2 Mar 2023 16:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1795/21173]
 kernel/sched/cpupri.c:55:44: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202303021651.fQRFJg8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   8d57344e75e938637d5ef2542f57792787fbacdc
commit: 3adfd8e344ac32845eb3c15743f90a7e3b49dcf3 [1795/21173] ANDROID: sched: avoid placing RT threads on cores handling softirqs
config: arm64-randconfig-s041-20230302 (https://download.01.org/0day-ci/archive/20230302/202303021651.fQRFJg8R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout 3adfd8e344ac32845eb3c15743f90a7e3b49dcf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021651.fQRFJg8R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/cpupri.c:55:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/cpupri.c:55:44: sparse:     expected struct task_struct *task
   kernel/sched/cpupri.c:55:44: sparse:     got struct task_struct [noderef] __rcu *

vim +55 kernel/sched/cpupri.c

    43	
    44	#ifdef CONFIG_RT_SOFTINT_OPTIMIZATION
    45	/**
    46	 * drop_nopreempt_cpus - remove likely nonpreemptible cpus from the mask
    47	 * @lowest_mask: mask with selected CPUs (non-NULL)
    48	 */
    49	static void
    50	drop_nopreempt_cpus(struct cpumask *lowest_mask)
    51	{
    52		unsigned cpu = cpumask_first(lowest_mask);
    53		while (cpu < nr_cpu_ids) {
    54			/* unlocked access */
  > 55			struct task_struct *task = READ_ONCE(cpu_rq(cpu)->curr);
    56			if (task_may_not_preempt(task, cpu)) {
    57				cpumask_clear_cpu(cpu, lowest_mask);
    58			}
    59			cpu = cpumask_next(cpu, lowest_mask);
    60		}
    61	}
    62	#endif
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
