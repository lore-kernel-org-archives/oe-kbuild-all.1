Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5F7E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 00:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693356476; x=1724892476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRKqGOCD1jPpP0gdXraU2Y9bRhIFBBPhhueZ1wERy4A=;
  b=ktgw2xpGnv1a9weLcDeONx8xJBNvny5DMKtcx89Cy4RzskSaZ9Q4nsCZ
   ETk+qt/Xmu352bwJT2+9Ort8TViJFFJ9CWuwGurL528ozYOJQcQSB6Itd
   FgWIg4fMAjsi269Saf7zctFDAQfaLhlzUsoMKZ1LLmTrrBaa7XnYY8RMp
   QUOmZGMfciwXytjhUFIxUowt+WaZpEPF+IxNxAaBrM4Dk7lqVxXNEF+3J
   hrj6/nKm+KDYCNEJepeQ3MmnrGmNf7UdrCS66gTfVXY78NBXHuW/Ina7/
   mAij72890NfqqUAQSfVCqRo5kABt3khyv2nqZLBxUvB/LOdW54xwNa57V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360514259"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="360514259"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 17:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="808895731"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="808895731"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2023 17:47:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb9N3-0009Fj-0Q;
	Wed, 30 Aug 2023 00:47:45 +0000
Date: Wed, 30 Aug 2023 08:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/parisc/sba_iommu.c:124:31: warning: 'proc_runway_root'
 defined but not used
Message-ID: <202308300800.Jod4sHzM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d68b4b6f307d155475cce541f2aee938032ed22e
commit: 77e0ddf097d6d4ceaf898e088b133b99e0a97fa0 parisc: ccio-dma: Create private runway procfs root entry
date:   33 hours ago
config: parisc-randconfig-r035-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300800.Jod4sHzM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300800.Jod4sHzM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300800.Jod4sHzM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/parisc/sba_iommu.c:124:31: warning: 'proc_runway_root' defined but not used [-Wunused-variable]
     124 | static struct proc_dir_entry *proc_runway_root __ro_after_init;
         |                               ^~~~~~~~~~~~~~~~


vim +/proc_runway_root +124 drivers/parisc/sba_iommu.c

   123	
 > 124	static struct proc_dir_entry *proc_runway_root __ro_after_init;
   125	struct proc_dir_entry *proc_mckinley_root __ro_after_init;
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
