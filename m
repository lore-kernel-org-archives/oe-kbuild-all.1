Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C35260578
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105211; cv=none; b=K0yx0VmZqky9xIbwyWHESxWoA5zJi3DyZgRDNyMCiJqFLMwmENpWWP4aCXg3epr4NFZ95GOyAVSx1KFH1/ZEwtwHXm7BX6qZqy5z/rFn00slA0h79TIk3xqLlygfA3cALAJOnJyf989GUO3FHNGf+K1Z3DGwnu6gLPxR2rVsVxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105211; c=relaxed/simple;
	bh=V0ARqjCdmX+vD6993MnseD44STYmKhynxkLMLPaFsQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ndaHYsgxF5O068dnxuL0lbCwc7mjXPttwAm9xgSvO+H/RhqJy/zcmq7WQu+AKaXJ4bk01Mxl2vVFQP6Pny1gJeLRWAJUcvj9XFaciyAO/F/F5e74wT+k1KvMJ2zhBmaa41wJr0VRG5EX5mljfbyk5la+dJhb2mVO+1zRG6xcETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWpwTi3B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWpwTi3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760105210; x=1791641210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V0ARqjCdmX+vD6993MnseD44STYmKhynxkLMLPaFsQg=;
  b=YWpwTi3B4mRdxt1D/WPL2ps6PmzIEUOLAa3uEh3nYjVnifuYbBeQnen0
   L5CZ/daCAEYHK/24FHY1SRANM3prEDoWsO7fDvhUPsLNjW3aYfWFxZGpf
   ewYt3t4ONb60np3HhBW6j0ElzRKvIBN79JV5GgUzCGzQSfpRqEKnpr/eG
   iDGcuKb7Mz8W3qNdg6tfGsWwSArGRbXBjeADCQv/KZJfaSYbf7Pck2PTp
   a3yOyePI54X9k7xgnBj8PB+onICHa7GdCNbjNQA/fLnwvQijm+ueEjIyQ
   gEc3LNeQm1rVFW5qIZnw8aEVzlc88Qv26kvfZV8jlK9ulNIY7O6kx24C9
   g==;
X-CSE-ConnectionGUID: kV7OLwFfQH+msl6pTjV80g==
X-CSE-MsgGUID: T733drp/QsihqoXiQ+4VfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61357336"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="61357336"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 07:06:47 -0700
X-CSE-ConnectionGUID: d/02EpBkQfCidCRnSagU1A==
X-CSE-MsgGUID: 8Jk5OhsrTgSqRTxhikv5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180938517"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 07:06:46 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Dlc-0002pv-0i;
	Fri, 10 Oct 2025 14:06:44 +0000
Date: Fri, 10 Oct 2025 22:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 0/1]
 drivers/net/wireless/st/cw1200/sta.c:1292:41: sparse: sparse: incompatible
 types in comparison expression (different type sizes):
