Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39C8BEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736578332; cv=none; b=t15sch5Ix86qOCHNE1ErLhjlXdMSLADKXqwlvW+qWFOImHDTjxhc4fKr5gPpzwJz/YjOdzwvjBSKXe2+Uga5llEO0+rldgWV0fi9+q43am4IH9bs2ng2vAwpCtKwcKwxEulV7iiMy31OZj6oXITJYjpSKY/XS5/NqsyAHCpHU3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736578332; c=relaxed/simple;
	bh=9AH5EiMH5X8K+wBhXWb+4UpGm/H25eH9B+6DxOM5Cy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3v251SgQ1FiYsrRu3Awq7WuLuuD6Cst04lhSdwiz/i6vr/Y84BRwTQz2lgX/ZRoiLDguVEStE5Le8NcRsSoGJdZEeKxjgSCr2mpd58CdgqQajq8JnKl+vN8ZbpNFV3Jyfy0ESTpN+SKkFhdSxq0ASoOLAbWMQxZisnAS0qEa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COR8Lguu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COR8Lguu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736578331; x=1768114331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9AH5EiMH5X8K+wBhXWb+4UpGm/H25eH9B+6DxOM5Cy4=;
  b=COR8LguuJZ7CsqBNglOGkSwOWwbQMe1jYl6bqPPGu7kd1ZVPPG2yY8gV
   z0fu7iOr4hSTzdkJBBF/x/BitUdfBY1J+AIqVnMdu3O6zKOQukMrfDJBq
   RTM9gEeJuH9rjLuWBxZlCWrhG/pwNHmfJCkfQj6SvWcyBv5iB9G0hSxSx
   LexH2MxJx0V6AMCkJ0bdPMzd8tVn1fsTWhobh/qxWAvgDLSreIAJ8Hzwn
   h3X0YJZPxyoKHDCQj+IHNZgP2iTJBWG2baKI0fkf+8GagCzBXHJYgL1nq
   X/VafKNsA+dC4S93kJUiML0EfCqGtmdRFFeUwP3IhPhHgznr7adRUWrgj
   w==;
X-CSE-ConnectionGUID: AFjCR9PTTaqGyloAvN/cxQ==
X-CSE-MsgGUID: S1eSKhpxR/KuG5pgmg7Tgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36160461"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36160461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 22:52:08 -0800
X-CSE-ConnectionGUID: 7+FpDUerRBKJJSyexDobeA==
X-CSE-MsgGUID: j6mDZ1rASMu1DDCzL4xB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134836051"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 22:52:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWVLp-000KJP-0F;
	Sat, 11 Jan 2025 06:52:05 +0000
Date: Sat, 11 Jan 2025 14:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/7] wifi: cfg80211: reorg sinfo structure elements
 for MLO
Message-ID: <202501111457.KNK3Pg5x-lkp@intel.com>
References: <20250110042449.1158789-3-quic_sarishar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250110042449.1158789-3-quic_sarishar@quicinc.com>

Hi Sarika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 7bf1659bad4e9413cdba132ef9cbd0caa9cabcc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-cfg80211-reorg-sinfo-structure-elements-for-mesh/20250110-122824
base:   7bf1659bad4e9413cdba132ef9cbd0caa9cabcc4
patch link:    https://lore.kernel.org/r/20250110042449.1158789-3-quic_sarishar%40quicinc.com
patch subject: [PATCH RFC 2/7] wifi: cfg80211: reorg sinfo structure elements for MLO
config: csky-randconfig-001-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111457.KNK3Pg5x-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111457.KNK3Pg5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111457.KNK3Pg5x-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/batman-adv/bat_v_elp.c: In function 'batadv_v_elp_get_throughput':
>> net/batman-adv/bat_v_elp.c:113:37: error: 'struct station_info' has no member named 'expected_throughput'
     113 |                         return sinfo.expected_throughput / 100;
         |                                     ^
   net/batman-adv/bat_v_elp.c:119:65: error: 'struct station_info' has no member named 'txrate'
     119 |                         return cfg80211_calculate_bitrate(&sinfo.txrate) / 3;
         |                                                                 ^


vim +113 net/batman-adv/bat_v_elp.c

