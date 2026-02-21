Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78D286D73
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771665543; cv=none; b=R05odTOyocBXo1rok3xlg6IxXicbpFK8ppdoh1kuwvfvRwih4icr/LOTqVy2YH07DTAgXsRh9K8INbphk4uaSLNQabj4zEKcxE8n9B4lCZYQyuluq4GnH7CB6fVDT9FKM+F0jq4bE2qQPxjSziAU/jPwWz9CJ9zTwQ81XrnmB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771665543; c=relaxed/simple;
	bh=wuUlnMe/dS5dma+BQ8Vd/qk6/7aIRDKzYoIorKdUoaw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i8nZPeLRNe/S+rZeyeMbA8r0x3q/dE3vvmzIFMG6pf9GtgHCWnEaLSetG6rX0z8bQPruhK6AkcpOATFYGKb1aZHXgaWw/dcmh7TU58Z2gs/bOgdGE/nnXd2iGLivRLoG/IkAP8ghkqn2lbLji16u4ghvoxwVNT13PnYZ5D4VlZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GntVWxJF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GntVWxJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771665541; x=1803201541;
  h=date:from:to:cc:subject:message-id;
  bh=wuUlnMe/dS5dma+BQ8Vd/qk6/7aIRDKzYoIorKdUoaw=;
  b=GntVWxJFC3hS+r7QqSLmnzqtPVZHaMFy4KWx+05LSnznIjQaNUAGoMaH
   3CBrBa5TPOGTrvJyMewgiyb3aZan7LWA6mV+Dgm2fi67iKyqbeEFG6cZF
   8vFVo6aKQynTSwcYzNmIaD5DGYKwDQNYFkGnCMlqADwxJtVPi5nWQ7IUj
   YpJlbTYcrEyeMvXkYElVIlwsfVj2N5ZYSbsQjsH6dkI8RgEzpwdf6bmhn
   QNJGqCS2nGEIUKTTV8g3Urkqqjhvw1a/S5ZqZ4o/v3G8aGbsbRZh3F+mb
   LxRqepJ4X8BO582TIXXSOGQ+/kIbOs0KBqAtkW7XQjhHeeZbeR9tBfwp5
   g==;
X-CSE-ConnectionGUID: B4kggPahTieG4W34Ydy/uQ==
X-CSE-MsgGUID: 7jd3Bv+5QdGTh9NvK0YQeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76355422"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76355422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 01:19:01 -0800
X-CSE-ConnectionGUID: 2RxWkMNqSpGuXjZyGcjZlA==
X-CSE-MsgGUID: LzEvpQI9Q7+s8mVsNmsKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213563771"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Feb 2026 01:18:59 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtj8a-000000004Nh-45Sw;
	Sat, 21 Feb 2026 09:18:56 +0000
Date: Sat, 21 Feb 2026 10:18:08 +0100
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:for-620 11/15]
 drivers/net/ethernet/mellanox/mlx4/fw.c:1302:65: error: expected ';' before
 'for'
Message-ID: <202602211039.mZY3LiKo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux for-620
head:   3b794289e60f9e1cc26d239bef32c93543213772
commit: 4bbf83126fa61f47dee406fc52f3821146561301 [11/15] mellanox: cleanup mlx5_cmd_all_stalled()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260221/202602211039.mZY3LiKo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211039.mZY3LiKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211039.mZY3LiKo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx4/fw.c: In function 'mlx4_QUERY_DEV_CAP_wrapper':
>> drivers/net/ethernet/mellanox/mlx4/fw.c:1302:65: error: expected ';' before 'for'
    1302 |         w = bitmap_weight(actv_ports.ports, dev->caps.num_ports)
         |                                                                 ^
         |                                                                 ;
    1303 |         for (slave_port = 0, real_port = first_port;
         |         ~~~                                                      
>> drivers/net/ethernet/mellanox/mlx4/fw.c:1319:9: error: implicit declaration of function 'FIELD_MODIFY' [-Wimplicit-function-declaration]
    1319 |         FIELD_MODIFY(0x0F, &field, w);
         |         ^~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx4/fw.c:1285:17: warning: variable 'first_port' set but not used [-Wunused-but-set-variable]
    1285 |         int     first_port;
         |                 ^~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx4/fw.c:1284:17: warning: unused variable 'slave_port' [-Wunused-variable]
    1284 |         int     slave_port;
         |                 ^~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx4/fw.c:1283:17: warning: unused variable 'real_port' [-Wunused-variable]
    1283 |         int     real_port;
         |                 ^~~~~~~~~
--
   drivers/net/ethernet/mellanox/mlx5/core/cmd.c: In function 'mlx5_cmd_all_stalled':
>> drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:19: warning: right-hand operand of comma expression has no effect [-Wunused-value]
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                   ^
>> drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:52: error: expected ';' before ')' token
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                                                    ^
         |                                                    ;


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
> 1283		int	real_port;
> 1284		int	slave_port;
> 1285		int	first_port;
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
