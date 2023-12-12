Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5566359B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAZMbAx+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702410895; x=1733946895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CA9aa2awBIDig+dNOGZp0RzanEU6A7xfFCBeXtxY+5w=;
  b=JAZMbAx+fwABxpvgjRnNU+EX37pyfyUxk32DqvFj6wzChllv2VTFjJGt
   NFHoKs77UKleRqZfubCqvOCblgfpyQhfRrC9aTRh/SgemsE3MB0Ko5/UH
   IfE4zDbR1nh+pTw5UxDpN+lXSK/Nma5jQdzzvlNvVMwQ2yqaGSr8Z14iO
   QhAWiN7deRCVWNgOsTmeqrNooapgXH+4HgQ/rdJKcuT+D5vOFabjPl9bp
   zrdE6UzkUumtZcyE0w59dW6xNYGbbmIrpJGQXdiHcFj+Wks/YY5QcyoO3
   8ba5HGXd6H/RXfL0VCJzr3mamRyYvg6wsIUHhp3YfWJs0K4boA/eYe0/X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398704156"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="398704156"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 11:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="802601537"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="802601537"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Dec 2023 11:54:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD8q8-000JeR-2z;
	Tue, 12 Dec 2023 19:54:48 +0000
Date: Wed, 13 Dec 2023 03:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: edward.cree@amd.com, linux-net-drivers@amd.com, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, edumazet@google.com
Cc: oe-kbuild-all@lists.linux.dev, Edward Cree <ecree.xilinx@gmail.com>,
	netdev@vger.kernel.org, habetsm.xilinx@gmail.com,
	Jonathan Cooper <jonathan.s.cooper@amd.com>
Subject: Re: [PATCH net-next 2/7] sfc: debugfs for channels
Message-ID: <202312130301.cKD8l8IO-lkp@intel.com>
References: <df43d737fda6b6aa0cda3f2cb300916ca4b2e8f8.1702314695.git.ecree.xilinx@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df43d737fda6b6aa0cda3f2cb300916ca4b2e8f8.1702314695.git.ecree.xilinx@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/edward-cree-amd-com/sfc-initial-debugfs-implementation/20231212-013223
base:   net-next/main
patch link:    https://lore.kernel.org/r/df43d737fda6b6aa0cda3f2cb300916ca4b2e8f8.1702314695.git.ecree.xilinx%40gmail.com
patch subject: [PATCH net-next 2/7] sfc: debugfs for channels
config: mips-ip27_defconfig (https://download.01.org/0day-ci/archive/20231213/202312130301.cKD8l8IO-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130301.cKD8l8IO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130301.cKD8l8IO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/sfc/efx.c:36:
>> drivers/net/ethernet/sfc/debugfs.h:51:5: warning: no previous prototype for 'efx_init_debugfs_channel' [-Wmissing-prototypes]
      51 | int efx_init_debugfs_channel(struct efx_channel *channel)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/debugfs.h:55:6: warning: no previous prototype for 'efx_fini_debugfs_channel' [-Wmissing-prototypes]
      55 | void efx_fini_debugfs_channel(struct efx_channel *channel) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/efx_init_debugfs_channel +51 drivers/net/ethernet/sfc/debugfs.h

    50	
  > 51	int efx_init_debugfs_channel(struct efx_channel *channel)
    52	{
    53		return 0;
    54	}
  > 55	void efx_fini_debugfs_channel(struct efx_channel *channel) {}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
