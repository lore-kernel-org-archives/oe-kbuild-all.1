Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D3A259B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694420813; x=1725956813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vdYN1i8Gj9EqGFwAQXaDg9M/SPj4fRqHcYSkxzRo6C4=;
  b=jwye9/bA9SXkX12e8xe3B+iolLCSqF5xhLDagviy4cEeiIcYsBLb6MKs
   PeoU0DKmzQq+eMvIFUd2mIj6pAvVZMZL70Rf2RJoxN/FALRUSrpj91GFO
   B7/uLEPb1Ws5ZnQ8Gv/X7zUv2Rvk0lp04XU09z3oRLvquv7ZRPfPTeV3g
   znoGMUtTaXCWaOObup3ktkCoNEN/7Y/z7llsh+mj9hlCHSuUy0xX+TUvU
   byFl9C5h7O7g29I8OM6gPBS2vqyc66DsNOECJL3Gh+OfE+n7SvmT/lDMt
   pHSPuLI6bNZC/ksAM/pcE+ddOOMx8E9KhTXasT4Wb0RtQGTatNzttZ6p6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="408993927"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="408993927"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 01:26:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="719912127"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="719912127"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 01:26:49 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfcFr-0005zc-0f;
	Mon, 11 Sep 2023 08:26:47 +0000
Date: Mon, 11 Sep 2023 16:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kiwoong Kim <kwmad.kim@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Chanwoo Lee <cw9316.lee@samsung.com>
Subject: [linux-next:master 827/1095] drivers/ufs/core/ufshcd.c:2307:26-31:
 WARNING: conversion to bool not needed here
Message-ID: <202309111600.bsVeUtzy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bc675554773f09d88101bf1ccfc8537dc7c0be9
commit: d32533d30e2119b0c0aa17596734f1f842f750df [827/1095] scsi: ufs: core: Poll HCS.UCRDY before issuing a UIC command
config: i386-randconfig-053-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111600.bsVeUtzy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309111600.bsVeUtzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111600.bsVeUtzy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ufs/core/ufshcd.c:2307:26-31: WARNING: conversion to bool not needed here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
