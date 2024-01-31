Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1A3D0AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 05:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706677335; cv=none; b=dAvN3KvBY3stSUbgEKPnxn645TC+7E0D70evr52aLbVaICfbEirngNPINebL/bBV9PYjXeBosQ7DmAuqIwJke7l+jinEk6DL40ja5tKumj9KbttWNrjDNOdw0bA811dKOa2cNUdoPvz/qaqknHs16/J8jbQdpIng2vNE4/oY7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706677335; c=relaxed/simple;
	bh=VLfEwLMqRn6Ny2FJaqR3MH2BRxkoUKNkC0vdjFthH/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bEgb/FP+mEFO3cRjmcDS/an4kScCpzpBGVuVqaLcc310vEfstQJ7hZHWRZNrDYzX+Kcqm5CCqaxWwdmcfRIU8Mto1/IVfNEuB4bHYH2CAWMIUND//8MWMCG9vvAyvyRoF2jD1qftpnE3nKE/v5Na++nGqD+PL2F8XYQupg7JONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbJlUuhK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbJlUuhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706677333; x=1738213333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLfEwLMqRn6Ny2FJaqR3MH2BRxkoUKNkC0vdjFthH/U=;
  b=bbJlUuhKLtSHdeUuJpmLXFHLvMLB7K4fDCr17jybAlpp35LNn+Cc1urM
   6pg16U1c1mEgHOxdD8jwRjc8Ym6k5pbnqhma2rqoUG5OAxrvrLLXWpDDO
   GzIw6NqMesCOAVwzxvGAlL/f+9maM5F3kNghK2EQW+NwjmTgJ9Umy5orp
   rQe81F1wjCHDPt1+Y1ubhttOK993Q197Nvxv1azBXAHiuh8acu2j2If4z
   ZNlqNkc0I8Qrjp+OR2yhogWf4wnTTXFNirEHHwg1yiIwuufGlCVXAZ98z
   DnBDiN2IttLZ96F9uGWVMtE9+qT0a2YF2Mf8yWtYPSUun3W4r7xiII2PQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2429840"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2429840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 21:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="30366743"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2024 21:02:10 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV2jf-00019g-2f;
	Wed, 31 Jan 2024 05:02:07 +0000
