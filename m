Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294346;
	b=4Pc+KnwRj7TX5U6mHKzRcw+NnV91fx27PXYgcyy9nEqtCluCuaF5AqzB94PMkbUr7HVh
	 mQFXXNau5ITwa670toF6lUKEWs4aEnStRCXQs006x2rZL98sMJ4jPvr1G+4rJrBZj7fPl
	 kvXCuZevgfnYPtyJOef9rTXosncxmS4RMjxSGCnKrlzgf9niYqM8LszucS8eNksH3PzyT
	 J5hlWq+JIMri5cDl7KZ/++hRxmt9O7rrqlB7C2JmxLxoMlrCDsFTe+de00OPsYitH4CAA
	 /frkpnpVD4c0gss0IOo5kf3l8y8x3WBRe28moOudR+/XbK0HYJruKhhmQFWlelObMew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294346;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IYx7c/lVQLyrhZCxY0WEU0yZKrgWyvJfmlL0wKPtIyg=;
	b=ZrReeL0LU4LP2uyHGgkN7rVtrhNhTRQkTR0mRNyB5stLJIEK5yCadZVL7V4I/Zh1iyGJ
	 NAHWQFknjz+HSt9aUNVbgb88n+C3136dJ8Ffmr8eU3gKhYtEKw+5yZHHsEzemxTfBLkgY
	 7gt5CqJcwFha+usQkM4Ff7sglbiOcKH7vZmzpH3JEEtyjsGfM7Vt0W/PoAR4k6JgYUzXK
	 +WrZ1TCo4WfD7W7inzgQd2hbylNPNrbPNIXmzMNEjhuHRHGCEJga9WdHxEth/kSXSSXHk
	 K/nL91C6LqeUc4TkFC6pJ7anG36jZ0JJI2e5wVrExFsYzw1v7tSwhyBCYHsby8odc6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVOOnyHa;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C8606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 17:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZVOOnyHa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793294344; x=1824830344;
  h=date:from:to:cc:subject:message-id;
  bh=KiQkE5nIGrSWch+6EGAweNRJv70vzZCnBPvux0pIkuo=;
  b=ZVOOnyHadouT1Z4zGIQc/NpVB5wT4y8ClgdNb0Tql6xTy4QszEcVzHNu
   pdSKTIFfTFUHtjZ47RVpn29n0GzsBXfTGQ1QANa0lKVZ7HFqT9QUPt3Ny
   ljdmOhkg9pMqjftHySwY8nkN4VgkJLnIK1a6kOKj4s/ZAsybCPdAm+iJi
   UymfXdHULo2qSLlnWd02TNlOJbUP6y6tqv1NgjyPjgqZh8MfFm7giMCD7
   G2NB4DAz/bbm8FBSy4+JyRsmBd2w+ceZeeOYQV+giGk5XqOD/SUTMl469
   IfyMF9rkowH4xekEJrxG2eo7whIPY9HS+/ChiE3hR1B5+vfXqMuHd38vj
   g==;
X-CSE-ConnectionGUID: WUyL4jc+R+mPJUDQfjMihw==
X-CSE-MsgGUID: 2qz7VUsoSXWKLFUvjddCtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2061068"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2061068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 10:19:03 -0700
X-CSE-ConnectionGUID: 4gk7znIKSCS8YbImHlCcQQ==
X-CSE-MsgGUID: Zm9PQEx8TMakVIXnaT4WAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5343133"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2026 10:19:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMTmD-000000005Ih-1byJ;
	Thu, 29 Oct 2026 17:18:57 +0000
Date: Thu, 29 Oct 2026 18:18:40 +0100
From: kernel test robot <lkp@intel.com>
To: Fangzhi Zuo <jerry.zuo@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
Subject: [linux-next:master 20504/21094]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1345
 compute_mst_dsc_configs_for_link() warn: inconsistent indenting
