Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B43AC17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns47wBAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698347379; x=1729883379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DlfJa+dqkoLlcgeF5gm+bzZQsSljq5hZjA3ncZDUyPE=;
  b=Ns47wBAwQK3uBtFpO/nvauH/xRD7TMGc5w3shJLAQmQjtBBy9MHqrm1N
   WDz2P/ycKXOvTu/v/Nn2VnI8gdHb6brdyCjvQ/lrnmwxMFYgrwzHPaEEA
   bAw5lADn3BTD3Z8bKW4o65G0rxRGz5bNwGpwcugNzNA9GE4zDkKQGy1t7
   WchCGNpb821tCLQjmEA5Q+z7BVpHjRSQhEdXjixKLJhhx/cFWOC+DB4G1
   BkvMZxGDBMoiptJYac7jjtsChP/ycg487ov8g0393EuEjYAtgQgFxUlb3
   7YxxyOi/vWrtWX2f4p6VajsY73SW0xU/tQY+UTcTlJ1TdRtdcFl6H44c6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367841526"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="367841526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 12:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="587715"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2023 12:09:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw5jb-000A3v-1M;
	Thu, 26 Oct 2023 19:09:35 +0000
Date: Fri, 27 Oct 2023 03:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/080-wifi 32/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:396:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202310270256.ZGvhoaqA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   2fac67e22f6cf7c8b1261e1bc9a33de738859b89
commit: 2fac67e22f6cf7c8b1261e1bc9a33de738859b89 [32/32] EScan was not including band in chanspec conversion during prep, causing it to only scan 2g channels by default.
config: i386-randconfig-063-20231026 (https://download.01.org/0day-ci/archive/20231027/202310270256.ZGvhoaqA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270256.ZGvhoaqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270256.ZGvhoaqA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:396:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:396:24: sparse:     expected restricted __le32
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:396:24: sparse:     got int
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:399:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __le32 @@     got int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:399:24: sparse:     expected restricted __le32
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:399:24: sparse:     got int
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:468:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [assigned] [usertype] band @@     got restricted __le32 @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:468:21: sparse:     expected unsigned char [assigned] [usertype] band
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:468:21: sparse:     got restricted __le32
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:480:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] band @@     got restricted __le32 @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:480:21: sparse:     expected unsigned char [usertype] band
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:480:21: sparse:     got restricted __le32

vim +396 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

   388	
   389	static __le32 nl80211_band_to_chanspec_band(enum nl80211_band band)
   390	{
   391		switch (band) {
   392		case NL80211_BAND_2GHZ:
   393			return BRCMU_CHAN_BAND_2G;
   394			break;
   395		case NL80211_BAND_5GHZ:
 > 396			return BRCMU_CHAN_BAND_5G;
   397			break;
   398		case NL80211_BAND_6GHZ:
   399			return BRCMU_CHAN_BAND_6G;
   400			break;
   401		case NL80211_BAND_60GHZ:
   402		default:
   403			WARN_ON_ONCE(1);
   404			// Choose a safe default
   405			return BRCMU_CHAN_BAND_2G;
   406		}
   407	}
   408	
   409	static u16 chandef_to_chanspec(struct brcmu_d11inf *d11inf,
   410				       struct cfg80211_chan_def *ch)
   411	{
   412		struct brcmu_chan ch_inf;
   413		s32 primary_offset;
   414	
   415		brcmf_dbg(TRACE, "chandef: control %d center %d width %d\n",
   416			  ch->chan->center_freq, ch->center_freq1, ch->width);
   417		ch_inf.chnum = ieee80211_frequency_to_channel(ch->center_freq1);
   418		primary_offset = ch->chan->center_freq - ch->center_freq1;
   419		switch (ch->width) {
   420		case NL80211_CHAN_WIDTH_20:
   421		case NL80211_CHAN_WIDTH_20_NOHT:
   422			ch_inf.bw = BRCMU_CHAN_BW_20;
   423			WARN_ON(primary_offset != 0);
   424			break;
   425		case NL80211_CHAN_WIDTH_40:
   426			ch_inf.bw = BRCMU_CHAN_BW_40;
   427			if (primary_offset > 0)
   428				ch_inf.sb = BRCMU_CHAN_SB_U;
   429			else
   430				ch_inf.sb = BRCMU_CHAN_SB_L;
   431			break;
   432		case NL80211_CHAN_WIDTH_80:
   433			ch_inf.bw = BRCMU_CHAN_BW_80;
   434			if (primary_offset == -30)
   435				ch_inf.sb = BRCMU_CHAN_SB_LL;
   436			else if (primary_offset == -10)
   437				ch_inf.sb = BRCMU_CHAN_SB_LU;
   438			else if (primary_offset == 10)
   439				ch_inf.sb = BRCMU_CHAN_SB_UL;
   440			else
   441				ch_inf.sb = BRCMU_CHAN_SB_UU;
   442			break;
   443		case NL80211_CHAN_WIDTH_160:
   444			ch_inf.bw = BRCMU_CHAN_BW_160;
   445			if (primary_offset == -70)
   446				ch_inf.sb = BRCMU_CHAN_SB_LLL;
   447			else if (primary_offset == -50)
   448				ch_inf.sb = BRCMU_CHAN_SB_LLU;
   449			else if (primary_offset == -30)
   450				ch_inf.sb = BRCMU_CHAN_SB_LUL;
   451			else if (primary_offset == -10)
   452				ch_inf.sb = BRCMU_CHAN_SB_LUU;
   453			else if (primary_offset == 10)
   454				ch_inf.sb = BRCMU_CHAN_SB_ULL;
   455			else if (primary_offset == 30)
   456				ch_inf.sb = BRCMU_CHAN_SB_ULU;
   457			else if (primary_offset == 50)
   458				ch_inf.sb = BRCMU_CHAN_SB_UUL;
   459			else
   460				ch_inf.sb = BRCMU_CHAN_SB_UUU;
   461			break;
   462		case NL80211_CHAN_WIDTH_80P80:
   463		case NL80211_CHAN_WIDTH_5:
   464		case NL80211_CHAN_WIDTH_10:
   465		default:
   466			WARN_ON_ONCE(1);
   467		}
 > 468		ch_inf.band = nl80211_band_to_chanspec_band(ch->chan->band);
   469		d11inf->encchspec(&ch_inf);
   470	
   471		brcmf_dbg(TRACE, "chanspec: 0x%x\n", ch_inf.chspec);
   472		return ch_inf.chspec;
   473	}
   474	
   475	u16 channel_to_chanspec(struct brcmu_d11inf *d11inf,
   476				struct ieee80211_channel *ch)
   477	{
   478		struct brcmu_chan ch_inf;
   479	
 > 480		ch_inf.band = nl80211_band_to_chanspec_band(ch->band);
   481		ch_inf.chnum = ieee80211_frequency_to_channel(ch->center_freq);
   482		ch_inf.bw = BRCMU_CHAN_BW_20;
   483		d11inf->encchspec(&ch_inf);
   484	
   485		return ch_inf.chspec;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
