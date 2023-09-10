Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640E33C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694347372; x=1725883372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vAe78zw7yRfOL1IOt11gB170DT4bAJbJhlZM/NCGms=;
  b=TzMMfJnfiflfBfcH8aaaAlWJHdwzwF9l7Utw+3EvA8Um++lhnaNjZcb3
   X9/UMjaKzq3yUW50RkvR3gHcbDlPWlZomMbLMI4wzK23H5bUKiH4rDxTS
   qtFjWx6JcyFIO99BMk/mddT4AnfpEjGXRN1y6CLABDm11pRksf+LLrYtQ
   ZSUxyJXTO1d7/wlJ0/+y7ATo+QvXjyySJSlLnVEmH+hU7SJYfijq4Z1V3
   vz6k/1sKRns5Ni5hEB6e9tCH2wi2XlYPStdgsPUgU258wkuiG5YWPiULk
   Y0Yj5vO4rjbl+uqWyrvea9komkr07BwCcJwhsAe+YoCioX7bhVTgizVrO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362936631"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="362936631"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916690939"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="916690939"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Sep 2023 05:02:50 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfJ9M-0004sf-0D;
	Sun, 10 Sep 2023 12:02:48 +0000
Date: Sun, 10 Sep 2023 20:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 3820/25020] spdxcheck:
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: 1:28 Invalid License ID: GPL-
Message-ID: <202309101914.Unzcii57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 03fb7ec593b9ccd041bfc1456a53a5f0451141bd [3820/25020] MLK-24007: mtd: rawnand: gpmi: fix the random DMA timeout issue
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309101914.Unzcii57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101914.Unzcii57-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: 1:28 Invalid License ID: GPL-

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
