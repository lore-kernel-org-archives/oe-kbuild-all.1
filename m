Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763581C31
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694078045; x=1725614045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5uoTSBy7AZ8mb0iA8MkDFh2iCLv0MmPK+4Gs5H6DI0g=;
  b=Xa04gVUljZgnwfO95Vpis7lh9Hpd5Z/9fUNsZJ/0mAYbHH2EZoinbX8R
   RqFa44mGMKKVeGHSI40toJRallXPcqmPLfa7qfflvCs8nAAk2NgZq45KY
   Wjpdj12gaGin86CUBxcL5g8qN05JKY/ftfCZYucPAfl2advMXNRmdamZ9
   j+ljSBKPNxRRDCoJLvRkIwJWxZ0eVca6uODNU4ungzTTsnuuKiGkVEn2v
   9HJscAFBaG9pDF6lsfPARj4ktTnDCrNFfB2BuuFBZEEMkaqaW533jZDMe
   +Sf0hXL9wQF1iYCcIwIoF7ydbmuO8JUTnZfNodH2h0RY0AXh0TwCjC5t6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="367525937"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="367525937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 02:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="777003172"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="777003172"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Sep 2023 02:13:58 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeB5I-00015X-06;
	Thu, 07 Sep 2023 09:13:56 +0000
Date: Thu, 7 Sep 2023 17:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/core/xdp.c:725:5: error: no previous declaration for
 'bpf_xdp_metadata_rx_timestamp'
Message-ID: <202309071703.HVdMzfuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stanislav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ba2090ca64ea1aa435744884124387db1fac70f
commit: 3d76a4d3d4e591af3e789698affaad88a5a8e8ab bpf: XDP metadata RX kfuncs
date:   8 months ago
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20230907/202309071703.HVdMzfuS-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071703.HVdMzfuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071703.HVdMzfuS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/xdp.c:725:5: error: no previous declaration for 'bpf_xdp_metadata_rx_timestamp' [-Werror=missing-declarations]
    int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/xdp.c:737:5: error: no previous declaration for 'bpf_xdp_metadata_rx_hash' [-Werror=missing-declarations]
    int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/bpf_xdp_metadata_rx_timestamp +725 net/core/xdp.c

   713	
   714	__diag_push();
   715	__diag_ignore_all("-Wmissing-prototypes",
   716			  "Global functions as their definitions will be in vmlinux BTF");
   717	
   718	/**
   719	 * bpf_xdp_metadata_rx_timestamp - Read XDP frame RX timestamp.
   720	 * @ctx: XDP context pointer.
   721	 * @timestamp: Return value pointer.
   722	 *
   723	 * Returns 0 on success or ``-errno`` on error.
   724	 */
 > 725	int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
   726	{
   727		return -EOPNOTSUPP;
   728	}
   729	
   730	/**
   731	 * bpf_xdp_metadata_rx_hash - Read XDP frame RX hash.
   732	 * @ctx: XDP context pointer.
   733	 * @hash: Return value pointer.
   734	 *
   735	 * Returns 0 on success or ``-errno`` on error.
   736	 */
 > 737	int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
   738	{
   739		return -EOPNOTSUPP;
   740	}
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
