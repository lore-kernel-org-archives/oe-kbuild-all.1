Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1E28DDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695159428; x=1726695428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f/NUT2MmEHOUU/rv3ssKB1yfbTAKPpChVhZ2x/2lVpA=;
  b=bmrBR2JXmgK9jXskHOG/vkS2wtyIHLmxx8Mb+kFWpOX/vr1e8lyOU1DD
   jmYiuBD10sopqq0OqgBZIukU9V0RyT080zbLQIny20umfz0hLn76mjns2
   YDRjm4Ver4nOY45nwRAOSJl9mg+MkaXM0nRnheHfdaKirzZzT9HK60REL
   J4QM8LHeDPq3yDYWwq6S208/0fMlpsXvu0VXzfaZyRK5vGpqPTTM/871k
   KM0QOa0boqDNx8S+Ez6OTz4FheGXzFGt6zDM1h3Zlvtbrx4u4SbFrZnNG
   N7063U1vP2bvB6rDHbiKUx/BICCl/mZ4+yX2R7oGxKwtjxH5ucJp0IDV0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="365105533"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="365105533"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 14:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="993317243"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="993317243"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2023 14:36:37 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiiOZ-0007x5-2X;
	Tue, 19 Sep 2023 21:36:35 +0000
Date: Wed, 20 Sep 2023 05:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1226/1363]
 drivers/mtd/nand/raw/arasan-nand-controller.c:1107:35: warning:
 'anfc_hw_ecc_caps' defined but not used
Message-ID: <202309200505.MQW4FKEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: bd2c73dd60da25dae9f78894f9d96688543abccf [1226/1363] mtd: rawnand: arasan: Use on-host ecc engine in hw-ecc mode
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309200505.MQW4FKEC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200505.MQW4FKEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200505.MQW4FKEC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/arasan-nand-controller.c:1107:35: warning: 'anfc_hw_ecc_caps' defined but not used [-Wunused-const-variable=]
    1107 | static const struct nand_ecc_caps anfc_hw_ecc_caps = {
         |                                   ^~~~~~~~~~~~~~~~


vim +/anfc_hw_ecc_caps +1107 drivers/mtd/nand/raw/arasan-nand-controller.c

88ffef1b65cf98 Miquel Raynal 2020-05-19  1106  
88ffef1b65cf98 Miquel Raynal 2020-05-19 @1107  static const struct nand_ecc_caps anfc_hw_ecc_caps = {
88ffef1b65cf98 Miquel Raynal 2020-05-19  1108  	.stepinfos = anfc_hw_ecc_step_infos,
88ffef1b65cf98 Miquel Raynal 2020-05-19  1109  	.nstepinfos = ARRAY_SIZE(anfc_hw_ecc_step_infos),
88ffef1b65cf98 Miquel Raynal 2020-05-19  1110  	.calc_ecc_bytes = anfc_calc_hw_ecc_bytes,
88ffef1b65cf98 Miquel Raynal 2020-05-19  1111  };
88ffef1b65cf98 Miquel Raynal 2020-05-19  1112  

:::::: The code at line 1107 was first introduced by commit
:::::: 88ffef1b65cf989b2dfea6374caff804fca6ec32 mtd: rawnand: arasan: Support the hardware BCH ECC engine

:::::: TO: Miquel Raynal <miquel.raynal@bootlin.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
