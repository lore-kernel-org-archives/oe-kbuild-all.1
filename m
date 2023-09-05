Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B49DDD5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693942221; x=1725478221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OPl0oPBM2fcSkpfiG+2ue1cSu5hkPuAfGqxjGt+cb3M=;
  b=eLAKDwqIiM4PVgHlVUHrFtgoo5f2Zy+UL1LAzTD+70E6i5Nj/J9PtYxd
   kkwYI0qsH11+MOlyw5lB2B5IZJj/cVNacXZd4v+BwJUCIDojJlK0f/rtV
   nUqXdDnHBd169QsQ0jTyfafrTrn5zDwr8dauzOeYcNCiNK+GPa6NsAy4C
   ZnrMY1IIA+ABY30vS/9Qg884B6chTJM6mfannwPbVEl8MEQ9Nh1+Du6rX
   xBqiIUx7eh3n/BqoIXD8KvLTgEaRSbBNSA6Brm16Smvfy7EpcX+6vxLnh
   hSsoPH3V9VAxQ0+7V0ovrxEAUada14cvTABaqKKAsClFlYrIu4iIu6tQu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379604200"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="379604200"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 12:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="987944190"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="987944190"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Sep 2023 12:30:19 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdbkf-000207-0Y;
	Tue, 05 Sep 2023 19:30:17 +0000
Date: Wed, 6 Sep 2023 03:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 775/1123] ERROR: modpost: "af_alg_register_type"
 [crypto/algif_aead.ko] undefined!
Message-ID: <202309060334.lhNKaclq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dhaval,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 14a9452bc2885ae18d4f51e0fe4f4e95233dfb0d [775/1123] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: arc-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060334.lhNKaclq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060334.lhNKaclq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060334.lhNKaclq-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "af_alg_register_type" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "lock_sock_nested" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "release_sock" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_sendpage" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_sendmsg" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_pull_tsgl" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kzfree_s" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kfree_s" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "af_alg_release_parent" [crypto/algif_aead.ko] undefined!
>> ERROR: modpost: "sock_kmalloc" [crypto/algif_aead.ko] undefined!
WARNING: modpost: module fpga-mgr uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module fpga-mgr uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
WARNING: modpost: module fpga-mgr uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
WARNING: modpost: module fpga-mgr uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
WARNING: modpost: module fpga-mgr uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
WARNING: modpost: module fpga-mgr uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
WARNING: modpost: suppressed 20 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [m]:
   - CRYPTO_DEV_ZYNQMP_AES [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
