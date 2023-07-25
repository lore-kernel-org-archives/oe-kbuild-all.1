Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89507134CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690272471; x=1721808471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJLTkrXOo3DEQr/6I7D7mp6oZ9cP8i01MtBSCOu9zgM=;
  b=HTEW/RQob9napJaFqCr+8xn93O+02t0u7srOcUKLjXTcqGEuYqYR/6B2
   aS5T9+sBvPcurTI05eObeaY2ajppWnlydF/qN+dUbcoafHWuntL4odacM
   6Rr11WqGZQ2lCWIjn2bewCMjKoTIq5NDjg8noYHzUliYbfH+PNzcfyQh5
   Fq15zqPdAut+cI0FFaLYF31rp+EQ++eKJzsD6cGrb2ehJTiHaNeYQIWfo
   I8Fb5C3/GSwzO57mc5UEJDs3wBAXyNmuBQ53d7vv8W2boMTYzTCPqWG1N
   XWivkyYeb5Wc310mUHzTyGlQ2mcSd7pnVDRY+4vJUv+1+h92B3RPtkCSd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370320066"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="370320066"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 01:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719961359"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="719961359"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 01:07:43 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOD55-000AS2-0C;
	Tue, 25 Jul 2023 08:07:43 +0000
Date: Tue, 25 Jul 2023 16:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2
 reboot-mode driver
Message-ID: <202307251524.r4GAPWaR-lkp@intel.com>
References: <20230724223057.1208122-5-quic_eberman@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724223057.1208122-5-quic_eberman@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6eaae198076080886b9e7d57f4ae06fa782f90ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/power-reset-reboot-mode-Allow-magic-to-be-0/20230725-063351
base:   6eaae198076080886b9e7d57f4ae06fa782f90ef
patch link:    https://lore.kernel.org/r/20230724223057.1208122-5-quic_eberman%40quicinc.com
patch subject: [RFC PATCH 4/4] power: reset: Implement a PSCI SYSTEM_RESET2 reboot-mode driver
config: parisc-randconfig-r003-20230725 (https://download.01.org/0day-ci/archive/20230725/202307251524.r4GAPWaR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251524.r4GAPWaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251524.r4GAPWaR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/reset/psci-vendor-reset.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.


vim +3 drivers/power/reset/psci-vendor-reset.c

   > 3	 * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
     4	 */
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
