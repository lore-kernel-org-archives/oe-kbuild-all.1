Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B021A19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 19:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdCPhJxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697224829; x=1728760829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnCBiS+J8NEUg1OoUMCZHea3rm28rFpkzaUrOmeQ40Q=;
  b=jdCPhJxNjpqS3lXbCdl//22GLlH7ykbtLY3liRNUlX5jnErgZf803+vh
   p0fd+X6LGoA6G4Dj0WG1cROuUEk7R8zcb+PkUwYaD4depbNTXqDMWaDW3
   /XG7nXwUYY/KEk5Nz9fbDRcUJ4w3b8Ulrmb7mOmfdyJPw1GV8QV76mBdJ
   wYr7sdPypepsFJSvdRQgIcG9x0vibkPz/HzvBZXezh2pi/BYTjmT7SzZG
   hxV5ni4DZAxRhz7171bkSHeUr9AuQyuuDRa35SET9p6SVvv3gw8CGrZ+5
   F6NFRxgzstyoEh8zSEmKBO0pd/9dutzH/IWYAvkw1PbUjp1zE85WW2kbf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416305982"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="416305982"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="825160122"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="825160122"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 12:20:24 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrNht-0005JE-2q;
	Fri, 13 Oct 2023 19:20:21 +0000
Date: Sat, 14 Oct 2023 03:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Patrick Blass <patrickblass.dev@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/080-wifi 29/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5237
 brcmf_cfg80211_start_ap() warn: inconsistent indenting
Message-ID: <202310140349.OTmxHxgJ-lkp@intel.com>
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
commit: 5f743ddcb05c1a657ac8bf8c0fdf29aaa91b311e [29/32] brcmfmac: Fix AP mode
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140349.OTmxHxgJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140349.OTmxHxgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140349.OTmxHxgJ-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5237 brcmf_cfg80211_start_ap() warn: inconsistent indenting

Old smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7839 brcmf_setup_wiphy() warn: inconsistent indenting

