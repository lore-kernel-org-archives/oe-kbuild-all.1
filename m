Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C64A1C860C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772891173; cv=none; b=uL9cgY9M7fjJycfOe5mXDLf8EHpSsQPQmJmpPw0L19MPHXJ8knOH8RTBd7HzgfdaNFwbB8Qyrd4p/SaZz3qQ9N0baYhP3CXZHPoEiCSRGBtpWaEj7F1ljoVArB/Tk1/nPozWGZiqtgwuxi+nzuwIpeqUgDSrFUs48JBwQa/91sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772891173; c=relaxed/simple;
	bh=zGPmb6vDH2Bxjv88omnlCAAtIYwow0MjtkGrQBi1h/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfiMOUNDWWGJ+9/v1Lh8l7Fr7OvxEmpabUc4bHeZtHr9Kpop/4L0siIGiA3w5nksofhwzAQSjMBze5Gs3wp1UrwuCLxilhztVph2UkbSZQnItCCRfGlkwcbDvKMS0s5h0jmXKNr/STZHnsoOHKyNNVQoNl0/wHvsaSZso9kF2Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8ePFOjL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8ePFOjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772891172; x=1804427172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zGPmb6vDH2Bxjv88omnlCAAtIYwow0MjtkGrQBi1h/w=;
  b=O8ePFOjLOcyasLWPvHl6cKtiiRIB3pQbsc2pm0RUvVvVUArP5ZnIkBtU
   zKYyjtdAcIDT0jhRwOdBnqAEAd+r4jailnKaRFIMLTwrDIRp/Mdcpn1iu
   SnHA71+YeNVDkwzOkJRwoAc5fKK5drqY/+RwYa4qDGX8mX4R+vrxjQ5sF
   8u2ayZiSGDSsNxBdjn1/vW5r+nsFJu3klcUPqeJGmbkmR6wjPvfT588zB
   WmQOVwgks4wXcDl76Iaoc9ZgD0+su1NBzmSmnNcNuONPnBVXXRgTFfYBP
   bTahK7RwvTIFLyqAAt8UElK7WHe+gm9rNoOVn5lFewuWZsjLTQ1B5bWAf
   w==;
X-CSE-ConnectionGUID: MYSnDjPWTcmfV3vspo5Rvw==
X-CSE-MsgGUID: 7y/VrvTEQGGxaOMehOKWNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73883552"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73883552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 05:46:11 -0800
X-CSE-ConnectionGUID: 3raBlUHbSZOEd6CT3scGFw==
X-CSE-MsgGUID: udvbxoShSle4r4ix8DBUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="218503184"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 05:46:09 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyryp-000000002UT-1Rfc;
	Sat, 07 Mar 2026 13:46:07 +0000
Date: Sat, 7 Mar 2026 14:45:43 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@kernel.org>, nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 02/19] wifi: mt76: mt7925: pass WCID indices to
 bss_basic_tlv()
Message-ID: <202603071400.xCvjvPoG-lkp@intel.com>
References: <20260306232238.2039675-3-sean.wang@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306232238.2039675-3-sean.wang@kernel.org>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Wang/wifi-mt76-mt7925-pass-mlink-to-sta_amsdu_tlv/20260307-073047
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20260306232238.2039675-3-sean.wang%40kernel.org
patch subject: [PATCH 02/19] wifi: mt76: mt7925: pass WCID indices to bss_basic_tlv()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260307/202603071400.xCvjvPoG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071400.xCvjvPoG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071400.xCvjvPoG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7925/mcu.c: In function 'mt7925_mcu_add_bss_info':
>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:2867:13: warning: variable 'sta_wlan_idx' set but not used [-Wunused-but-set-variable]
    2867 |         u16 sta_wlan_idx;
         |             ^~~~~~~~~~~~


vim +/sta_wlan_idx +2867 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

  2856	
  2857	int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
  2858				    struct ieee80211_chanctx_conf *ctx,
  2859				    struct ieee80211_bss_conf *link_conf,
  2860				    struct ieee80211_link_sta *link_sta,
  2861				    int enable)
  2862	{
  2863		struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
  2864		struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
  2865		struct mt792x_link_sta *mlink_bc;
  2866		struct mt792x_link_sta *mlink;
> 2867		u16 sta_wlan_idx;
  2868	
  2869		sta_wlan_idx = mvif->sta.deflink.wcid.idx;
  2870	
  2871		mlink_bc = mt792x_sta_to_link(&mvif->sta, mconf->link_id);
  2872	
  2873		if (link_sta) {
  2874			struct mt792x_sta *msta = (void *)link_sta->sta->drv_priv;
  2875	
  2876			mlink = mt792x_sta_to_link(msta, link_sta->link_id);
  2877			if (WARN_ON(!mlink))
  2878				return -1;
  2879		} else {
  2880			mlink = &mconf->vif->sta.deflink;
  2881		}
  2882	
  2883		return mt7925_mcu_add_bss_info_sta(phy, ctx, link_conf, link_sta,
  2884						   mlink_bc->wcid.idx, mlink->wcid.idx, enable);
  2885	}
  2886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
