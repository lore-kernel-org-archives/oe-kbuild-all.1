Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEB8F48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692641832; x=1724177832;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MCd9jkPo3T63quBwMvSZQ/hdkpufdGX2QY61L0OyBqU=;
  b=MJvrSiMXugt121x35oDuMudSJoTY0PLyt2eXNSuFUEIxJ9JWHGSBv/vA
   CQYdEBwENAHnLjNq1b9lzCckZzJGHauBLu4Plp/VQ6wLizeuGumSa5zuu
   avm+4MlcU4REME3pbRgNp37S2WWVJ5Hspv6KDkOOANeymcmJkl3lv5ET2
   3Z845PczKvCwOGOJoCaQCx8w8QV3cY21O2l1q1mDjCULtpqhKvU9I5bd7
   DD8lpZtprCRJqgc41q1JhO6JHukV6gkd+7TVmU3DyS8UjNL9hLLXB63+L
   cank34Y4flmb97KmzxSZRiaV3PKWmKLCISakxsZTP0L6giX7FIALyVkei
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353978848"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="353978848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 11:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765463268"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="765463268"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 11:17:09 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY9Se-0000mG-1H;
	Mon, 21 Aug 2023 18:17:08 +0000
Date: Tue, 22 Aug 2023 02:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-08 12474/23283] htmldocs:
 ./include/net/cfg80211.h:566: warning: Function parameter or member
 'ANDROID_BACKPORT_RESERVED(1' not described in 'ieee80211_supported_band'
Message-ID: <202308220215.e9qUnKyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-08
head:   6537ae4cd5d2a2a8c7b62b6eee14e21bec18f908
commit: bee631cec56aa227389a6003fe6148f3551d9e39 [12474/23283] ANDROID: nl80211/cfg80211: Add support to do API changes after GKI freeze
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220215.e9qUnKyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220215.e9qUnKyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/cfg80211.h:566: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'ieee80211_supported_band'
>> ./include/net/cfg80211.h:566: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'ieee80211_supported_band'
>> ./include/net/cfg80211.h:4822: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'ieee80211_iface_limit'
>> ./include/net/cfg80211.h:4822: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'ieee80211_iface_limit'
>> ./include/net/cfg80211.h:4951: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'ieee80211_iface_combination'
>> ./include/net/cfg80211.h:4951: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'ieee80211_iface_combination'
>> ./include/net/cfg80211.h:5562: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'wiphy'
>> ./include/net/cfg80211.h:5562: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'wiphy'
>> ./include/net/cfg80211.h:5934: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'wireless_dev'
>> ./include/net/cfg80211.h:5934: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'wireless_dev'
>> ./include/net/cfg80211.h:758: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'key_params'
>> ./include/net/cfg80211.h:758: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'key_params'
>> ./include/net/cfg80211.h:1172: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_crypto_settings'
>> ./include/net/cfg80211.h:1172: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_crypto_settings'
>> ./include/net/cfg80211.h:1267: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_beacon_data'
>> ./include/net/cfg80211.h:1267: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_beacon_data'
>> ./include/net/cfg80211.h:1407: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_ap_settings'
>> ./include/net/cfg80211.h:1407: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_ap_settings'
>> ./include/net/cfg80211.h:1621: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'station_parameters'
>> ./include/net/cfg80211.h:1621: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'station_parameters'
>> ./include/net/cfg80211.h:1775: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'rate_info'
>> ./include/net/cfg80211.h:1775: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'rate_info'
>> ./include/net/cfg80211.h:1998: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'station_info'
>> ./include/net/cfg80211.h:1998: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'station_info'
>> ./include/net/cfg80211.h:3185: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_connect_params'
>> ./include/net/cfg80211.h:3185: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_connect_params'
>> ./include/net/cfg80211.h:3285: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_pmksa'
>> ./include/net/cfg80211.h:3285: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_pmksa'
>> ./include/net/cfg80211.h:4729: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_ops'
>> ./include/net/cfg80211.h:4729: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_ops'
>> ./include/net/cfg80211.h:7503: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_connect_resp_params'
>> ./include/net/cfg80211.h:7503: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_connect_resp_params'
>> ./include/net/cfg80211.h:2528: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_scan_request'
>> ./include/net/cfg80211.h:2528: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_scan_request'
>> ./include/net/cfg80211.h:2736: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_inform_bss'
>> ./include/net/cfg80211.h:2736: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_inform_bss'
>> ./include/net/cfg80211.h:2826: warning: Function parameter or member 'ANDROID_BACKPORT_RESERVED(1' not described in 'cfg80211_bss'
>> ./include/net/cfg80211.h:2826: warning: Function parameter or member 'ANDROID_VENDOR_DATA(1' not described in 'cfg80211_bss'

