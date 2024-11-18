Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D054652
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731959241; cv=none; b=An+JHvkYEvNCUlv6Iyj7VEOwSrsOfZdngeg8jgf7EN3L6/xm7zKXRP3fQM8i+CC54JObs5nyVOfAjHTtO51mZZaqC4Hm5KflrUtF16CZlTY7iKorZFaFx6dDpIzURXzRuIBpZ1dKLno+7bg4mJG0juND9H4OWE5U1JhAcdrBDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731959241; c=relaxed/simple;
	bh=Nw3yRqkPz9tPnyp6W142Vq8GBS0qEDwHiRb+DTbxMQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSoHIpYmLCOcHKCeKLvgGjXLA03932b2kR9HrroWdxjRsnKg/TdBdcWDvcstcgBvdtScH0M7U1AdGj4LAajyyMXKFUyjUFoGQ+xo/S5t0G97xRaExiqYq2ELSCGjrMISrNObMKgabdkcLd87jEWLuzBofZQKgUF9bCkjfp3kqsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWkVQZQS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWkVQZQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731959240; x=1763495240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nw3yRqkPz9tPnyp6W142Vq8GBS0qEDwHiRb+DTbxMQI=;
  b=CWkVQZQS80HNdEIfKTxsxsToIbHP7l9crrIm6gkrBkjvr526QD9eX/EQ
   l26sOPyhCKQnuv67YPA62Ut78Rm44c2L8Yc+XXkK/KDYMy5pG+LG9Eu8h
   94y+He23wYvFeqmG2MWYRXKXzKRHtw+MDZUL70cBn0NPSRPzjxBcxNyJh
   tqSHEqw7p1TIUTKMNEve2GIoMe+wPXyUD0JQNq+vwpt/Iuce+DCqsWX9k
   3v6OCSUa560Ch3Ec8eH6OPMea9sWIG8TMvnQJlUkfv3vuYLbYRvCWOLkS
   DtqV6pxalfWiog94PNZ/pOpXM6vY8bLs0oZhn9glJtlAFvaFj8pA55YcI
   A==;
X-CSE-ConnectionGUID: f1pndUvlRaOF2mX9XIRz6A==
X-CSE-MsgGUID: GzEpJOvdTOSR7gC7ZH3IIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32169270"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32169270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:47:17 -0800
X-CSE-ConnectionGUID: YmuCv+O5TyG+Z3NsYA+JJQ==
X-CSE-MsgGUID: AcwE1dqIRI+HjVi5hSR1lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93397428"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 11:47:16 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7iL-0002c7-1A;
	Mon, 18 Nov 2024 19:47:13 +0000
Date: Tue, 19 Nov 2024 03:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1484/1484]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:181:58:
 warning: '_dvn_pkt_drop_cnt' directive output may be truncated writing 17
 bytes into a region of size between 13 and 22
