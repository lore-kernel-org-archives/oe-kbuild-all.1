Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A39BE6F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693587191; x=1725123191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jrVERCJlg0FL/h0p/DNOYJ4qMRrWoRZNaA0XjEj2Ylc=;
  b=cdI4KO+nTBrHx5WSmmxXnNEBZIe2TSWQIpbHogR+YURHSWAD9ghoh63G
   uUUEcVzvABh3VyB6Hqe0IUad2fRuCOscTVJzEmyoDHp40l2/5u/noouh0
   idYRIbkgL1l9NAooSN4JH5mnmQd84pjBkLnZa8vTLWODHqU9pWLrUeIvp
   YN8Nr3cJigaEqe7FUVOlLYKFMpFEwY7IYIp66FvUoX7Q/IbVfD82secdU
   Kr1P59HniNjVx5x3XljSyKAK39qoTQ6eRup69Ysir1nVVaHP7xL5Ik4NQ
   EBrgBR2n3oGu4vMNrSgdfUHRLJ7vvjsrNypiSxOD72MXjhtv6w6f/wAwR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378986792"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="378986792"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 09:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854778347"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="854778347"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2023 09:52:48 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc7O1-0001UR-2i;
	Fri, 01 Sep 2023 16:52:45 +0000
Date: Sat, 2 Sep 2023 00:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6182/24603] include/linux/imx_sema4.h:32:27:
 warning: 'idx_sema4' defined but not used
Message-ID: <202309020014.iVY5pk6v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 6fa0d34734660a2cad016d9573a4be64fb1f1c34 [6182/24603] Merge branch 'pm/next' into next
config: arc-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230902/202309020014.iVY5pk6v-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020014.iVY5pk6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020014.iVY5pk6v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/imx/clk-pllv3.c:11:
>> include/linux/imx_sema4.h:32:27: warning: 'idx_sema4' defined but not used [-Wunused-const-variable=]
      32 | static const unsigned int idx_sema4[SEMA4_NUM_GATES] = {
         |                           ^~~~~~~~~


vim +/idx_sema4 +32 include/linux/imx_sema4.h

0c29d53facf914 Anson Huang 2019-04-19  31  
0c29d53facf914 Anson Huang 2019-04-19 @32  static const unsigned int idx_sema4[SEMA4_NUM_GATES] = {
0c29d53facf914 Anson Huang 2019-04-19  33  	1 << 7, 1 << 6, 1 << 5, 1 << 4,
0c29d53facf914 Anson Huang 2019-04-19  34  	1 << 3, 1 << 2, 1 << 1, 1 << 0,
0c29d53facf914 Anson Huang 2019-04-19  35  	1 << 15, 1 << 14, 1 << 13, 1 << 12,
0c29d53facf914 Anson Huang 2019-04-19  36  	1 << 11, 1 << 10, 1 << 9, 1 << 8,
0c29d53facf914 Anson Huang 2019-04-19  37  };
0c29d53facf914 Anson Huang 2019-04-19  38  

:::::: The code at line 32 was first introduced by commit
:::::: 0c29d53facf9146eac90a7a7b79bedecc809f67d char: imx_amp: add sema4 driver support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