vim +566 ./include/net/cfg80211.h

df78a0c0b67de5 Thomas Pedersen             2020-06-01  518  
d323655372590c Johannes Berg               2009-04-20  519  /**
d323655372590c Johannes Berg               2009-04-20  520   * struct ieee80211_supported_band - frequency band definition
d323655372590c Johannes Berg               2009-04-20  521   *
d323655372590c Johannes Berg               2009-04-20  522   * This structure describes a frequency band a wiphy
d323655372590c Johannes Berg               2009-04-20  523   * is able to operate in.
d323655372590c Johannes Berg               2009-04-20  524   *
085a6c109b9dbc Randy Dunlap                2020-07-15  525   * @channels: Array of channels the hardware can operate with
d323655372590c Johannes Berg               2009-04-20  526   *	in this band.
d323655372590c Johannes Berg               2009-04-20  527   * @band: the band this structure represents
d323655372590c Johannes Berg               2009-04-20  528   * @n_channels: Number of channels in @channels
d323655372590c Johannes Berg               2009-04-20  529   * @bitrates: Array of bitrates the hardware can operate with
d323655372590c Johannes Berg               2009-04-20  530   *	in this band. Must be sorted to give a valid "supported
d323655372590c Johannes Berg               2009-04-20  531   *	rates" IE, i.e. CCK rates first, then OFDM.
d323655372590c Johannes Berg               2009-04-20  532   * @n_bitrates: Number of bitrates in @bitrates
abe37c4b84502d Johannes Berg               2010-06-07  533   * @ht_cap: HT capabilities in this band
c9a0a3025262c6 Robert P. J. Day            2012-08-26  534   * @vht_cap: VHT capabilities in this band
8a50c0572ffa81 Mauro Carvalho Chehab       2020-09-10  535   * @s1g_cap: S1G capabilities in this band
2a38075cd0beef Alexei Avshalom Lazar       2019-08-18  536   * @edmg_cap: EDMG capabilities in this band
9ff167e1782240 Johannes Berg               2020-09-18  537   * @s1g_cap: S1G capabilities in this band (S1B band only, of course)
c4cbaf7973a794 Luca Coelho                 2018-06-09  538   * @n_iftype_data: number of iftype data entries
c4cbaf7973a794 Luca Coelho                 2018-06-09  539   * @iftype_data: interface type data entries.  Note that the bits in
c4cbaf7973a794 Luca Coelho                 2018-06-09  540   *	@types_mask inside this structure cannot overlap (i.e. only
c4cbaf7973a794 Luca Coelho                 2018-06-09  541   *	one occurrence of each type is allowed across all instances of
c4cbaf7973a794 Luca Coelho                 2018-06-09  542   *	iftype_data).
d323655372590c Johannes Berg               2009-04-20  543   */
d323655372590c Johannes Berg               2009-04-20  544  struct ieee80211_supported_band {
d323655372590c Johannes Berg               2009-04-20  545  	struct ieee80211_channel *channels;
d323655372590c Johannes Berg               2009-04-20  546  	struct ieee80211_rate *bitrates;
57fbcce37be7c1 Johannes Berg               2016-04-12  547  	enum nl80211_band band;
d323655372590c Johannes Berg               2009-04-20  548  	int n_channels;
d323655372590c Johannes Berg               2009-04-20  549  	int n_bitrates;
d323655372590c Johannes Berg               2009-04-20  550  	struct ieee80211_sta_ht_cap ht_cap;
bf0c111ec80355 Mahesh Palivela             2012-06-22  551  	struct ieee80211_sta_vht_cap vht_cap;
df78a0c0b67de5 Thomas Pedersen             2020-06-01  552  	struct ieee80211_sta_s1g_cap s1g_cap;
2a38075cd0beef Alexei Avshalom Lazar       2019-08-18  553  	struct ieee80211_edmg edmg_cap;
c4cbaf7973a794 Luca Coelho                 2018-06-09  554  	u16 n_iftype_data;
c4cbaf7973a794 Luca Coelho                 2018-06-09  555  	const struct ieee80211_sband_iftype_data *iftype_data;
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  556  
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  557  	ANDROID_BACKPORT_RESERVED(1);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  558  	ANDROID_BACKPORT_RESERVED(2);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  559  	ANDROID_BACKPORT_RESERVED(3);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  560  	ANDROID_BACKPORT_RESERVED(4);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  561  
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  562  	ANDROID_VENDOR_DATA(1);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  563  	ANDROID_VENDOR_DATA(2);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  564  	ANDROID_VENDOR_DATA(3);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  565  	ANDROID_VENDOR_DATA(4);
d323655372590c Johannes Berg               2009-04-20 @566  };
179f831bc33104 Andy Green                  2007-07-10  567  
c4cbaf7973a794 Luca Coelho                 2018-06-09  568  /**
c4cbaf7973a794 Luca Coelho                 2018-06-09  569   * ieee80211_get_sband_iftype_data - return sband data for a given iftype
c4cbaf7973a794 Luca Coelho                 2018-06-09  570   * @sband: the sband to search for the STA on
c4cbaf7973a794 Luca Coelho                 2018-06-09  571   * @iftype: enum nl80211_iftype
c4cbaf7973a794 Luca Coelho                 2018-06-09  572   *
c4cbaf7973a794 Luca Coelho                 2018-06-09  573   * Return: pointer to struct ieee80211_sband_iftype_data, or NULL is none found
c4cbaf7973a794 Luca Coelho                 2018-06-09  574   */
c4cbaf7973a794 Luca Coelho                 2018-06-09  575  static inline const struct ieee80211_sband_iftype_data *
c4cbaf7973a794 Luca Coelho                 2018-06-09  576  ieee80211_get_sband_iftype_data(const struct ieee80211_supported_band *sband,
c4cbaf7973a794 Luca Coelho                 2018-06-09  577  				u8 iftype)
c4cbaf7973a794 Luca Coelho                 2018-06-09  578  {
c4cbaf7973a794 Luca Coelho                 2018-06-09  579  	int i;
c4cbaf7973a794 Luca Coelho                 2018-06-09  580  
c4cbaf7973a794 Luca Coelho                 2018-06-09  581  	if (WARN_ON(iftype >= NL80211_IFTYPE_MAX))
c4cbaf7973a794 Luca Coelho                 2018-06-09  582  		return NULL;
c4cbaf7973a794 Luca Coelho                 2018-06-09  583  
c4cbaf7973a794 Luca Coelho                 2018-06-09  584  	for (i = 0; i < sband->n_iftype_data; i++)  {
c4cbaf7973a794 Luca Coelho                 2018-06-09  585  		const struct ieee80211_sband_iftype_data *data =
c4cbaf7973a794 Luca Coelho                 2018-06-09  586  			&sband->iftype_data[i];
c4cbaf7973a794 Luca Coelho                 2018-06-09  587  
c4cbaf7973a794 Luca Coelho                 2018-06-09  588  		if (data->types_mask & BIT(iftype))
c4cbaf7973a794 Luca Coelho                 2018-06-09  589  			return data;
c4cbaf7973a794 Luca Coelho                 2018-06-09  590  	}
c4cbaf7973a794 Luca Coelho                 2018-06-09  591  
c4cbaf7973a794 Luca Coelho                 2018-06-09  592  	return NULL;
c4cbaf7973a794 Luca Coelho                 2018-06-09  593  }
c4cbaf7973a794 Luca Coelho                 2018-06-09  594  
c4cbaf7973a794 Luca Coelho                 2018-06-09  595  /**
d7edf40c15e85b John Crispin                2019-05-21  596   * ieee80211_get_he_iftype_cap - return HE capabilities for an sband's iftype
d7edf40c15e85b John Crispin                2019-05-21  597   * @sband: the sband to search for the iftype on
d7edf40c15e85b John Crispin                2019-05-21  598   * @iftype: enum nl80211_iftype
c4cbaf7973a794 Luca Coelho                 2018-06-09  599   *
c4cbaf7973a794 Luca Coelho                 2018-06-09  600   * Return: pointer to the struct ieee80211_sta_he_cap, or NULL is none found
c4cbaf7973a794 Luca Coelho                 2018-06-09  601   */
c4cbaf7973a794 Luca Coelho                 2018-06-09  602  static inline const struct ieee80211_sta_he_cap *
d7edf40c15e85b John Crispin                2019-05-21  603  ieee80211_get_he_iftype_cap(const struct ieee80211_supported_band *sband,
d7edf40c15e85b John Crispin                2019-05-21  604  			    u8 iftype)
c4cbaf7973a794 Luca Coelho                 2018-06-09  605  {
c4cbaf7973a794 Luca Coelho                 2018-06-09  606  	const struct ieee80211_sband_iftype_data *data =
d7edf40c15e85b John Crispin                2019-05-21  607  		ieee80211_get_sband_iftype_data(sband, iftype);
c4cbaf7973a794 Luca Coelho                 2018-06-09  608  
c4cbaf7973a794 Luca Coelho                 2018-06-09  609  	if (data && data->he_cap.has_he)
c4cbaf7973a794 Luca Coelho                 2018-06-09  610  		return &data->he_cap;
c4cbaf7973a794 Luca Coelho                 2018-06-09  611  
c4cbaf7973a794 Luca Coelho                 2018-06-09  612  	return NULL;
c4cbaf7973a794 Luca Coelho                 2018-06-09  613  }
c4cbaf7973a794 Luca Coelho                 2018-06-09  614  
2ad2274c58ee2d Ilan Peer                   2020-05-28  615  /**
2ad2274c58ee2d Ilan Peer                   2020-05-28  616   * ieee80211_get_he_6ghz_capa - return HE 6 GHz capabilities
2ad2274c58ee2d Ilan Peer                   2020-05-28  617   * @sband: the sband to search for the STA on
2ad2274c58ee2d Ilan Peer                   2020-05-28  618   * @iftype: the iftype to search for
2ad2274c58ee2d Ilan Peer                   2020-05-28  619   *
2ad2274c58ee2d Ilan Peer                   2020-05-28  620   * Return: the 6GHz capabilities
2ad2274c58ee2d Ilan Peer                   2020-05-28  621   */
2ad2274c58ee2d Ilan Peer                   2020-05-28  622  static inline __le16
2ad2274c58ee2d Ilan Peer                   2020-05-28  623  ieee80211_get_he_6ghz_capa(const struct ieee80211_supported_band *sband,
2ad2274c58ee2d Ilan Peer                   2020-05-28  624  			   enum nl80211_iftype iftype)
2ad2274c58ee2d Ilan Peer                   2020-05-28  625  {
2ad2274c58ee2d Ilan Peer                   2020-05-28  626  	const struct ieee80211_sband_iftype_data *data =
2ad2274c58ee2d Ilan Peer                   2020-05-28  627  		ieee80211_get_sband_iftype_data(sband, iftype);
2ad2274c58ee2d Ilan Peer                   2020-05-28  628  
2ad2274c58ee2d Ilan Peer                   2020-05-28  629  	if (WARN_ON(!data || !data->he_cap.has_he))
2ad2274c58ee2d Ilan Peer                   2020-05-28  630  		return 0;
2ad2274c58ee2d Ilan Peer                   2020-05-28  631  
2ad2274c58ee2d Ilan Peer                   2020-05-28  632  	return data->he_6ghz_capa.capa;
2ad2274c58ee2d Ilan Peer                   2020-05-28  633  }
2ad2274c58ee2d Ilan Peer                   2020-05-28  634  
2626768c2ad023 Ilan Peer                   2022-02-14  635  /**
2626768c2ad023 Ilan Peer                   2022-02-14  636   * ieee80211_get_eht_iftype_cap - return ETH capabilities for an sband's iftype
2626768c2ad023 Ilan Peer                   2022-02-14  637   * @sband: the sband to search for the iftype on
2626768c2ad023 Ilan Peer                   2022-02-14  638   * @iftype: enum nl80211_iftype
2626768c2ad023 Ilan Peer                   2022-02-14  639   *
2626768c2ad023 Ilan Peer                   2022-02-14  640   * Return: pointer to the struct ieee80211_sta_eht_cap, or NULL is none found
2626768c2ad023 Ilan Peer                   2022-02-14  641   */
2626768c2ad023 Ilan Peer                   2022-02-14  642  static inline const struct ieee80211_sta_eht_cap *
2626768c2ad023 Ilan Peer                   2022-02-14  643  ieee80211_get_eht_iftype_cap(const struct ieee80211_supported_band *sband,
2626768c2ad023 Ilan Peer                   2022-02-14  644  			     enum nl80211_iftype iftype)
2626768c2ad023 Ilan Peer                   2022-02-14  645  {
2626768c2ad023 Ilan Peer                   2022-02-14  646  	const struct ieee80211_sband_iftype_data *data =
2626768c2ad023 Ilan Peer                   2022-02-14  647  		ieee80211_get_sband_iftype_data(sband, iftype);
2626768c2ad023 Ilan Peer                   2022-02-14  648  
2626768c2ad023 Ilan Peer                   2022-02-14  649  	if (data && data->eht_cap.has_eht)
2626768c2ad023 Ilan Peer                   2022-02-14  650  		return &data->eht_cap;
2626768c2ad023 Ilan Peer                   2022-02-14  651  
2626768c2ad023 Ilan Peer                   2022-02-14  652  	return NULL;
2626768c2ad023 Ilan Peer                   2022-02-14  653  }
2626768c2ad023 Ilan Peer                   2022-02-14  654  
e691ac2f75b69b Rafał Miłecki               2017-01-04  655  /**
e691ac2f75b69b Rafał Miłecki               2017-01-04  656   * wiphy_read_of_freq_limits - read frequency limits from device tree
e691ac2f75b69b Rafał Miłecki               2017-01-04  657   *
e691ac2f75b69b Rafał Miłecki               2017-01-04  658   * @wiphy: the wireless device to get extra limits for
e691ac2f75b69b Rafał Miłecki               2017-01-04  659   *
e691ac2f75b69b Rafał Miłecki               2017-01-04  660   * Some devices may have extra limitations specified in DT. This may be useful
e691ac2f75b69b Rafał Miłecki               2017-01-04  661   * for chipsets that normally support more bands but are limited due to board
e691ac2f75b69b Rafał Miłecki               2017-01-04  662   * design (e.g. by antennas or external power amplifier).
e691ac2f75b69b Rafał Miłecki               2017-01-04  663   *
e691ac2f75b69b Rafał Miłecki               2017-01-04  664   * This function reads info from DT and uses it to *modify* channels (disable
e691ac2f75b69b Rafał Miłecki               2017-01-04  665   * unavailable ones). It's usually a *bad* idea to use it in drivers with
e691ac2f75b69b Rafał Miłecki               2017-01-04  666   * shared channel data as DT limitations are device specific. You should make
e691ac2f75b69b Rafał Miłecki               2017-01-04  667   * sure to call it only if channels in wiphy are copied and can be modified
e691ac2f75b69b Rafał Miłecki               2017-01-04  668   * without affecting other devices.
e691ac2f75b69b Rafał Miłecki               2017-01-04  669   *
e691ac2f75b69b Rafał Miłecki               2017-01-04  670   * As this function access device node it has to be called after set_wiphy_dev.
e691ac2f75b69b Rafał Miłecki               2017-01-04  671   * It also modifies channels so they have to be set first.
e691ac2f75b69b Rafał Miłecki               2017-01-04  672   * If using this helper, call it before wiphy_register().
e691ac2f75b69b Rafał Miłecki               2017-01-04  673   */
e691ac2f75b69b Rafał Miłecki               2017-01-04  674  #ifdef CONFIG_OF
e691ac2f75b69b Rafał Miłecki               2017-01-04  675  void wiphy_read_of_freq_limits(struct wiphy *wiphy);
e691ac2f75b69b Rafał Miłecki               2017-01-04  676  #else /* CONFIG_OF */
e691ac2f75b69b Rafał Miłecki               2017-01-04  677  static inline void wiphy_read_of_freq_limits(struct wiphy *wiphy)
e691ac2f75b69b Rafał Miłecki               2017-01-04  678  {
e691ac2f75b69b Rafał Miłecki               2017-01-04  679  }
e691ac2f75b69b Rafał Miłecki               2017-01-04  680  #endif /* !CONFIG_OF */
e691ac2f75b69b Rafał Miłecki               2017-01-04  681  
e691ac2f75b69b Rafał Miłecki               2017-01-04  682  
d323655372590c Johannes Berg               2009-04-20  683  /*
d323655372590c Johannes Berg               2009-04-20  684   * Wireless hardware/device configuration structures and methods
d323655372590c Johannes Berg               2009-04-20  685   */
179f831bc33104 Andy Green                  2007-07-10  686  
d70e96932de55f Johannes Berg               2010-08-19  687  /**
d70e96932de55f Johannes Berg               2010-08-19  688   * DOC: Actions and configuration
d70e96932de55f Johannes Berg               2010-08-19  689   *
d70e96932de55f Johannes Berg               2010-08-19  690   * Each wireless device and each virtual interface offer a set of configuration
d70e96932de55f Johannes Berg               2010-08-19  691   * operations and other actions that are invoked by userspace. Each of these
d70e96932de55f Johannes Berg               2010-08-19  692   * actions is described in the operations structure, and the parameters these
d70e96932de55f Johannes Berg               2010-08-19  693   * operations use are described separately.
d70e96932de55f Johannes Berg               2010-08-19  694   *
d70e96932de55f Johannes Berg               2010-08-19  695   * Additionally, some operations are asynchronous and expect to get status
d70e96932de55f Johannes Berg               2010-08-19  696   * information via some functions that drivers need to call.
d70e96932de55f Johannes Berg               2010-08-19  697   *
d70e96932de55f Johannes Berg               2010-08-19  698   * Scanning and BSS list handling with its associated functionality is described
d70e96932de55f Johannes Berg               2010-08-19  699   * in a separate chapter.
d70e96932de55f Johannes Berg               2010-08-19  700   */
d70e96932de55f Johannes Berg               2010-08-19  701  
c6e6a0c8be575c Aviya Erenfeld              2016-07-05  702  #define VHT_MUMIMO_GROUPS_DATA_LEN (WLAN_MEMBERSHIP_LEN +\
c6e6a0c8be575c Aviya Erenfeld              2016-07-05  703  				    WLAN_USER_POSITION_LEN)
c6e6a0c8be575c Aviya Erenfeld              2016-07-05  704  
d323655372590c Johannes Berg               2009-04-20  705  /**
d323655372590c Johannes Berg               2009-04-20  706   * struct vif_params - describes virtual interface parameters
818a986e4ebace Johannes Berg               2017-04-12  707   * @flags: monitor interface flags, unchanged if 0, otherwise
818a986e4ebace Johannes Berg               2017-04-12  708   *	%MONITOR_FLAG_CHANGED will be set
8b787643ca0a51 Felix Fietkau               2009-11-10  709   * @use_4addr: use 4-address frames
e8f479b11268af Ben Greear                  2014-10-22  710   * @macaddr: address to use for this virtual interface.
e8f479b11268af Ben Greear                  2014-10-22  711   *	If this parameter is set to zero address the driver may
e8f479b11268af Ben Greear                  2014-10-22  712   *	determine the address as needed.
e8f479b11268af Ben Greear                  2014-10-22  713   *	This feature is only fully supported by drivers that enable the
e8f479b11268af Ben Greear                  2014-10-22  714   *	%NL80211_FEATURE_MAC_ON_CREATE flag.  Others may support creating
e8f479b11268af Ben Greear                  2014-10-22  715   **	only p2p devices with specified MAC.
b0265024b8b5fb Johannes Berg               2017-04-12  716   * @vht_mumimo_groups: MU-MIMO groupID, used for monitoring MU-MIMO packets
b0265024b8b5fb Johannes Berg               2017-04-12  717   *	belonging to that MU-MIMO groupID; %NULL if not changed
b0265024b8b5fb Johannes Berg               2017-04-12  718   * @vht_mumimo_follow_addr: MU-MIMO follow address, used for monitoring
b0265024b8b5fb Johannes Berg               2017-04-12  719   *	MU-MIMO packets going to the specified station; %NULL if not changed
d323655372590c Johannes Berg               2009-04-20  720   */
d323655372590c Johannes Berg               2009-04-20  721  struct vif_params {
818a986e4ebace Johannes Berg               2017-04-12  722  	u32 flags;
8b787643ca0a51 Felix Fietkau               2009-11-10  723  	int use_4addr;
1c18f1452a772d Arend van Spriel            2013-01-08  724  	u8 macaddr[ETH_ALEN];
b0265024b8b5fb Johannes Berg               2017-04-12  725  	const u8 *vht_mumimo_groups;
b0265024b8b5fb Johannes Berg               2017-04-12  726  	const u8 *vht_mumimo_follow_addr;
d323655372590c Johannes Berg               2009-04-20  727  };
179f831bc33104 Andy Green                  2007-07-10  728  
41ade00f21a72d Johannes Berg               2007-12-19  729  /**
41ade00f21a72d Johannes Berg               2007-12-19  730   * struct key_params - key information
41ade00f21a72d Johannes Berg               2007-12-19  731   *
41ade00f21a72d Johannes Berg               2007-12-19  732   * Information about a key
41ade00f21a72d Johannes Berg               2007-12-19  733   *
41ade00f21a72d Johannes Berg               2007-12-19  734   * @key: key material
41ade00f21a72d Johannes Berg               2007-12-19  735   * @key_len: length of key material
41ade00f21a72d Johannes Berg               2007-12-19  736   * @cipher: cipher suite selector
41ade00f21a72d Johannes Berg               2007-12-19  737   * @seq: sequence counter (IV/PN) for TKIP and CCMP keys, only used
41ade00f21a72d Johannes Berg               2007-12-19  738   *	with the get_key() callback, must be in little endian,
41ade00f21a72d Johannes Berg               2007-12-19  739   *	length given by @seq_len.
abe37c4b84502d Johannes Berg               2010-06-07  740   * @seq_len: length of @seq.
14f34e36b36cee Gurumoorthi Gnanasambandhan 2019-10-31  741   * @vlan_id: vlan_id for VLAN group key (if nonzero)
6cdd3979a2bdc1 Alexander Wetzel            2019-03-19  742   * @mode: key install mode (RX_TX, NO_TX or SET_TX)
41ade00f21a72d Johannes Berg               2007-12-19  743   */
41ade00f21a72d Johannes Berg               2007-12-19  744  struct key_params {
c1e5f4714d591c Johannes Berg               2014-05-19  745  	const u8 *key;
c1e5f4714d591c Johannes Berg               2014-05-19  746  	const u8 *seq;
41ade00f21a72d Johannes Berg               2007-12-19  747  	int key_len;
41ade00f21a72d Johannes Berg               2007-12-19  748  	int seq_len;
14f34e36b36cee Gurumoorthi Gnanasambandhan 2019-10-31  749  	u16 vlan_id;
41ade00f21a72d Johannes Berg               2007-12-19  750  	u32 cipher;
6cdd3979a2bdc1 Alexander Wetzel            2019-03-19  751  	enum nl80211_key_mode mode;
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  752  
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  753  	ANDROID_BACKPORT_RESERVED(1);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  754  	ANDROID_BACKPORT_RESERVED(2);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  755  
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  756  	ANDROID_VENDOR_DATA(1);
bee631cec56aa2 Veerendranath Jakkam        2022-06-06  757  	ANDROID_VENDOR_DATA(2);
41ade00f21a72d Johannes Berg               2007-12-19 @758  };
41ade00f21a72d Johannes Berg               2007-12-19  759  

:::::: The code at line 566 was first introduced by commit
:::::: d323655372590c533c275b1d798f9d1221efb5c6 cfg80211: clean up includes

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