Message-ID: <202411190357.RZb9MYNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [1484/1484] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-001-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190357.RZb9MYNL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190357.RZb9MYNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190357.RZb9MYNL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_get_drvinfo':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:133:33: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     133 |         struct nbl_netdev_priv *priv;
         |                                 ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:308:6: warning: no previous prototype for 'nbl_serv_adjust_interrpt_param' [-Wmissing-prototypes]
     308 | void nbl_serv_adjust_interrpt_param(struct nbl_service_mgt *serv_mgt, bool ethtool)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_serv_adjust_interrpt_param':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:314:33: warning: variable 'net_priv' set but not used [-Wunused-but-set-variable]
     314 |         struct nbl_netdev_priv *net_priv;
         |                                 ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_serv_update_stats':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:365:33: warning: variable 'net_priv' set but not used [-Wunused-but-set-variable]
     365 |         struct nbl_netdev_priv *net_priv;
         |                                 ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: At top level:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:510:5: warning: no previous prototype for 'nbl_get_eeprom_length' [-Wmissing-prototypes]
     510 | int nbl_get_eeprom_length(struct net_device *netdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:515:5: warning: no previous prototype for 'nbl_get_eeprom' [-Wmissing-prototypes]
     515 | int nbl_get_eeprom(struct net_device *netdev, struct ethtool_eeprom *eeprom, u8 *bytes)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_set_ksettings':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:782:13: warning: variable 'autoneg' set but not used [-Wunused-but-set-variable]
     782 |         u32 autoneg = 0;
         |             ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:779:30: warning: variable 'phy_caps' set but not used [-Wunused-but-set-variable]
     779 |         struct nbl_phy_caps *phy_caps;
         |                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:778:31: warning: variable 'phy_state' set but not used [-Wunused-but-set-variable]
     778 |         struct nbl_phy_state *phy_state;
         |                               ^~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_set_pause_param':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:1695:30: warning: variable 'phy_caps' set but not used [-Wunused-but-set-variable]
    1695 |         struct nbl_phy_caps *phy_caps;
         |                              ^~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:1694:31: warning: variable 'phy_state' set but not used [-Wunused-but-set-variable]
    1694 |         struct nbl_phy_state *phy_state;
         |                               ^~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_get_fec_param':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:1877:12: warning: variable 'autoneg' set but not used [-Wunused-but-set-variable]
    1877 |         u8 autoneg = 0;
         |            ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c: In function 'nbl_stats_fill_strings':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:170:47: warning: '%s' directive output may be truncated writing up to 1847 bytes into a region of size 32 [-Wformat-truncation=]
     170 |                 snprintf(p, ETH_GSTRING_LEN, "%s", nbl_gstrings_stats[i].stat_string);
         |                                               ^~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:170:17: note: 'snprintf' output between 1 and 1848 bytes into a destination of size 32
     170 |                 snprintf(p, ETH_GSTRING_LEN, "%s", nbl_gstrings_stats[i].stat_string);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:181:58: warning: '_dvn_pkt_drop_cnt' directive output may be truncated writing 17 bytes into a region of size between 13 and 22 [-Wformat-truncation=]
     181 |                 snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_dvn_pkt_drop_cnt", i);
         |                                                          ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:181:17: note: 'snprintf' output between 28 and 37 bytes into a destination of size 32
     181 |                 snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_dvn_pkt_drop_cnt", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:183:58: warning: '_tx_timeout_cnt' directive output may be truncated writing 15 bytes into a region of size between 13 and 22 [-Wformat-truncation=]
     183 |                 snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_tx_timeout_cnt", i);
         |                                                          ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:183:17: note: 'snprintf' output between 26 and 35 bytes into a destination of size 32
     183 |                 snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_tx_timeout_cnt", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:194:58: warning: '_uvn_stat_pkt_drop' directive output may be truncated writing 18 bytes into a region of size between 13 and 22 [-Wformat-truncation=]
     194 |                 snprintf(p, ETH_GSTRING_LEN, "rx_queue_%u_uvn_stat_pkt_drop", i);
         |                                                          ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c:194:17: note: 'snprintf' output between 29 and 38 bytes into a destination of size 32
     194 |                 snprintf(p, ETH_GSTRING_LEN, "rx_queue_%u_uvn_stat_pkt_drop", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_dvn_pkt_drop_cnt +181 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_ethtool.c

bad535d287c9c1 Bennie Yan 2024-09-24  155  
bad535d287c9c1 Bennie Yan 2024-09-24  156  static void nbl_stats_fill_strings(struct net_device *netdev, u8 *data)
bad535d287c9c1 Bennie Yan 2024-09-24  157  {
bad535d287c9c1 Bennie Yan 2024-09-24  158  	struct nbl_adapter *adapter = NBL_NETDEV_TO_ADAPTER(netdev);
bad535d287c9c1 Bennie Yan 2024-09-24  159  	struct nbl_service_mgt *serv_mgt = NBL_ADAPTER_TO_SERV_MGT(adapter);
bad535d287c9c1 Bennie Yan 2024-09-24  160  	struct nbl_serv_ring_mgt *ring_mgt = NBL_SERV_MGT_TO_RING_MGT(serv_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  161  	struct nbl_dispatch_ops *disp_ops = NBL_SERV_MGT_TO_DISP_OPS(serv_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  162  	struct nbl_common_info *common = NBL_SERV_MGT_TO_COMMON(serv_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  163  	struct nbl_serv_ring_vsi_info *vsi_info;
bad535d287c9c1 Bennie Yan 2024-09-24  164  	char *p = (char *)data;
bad535d287c9c1 Bennie Yan 2024-09-24  165  	unsigned int i;
bad535d287c9c1 Bennie Yan 2024-09-24  166  
bad535d287c9c1 Bennie Yan 2024-09-24  167  	vsi_info = &ring_mgt->vsi_info[NBL_VSI_DATA];
bad535d287c9c1 Bennie Yan 2024-09-24  168  
bad535d287c9c1 Bennie Yan 2024-09-24  169  	for (i = 0; i < NBL_GLOBAL_STATS_LEN; i++) {
bad535d287c9c1 Bennie Yan 2024-09-24  170  		snprintf(p, ETH_GSTRING_LEN, "%s", nbl_gstrings_stats[i].stat_string);
bad535d287c9c1 Bennie Yan 2024-09-24  171  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  172  	}
bad535d287c9c1 Bennie Yan 2024-09-24  173  
bad535d287c9c1 Bennie Yan 2024-09-24  174  	for (i = 0; i < vsi_info->active_ring_num; i++) {
bad535d287c9c1 Bennie Yan 2024-09-24  175  		snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_packets", i);
bad535d287c9c1 Bennie Yan 2024-09-24  176  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  177  		snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_bytes", i);
bad535d287c9c1 Bennie Yan 2024-09-24  178  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  179  		snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_descs", i);
bad535d287c9c1 Bennie Yan 2024-09-24  180  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24 @181  		snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_dvn_pkt_drop_cnt", i);
bad535d287c9c1 Bennie Yan 2024-09-24  182  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24 @183  		snprintf(p, ETH_GSTRING_LEN, "tx_queue_%u_tx_timeout_cnt", i);
bad535d287c9c1 Bennie Yan 2024-09-24  184  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  185  	}
bad535d287c9c1 Bennie Yan 2024-09-24  186  
bad535d287c9c1 Bennie Yan 2024-09-24  187  	for (i = 0; i < vsi_info->active_ring_num; i++) {
bad535d287c9c1 Bennie Yan 2024-09-24  188  		snprintf(p, ETH_GSTRING_LEN, "rx_queue_%u_packets", i);
bad535d287c9c1 Bennie Yan 2024-09-24  189  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  190  		snprintf(p, ETH_GSTRING_LEN, "rx_queue_%u_bytes", i);
bad535d287c9c1 Bennie Yan 2024-09-24  191  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  192  		snprintf(p, ETH_GSTRING_LEN, "rx_queue_%u_descs", i);
bad535d287c9c1 Bennie Yan 2024-09-24  193  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24 @194  		snprintf(p, ETH_GSTRING_LEN, "rx_queue_%u_uvn_stat_pkt_drop", i);
bad535d287c9c1 Bennie Yan 2024-09-24  195  		p += ETH_GSTRING_LEN;
bad535d287c9c1 Bennie Yan 2024-09-24  196  	}
bad535d287c9c1 Bennie Yan 2024-09-24  197  	if (!common->is_vf)
bad535d287c9c1 Bennie Yan 2024-09-24  198  		disp_ops->fill_private_stat_strings(NBL_SERV_MGT_TO_DISP_PRIV(serv_mgt), p);
bad535d287c9c1 Bennie Yan 2024-09-24  199  }
bad535d287c9c1 Bennie Yan 2024-09-24  200  

:::::: The code at line 181 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
