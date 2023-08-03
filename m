Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2625917
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 21:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691099633; x=1722635633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/uOcYNbjJNoTtJfR/JYmXLX1Z1Lfmj1awX4JVsf0Iw=;
  b=kAltRiyv8nCBi4AikqdKUhsFYNf/r4wUiVcJURiezp5OZuiMTg6LJF1e
   otVaAO0E2lflBnRYgDzplT+YPR27BVizAQMJ6DQX3tgOf14cIhmLD8whk
   oObI/vUal48lPJidSytHskn9s8w9MIyZLtV+eiquozBNuxwRcKQ0DE5jR
   s9xZml5rUSsX7Nvr8dJaGGWwxoAYC3Lti0ZcqF6nSe3XrARg6wFjTP/3B
   YD6h7gyidc7Cq9SVzBickTHLSXE+N0imjbEkl/sIMRdgs/6+NJZGhZIK7
   LjbN6MwXwAVqiBt87dzclEPK5+QBXjI95bPul2vh5upNufsH0SNojChGu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="360059941"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="360059941"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 14:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679639320"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="679639320"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Aug 2023 14:53:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRgGU-0002NL-1D;
	Thu, 03 Aug 2023 21:53:50 +0000
Date: Fri, 4 Aug 2023 05:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2022-12 16063/16400]
 net/wireless/scan.c:1809:61: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202308040515.UO15aXU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-12
head:   dd7483ef9e6b98347f50c14ea5a784815248b89e
commit: 1b7036d9ee20e194f543414e81de7e3f6fed76ba [16063/16400] UPSTREAM: wifi: cfg80211: update hidden BSSes to avoid WARN_ON
config: i386-randconfig-i061-20230730 (https://download.01.org/0day-ci/archive/20230804/202308040515.UO15aXU2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040515.UO15aXU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040515.UO15aXU2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/wireless/scan.c:1809:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct cfg80211_bss_ies const *new_ies @@     got struct cfg80211_bss_ies const [noderef] __rcu *beacon_ies @@
   net/wireless/scan.c:1809:61: sparse:     expected struct cfg80211_bss_ies const *new_ies
   net/wireless/scan.c:1809:61: sparse:     got struct cfg80211_bss_ies const [noderef] __rcu *beacon_ies

vim +1809 net/wireless/scan.c

  1758	
  1759	static bool
  1760	cfg80211_update_known_bss(struct cfg80211_registered_device *rdev,
  1761				  struct cfg80211_internal_bss *known,
  1762				  struct cfg80211_internal_bss *new,
  1763				  bool signal_valid)
  1764	{
  1765		lockdep_assert_held(&rdev->bss_lock);
  1766	
  1767		/* Update IEs */
  1768		if (rcu_access_pointer(new->pub.proberesp_ies)) {
  1769			const struct cfg80211_bss_ies *old;
  1770	
  1771			old = rcu_access_pointer(known->pub.proberesp_ies);
  1772	
  1773			rcu_assign_pointer(known->pub.proberesp_ies,
  1774					   new->pub.proberesp_ies);
  1775			/* Override possible earlier Beacon frame IEs */
  1776			rcu_assign_pointer(known->pub.ies,
  1777					   new->pub.proberesp_ies);
  1778			if (old)
  1779				kfree_rcu((struct cfg80211_bss_ies *)old, rcu_head);
  1780		} else if (rcu_access_pointer(new->pub.beacon_ies)) {
  1781			const struct cfg80211_bss_ies *old;
  1782	
  1783			if (known->pub.hidden_beacon_bss &&
  1784			    !list_empty(&known->hidden_list)) {
  1785				const struct cfg80211_bss_ies *f;
  1786	
  1787				/* The known BSS struct is one of the probe
  1788				 * response members of a group, but we're
  1789				 * receiving a beacon (beacon_ies in the new
  1790				 * bss is used). This can only mean that the
  1791				 * AP changed its beacon from not having an
  1792				 * SSID to showing it, which is confusing so
  1793				 * drop this information.
  1794				 */
  1795	
  1796				f = rcu_access_pointer(new->pub.beacon_ies);
  1797				kfree_rcu((struct cfg80211_bss_ies *)f, rcu_head);
  1798				return false;
  1799			}
  1800	
  1801			old = rcu_access_pointer(known->pub.beacon_ies);
  1802	
  1803			rcu_assign_pointer(known->pub.beacon_ies, new->pub.beacon_ies);
  1804	
  1805			/* Override IEs if they were from a beacon before */
  1806			if (old == rcu_access_pointer(known->pub.ies))
  1807				rcu_assign_pointer(known->pub.ies, new->pub.beacon_ies);
  1808	
> 1809			cfg80211_update_hidden_bsses(known, new->pub.beacon_ies, old);
  1810	
  1811			if (old)
  1812				kfree_rcu((struct cfg80211_bss_ies *)old, rcu_head);
  1813		}
  1814	
  1815		known->pub.beacon_interval = new->pub.beacon_interval;
  1816	
  1817		/* don't update the signal if beacon was heard on
  1818		 * adjacent channel.
  1819		 */
  1820		if (signal_valid)
  1821			known->pub.signal = new->pub.signal;
  1822		known->pub.capability = new->pub.capability;
  1823		known->ts = new->ts;
  1824		known->ts_boottime = new->ts_boottime;
  1825		known->parent_tsf = new->parent_tsf;
  1826		known->pub.chains = new->pub.chains;
  1827		memcpy(known->pub.chain_signal, new->pub.chain_signal,
  1828		       IEEE80211_MAX_CHAINS);
  1829		ether_addr_copy(known->parent_bssid, new->parent_bssid);
  1830		known->pub.max_bssid_indicator = new->pub.max_bssid_indicator;
  1831		known->pub.bssid_index = new->pub.bssid_index;
  1832	
  1833		return true;
  1834	}
  1835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
