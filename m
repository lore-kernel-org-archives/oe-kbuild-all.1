Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE6341BE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iP8Ek8iB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701764598; x=1733300598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gcfTZdhA5gWjXKrvaXBrEm3hhlOaQHfXwYwZPdM9PEM=;
  b=iP8Ek8iBge87ME6zoY1/SCvQzeXR+8cA1oab796KYR3E6KIhS+atakbw
   K+tYCAMWDSQPNABsT9B4QFUXJVikFmSKX4EbL26fEx8zWRjTI0rF4xfsP
   cVV80q/OmyC7yPQ8Z3hTpT0QdURlCndIY4w39ffHMx4Cuc4VUQwlCg//H
   2UaaKc9qbMXhfulzc2Ql+mVzJPxvpGrrEwMxVGisvqsXw4dYXuN/7rYNq
   2UzxekHYNjE9gnG0v/aNCAHI4XykSHie2vNx4YzlkQBaITNDnbe5+qrfr
   IuL1LnsdXsUvXzriyC2k2Qq+TFOIz/8MPAAApr4bJ0/SP0BZ4p1rakJKC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384259760"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="384259760"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 00:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764248993"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764248993"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Dec 2023 00:23:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAQi2-0008Zp-06;
	Tue, 05 Dec 2023 08:23:14 +0000
Date: Tue, 5 Dec 2023 16:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: YangXin <yx.0xffff@gmail.com>, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ___neigh_lookup_noref(): remove redundant parameters
Message-ID: <202312051637.EOZ86jSh-lkp@intel.com>
References: <20231204185943.68-1-yx.0xffff@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204185943.68-1-yx.0xffff@gmail.com>

Hi YangXin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.7-rc4 next-20231205]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/YangXin/net-___neigh_lookup_noref-remove-redundant-parameters/20231205-030205
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231204185943.68-1-yx.0xffff%40gmail.com
patch subject: [PATCH] net: ___neigh_lookup_noref(): remove redundant parameters
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051637.EOZ86jSh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051637.EOZ86jSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051637.EOZ86jSh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/route.h:28,
                    from include/net/ip.h:30,
                    from include/net/busy_poll.h:18,
                    from drivers/net/ethernet/sfc/falcon/net_driver.h:29,
                    from drivers/net/ethernet/sfc/falcon/efx.c:21:
   include/net/arp.h: In function '__ipv4_neigh_lookup_noref':
   include/net/arp.h:27:64: error: passing argument 3 of '___neigh_lookup_noref' from incompatible pointer type [-Werror=incompatible-pointer-types]
      27 |         return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
         |                                                                ^~~~
         |                                                                |
         |                                                                u32 * {aka unsigned int *}
   In file included from include/net/dst.h:20,
                    from include/net/sock.h:66,
                    from include/linux/tcp.h:19,
                    from drivers/net/ethernet/sfc/falcon/efx.c:15:
   include/net/neighbour.h:296:28: note: expected 'struct net_device *' but argument is of type 'u32 *' {aka 'unsigned int *'}
     296 |         struct net_device *dev)
         |         ~~~~~~~~~~~~~~~~~~~^~~
   include/net/arp.h:27:16: error: too many arguments to function '___neigh_lookup_noref'
      27 |         return ___neigh_lookup_noref(&arp_tbl, neigh_key_eq32, &key, dev);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/net/neighbour.h:293:33: note: declared here
     293 | static inline struct neighbour *___neigh_lookup_noref(
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/net/route.h:29:
   include/net/ndisc.h: In function '__ipv6_neigh_lookup_noref':
>> include/net/ndisc.h:383:64: warning: passing argument 3 of '___neigh_lookup_noref' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     383 |         return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
         |                                                                ^~~~
   include/net/neighbour.h:296:28: note: expected 'struct net_device *' but argument is of type 'const void *'
     296 |         struct net_device *dev)
         |         ~~~~~~~~~~~~~~~~~~~^~~
   include/net/ndisc.h:383:16: error: too many arguments to function '___neigh_lookup_noref'
     383 |         return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/net/neighbour.h:293:33: note: declared here
     293 | static inline struct neighbour *___neigh_lookup_noref(
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/net/ndisc.h: In function '__ipv6_neigh_lookup_noref_stub':
   include/net/ndisc.h:390:74: warning: passing argument 3 of '___neigh_lookup_noref' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     390 |         return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
         |                                                                          ^~~~
   include/net/neighbour.h:296:28: note: expected 'struct net_device *' but argument is of type 'const void *'
     296 |         struct net_device *dev)
         |         ~~~~~~~~~~~~~~~~~~~^~~
   include/net/ndisc.h:390:16: error: too many arguments to function '___neigh_lookup_noref'
     390 |         return ___neigh_lookup_noref(ipv6_stub->nd_tbl, neigh_key_eq128, pkey, dev);
         |                ^~~~~~~~~~~~~~~~~~~~~
   include/net/neighbour.h:293:33: note: declared here
     293 | static inline struct neighbour *___neigh_lookup_noref(
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +383 include/net/ndisc.h

   380	
   381	static inline struct neighbour *__ipv6_neigh_lookup_noref(struct net_device *dev, const void *pkey)
   382	{
 > 383		return ___neigh_lookup_noref(&nd_tbl, neigh_key_eq128, pkey, dev);
   384	}
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
