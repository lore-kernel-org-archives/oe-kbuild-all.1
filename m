Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06614A922
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675187235; x=1706723235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xrxZ1iHawTuAnfg4ULZ7OM5/vv+HDQ9MYSgOxGmoQdE=;
  b=k3Tv5O9I26g0MeIR/fJruyknRmKVPcqnKfNzW7YUmlvmLlUnaKwmAN8o
   ovwozC6bNcRS7ixLIZ3EfFSRO2Pog0vesZNEoSTaW8qWxGepdHgwoluXs
   1cqRo+6azlyn8XOgaEkWTL4Xyptiad9nxEy0iULLYwYGOD2Tui3YeO+D8
   lO5mCQJJ9vtg6QeBBzWgsCOSb4KdvtYsOTpD8a7a/1g8xBgcDVatP/2Q/
   Hq0RWib8mWGhfJRuwWbpE86kcTNZgJPNzBqM0wH5KPnXMo6gkPdpxpswJ
   t4qmi15+LZ/GInKm3CafOj8yDfHX7603mNtqhpNJdcnJBfZrbJ0moYbi+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="327922919"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="327922919"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 09:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="807217031"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="807217031"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2023 09:47:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMuio-0004as-2D;
	Tue, 31 Jan 2023 17:47:06 +0000
Date: Wed, 1 Feb 2023 01:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?zfFpZ28=?= Huguet <ihuguet@redhat.com>,
	ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com,
	richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	=?iso-8859-1?B?zfFpZ28=?= Huguet <ihuguet@redhat.com>,
	Yalin Li <yalli@redhat.com>
Subject: Re: [PATCH net 4/4] sfc: remove expired unicast PTP filters
Message-ID: <202302010101.qyLPmkHu-lkp@intel.com>
References: <20230131160506.47552-5-ihuguet@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230131160506.47552-5-ihuguet@redhat.com>

Hi Íñigo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/igo-Huguet/sfc-store-PTP-filters-in-a-list/20230201-000831
patch link:    https://lore.kernel.org/r/20230131160506.47552-5-ihuguet%40redhat.com
patch subject: [PATCH net 4/4] sfc: remove expired unicast PTP filters
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302010101.qyLPmkHu-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d631c3b59ac7ba7f62da245114156866ea74a15b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review igo-Huguet/sfc-store-PTP-filters-in-a-list/20230201-000831
        git checkout d631c3b59ac7ba7f62da245114156866ea74a15b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/sfc/ptp.c: In function 'efx_ptp_insert_unicast_filter':
>> drivers/net/ethernet/sfc/ptp.c:1515:30: warning: ordered comparison of pointer with integer zero [-Wextra]
    1515 |                 if (rxfilter < 0)
         |                              ^


vim +1515 drivers/net/ethernet/sfc/ptp.c

  1493	
  1494	static int efx_ptp_insert_unicast_filter(struct efx_nic *efx,
  1495						 struct sk_buff *skb)
  1496	{
  1497		struct efx_ptp_data *ptp = efx->ptp_data;
  1498		struct efx_ptp_rxfilter *rxfilter;
  1499	
  1500		if (!efx_ptp_valid_unicast_event_pkt(skb))
  1501			return -EINVAL;
  1502	
  1503		if (skb->protocol == htons(ETH_P_IP)) {
  1504			__be32 addr = ip_hdr(skb)->saddr;
  1505	
  1506			rxfilter = efx_ptp_insert_ipv4_filter(efx, &ptp->rxfilters_ucast,
  1507							      addr, PTP_EVENT_PORT);
  1508			if (IS_ERR(rxfilter))
  1509				goto fail;
  1510	
  1511			rxfilter->expiry = jiffies + UCAST_FILTER_EXPIRY_JIFFIES;
  1512	
  1513			rxfilter = efx_ptp_insert_ipv4_filter(efx, &ptp->rxfilters_ucast,
  1514							      addr, PTP_GENERAL_PORT);
> 1515			if (rxfilter < 0)
  1516				goto fail;
  1517	
  1518			rxfilter->expiry = jiffies + UCAST_FILTER_EXPIRY_JIFFIES;
  1519		} else if (efx_ptp_use_mac_tx_timestamps(efx)) {
  1520			/* IPv6 PTP only supported by devices with MAC hw timestamp */
  1521			struct in6_addr *addr = &ipv6_hdr(skb)->saddr;
  1522	
  1523			rxfilter = efx_ptp_insert_ipv6_filter(efx, &ptp->rxfilters_ucast,
  1524							      addr, PTP_EVENT_PORT);
  1525			if (IS_ERR(rxfilter))
  1526				goto fail;
  1527	
  1528			rxfilter->expiry = jiffies + UCAST_FILTER_EXPIRY_JIFFIES;
  1529	
  1530			rxfilter = efx_ptp_insert_ipv6_filter(efx, &ptp->rxfilters_ucast,
  1531							      addr, PTP_GENERAL_PORT);
  1532			if (IS_ERR(rxfilter))
  1533				goto fail;
  1534	
  1535			rxfilter->expiry = jiffies + UCAST_FILTER_EXPIRY_JIFFIES;
  1536		} else {
  1537			return -EOPNOTSUPP;
  1538		}
  1539	
  1540		return 0;
  1541	
  1542	fail:
  1543		efx_ptp_remove_filters(efx, &ptp->rxfilters_ucast);
  1544		return PTR_ERR(rxfilter);
  1545	}
  1546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
