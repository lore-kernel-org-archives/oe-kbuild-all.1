Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523807F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686766046; x=1718302046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzgTCVB6MgWYfNroNyU4FpDRj/2b7u7y+haJ1IdPiHo=;
  b=OyUvJRsy1Ew387t9W89xDT1dgjQVEv74CE3QAajG67wYxUy2Ykrysxn2
   08erwirEo1M9Wuv19G/tbbsv2PK9309vccPdfOdhDHxtfQMPb+JBI+nkf
   E5wsjz6EBRDFmSUacGGET+65mkdhupMOx2h8CmCeyU1wKaJ5LQIJbJ9d3
   3JDEqETVm7oErcafgqa1pcz6yfZsmur5ZICmzLsjurH2/+2W4eLupKsyl
   iulqunRtBa+Zbpu/cJPFazxoNhHu+jv/s5ZZ6SE91TVwSzJBiWJMzgZBB
   SBbWTJuU1gT07VMUAOGm9PCWcWVOlc9Bo90Q8M7V1uept3o4gzVjsRtua
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="358694577"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="358694577"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 11:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="706322676"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="706322676"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 11:07:21 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Utu-0000vl-30;
	Wed, 14 Jun 2023 18:07:22 +0000
Date: Thu, 15 Jun 2023 02:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 86/94] net/wireless/scan.c:2030:47: error:
 'drv_data' undeclared
Message-ID: <202306150259.NtnTXOUV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   9e95c6f58fcfc05f7abf84534b63f4d287f4aaf8
commit: ba8408a0a0ed1d5041aced32f51066c53298c16d [86/94] wifi: cfg80211: add inform_bss op to update BSS
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230615/202306150259.NtnTXOUV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=ba8408a0a0ed1d5041aced32f51066c53298c16d
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout ba8408a0a0ed1d5041aced32f51066c53298c16d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306150259.NtnTXOUV-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/wireless/scan.c: In function 'cfg80211_inform_single_bss_data':
>> net/wireless/scan.c:2030:47: error: 'drv_data' undeclared (first use in this function)
    2030 |         rdev_inform_bss(rdev, &res->pub, ies, drv_data->drv_data);
         |                                               ^~~~~~~~
   net/wireless/scan.c:2030:47: note: each undeclared identifier is reported only once for each function it appears in