Message-ID: <202510102259.QpWAGrNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   cdcb3f81dc05bd42f88ca759416912fdf53b03ec
commit: 6381da82e23abf0ba5f09531ec4a974e80e83cc6 [0/1] wifi: cw1200: cap SSID length in cw1200_do_join()
config: x86_64-randconfig-122-20251010 (https://download.01.org/0day-ci/archive/20251010/202510102259.QpWAGrNW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102259.QpWAGrNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102259.QpWAGrNW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/st/cw1200/sta.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/preempt.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/wireless/st/cw1200/sta.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/wireless/st/cw1200/sta.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/wireless/st/cw1200/sta.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/net/inet_sock.h, ...):
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/net/wireless/st/cw1200/sta.c:1292:41: sparse: sparse: incompatible types in comparison expression (different type sizes):
   drivers/net/wireless/st/cw1200/sta.c:1292:41: sparse:    unsigned char const *
   drivers/net/wireless/st/cw1200/sta.c:1292:41: sparse:    int *

vim +1292 drivers/net/wireless/st/cw1200/sta.c

  1202	
  1203	/* MUST be called with tx_lock held!  It will be unlocked for us. */
  1204	static void cw1200_do_join(struct cw1200_common *priv)
  1205	{
  1206		const u8 *bssid;
  1207		struct ieee80211_bss_conf *conf = &priv->vif->bss_conf;
  1208		struct cfg80211_bss *bss = NULL;
  1209		struct wsm_protected_mgmt_policy mgmt_policy;
  1210		struct wsm_join join = {
  1211			.mode = conf->ibss_joined ?
  1212					WSM_JOIN_MODE_IBSS : WSM_JOIN_MODE_BSS,
  1213			.preamble_type = WSM_JOIN_PREAMBLE_LONG,
  1214			.probe_for_join = 1,
  1215			.atim_window = 0,
  1216			.basic_rate_set = cw1200_rate_mask_to_wsm(priv,
  1217								  conf->basic_rates),
  1218		};
  1219		if (delayed_work_pending(&priv->join_timeout)) {
  1220			pr_warn("[STA] - Join request already pending, skipping..\n");
  1221			wsm_unlock_tx(priv);
  1222			return;
  1223		}
  1224	
  1225		if (priv->join_status)
  1226			cw1200_do_unjoin(priv);
  1227	
  1228		bssid = priv->vif->bss_conf.bssid;
  1229	
  1230		bss = cfg80211_get_bss(priv->hw->wiphy, priv->channel, bssid, NULL, 0,
  1231				       IEEE80211_BSS_TYPE_ANY, IEEE80211_PRIVACY_ANY);
  1232	
  1233		if (!bss && !conf->ibss_joined) {
  1234			wsm_unlock_tx(priv);
  1235			return;
  1236		}
  1237	
  1238		mutex_lock(&priv->conf_mutex);
  1239	
  1240		/* Under the conf lock: check scan status and
  1241		 * bail out if it is in progress.
  1242		 */
  1243		if (atomic_read(&priv->scan.in_progress)) {
  1244			wsm_unlock_tx(priv);
  1245			goto done_put;
  1246		}
  1247	
  1248		priv->join_pending = true;
  1249	
  1250		/* Sanity check basic rates */
  1251		if (!join.basic_rate_set)
  1252			join.basic_rate_set = 7;
  1253	
  1254		/* Sanity check beacon interval */
  1255		if (!priv->beacon_int)
  1256			priv->beacon_int = 1;
  1257	
  1258		join.beacon_interval = priv->beacon_int;
  1259	
  1260		/* BT Coex related changes */
  1261		if (priv->bt_present) {
  1262			if (((priv->conf_listen_interval * 100) %
  1263			     priv->beacon_int) == 0)
  1264				priv->listen_interval =
  1265					((priv->conf_listen_interval * 100) /
  1266					 priv->beacon_int);
  1267			else
  1268				priv->listen_interval =
  1269					((priv->conf_listen_interval * 100) /
  1270					 priv->beacon_int + 1);
  1271		}
  1272	
  1273		if (priv->hw->conf.ps_dtim_period)
  1274			priv->join_dtim_period = priv->hw->conf.ps_dtim_period;
  1275		join.dtim_period = priv->join_dtim_period;
  1276	
  1277		join.channel_number = priv->channel->hw_value;
  1278		join.band = (priv->channel->band == NL80211_BAND_5GHZ) ?
  1279			WSM_PHY_BAND_5G : WSM_PHY_BAND_2_4G;
  1280	
  1281		memcpy(join.bssid, bssid, sizeof(join.bssid));
  1282	
  1283		pr_debug("[STA] Join BSSID: %pM DTIM: %d, interval: %d\n",
  1284			 join.bssid,
  1285			 join.dtim_period, priv->beacon_int);
  1286	
  1287		if (!conf->ibss_joined) {
  1288			const u8 *ssidie;
  1289			rcu_read_lock();
  1290			ssidie = ieee80211_bss_get_ie(bss, WLAN_EID_SSID);
  1291			if (ssidie) {
> 1292				join.ssid_len = min(ssidie[1], IEEE80211_MAX_SSID_LEN);
  1293				memcpy(join.ssid, &ssidie[2], join.ssid_len);
  1294			}
  1295			rcu_read_unlock();
  1296		}
  1297	
  1298		if (priv->vif->p2p) {
  1299			join.flags |= WSM_JOIN_FLAGS_P2P_GO;
  1300			join.basic_rate_set =
  1301				cw1200_rate_mask_to_wsm(priv, 0xFF0);
  1302		}
  1303	
  1304		/* Enable asynchronous join calls */
  1305		if (!conf->ibss_joined) {
  1306			join.flags |= WSM_JOIN_FLAGS_FORCE;
  1307			join.flags |= WSM_JOIN_FLAGS_FORCE_WITH_COMPLETE_IND;
  1308		}
  1309	
  1310		wsm_flush_tx(priv);
  1311	
  1312		/* Stay Awake for Join and Auth Timeouts and a bit more */
  1313		cw1200_pm_stay_awake(&priv->pm_state,
  1314				     CW1200_JOIN_TIMEOUT + CW1200_AUTH_TIMEOUT);
  1315	
  1316		cw1200_update_listening(priv, false);
  1317	
  1318		/* Turn on Block ACKs */
  1319		wsm_set_block_ack_policy(priv, priv->ba_tx_tid_mask,
  1320					 priv->ba_rx_tid_mask);
  1321	
  1322		/* Set up timeout */
  1323		if (join.flags & WSM_JOIN_FLAGS_FORCE_WITH_COMPLETE_IND) {
  1324			priv->join_status = CW1200_JOIN_STATUS_JOINING;
  1325			queue_delayed_work(priv->workqueue,
  1326					   &priv->join_timeout,
  1327					   CW1200_JOIN_TIMEOUT);
  1328		}
  1329	
  1330		/* 802.11w protected mgmt frames */
  1331		mgmt_policy.protectedMgmtEnable = 0;
  1332		mgmt_policy.unprotectedMgmtFramesAllowed = 1;
  1333		mgmt_policy.encryptionForAuthFrame = 1;
  1334		wsm_set_protected_mgmt_policy(priv, &mgmt_policy);
  1335	
  1336		/* Perform actual join */
  1337		if (wsm_join(priv, &join)) {
  1338			pr_err("[STA] cw1200_join_work: wsm_join failed!\n");
  1339			cancel_delayed_work_sync(&priv->join_timeout);
  1340			cw1200_update_listening(priv, priv->listening);
  1341			/* Tx lock still held, unjoin will clear it. */
  1342			if (queue_work(priv->workqueue, &priv->unjoin_work) <= 0)
  1343				wsm_unlock_tx(priv);
  1344		} else {
  1345			if (!(join.flags & WSM_JOIN_FLAGS_FORCE_WITH_COMPLETE_IND))
  1346				cw1200_join_complete(priv); /* Will clear tx_lock */
  1347	
  1348			/* Upload keys */
  1349			cw1200_upload_keys(priv);
  1350	
  1351			/* Due to beacon filtering it is possible that the
  1352			 * AP's beacon is not known for the mac80211 stack.
  1353			 * Disable filtering temporary to make sure the stack
  1354			 * receives at least one
  1355			 */
  1356			priv->disable_beacon_filter = true;
  1357		}
  1358		cw1200_update_filtering(priv);
  1359	
  1360	done_put:
  1361		mutex_unlock(&priv->conf_mutex);
  1362		if (bss)
  1363			cfg80211_put_bss(priv->hw->wiphy, bss);
  1364	}
  1365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
