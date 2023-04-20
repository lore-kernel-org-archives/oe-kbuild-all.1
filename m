Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA1946F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682032559; x=1713568559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmEpl2s36VHlDwWWgl9TQ3hYy/hIgWWYbYkYpPpSBYM=;
  b=KA/ITaJCwgRmu2rk3WHAY7TMo6Qa9D4K+fp2K6rlw0Xaluv6pBYsObEX
   2Htq+w+UEOvDRPkLrZsP99uLPeonqrBFpsutuEZwiZf0BqN2SDqjswPcT
   YAtsS1wXgpX2Uba+kYxaH5hj4mw/0tMbgy6UFOvQO0P6BPtl+1rz3EI1o
   MDU0f9tQiaSRino0ZLn5iuPGfaoRQR3HPlC08LwjuBBXHB/RoMiohmLqm
   f+wDR8ZedYQs7Yc2Ji4AJ3D0bWnp+UdfgJ0B+/IPZanGnr5WUCPB35uP/
   h6mAGGeDrytuQjhvuZGaLFzoM6fnyRQbcgxSXGjP5v2oqYDM/WcMZBOMV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330068022"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="330068022"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 16:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685540026"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="685540026"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 16:15:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppdVN-000gAC-02;
	Thu, 20 Apr 2023 23:15:57 +0000
Date: Fri, 21 Apr 2023 07:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2022-12 16063/16385]
 net/wireless/scan.c:1809:61: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202304210716.7LqQYMmQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-12
head:   b328aadc6d46f17493cebceb88ea9524a56e3298
commit: 1b7036d9ee20e194f543414e81de7e3f6fed76ba [16063/16385] UPSTREAM: wifi: cfg80211: update hidden BSSes to avoid WARN_ON
config: i386-randconfig-s001-20230417 (https://download.01.org/0day-ci/archive/20230421/202304210716.7LqQYMmQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2022-12
        git checkout 1b7036d9ee20e194f543414e81de7e3f6fed76ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/wireless/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210716.7LqQYMmQ-lkp@intel.com/

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
https://github.com/intel/lkp-tests
