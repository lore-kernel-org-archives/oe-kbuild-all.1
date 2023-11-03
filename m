Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F99C210E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a761HwfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699035533; x=1730571533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrlCfrLPo/VQc2pAy9DeIa2RPA4s5fGOb60lZEKoO54=;
  b=a761HwfBZTmsBMGFdEj90icaeeGAyNQBX8PxUMzI2CSrpvQ43svBugKP
   0ZqcQ1FEuhkaDKL8jPBs5b0U/3/SDs7JxKY3xwTbD4lVOXC3t59wMUmBf
   /6O/Wvjkq4ANX3CFV74dhouUHcVdmLKGAtujPhlZ5KVKqncX5LTea/4XR
   gsxd6f9K00RkR3tgz5HLdgSw+Gh7E/yqFSLjjgHneWC4QQ6Kxs7ShgQ4M
   sXuzlGJaV640p9mgbYtymmFvuryDTvoGmq/CuXFXEliRoR6rozo97GrGe
   GEOW28v8y6W3dRVgCvx6LSCwhEZe1kx34eZr3msOR0W7N76OPur15wCt+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420114677"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="420114677"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 11:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885278408"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="885278408"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2023 11:18:46 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyykl-0002oc-3B;
	Fri, 03 Nov 2023 18:18:43 +0000
Date: Sat, 4 Nov 2023 02:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp1 18/46] arch/sparc/kernel/pci_msi.c:102:1:
 warning: control reaches end of non-void function
Message-ID: <202311040247.27VU9xH2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp1
head:   62bfd93b1d4bc92cd171973923c45a2b011f1c5c
commit: 35a840b0e94d8fe18de796625785bfef762e2f03 [18/46] sparc: fix opencoded find_and_set_bit() in alloc_msi()
config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/20231104/202311040247.27VU9xH2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040247.27VU9xH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040247.27VU9xH2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/kernel/pci_msi.c: In function 'alloc_msi':
   arch/sparc/kernel/pci_msi.c:101:25: error: 'struct pci_pbm_info' has no member named 'msk_num'; did you mean 'msi_num'?
     101 |         return i < pbm->msk_num ? i + pbm->msi_first : -ENOENT;
         |                         ^~~~~~~
         |                         msi_num
>> arch/sparc/kernel/pci_msi.c:102:1: warning: control reaches end of non-void function [-Wreturn-type]
     102 | }
         | ^


vim +102 arch/sparc/kernel/pci_msi.c

759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11   95  
759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11   96  
759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11   97  static int alloc_msi(struct pci_pbm_info *pbm)
759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11   98  {
35a840b0e94d8f arch/sparc/kernel/pci_msi.c   Yury Norov      2023-10-21   99  	int i = find_and_set_bit(pbm->msi_bitmap, pbm->msi_num);
759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11  100  
35a840b0e94d8f arch/sparc/kernel/pci_msi.c   Yury Norov      2023-10-21  101  	return i < pbm->msk_num ? i + pbm->msi_first : -ENOENT;
759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11 @102  }
759f89e03c9e56 arch/sparc64/kernel/pci_msi.c David S. Miller 2007-10-11  103  

:::::: The code at line 102 was first introduced by commit
:::::: 759f89e03c9e5656ff18c02e21b439506f7c0cdc [SPARC64]: Consolidate MSI support code.

:::::: TO: David S. Miller <davem@sunset.davemloft.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
