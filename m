Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57C291A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693438073; x=1724974073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlFz4D0xDQWjr38fXjvZSLHDZp+3agfie/kJBKdKmOY=;
  b=EKC6ZPaRVtFtLvF51U79G1FghSNcGcUQSKz6yH0YYYDuyYnG3gKlGt2E
   Lb31VV1OEhWQJDbV+h6d27cMZBU0/lnUROslAQbA5MNREeZB+mLCpySCn
   t/DczzsjUmNPaOHkClz1bLPkv2/25BrZgbT5RACiVDv1RhSJ6RMQdAXUP
   ivPoA560s0gKjHlbMiu+eEYZhUTNNN8JVfMQVnVuid4ULP1iGCrUiwnLc
   CeW6ABrJkREX3Ifmmoxe7VwMSprQpQRX3zqn8pn119K/MN+zOPP+9Kkt9
   uZhBHY5zUkHvHcFRwrJJOPL2/m+wRBFByYJJoUfrcjU3n2oDO9/lFODjj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375724586"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="375724586"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 16:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768577703"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="768577703"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 16:27:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbUbE-000ALE-1F;
	Wed, 30 Aug 2023 23:27:48 +0000
Date: Thu, 31 Aug 2023 07:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 7/7] drivers/clk/qcom/gcc-ipq5018.c:3704:18:
 warning: excess elements in struct initializer
Message-ID: <202308310721.77RYhtQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: 2f859c7b504dbff5d4770187e5416610db4625e3 [7/7] of: header cleanups
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310721.77RYhtQs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310721.77RYhtQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310721.77RYhtQs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/qcom/gcc-ipq5018.c:3703:15: error: variable 'gcc_ipq5018_driver' has initializer but incomplete type
    3703 | static struct platform_driver gcc_ipq5018_driver = {
         |               ^~~~~~~~~~~~~~~
   drivers/clk/qcom/gcc-ipq5018.c:3704:10: error: 'struct platform_driver' has no member named 'probe'
    3704 |         .probe = gcc_ipq5018_probe,
         |          ^~~~~
>> drivers/clk/qcom/gcc-ipq5018.c:3704:18: warning: excess elements in struct initializer
    3704 |         .probe = gcc_ipq5018_probe,
         |                  ^~~~~~~~~~~~~~~~~
   drivers/clk/qcom/gcc-ipq5018.c:3704:18: note: (near initialization for 'gcc_ipq5018_driver')
   drivers/clk/qcom/gcc-ipq5018.c:3705:10: error: 'struct platform_driver' has no member named 'driver'
    3705 |         .driver = {
         |          ^~~~~~
   drivers/clk/qcom/gcc-ipq5018.c:3705:19: error: extra brace group at end of initializer
    3705 |         .driver = {
         |                   ^
   drivers/clk/qcom/gcc-ipq5018.c:3705:19: note: (near initialization for 'gcc_ipq5018_driver')
   drivers/clk/qcom/gcc-ipq5018.c:3705:19: warning: excess elements in struct initializer
   drivers/clk/qcom/gcc-ipq5018.c:3705:19: note: (near initialization for 'gcc_ipq5018_driver')
   drivers/clk/qcom/gcc-ipq5018.c: In function 'gcc_ipq5018_init':
   drivers/clk/qcom/gcc-ipq5018.c:3713:16: error: implicit declaration of function 'platform_driver_register' [-Werror=implicit-function-declaration]
    3713 |         return platform_driver_register(&gcc_ipq5018_driver);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/qcom/gcc-ipq5018.c: In function 'gcc_ipq5018_exit':
   drivers/clk/qcom/gcc-ipq5018.c:3719:9: error: implicit declaration of function 'platform_driver_unregister'; did you mean 'driver_unregister'? [-Werror=implicit-function-declaration]
    3719 |         platform_driver_unregister(&gcc_ipq5018_driver);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         driver_unregister
   drivers/clk/qcom/gcc-ipq5018.c: At top level:
   drivers/clk/qcom/gcc-ipq5018.c:3703:31: error: storage size of 'gcc_ipq5018_driver' isn't known
    3703 | static struct platform_driver gcc_ipq5018_driver = {
         |                               ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +3704 drivers/clk/qcom/gcc-ipq5018.c

e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3702  
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3703  static struct platform_driver gcc_ipq5018_driver = {
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28 @3704  	.probe = gcc_ipq5018_probe,
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3705  	.driver = {
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3706  		.name = "qcom,gcc-ipq5018",
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3707  		.of_match_table = gcc_ipq5018_match_table,
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3708  	},
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3709  };
e3fdbef1bab8e37 Sricharan Ramabadhran 2023-07-28  3710  

:::::: The code at line 3704 was first introduced by commit
:::::: e3fdbef1bab8e372981c8cc4d8febbaa76c490b0 clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018

:::::: TO: Sricharan Ramabadhran <quic_srichara@quicinc.com>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
