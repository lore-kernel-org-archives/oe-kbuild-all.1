Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262D2309AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774042986; cv=none; b=WwrCUeRkueyvU/blHhGsOrn7zxwWXSwk7NHVC7UkN7GZFKDZnvet5WYUzbCILkvMmr5Ep2AFU2vJeL22uyC3umDKq0EHhoJ2ngHsPWAlAdahG6e5zNLD/aZ/CpmJaHhgtoy3osNPWNSLY5H9kZ7PgUY6klivFWJipHFVmhFbxDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774042986; c=relaxed/simple;
	bh=tkCZEYmYxuIw67Xuh3qRbQeYYEjpgICl9+KUiRbokXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TwoSv4L6V2phPccPQ7z678L/oVFHTnVOM2lvWn91lSLq59D3aBqVX63nNqgi+gbjAe9Q4FXMHA8TvYZeO28Up52U0K6s6BwoOJAkQ6OIIjcI1DgBWjngPy74OZCXpYU4P44WTdK2bd+C4TKQdc9a2NDSsjoo2UNJLjWtk1ofNkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nttPLFAq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nttPLFAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774042985; x=1805578985;
  h=date:from:to:cc:subject:message-id;
  bh=tkCZEYmYxuIw67Xuh3qRbQeYYEjpgICl9+KUiRbokXc=;
  b=nttPLFAq42y7aJSOq4abfZHY6Lev1dClpudnO4lXMYbXh5yuf8Xvv4DA
   dXLOXhJEkZI28RB/oFL8dEJqEfCwhIoI+i7+eN2EtyG1XWZMIZ/RKeguG
   7fWwQ71cv4733GRDPq3NV/+q/G27QG++Yk/KFH4BTOvRigrzhOakoYVLw
   jfAo5Q3a1JTOmA+uh7cscgb7cROkoSdsEqSqCfzvqmzjT+STRM0Fcc+5L
   RJI2WCFhKghPiCPXB3D4x3tGNvb5EPL3+4COStNmcKz3UxFJ0VnjgNiS5
   cYOZ1muW3pkPlRulLwOpk8wdlkvtMAjkaAq01ajMUrj7Oa2x+kpcS5k2R
   A==;
X-CSE-ConnectionGUID: 4aQHxccWRJ+nsNYjGajctQ==
X-CSE-MsgGUID: O5MS1immR469zEvElrRlJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74838083"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74838083"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:43:05 -0700
X-CSE-ConnectionGUID: T0PogehnRpOB4SjSD+uKHA==
X-CSE-MsgGUID: 21KoAma9T2SmwLeTBPRZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="253894601"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2026 14:43:03 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3hcT-000000000Fg-16gw;
	Fri, 20 Mar 2026 21:43:01 +0000
Date: Sat, 21 Mar 2026 05:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new_tests 18/25]
 drivers/net/ethernet/mellanox/mlx4/fw.c:1302:58: error: expected ';' after
 expression
Message-ID: <202603210545.iBzNOFVW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux new_tests
head:   7402f5cc9265ac58854a5e28fa0305bda6f459ab
commit: 9c19f38601eb29dfc08c3db08940f467f48b1d79 [18/25] mellanox: cleanup mlx5_cmd_all_stalled()
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260321/202603210545.iBzNOFVW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210545.iBzNOFVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210545.iBzNOFVW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx4/fw.c:1302:58: error: expected ';' after expression
    1302 |         w = bitmap_weight(actv_ports.ports, dev->caps.num_ports)
         |                                                                 ^
         |                                                                 ;
>> drivers/net/ethernet/mellanox/mlx4/fw.c:1319:2: error: call to undeclared function 'FIELD_MODIFY'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1319 |         FIELD_MODIFY(0x0F, &field, w);
         |         ^
   2 errors generated.
--
>> drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:45: error: expected ';' in 'for' statement specifier
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                                                    ^
   drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:16: warning: expression result unused [-Wunused-value]
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                     ~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1302 drivers/net/ethernet/mellanox/mlx4/fw.c

  1271	
  1272	int mlx4_QUERY_DEV_CAP_wrapper(struct mlx4_dev *dev, int slave,
  1273				       struct mlx4_vhcr *vhcr,
  1274				       struct mlx4_cmd_mailbox *inbox,
  1275				       struct mlx4_cmd_mailbox *outbox,
  1276				       struct mlx4_cmd_info *cmd)
  1277	{
  1278		u64	flags;
  1279		int	w, err = 0;
  1280		u8	field;
  1281		u16	field16;
  1282		u32	bmme_flags, field32;
  1283		int	real_port;
  1284		int	slave_port;
  1285		int	first_port;
  1286		struct mlx4_active_ports actv_ports;
  1287	
  1288		err = mlx4_cmd_box(dev, 0, outbox->dma, 0, 0, MLX4_CMD_QUERY_DEV_CAP,
  1289				   MLX4_CMD_TIME_CLASS_A, MLX4_CMD_NATIVE);
  1290		if (err)
  1291			return err;
  1292	
  1293		disable_unsupported_roce_caps(outbox->buf);
  1294		/* add port mng change event capability and disable mw type 1
  1295		 * unconditionally to slaves
  1296		 */
  1297		MLX4_GET(flags, outbox->buf, QUERY_DEV_CAP_EXT_FLAGS_OFFSET);
  1298		flags |= MLX4_DEV_CAP_FLAG_PORT_MNG_CHG_EV;
  1299		flags &= ~MLX4_DEV_CAP_FLAG_MEM_WINDOW;
  1300		actv_ports = mlx4_get_active_ports(dev, slave);
  1301		first_port = find_first_bit(actv_ports.ports, dev->caps.num_ports);
> 1302		w = bitmap_weight(actv_ports.ports, dev->caps.num_ports)
  1303		for (slave_port = 0, real_port = first_port;
  1304		     real_port < first_port + w;
  1305		     ++real_port, ++slave_port) {
  1306			if (flags & (MLX4_DEV_CAP_FLAG_WOL_PORT1 << real_port))
  1307				flags |= MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port;
  1308			else
  1309				flags &= ~(MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port);
  1310		}
  1311		for (; slave_port < dev->caps.num_ports; ++slave_port)
  1312			flags &= ~(MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port);
  1313	
  1314		/* Not exposing RSS IP fragments to guests */
  1315		flags &= ~MLX4_DEV_CAP_FLAG_RSS_IP_FRAG;
  1316		MLX4_PUT(outbox->buf, flags, QUERY_DEV_CAP_EXT_FLAGS_OFFSET);
  1317	
  1318		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_VL_PORT_OFFSET);
