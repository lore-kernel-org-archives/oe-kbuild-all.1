Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25CA12B68
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVyVriAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698010572; x=1729546572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NbfPsiLo5q6uiWOOBAj62oSjn8EkREE30qcZBLIugC4=;
  b=jVyVriAW/1Dz9AgN0M5cNHW5GBMxnVyEtZD7I8tL2rl/7Y4NfjvrWURe
   ADcmj87vB/jWJezL3KH5ZDSlPUOakHUTkHTPmQ5ZrX2IFzXCVjVWO7hot
   ghyBDPHaVTAB2kBsG3mwG1bA9lUT2RHdEf/fgMgtkG97qnYu0YQ0FKtXd
   ljysShXKHsgB8wF/BJjY97eSgB8SH94MK9POMYI0EuA9tp/hLvPIyfOY0
   eMJrCIcHvSmjpti6bnBLcleaq24pIuhIFJLU2ll7GQdoInODKZhQvAdkr
   mLc11TVwiglGWGMaZZQj7uZTBIYP5GOHn3P3FChpvGQjSIxd4f+Gyn9EI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453206205"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453206205"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 14:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="1089277471"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="1089277471"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Oct 2023 14:36:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qug7E-0006HO-27;
	Sun, 22 Oct 2023 21:36:08 +0000
Date: Mon, 23 Oct 2023 05:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 35/41] checkpatch: WARNING: quoted string split
 across lines
Message-ID: <202310230519.kBPqHZkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   c388da1dad59dc24801b61bc63539cab6cd83e23
commit: 03c7fc39a677cdeae076d8b9ecc10920dd13f6a8 [35/41] ext4: Separate block bitmap and buddy bitmap freeing in ext4_group_add_blocks()
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230519.kBPqHZkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230519.kBPqHZkU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#53: FILE: fs/ext4/mballoc.c:6662:
+		ext4_error(sb, "Adding blocks in system zones - "
+			   "Block = %llu, count = %lu",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
