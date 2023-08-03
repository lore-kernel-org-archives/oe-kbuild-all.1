Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45694263BD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 22:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691101554; x=1722637554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9JTVnmz2yViS8n2e94J60m4iF5+07SMDhO4XfYOt7uw=;
  b=iWko7vp9BmDPMMGcbjDOHADATVXBz35rxDk0isKdZl5JFl/3zz9dyBul
   kzW4z95NbshSuvGn7KVy8GGyfxjpYc8UuoNG0qyxrOnxXpIBVYFsNtNLH
   sM5ey832kDIpnx/MxOy9P8Z3fhKaoiZoz4OaePxq1+j6214vqmSCXKei1
   11dspJT+IPYPebWeLalr/sqAb3/Ft4swX+hLuQo2Ck5L/RdQDsLoM9Klw
   EStolp9hpdk/4SUhlMzZoh0/jnZJ9SSlUnS8yIjEgeaL8ZZMlJIfGORkg
   ux/irxKa8i3lnjUMUs1SNmcyJx2ETq9/AIjcbSha/dGPXzzySAc+4KKvj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349601582"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="349601582"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 15:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679647386"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="679647386"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Aug 2023 15:25:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRglT-0002PJ-0W;
	Thu, 03 Aug 2023 22:25:51 +0000
Date: Fri, 4 Aug 2023 06:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Subject: [bpf-next:master 3/4]
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.h:46:29: error: field 'xdp_rxq'
 has incomplete type
Message-ID: <202308040620.ty8oYNOP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   648880e9331c68b2008430fd90f3648d1795399d
commit: 680ee0456a5712309db9ec2692e908ea1d6b1644 [3/4] net: invert the netdevice.h vs xdp.h dependency
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230804/202308040620.ty8oYNOP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040620.ty8oYNOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040620.ty8oYNOP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c:13:
>> drivers/net/ethernet/freescale/dpaa/dpaa_eth.h:46:29: error: field 'xdp_rxq' has incomplete type
      46 |         struct xdp_rxq_info xdp_rxq;
         |                             ^~~~~~~


vim +/xdp_rxq +46 drivers/net/ethernet/freescale/dpaa/dpaa_eth.h

9ad1a37493338c Madalin Bucur 2016-11-15  35  
9ad1a37493338c Madalin Bucur 2016-11-15  36  struct dpaa_fq {
9ad1a37493338c Madalin Bucur 2016-11-15  37  	struct qman_fq fq_base;
9ad1a37493338c Madalin Bucur 2016-11-15  38  	struct list_head list;
9ad1a37493338c Madalin Bucur 2016-11-15  39  	struct net_device *net_dev;
9ad1a37493338c Madalin Bucur 2016-11-15  40  	bool init;
9ad1a37493338c Madalin Bucur 2016-11-15  41  	u32 fqid;
9ad1a37493338c Madalin Bucur 2016-11-15  42  	u32 flags;
9ad1a37493338c Madalin Bucur 2016-11-15  43  	u16 channel;
9ad1a37493338c Madalin Bucur 2016-11-15  44  	u8 wq;
9ad1a37493338c Madalin Bucur 2016-11-15  45  	enum dpaa_fq_type fq_type;
d57e57d0cd04be Camelia Groza 2020-11-25 @46  	struct xdp_rxq_info xdp_rxq;
9ad1a37493338c Madalin Bucur 2016-11-15  47  };
9ad1a37493338c Madalin Bucur 2016-11-15  48  

:::::: The code at line 46 was first introduced by commit
:::::: d57e57d0cd04be5ee533a0e1e6d13ba9251114b7 dpaa_eth: add XDP_TX support

:::::: TO: Camelia Groza <camelia.groza@nxp.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
