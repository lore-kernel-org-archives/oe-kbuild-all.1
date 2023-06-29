Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B42565
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688042212; x=1719578212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ew+sBiq1mrKtsMPMdcupe/wT5WsBH3u6CrMymQX01MM=;
  b=Jf4HBrr5ph29FkY8RMHhKs3R+7oqafj/KgstfzShG7J05AV1o72bPfHK
   Ko7lqXsLfUZH6CfpBA3byOJIIJcjB5QKxcjHehOCM6cNgIJceGr/hBoN/
   LS1ijXGI05ASzHEjV96xVKcOz+txO4vHVr5qqO+1PJ3CtUVSPgDAprbT0
   svLvHGIN8IDFdAmUFoxY/4YqUP70inSzCz/pMbVuOqSWsBXV1cZs1Tywl
   bW5OanYBNV+OG3nzroWZ8Dw9caMpVR1TteG7OJ1IH4wCG1fruFzsiV9rV
   YSPHfHO/+Opbd7ol4EL1UCNikU05ib0pNlIF7pJI5j/Zq7yTfR2Hjc0Bw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="359580932"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="359580932"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 05:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="830515630"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="830515630"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2023 05:36:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEqsr-000E9V-2w;
	Thu, 29 Jun 2023 12:36:25 +0000
Date: Thu, 29 Jun 2023 20:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sathesh Edara <sedara@marvell.com>, linux-kernel@vger.kernel.org,
	sburla@marvell.com, vburru@marvell.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, hgani@marvell.com
Cc: oe-kbuild-all@lists.linux.dev, sedara@marvell.com
Subject: Re: [net-next PATCH] octeon_ep: Add control plane host and firmware
 versions.
Message-ID: <202306292050.kg5Y1BXr-lkp@intel.com>
References: <20230629084227.98848-1-sedara@marvell.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629084227.98848-1-sedara@marvell.com>

Hi Sathesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathesh-Edara/octeon_ep-Add-control-plane-host-and-firmware-versions/20230629-164335
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230629084227.98848-1-sedara%40marvell.com
patch subject: [net-next PATCH] octeon_ep: Add control plane host and firmware versions.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230629/202306292050.kg5Y1BXr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306292050.kg5Y1BXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306292050.kg5Y1BXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/marvell/octeon_ep/octep_main.c:18:
>> drivers/net/ethernet/marvell/octeon_ep/octep_ctrl_net.h:10:10: fatal error: octep_cp_version.h: No such file or directory
      10 | #include "octep_cp_version.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 drivers/net/ethernet/marvell/octeon_ep/octep_ctrl_net.h

     9	
  > 10	#include "octep_cp_version.h"
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
