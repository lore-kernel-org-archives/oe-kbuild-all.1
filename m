Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6770D2222CB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294756; cv=none; b=AN0TDcXePuqxh8KDdH+ecuLkgObs81Mkmv+QJSpZDKFN0TH603eR0hQpBVPX1/qTpCD4qStlGcO5vxnNfwd3U3zEpnDO98icWtrpI94mgNnt9XS6C40Du3mZe+YqGvjtD9qRw3FmZ8g/g642C3uLLxDpJwVuwZ/Kt47Sk8PpbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294756; c=relaxed/simple;
	bh=WiD5ikV0g4FiDsU39T83kJeNqh+blvXkhyHaLU56fXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IXMiFxVs+sZJgvEfAI0LDbnRMWClwBPOCAgAGIpBWacx7m5M6cOaps2tGKWe1ji+ihXv1OjPE5XAqytwkKHkRmoIw2CtS4RRxqaJswo+Ge+XXaBeIRP3FpSLNBz7gjp3I2zQCWikpEg1C5UpBtND9vv9iFQhf1/u+9Ai3pD36bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iv8Zemmw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iv8Zemmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747294754; x=1778830754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiD5ikV0g4FiDsU39T83kJeNqh+blvXkhyHaLU56fXc=;
  b=Iv8ZemmwQtQKmcA8WBmfhQLIAS8TlkmVeGa9V2nPu11jWNfTSJEgG6DC
   4Apu61Hl7XLmbBKEu+59zU39urYtwz/ZQ0AwrgulfnShG14YPq4Ds+4ES
   l35+ja/crvUVNXhcxFwFvtUa6WQOPJOhFhG7q9ffbLNTXgq5AFhdNhiV7
   jawfp3cCY2rCzF3pVVQsZM+Oi3OWm5Z3KANIOCdhYqqTMzuK9ullMh4nL
   UI1sH1RJBf2L96mvZHKZl4i4S6c7geO9kfY1LVOoy9WIMkfrOqK7VKv6n
   lX8/P6+lKCgnzu4vNCSAZ+dsCn2QlL6T4uRzCcwpOK8Uxs4hqJHJ1UX1F
   Q==;
X-CSE-ConnectionGUID: X/4cZweUQfOBjp3cokX93w==
X-CSE-MsgGUID: Bv3hFudzTOSDHLO8NIrTHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59849856"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="59849856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 00:39:13 -0700
X-CSE-ConnectionGUID: j4GF7m3LSHaY5qeZsEXBsw==
X-CSE-MsgGUID: xg8QNC8rSvqCMd1m2Ceamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139187138"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2025 00:39:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFTBN-000I4h-03;
	Thu, 15 May 2025 07:39:09 +0000
Date: Thu, 15 May 2025 15:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/190]
 drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:676: warning:
 Function parameter or member 'rxfh' not described in 'ne6xvf_get_rxfh'
Message-ID: <202505151514.tpNXKI35-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   2c213f4cb65d94953b0c3e4120d06be77fa627ba
commit: ce793fe6969377fc8269ef5ef82956550eb6fa3b [0/190] net: ethtool: pass a pointer to parameters to get/set_rxfh ethtool ops
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250515/202505151514.tpNXKI35-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151514.tpNXKI35-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151514.tpNXKI35-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:441: warning: Function parameter or member 'kernel_coal' not described in 'ne6xvf_get_coalesce'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:441: warning: Function parameter or member 'extack' not described in 'ne6xvf_get_coalesce'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:596: warning: Function parameter or member 'info' not described in 'ne6xvf_set_rxnfc'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:596: warning: Excess function parameter 'cmd' description in 'ne6xvf_set_rxnfc'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:620: warning: expecting prototype for iavf_get_rxnfc(). Prototype was for ne6xvf_get_rxnfc() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:659: warning: expecting prototype for iavf_get_rxfh_indir_size(). Prototype was for ne6xvf_get_rxfh_indir_size() instead
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:676: warning: Function parameter or member 'rxfh' not described in 'ne6xvf_get_rxfh'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:676: warning: Excess function parameter 'indir' description in 'ne6xvf_get_rxfh'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:676: warning: Excess function parameter 'key' description in 'ne6xvf_get_rxfh'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:676: warning: Excess function parameter 'hfunc' description in 'ne6xvf_get_rxfh'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:704: warning: Function parameter or member 'rxfh' not described in 'ne6xvf_set_rxfh'
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:704: warning: Function parameter or member 'extack' not described in 'ne6xvf_set_rxfh'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:737: warning: Function parameter or member 'channels' not described in 'ne6xvf_get_channels'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:737: warning: expecting prototype for iavf_get_channels(). Prototype was for ne6xvf_get_channels() instead
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:760: warning: Function parameter or member 'channels' not described in 'ne6xvf_set_channels'
   drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c:760: warning: Excess function parameter 'ch' description in 'ne6xvf_set_channels'


