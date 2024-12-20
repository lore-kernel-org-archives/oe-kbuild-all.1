Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40BF1B0F38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 22:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733886; cv=none; b=D83+WSV5fu8Bj1FUCnffBknyVmiTGyYNg/zT/wNFcTtdHGQt10THkP0ZiEJcLpfXJSMmckyyoxiLVCvxT+iZy+pP6GBPNMk66NdJeeGN6VbCsqMErpRSxrlfIjUr0AJbcQZFx5VO0CiaLNByZTDqWQSy8dyr7Cx4UgEI19ongMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733886; c=relaxed/simple;
	bh=Kk5kOg7BvUYs+lM/fxWMdCzmTa8+xKxpWjHjhp2eZgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBhc8w8KquNXYmn25TDV804ZZu/297A6aU0I5AW7waZ0hPO8jyJR0XTO0vjDYLFhaTOeTFFJApUBKJ3WMX56jesgTB/IsyTdOsZAIc9rrFcfwUJJWCkzhJWupcUOl5ecKIgvXS/KgSZGpEdMmOakWuEElRpp/HheUkeyBbzylOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NygTge6e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NygTge6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734733885; x=1766269885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kk5kOg7BvUYs+lM/fxWMdCzmTa8+xKxpWjHjhp2eZgQ=;
  b=NygTge6ebfHBYub3bIVH1NFGztBqthvxhEvQOm7asTXnuj8WzXbf5knP
   dEI7ahuBN1URARXyEoxjglx3RGQ6lDmaksYVUvKuLEHgyIVseWL/m2v3X
   efmwF/R/fENuXXkHTf3vjzw/eND5uABeHFQqCMR77JrGseNH/50Fwlf5Z
   A7ObFi7Jq7rsmMcNrVXTSmR9WQGeArGocbid1QUDtbw1w770f23sYFS89
   ddqlZrA7jle5DSwRdC4ozrdzzXb0kN8gbau2XWIHXpId9wJb/EhlJamlb
   3rue50KP9LdRpMuf6JAm+rPbI/croot2c/mPIYFkOpikt1sVeEouCThhW
   g==;
X-CSE-ConnectionGUID: 06etYbExQTawaLARdKkUdw==
X-CSE-MsgGUID: DCQFrWo+ROuERH7wy9UZtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34612249"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="34612249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 14:31:24 -0800
X-CSE-ConnectionGUID: 051b4bUWQ3aqZMRbQnh+Kw==
X-CSE-MsgGUID: j6qMQHZPQtWKCW22GGXxZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="99142386"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 14:31:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOlWi-0001iP-2n;
	Fri, 20 Dec 2024 22:31:20 +0000
Date: Sat, 21 Dec 2024 06:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Horman <horms@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:278:59: warning:
 '%u' directive output may be truncated writing between 1 and 10 bytes into a
 region of size 6
