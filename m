Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FF160
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 22:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675895780; x=1707431780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vcz0p1ffkG4vcNLHuDO0b2Hs0jLEg1Uf4S0AoeDy1k4=;
  b=KRKDQTl6fKHSG9gWnMt9TyQL6ckO5CiRCEtlhq9l54cmH4ujPdUcoTzP
   FEgSXe+Qu912uUr3A1vnW8O2WYImXKPomAJ2UcsGyZIjnGNeY0MOwQGTh
   f4i3h94UgNxYAxxBK8K+iiN2pAWpGvYj4xY03aqrILF1YIgFKfw9/5bbB
   BilWbCaM3U3kffz+qO1A6oZFf90gDIUR2Teo/xnR6Q/rWMhpoR9Zv31CM
   DIL5gl3ZxEtas/EY++lCpCziwIyaeMygISYqMXCuQhQ5qh6Jsm8T8zElC
   Q5CrQ7/r0ZQUhKfAtVkRycdCyCWY+SBPqAtsJ4UER5Y/YPyEnteKjPqZH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="357344662"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="357344662"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 14:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="912879515"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="912879515"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Feb 2023 14:36:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPt32-0004ge-0Q;
	Wed, 08 Feb 2023 22:36:16 +0000
Date: Thu, 9 Feb 2023 06:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: drivers/clocksource/timer-clint.c:237:36: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202302090640.TTyRdnHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aurelien,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 6df2a016c0c8a3d0933ef33dd192ea6606b115e3 riscv: fix build with binutils 2.38
date:   12 months ago
config: riscv-randconfig-s052-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090640.TTyRdnHU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6df2a016c0c8a3d0933ef33dd192ea6606b115e3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6df2a016c0c8a3d0933ef33dd192ea6606b115e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clocksource/ drivers/scsi/esas2r/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302090640.TTyRdnHU-lkp@intel.com

sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-clint.c:237:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void * @@     got struct clock_event_device [noderef] __percpu * @@
   drivers/clocksource/timer-clint.c:237:36: sparse:     expected void *
   drivers/clocksource/timer-clint.c:237:36: sparse:     got struct clock_event_device [noderef] __percpu *
