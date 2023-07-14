Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E96AD9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 06:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689315205; x=1720851205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xk5cLC9ISMXRdWuupIM2vYzt6J51U6YtSUFpVCZIImo=;
  b=EYGn5EjfVriEMFdDRpNc2cxTU3CuQ7A5E2rvQ+sxKeVgvrvGx7Sd50gH
   jAmgz70eFane7uA4x+xP8xbom5h7MNq8Z4ntamY+AzwZ3e0LxnUw2S7dB
   A5sHNCcfgTxqBVCI0qb1r0TQLaCUY32fCDqmAr3im5cWUA6+eUZTMnRoS
   b/s6wAdK6xwH9jUFww6dEiA9YkLK8ioHJs6fLH31wJ4OMu1ZP+Ds2fPsD
   iH8gIaftyJaNu9JWvzF1n4R+1E8LLwDwaGAkUhXbyXZhhHGWv8lCZHBzX
   Q8vHtxBmPX4eq94mkqsafyCLFygVRs7wV1IwJNbp3sF+egV9VBFXkDRmF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350272463"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="350272463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 23:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757457548"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="757457548"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 23:13:23 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKC3P-0007E9-0t;
	Fri, 14 Jul 2023 06:13:23 +0000
Date: Fri, 14 Jul 2023 14:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 104/106]
 drivers/misc/eeprom/eeprom_93xx46.c:397:34: warning:
 'eeprom_93xx46_of_table' defined but not used
Message-ID: <202307141430.HAZcHwK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   6d526c484caa62c36428fc20236387f34d8f5c75
commit: 00ffe6b38678094157b3bfd21e035e2cf3a3965c [104/106] Use of_device_get_match_data
config: i386-randconfig-r003-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141430.HAZcHwK6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141430.HAZcHwK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141430.HAZcHwK6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/eeprom/eeprom_93xx46.c:397:34: warning: 'eeprom_93xx46_of_table' defined but not used [-Wunused-const-variable=]
     397 | static const struct of_device_id eeprom_93xx46_of_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/eeprom_93xx46_of_table +397 drivers/misc/eeprom/eeprom_93xx46.c

3ca9b1ac28398c Cory Tusar          2016-02-10  396  
c074abe02e5e34 Cory Tusar          2016-01-06 @397  static const struct of_device_id eeprom_93xx46_of_table[] = {
14374fbb3f06dd Emmanuel Gil Peyrot 2021-05-11  398  	{ .compatible = "eeprom-93xx46", .data = &at93c46_data, },
14374fbb3f06dd Emmanuel Gil Peyrot 2021-05-11  399  	{ .compatible = "atmel,at93c46", .data = &at93c46_data, },
e1379b56e9e886 Cory Tusar          2016-02-10  400  	{ .compatible = "atmel,at93c46d", .data = &atmel_at93c46d_data, },
14374fbb3f06dd Emmanuel Gil Peyrot 2021-05-11  401  	{ .compatible = "atmel,at93c56", .data = &at93c56_data, },
14374fbb3f06dd Emmanuel Gil Peyrot 2021-05-11  402  	{ .compatible = "atmel,at93c66", .data = &at93c66_data, },
f6f1f8e6e3eea2 Aswath Govindraju   2021-01-05  403  	{ .compatible = "microchip,93lc46b", .data = &microchip_93lc46b_data, },
c074abe02e5e34 Cory Tusar          2016-01-06  404  	{}
c074abe02e5e34 Cory Tusar          2016-01-06  405  };
c074abe02e5e34 Cory Tusar          2016-01-06  406  MODULE_DEVICE_TABLE(of, eeprom_93xx46_of_table);
c074abe02e5e34 Cory Tusar          2016-01-06  407  

:::::: The code at line 397 was first introduced by commit
:::::: c074abe02e5e3479b2dfd109fa2620d22d351c34 misc: eeprom_93xx46: Implement eeprom_93xx46 DT bindings.

:::::: TO: Cory Tusar <cory.tusar@pid1solutions.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
