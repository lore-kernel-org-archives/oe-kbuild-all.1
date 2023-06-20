Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D9F2AB42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 23:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687303726; x=1718839726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4fBThaAcQh6+j9WWLE7GfaZ1xtfV4adtFhuJKgvJ3TU=;
  b=i+TVsgX+AkMP7eQfYdpJ8mf7jL2pmkcD7tDiPcop1EbSA/YVFAdnG/qG
   UU//QxiX7g5KL8kkUQhnA634Am8lI5Vyz2XLrlNu5Vial1nBYz2aOgp5D
   IGMiCpLXgZZX6CSqwOJDMRGR2CP2WhdcmP5S4XEpLTHS7xxBohvQu2pdY
   HsJxXX+2ox6Ot3DPxvxO4OhIdwN9ylqFBdx15fOY5wKSUxEo7A+7m1tpt
   JpOX/WNgam+6jQ/DDaYVpX+c1bA70u1ZW4ILCu/1m7CjH4LR/NcZyB74S
   k+Ppi3MC/WDDDKyJWC+j5LT7RMITGrHN50b1nrS4fs6oNNAV7pO8bReTO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389383172"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="389383172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 16:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="743937329"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="743937329"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Jun 2023 16:28:43 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBkmA-0006Ko-25;
	Tue, 20 Jun 2023 23:28:42 +0000