vim +5237 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

  5201	
  5202	static s32
  5203	brcmf_cfg80211_start_ap(struct wiphy *wiphy, struct net_device *ndev,
  5204				struct cfg80211_ap_settings *settings)
  5205	{
  5206		s32 ie_offset;
  5207		struct brcmf_cfg80211_info *cfg = wiphy_to_cfg(wiphy);
  5208		struct brcmf_if *ifp = netdev_priv(ndev);
  5209		struct brcmf_pub *drvr = cfg->pub;
  5210		struct brcmf_cfg80211_profile *profile = &ifp->vif->profile;
  5211		struct cfg80211_crypto_settings *crypto = &settings->crypto;
  5212		const struct brcmf_tlv *ssid_ie;
  5213		const struct brcmf_tlv *country_ie;
  5214		struct brcmf_ssid_le ssid_le;
  5215		s32 err = -EPERM;
  5216		struct brcmf_join_params join_params;
  5217		enum nl80211_iftype dev_role;
  5218		struct brcmf_fil_bss_enable_le bss_enable;
  5219		u16 chanspec = chandef_to_chanspec(&cfg->d11inf, &settings->chandef);
  5220		bool mbss;
  5221		int is_11d;
  5222		bool supports_11d;
  5223	
  5224		brcmf_dbg(TRACE, "ctrlchn=%d, center=%d, bw=%d, beacon_interval=%d, dtim_period=%d,\n",
  5225			  settings->chandef.chan->hw_value,
  5226			  settings->chandef.center_freq1, settings->chandef.width,
  5227			  settings->beacon_interval, settings->dtim_period);
  5228		brcmf_dbg(TRACE, "ssid=%s(%zu), auth_type=%d, inactivity_timeout=%d\n",
  5229			  settings->ssid, settings->ssid_len, settings->auth_type,
  5230			  settings->inactivity_timeout);
  5231		dev_role = ifp->vif->wdev.iftype;
  5232		mbss = ifp->vif->mbss;
  5233		/* Bring firmware into correct state for AP mode*/
  5234		if (dev_role == NL80211_IFTYPE_AP) {
  5235			brcmf_dbg(TRACE, "set AP mode\n");
  5236			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_AP, 1);
> 5237				if (err < 0) {
  5238					bphy_err(drvr, "setting AP mode failed %d\n",
  5239						err);
  5240					goto exit;
  5241				}
  5242	
  5243			bss_enable.bsscfgidx = cpu_to_le32(ifp->bsscfgidx);
  5244			bss_enable.enable = cpu_to_le32(WLC_AP_IOV_OP_MANUAL_AP_BSSCFG_CREATE);
  5245			err = brcmf_fil_iovar_data_set(ifp, "bss", &bss_enable,
  5246								sizeof(bss_enable));
  5247			if (err < 0) {
  5248				bphy_err(drvr, "AP role set error, %d\n", err);
  5249				goto exit;
  5250			}
  5251		}
  5252	
  5253		/* store current 11d setting */
  5254		if (brcmf_fil_cmd_int_get(ifp, BRCMF_C_GET_REGULATORY,
  5255					  &ifp->vif->is_11d)) {
  5256			is_11d = supports_11d = false;
  5257		} else {
  5258			country_ie = brcmf_parse_tlvs((u8 *)settings->beacon.tail,
  5259						      settings->beacon.tail_len,
  5260						      WLAN_EID_COUNTRY);
  5261			is_11d = country_ie ? 1 : 0;
  5262			supports_11d = true;
  5263		}
  5264	
  5265		memset(&ssid_le, 0, sizeof(ssid_le));
  5266		if (settings->ssid == NULL || settings->ssid_len == 0) {
  5267			ie_offset = DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN;
  5268			ssid_ie = brcmf_parse_tlvs(
  5269					(u8 *)&settings->beacon.head[ie_offset],
  5270					settings->beacon.head_len - ie_offset,
  5271					WLAN_EID_SSID);
  5272			if (!ssid_ie || ssid_ie->len > IEEE80211_MAX_SSID_LEN)
  5273				return -EINVAL;
  5274	
  5275			memcpy(ssid_le.SSID, ssid_ie->data, ssid_ie->len);
  5276			ssid_le.SSID_len = cpu_to_le32(ssid_ie->len);
  5277			brcmf_dbg(TRACE, "SSID is (%s) in Head\n", ssid_le.SSID);
  5278		} else {
  5279			memcpy(ssid_le.SSID, settings->ssid, settings->ssid_len);
  5280			ssid_le.SSID_len = cpu_to_le32((u32)settings->ssid_len);
  5281		}
  5282	
  5283		if (!mbss) {
  5284			brcmf_set_mpc(ifp, 0);
  5285			brcmf_configure_arp_nd_offload(ifp, false);
  5286		}
  5287	
  5288		/* Parameters shared by all radio interfaces */
  5289		if (!mbss) {
  5290			if ((supports_11d) && (is_11d != ifp->vif->is_11d)) {
  5291				err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_REGULATORY,
  5292							    is_11d);
  5293				if (err < 0) {
  5294					bphy_err(drvr, "Regulatory Set Error, %d\n",
  5295						 err);
  5296					goto exit;
  5297				}
  5298			}
  5299			if (settings->beacon_interval) {
  5300				err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_BCNPRD,
  5301							    settings->beacon_interval);
  5302				if (err < 0) {
  5303					bphy_err(drvr, "Beacon Interval Set Error, %d\n",
  5304						 err);
  5305					goto exit;
  5306				}
  5307			}
  5308			if (settings->dtim_period) {
  5309				err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_DTIMPRD,
  5310							    settings->dtim_period);
  5311				if (err < 0) {
  5312					bphy_err(drvr, "DTIM Interval Set Error, %d\n",
  5313						 err);
  5314					goto exit;
  5315				}
  5316			}
  5317	
  5318			if ((dev_role == NL80211_IFTYPE_AP) &&
  5319			    ((ifp->ifidx == 0) ||
  5320			     (!brcmf_feat_is_enabled(ifp, BRCMF_FEAT_RSDB) &&
  5321			      !brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MCHAN)))) {
  5322				err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_DOWN, 1);
  5323				if (err < 0) {
  5324					bphy_err(drvr, "BRCMF_C_DOWN error %d\n",
  5325						 err);
  5326					goto exit;
  5327				}
  5328				brcmf_fil_iovar_int_set(ifp, "apsta", 0);
  5329			}
  5330	
  5331			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_INFRA, 1);
  5332			if (err < 0) {
  5333				bphy_err(drvr, "SET INFRA error %d\n", err);
  5334				goto exit;
  5335			}
  5336		} else if (WARN_ON(supports_11d && (is_11d != ifp->vif->is_11d))) {
  5337			/* Multiple-BSS should use same 11d configuration */
  5338			err = -EINVAL;
  5339			goto exit;
  5340		}
  5341	
  5342		/* Interface specific setup */
  5343		if (dev_role == NL80211_IFTYPE_AP) {
  5344			if ((brcmf_feat_is_enabled(ifp, BRCMF_FEAT_MBSS)) && (!mbss))
  5345				brcmf_fil_iovar_int_set(ifp, "mbss", 1);
  5346	
  5347			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_SET_AP, 1);
  5348			if (err < 0) {
  5349				bphy_err(drvr, "setting AP mode failed %d\n",
  5350					 err);
  5351				goto exit;
  5352			}
  5353			if (!mbss) {
  5354				/* Firmware 10.x requires setting channel after enabling
  5355				 * AP and before bringing interface up.
  5356				 */
  5357				err = brcmf_fil_iovar_int_set(ifp, "chanspec", chanspec);
  5358				if (err < 0) {
  5359					bphy_err(drvr, "Set Channel failed: chspec=%d, %d\n",
  5360						 chanspec, err);
  5361					goto exit;
  5362				}
  5363			}
  5364			err = brcmf_fil_cmd_int_set(ifp, BRCMF_C_UP, 1);
  5365			if (err < 0) {
  5366				bphy_err(drvr, "BRCMF_C_UP error (%d)\n", err);
  5367				goto exit;
  5368			}
  5369	
  5370			if (crypto->psk) {
  5371				brcmf_dbg(INFO, "using PSK offload\n");
  5372				profile->use_fwauth |= BIT(BRCMF_PROFILE_FWAUTH_PSK);
  5373				err = brcmf_set_pmk(ifp, crypto->psk,
  5374						    BRCMF_WSEC_MAX_PSK_LEN);
  5375				if (err < 0)
  5376					goto exit;
  5377			}
  5378			if (crypto->sae_pwd) {
  5379				brcmf_dbg(INFO, "using SAE offload\n");
  5380				profile->use_fwauth |= BIT(BRCMF_PROFILE_FWAUTH_SAE);
  5381				err = brcmf_set_sae_password(ifp, crypto->sae_pwd,
  5382							     crypto->sae_pwd_len);
  5383				if (err < 0)
  5384					goto exit;
  5385			}
  5386			if (profile->use_fwauth == 0)
  5387				profile->use_fwauth = BIT(BRCMF_PROFILE_FWAUTH_NONE);
  5388	
  5389			err = brcmf_parse_configure_security(ifp, settings,
  5390							     NL80211_IFTYPE_AP);
  5391			if (err < 0) {
  5392				bphy_err(drvr, "brcmf_parse_configure_security error\n");
  5393				goto exit;
  5394			}
  5395	
  5396			/* On DOWN the firmware removes the WEP keys, reconfigure
  5397			 * them if they were set.
  5398			 */
  5399			brcmf_cfg80211_reconfigure_wep(ifp);
  5400	
  5401			memset(&join_params, 0, sizeof(join_params));
  5402			/* join parameters starts with ssid */
  5403			memcpy(&join_params.ssid_le, &ssid_le, sizeof(ssid_le));
  5404			/* create softap */
  5405			err = brcmf_fil_cmd_data_set(ifp, BRCMF_C_SET_SSID,
  5406						     &join_params, sizeof(join_params));
  5407			if (err < 0) {
  5408				bphy_err(drvr, "SET SSID error (%d)\n", err);
  5409				goto exit;
  5410			}
  5411	
  5412			err = brcmf_fil_iovar_int_set(ifp, "closednet",
  5413						      settings->hidden_ssid);
  5414			if (err) {
  5415				bphy_err(drvr, "%s closednet error (%d)\n",
  5416					 settings->hidden_ssid ?
  5417					 "enabled" : "disabled",
  5418					 err);
  5419				goto exit;
  5420			}
  5421	
  5422			brcmf_dbg(TRACE, "AP mode configuration complete\n");
  5423		} else if (dev_role == NL80211_IFTYPE_P2P_GO) {
  5424			err = brcmf_fil_iovar_int_set(ifp, "chanspec", chanspec);
  5425			if (err < 0) {
  5426				bphy_err(drvr, "Set Channel failed: chspec=%d, %d\n",
  5427					 chanspec, err);
  5428				goto exit;
  5429			}
  5430	
  5431			err = brcmf_parse_configure_security(ifp, settings,
  5432							     NL80211_IFTYPE_P2P_GO);
  5433			if (err < 0) {
  5434				brcmf_err("brcmf_parse_configure_security error\n");
  5435				goto exit;
  5436			}
  5437	
  5438			err = brcmf_fil_bsscfg_data_set(ifp, "ssid", &ssid_le,
  5439							sizeof(ssid_le));
  5440			if (err < 0) {
  5441				bphy_err(drvr, "setting ssid failed %d\n", err);
  5442				goto exit;
  5443			}
  5444			bss_enable.bsscfgidx = cpu_to_le32(ifp->bsscfgidx);
  5445			bss_enable.enable = cpu_to_le32(1);
  5446			err = brcmf_fil_iovar_data_set(ifp, "bss", &bss_enable,
  5447						       sizeof(bss_enable));
  5448			if (err < 0) {
  5449				bphy_err(drvr, "bss_enable config failed %d\n", err);
  5450				goto exit;
  5451			}
  5452	
  5453			brcmf_dbg(TRACE, "GO mode configuration complete\n");
  5454		} else {
  5455			WARN_ON(1);
  5456		}
  5457	
  5458		brcmf_config_ap_mgmt_ie(ifp->vif, &settings->beacon);
  5459		set_bit(BRCMF_VIF_STATUS_AP_CREATED, &ifp->vif->sme_state);
  5460		brcmf_net_setcarrier(ifp, true);
  5461	
  5462	exit:
  5463		if ((err) && (!mbss)) {
  5464			brcmf_set_mpc(ifp, 1);
  5465			brcmf_configure_arp_nd_offload(ifp, true);
  5466		}
  5467		return err;
  5468	}
  5469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
