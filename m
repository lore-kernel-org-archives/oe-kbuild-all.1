Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C192652BD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558773; cv=none; b=shU0yGNUsGXuKSEVGnL58AxIyFnWHU8Jt+Jb9Q2mXVYB4kEFNscqt7FeUB1qe+zB45/S78/+kxhqmQN0o1WrQR2MnhWxmm8aPdbiHk9CkPmIXZ4PsadH7/qpikGyee5y+sBcXYrRL+EcdxM0QcqaEw/51rc3Yy1W1buKngME7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558773; c=relaxed/simple;
	bh=6xda+LXN0Fp/We+xBZTjS9Zsv6xKjBiMgtwRGNAj0aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/KLd+d4BlSAkQ/6IBXoND/cH2C2+iSidB4ExCk7OgUR+rF024wBfmIgzu/ur9VGZSDbOlHRSSSDBsG962aUNiRaKKoZmxDRP7tpOqCXQw2aPzzgf6wLzbprpfe6Pbf5R0+Pu6onUEHExd8h2U7QBuDZjlrDq7l3KbHJkfxFufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/v2/WGQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/v2/WGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761558770; x=1793094770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xda+LXN0Fp/We+xBZTjS9Zsv6xKjBiMgtwRGNAj0aw=;
  b=E/v2/WGQ6oj69Df1l+5OKs8r2HVwTtagQd+RC3vFljhPXVp7cp8qZPmm
   GadOc89+Lkc5zntrSHBuhHnUJyFLIPHzGSA2LApMBwRG8RGFvlPJnYzqe
   AEqab3v0OaIycrAI8lx09r+KWUnl2ymaCOXgh7tXzjOJfnDHJq+zFPyxG
   /IACDiJKA9uiXddsdqqWb4QWVQF9zvbwieCwsb90NXP4HHYdin6NA6QU7
   Pickxj85SgIia2pMTgm+SzvBmgcsi17hyNDob9rgLjx/fpQphbcnxOx1L
   uCGnyihKLTuFE16+m0FowsUR/3w+mCAz/wvXeNDTjuXbPZiaYnUO+fN5J
   g==;
X-CSE-ConnectionGUID: VUC1EGdhSOik954A71sDqA==
X-CSE-MsgGUID: aW8kHeSZRjOFcRpl/Ht6Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74752486"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="74752486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:52:49 -0700
X-CSE-ConnectionGUID: p1B5uqZFS+WT/gVt26ZPtw==
X-CSE-MsgGUID: nVEiRtWWRlqWlpW/LB55pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="208618954"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2025 02:52:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDJtG-000GgH-2z;
	Mon, 27 Oct 2025 09:52:08 +0000
Date: Mon, 27 Oct 2025 17:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3045/3045]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2963:8: error:
 unknown type name 'ivoidnt'
Message-ID: <202510271755.BtJ3vZX2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   efe5cf254a3b58c26841d55757906bd9acf77e30
commit: 468b0cd7b1e1c131b3ee7d2ea8b96521d3faad8b [3045/3045] net:nebula-matrix:Add S1000 SNIC driver support
config: x86_64-randconfig-161-20251027 (https://download.01.org/0day-ci/archive/20251027/202510271755.BtJ3vZX2-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271755.BtJ3vZX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271755.BtJ3vZX2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_serv_adjust_interrpt_param':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:380:33: warning: variable 'net_priv' set but not used [-Wunused-but-set-variable]
     380 |         struct nbl_netdev_priv *net_priv;
         |                                 ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_serv_update_stats':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:503:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     503 |         int ret = 0;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_set_ksettings':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:1108:30: warning: variable 'phy_caps' set but not used [-Wunused-but-set-variable]
    1108 |         struct nbl_phy_caps *phy_caps;
         |                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_set_pause_param':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:3129:30: warning: variable 'phy_caps' set but not used [-Wunused-but-set-variable]
    3129 |         struct nbl_phy_caps *phy_caps;
         |                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_stats_fill_strings':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:218:47: warning: '%s' directive output may be truncated writing up to 1891 bytes into a region of size 32 [-Wformat-truncation=]
     218 |                 snprintf(p, ETH_GSTRING_LEN, "%s", nbl_gstrings_stats[i].stat_string);
         |                                               ^~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:218:17: note: 'snprintf' output between 1 and 1892 bytes into a destination of size 32
     218 |                 snprintf(p, ETH_GSTRING_LEN, "%s", nbl_gstrings_stats[i].stat_string);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_prepare_reset_task':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:896:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     896 |         int ret;
         |             ^~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: At top level:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2963:8: error: unknown type name 'ivoidnt'
    2963 | static ivoidnt nbl_dev_setup_ktls_ops(struct nbl_dev_mgt *dev_mgt, struct net_device *netdev
         |        ^~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:2964:39: error: expected ';', ',' or ')' before 'struct'
    2964 |                                       struct nbl_init_param *param)
         |                                       ^~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c: In function 'nbl_dev_cfg_netdev':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:3316:23: error: implicit declaration of function 'nbl_dev_setup_ktls_ops'; did you mean 'nbl_dev_setup_xfrm_ops'? [-Werror=implicit-function-declaration]
    3316 |                 ret = nbl_dev_setup_ktls_ops(dev_mgt, netdev);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
         |                       nbl_dev_setup_xfrm_ops
   cc1: some warnings being treated as errors


vim +/ivoidnt +2963 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c

  2961	
  2962	#else
> 2963	static ivoidnt nbl_dev_setup_ktls_ops(struct nbl_dev_mgt *dev_mgt, struct net_device *netdev
> 2964					      struct nbl_init_param *param)
  2965	{
  2966	}
  2967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
