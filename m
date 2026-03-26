Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA2426EAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546433; cv=none; b=hTuGQgrikm+0/5PfJuN69gxwFrAuKLjdOEjiKJ0AIwZ/fvDnOCTNlL2IdOz0EGztYknUVQy2Q9DPh+LGCNqRWLWEHPk1EJQNVEUKj7aJHxtRn9I0WLPuKvpEttRW5fACUN7zb2va9BYuH2gD0vd1i430bUXfz1k7oRy4c8niZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546433; c=relaxed/simple;
	bh=q6vXLbRYJtEyxWWgaXXaa3s0NjDm9ZYKIW0aT/UZHq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h45Zwa3mXOzTw9xbqItLetFjiWxflo4PQY1AHRZzUl2SjvQ49uWY07+wUaNa6xj+t5mGNpA9en29sS/ARkTwDY6aC9PWiijEbe0YJh1EG60Hl9m7VEWfMukm9sE2DfLBnL0Pnkbd1C1q2cCjn3+4TZPTJGnanlcuDj7VMcfZYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAbeq/fQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAbeq/fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774546430; x=1806082430;
  h=date:from:to:cc:subject:message-id;
  bh=q6vXLbRYJtEyxWWgaXXaa3s0NjDm9ZYKIW0aT/UZHq0=;
  b=GAbeq/fQE98NwBwtDzSNxbaX3kIot9EPF/qTYHt939frXX3Nn3q24hcE
   ANMaC+uqJqO+2ySLObXFo8Q8XqAvA16Vbol9Fxd4p8j03v+sCe3dOpKkM
   rApJD6kmQKDorXUTdbaJypGJs68XxAN+hAEGnvZvp+/y2ng+ZivRrxd4y
   ZCJvoVG+mIoiKwsPpqKIETAwLGOdjo04Da2yykvJ/KHn0jVcoRf9Xe3xK
   aMjnolGdHUJYNj1C9GNKGMrzoFORN2culVA2aMwG3IxxsFISCSVj2RRPm
   kXBYZnT0vM1ubz1PQeZKuL7Vsabp/gdB5tGvVyD10PWorWXEFOGcoVNXw
   w==;
X-CSE-ConnectionGUID: 0/DQ/yyISHi5JiIwrBfkrQ==
X-CSE-MsgGUID: vRgEeYzeSIiq6P+DwV3Qwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75727568"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75727568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 10:33:49 -0700
X-CSE-ConnectionGUID: kSonwg4HSV2qlYhTeKwwDw==
X-CSE-MsgGUID: 7uCDXF6uSIm5eNGNLyP3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225326667"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2026 10:33:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5oaW-0000000098l-0oaD;
	Thu, 26 Mar 2026 17:33:44 +0000
Date: Fri, 27 Mar 2026 01:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new_tests 18/25]
 drivers/net/ethernet/mellanox/mlx4/fw.c:1285:17: warning: variable
 'first_port' set but not used
