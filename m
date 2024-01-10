Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4D3FE37
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWssnmXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704875124; x=1736411124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QjrcPO2JWcnAbqO3UOKb6xUcY/Uywu/RjhFPF/lQUdI=;
  b=UWssnmXdQeR3V5MCZsTmAw8glZhZcZ/5V3Iv7W+MGvQY6iL4v4fIxeV9
   5Nps3S9TMZxkzCkj4qPZp1YrSJtC3kG1UjD9s3zwY0JjeNhRK/2LFqXwf
   qoqIZznHdRzJTn15TeNiIzINiqBZzhdeyjoXfhun0EaogknAamVtd6Tar
   XFp/7pzR/CpsLDqXMjz/0qQox+9IYsTvMdJyhgcI0NW1IJVGgi86ylu3v
   dbPIZLPp0xK1geKRUD1m3liomE+STQpqq6iTQhRu40JEZRw7g94HmPDWg
   P549Lw2JvFnLbROVFDW2w09Rh8NUWmWIIdEG8QPZXXf+0Mg/v6cWtrbWv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484628191"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="484628191"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 00:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731781504"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731781504"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 00:25:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNTpn-0006mG-0T;
	Wed, 10 Jan 2024 08:21:25 +0000
Date: Wed, 10 Jan 2024 16:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5_core80 57/59]
 drivers/net/wireless/intel/iwlegacy/common.c:4093:17: error: too few
 arguments to function 'ieee80211_chswitch_done'
