Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EEF1A5B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1JCe0Zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698335258; x=1729871258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yO5ag2lgOTFuYU1Q7gD7Jnor18demehVBrdu8hl9Dss=;
  b=h1JCe0Zy58IH35DMAsTQJCT+Y/XsEaRLSvV1jbtq2xfafTQpGYkF/aCB
   Y6ahGeOA46GOs3FUUFDp0WCCo64Di3+M2aqx0MTrPMLJXy29OvqPTdDvx
   Rhfm4cf0M2GijLUNM2+7sOOCZ6W7CghwfJ+UUy1M0nroBK1WHena4qT9g
   G9Rhv40VVu+/1wIAq3qGzmE2D28G6GqOST2gbhmwk8X7259wt/2K5oyjl
   3Iy92xqY1Eke38xMT7TTdAn+F8quSL0LYtsZ5EwZWErlbiVkOM5bL1zy/
   U4g81QwzZNJppODfcTTYVquWmb9ZMLDjXawELXa+k+wk7UH4wyhHNsy00
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473822546"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="473822546"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 08:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="882869521"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="882869521"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Oct 2023 08:47:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw2Zx-0009tn-03;
	Thu, 26 Oct 2023 15:47:25 +0000
Date: Thu, 26 Oct 2023 23:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/080-wifi 30/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c:363:31: sparse:
 sparse: restricted __le16 degrades to integer
Message-ID: <202310262315.qnHSQZKv-lkp@intel.com>
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
commit: 3952a7bc01860b0efa4efc162197fc0ddafe7187 [30/32] Finish 6G support by supporting new scan structures
config: i386-randconfig-063-20231026 (https://download.01.org/0day-ci/archive/20231026/202310262315.qnHSQZKv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262315.qnHSQZKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262315.qnHSQZKv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c:363:31: sparse: sparse: restricted __le16 degrades to integer

vim +363 drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c

   287	
   288	void brcmf_feat_attach(struct brcmf_pub *drvr)
   289	{
   290		struct brcmf_if *ifp = brcmf_get_ifp(drvr, 0);
   291		struct brcmf_wl_scan_version_le scan_ver;
   292		struct brcmf_pno_param_v3_le pno_params;
   293		struct brcmf_pno_macaddr_le pfn_mac;
   294		struct brcmf_gscan_config gscan_cfg;
   295		u32 wowl_cap;
   296		s32 err;
   297	
   298		brcmf_feat_firmware_capabilities(ifp);
   299		memset(&gscan_cfg, 0, sizeof(gscan_cfg));
   300		if (drvr->bus_if->chip != BRCM_CC_43430_CHIP_ID &&
   301		    drvr->bus_if->chip != BRCM_CC_4345_CHIP_ID &&
   302		    drvr->bus_if->chip != BRCM_CC_43454_CHIP_ID &&
   303		    drvr->bus_if->chip != CY_CC_43439_CHIP_ID)
   304			brcmf_feat_iovar_data_set(ifp, BRCMF_FEAT_GSCAN,
   305						  "pfn_gscan_cfg",
   306						  &gscan_cfg, sizeof(gscan_cfg));
   307		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_PNO, "pfn");
   308		if (drvr->bus_if->wowl_supported)
   309			brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_WOWL, "wowl");
   310		if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_WOWL)) {
   311			err = brcmf_fil_iovar_int_get(ifp, "wowl_cap", &wowl_cap);
   312			if (!err) {
   313				ifp->drvr->feat_flags |= BIT(BRCMF_FEAT_WOWL_ARP_ND);
   314				if (wowl_cap & BRCMF_WOWL_PFN_FOUND)
   315					ifp->drvr->feat_flags |=
   316						BIT(BRCMF_FEAT_WOWL_ND);
   317				if (wowl_cap & BRCMF_WOWL_GTK_FAILURE)
   318					ifp->drvr->feat_flags |=
   319						BIT(BRCMF_FEAT_WOWL_GTK);
   320			}
   321		}
   322		/* MBSS does not work for all chips */
   323		switch (drvr->bus_if->chip) {
   324		case BRCM_CC_4330_CHIP_ID:
   325		case BRCM_CC_43362_CHIP_ID:
   326			ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_MBSS);
   327			break;
   328		default:
   329			break;
   330		}
   331		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_RSDB, "rsdb_mode");
   332		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_TDLS, "tdls_enable");
   333		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_MFP, "mfp");
   334		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_DUMP_OBSS, "dump_obss");
   335		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_EVENT_MSGS_EXT, "event_msgs_ext");
   336	
   337		pfn_mac.version = BRCMF_PFN_MACADDR_CFG_VER;
   338		err = brcmf_fil_iovar_data_get(ifp, "pfn_macaddr", &pfn_mac,
   339					       sizeof(pfn_mac));
   340		if (!err)
   341			ifp->drvr->feat_flags |= BIT(BRCMF_FEAT_SCAN_RANDOM_MAC);
   342	
   343		brcmf_feat_iovar_int_get(ifp, BRCMF_FEAT_FWSUP, "sup_wpa");
   344	
   345		err = brcmf_fil_iovar_data_get(ifp, "scan_ver", &scan_ver, sizeof(scan_ver));
   346		if (!err) {
   347			int ver = le16_to_cpu(scan_ver.scan_ver_major);
   348	
   349			if (ver == 2) {
   350				ifp->drvr->feat_flags |= BIT(BRCMF_FEAT_SCAN_V2);
   351			} else if (ver == 3) {
   352				/* We consider SCAN_V3 a subtype of SCAN_V2 since the
   353				 * structure is essentially the same.
   354				 */
   355				ifp->drvr->feat_flags |= BIT(BRCMF_FEAT_SCAN_V2) | BIT(BRCMF_FEAT_SCAN_V3);
   356			}
   357		}
   358	
   359		/* See what version of PFN scan is supported*/
   360		err = brcmf_fil_iovar_data_get(ifp, "pno_set", &pno_params,
   361					       sizeof(pno_params));
   362		if (!err) {
 > 363			if (pno_params.version == 3) {
   364				ifp->drvr->feat_flags |= BIT(BRCMF_FEAT_PFN_V3);
   365			}
   366		}
   367	
   368		if (drvr->settings->feature_disable) {
   369			brcmf_dbg(INFO, "Features: 0x%02x, disable: 0x%02x\n",
   370				  ifp->drvr->feat_flags,
   371				  drvr->settings->feature_disable);
   372			ifp->drvr->feat_flags &= ~drvr->settings->feature_disable;
   373		}
   374	
   375		brcmf_feat_wlc_version_overrides(drvr);
   376		brcmf_feat_firmware_overrides(drvr);
   377	
   378		/* set chip related quirks */
   379		switch (drvr->bus_if->chip) {
   380		case BRCM_CC_43236_CHIP_ID:
   381			drvr->chip_quirks |= BIT(BRCMF_FEAT_QUIRK_AUTO_AUTH);
   382			break;
   383		case BRCM_CC_4329_CHIP_ID:
   384			drvr->chip_quirks |= BIT(BRCMF_FEAT_QUIRK_NEED_MPC);
   385			break;
   386		default:
   387			/* no quirks */
   388			break;
   389		}
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
