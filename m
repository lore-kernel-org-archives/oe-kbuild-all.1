Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8D3B2BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710930673; cv=none; b=C68piAAV5oc9LDy50n5pDe1QWrDz2ZfB5WcYzZjusLLP2PGL3Nzu28oYIjqnvgO/O7TBh+JvaMV7SeZH9u+qb3obWB3l34bYU0JEaGXhC4MxdY9VYlKOYp7nPnFhL15sRT1MsVch15omqtXKy3/0wfkia70N5GjpmOhqwGVofKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710930673; c=relaxed/simple;
	bh=kk1VO/VIWoLUugbbX/CAC3tULHIN7qR6ovr34HgwACA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T199YOPbZ6XQ/qnCiONQLIP2+Xi+g/ug82sc++f0wi9nBQ84MD6DiE+DmXJEXiikTCwHyhjyQjK/b5JsdpK0TKhvwCvwEy+gRqqzvpLpcg5EVLIHTdJB93vXLYoTTQ8IfhqdlS8GpTt8jGCrNfWQ5fhEs+qm42jWEJhfwoPKsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOuP53f+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOuP53f+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710930671; x=1742466671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kk1VO/VIWoLUugbbX/CAC3tULHIN7qR6ovr34HgwACA=;
  b=SOuP53f+L+92/ZKrpZCQpMJzofkH6wf9OgTUhU6WZDEQDQq/nV3VnHR/
   U4QDcQoDcKxuZ9SouYx9KoTBMhvNv5JfO9QPvGA2r9bZ6Lbt3pNjdTAq6
   e8dVEWnD1x5UJqMT/KkrsaWtWlyAEj17DY7wsm/jCT7aHEts19vMA1pha
   HA4pTavfuMIZcQTLRFRYiTy+k+3aVxGoKhhJit2Np5Ha3DXqIIbaI+RdN
   /YTYQBjfjgKwnwNK8YoRRrwW7odzciqsn9CohTrl9bwVqHyl7WUO3vFdT
   Pkhc5o9sdAMng6G7rW4Uaz1ImByVEvezW/hG328jJkUkwnxdp8tYANwD2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="8792393"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="8792393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 03:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14113039"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Mar 2024 03:31:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmtDs-000IXb-2m;
	Wed, 20 Mar 2024 10:31:04 +0000
Date: Wed, 20 Mar 2024 18:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4026/4224]
 drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3246:6: warning: no previous
 prototype for function 'rnpm_get_phy_statistics'
Message-ID: <202403201844.sT1rPTz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b61688dbd28fa5eb9aa4e4109bc38543cd1d596f
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [4026/4224] drivers: initial support for rnpm drivers from Mucse Technology
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240320/202403201844.sT1rPTz4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201844.sT1rPTz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201844.sT1rPTz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1290:7: warning: variable 'autoneg_changed' set but not used [-Wunused-but-set-variable]
    1290 |         bool autoneg_changed = false, duplex_changed = false;
         |              ^
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1290:32: warning: variable 'duplex_changed' set but not used [-Wunused-but-set-variable]
    1290 |         bool autoneg_changed = false, duplex_changed = false;
         |                                       ^
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2092:6: warning: variable 'dma_ch' set but not used [-Wunused-but-set-variable]
    2092 |         u32 dma_ch;
         |             ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3246:6: warning: no previous prototype for function 'rnpm_get_phy_statistics' [-Wmissing-prototypes]
    3246 | void rnpm_get_phy_statistics(struct net_device *netdev,
         |      ^
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3246 | void rnpm_get_phy_statistics(struct net_device *netdev,
         | ^
         | static 
   4 warnings generated.
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:976:5: warning: no previous prototype for function 'rnpm_get_vf_ringnum' [-Wmissing-prototypes]
     976 | int rnpm_get_vf_ringnum(int vf, int num)
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:976:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     976 | int rnpm_get_vf_ringnum(int vf, int num)
         | ^
         | static 
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:986:9: warning: variable 'y' set but not used [-Wunused-but-set-variable]
     986 |         u64 x, y, result;
         |                ^
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:983:5: warning: no previous prototype for function 'rnpm_setup_ring_maxrate' [-Wmissing-prototypes]
     983 | int rnpm_setup_ring_maxrate(struct rnpm_adapter *adapter, int ring,
         |     ^
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:983:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     983 | int rnpm_setup_ring_maxrate(struct rnpm_adapter *adapter, int ring,
         | ^
         | static 
   3 warnings generated.


vim +/rnpm_get_phy_statistics +3246 drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c

  3245	
> 3246	void rnpm_get_phy_statistics(struct net_device *netdev,
  3247				     struct ethtool_stats *stats, u64 *data)
  3248	{
  3249		struct rnpm_adapter *adapter = netdev_priv(netdev);
  3250		struct rnpm_hw *hw = &adapter->hw;
  3251		struct phy_statistics ps;
  3252	
  3253		if (rnpm_mbx_get_phy_statistics(hw, (u8 *)&ps) != 0)
  3254			return;
  3255	
  3256		*data++ = ps.yt.pkg_ib_valid;
  3257		*data++ = ps.yt.pkg_ib_os_good;
  3258		*data++ = ps.yt.pkg_ib_us_good;
  3259		*data++ = ps.yt.pkg_ib_err;
  3260		*data++ = ps.yt.pkg_ib_os_bad;
  3261		*data++ = ps.yt.pkg_ib_frag;
  3262		*data++ = ps.yt.pkg_ib_nosfd;
  3263		*data++ = ps.yt.pkg_ob_valid;
  3264		*data++ = ps.yt.pkg_ob_os_good;
  3265		*data++ = ps.yt.pkg_ob_us_good;
  3266		*data++ = ps.yt.pkg_ob_err;
  3267		*data++ = ps.yt.pkg_ob_os_bad;
  3268		*data++ = ps.yt.pkg_ob_frag;
  3269		*data++ = ps.yt.pkg_ob_nosfd;
  3270	}
  3271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
