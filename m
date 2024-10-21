Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28F1D12E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 20:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541275; cv=none; b=t1uRh4qebOTMIaSDk/GEsGq6S1tzNQbJMvKWe0WAoNwX/XTwg2PkU0XDEqrL5Fjtp1ZsGHxrwNFmeSs4S+iAZO42NkRGkTikhtoT/5Y6B+AnkWWNAUUQxZL2imG3woNSdksk2rx9/8HAoTwYze1EzzmVXZal+uNG462BLnmnv2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541275; c=relaxed/simple;
	bh=1d1PqCio0LcKKn4OXa7Sm0jtJA5OzgHl1J4vBHcmG4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+P+bqSASKHlr7AlWJezDYONwZYM7v8yr9TygEEVsAz7Tj6l6h3nl4ylhanzf9MZNrovRb3zz/1dBIdcc9N36zNXbxiHROqW05KnB1oOWle1V3KJRuxuM4CE0Ob4C8noCXLSYmjC+cgYtN7h6cvFHTrcGgsEhHXGODC/GgoPP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DWQ7iWTb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWQ7iWTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729541273; x=1761077273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1d1PqCio0LcKKn4OXa7Sm0jtJA5OzgHl1J4vBHcmG4s=;
  b=DWQ7iWTbbk1zjLIXTcX9wYx92q7tcaNxstqSaPqSlx9OU4Yfjwj/aYQ5
   RUn649TbIFnlW9n6VVaj1M/f1zE0htHe+JiOm/VWTpQ7LhzZTPEPZAGJK
   rPHWwsG9d2U7U4ON6aYbrQbznTDqB4Dw/D+aoIQLmfdnfKUvYbw2mkEi9
   +ccFtYc8F7Ccgiaob82oW3MssoGOc/NiV/psUM31iRzOqAhco6/2ecRC4
   1/w4iL95CrskjrByp+9/lxSmwIFKh85U1vIGyOTETlSdz/MDW/T+09eJ/
   KhOlb9TuEjpRFIefMVqF0kMKpl00JPRTHadLUWYX4s/6fd5k6gQq9mwr8
   w==;
X-CSE-ConnectionGUID: ilAjNsvwSeiIJ7DbBAiQ6g==
X-CSE-MsgGUID: lo5KtUAxTOqGF6rZJWxHOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40166559"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40166559"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 13:07:50 -0700
X-CSE-ConnectionGUID: YlNIsnDmRbepqoDBwgj6Tw==
X-CSE-MsgGUID: JUtJG238QZeWo1CcbNaHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79800569"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2024 13:07:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2ygq-000SbC-01;
	Mon, 21 Oct 2024 20:07:44 +0000
Date: Tue, 22 Oct 2024 04:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Subject: [linux-next:master 4407/6324]
 drivers/net/ethernet/realtek/r8169_main.c:2248 rtl8169_get_eth_mac_stats()
 warn: inconsistent indenting
Message-ID: <202410220413.1gAxIJ4t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   63b3ff03d91ae8f875fe8747c781a521f78cde17
commit: e3fc5139bd8ffaa1498adc21be4e8ecbc6aed508 [4407/6324] r8169: implement additional ethtool stats ops
config: x86_64-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220413.1gAxIJ4t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220413.1gAxIJ4t-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/realtek/r8169_main.c:2248 rtl8169_get_eth_mac_stats() warn: inconsistent indenting

vim +2248 drivers/net/ethernet/realtek/r8169_main.c

  2202	
  2203	static void rtl8169_get_eth_mac_stats(struct net_device *dev,
  2204					      struct ethtool_eth_mac_stats *mac_stats)
  2205	{
  2206		struct rtl8169_private *tp = netdev_priv(dev);
  2207	
  2208		rtl8169_update_counters(tp);
  2209	
  2210		mac_stats->FramesTransmittedOK =
  2211			le64_to_cpu(tp->counters->tx_packets);
  2212		mac_stats->SingleCollisionFrames =
  2213			le32_to_cpu(tp->counters->tx_one_collision);
  2214		mac_stats->MultipleCollisionFrames =
  2215			le32_to_cpu(tp->counters->tx_multi_collision);
  2216		mac_stats->FramesReceivedOK =
  2217			le64_to_cpu(tp->counters->rx_packets);
  2218		mac_stats->AlignmentErrors =
  2219			le16_to_cpu(tp->counters->align_errors);
  2220		mac_stats->FramesLostDueToIntMACXmitError =
  2221			le64_to_cpu(tp->counters->tx_errors);
  2222		mac_stats->BroadcastFramesReceivedOK =
  2223			le64_to_cpu(tp->counters->rx_broadcast);
  2224		mac_stats->MulticastFramesReceivedOK =
  2225			le32_to_cpu(tp->counters->rx_multicast);
  2226	
  2227		if (!rtl_is_8125(tp))
  2228			return;
  2229	
  2230		mac_stats->AlignmentErrors =
  2231			le32_to_cpu(tp->counters->align_errors32);
  2232		mac_stats->OctetsTransmittedOK =
  2233			le64_to_cpu(tp->counters->tx_octets);
  2234		mac_stats->LateCollisions =
  2235			le32_to_cpu(tp->counters->tx_late_collision);
  2236		mac_stats->FramesAbortedDueToXSColls =
  2237			le32_to_cpu(tp->counters->tx_aborted32);
  2238		mac_stats->OctetsReceivedOK =
  2239			le64_to_cpu(tp->counters->rx_octets);
  2240		mac_stats->FramesLostDueToIntMACRcvError =
  2241			le32_to_cpu(tp->counters->rx_mac_error);
  2242		mac_stats->MulticastFramesXmittedOK =
  2243			le64_to_cpu(tp->counters->tx_multicast64);
  2244		mac_stats->BroadcastFramesXmittedOK =
  2245			le64_to_cpu(tp->counters->tx_broadcast64);
  2246		mac_stats->MulticastFramesReceivedOK =
  2247			le64_to_cpu(tp->counters->rx_multicast64);
> 2248		 mac_stats->FrameTooLongErrors =
  2249			le32_to_cpu(tp->counters->rx_frame_too_long);
  2250	}
  2251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
