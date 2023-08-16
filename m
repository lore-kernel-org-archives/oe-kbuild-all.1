Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F67EC2C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 06:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692166679; x=1723702679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/5GuMBVmXprbDZ+JSIUTKh26NhYtWNL10Ogw+Ne2VwI=;
  b=gszIfqUvcUpfH4SRRWctqRmAE88RAP1eyF6BBlG1QA+VfPye3siq9FHp
   SwRe30gx+IhDa2G2OoSPEcwAS6JkrSEz8ULkPrOzrlFRWwgoEtg52sJqa
   j1WR34RgqpabxnPGAeiHSL4TOqERsthU/IwietTZFgL7eTjjmjIJmP6h0
   /kTy1+yuHFS9UHsQIvIfVXku2qYLIeN2oecg6CuQU0/OzoDyu6LQjBU9o
   xM6Y9Ggk2X/BVtw6+8ioqAGUawdeQifDrcBjsQ5UN6chOndLJR/F60T81
   2Mc+Q447BDg6w85hkE78V3L35IfpDGYR3RsGltpYw/5pSWcW5PqwEGBQk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352780035"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="352780035"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 23:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737173625"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="737173625"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Aug 2023 23:17:57 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW9qt-00003U-2K;
	Wed, 16 Aug 2023 06:17:56 +0000
Date: Wed, 16 Aug 2023 14:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 11/14] ipvs: no_cport and dropentry counters
 can be per-net
Message-ID: <202308161453.aHLyfScN-lkp@intel.com>
References: <20230815173031.168344-12-ja@ssi.bg>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815173031.168344-12-ja@ssi.bg>

Hi Julian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Anastasov/rculist_bl-add-hlist_bl_for_each_entry_continue_rcu/20230816-100047
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230815173031.168344-12-ja%40ssi.bg
patch subject: [PATCH RFC net-next 11/14] ipvs: no_cport and dropentry counters can be per-net
config: alpha-randconfig-r022-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161453.aHLyfScN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161453.aHLyfScN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161453.aHLyfScN-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_conn.c: In function 'todrop_entry':
>> net/netfilter/ipvs/ip_vs_conn.c:1599:19: error: 'struct netns_ipvs' has no member named 'dropentry_counters'
    1599 |         if (--ipvs->dropentry_counters[i] > 0)
         |                   ^~
   net/netfilter/ipvs/ip_vs_conn.c:1603:13: error: 'struct netns_ipvs' has no member named 'dropentry_counters'
    1603 |         ipvs->dropentry_counters[i] = i + 1;
         |             ^~


vim +1599 net/netfilter/ipvs/ip_vs_conn.c

  1574	
  1575	
  1576	/* Randomly drop connection entries before running out of memory
  1577	 * Can be used for DATA and CTL conns. For TPL conns there are exceptions:
  1578	 * - traffic for services in OPS mode increases ct->in_pkts, so it is supported
  1579	 * - traffic for services not in OPS mode does not increase ct->in_pkts in
  1580	 * all cases, so it is not supported
  1581	 */
  1582	static inline int todrop_entry(struct ip_vs_conn *cp)
  1583	{
  1584		struct netns_ipvs *ipvs = cp->ipvs;
  1585		int i;
  1586	
  1587		/* if the conn entry hasn't lasted for 60 seconds, don't drop it.
  1588		   This will leave enough time for normal connection to get
  1589		   through. */
  1590		if (time_before(cp->timeout + jiffies, cp->timer.expires + 60*HZ))
  1591			return 0;
  1592	
  1593		/* Drop only conns with number of incoming packets in [1..8] range */
  1594		i = atomic_read(&cp->in_pkts);
  1595		if (i > 8 || i < 1)
  1596			return 0;
  1597	
  1598		i--;
> 1599		if (--ipvs->dropentry_counters[i] > 0)
  1600			return 0;
  1601	
  1602		/* Prefer to drop conns with less number of incoming packets */
  1603		ipvs->dropentry_counters[i] = i + 1;
  1604		return 1;
  1605	}
  1606	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
