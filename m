Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194C510EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 01:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693444361; x=1724980361;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tUi7yLxSpoZv/N4kjPP5/RDXN73mloI2HiwscbR1LCU=;
  b=b9N7yW4CE44o24llNNHZhcIdTwle/kDKsnfIqMCEHYVMKOAGuNjpONjQ
   eK2lMPbiME4BtfmQHswSdRcc3A5zUxgF4fM3h/bEM8rD0kfU6O6nk5Rhb
   KX72XErdHxKja9DZPtR8QCgJNBnn9BfkSsPcT+JAqA+DyPPcUT1GLci6O
   FeJztqWBiAjdfWo+scPFWK/OZw+c5dWEhvX9XDwzrAGZnNZtzmVAg5Es0
   /JKXG93bsHsF8w7yv13/+OEew9L2wQ/rt7JCckkKcHPcdIxxKwmWyRnhd
   TIB4Pbe+24vysqLPfayMpRzlD+h2MSjRTwf+C3KxI/0upKqyhPiljqpa8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355286453"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="355286453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 18:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768611248"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="768611248"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 18:12:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbWEd-000ARB-2n;
	Thu, 31 Aug 2023 01:12:35 +0000
Date: Thu, 31 Aug 2023 09:12:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 46/107] ld.lld: error: undefined symbol:
 __clk_get_name
Message-ID: <202308310953.p4H6fuYP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: b18364151a13ff12dcf5655d4c13e734e824206c [46/107] media: i2c: add DS90UB913 driver
config: hexagon-randconfig-r035-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310953.p4H6fuYP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310953.p4H6fuYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310953.p4H6fuYP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __clk_get_name
   >>> referenced by ds90ub913.c:613 (drivers/media/i2c/ds90ub913.c:613)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
   >>> referenced by ds90ub913.c:613 (drivers/media/i2c/ds90ub913.c:613)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: devm_clk_hw_register_fixed_factor
   >>> referenced by ds90ub913.c:612 (drivers/media/i2c/ds90ub913.c:612)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
   >>> referenced by ds90ub913.c:612 (drivers/media/i2c/ds90ub913.c:612)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: of_clk_hw_simple_get
   >>> referenced by ds90ub913.c:621 (drivers/media/i2c/ds90ub913.c:621)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
   >>> referenced by ds90ub913.c:621 (drivers/media/i2c/ds90ub913.c:621)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: devm_of_clk_add_hw_provider
   >>> referenced by ds90ub913.c:621 (drivers/media/i2c/ds90ub913.c:621)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a
   >>> referenced by ds90ub913.c:621 (drivers/media/i2c/ds90ub913.c:621)
   >>>               drivers/media/i2c/ds90ub913.o:(ub913_register_clkout) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
