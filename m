Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E21190
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693009722; x=1724545722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdzNSwxaiVCdFPFD5rPFKc0ORStPi+wlQ5f0q1gJh2g=;
  b=B3HPob6TYOqOz/NkHVvWmiOBVUF1AO4mBrtsX0j+pRRwuXcY3XNoo8k+
   U/wQT/9r9/4kp9da+0c8sz+NLAv0q3auVDrae0RMODa0QdtaKX262KrQz
   xMjiWN7qmraPQLNEP7dFqNDm8FuzjMSTr6poVasGsB4FI3+bjx811EsJH
   ZiaUK+ldREyuYAskwjNVSWBvNawEFAF2Fb/ihsqbiExrB9xUw8wU3EzJm
   Z4D00Mhx7KMxDSNc/acbAqVnicNKzaG/S51hKgVnFjEZTOKA9Eu7/WCBV
   52LY9cwuzFcY3rWFaVShmEAhBP7ZpE5gR4a1Wpgx45YsypI/HO7bpvMXx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354356943"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="354356943"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731217601"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="731217601"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 17:28:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZhAN-0004AU-0f;
	Sat, 26 Aug 2023 00:28:39 +0000
Date: Sat, 26 Aug 2023 08:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 20/25] drivers/pci/ide-km.c:118:39: warning:
 unused variable 'resp'
Message-ID: <202308260800.nByuOGLR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ecc190dd66d4c533dc9d4aa0058cd06888c318d6
commit: b46a2b7f3c9eac67b801d35df42391977ccf006b [20/25] pci: ide: Add DOE operations
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20230826/202308260800.nByuOGLR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260800.nByuOGLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260800.nByuOGLR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/ide-km.c: In function 'ide_km_send_query':
>> drivers/pci/ide-km.c:118:39: warning: unused variable 'resp' [-Wunused-variable]
     118 |         struct km_query_response_hdr *resp;
         |                                       ^~~~
>> drivers/pci/ide-km.c:117:25: warning: unused variable 'query' [-Wunused-variable]
     117 |         struct km_query query = {0};
         |                         ^~~~~


vim +/resp +118 drivers/pci/ide-km.c

   113	
   114	
   115	int ide_km_send_query(struct pci_dev *pdev)
   116	{
 > 117		struct km_query query = {0};
 > 118		struct km_query_response_hdr *resp;
   119	
   120		/* May need to change PortIndex for switch downstream port */
   121	
   122		/* Send query command via SPDM */
   123	
   124		/* Wait for response */
   125	
   126		/* Do we need to do anything about response? */
   127	
   128		return 0;
   129	}
   130	EXPORT_SYMBOL_GPL(ide_km_send_query);
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