Message-ID: <202412210625.Wl5iFYw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9b8ffafd20ad21357a789cc58ffaa162b3ad074
commit: 5874e0c9f25661c2faefe4809907166defae3d7f net: atlantic: Avoid warning about potential string truncation
date:   4 months ago
config: x86_64-randconfig-074-20241221 (https://download.01.org/0day-ci/archive/20241221/202412210625.Wl5iFYw5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210625.Wl5iFYw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210625.Wl5iFYw5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c: In function 'aq_ethtool_get_strings':
>> drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:278:59: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
     278 |                                 snprintf(tc_string, 8, "TC%u ", tc);
         |                                                           ^~
   drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:278:56: note: directive argument in the range [0, 4294967294]
     278 |                                 snprintf(tc_string, 8, "TC%u ", tc);
         |                                                        ^~~~~~~
   drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c:278:33: note: 'snprintf' output between 5 and 14 bytes into a destination of size 8
     278 |                                 snprintf(tc_string, 8, "TC%u ", tc);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +278 drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c

   261	
   262		cfg = aq_nic_get_cfg(nic);
   263	
   264		switch (stringset) {
   265		case ETH_SS_STATS: {
   266			const int rx_stat_cnt = ARRAY_SIZE(aq_ethtool_queue_rx_stat_names);
   267			const int tx_stat_cnt = ARRAY_SIZE(aq_ethtool_queue_tx_stat_names);
   268			char tc_string[8];
   269			unsigned int tc;
   270	
   271			memset(tc_string, 0, sizeof(tc_string));
   272			memcpy(p, aq_ethtool_stat_names,
   273			       sizeof(aq_ethtool_stat_names));
   274			p = p + sizeof(aq_ethtool_stat_names);
   275	
   276			for (tc = 0; tc < cfg->tcs; tc++) {
   277				if (cfg->is_qos)
 > 278					snprintf(tc_string, 8, "TC%u ", tc);
   279	
   280				for (i = 0; i < cfg->vecs; i++) {
   281					for (si = 0; si < rx_stat_cnt; si++) {
   282						ethtool_sprintf(&p,
   283						     aq_ethtool_queue_rx_stat_names[si],
   284						     tc_string,
   285						     AQ_NIC_CFG_TCVEC2RING(cfg, tc, i));
   286					}
   287					for (si = 0; si < tx_stat_cnt; si++) {
   288						ethtool_sprintf(&p,
   289						     aq_ethtool_queue_tx_stat_names[si],
   290						     tc_string,
   291						     AQ_NIC_CFG_TCVEC2RING(cfg, tc, i));
   292					}
   293				}
   294			}
   295	#if IS_REACHABLE(CONFIG_PTP_1588_CLOCK)
   296			if (nic->aq_ptp) {
   297				const int rx_ring_cnt = aq_ptp_get_ring_cnt(nic, ATL_RING_RX);
   298				const int tx_ring_cnt = aq_ptp_get_ring_cnt(nic, ATL_RING_TX);
   299				unsigned int ptp_ring_idx =
   300					aq_ptp_ring_idx(nic->aq_nic_cfg.tc_mode);
   301	
   302				snprintf(tc_string, 8, "PTP ");
   303	
   304				for (i = 0; i < max(rx_ring_cnt, tx_ring_cnt); i++) {
   305					for (si = 0; si < rx_stat_cnt; si++) {
   306						ethtool_sprintf(&p,
   307							 aq_ethtool_queue_rx_stat_names[si],
   308							 tc_string,
   309							 i ? PTP_HWST_RING_IDX : ptp_ring_idx);
   310					}
   311					if (i >= tx_ring_cnt)
   312						continue;
   313					for (si = 0; si < tx_stat_cnt; si++) {
   314						ethtool_sprintf(&p,
   315							 aq_ethtool_queue_tx_stat_names[si],
   316							 tc_string,
   317							 i ? PTP_HWST_RING_IDX : ptp_ring_idx);
   318					}
   319				}
   320			}
   321	#endif
   322	#if IS_ENABLED(CONFIG_MACSEC)
   323			if (!nic->macsec_cfg)
   324				break;
   325	
   326			memcpy(p, aq_macsec_stat_names, sizeof(aq_macsec_stat_names));
   327			p = p + sizeof(aq_macsec_stat_names);
   328			for (i = 0; i < AQ_MACSEC_MAX_SC; i++) {
   329				struct aq_macsec_txsc *aq_txsc;
   330	
   331				if (!(test_bit(i, &nic->macsec_cfg->txsc_idx_busy)))
   332					continue;
   333	
   334				for (si = 0;
   335					si < ARRAY_SIZE(aq_macsec_txsc_stat_names);
   336					si++) {
   337					ethtool_sprintf(&p,
   338						 aq_macsec_txsc_stat_names[si], i);
   339				}
   340				aq_txsc = &nic->macsec_cfg->aq_txsc[i];
   341				for (sa = 0; sa < MACSEC_NUM_AN; sa++) {
   342					if (!(test_bit(sa, &aq_txsc->tx_sa_idx_busy)))
   343						continue;
   344					for (si = 0;
   345					     si < ARRAY_SIZE(aq_macsec_txsa_stat_names);
   346					     si++) {
   347						ethtool_sprintf(&p,
   348							 aq_macsec_txsa_stat_names[si],
   349							 i, sa);
   350					}
   351				}
   352			}
   353			for (i = 0; i < AQ_MACSEC_MAX_SC; i++) {
   354				struct aq_macsec_rxsc *aq_rxsc;
   355	
   356				if (!(test_bit(i, &nic->macsec_cfg->rxsc_idx_busy)))
   357					continue;
   358	
   359				aq_rxsc = &nic->macsec_cfg->aq_rxsc[i];
   360				for (sa = 0; sa < MACSEC_NUM_AN; sa++) {
   361					if (!(test_bit(sa, &aq_rxsc->rx_sa_idx_busy)))
   362						continue;
   363					for (si = 0;
   364					     si < ARRAY_SIZE(aq_macsec_rxsa_stat_names);
   365					     si++) {
   366						ethtool_sprintf(&p,
   367							 aq_macsec_rxsa_stat_names[si],
   368							 i, sa);
   369					}
   370				}
   371			}
   372	#endif
   373			break;
   374		}
   375		case ETH_SS_PRIV_FLAGS:
   376			memcpy(p, aq_ethtool_priv_flag_names,
   377			       sizeof(aq_ethtool_priv_flag_names));
   378			break;
   379		}
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