--
   drivers/scsi/esas2r/esas2r_ioctl.c:321:23: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:322:23: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:333:25: sparse: sparse: cast to restricted __le16
   drivers/scsi/esas2r/esas2r_ioctl.c:334:29: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:334:29: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:334:29: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:355:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctrl_code @@     got restricted __le32 [usertype] @@
   drivers/scsi/esas2r/esas2r_ioctl.c:355:31: sparse:     expected unsigned int [usertype] ctrl_code
   drivers/scsi/esas2r/esas2r_ioctl.c:355:31: sparse:     got restricted __le32 [usertype]
   drivers/scsi/esas2r/esas2r_ioctl.c:356:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] target_id @@     got restricted __le16 [usertype] @@
   drivers/scsi/esas2r/esas2r_ioctl.c:356:31: sparse:     expected unsigned short [usertype] target_id
   drivers/scsi/esas2r/esas2r_ioctl.c:356:31: sparse:     got restricted __le16 [usertype]
   drivers/scsi/esas2r/esas2r_ioctl.c:357:31: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:419:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] csmi_status @@     got restricted __le32 [usertype] @@
   drivers/scsi/esas2r/esas2r_ioctl.c:419:57: sparse:     expected unsigned int [usertype] csmi_status
   drivers/scsi/esas2r/esas2r_ioctl.c:419:57: sparse:     got restricted __le32 [usertype]
   drivers/scsi/esas2r/esas2r_ioctl.c:425:29: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:425:29: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:425:29: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:569:39: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:600:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] csmi_status @@     got restricted __le32 [usertype] @@
   drivers/scsi/esas2r/esas2r_ioctl.c:600:49: sparse:     expected unsigned int [usertype] csmi_status
   drivers/scsi/esas2r/esas2r_ioctl.c:600:49: sparse:     got restricted __le32 [usertype]
   drivers/scsi/esas2r/esas2r_ioctl.c:632:21: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:642:22: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:697:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:1013:37: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:1013:37: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:1013:37: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:1015:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] length @@     got restricted __le32 [usertype] @@
   drivers/scsi/esas2r/esas2r_ioctl.c:1015:38: sparse:     expected unsigned int [usertype] length
   drivers/scsi/esas2r/esas2r_ioctl.c:1015:38: sparse:     got restricted __le32 [usertype]
   drivers/scsi/esas2r/esas2r_ioctl.c:1030:45: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:1030:45: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:1030:45: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:1032:45: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:1032:45: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:1032:45: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:1041:45: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:1041:45: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:1041:45: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:1044:45: sparse: sparse: invalid assignment: |=
   drivers/scsi/esas2r/esas2r_ioctl.c:1044:45: sparse:    left side has type unsigned int
   drivers/scsi/esas2r/esas2r_ioctl.c:1044:45: sparse:    right side has type restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c: note: in included file:
   drivers/scsi/esas2r/esas2r.h:1307:13: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r.h:1307:13: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r.h:1307:13: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r.h:1307:13: sparse: sparse: cast to restricted __le32
   drivers/scsi/esas2r/esas2r_ioctl.c:956:39: sparse: sparse: memset with byte count of 524288
   drivers/scsi/esas2r/esas2r_ioctl.c: note: in included file (through arch/riscv/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
>> include/asm-generic/uaccess.h:92:15: sparse: sparse: memcpy with byte count of 524320

vim +237 drivers/clocksource/timer-clint.c

d5be89a8d118a8 Palmer Dabbelt 2020-09-14  204  
2ac6795fcc085e Anup Patel     2020-08-17  205  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
2ac6795fcc085e Anup Patel     2020-08-17  206  
2ac6795fcc085e Anup Patel     2020-08-17  207  	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
2ac6795fcc085e Anup Patel     2020-08-17  208  	if (rc) {
2ac6795fcc085e Anup Patel     2020-08-17  209  		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
2ac6795fcc085e Anup Patel     2020-08-17  210  		goto fail_iounmap;
2ac6795fcc085e Anup Patel     2020-08-17  211  	}
2ac6795fcc085e Anup Patel     2020-08-17  212  
2ac6795fcc085e Anup Patel     2020-08-17  213  	sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
2ac6795fcc085e Anup Patel     2020-08-17  214  
2ac6795fcc085e Anup Patel     2020-08-17  215  	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
2ac6795fcc085e Anup Patel     2020-08-17  216  				 "clint-timer", &clint_clock_event);
2ac6795fcc085e Anup Patel     2020-08-17  217  	if (rc) {
2ac6795fcc085e Anup Patel     2020-08-17  218  		pr_err("registering percpu irq failed [%d]\n", rc);
2ac6795fcc085e Anup Patel     2020-08-17  219  		goto fail_iounmap;
2ac6795fcc085e Anup Patel     2020-08-17  220  	}
2ac6795fcc085e Anup Patel     2020-08-17  221  
2ac6795fcc085e Anup Patel     2020-08-17  222  	rc = cpuhp_setup_state(CPUHP_AP_CLINT_TIMER_STARTING,
2ac6795fcc085e Anup Patel     2020-08-17  223  				"clockevents/clint/timer:starting",
2ac6795fcc085e Anup Patel     2020-08-17  224  				clint_timer_starting_cpu,
2ac6795fcc085e Anup Patel     2020-08-17  225  				clint_timer_dying_cpu);
2ac6795fcc085e Anup Patel     2020-08-17  226  	if (rc) {
2ac6795fcc085e Anup Patel     2020-08-17  227  		pr_err("%pOFP: cpuhp setup state failed [%d]\n", np, rc);
2ac6795fcc085e Anup Patel     2020-08-17  228  		goto fail_free_irq;
2ac6795fcc085e Anup Patel     2020-08-17  229  	}
2ac6795fcc085e Anup Patel     2020-08-17  230  
2ac6795fcc085e Anup Patel     2020-08-17  231  	riscv_set_ipi_ops(&clint_ipi_ops);
2ac6795fcc085e Anup Patel     2020-08-17  232  	clint_clear_ipi();
2ac6795fcc085e Anup Patel     2020-08-17  233  
2ac6795fcc085e Anup Patel     2020-08-17  234  	return 0;
2ac6795fcc085e Anup Patel     2020-08-17  235  
2ac6795fcc085e Anup Patel     2020-08-17  236  fail_free_irq:
2ac6795fcc085e Anup Patel     2020-08-17 @237  	free_irq(clint_timer_irq, &clint_clock_event);
2ac6795fcc085e Anup Patel     2020-08-17  238  fail_iounmap:
2ac6795fcc085e Anup Patel     2020-08-17  239  	iounmap(base);
2ac6795fcc085e Anup Patel     2020-08-17  240  	return rc;
2ac6795fcc085e Anup Patel     2020-08-17  241  }
2ac6795fcc085e Anup Patel     2020-08-17  242  

:::::: The code at line 237 was first introduced by commit
:::::: 2ac6795fcc085e8d03649f1bbd0d70aaff612cad clocksource/drivers: Add CLINT timer driver

:::::: TO: Anup Patel <anup.patel@wdc.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
