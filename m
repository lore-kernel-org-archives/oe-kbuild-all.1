Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C7D188587
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736588971; cv=none; b=cZJiv0ZdIOZwZkKpC+PRUb/TVR9AjEU5ZlF/HsrQsp53SKQkk10MW5L6XbbAAbXSn0o4Wa1tM3gb8wTFyQJgg4D4y0/47gxVB7rSnYcDbzZTf+OKfsOKjCOFNCLqKTtmsDOmFfoO4OneNgHAhebAHWRbNjVSZdaBVaHnNqkF8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736588971; c=relaxed/simple;
	bh=XTSZm2SidS/Q/RFMd/QAktFa+j4dyy8GkGUxOYDQi8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Olitpei4h0iPKWukg9VBfHI7rZ+mNRXBPYTaQsv2v+yvB1onv6kqexANUsLlULAbV2K5Nk6INEd9WaGuStb4pF4S5jtrNf4usMLEAhEm1ilNAF/dbhk5cB2XM6qmT2vOdEEJj7+yRw4AAg1frfFDMmNbxzawJL5n3Kp1cSwLQeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3KXUt+q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3KXUt+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736588970; x=1768124970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XTSZm2SidS/Q/RFMd/QAktFa+j4dyy8GkGUxOYDQi8Q=;
  b=H3KXUt+qXRVk2JROLlaOveDHryV4kzVyhtvFniMyKcgp0N+ue4mre8ga
   1INbjAMsn2i87EH5WJYrJPpheGWyWAjUVwKBhqZ4xPD9P7nDIGhZfILPn
   uzm62ZmzA9DWD9PbqvbeqvigWYjZlLW+ey3pVfimshQnHf8DFovCT8hsd
   Co3l7VlsJ0d4Ryl/z2eMzL2gHMc5TqXKALiqYqh5rtJ8XjjHRrqwnBa+E
   BiFJRyfCtq2tEdURKzEiYHFKnzTMWfPBeCmEvBIFokWrupgF+bEGDFWyv
   LraEe+DTKgawlWd2VCueL0U0kuYDts6JDpcgDAc4+pDM+5Zgp7vqoA7KC
   Q==;
X-CSE-ConnectionGUID: UsqUgC5QQV+yQLkv7skAvA==
X-CSE-MsgGUID: zXneF67KRoaV2qwABKwXhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37040784"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="37040784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:49:27 -0800
X-CSE-ConnectionGUID: aYFYYWZ6QmeLdXX8CqaAfw==
X-CSE-MsgGUID: syCytJQXRcyn4mpII1y/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="108965435"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2025 01:49:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWY7Q-000KSJ-0C;
	Sat, 11 Jan 2025 09:49:24 +0000
Date: Sat, 11 Jan 2025 17:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/7] wifi: cfg80211: extend statistics for link level
 in sinfo
Message-ID: <202501111737.RNr9aH6Z-lkp@intel.com>
References: <20250110042449.1158789-4-quic_sarishar@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110042449.1158789-4-quic_sarishar@quicinc.com>

Hi Sarika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 7bf1659bad4e9413cdba132ef9cbd0caa9cabcc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-cfg80211-reorg-sinfo-structure-elements-for-mesh/20250110-122824
base:   7bf1659bad4e9413cdba132ef9cbd0caa9cabcc4
patch link:    https://lore.kernel.org/r/20250110042449.1158789-4-quic_sarishar%40quicinc.com
patch subject: [PATCH RFC 3/7] wifi: cfg80211: extend statistics for link level in sinfo
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501111737.RNr9aH6Z-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111737.RNr9aH6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111737.RNr9aH6Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/dvm/lib.c: In function 'iwlagn_fill_txpower_mode':
>> drivers/net/wireless/intel/iwlwifi/dvm/lib.c:589:20: error: too few arguments to function 'ieee80211_ave_rssi'
     589 |         ave_rssi = ieee80211_ave_rssi(ctx->vif);
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlwifi/dvm/lib.c:10:
   include/net/mac80211.h:7224:5: note: declared here
    7224 | int ieee80211_ave_rssi(struct ieee80211_vif *vif, int link_id);
         |     ^~~~~~~~~~~~~~~~~~


