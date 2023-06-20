Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB59B2AB23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 18:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687284033; x=1718820033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XdX8iObXzUDJ2KF7uZ98PNwHqPQn65Lgpt/KX0iAEWs=;
  b=Nlz0tZrBweawsCDLoR7qVNF/V0a6nbb7OriXskKOjdxeJGMqoiqU5CFz
   LHgr+vmdUhU3zZfXZexiZ5FVOcBhlMWv0i76r/gFvTONMlq2kv4HhSebQ
   jgRgcpC9pNTFFUkRFJDqIi3/j5WHtXc0DeWxx7ndh0pkOcTy+0umoeloZ
   QlceGiMD0vEpltLPJHSPhWQJhuBzPtajONfSljHsKeY5dGs0/tHDYiUvP
   FK7iCQtQ1+ZnTtAiJD1uGd5M+VhHSrDWeJXlcyRGHbG0Zdgs8xiU1hrLy
   a0fk6t9UE/zRV9gl1lLeXwkwuP+OOHkr2SXMhNMD/dMRhfuwCBykoyyi2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389262486"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="389262486"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 11:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717325150"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="717325150"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 11:00:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBfeZ-00066w-0J;
	Tue, 20 Jun 2023 18:00:31 +0000
Date: Wed, 21 Jun 2023 02:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: gregory.greenman@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 06/19] wifi: iwlwifi: nvm: handle EHT/320 MHz regulatory
 flag
Message-ID: <202306210123.dJ9LfIVD-lkp@intel.com>
References: <20230620125813.2c5e886c08f3.Ibc5c27d973d0590e2dea1f50435f9cf3ba8c2c09@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620125813.2c5e886c08f3.Ibc5c27d973d0590e2dea1f50435f9cf3ba8c2c09@changeid>

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
patch link:    https://lore.kernel.org/r/20230620125813.2c5e886c08f3.Ibc5c27d973d0590e2dea1f50435f9cf3ba8c2c09%40changeid
patch subject: [PATCH 06/19] wifi: iwlwifi: nvm: handle EHT/320 MHz regulatory flag
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306210123.dJ9LfIVD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210123.dJ9LfIVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210123.dJ9LfIVD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c: In function 'iwl_nvm_get_regdom_bw_flags':
>> drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1579:26: error: 'NL80211_RRF_NO_EHT' undeclared (first use in this function); did you mean 'NL80211_RRF_NO_HE'?
    1579 |                 flags |= NL80211_RRF_NO_EHT;
         |                          ^~~~~~~~~~~~~~~~~~
         |                          NL80211_RRF_NO_HE
   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c:1579:26: note: each undeclared identifier is reported only once for each function it appears in


vim +1579 drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c

  1516	
  1517	static u32 iwl_nvm_get_regdom_bw_flags(const u16 *nvm_chan,
  1518					       int ch_idx, u16 nvm_flags,
  1519					       struct iwl_reg_capa reg_capa,
  1520					       const struct iwl_cfg *cfg)
  1521	{
  1522		u32 flags = NL80211_RRF_NO_HT40;
  1523	
  1524		if (ch_idx < NUM_2GHZ_CHANNELS &&
  1525		    (nvm_flags & NVM_CHANNEL_40MHZ)) {
  1526			if (nvm_chan[ch_idx] <= LAST_2GHZ_HT_PLUS)
  1527				flags &= ~NL80211_RRF_NO_HT40PLUS;
  1528			if (nvm_chan[ch_idx] >= FIRST_2GHZ_HT_MINUS)
  1529				flags &= ~NL80211_RRF_NO_HT40MINUS;
  1530		} else if (nvm_flags & NVM_CHANNEL_40MHZ) {
  1531			if ((ch_idx - NUM_2GHZ_CHANNELS) % 2 == 0)
  1532				flags &= ~NL80211_RRF_NO_HT40PLUS;
  1533			else
  1534				flags &= ~NL80211_RRF_NO_HT40MINUS;
  1535		}
  1536	
  1537		if (!(nvm_flags & NVM_CHANNEL_80MHZ))
  1538			flags |= NL80211_RRF_NO_80MHZ;
  1539		if (!(nvm_flags & NVM_CHANNEL_160MHZ))
  1540			flags |= NL80211_RRF_NO_160MHZ;
  1541	
  1542		if (!(nvm_flags & NVM_CHANNEL_ACTIVE))
  1543			flags |= NL80211_RRF_NO_IR;
  1544	
  1545		if (nvm_flags & NVM_CHANNEL_RADAR)
  1546			flags |= NL80211_RRF_DFS;
  1547	
  1548		if (nvm_flags & NVM_CHANNEL_INDOOR_ONLY)
  1549			flags |= NL80211_RRF_NO_OUTDOOR;
  1550	
  1551		/* Set the GO concurrent flag only in case that NO_IR is set.
  1552		 * Otherwise it is meaningless
  1553		 */
  1554		if ((nvm_flags & NVM_CHANNEL_GO_CONCURRENT) &&
  1555		    (flags & NL80211_RRF_NO_IR))
  1556			flags |= NL80211_RRF_GO_CONCURRENT;
  1557	
  1558		/*
  1559		 * reg_capa is per regulatory domain so apply it for every channel
  1560		 */
  1561		if (ch_idx >= NUM_2GHZ_CHANNELS) {
  1562			if (!reg_capa.allow_40mhz)
  1563				flags |= NL80211_RRF_NO_HT40;
  1564	
  1565			if (!reg_capa.allow_80mhz)
  1566				flags |= NL80211_RRF_NO_80MHZ;
  1567	
  1568			if (!reg_capa.allow_160mhz)
  1569				flags |= NL80211_RRF_NO_160MHZ;
  1570	
  1571			if (!reg_capa.allow_320mhz)
  1572				flags |= NL80211_RRF_NO_320MHZ;
  1573		}
  1574	
  1575		if (reg_capa.disable_11ax)
  1576			flags |= NL80211_RRF_NO_HE;
  1577	
  1578		if (reg_capa.disable_11be)
> 1579			flags |= NL80211_RRF_NO_EHT;
  1580	
  1581		return flags;
  1582	}
  1583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