Date: Wed, 31 Jan 2024 13:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Message-ID: <202401311243.NyXwWZxP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   2c471f31297856be56f60ef29f2565dea1470800
commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi: ath11k: fill parameters for vdev set tpc power WMI command
config: i386-randconfig-141-20240129 (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.

Old smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:2321 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath11k/mac.c:2321 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath11k/mac.c:2323 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.

vim +/eirp_power +7949 drivers/net/wireless/ath/ath11k/mac.c

  7780	
  7781	void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
  7782					  struct ieee80211_vif *vif,
  7783					  struct ieee80211_chanctx_conf *ctx)
  7784	{
  7785		struct ath11k_base *ab = ar->ab;
  7786		struct ath11k_vif *arvif = (void *)vif->drv_priv;
  7787		struct ieee80211_bss_conf *bss_conf = &vif->bss_conf;
  7788		struct ath11k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
  7789		struct ieee80211_channel *chan, *temp_chan;
  7790		u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
  7791		bool is_psd_power = false, is_tpe_present = false;
  7792		s8 max_tx_power[IEEE80211_MAX_NUM_PWR_LEVEL],
  7793			psd_power, tx_power, eirp_power;
  7794		u16 start_freq, center_freq;
  7795	
  7796		chan = ctx->def.chan;
  7797		start_freq = ath11k_mac_get_6ghz_start_frequency(&ctx->def);
  7798		pwr_reduction = bss_conf->pwr_reduction;
  7799	
  7800		if (arvif->reg_tpc_info.num_pwr_levels) {
  7801			is_tpe_present = true;
  7802			num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
  7803		} else {
  7804			num_pwr_levels = ath11k_mac_get_num_pwr_levels(&ctx->def);
  7805		}
  7806	
  7807		for (pwr_lvl_idx = 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_idx++) {
  7808			/* STA received TPE IE*/
  7809			if (is_tpe_present) {
  7810				/* local power is PSD power*/
  7811				if (chan->flags & IEEE80211_CHAN_PSD) {
  7812					/* Connecting AP is psd power */
  7813					if (reg_tpc_info->is_psd_power) {
  7814						is_psd_power = true;
  7815						ath11k_mac_get_psd_channel(ar, 20,
  7816									   &start_freq,
  7817									   &center_freq,
  7818									   pwr_lvl_idx,
  7819									   &temp_chan,
  7820									   &tx_power);
  7821						psd_power = temp_chan->psd;
  7822						eirp_power = tx_power;
  7823						max_tx_power[pwr_lvl_idx] =
  7824							min_t(s8,
  7825							      psd_power,
  7826							      reg_tpc_info->tpe[pwr_lvl_idx]);
  7827					/* Connecting AP is not psd power */
  7828					} else {
  7829						ath11k_mac_get_eirp_power(ar,
  7830									  &start_freq,
  7831									  &center_freq,
  7832									  pwr_lvl_idx,
  7833									  &temp_chan,
  7834									  &ctx->def,
  7835									  &tx_power);
  7836						psd_power = temp_chan->psd;
  7837						/* convert psd power to EIRP power based
  7838						 * on channel width
  7839						 */
  7840						tx_power =
  7841							min_t(s8, tx_power,
  7842							      psd_power + 13 + pwr_lvl_idx * 3);
  7843						max_tx_power[pwr_lvl_idx] =
  7844							min_t(s8,
  7845							      tx_power,
  7846							      reg_tpc_info->tpe[pwr_lvl_idx]);
  7847					}
  7848				/* local power is not PSD power */
  7849				} else {
  7850					/* Connecting AP is psd power */
  7851					if (reg_tpc_info->is_psd_power) {
  7852						is_psd_power = true;
  7853						ath11k_mac_get_psd_channel(ar, 20,
  7854									   &start_freq,
  7855									   &center_freq,
  7856									   pwr_lvl_idx,
  7857									   &temp_chan,
  7858									   &tx_power);
  7859						eirp_power = tx_power;
  7860						max_tx_power[pwr_lvl_idx] =
  7861							reg_tpc_info->tpe[pwr_lvl_idx];
  7862					/* Connecting AP is not psd power */
  7863					} else {
  7864						ath11k_mac_get_eirp_power(ar,
  7865									  &start_freq,
  7866									  &center_freq,
  7867									  pwr_lvl_idx,
  7868									  &temp_chan,
  7869									  &ctx->def,
  7870									  &tx_power);
  7871						max_tx_power[pwr_lvl_idx] =
  7872							min_t(s8,
  7873							      tx_power,
  7874							      reg_tpc_info->tpe[pwr_lvl_idx]);
  7875					}
  7876				}
  7877			/* STA not received TPE IE */
  7878			} else {
  7879				/* local power is PSD power*/
  7880				if (chan->flags & IEEE80211_CHAN_PSD) {
  7881					is_psd_power = true;
  7882					ath11k_mac_get_psd_channel(ar, 20,
  7883								   &start_freq,
  7884								   &center_freq,
  7885								   pwr_lvl_idx,
  7886								   &temp_chan,
  7887								   &tx_power);
  7888					psd_power = temp_chan->psd;
  7889					eirp_power = tx_power;
  7890					max_tx_power[pwr_lvl_idx] = psd_power;
  7891				} else {
  7892					ath11k_mac_get_eirp_power(ar,
  7893								  &start_freq,
  7894								  &center_freq,
  7895								  pwr_lvl_idx,
  7896								  &temp_chan,
  7897								  &ctx->def,
  7898								  &tx_power);
  7899					max_tx_power[pwr_lvl_idx] = tx_power;
  7900				}
  7901			}
  7902	
  7903			if (is_psd_power) {
  7904				/* If AP local power constraint is present */
  7905				if (pwr_reduction)
  7906					eirp_power = eirp_power - pwr_reduction;
  7907	
  7908				/* If firmware updated max tx power is non zero, then take
  7909				 * the min of firmware updated ap tx power
  7910				 * and max power derived from above mentioned parameters.
  7911				 */
  7912				ath11k_dbg(ab, ATH11K_DBG_MAC,
  7913					   "eirp power : %d firmware report power : %d\n",
  7914					   eirp_power, ar->max_allowed_tx_power);
  7915				/* Firmware reports lower max_allowed_tx_power during vdev
  7916				 * start response. In case of 6 GHz, firmware is not aware
  7917				 * of EIRP power unless driver sets EIRP power through WMI
  7918				 * TPC command. So radio which does not support idle power
  7919				 * save can set maximum calculated EIRP power directly to
  7920				 * firmware through TPC command without min comparison with
  7921				 * vdev start response's max_allowed_tx_power.
  7922				 */
  7923				if (ar->max_allowed_tx_power && ab->hw_params.idle_ps)
  7924					eirp_power = min_t(s8,
  7925							   eirp_power,
  7926							   ar->max_allowed_tx_power);
  7927			} else {
  7928				/* If AP local power constraint is present */
  7929				if (pwr_reduction)
  7930					max_tx_power[pwr_lvl_idx] =
  7931						max_tx_power[pwr_lvl_idx] - pwr_reduction;
  7932				/* If firmware updated max tx power is non zero, then take
  7933				 * the min of firmware updated ap tx power
  7934				 * and max power derived from above mentioned parameters.
  7935				 */
  7936				if (ar->max_allowed_tx_power && ab->hw_params.idle_ps)
  7937					max_tx_power[pwr_lvl_idx] =
  7938						min_t(s8,
  7939						      max_tx_power[pwr_lvl_idx],
  7940						      ar->max_allowed_tx_power);
  7941			}
  7942			reg_tpc_info->chan_power_info[pwr_lvl_idx].chan_cfreq = center_freq;
  7943			reg_tpc_info->chan_power_info[pwr_lvl_idx].tx_power =
  7944				max_tx_power[pwr_lvl_idx];
  7945		}
  7946	
  7947		reg_tpc_info->num_pwr_levels = num_pwr_levels;
  7948		reg_tpc_info->is_psd_power = is_psd_power;
> 7949		reg_tpc_info->eirp_power = eirp_power;
  7950		reg_tpc_info->ap_power_type =
  7951			ath11k_reg_ap_pwr_convert(vif->bss_conf.power_type);
  7952	}
  7953	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