vim +/drv_data +2030 net/wireless/scan.c

  1933	
  1934	/* Returned bss is reference counted and must be cleaned up appropriately. */
  1935	static struct cfg80211_bss *
  1936	cfg80211_inform_single_bss_data(struct wiphy *wiphy,
  1937					struct cfg80211_inform_bss *data,
  1938					enum cfg80211_bss_frame_type ftype,
  1939					const u8 *bssid, u64 tsf, u16 capability,
  1940					u16 beacon_interval, const u8 *ie, size_t ielen,
  1941					struct cfg80211_non_tx_bss *non_tx_data,
  1942					gfp_t gfp)
  1943	{
  1944		struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
  1945		struct cfg80211_bss_ies *ies;
  1946		struct ieee80211_channel *channel;
  1947		struct cfg80211_internal_bss tmp = {}, *res;
  1948		int bss_type;
  1949		bool signal_valid;
  1950		unsigned long ts;
  1951	
  1952		if (WARN_ON(!wiphy))
  1953			return NULL;
  1954	
  1955		if (WARN_ON(wiphy->signal_type == CFG80211_SIGNAL_TYPE_UNSPEC &&
  1956			    (data->signal < 0 || data->signal > 100)))
  1957			return NULL;
  1958	
  1959		channel = cfg80211_get_bss_channel(wiphy, ie, ielen, data->chan,
  1960						   data->scan_width);
  1961		if (!channel)
  1962			return NULL;
  1963	
  1964		memcpy(tmp.pub.bssid, bssid, ETH_ALEN);
  1965		tmp.pub.channel = channel;
  1966		tmp.pub.scan_width = data->scan_width;
  1967		tmp.pub.signal = data->signal;
  1968		tmp.pub.beacon_interval = beacon_interval;
  1969		tmp.pub.capability = capability;
  1970		tmp.ts_boottime = data->boottime_ns;
  1971		tmp.parent_tsf = data->parent_tsf;
  1972		ether_addr_copy(tmp.parent_bssid, data->parent_bssid);
  1973	
  1974		if (non_tx_data) {
  1975			tmp.pub.transmitted_bss = non_tx_data->tx_bss;
  1976			ts = bss_from_pub(non_tx_data->tx_bss)->ts;
  1977			tmp.pub.bssid_index = non_tx_data->bssid_index;
  1978			tmp.pub.max_bssid_indicator = non_tx_data->max_bssid_indicator;
  1979		} else {
  1980			ts = jiffies;
  1981	
  1982			if (channel->band == NL80211_BAND_60GHZ) {
  1983				bss_type = capability & WLAN_CAPABILITY_DMG_TYPE_MASK;
  1984				if (bss_type == WLAN_CAPABILITY_DMG_TYPE_AP ||
  1985				    bss_type == WLAN_CAPABILITY_DMG_TYPE_PBSS)
  1986					regulatory_hint_found_beacon(wiphy, channel,
  1987								     gfp);
  1988			} else {
  1989				if (capability & WLAN_CAPABILITY_ESS)
  1990					regulatory_hint_found_beacon(wiphy, channel,
  1991								     gfp);
  1992			}
  1993		}
  1994	
  1995		/*
  1996		 * If we do not know here whether the IEs are from a Beacon or Probe
  1997		 * Response frame, we need to pick one of the options and only use it
  1998		 * with the driver that does not provide the full Beacon/Probe Response
  1999		 * frame. Use Beacon frame pointer to avoid indicating that this should
  2000		 * override the IEs pointer should we have received an earlier
  2001		 * indication of Probe Response data.
  2002		 */
  2003		ies = kzalloc(sizeof(*ies) + ielen, gfp);
  2004		if (!ies)
  2005			return NULL;
  2006		ies->len = ielen;
  2007		ies->tsf = tsf;
  2008		ies->from_beacon = false;
  2009		memcpy(ies->data, ie, ielen);
  2010	
  2011		switch (ftype) {
  2012		case CFG80211_BSS_FTYPE_BEACON:
  2013			ies->from_beacon = true;
  2014			fallthrough;
  2015		case CFG80211_BSS_FTYPE_UNKNOWN:
  2016			rcu_assign_pointer(tmp.pub.beacon_ies, ies);
  2017			break;
  2018		case CFG80211_BSS_FTYPE_PRESP:
  2019			rcu_assign_pointer(tmp.pub.proberesp_ies, ies);
  2020			break;
  2021		}
  2022		rcu_assign_pointer(tmp.pub.ies, ies);
  2023	
  2024		signal_valid = data->chan == channel;
  2025		spin_lock_bh(&rdev->bss_lock);
  2026		res = __cfg80211_bss_update(rdev, &tmp, signal_valid, ts);
  2027		if (!res)
  2028			goto drop;
  2029	
> 2030		rdev_inform_bss(rdev, &res->pub, ies, drv_data->drv_data);
  2031	
  2032		if (non_tx_data) {
  2033			/* this is a nontransmitting bss, we need to add it to
  2034			 * transmitting bss' list if it is not there
  2035			 */
  2036			if (cfg80211_add_nontrans_list(non_tx_data->tx_bss,
  2037						       &res->pub)) {
  2038				if (__cfg80211_unlink_bss(rdev, res)) {
  2039					rdev->bss_generation++;
  2040					res = NULL;
  2041				}
  2042			}
  2043	
  2044			if (!res)
  2045				goto drop;
  2046		}
  2047		spin_unlock_bh(&rdev->bss_lock);
  2048	
  2049		trace_cfg80211_return_bss(&res->pub);
  2050		/* __cfg80211_bss_update gives us a referenced result */
  2051		return &res->pub;
  2052	
  2053	drop:
  2054		spin_unlock_bh(&rdev->bss_lock);
  2055		return NULL;
  2056	}
  2057	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