Message-ID: <202610291839.2viLErYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39c950806213f6861d00f90729acaaa21f2d95a
commit: e2bd5d908a89252ad4ee11a3dbc9fd57c257accd [20504/21094] drm/amd/display: Cap DSC bpp for USB4 DP tunnels
config: microblaze-randconfig-r2202-20261028 (https://download.01.org/0day-ci/archive/20261029/202610291839.2viLErYt-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291839.2viLErYt-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:1345 compute_mst_dsc_configs_for_link() warn: inconsistent indenting

vim +1345 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c

  1316	
  1317	static int compute_mst_dsc_configs_for_link(struct drm_atomic_commit *state,
  1318						    struct dc_state *dc_state,
  1319						    struct dc_link *dc_link,
  1320						    struct dsc_mst_fairness_vars *vars,
  1321						    struct drm_dp_mst_topology_mgr *mgr,
  1322						    int *link_vars_start_index)
  1323	{
  1324		struct dc_stream_state *stream;
  1325		struct dsc_mst_fairness_params params[MAX_PIPES];
  1326		struct amdgpu_dm_connector *aconnector;
  1327		struct drm_dp_mst_topology_state *mst_state = drm_atomic_get_mst_topology_state(state, mgr);
  1328		int count = 0;
  1329		int i, k, ret;
  1330		bool debugfs_overwrite = false;
  1331		uint16_t fec_overhead_multiplier_x1000 = get_fec_overhead_multiplier(dc_link);
  1332		struct drm_connector_state *new_conn_state;
  1333		bool is_frl_endpoint_present;
  1334		uint32_t frl_conv_bw_in_kbps, frl_conv_dsc_bw_in_kbps;
  1335	
  1336		memset(params, 0, sizeof(params));
  1337	
  1338		if (IS_ERR(mst_state))
  1339			return PTR_ERR(mst_state);
  1340	
  1341		/* Set up params */
  1342		DRM_DEBUG_DRIVER("%s: MST_DSC Try to set up params from %d streams\n", __func__, dc_state->stream_count);
  1343		for (i = 0; i < dc_state->stream_count; i++) {
  1344			struct dc_dsc_policy dsc_policy = {0};
> 1345				u32 min_target_bpp_x16;
  1346				u32 max_target_bpp_x16;
  1347	
  1348			stream = dc_state->streams[i];
  1349	
  1350			if (stream->link != dc_link)
  1351				continue;
  1352	
  1353			aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
  1354			if (!aconnector)
  1355				continue;
  1356	
  1357			if (!aconnector->mst_output_port)
  1358				continue;
  1359	
  1360			new_conn_state = drm_atomic_get_new_connector_state(state, &aconnector->base);
  1361	
  1362			if (!new_conn_state) {
  1363				DRM_DEBUG_DRIVER("%s:%d MST_DSC Skip the stream 0x%p with invalid new_conn_state\n",
  1364						__func__, __LINE__, stream);
  1365				continue;
  1366			}
  1367	
  1368			stream->timing.flags.DSC = 0;
  1369	
  1370			params[count].timing = &stream->timing;
  1371			params[count].sink = stream->sink;
  1372			params[count].aconnector = aconnector;
  1373			params[count].port = aconnector->mst_output_port;
  1374			params[count].clock_force_enable = aconnector->dsc_settings.dsc_force_enable;
  1375			if (params[count].clock_force_enable == DSC_CLK_FORCE_ENABLE)
  1376				debugfs_overwrite = true;
  1377			params[count].num_slices_h = aconnector->dsc_settings.dsc_num_slices_h;
  1378			params[count].num_slices_v = aconnector->dsc_settings.dsc_num_slices_v;
  1379			params[count].bpp_overwrite = aconnector->dsc_settings.dsc_bits_per_pixel;
  1380			params[count].compression_possible = stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported;
  1381			if (params[count].compression_possible &&
  1382			    dc_link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
  1383			    dc_link->dpia_bw_alloc_config.bw_alloc_enabled)
  1384				params[count].clock_force_enable = DSC_CLK_FORCE_ENABLE;
  1385	
  1386			dc_dsc_get_policy_for_timing(params[count].timing, 0, &dsc_policy, dc_link_get_highest_encoding_format(stream->link));
  1387			min_target_bpp_x16 = dsc_policy.min_target_bpp * 16;
  1388			max_target_bpp_x16 = dsc_policy.max_target_bpp * 16;
  1389			if (dc_link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
  1390				max_target_bpp_x16 = min_t(u32, max_target_bpp_x16, 8 * 16);
  1391				if (dc_link->dpia_bw_alloc_config.bw_alloc_enabled)
  1392					max_target_bpp_x16 = min_target_bpp_x16;
  1393			}
  1394			is_frl_endpoint_present = get_conv_frl_bw(aconnector, &frl_conv_bw_in_kbps, &frl_conv_dsc_bw_in_kbps);
  1395			if (stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported &&
  1396					is_frl_endpoint_present &&
  1397					frl_conv_dsc_bw_in_kbps &&
  1398					stream->sink->dsc_caps.dsc_dec_caps.is_frl)
  1399				build_frl_mst_dsc_params(aconnector, stream, &dsc_policy, &params[count], frl_conv_dsc_bw_in_kbps);
  1400			if (!dc_dsc_compute_bandwidth_range(
  1401					stream->sink->ctx->dc->res_pool->dscs[0],
  1402					stream->sink->ctx->dc->debug.dsc_min_slice_height_override,
  1403					min_target_bpp_x16,
  1404					max_target_bpp_x16,
  1405					&stream->sink->dsc_caps.dsc_dec_caps,
  1406					&stream->timing,
  1407					dc_link_get_highest_encoding_format(dc_link),
  1408					&params[count].bw_range))
  1409				params[count].bw_range.stream_kbps = dc_bandwidth_in_kbps_from_timing(&stream->timing,
  1410						dc_link_get_highest_encoding_format(dc_link));
  1411	
  1412			DRM_DEBUG_DRIVER("MST_DSC #%d stream 0x%p - max_kbps = %u, min_kbps = %u, uncompressed_kbps = %u\n",
  1413				count, stream, params[count].bw_range.max_kbps, params[count].bw_range.min_kbps,
  1414				params[count].bw_range.stream_kbps);
  1415			count++;
  1416		}
  1417	
  1418		DRM_DEBUG_DRIVER("%s: MST_DSC Params set up for %d streams\n", __func__, count);
  1419	
  1420		if (count == 0) {
  1421			ASSERT(0);
  1422			return 0;
  1423		}
  1424	
  1425		/* k is start index of vars for current phy link used by mst hub */
  1426		k = *link_vars_start_index;
  1427		/* set vars start index for next mst hub phy link */
  1428		*link_vars_start_index += count;
  1429	
  1430		/* Try no compression */
  1431		DRM_DEBUG_DRIVER("MST_DSC Try no compression\n");
  1432		for (i = 0; i < count; i++) {
  1433			vars[i + k].aconnector = params[i].aconnector;
  1434			vars[i + k].pbn = kbps_to_peak_pbn(params[i].bw_range.stream_kbps, fec_overhead_multiplier_x1000);
  1435			vars[i + k].dsc_enabled = false;
  1436			vars[i + k].bpp_x16 = 0;
  1437			ret = drm_dp_atomic_find_time_slots(state, params[i].port->mgr, params[i].port,
  1438							    vars[i + k].pbn);
  1439			if (ret < 0)
  1440				return ret;
  1441		}
  1442		ret = drm_dp_mst_atomic_check(state);
  1443		if (ret == 0 && !debugfs_overwrite) {
  1444			set_dsc_configs_from_fairness_vars(params, vars, count, k);
  1445			return 0;
  1446		} else if (ret != -ENOSPC) {
  1447			return ret;
  1448		}
  1449	
  1450		log_dsc_params(count, vars, k);
  1451	
  1452		/* Try max compression */
  1453		DRM_DEBUG_DRIVER("MST_DSC Try max compression\n");
  1454		for (i = 0; i < count; i++) {
  1455			if (params[i].compression_possible && params[i].clock_force_enable != DSC_CLK_FORCE_DISABLE) {
  1456				vars[i + k].pbn = kbps_to_peak_pbn(params[i].bw_range.min_kbps, fec_overhead_multiplier_x1000);
  1457				vars[i + k].dsc_enabled = true;
  1458				vars[i + k].bpp_x16 = params[i].bw_range.min_target_bpp_x16;
  1459				ret = drm_dp_atomic_find_time_slots(state, params[i].port->mgr,
  1460								    params[i].port, vars[i + k].pbn);
  1461				if (ret < 0)
  1462					return ret;
  1463			} else {
  1464				vars[i + k].pbn = kbps_to_peak_pbn(params[i].bw_range.stream_kbps, fec_overhead_multiplier_x1000);
  1465				vars[i + k].dsc_enabled = false;
  1466				vars[i + k].bpp_x16 = 0;
  1467				ret = drm_dp_atomic_find_time_slots(state, params[i].port->mgr,
  1468								    params[i].port, vars[i + k].pbn);
  1469				if (ret < 0)
  1470					return ret;
  1471			}
  1472		}
  1473		ret = drm_dp_mst_atomic_check(state);
  1474		if (ret != 0)
  1475			return ret;
  1476	
  1477		log_dsc_params(count, vars, k);
  1478	
  1479		/* Optimize degree of compression */
  1480		DRM_DEBUG_DRIVER("MST_DSC Try optimize compression\n");
  1481		ret = increase_dsc_bpp(state, mst_state, dc_link, params, vars, count, k);
  1482		if (ret < 0) {
  1483			DRM_DEBUG_DRIVER("MST_DSC Failed to optimize compression\n");
  1484			return ret;
  1485		}
  1486	
  1487		log_dsc_params(count, vars, k);
  1488	
  1489		DRM_DEBUG_DRIVER("MST_DSC Try disable compression\n");
  1490		ret = try_disable_dsc(state, dc_link, params, vars, count, k);
  1491		if (ret < 0) {
  1492			DRM_DEBUG_DRIVER("MST_DSC Failed to disable compression\n");
  1493			return ret;
  1494		}
  1495	
  1496		log_dsc_params(count, vars, k);
  1497	
  1498		set_dsc_configs_from_fairness_vars(params, vars, count, k);
  1499	
  1500		return 0;
  1501	}
  1502	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