vim +676 drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_ethtool.c

37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  664  
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  665  /**
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  666   * ne6xvf_get_rxfh - get the rx flow hash indirection table
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  667   * @netdev: network interface device structure
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  668   * @indir: indirection table
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  669   * @key: hash key
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  670   * @hfunc: hash function in use
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  671   *
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  672   * Reads the indirection table directly from the hardware. Always returns 0.
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  673   **/
ce793fe6969377 Ahmed Zaki         2023-12-12  674  static int ne6xvf_get_rxfh(struct net_device *netdev,
ce793fe6969377 Ahmed Zaki         2023-12-12  675  			   struct ethtool_rxfh_param *rxfh)
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17 @676  {
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  677  	struct ne6xvf_adapter *adapter = netdev_priv(netdev);
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  678  	u16 i;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  679  
ce793fe6969377 Ahmed Zaki         2023-12-12  680  	rxfh->hfunc = ETH_RSS_HASH_TOP;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  681  
ce793fe6969377 Ahmed Zaki         2023-12-12  682  	if (rxfh->key)
ce793fe6969377 Ahmed Zaki         2023-12-12  683  		memcpy(rxfh->key, adapter->rss_info.hash_key, adapter->rss_info.hash_key_size);
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  684  
ce793fe6969377 Ahmed Zaki         2023-12-12  685  	if (rxfh->indir) {
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  686  		/* Each 32 bits pointed by 'indir' is stored with a lut entry */
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  687  		for (i = 0; i < adapter->rss_info.ind_table_size; i++)
ce793fe6969377 Ahmed Zaki         2023-12-12  688  			rxfh->indir[i] = (u32)adapter->rss_info.ind_table[i];
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  689  	}
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  690  
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  691  	return 0;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  692  }
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  693  
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  694  /**
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  695   * ne6xvf_set_rxfh - set the Rx flow hash indirection table
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  696   * @netdev: network interface device structure
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  697   *
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  698   * Returns -EINVAL if the table specifies an invalid queue ID, otherwise
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  699   * returns 0 after programming the table.
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  700   */
ce793fe6969377 Ahmed Zaki         2023-12-12  701  static int ne6xvf_set_rxfh(struct net_device *netdev,
ce793fe6969377 Ahmed Zaki         2023-12-12  702  			   struct ethtool_rxfh_param *rxfh,
ce793fe6969377 Ahmed Zaki         2023-12-12  703  			   struct netlink_ext_ack *extack)
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17 @704  {
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  705  	struct ne6xvf_adapter *adapter = netdev_priv(netdev);
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  706  	int i;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  707  
ce793fe6969377 Ahmed Zaki         2023-12-12  708  	if (rxfh->hfunc != ETH_RSS_HASH_NO_CHANGE && rxfh->hfunc != ETH_RSS_HASH_TOP)
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  709  		return -EOPNOTSUPP;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  710  
ce793fe6969377 Ahmed Zaki         2023-12-12  711  	if (!rxfh->key && !rxfh->indir)
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  712  		return 0;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  713  
ce793fe6969377 Ahmed Zaki         2023-12-12  714  	if (rxfh->key)
ce793fe6969377 Ahmed Zaki         2023-12-12  715  		memcpy(&adapter->rss_info.hash_key[0], rxfh->key, adapter->rss_info.hash_key_size);
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  716  
ce793fe6969377 Ahmed Zaki         2023-12-12  717  	if (rxfh->indir) {
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  718  		/* Each 32 bits pointed by 'indir' is stored with a lut entry */
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  719  		for (i = 0; i < adapter->rss_info.ind_table_size; i++)
ce793fe6969377 Ahmed Zaki         2023-12-12  720  			adapter->rss_info.ind_table[i] = (u8)(rxfh->indir[i]);
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  721  	}
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  722  
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  723  	adapter->aq_required |= NE6XVF_FLAG_AQ_CONFIGURE_RSS;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  724  
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  725  	return 0;
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  726  }
37c455be29c9ad xiaohuihui-bzwx-kj 2024-05-17  727  

:::::: The code at line 676 was first introduced by commit
:::::: 37c455be29c9ad48f10667094bbebb116f512cbf anolis: drivers/bzwx: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver

:::::: TO: xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
:::::: CC: Qinyun Tan <qinyuntan@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