d6f94d91f766b4 Linus Lüssing     2016-01-16   58  
c833484e5f3872 Antonio Quartulli 2015-11-10   59  /**
7e9a8c2ce7c5f8 Sven Eckelmann    2017-12-02   60   * batadv_v_elp_get_throughput() - get the throughput towards a neighbour
c833484e5f3872 Antonio Quartulli 2015-11-10   61   * @neigh: the neighbour for which the throughput has to be obtained
c833484e5f3872 Antonio Quartulli 2015-11-10   62   *
c833484e5f3872 Antonio Quartulli 2015-11-10   63   * Return: The throughput towards the given neighbour in multiples of 100kpbs
bccb48c89fe3c0 Sven Eckelmann    2020-06-01   64   *         (a value of '1' equals 0.1Mbps, '10' equals 1Mbps, etc).
c833484e5f3872 Antonio Quartulli 2015-11-10   65   */
c833484e5f3872 Antonio Quartulli 2015-11-10   66  static u32 batadv_v_elp_get_throughput(struct batadv_hardif_neigh_node *neigh)
c833484e5f3872 Antonio Quartulli 2015-11-10   67  {
c833484e5f3872 Antonio Quartulli 2015-11-10   68  	struct batadv_hard_iface *hard_iface = neigh->if_incoming;
c833484e5f3872 Antonio Quartulli 2015-11-10   69  	struct ethtool_link_ksettings link_settings;
1942de1bbac301 Marek Lindner     2016-09-30   70  	struct net_device *real_netdev;
c833484e5f3872 Antonio Quartulli 2015-11-10   71  	struct station_info sinfo;
c833484e5f3872 Antonio Quartulli 2015-11-10   72  	u32 throughput;
c833484e5f3872 Antonio Quartulli 2015-11-10   73  	int ret;
c833484e5f3872 Antonio Quartulli 2015-11-10   74  
c833484e5f3872 Antonio Quartulli 2015-11-10   75  	/* if the user specified a customised value for this interface, then
c833484e5f3872 Antonio Quartulli 2015-11-10   76  	 * return it directly
c833484e5f3872 Antonio Quartulli 2015-11-10   77  	 */
c833484e5f3872 Antonio Quartulli 2015-11-10   78  	throughput =  atomic_read(&hard_iface->bat_v.throughput_override);
c833484e5f3872 Antonio Quartulli 2015-11-10   79  	if (throughput != 0)
c833484e5f3872 Antonio Quartulli 2015-11-10   80  		return throughput;
c833484e5f3872 Antonio Quartulli 2015-11-10   81  
c833484e5f3872 Antonio Quartulli 2015-11-10   82  	/* if this is a wireless device, then ask its throughput through
c833484e5f3872 Antonio Quartulli 2015-11-10   83  	 * cfg80211 API
c833484e5f3872 Antonio Quartulli 2015-11-10   84  	 */
10b1bbb46c6c8e Sven Eckelmann    2016-09-30   85  	if (batadv_is_wifi_hardif(hard_iface)) {
10b1bbb46c6c8e Sven Eckelmann    2016-09-30   86  		if (!batadv_is_cfg80211_hardif(hard_iface))
f44a3ae9a2811c Marek Lindner     2016-09-30   87  			/* unsupported WiFi driver version */
f44a3ae9a2811c Marek Lindner     2016-09-30   88  			goto default_throughput;
f44a3ae9a2811c Marek Lindner     2016-09-30   89  
1942de1bbac301 Marek Lindner     2016-09-30   90  		real_netdev = batadv_get_real_netdev(hard_iface->net_dev);
1942de1bbac301 Marek Lindner     2016-09-30   91  		if (!real_netdev)
1942de1bbac301 Marek Lindner     2016-09-30   92  			goto default_throughput;
1942de1bbac301 Marek Lindner     2016-09-30   93  
1942de1bbac301 Marek Lindner     2016-09-30   94  		ret = cfg80211_get_station(real_netdev, neigh->addr, &sinfo);
1942de1bbac301 Marek Lindner     2016-09-30   95  
ca8c3b922e7032 Anders Roxell     2019-02-22   96  		if (!ret) {
7d652669b61d70 Felix Fietkau     2019-01-25   97  			/* free the TID stats immediately */
7d652669b61d70 Felix Fietkau     2019-01-25   98  			cfg80211_sinfo_release_content(&sinfo);
ca8c3b922e7032 Anders Roxell     2019-02-22   99  		}
7d652669b61d70 Felix Fietkau     2019-01-25  100  
1942de1bbac301 Marek Lindner     2016-09-30  101  		dev_put(real_netdev);
c833484e5f3872 Antonio Quartulli 2015-11-10  102  		if (ret == -ENOENT) {
c833484e5f3872 Antonio Quartulli 2015-11-10  103  			/* Node is not associated anymore! It would be
c833484e5f3872 Antonio Quartulli 2015-11-10  104  			 * possible to delete this neighbor. For now set
c833484e5f3872 Antonio Quartulli 2015-11-10  105  			 * the throughput metric to 0.
c833484e5f3872 Antonio Quartulli 2015-11-10  106  			 */
c833484e5f3872 Antonio Quartulli 2015-11-10  107  			return 0;
c833484e5f3872 Antonio Quartulli 2015-11-10  108  		}
3f3f87325dcb3c Sven Eckelmann    2017-06-09  109  		if (ret)
3f3f87325dcb3c Sven Eckelmann    2017-06-09  110  			goto default_throughput;
3f3f87325dcb3c Sven Eckelmann    2017-06-09  111  
2b1aa5a4c654cc René Treffer      2019-11-26  112  		if (sinfo.filled & BIT(NL80211_STA_INFO_EXPECTED_THROUGHPUT))
c833484e5f3872 Antonio Quartulli 2015-11-10 @113  			return sinfo.expected_throughput / 100;
2b1aa5a4c654cc René Treffer      2019-11-26  114  
2b1aa5a4c654cc René Treffer      2019-11-26  115  		/* try to estimate the expected throughput based on reported tx
2b1aa5a4c654cc René Treffer      2019-11-26  116  		 * rates
2b1aa5a4c654cc René Treffer      2019-11-26  117  		 */
2b1aa5a4c654cc René Treffer      2019-11-26  118  		if (sinfo.filled & BIT(NL80211_STA_INFO_TX_BITRATE))
2b1aa5a4c654cc René Treffer      2019-11-26  119  			return cfg80211_calculate_bitrate(&sinfo.txrate) / 3;
2b1aa5a4c654cc René Treffer      2019-11-26  120  
2b1aa5a4c654cc René Treffer      2019-11-26  121  		goto default_throughput;
c833484e5f3872 Antonio Quartulli 2015-11-10  122  	}
c833484e5f3872 Antonio Quartulli 2015-11-10  123  
c833484e5f3872 Antonio Quartulli 2015-11-10  124  	/* if not a wifi interface, check if this device provides data via
c833484e5f3872 Antonio Quartulli 2015-11-10  125  	 * ethtool (e.g. an Ethernet adapter)
c833484e5f3872 Antonio Quartulli 2015-11-10  126  	 */
c833484e5f3872 Antonio Quartulli 2015-11-10  127  	rtnl_lock();
c833484e5f3872 Antonio Quartulli 2015-11-10  128  	ret = __ethtool_get_link_ksettings(hard_iface->net_dev, &link_settings);
c833484e5f3872 Antonio Quartulli 2015-11-10  129  	rtnl_unlock();
9ad346c90509eb Sven Eckelmann    2019-11-25  130  	if (ret == 0) {
c833484e5f3872 Antonio Quartulli 2015-11-10  131  		/* link characteristics might change over time */
c833484e5f3872 Antonio Quartulli 2015-11-10  132  		if (link_settings.base.duplex == DUPLEX_FULL)
c833484e5f3872 Antonio Quartulli 2015-11-10  133  			hard_iface->bat_v.flags |= BATADV_FULL_DUPLEX;
c833484e5f3872 Antonio Quartulli 2015-11-10  134  		else
c833484e5f3872 Antonio Quartulli 2015-11-10  135  			hard_iface->bat_v.flags &= ~BATADV_FULL_DUPLEX;
c833484e5f3872 Antonio Quartulli 2015-11-10  136  
c833484e5f3872 Antonio Quartulli 2015-11-10  137  		throughput = link_settings.base.speed;
825ffe1f7b8751 Sven Eckelmann    2017-08-23  138  		if (throughput && throughput != SPEED_UNKNOWN)
c833484e5f3872 Antonio Quartulli 2015-11-10  139  			return throughput * 10;
c833484e5f3872 Antonio Quartulli 2015-11-10  140  	}
c833484e5f3872 Antonio Quartulli 2015-11-10  141  
c833484e5f3872 Antonio Quartulli 2015-11-10  142  default_throughput:
c833484e5f3872 Antonio Quartulli 2015-11-10  143  	if (!(hard_iface->bat_v.flags & BATADV_WARNING_DEFAULT)) {
c833484e5f3872 Antonio Quartulli 2015-11-10  144  		batadv_info(hard_iface->soft_iface,
c833484e5f3872 Antonio Quartulli 2015-11-10  145  			    "WiFi driver or ethtool info does not provide information about link speeds on interface %s, therefore defaulting to hardcoded throughput values of %u.%1u Mbps. Consider overriding the throughput manually or checking your driver.\n",
c833484e5f3872 Antonio Quartulli 2015-11-10  146  			    hard_iface->net_dev->name,
c833484e5f3872 Antonio Quartulli 2015-11-10  147  			    BATADV_THROUGHPUT_DEFAULT_VALUE / 10,
c833484e5f3872 Antonio Quartulli 2015-11-10  148  			    BATADV_THROUGHPUT_DEFAULT_VALUE % 10);
c833484e5f3872 Antonio Quartulli 2015-11-10  149  		hard_iface->bat_v.flags |= BATADV_WARNING_DEFAULT;
c833484e5f3872 Antonio Quartulli 2015-11-10  150  	}
c833484e5f3872 Antonio Quartulli 2015-11-10  151  
c833484e5f3872 Antonio Quartulli 2015-11-10  152  	/* if none of the above cases apply, return the base_throughput */
c833484e5f3872 Antonio Quartulli 2015-11-10  153  	return BATADV_THROUGHPUT_DEFAULT_VALUE;
c833484e5f3872 Antonio Quartulli 2015-11-10  154  }
c833484e5f3872 Antonio Quartulli 2015-11-10  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
