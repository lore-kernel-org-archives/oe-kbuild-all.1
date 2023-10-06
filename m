Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E021CA93
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWVoueBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696596272; x=1728132272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rj6Gy2IM80chnB/F8xy0DphRpWJQdrqhTrPlUEw3JJk=;
  b=RWVoueBTdVrDMIcEidRgzLXkaidWUnWp7puKfrkDLoO+B8MCDm5YaJj/
   5jmKDntQ0kqEt2321brs4zJU62OQscOMLo8cs7JBM1N9LAzOD9oCCcMZe
   aP7joaqiJr2HuszkAoPhbzTcsdellZUZNNWdw/ZPjgkZgD0sk6YFnI6Cp
   nw2ZD/NzY0AT8zQYekdCDptyjZRHwF198mJo8aKBXM+p7F4s9WsMR2s79
   TeU/Uiu3waeZtqIFJ58Iw3HxicRUk0NsQ/zpLjJ2VBsHmQJ4cSJLZJkr0
   3ySauBQPVALrSaMrtJB5GH4G3Ck/umorawi/U4+u6C8w4SqzSXqkaVAcT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="381024892"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="381024892"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="752181742"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="752181742"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Oct 2023 05:44:29 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qokBv-00005g-0m;
	Fri, 06 Oct 2023 12:44:27 +0000
Date: Fri, 6 Oct 2023 20:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:wifi/bcm4388 130/130]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3450:13: sparse:
 sparse: restricted __le16 degrades to integer
Message-ID: <202310062040.gUtVWuF3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux wifi/bcm4388
head:   55bd491c32939383169035a0f4dfd9f7ea9e4801
commit: 55bd491c32939383169035a0f4dfd9f7ea9e4801 [130/130] Add support for 6G bands.
config: i386-randconfig-062-20231006 (https://download.01.org/0day-ci/archive/20231006/202310062040.gUtVWuF3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310062040.gUtVWuF3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310062040.gUtVWuF3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3450:13: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:3452:18: sparse: sparse: restricted __le16 degrades to integer

vim +3450 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  3421	
  3422	static s32 brcmf_inform_single_bss(struct brcmf_cfg80211_info *cfg,
  3423					   struct brcmf_bss_info_le *bi)
  3424	{
  3425		struct wiphy *wiphy = cfg_to_wiphy(cfg);
  3426		struct brcmf_pub *drvr = cfg->pub;
  3427		struct cfg80211_bss *bss;
  3428		enum nl80211_band band;
  3429		struct brcmu_chan ch;
  3430		u16 channel;
  3431		u32 freq;
  3432		u16 notify_capability;
  3433		u16 notify_interval;
  3434		u8 *notify_ie;
  3435		size_t notify_ielen;
  3436		struct cfg80211_inform_bss bss_data = {};
  3437	
  3438		if (le32_to_cpu(bi->length) > WL_BSS_INFO_MAX) {
  3439			bphy_err(drvr, "Bss info is larger than buffer. Discarding\n");
  3440			return -EINVAL;
  3441		}
  3442	
  3443		if (!bi->ctl_ch) {
  3444			ch.chspec = le16_to_cpu(bi->chanspec);
  3445			cfg->d11inf.decchspec(&ch);
  3446			bi->ctl_ch = ch.control_ch_num;
  3447		}
  3448		channel = bi->ctl_ch;
  3449	
> 3450		if (CHSPEC_IS6G(bi->chanspec))
  3451			band = NL80211_BAND_6GHZ;
  3452		else if (CHSPEC_IS5G(bi->chanspec))
  3453			band = NL80211_BAND_5GHZ;
  3454		else
  3455			band = NL80211_BAND_2GHZ;
  3456	
  3457		freq = ieee80211_channel_to_frequency(channel, band);
  3458		if (!freq) {
  3459			brcmf_err(
  3460				"Invalid frequency %d returned for channel %d, band %d. chanspec was %04x\n",
  3461				freq, channel, band, bi->chanspec);
  3462	
  3463			/* We ignore this BSS ID rather than try to continue on.
  3464			   Otherwise we will cause an OOPs because our frequency is 0.
  3465			   The main case this occurs is some new frequency band
  3466			   we have not seen before, and if we return an error,
  3467			   we will cause the scan to fail.  It seems better to 
  3468			   report the error, skip this BSS, and move on.*/
  3469			return 0;
  3470		}
  3471		bss_data.chan = ieee80211_get_channel(wiphy, freq);
  3472		bss_data.scan_width = NL80211_BSS_CHAN_WIDTH_20;
  3473		bss_data.boottime_ns = ktime_to_ns(ktime_get_boottime());
  3474	
  3475		notify_capability = le16_to_cpu(bi->capability);
  3476		notify_interval = le16_to_cpu(bi->beacon_period);
  3477		notify_ie = (u8 *)bi + le16_to_cpu(bi->ie_offset);
  3478		notify_ielen = le32_to_cpu(bi->ie_length);
  3479		bss_data.signal = (s16)le16_to_cpu(bi->RSSI) * 100;
  3480	
  3481		brcmf_dbg(CONN, "bssid: %pM\n", bi->BSSID);
  3482		brcmf_dbg(CONN, "Channel: %d(%d)\n", channel, freq);
  3483		brcmf_dbg(CONN, "Capability: %X\n", notify_capability);
  3484		brcmf_dbg(CONN, "Beacon interval: %d\n", notify_interval);
  3485		brcmf_dbg(CONN, "Signal: %d\n", bss_data.signal);
  3486	
  3487		bss = cfg80211_inform_bss_data(wiphy, &bss_data,
  3488					       CFG80211_BSS_FTYPE_UNKNOWN,
  3489					       (const u8 *)bi->BSSID,
  3490					       0, notify_capability,
  3491					       notify_interval, notify_ie,
  3492					       notify_ielen, GFP_KERNEL);
  3493	
  3494		if (!bss)
  3495			return -ENOMEM;
  3496	
  3497		cfg80211_put_bss(wiphy, bss);
  3498	
  3499		return 0;
  3500	}
  3501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
