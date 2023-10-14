Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978712B77
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5kFEKhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697291800; x=1728827800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LSIUGmCpl8mcl1g7ZNjpwZRIrpCbh+gSpfL6LUQbV+k=;
  b=F5kFEKhKCfVqmNq++AiEbNchDunbVEzpE5HbG/jZhSVWTikJTFRp7W07
   bJO9uSvtdcUiSd4cC3NOFJleXwr55vUz1LIUctQ7HFhsh7y8UBTXmyaEd
   DFn9A86yKx3K1FLPc6SaHxnsA4APNXhwj7Oqh2EpNCyq+3YdIeREBZTHU
   UyNhQVf1vwGlzo8guDJ5q+cx6mV/Y4kmfSbopwt0F0f0yzsVARlEEDMR3
   3sWe7JfqW9a5Hygkrk756v3GKtHkz9kUJYd4OluHdtDh3jRxpCJyE5ODq
   SaYgtNIhgxnxXZWobBxtg5mdPkBtlcZlwEd0gNAODR6bJUvpzf+X11AhU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471556048"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471556048"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 06:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="748677193"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="748677193"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Oct 2023 06:56:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrf84-0006D5-16;
	Sat, 14 Oct 2023 13:56:32 +0000
Date: Sat, 14 Oct 2023 21:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] net: ti: icssg-prueth: Fix tx_total_bytes count
Message-ID: <202310142105.gb7k82oJ-lkp@intel.com>
References: <20231011063700.1824093-1-danishanwar@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011063700.1824093-1-danishanwar@ti.com>

Hi MD,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/MD-Danish-Anwar/net-ti-icssg-prueth-Fix-tx_total_bytes-count/20231011-143912
base:   linus/master
patch link:    https://lore.kernel.org/r/20231011063700.1824093-1-danishanwar%40ti.com
patch subject: [PATCH] net: ti: icssg-prueth: Fix tx_total_bytes count
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310142105.gb7k82oJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142105.gb7k82oJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142105.gb7k82oJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/ti/icssg/icssg_stats.c: In function 'emac_update_hardware_stats':
>> drivers/net/ethernet/ti/icssg/icssg_stats.c:33:30: error: 'icssg_ethtool_stats' undeclared (first use in this function); did you mean 'icssg_ethtool_ops'?
      33 |                 if (!strncmp(icssg_ethtool_stats[i].name, "tx_good_frames", ETH_GSTRING_LEN))
         |                              ^~~~~~~~~~~~~~~~~~~
         |                              icssg_ethtool_ops
   drivers/net/ethernet/ti/icssg/icssg_stats.c:33:30: note: each undeclared identifier is reported only once for each function it appears in


vim +33 drivers/net/ethernet/ti/icssg/icssg_stats.c

    15	
    16	void emac_update_hardware_stats(struct prueth_emac *emac)
    17	{
    18		struct prueth *prueth = emac->prueth;
    19		int slice = prueth_emac_slice(emac);
    20		u32 base = stats_base[slice];
    21		u32 tx_pkt_cnt = 0;
    22		u32 val;
    23		int i;
    24	
    25		for (i = 0; i < ARRAY_SIZE(icssg_all_stats); i++) {
    26			regmap_read(prueth->miig_rt,
    27				    base + icssg_all_stats[i].offset,
    28				    &val);
    29			regmap_write(prueth->miig_rt,
    30				     base + icssg_all_stats[i].offset,
    31				     val);
    32	
  > 33			if (!strncmp(icssg_ethtool_stats[i].name, "tx_good_frames", ETH_GSTRING_LEN))
    34				tx_pkt_cnt = val;
    35	
    36			emac->stats[i] += val;
    37			if (!strncmp(icssg_ethtool_stats[i].name, "tx_total_bytes", ETH_GSTRING_LEN))
    38				emac->stats[i] -= tx_pkt_cnt * 8;
    39		}
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
