Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C6164CC9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv/xyfhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702418831; x=1733954831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gF4NV3sPXbLNb0apMwwjJkvtIYedbKUgsadWLmmNhcI=;
  b=Kv/xyfhlVjsiV5Y4soiVgxvXc+rUMF/pk2rmeSnDqmB8yTj3j390zlt+
   2wAIMsljYsq5gyy3+mLADmsaa62Y2pzmUeUHer0OcQUNCtheF3/H63H0j
   78OTaTsFCq+FqBLQZAZbyShjaolXrF9KHR2iLP7oMvknfSOYm7O6aXMzR
   58LQSiBxqqpMFxn4BLJeqU96K9W48hdawdlNHP2y0U9kY8/zBmtMh9KQ6
   q3ipFZQVG8Y9g+jv5iRQzSy4PICXFhY9BDgBgvk6JsJit6dsmptRn+IKp
   RxKvKkSoNx8Op3IH/+dMA8lXYM1v+iM6H4ToWULesPN49b5HU0pKsVnin
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2046854"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="2046854"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 14:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946940975"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="946940975"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 14:07:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDAu9-000Jml-06;
	Tue, 12 Dec 2023 22:07:05 +0000
Date: Wed, 13 Dec 2023 06:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: edward.cree@amd.com, linux-net-drivers@amd.com, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, edumazet@google.com
Cc: oe-kbuild-all@lists.linux.dev, Edward Cree <ecree.xilinx@gmail.com>,
	netdev@vger.kernel.org, habetsm.xilinx@gmail.com,
	Jonathan Cooper <jonathan.s.cooper@amd.com>
Subject: Re: [PATCH net-next 3/7] sfc: debugfs for (nic) RX queues
Message-ID: <202312130527.xlkFaOuC-lkp@intel.com>
References: <a5c5491d3d0b58b8f8dff65cb53f892d7b13c32a.1702314695.git.ecree.xilinx@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5c5491d3d0b58b8f8dff65cb53f892d7b13c32a.1702314695.git.ecree.xilinx@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/edward-cree-amd-com/sfc-initial-debugfs-implementation/20231212-013223
base:   net-next/main
patch link:    https://lore.kernel.org/r/a5c5491d3d0b58b8f8dff65cb53f892d7b13c32a.1702314695.git.ecree.xilinx%40gmail.com
patch subject: [PATCH net-next 3/7] sfc: debugfs for (nic) RX queues
config: mips-ip27_defconfig (https://download.01.org/0day-ci/archive/20231213/202312130527.xlkFaOuC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130527.xlkFaOuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130527.xlkFaOuC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/sfc/efx.c:36:
>> drivers/net/ethernet/sfc/debugfs.h:60:5: warning: no previous prototype for 'efx_init_debugfs_rx_queue' [-Wmissing-prototypes]
      60 | int efx_init_debugfs_rx_queue(struct efx_rx_queue *rx_queue)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/sfc/debugfs.h:64:6: warning: no previous prototype for 'efx_fini_debugfs_rx_queue' [-Wmissing-prototypes]
      64 | void efx_fini_debugfs_rx_queue(struct efx_rx_queue *rx_queue) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/debugfs.h:66:5: warning: no previous prototype for 'efx_init_debugfs_channel' [-Wmissing-prototypes]
      66 | int efx_init_debugfs_channel(struct efx_channel *channel)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/debugfs.h:70:6: warning: no previous prototype for 'efx_fini_debugfs_channel' [-Wmissing-prototypes]
      70 | void efx_fini_debugfs_channel(struct efx_channel *channel) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/efx_init_debugfs_rx_queue +60 drivers/net/ethernet/sfc/debugfs.h

    59	
  > 60	int efx_init_debugfs_rx_queue(struct efx_rx_queue *rx_queue)
    61	{
    62		return 0;
    63	}
  > 64	void efx_fini_debugfs_rx_queue(struct efx_rx_queue *rx_queue) {}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
