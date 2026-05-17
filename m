Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372FE148850
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 01:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778981652; cv=none; b=qCez/PoXnGWR3YI00LUjFiQDQkxieR789K1owBDmxpnqAY6JwGjXEPc8xx7plXyDay/WyCBhojmGN8tpvgPAheBGXVzwDqdLCAfufjACAc+y5GOmwDF7zD5XDMZOpkHc5ho9weaLXzSD0sG4YPpRLMRjEjy2dWA49sQQXPePcNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778981652; c=relaxed/simple;
	bh=WOP/ZzLM4WAGHHl1Gf1kpFpNtK58haWPSN5IUqU1bEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m5/6DscH49IEN8oKrbLz56LnwnbvbQAnfJ+/YAgZWH3KvIezTLYAaPNpGQI5Fqb51KO75k2TnYP9k8MCRm5iBzQe2LyHf2BMLLS5sAS+6QKbWxrt22CVXpoTVCstO90H+s0LxQFO9D+g7wstf95F2RLWeOryF95E1T5PRmkwuCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfV8B+Ky; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfV8B+Ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778981650; x=1810517650;
  h=date:from:to:cc:subject:message-id;
  bh=WOP/ZzLM4WAGHHl1Gf1kpFpNtK58haWPSN5IUqU1bEA=;
  b=KfV8B+KytHFQZ2cvHFuUe0dh7RAaf3D4tHxVzdrcMhDyxCC7HWjyGe/r
   SC5cHNyFZfxkfuTJb+oxxEgZUkhQ43OGnJUk61HczWZnwpN1ZRG6FV8qW
   gFIgB0//FebjDae5Lr77jB2h26uH1XZ50NwrJHSVsiIcbUDP5sQFlx8tD
   hE1ZexXBmxzj0GlG6F7cmsyUNm34p2F9EPuPiUYDXBHE0KFn3pBD4HTQT
   35YiyGzQz+pDVWRB/pnWtUYtUMj7sEgaXDyw3nSnhPUMVevTqphejoO97
   aSrsRWY+m6FbHXKNYFpq0iE7cyPjM6SUph9ClkaFCsndn0M5WkYibBgMD
   A==;
X-CSE-ConnectionGUID: +v7AYTPvRP+ULC84tU9W4w==
X-CSE-MsgGUID: XP1W/vtGTWaZhjmsHvjz7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79599827"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79599827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 18:34:10 -0700
X-CSE-ConnectionGUID: wkbuQPgtRyu/Z+mL8PxfDg==
X-CSE-MsgGUID: kmMSqtL4Q/q2/hFsjnXJNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="243383339"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2026 18:34:08 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOQOL-000000001Gs-330x;
	Sun, 17 May 2026 01:34:05 +0000
Date: Sun, 17 May 2026 09:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [iwlwifi-next:next 6/93]
 drivers/net/wireless/intel/iwlwifi/mld/tlc.c:454 iwl_mld_fill_supp_rates()
 warn: inconsistent indenting
Message-ID: <202605170928.yPTN7kOn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   ce2b645bb3099ef4d96759335271e25875202ce9
commit: a76591f3eb9ffe425f68d5732c23340342cb1c1b [6/93] wifi: iwlwifi: mld: tlc: separate from link STA
config: i386-randconfig-141-20260517 (https://download.01.org/0day-ci/archive/20260517/202605170928.yPTN7kOn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170928.yPTN7kOn-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mld/tlc.c:454 iwl_mld_fill_supp_rates() warn: inconsistent indenting

vim +454 drivers/net/wireless/intel/iwlwifi/mld/tlc.c

   427	
   428	static void
   429	iwl_mld_fill_supp_rates(struct iwl_mld *mld,
   430				struct ieee80211_vif *vif,
   431				struct iwl_mld_tlc_sta_capa *capa,
   432				struct iwl_tlc_config_cmd *cmd)
   433	{
   434		cmd->non_ht_rates = cpu_to_le16(capa->non_ht_rates);
   435		cmd->mode = IWL_TLC_MNG_MODE_NON_HT;
   436	
   437		if (capa->uhr_cap && capa->uhr_cap->has_uhr && capa->own_uhr_cap) {
   438			cmd->mode = IWL_TLC_MNG_MODE_UHR;
   439			/*
   440			 * FIXME: spec currently inherits from EHT but has no
   441			 * finer MCS bits. Once that's there, need to add them
   442			 * to the bitmaps (and maybe copy this to UHR, or so.)
   443			 */
   444			iwl_mld_fill_eht_rates(vif, capa, cmd);
   445		} else if (capa->eht_cap && capa->eht_cap->has_eht &&
   446			   capa->own_he_cap && capa->own_eht_cap) {
   447			cmd->mode = IWL_TLC_MNG_MODE_EHT;
   448			iwl_mld_fill_eht_rates(vif, capa, cmd);
   449		} else if (capa->he_cap && capa->he_cap->has_he && capa->own_he_cap) {
   450			cmd->mode = IWL_TLC_MNG_MODE_HE;
   451			iwl_mld_fill_he_rates(capa, cmd);
   452		} else if (capa->vht_cap && capa->vht_cap->vht_supported) {
   453			cmd->mode = IWL_TLC_MNG_MODE_VHT;
 > 454				iwl_mld_fill_vht_rates(capa, cmd);
   455		} else if (capa->ht_cap && capa->ht_cap->ht_supported) {
   456			cmd->mode = IWL_TLC_MNG_MODE_HT;
   457			cmd->ht_rates[IWL_TLC_NSS_1][IWL_TLC_MCS_PER_BW_80] =
   458				cpu_to_le32(capa->ht_cap->mcs.rx_mask[0]);
   459	
   460			/* the station support only a single receive chain */
   461			if (capa->smps_mode == IEEE80211_SMPS_STATIC)
   462				cmd->ht_rates[IWL_TLC_NSS_2][IWL_TLC_MCS_PER_BW_80] =
   463					0;
   464			else
   465				cmd->ht_rates[IWL_TLC_NSS_2][IWL_TLC_MCS_PER_BW_80] =
   466					cpu_to_le32(capa->ht_cap->mcs.rx_mask[1]);
   467		}
   468	}
   469	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