vim +/ieee80211_ave_rssi +589 drivers/net/wireless/intel/iwlwifi/dvm/lib.c

354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  567  
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  568  /*
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  569   * Upon RSSI changes, sends a bt config command with following changes
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  570   *  1. enable/disable "reduced control frames tx power
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  571   *  2. update the "kill)ack_mask" and "kill_cts_mask"
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  572   *
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  573   * If "reduced tx power" is enabled, uCode shall
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  574   *  1. ACK/Back/CTS rate shall reduced to 6Mbps
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  575   *  2. not use duplciate 20/40MHz mode
83ce21de686a67 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  576   */
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  577  static bool iwlagn_fill_txpower_mode(struct iwl_priv *priv,
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  578  				struct iwl_bt_uart_msg *uart_msg)
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  579  {
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  580  	bool need_update = false;
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  581  	struct iwl_rxon_context *ctx = &priv->contexts[IWL_RXON_CTX_BSS];
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  582  	int ave_rssi;
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  583  
e19ebcab01cc13 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  584  	if (!ctx->vif || (ctx->vif->type != NL80211_IFTYPE_STATION)) {
e19ebcab01cc13 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  585  		IWL_DEBUG_INFO(priv, "BSS ctx not active or not in sta mode\n");
e19ebcab01cc13 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  586  		return false;
e19ebcab01cc13 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  587  	}
e19ebcab01cc13 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Ilan Peer  2012-05-10  588  
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03 @589  	ave_rssi = ieee80211_ave_rssi(ctx->vif);
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  590  	if (!ave_rssi) {
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  591  		/* no rssi data, no changes to reduce tx power */
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  592  		IWL_DEBUG_COEX(priv, "no rssi data available\n");
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  593  		return need_update;
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  594  	}
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  595  	if (!priv->reduced_txpower &&
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  596  	    !iwl_is_associated(priv, IWL_RXON_CTX_PAN) &&
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  597  	    (ave_rssi > BT_ENABLE_REDUCED_TXPOWER_THRESHOLD) &&
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  598  	    (uart_msg->frame3 & (BT_UART_MSG_FRAME3ACL_MSK |
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  599  	    BT_UART_MSG_FRAME3OBEX_MSK)) &&
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  600  	    !(uart_msg->frame3 & (BT_UART_MSG_FRAME3SCOESCO_MSK |
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  601  	    BT_UART_MSG_FRAME3SNIFF_MSK | BT_UART_MSG_FRAME3A2DP_MSK))) {
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  602  		/* enabling reduced tx power */
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  603  		priv->reduced_txpower = true;
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  604  		priv->bt_valid |= IWLAGN_BT_VALID_REDUCED_TX_PWR;
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  605  		need_update = true;
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  606  	} else if (priv->reduced_txpower &&
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  607  		   (iwl_is_associated(priv, IWL_RXON_CTX_PAN) ||
dd551ab7b47ace drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  608  		   (ave_rssi < BT_DISABLE_REDUCED_TXPOWER_THRESHOLD) ||
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  609  		   (uart_msg->frame3 & (BT_UART_MSG_FRAME3SCOESCO_MSK |
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  610  		   BT_UART_MSG_FRAME3SNIFF_MSK | BT_UART_MSG_FRAME3A2DP_MSK)) ||
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  611  		   !(uart_msg->frame3 & (BT_UART_MSG_FRAME3ACL_MSK |
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  612  		   BT_UART_MSG_FRAME3OBEX_MSK)))) {
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  613  		/* disable reduced tx power */
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  614  		priv->reduced_txpower = false;
f6be8b7845434a drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-05-03  615  		priv->bt_valid |= IWLAGN_BT_VALID_REDUCED_TX_PWR;
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  616  		need_update = true;
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  617  	}
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  618  
354ce4a4ca613f drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2012-04-19  619  	return need_update;
b6e116e8bf7d74 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2010-08-23  620  }
b6e116e8bf7d74 drivers/net/wireless/iwlwifi/iwl-agn-lib.c Wey-Yi Guy 2010-08-23  621  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