Message-ID: <202603270102.u4R6IkoR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux new_tests
head:   7402f5cc9265ac58854a5e28fa0305bda6f459ab
commit: 9c19f38601eb29dfc08c3db08940f467f48b1d79 [18/25] mellanox: cleanup mlx5_cmd_all_stalled()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260327/202603270102.u4R6IkoR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270102.u4R6IkoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270102.u4R6IkoR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx4/fw.c: In function 'mlx4_QUERY_DEV_CAP_wrapper':
   drivers/net/ethernet/mellanox/mlx4/fw.c:1302:65: error: expected ';' before 'for'
    1302 |         w = bitmap_weight(actv_ports.ports, dev->caps.num_ports)
         |                                                                 ^
         |                                                                 ;
    1303 |         for (slave_port = 0, real_port = first_port;
         |         ~~~                                                      
   drivers/net/ethernet/mellanox/mlx4/fw.c:1319:9: error: implicit declaration of function 'FIELD_MODIFY' [-Wimplicit-function-declaration]
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
   drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:52: error: expected ';' before ')' token
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                                                    ^
         |                                                    ;


vim +/first_port +1285 drivers/net/ethernet/mellanox/mlx4/fw.c

383677da43fa83 Or Gerlitz          2014-12-11  1271  
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1272  int mlx4_QUERY_DEV_CAP_wrapper(struct mlx4_dev *dev, int slave,
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1273  			       struct mlx4_vhcr *vhcr,
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1274  			       struct mlx4_cmd_mailbox *inbox,
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1275  			       struct mlx4_cmd_mailbox *outbox,
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1276  			       struct mlx4_cmd_info *cmd)
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1277  {
2a4fae148cf4b6 Jack Morgenstein    2012-08-03  1278  	u64	flags;
9c19f38601eb29 Yury Norov (NVIDIA  2025-12-07  1279) 	int	w, err = 0;
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1280  	u8	field;
fc31e2560a2443 Or Gerlitz          2015-03-18  1281  	u16	field16;
383677da43fa83 Or Gerlitz          2014-12-11  1282  	u32	bmme_flags, field32;
449fc48866f7d8 Matan Barak         2014-03-19 @1283  	int	real_port;
449fc48866f7d8 Matan Barak         2014-03-19 @1284  	int	slave_port;
449fc48866f7d8 Matan Barak         2014-03-19 @1285  	int	first_port;
449fc48866f7d8 Matan Barak         2014-03-19  1286  	struct mlx4_active_ports actv_ports;
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1287  
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1288  	err = mlx4_cmd_box(dev, 0, outbox->dma, 0, 0, MLX4_CMD_QUERY_DEV_CAP,
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1289  			   MLX4_CMD_TIME_CLASS_A, MLX4_CMD_NATIVE);
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1290  	if (err)
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1291  		return err;
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1292  
d8ae914196d35b Moni Shoua          2016-01-14  1293  	disable_unsupported_roce_caps(outbox->buf);
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1294  	/* add port mng change event capability and disable mw type 1
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1295  	 * unconditionally to slaves
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1296  	 */
2a4fae148cf4b6 Jack Morgenstein    2012-08-03  1297  	MLX4_GET(flags, outbox->buf, QUERY_DEV_CAP_EXT_FLAGS_OFFSET);
2a4fae148cf4b6 Jack Morgenstein    2012-08-03  1298  	flags |= MLX4_DEV_CAP_FLAG_PORT_MNG_CHG_EV;
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1299  	flags &= ~MLX4_DEV_CAP_FLAG_MEM_WINDOW;
449fc48866f7d8 Matan Barak         2014-03-19  1300  	actv_ports = mlx4_get_active_ports(dev, slave);
449fc48866f7d8 Matan Barak         2014-03-19  1301  	first_port = find_first_bit(actv_ports.ports, dev->caps.num_ports);
9c19f38601eb29 Yury Norov (NVIDIA  2025-12-07 @1302) 	w = bitmap_weight(actv_ports.ports, dev->caps.num_ports)
449fc48866f7d8 Matan Barak         2014-03-19  1303  	for (slave_port = 0, real_port = first_port;
9c19f38601eb29 Yury Norov (NVIDIA  2025-12-07  1304) 	     real_port < first_port + w;
449fc48866f7d8 Matan Barak         2014-03-19  1305  	     ++real_port, ++slave_port) {
449fc48866f7d8 Matan Barak         2014-03-19  1306  		if (flags & (MLX4_DEV_CAP_FLAG_WOL_PORT1 << real_port))
449fc48866f7d8 Matan Barak         2014-03-19  1307  			flags |= MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port;
449fc48866f7d8 Matan Barak         2014-03-19  1308  		else
449fc48866f7d8 Matan Barak         2014-03-19  1309  			flags &= ~(MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port);
449fc48866f7d8 Matan Barak         2014-03-19  1310  	}
449fc48866f7d8 Matan Barak         2014-03-19  1311  	for (; slave_port < dev->caps.num_ports; ++slave_port)
449fc48866f7d8 Matan Barak         2014-03-19  1312  		flags &= ~(MLX4_DEV_CAP_FLAG_WOL_PORT1 << slave_port);
802f42a8d99254 Ido Shamay          2015-04-02  1313  
802f42a8d99254 Ido Shamay          2015-04-02  1314  	/* Not exposing RSS IP fragments to guests */
802f42a8d99254 Ido Shamay          2015-04-02  1315  	flags &= ~MLX4_DEV_CAP_FLAG_RSS_IP_FRAG;
2a4fae148cf4b6 Jack Morgenstein    2012-08-03  1316  	MLX4_PUT(outbox->buf, flags, QUERY_DEV_CAP_EXT_FLAGS_OFFSET);
2a4fae148cf4b6 Jack Morgenstein    2012-08-03  1317  
449fc48866f7d8 Matan Barak         2014-03-19  1318  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_VL_PORT_OFFSET);
9c19f38601eb29 Yury Norov (NVIDIA  2025-12-07 @1319) 	FIELD_MODIFY(0x0F, &field, w);
449fc48866f7d8 Matan Barak         2014-03-19  1320  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_VL_PORT_OFFSET);
449fc48866f7d8 Matan Barak         2014-03-19  1321  
30b40c31c2eeaa Amir Vadai          2013-04-25  1322  	/* For guests, disable timestamp */
30b40c31c2eeaa Amir Vadai          2013-04-25  1323  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_CQ_TS_SUPPORT_OFFSET);
30b40c31c2eeaa Amir Vadai          2013-04-25  1324  	field &= 0x7f;
30b40c31c2eeaa Amir Vadai          2013-04-25  1325  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_CQ_TS_SUPPORT_OFFSET);
30b40c31c2eeaa Amir Vadai          2013-04-25  1326  
3742cc65512cd4 Ido Shamay          2015-04-02  1327  	/* For guests, disable vxlan tunneling and QoS support */
57352ef4f5f199 Amir Vadai          2014-03-06  1328  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_VXLAN);
3742cc65512cd4 Ido Shamay          2015-04-02  1329  	field &= 0xd7;
7ffdf726cfe0d1 Or Gerlitz          2013-12-23  1330  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_VXLAN);
7ffdf726cfe0d1 Or Gerlitz          2013-12-23  1331  
51af33cfed248d Ido Shamay          2015-04-02  1332  	/* For guests, disable port BEACON */
51af33cfed248d Ido Shamay          2015-04-02  1333  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_PORT_BEACON_OFFSET);
51af33cfed248d Ido Shamay          2015-04-02  1334  	field &= 0x7f;
51af33cfed248d Ido Shamay          2015-04-02  1335  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_PORT_BEACON_OFFSET);
51af33cfed248d Ido Shamay          2015-04-02  1336  
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1337  	/* For guests, report Blueflame disabled */
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1338  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_BF_OFFSET);
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1339  	field &= 0x7f;
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1340  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_BF_OFFSET);
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1341  
59e14e325066be Moni Shoua          2015-02-03  1342  	/* For guests, disable mw type 2 and port remap*/
57352ef4f5f199 Amir Vadai          2014-03-06  1343  	MLX4_GET(bmme_flags, outbox->buf, QUERY_DEV_CAP_BMME_FLAGS_OFFSET);
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1344  	bmme_flags &= ~MLX4_BMME_FLAG_TYPE_2_WIN;
59e14e325066be Moni Shoua          2015-02-03  1345  	bmme_flags &= ~MLX4_FLAG_PORT_REMAP;
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1346  	MLX4_PUT(outbox->buf, bmme_flags, QUERY_DEV_CAP_BMME_FLAGS_OFFSET);
cc1ade94eeaa23 Shani Michaeli      2013-02-06  1347  
0081c8f3814a83 Jack Morgenstein    2013-03-07  1348  	/* turn off device-managed steering capability if not enabled */
0081c8f3814a83 Jack Morgenstein    2013-03-07  1349  	if (dev->caps.steering_mode != MLX4_STEERING_MODE_DEVICE_MANAGED) {
0081c8f3814a83 Jack Morgenstein    2013-03-07  1350  		MLX4_GET(field, outbox->buf,
0081c8f3814a83 Jack Morgenstein    2013-03-07  1351  			 QUERY_DEV_CAP_FLOW_STEERING_RANGE_EN_OFFSET);
0081c8f3814a83 Jack Morgenstein    2013-03-07  1352  		field &= 0x7f;
0081c8f3814a83 Jack Morgenstein    2013-03-07  1353  		MLX4_PUT(outbox->buf, field,
0081c8f3814a83 Jack Morgenstein    2013-03-07  1354  			 QUERY_DEV_CAP_FLOW_STEERING_RANGE_EN_OFFSET);
0081c8f3814a83 Jack Morgenstein    2013-03-07  1355  	}
4de6580360867d Matan Barak         2013-11-07  1356  
4de6580360867d Matan Barak         2013-11-07  1357  	/* turn off ipoib managed steering for guests */
57352ef4f5f199 Amir Vadai          2014-03-06  1358  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_FLOW_STEERING_IPOIB_OFFSET);
4de6580360867d Matan Barak         2013-11-07  1359  	field &= ~0x80;
4de6580360867d Matan Barak         2013-11-07  1360  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_FLOW_STEERING_IPOIB_OFFSET);
4de6580360867d Matan Barak         2013-11-07  1361  
383677da43fa83 Or Gerlitz          2014-12-11  1362  	/* turn off host side virt features (VST, FSM, etc) for guests */
383677da43fa83 Or Gerlitz          2014-12-11  1363  	MLX4_GET(field32, outbox->buf, QUERY_DEV_CAP_EXT_2_FLAGS_OFFSET);
383677da43fa83 Or Gerlitz          2014-12-11  1364  	field32 &= ~(DEV_CAP_EXT_2_FLAG_VLAN_CONTROL | DEV_CAP_EXT_2_FLAG_80_VFS |
0b131561a7d639 Matan Barak         2015-03-30  1365  		     DEV_CAP_EXT_2_FLAG_FSM | DEV_CAP_EXT_2_FLAG_PFC_COUNTERS);
383677da43fa83 Or Gerlitz          2014-12-11  1366  	MLX4_PUT(outbox->buf, field32, QUERY_DEV_CAP_EXT_2_FLAGS_OFFSET);
383677da43fa83 Or Gerlitz          2014-12-11  1367  
d237baa1cbb3a2 Shani Michaeli      2015-03-05  1368  	/* turn off QCN for guests */
d237baa1cbb3a2 Shani Michaeli      2015-03-05  1369  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_ECN_QCN_VER_OFFSET);
d237baa1cbb3a2 Shani Michaeli      2015-03-05  1370  	field &= 0xfe;
d237baa1cbb3a2 Shani Michaeli      2015-03-05  1371  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_ECN_QCN_VER_OFFSET);
d237baa1cbb3a2 Shani Michaeli      2015-03-05  1372  
fc31e2560a2443 Or Gerlitz          2015-03-18  1373  	/* turn off QP max-rate limiting for guests */
fc31e2560a2443 Or Gerlitz          2015-03-18  1374  	field16 = 0;
fc31e2560a2443 Or Gerlitz          2015-03-18  1375  	MLX4_PUT(outbox->buf, field16, QUERY_DEV_CAP_QP_RATE_LIMIT_NUM_OFFSET);
fc31e2560a2443 Or Gerlitz          2015-03-18  1376  
d019fcb2244519 Ido Shamay          2015-04-02  1377  	/* turn off QoS per VF support for guests */
d019fcb2244519 Ido Shamay          2015-04-02  1378  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_CQ_EQ_CACHE_LINE_STRIDE);
d019fcb2244519 Ido Shamay          2015-04-02  1379  	field &= 0xef;
d019fcb2244519 Ido Shamay          2015-04-02  1380  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_CQ_EQ_CACHE_LINE_STRIDE);
d019fcb2244519 Ido Shamay          2015-04-02  1381  
78500b8c03236a Muhammad Mahajna    2015-04-02  1382  	/* turn off ignore FCS feature for guests */
78500b8c03236a Muhammad Mahajna    2015-04-02  1383  	MLX4_GET(field, outbox->buf, QUERY_DEV_CAP_CONFIG_DEV_OFFSET);
78500b8c03236a Muhammad Mahajna    2015-04-02  1384  	field &= 0xfb;
78500b8c03236a Muhammad Mahajna    2015-04-02  1385  	MLX4_PUT(outbox->buf, field, QUERY_DEV_CAP_CONFIG_DEV_OFFSET);
78500b8c03236a Muhammad Mahajna    2015-04-02  1386  
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1387  	return 0;
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1388  }
b91cb3ebcd5ef8 Jack Morgenstein    2012-05-30  1389  

:::::: The code at line 1285 was first introduced by commit
:::::: 449fc48866f7d84b0d9a19201de18a4dd4d3488c net/mlx4: Adapt code for N-Port VF

:::::: TO: Matan Barak <matanb@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
