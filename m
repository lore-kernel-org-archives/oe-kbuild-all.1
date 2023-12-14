Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43A6A33F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaFilH0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702589239; x=1734125239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nb4cbx6ndAFy/GNaPW1An0xpvjDiKZXf0j/RAd6x8og=;
  b=IaFilH0zOGK6bNxarjTieBfcp+GB8fR2YkaitkTBpOPKEur1iCGi0iWL
   TE3aCwFgIVClTFk/5A9bV5M44KRWKoRy5gKw1o1mK8giY1zJCHH+CHU3X
   sy2Am7TmAyQ7bnahlgLhIpUSprxPDi7ZcyXBzskmVxf4WX+Ofc7daLIw9
   0tOmnEyTJOxZjRwe4A6KLNwKsrFxv3Dz/GeAsmK7uwPIpD3Q2kzsyRTi9
   jb1l13WLnfutMw/9KwBdoGYR0c5dWodv9RyjKHcY5R0/2p0Uvl9xywc+3
   sXtZTl37OP4FpitDmAY8tB44cGyYPEgrLd/9SVbggCjwnmN8l0+sz0y+y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2344410"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2344410"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 13:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724212346"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="724212346"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2023 13:27:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDtEe-000Mcq-1L;
	Thu, 14 Dec 2023 21:27:12 +0000
Date: Fri, 15 Dec 2023 05:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section
 mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_1g
 (section: .init.rodata)
Message-ID: <202312150527.87ozSKcC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 3a3f1e573a105328a2cca45a7cfbebabbf5e3192 modpost: fix off by one in is_executable_section()
date:   6 months ago
config: openrisc-randconfig-r015-20230110 (https://download.01.org/0day-ci/archive/20231215/202312150527.87ozSKcC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150527.87ozSKcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150527.87ozSKcC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
>> WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
WARNING: modpost: "__mulsi3" [kernel/locking/test-ww_mutex.ko] undefined!
WARNING: modpost: "__mulsi3" [kernel/trace/preemptirq_delay_test.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/ext2/ext2.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/ntfs/ntfs.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/ntfs3/ntfs3.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/fuse/fuse.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/fuse/cuse.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/fuse/virtiofs.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/jfs/jfs.ko] undefined!
WARNING: modpost: "__mulsi3" [fs/nilfs2/nilfs2.ko] undefined!
WARNING: modpost: suppressed 594 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
