Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00C11C85
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685915421; x=1717451421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0tfSNWj5OivF4qUbN3Zb4JH4BP3HkoM+TU//H4viQs=;
  b=StOepomAH0wd3AdsC2hT9p2klQqXgBzlLxFh408ZK2de2e/y/xenClxZ
   fbssfo5KSmJhA3gKTxN1Wo0ptZapsha8fJA4CasEDY5tQTsvg+6rnu7Eb
   K1gB+kM/hqlQt0wytJZVZM2UbS8wnTxycfD9kXa6qLAbmYmAoZrTZt4N5
   BrfM3WitDJ2mkL2i5BrHc7SslyUj1e2X2cRotnmmigPgF35EpLt9OU3Pg
   wHBQOTKl/tjtsoYXl//oJ8nRThM6yJxNgQ4UDdMlGDPYRlGFbeba7QlWD
   XsXmPAjcNUHGQemZPaaZOqzecqkIqbxg9uN6OEz60DRNXptlZH1kkhW/E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="384526943"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="384526943"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 14:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="711582649"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="711582649"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2023 14:50:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5vcA-0003Up-2z;
	Sun, 04 Jun 2023 21:50:18 +0000
Date: Mon, 5 Jun 2023 05:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 4576/30000]
 drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast to
 restricted __be16
Message-ID: <202306050543.2zzbrj0J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   5610fff176c8ff3eb470b8270294bc7a7acb4a15
commit: e81c0313ef1ebd190788332e799dffa2534afdfb [4576/30000] igc: Enable VLAN Insertion and VLAN Stripping
config: x86_64-randconfig-s021-20230604 (https://download.01.org/0day-ci/archive/20230605/202306050543.2zzbrj0J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/linux-intel-lts/commit/e81c0313ef1ebd190788332e799dffa2534afdfb
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout e81c0313ef1ebd190788332e799dffa2534afdfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/v4l2-core/ drivers/net/ethernet/intel/igc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050543.2zzbrj0J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast to restricted __be16
>> drivers/net/ethernet/intel/igc/igc_main.c:1583:31: sparse: sparse: cast from restricted __le16

vim +1583 drivers/net/ethernet/intel/igc/igc_main.c

  1571	
  1572	static void igc_rx_vlan(struct igc_ring *rx_ring,
  1573				union igc_adv_rx_desc *rx_desc,
  1574				struct sk_buff *skb)
  1575	{
  1576		struct net_device *dev = rx_ring->netdev;
  1577		u16 vid;
  1578	
  1579		if ((dev->features & NETIF_F_HW_VLAN_CTAG_RX) &&
  1580		    igc_test_staterr(rx_desc, IGC_RXD_STAT_VP)) {
  1581			if (igc_test_staterr(rx_desc, IGC_RXDEXT_STATERR_LB) &&
  1582			    test_bit(IGC_RING_FLAG_RX_LB_VLAN_BSWAP, &rx_ring->flags))
> 1583				vid = be16_to_cpu(rx_desc->wb.upper.vlan);
  1584			else
  1585				vid = le16_to_cpu(rx_desc->wb.upper.vlan);
  1586	
  1587			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
  1588		}
  1589	}
  1590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