> 1319		FIELD_MODIFY(0x0F, &field, w);
  1320		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_VL_PORT_OFFSET);
  1321	
  1322		/* For guests, disable timestamp */
  1323		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_CQ_TS_SUPPORT_OFFSET);
  1324		field &= 0x7f;
  1325		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_CQ_TS_SUPPORT_OFFSET);
  1326	
  1327		/* For guests, disable vxlan tunneling and QoS support */
  1328		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_VXLAN);
  1329		field &= 0xd7;
  1330		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_VXLAN);
  1331	
  1332		/* For guests, disable port BEACON */
  1333		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_PORT_BEACON_OFFSET);
  1334		field &= 0x7f;
  1335		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_PORT_BEACON_OFFSET);
  1336	
  1337		/* For guests, report Blueflame disabled */
  1338		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_BF_OFFSET);
  1339		field &= 0x7f;
  1340		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_BF_OFFSET);
  1341	
  1342		/* For guests, disable mw type 2 and port remap*/
  1343		MLX4_GET(bmme_flags, outbox->buf, QUERY_DEV_CAP_BMME_FLAGS_OFFSET);
  1344		bmme_flags &= ~MLX4_BMME_FLAG_TYPE_2_WIN;
  1345		bmme_flags &= ~MLX4_FLAG_PORT_REMAP;
  1346		MLX4_PUT(outbox->buf, bmme_flags, QUERY_DEV_CAP_BMME_FLAGS_OFFSET);
  1347	
  1348		/* turn off device-managed steering capability if not enabled */
  1349		if (dev->caps.steering_mode != MLX4_STEERING_MODE_DEVICE_MANAGED) {
  1350			MLX4_GET(field, outbox->buf,
  1351				 QUERY_DEV_CAP_FLOW_STEERING_RANGE_EN_OFFSET);
  1352			field &= 0x7f;
  1353			MLX4_PUT(outbox->buf, field,
  1354				 QUERY_DEV_CAP_FLOW_STEERING_RANGE_EN_OFFSET);
  1355		}
  1356	
  1357		/* turn off ipoib managed steering for guests */
  1358		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_FLOW_STEERING_IPOIB_OFFSET);
  1359		field &= ~0x80;
  1360		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_FLOW_STEERING_IPOIB_OFFSET);
  1361	
  1362		/* turn off host side virt features (VST, FSM, etc) for guests */
  1363		MLX4_GET(field32, outbox->buf, QUERY_DEV_CAP_EXT_2_FLAGS_OFFSET);
  1364		field32 &= ~(DEV_CAP_EXT_2_FLAG_VLAN_CONTROL | DEV_CAP_EXT_2_FLAG_80_VFS |
  1365			     DEV_CAP_EXT_2_FLAG_FSM | DEV_CAP_EXT_2_FLAG_PFC_COUNTERS);
  1366		MLX4_PUT(outbox->buf, field32, QUERY_DEV_CAP_EXT_2_FLAGS_OFFSET);
  1367	
  1368		/* turn off QCN for guests */
  1369		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_ECN_QCN_VER_OFFSET);
  1370		field &= 0xfe;
  1371		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_ECN_QCN_VER_OFFSET);
  1372	
  1373		/* turn off QP max-rate limiting for guests */
  1374		field16 = 0;
  1375		MLX4_PUT(outbox->buf, field16, QUERY_DEV_CAP_QP_RATE_LIMIT_NUM_OFFSET);
  1376	
  1377		/* turn off QoS per VF support for guests */
  1378		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_CQ_EQ_CACHE_LINE_STRIDE);
  1379		field &= 0xef;
  1380		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_CQ_EQ_CACHE_LINE_STRIDE);
  1381	
  1382		/* turn off ignore FCS feature for guests */
  1383		MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_CONFIG_DEV_OFFSET);
  1384		field &= 0xfb;
  1385		MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_CONFIG_DEV_OFFSET);
  1386	
  1387		return 0;
  1388	}
  1389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
