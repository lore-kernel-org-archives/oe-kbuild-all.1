Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D53EC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 03:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680059976; x=1711595976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mOOtmsatrbLpFIKro4tM9vRHn3Hf6s9ikOaaWku7nsc=;
  b=ZCvp+zyHQ4pNBlG6qXr8KOPkycmYIhzhezwYjL4iKqGIORggEp9HJ7Cq
   vsWPGDIQ38MWQebgbrSk1s0/CYNmmc6vsTL1yj/HCe3TcPVCUN39F1Yny
   SXWbOHidhwuWA8BKYc+6+yns2eF++kwA6/P11HqxqD/G0gytXsK+3cbUH
   PggVgDaPB4mwjISnuUYyReTe15bYg5T0uN6qocRwOwsgk0P6ulxJHRE0D
   qEiN9fWBtgBWOu9LyNZEU7Id97p05qkVIAvP6md6XyD311Wm1lLb9yamk
   OPCnRPL27Csuymd6bCJdY2XyMQgCw5WQ/h7sJg+jL3urQ994AIj1JdMDQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="343177198"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="343177198"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 20:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="808033415"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="808033415"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 20:19:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phMLV-000J9x-0k;
	Wed, 29 Mar 2023 03:19:33 +0000
Date: Wed, 29 Mar 2023 11:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/address-helpers 17/20] drivers/fsi/fsi-core.c:420:13:
 error: implicit declaration of function 'of_property_read_reg'; did you mean
 'of_property_read_s32'?
Message-ID: <202303291125.CavID9xZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers
head:   3a4e9c2e639e023556eefa93256ce5bf34137a60
commit: 629a809c284559be2cbd0f0f582d0dc5a46aa0b4 [17/20] fsi: Use of_property_read_reg()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230329/202303291125.CavID9xZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=629a809c284559be2cbd0f0f582d0dc5a46aa0b4
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/address-helpers
        git checkout 629a809c284559be2cbd0f0f582d0dc5a46aa0b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/fsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291125.CavID9xZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/fsi/fsi-core.c: In function 'fsi_device_node_matches':
>> drivers/fsi/fsi-core.c:420:13: error: implicit declaration of function 'of_property_read_reg'; did you mean 'of_property_read_s32'? [-Werror=implicit-function-declaration]
     420 |         if (of_property_read_reg(np, 0, &paddr, &psize))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             of_property_read_s32
   In file included from include/linux/device.h:15,
                    from drivers/fsi/fsi-core.c:14:
>> drivers/fsi/fsi-core.c:428:25: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'u64' {aka 'long long unsigned int'} [-Wformat=]
     428 |                         "node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/fsi/fsi-core.c:427:17: note: in expansion of macro 'dev_warn'
     427 |                 dev_warn(dev,
         |                 ^~~~~~~~
   drivers/fsi/fsi-core.c:428:32: note: format string is defined here
     428 |                         "node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
         |                               ~^
         |                                |
         |                                void *
         |                               %lld
>> drivers/fsi/fsi-core.c:428:25: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'uint32_t' {aka 'unsigned int'} [-Wformat=]
     428 |                         "node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/fsi/fsi-core.c:427:17: note: in expansion of macro 'dev_warn'
     427 |                 dev_warn(dev,
         |                 ^~~~~~~~
   drivers/fsi/fsi-core.c:428:83: note: format string is defined here
     428 |                         "node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
         |                                                                                ~~~^
         |                                                                                   |
         |                                                                                   long long unsigned int
         |                                                                                %x
>> drivers/fsi/fsi-core.c:428:25: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
     428 |                         "node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/fsi/fsi-core.c:427:17: note: in expansion of macro 'dev_warn'
     427 |                 dev_warn(dev,
         |                 ^~~~~~~~
   drivers/fsi/fsi-core.c:428:98: note: format string is defined here
     428 |                         "node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
         |                                                                                                 ~^
         |                                                                                                  |
         |                                                                                                  unsigned int
   drivers/fsi/fsi-core.c: In function 'fsi_slave_node_matches':
>> drivers/fsi/fsi-core.c:651:16: error: 'reg' undeclared (first use in this function)
     651 |         return reg == ((u64)link << 32) | id;
         |                ^~~
   drivers/fsi/fsi-core.c:651:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/fsi/fsi-core.c:652:1: error: control reaches end of non-void function [-Werror=return-type]
     652 | }
         | ^
   cc1: some warnings being treated as errors


vim +420 drivers/fsi/fsi-core.c

   414	
   415	static bool fsi_device_node_matches(struct device *dev, struct device_node *np,
   416			uint32_t addr, uint32_t size)
   417	{
   418		u64 paddr, psize;
   419	
 > 420		if (of_property_read_reg(np, 0, &paddr, &psize))
   421			return false;
   422	
   423		if (paddr != addr)
   424			return false;
   425	
   426		if (psize != size) {
   427			dev_warn(dev,
 > 428				"node %pOF matches probed address, but not size (got 0x%llx, expected 0x%x)",
   429				psize, size);
   430		}
   431	
   432		return true;
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
