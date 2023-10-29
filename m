Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415565E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 02:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+cGdRBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698545328; x=1730081328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zlprGRwTrx0/+enER1r6W0R5UgcTjCL1PXEJOTlV6pc=;
  b=N+cGdRBsF5Ryn2lcP23p4pFJZSvlQ1kuxhU2aFxQ/TJwZTc0jXXqWfzD
   mnKAhoCeYkbSLoDiszLHjx4MLb2bhzYFfCEnaKFRTqwOKbRkG/HkRaouP
   Usj8MG6dTBOR/KFULs2Sruk518GwxrnndlagylaCukyF83wDTh3ZW6/sq
   mzk2EjnfzHYCCwE/u6BE5xRMGprtjfJ8avEga/1GtFUqD/dQH0daqbaov
   ArDRLqNFgxlaEUwqVN2M8l3B/lATLDmetB2UPreUZpvU+YdaovSAuYXBM
   m9HnZUMUMnvT0eLomFWsMFBDY0GN4lAIF5W3GJPG8zJNwY2ry+EKbvlhN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="390789143"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="390789143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 19:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="883525298"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="883525298"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Oct 2023 19:08:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwvEK-000CGH-11;
	Sun, 29 Oct 2023 02:08:44 +0000
Date: Sun, 29 Oct 2023 10:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 9/17] drivers/pci/cma.c:21:10: fatal error:
 cma.asn1.h: No such file or directory
Message-ID: <202310291012.XJ0BDSnd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   7160e79a30f52a0bbcadc7bb22fb6c3443c76920
commit: f30b1849ac30b1d6c91ffe173932a7dc537ec147 [9/17] PCI/CMA: Validate Subject Alternative Name in certificates
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231029/202310291012.XJ0BDSnd-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310291012.XJ0BDSnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310291012.XJ0BDSnd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/cma.c:21:10: fatal error: cma.asn1.h: No such file or directory
      21 | #include "cma.asn1.h"
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +21 drivers/pci/cma.c

    20	
  > 21	#include "cma.asn1.h"
    22	#include "pci.h"
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