Message-ID: <202401101654.b6jp49Dq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5_core80
head:   260daff72d49b63c085ace273ce18843b70cc526
commit: b96284319e9d636245b0883f7a719a4cdb4ed256 [57/59] MAC80211
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240110/202401101654.b6jp49Dq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101654.b6jp49Dq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101654.b6jp49Dq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlegacy/common.c: In function 'il_chswitch_done':
>> drivers/net/wireless/intel/iwlegacy/common.c:4093:17: error: too few arguments to function 'ieee80211_chswitch_done'
    4093 |                 ieee80211_chswitch_done(il->vif, is_success);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlegacy/common.c:22:
   include/net/mac80211.h:6461:6: note: declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/intel/iwlegacy/4965-mac.c: In function 'il4965_mac_channel_switch':
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6125:17: error: too few arguments to function 'ieee80211_chswitch_done'
    6125 |                 ieee80211_chswitch_done(il->vif, false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/intel/iwlegacy/4965-mac.c:32:
   include/net/mac80211.h:6461:6: note: declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/wireless/ath/ath11k/wmi.c: In function 'ath11k_wmi_obss_color_collision_event':
>> drivers/net/wireless/ath/ath11k/wmi.c:3959:17: error: implicit declaration of function 'ieee80211_obss_color_collision_notify'; did you mean 'ieeee80211_obss_color_collision_notify'? [-Werror=implicit-function-declaration]
    3959 |                 ieee80211_obss_color_collision_notify(arvif->vif, ev->obss_color_bitmap,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 ieeee80211_obss_color_collision_notify
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_setup_bcn_tmpl_ema':
>> drivers/net/wireless/ath/ath11k/mac.c:1469:19: error: implicit declaration of function 'ieee80211_beacon_get_template_ema_list'; did you mean 'ieee80211_beacon_get_template'? [-Werror=implicit-function-declaration]
    1469 |         beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   ieee80211_beacon_get_template
>> drivers/net/wireless/ath/ath11k/mac.c:1469:17: warning: assignment to 'struct ieee80211_ema_beacons *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1469 |         beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
         |                 ^
>> drivers/net/wireless/ath/ath11k/mac.c:1471:33: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1471 |         if (!beacons || !beacons->cnt) {
         |                                 ^~
   drivers/net/wireless/ath/ath11k/mac.c:1478:60: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1478 |                 ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb);
         |                                                            ^~
   drivers/net/wireless/ath/ath11k/mac.c:1482:32: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1482 |         for (i = 0; i < beacons->cnt; i++) {
         |                                ^~
   drivers/net/wireless/ath/ath11k/mac.c:1486:72: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1486 |                                                                 beacons->bcn[i].skb);
         |                                                                        ^~
   drivers/net/wireless/ath/ath11k/mac.c:1488:33: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1488 |                 params = beacons->cnt;
         |                                 ^~
   drivers/net/wireless/ath/ath11k/mac.c:1491:45: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1491 |                 params |= ((i + 1 == beacons->cnt ? 1 : 0) << WMI_EMA_LAST_TMPL_SHIFT);
         |                                             ^~
   drivers/net/wireless/ath/ath11k/mac.c:1494:51: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1494 |                                           &beacons->bcn[i].offs,
         |                                                   ^~
   drivers/net/wireless/ath/ath11k/mac.c:1495:50: error: invalid use of undefined type 'struct ieee80211_ema_beacons'
    1495 |                                           beacons->bcn[i].skb, params);
         |                                                  ^~
>> drivers/net/wireless/ath/ath11k/mac.c:1504:9: error: implicit declaration of function 'ieee80211_beacon_free_ema_list'; did you mean 'ieee80211_beacon_get_template'? [-Werror=implicit-function-declaration]
    1504 |         ieee80211_beacon_free_ema_list(beacons);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         ieee80211_beacon_get_template
   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_set_he_txbf_conf':
>> drivers/net/wireless/ath/ath11k/mac.c:2893:33: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformer'
    2893 |         if (arvif->vif->bss_conf.he_su_beamformer) {
         |                                 ^
>> drivers/net/wireless/ath/ath11k/mac.c:2895:41: error: 'struct ieee80211_bss_conf' has no member named 'he_mu_beamformer'
    2895 |                 if (arvif->vif->bss_conf.he_mu_beamformer &&
         |                                         ^
>> drivers/net/wireless/ath/ath11k/mac.c:2904:41: error: 'struct ieee80211_bss_conf' has no member named 'he_full_ul_mumimo'
    2904 |                 if (arvif->vif->bss_conf.he_full_ul_mumimo)
         |                                         ^
>> drivers/net/wireless/ath/ath11k/mac.c:2907:41: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformee'
    2907 |                 if (arvif->vif->bss_conf.he_su_beamformee)
         |                                         ^
   cc1: some warnings being treated as errors
--
   drivers/net/wireless/mediatek/mt76/mt7915/main.c: In function 'mt7915_vif_check_caps':
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:670:36: error: 'struct ieee80211_bss_conf' has no member named 'ht_ldpc'
     670 |         vc->ht_ldpc = vif->bss_conf.ht_ldpc;
         |                                    ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:671:37: error: 'struct ieee80211_bss_conf' has no member named 'vht_ldpc'
     671 |         vc->vht_ldpc = vif->bss_conf.vht_ldpc;
         |                                     ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:672:41: error: 'struct ieee80211_bss_conf' has no member named 'vht_su_beamformer'
     672 |         vc->vht_su_ebfer = vif->bss_conf.vht_su_beamformer;
         |                                         ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:673:41: error: 'struct ieee80211_bss_conf' has no member named 'vht_su_beamformee'
     673 |         vc->vht_su_ebfee = vif->bss_conf.vht_su_beamformee;
         |                                         ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:674:41: error: 'struct ieee80211_bss_conf' has no member named 'vht_mu_beamformer'
     674 |         vc->vht_mu_ebfer = vif->bss_conf.vht_mu_beamformer;
         |                                         ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:675:41: error: 'struct ieee80211_bss_conf' has no member named 'vht_mu_beamformee'
     675 |         vc->vht_mu_ebfee = vif->bss_conf.vht_mu_beamformee;
         |                                         ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:676:36: error: 'struct ieee80211_bss_conf' has no member named 'he_ldpc'
     676 |         vc->he_ldpc = vif->bss_conf.he_ldpc;
         |                                    ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:677:40: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformer'
     677 |         vc->he_su_ebfer = vif->bss_conf.he_su_beamformer;
         |                                        ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:678:40: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformee'
     678 |         vc->he_su_ebfee = vif->bss_conf.he_su_beamformee;
         |                                        ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:679:40: error: 'struct ieee80211_bss_conf' has no member named 'he_mu_beamformer'
     679 |         vc->he_mu_ebfer = vif->bss_conf.he_mu_beamformer;
         |                                        ^
--
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c: In function 'mt7996_is_ebf_supported':
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1076:45: error: 'struct ieee80211_bss_conf' has no member named 'eht_su_beamformee'
    1076 |                         return vif->bss_conf.eht_su_beamformee &&
         |                                             ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1079:45: error: 'struct ieee80211_bss_conf' has no member named 'eht_su_beamformer'
    1079 |                         return vif->bss_conf.eht_su_beamformer &&
         |                                             ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1087:45: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformee'
    1087 |                         return vif->bss_conf.he_su_beamformee &&
         |                                             ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1090:45: error: 'struct ieee80211_bss_conf' has no member named 'he_su_beamformer'
    1090 |                         return vif->bss_conf.he_su_beamformer &&
         |                                             ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1098:45: error: 'struct ieee80211_bss_conf' has no member named 'vht_su_beamformee'
    1098 |                         return vif->bss_conf.vht_su_beamformee &&
         |                                             ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1101:45: error: 'struct ieee80211_bss_conf' has no member named 'vht_su_beamformer'
    1101 |                         return vif->bss_conf.vht_su_beamformer &&
         |                                             ^
   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c: In function 'mt7996_mcu_sta_rate_ctrl_tlv':
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1586:34: error: 'struct ieee80211_bss_conf' has no member named 'ht_ldpc'
    1586 |                 if (vif->bss_conf.ht_ldpc &&
         |                                  ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1612:34: error: 'struct ieee80211_bss_conf' has no member named 'vht_ldpc'
    1612 |                 if (vif->bss_conf.vht_ldpc &&
         |                                  ^


vim +/ieee80211_chswitch_done +4093 drivers/net/wireless/intel/iwlegacy/common.c

be663ab67077fa drivers/net/wireless/iwlegacy/iwl-core.c Wey-Yi Guy        2011-02-21  4085  
e7392364fcd100 drivers/net/wireless/iwlegacy/common.c   Stanislaw Gruszka 2011-11-15  4086  void
e7392364fcd100 drivers/net/wireless/iwlegacy/common.c   Stanislaw Gruszka 2011-11-15  4087  il_chswitch_done(struct il_priv *il, bool is_success)
be663ab67077fa drivers/net/wireless/iwlegacy/iwl-core.c Wey-Yi Guy        2011-02-21  4088  {
a6766ccdaf9cc8 drivers/net/wireless/iwlegacy/iwl-core.c Stanislaw Gruszka 2011-11-15  4089  	if (test_bit(S_EXIT_PENDING, &il->status))
be663ab67077fa drivers/net/wireless/iwlegacy/iwl-core.c Wey-Yi Guy        2011-02-21  4090  		return;
be663ab67077fa drivers/net/wireless/iwlegacy/iwl-core.c Wey-Yi Guy        2011-02-21  4091  
a6766ccdaf9cc8 drivers/net/wireless/iwlegacy/iwl-core.c Stanislaw Gruszka 2011-11-15  4092  	if (test_and_clear_bit(S_CHANNEL_SWITCH_PENDING, &il->status))
83007196037cc2 drivers/net/wireless/iwlegacy/common.c   Stanislaw Gruszka 2012-02-03 @4093  		ieee80211_chswitch_done(il->vif, is_success);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl-core.c Wey-Yi Guy        2011-02-21  4094  }
e2ebc8337d116a drivers/net/wireless/iwlegacy/iwl-core.c Stanislaw Gruszka 2011-10-24  4095  EXPORT_SYMBOL(il_chswitch_done);
be663ab67077fa drivers/net/wireless/iwlegacy/iwl-core.c Wey-Yi Guy        2011-02-21  4096  

:::::: The code at line 4093 was first introduced by commit
:::::: 83007196037cc2d0bffd9f7afbe56d675779a6cb iwlegacy: get rid of ctx structure

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
