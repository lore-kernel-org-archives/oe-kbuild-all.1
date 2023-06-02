Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9001C746
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685730355; x=1717266355;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tfAQLRkozSeiGoOh/LFGaIApkdx1b5iyxooLEk1FZOc=;
  b=hzbmmX4rC/q8Qm9uAuVptGJMdQgag4nI9jV1zHvSRI/3yozOwBaTeQZE
   QFdhU9vzN5yHk/hi9n5AU422krbyAm+hJQjCPjxUisbzWMPAILcyEdP7i
   vopnQ2frenGsBznik5MRehNYwWUDg7pbQRsiJjVEUL/ffkmkzpHgU/rV9
   rTlj7zQau+JhFfuaUcjKKVnZLDoq7QH2yTdl0SyJxQa15OiBmZXdFs6kC
   AxsB9rjYk/tHS+dY83A3gHkqHgznqrsYIRN/OOXPcXk9N935PPBmd47TQ
   9P0TG4WbBhLsLUn4oshAzeYk83fAzIreaGaRAa7hKbOxd+LsaL3gIFCxt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="355945685"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="355945685"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 11:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737628436"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="737628436"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Jun 2023 11:25:53 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q59TE-0000p1-2c;
	Fri, 02 Jun 2023 18:25:52 +0000
Date: Sat, 3 Jun 2023 02:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:parallel-6.2-rc6 13/15] kernel/cpu.c:1526:32: warning: format
 '%lld' expects argument of type 'long long int', but argument 4 has type
 'cycles_t' {aka 'long unsigned int'}
Message-ID: <202306030244.cW27cxxQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.infradead.org/users/dwmw2/linux parallel-6.2-rc6
head:   17bbd12ee03047864f508d539e58974b4f677504
commit: 323883ff23424dd3fc4697b1e934f0814a74f171 [13/15] Print bringup timing
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230603/202306030244.cW27cxxQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 parallel-6.2-rc6
        git checkout 323883ff23424dd3fc4697b1e934f0814a74f171
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030244.cW27cxxQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from include/linux/sched/mm.h:5,
                    from kernel/cpu.c:6:
   kernel/cpu.c: In function 'bringup_nonboot_cpus':
>> kernel/cpu.c:1526:32: warning: format '%lld' expects argument of type 'long long int', but argument 4 has type 'cycles_t' {aka 'long unsigned int'} [-Wformat=]
    1526 |                         printk("Brought %d CPUs to %s in %lld cycles\n", n - i,
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1527 |                                cpuhp_hp_states[st].name, t2 - t1);
         |                                                          ~~~~~~~
         |                                                             |
         |                                                             cycles_t {aka long unsigned int}
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   kernel/cpu.c:1526:25: note: in expansion of macro 'printk'
    1526 |                         printk("Brought %d CPUs to %s in %lld cycles\n", n - i,
         |                         ^~~~~~
   kernel/cpu.c:1526:61: note: format string is defined here
    1526 |                         printk("Brought %d CPUs to %s in %lld cycles\n", n - i,
         |                                                          ~~~^
         |                                                             |
         |                                                             long long int
         |                                                          %ld
   kernel/cpu.c:1540:16: warning: format '%lld' expects argument of type 'long long int', but argument 2 has type 'cycles_t' {aka 'long unsigned int'} [-Wformat=]
    1540 |         printk("Brought CPUs online in %lld cycles\n", t2 - t1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~
         |                                                           |
         |                                                           cycles_t {aka long unsigned int}
   include/linux/printk.h:429:25: note: in definition of macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   kernel/cpu.c:1540:9: note: in expansion of macro 'printk'
    1540 |         printk("Brought CPUs online in %lld cycles\n", t2 - t1);
         |         ^~~~~~
   kernel/cpu.c:1540:43: note: format string is defined here
    1540 |         printk("Brought CPUs online in %lld cycles\n", t2 - t1);
         |                                        ~~~^
         |                                           |
         |                                           long long int
         |                                        %ld


vim +1526 kernel/cpu.c

  1504	
  1505	void bringup_nonboot_cpus(unsigned int setup_max_cpus)
  1506	{
  1507		unsigned int cpu;
  1508		int n = setup_max_cpus - num_online_cpus();
  1509		cycles_t t1, t2;
  1510	
  1511		/* ∀ parallel pre-bringup state, bring N CPUs to it */
  1512		if (n > 0) {
  1513			enum cpuhp_state st = CPUHP_BP_PARALLEL_DYN;
  1514	
  1515			while (st <= CPUHP_BP_PARALLEL_DYN_END &&
  1516			       cpuhp_hp_states[st].name) {
  1517				int i = n;
  1518				t1 = get_cycles();
  1519				for_each_present_cpu(cpu) {
  1520					cpu_up(cpu, st);
  1521					if (!--i)
  1522						break;
  1523				}
  1524				t2 = get_cycles();
  1525	
> 1526				printk("Brought %d CPUs to %s in %lld cycles\n", n - i,
  1527				       cpuhp_hp_states[st].name, t2 - t1);
  1528				st++;
  1529			}
  1530		}
  1531	
  1532		t1 = get_cycles();
  1533		for_each_present_cpu(cpu) {
  1534			if (num_online_cpus() >= setup_max_cpus)
  1535				break;
  1536			if (!cpu_online(cpu))
  1537				cpu_up(cpu, CPUHP_ONLINE);
  1538		}
  1539		t2 = get_cycles();
  1540		printk("Brought CPUs online in %lld cycles\n", t2 - t1);
  1541	}
  1542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