Date: Wed, 21 Jun 2023 07:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: gregory.greenman@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 19/19] wifi: iwlwifi: mvm: Add support for scan version 17
Message-ID: <202306210703.lfigjUvc-lkp@intel.com>
References: <20230620125813.0a41c847d450.I0c9b45cc3eb39d44c75d3bdca84f0a91fdad1fa1@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620125813.0a41c847d450.I0c9b45cc3eb39d44c75d3bdca84f0a91fdad1fa1@changeid>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20230620]
[cannot apply to wireless/main linus/master v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gregory-greenman-intel-com/wifi-iwlwifi-pcie-refactor-RB-status-size-calculation/20230620-180624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230620125813.0a41c847d450.I0c9b45cc3eb39d44c75d3bdca84f0a91fdad1fa1%40changeid
patch subject: [PATCH 19/19] wifi: iwlwifi: mvm: Add support for scan version 17
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306210703.lfigjUvc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210703.lfigjUvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210703.lfigjUvc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/mvm/scan.c: In function 'iwl_mvm_umac_scan_cfg_channels_v7_6g':
>> drivers/net/wireless/intel/iwlwifi/mvm/scan.c:1754:29: error: 'IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED' undeclared (first use in this function); did you mean 'IEEE80211_RNR_TBTT_PARAMS_SAME_SSID'?
    1754 |                 s8 psd_20 = IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             IEEE80211_RNR_TBTT_PARAMS_SAME_SSID
   drivers/net/wireless/intel/iwlwifi/mvm/scan.c:1754:29: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/intel/iwlwifi/mvm/scan.c:1792:57: error: 'struct cfg80211_scan_6ghz_params' has no member named 'psd_20'
    1792 |                         tmp_psd_20 = scan_6ghz_params[j].psd_20;
         |                                                         ^
   drivers/net/wireless/intel/iwlwifi/mvm/scan.c: In function 'iwl_mvm_scan_umac_fill_ch_p_v7':
   drivers/net/wireless/intel/iwlwifi/mvm/scan.c:2443:41: error: 'IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED' undeclared (first use in this function); did you mean 'IEEE80211_RNR_TBTT_PARAMS_SAME_SSID'?
    2443 |                                         IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED;
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         IEEE80211_RNR_TBTT_PARAMS_SAME_SSID


vim +1754 drivers/net/wireless/intel/iwlwifi/mvm/scan.c

  1730	
  1731	/* TODO: this function can be merged with iwl_mvm_scan_umac_fill_ch_p_v7 */
  1732	static u32
  1733	iwl_mvm_umac_scan_cfg_channels_v7_6g(struct iwl_mvm *mvm,
  1734					     struct iwl_mvm_scan_params *params,
  1735					     u32 n_channels,
  1736					     struct iwl_scan_probe_params_v4 *pp,
  1737					     struct iwl_scan_channel_params_v7 *cp,
  1738					     enum nl80211_iftype vif_type,
  1739					     u32 version)
  1740	{
  1741		int i;
  1742		struct cfg80211_scan_6ghz_params *scan_6ghz_params =
  1743			params->scan_6ghz_params;
  1744		u32 ch_cnt;
  1745	
  1746		for (i = 0, ch_cnt = 0; i < params->n_channels; i++) {
  1747			struct iwl_scan_channel_cfg_umac *cfg =
  1748				&cp->channel_config[ch_cnt];
  1749	
  1750			u32 s_ssid_bitmap = 0, bssid_bitmap = 0, flags = 0;
  1751			u8 j, k, s_max = 0, b_max = 0, n_used_bssid_entries;
  1752			bool force_passive, found = false, allow_passive = true,
  1753			     unsolicited_probe_on_chan = false, psc_no_listen = false;
> 1754			s8 psd_20 = IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED;
  1755	
  1756			/*
  1757			 * Avoid performing passive scan on non PSC channels unless the
  1758			 * scan is specifically a passive scan, i.e., no SSIDs
  1759			 * configured in the scan command.
  1760			 */
  1761			if (!cfg80211_channel_is_psc(params->channels[i]) &&
  1762			    !params->n_6ghz_params && params->n_ssids)
  1763				continue;
  1764	
  1765			cfg->v1.channel_num = params->channels[i]->hw_value;
  1766			if (version < 17)
  1767				cfg->v2.band = PHY_BAND_6;
  1768			else
  1769				cfg->flags |= cpu_to_le32(PHY_BAND_6 <<
  1770							  IWL_CHAN_CFG_FLAGS_BAND_POS);
  1771	
  1772			cfg->v5.iter_count = 1;
  1773			cfg->v5.iter_interval = 0;
  1774	
  1775			/*
  1776			 * The optimize the scan time, i.e., reduce the scan dwell time
  1777			 * on each channel, the below logic tries to set 3 direct BSSID
  1778			 * probe requests for each broadcast probe request with a short
  1779			 * SSID.
  1780			 * TODO: improve this logic
  1781			 */
  1782			n_used_bssid_entries = 3;
  1783			for (j = 0; j < params->n_6ghz_params; j++) {
  1784				s8 tmp_psd_20;
  1785	
  1786				if (!(scan_6ghz_params[j].channel_idx == i))
  1787					continue;
  1788	
  1789				/* Use the highest PSD value allowed as advertised by
  1790				 * APs for this channel
  1791				 */
> 1792				tmp_psd_20 = scan_6ghz_params[j].psd_20;
  1793				if (tmp_psd_20 !=
  1794				    IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED &&
  1795				    (psd_20 ==
  1796				     IEEE80211_RNR_TBTT_PARAMS_PSD_RESERVED ||
  1797				     psd_20 < tmp_psd_20))
  1798					psd_20 = tmp_psd_20;
  1799	
  1800				found = false;
  1801				unsolicited_probe_on_chan |=
  1802					scan_6ghz_params[j].unsolicited_probe;
  1803				psc_no_listen |= scan_6ghz_params[j].psc_no_listen;
  1804	
  1805				for (k = 0; k < pp->short_ssid_num; k++) {
  1806					if (!scan_6ghz_params[j].unsolicited_probe &&
  1807					    le32_to_cpu(pp->short_ssid[k]) ==
  1808					    scan_6ghz_params[j].short_ssid) {
  1809						/* Relevant short SSID bit set */
  1810						if (s_ssid_bitmap & BIT(k)) {
  1811							found = true;
  1812							break;
  1813						}
  1814	
  1815						/*
  1816						 * Use short SSID only to create a new
  1817						 * iteration during channel dwell or in
  1818						 * case that the short SSID has a
  1819						 * matching SSID, i.e., scan for hidden
  1820						 * APs.
  1821						 */
  1822						if (n_used_bssid_entries >= 3) {
  1823							s_ssid_bitmap |= BIT(k);
  1824							s_max++;
  1825							n_used_bssid_entries -= 3;
  1826							found = true;
  1827							break;
  1828						} else if (pp->direct_scan[k].len) {
  1829							s_ssid_bitmap |= BIT(k);
  1830							s_max++;
  1831							found = true;
  1832							allow_passive = false;
  1833							break;
  1834						}
  1835					}
  1836				}
  1837	
  1838				if (found)
  1839					continue;
  1840	
  1841				for (k = 0; k < pp->bssid_num; k++) {
  1842					if (!memcmp(&pp->bssid_array[k],
  1843						    scan_6ghz_params[j].bssid,
  1844						    ETH_ALEN)) {
  1845						if (!(bssid_bitmap & BIT(k))) {
  1846							bssid_bitmap |= BIT(k);
  1847							b_max++;
  1848							n_used_bssid_entries++;
  1849						}
  1850						break;
  1851					}
  1852				}
  1853			}
  1854	
  1855			if (cfg80211_channel_is_psc(params->channels[i]) &&
  1856			    psc_no_listen)
  1857				flags |= IWL_UHB_CHAN_CFG_FLAG_PSC_CHAN_NO_LISTEN;
  1858	
  1859			if (unsolicited_probe_on_chan)
  1860				flags |= IWL_UHB_CHAN_CFG_FLAG_UNSOLICITED_PROBE_RES;
  1861	
  1862			/*
  1863			 * In the following cases apply passive scan:
  1864			 * 1. Non fragmented scan:
  1865			 *	- PSC channel with NO_LISTEN_FLAG on should be treated
  1866			 *	  like non PSC channel
  1867			 *	- Non PSC channel with more than 3 short SSIDs or more
  1868			 *	  than 9 BSSIDs.
  1869			 *	- Non PSC Channel with unsolicited probe response and
  1870			 *	  more than 2 short SSIDs or more than 6 BSSIDs.
  1871			 *	- PSC channel with more than 2 short SSIDs or more than
  1872			 *	  6 BSSIDs.
  1873			 * 3. Fragmented scan:
  1874			 *	- PSC channel with more than 1 SSID or 3 BSSIDs.
  1875			 *	- Non PSC channel with more than 2 SSIDs or 6 BSSIDs.
  1876			 *	- Non PSC channel with unsolicited probe response and
  1877			 *	  more than 1 SSID or more than 3 BSSIDs.
  1878			 */
  1879			if (!iwl_mvm_is_scan_fragmented(params->type)) {
  1880				if (!cfg80211_channel_is_psc(params->channels[i]) ||
  1881				    flags & IWL_UHB_CHAN_CFG_FLAG_PSC_CHAN_NO_LISTEN) {
  1882					force_passive = (s_max > 3 || b_max > 9);
  1883					force_passive |= (unsolicited_probe_on_chan &&
  1884							  (s_max > 2 || b_max > 6));
  1885				} else {
  1886					force_passive = (s_max > 2 || b_max > 6);
  1887				}
  1888			} else if (cfg80211_channel_is_psc(params->channels[i])) {
  1889				force_passive = (s_max > 1 || b_max > 3);
  1890			} else {
  1891				force_passive = (s_max > 2 || b_max > 6);
  1892				force_passive |= (unsolicited_probe_on_chan &&
  1893						  (s_max > 1 || b_max > 3));
  1894			}
  1895			if ((allow_passive && force_passive) ||
  1896			    (!(bssid_bitmap | s_ssid_bitmap) &&
  1897			     !cfg80211_channel_is_psc(params->channels[i])))
  1898				flags |= IWL_UHB_CHAN_CFG_FLAG_FORCE_PASSIVE;
  1899			else
  1900				flags |= bssid_bitmap | (s_ssid_bitmap << 16);
  1901	
  1902			cfg->flags |= cpu_to_le32(flags);
  1903			if (version >= 17)
  1904				cfg->v5.psd_20 = psd_20;
  1905	
  1906			ch_cnt++;
  1907		}
  1908	
  1909		if (params->n_channels > ch_cnt)
  1910			IWL_DEBUG_SCAN(mvm,
  1911				       "6GHz: reducing number channels: (%u->%u)\n",
  1912				       params->n_channels, ch_cnt);
  1913	
  1914		return ch_cnt;
  1915	}
  1916	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
