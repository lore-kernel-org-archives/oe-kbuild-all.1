Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D616191A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335985; cv=none; b=bvnxCJs4/I4YfpQ4awyhnnzpW5OsV+bPtiqO8ZdRhPl4FxjE9nOzlWpyriy7YqmGV0NMt3eyLKFzCYV0GDtDlaqWyvqC43qyf6zNo3491MaeguTgq4IffwqyqvdmHwy3qh/3JwenzBehDfAFLPoSlv8SmX0FOwkU21ymkuQTyp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335985; c=relaxed/simple;
	bh=3f7Bbzj3oSVgQSkXUtRuDMel97UP+sjN6nBQcgzlo3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCokX05AzZLpkd9oKjlfLHMsDQN0Z511H7G2TO0SFMQBGLQQy6iAm6ze6/fucKXn0DF4CQeIyPBjIutjnxPsM3QHoDSu28n8pQ8GN6+VnQdsLQVTJY6AW6h1xWqUeAP8FvVh6UzjXnG1r7B9qF4E3cCp/SQP9VUDyeAfGtDwN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfCriQIo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfCriQIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715335983; x=1746871983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3f7Bbzj3oSVgQSkXUtRuDMel97UP+sjN6nBQcgzlo3E=;
  b=VfCriQIoDeb2OzpXNQ6pyAJP994M1E3p6xtkCAgcNTIZ0fwAAJvrKuqg
   HioVDOHNUHSHfVfTt/0tSmBRsvUJMVBSoWuPJUJO9/UV1A0uJIwU8t+oW
   +65k0C9W+jpaoV8+g6BtRREwLo3vLachVvGhDZmirFBxXWAsUmWWXdAS+
   Px1CjWO6O38U901cebiDmoEsvNArhxrmKEVTISBcQSTJMahnK4yzmcdpe
   Vvp+z1xGzSSuT7Lg5QQTFec9MDwXmhWqWj6Pw6tVBS3O+CBSZ2AvWc/ra
   upjkqaKFwvhvIEfoDMdFCysKKfilSiVHDqzXomR+DFH+Eay9/mmgGurjC
   Q==;
X-CSE-ConnectionGUID: JdqSGqiaTxieea6fwCKkog==
X-CSE-MsgGUID: O9tpmcLGRiuxI/dnc9VLcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28819683"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="28819683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:13:02 -0700
X-CSE-ConnectionGUID: Yivxpj3/QTeN60r0JIFqmw==
X-CSE-MsgGUID: L3MuvlXeTxCA+US9/bYQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="29673713"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2024 03:13:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5NFJ-0005z1-3C;
	Fri, 10 May 2024 10:12:58 +0000
Date: Fri, 10 May 2024 18:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 19/78] drivers/hid/hid-himax.c:1503:31:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202405101837.GMengcbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cd87d14c5c4cc74e7c89677acb4aa9c804165fc7
commit: 93b5f11579164ec89aa5a835098b2725d2e79901 [19/78] CHROMIUM: HID: hid-himax: Load firmware directly from file to IC
config: arm64-randconfig-r113-20240510 (https://download.01.org/0day-ci/archive/20240510/202405101837.GMengcbv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240510/202405101837.GMengcbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101837.GMengcbv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hid/hid-himax.c:312:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:312:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:312:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:379:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:379:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:379:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:555:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:555:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:555:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:563:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:595:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:595:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:595:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:597:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:597:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:597:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:647:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:647:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:647:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:695:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:695:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:695:30: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:712:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:712:36: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:712:36: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:749:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:749:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:749:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:765:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:765:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:765:30: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:821:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1078:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1078:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1078:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1092:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1092:20: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:1092:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1099:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1099:20: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:1099:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1121:21: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1203:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1203:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1203:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1210:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:1210:22: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:1210:22: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1211:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:1211:22: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:1211:22: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1224:13: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1236:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1244:39: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1370:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:1370:57: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1370:57: sparse:     got unsigned int [usertype] *[assigned] word
   drivers/hid/hid-himax.c:1372:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:1372:61: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1372:61: sparse:     got unsigned int [usertype] *[assigned] word
>> drivers/hid/hid-himax.c:1503:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 const [usertype] *p @@     got unsigned short [usertype] * @@
   drivers/hid/hid-himax.c:1503:31: sparse:     expected restricted __be16 const [usertype] *p
   drivers/hid/hid-himax.c:1503:31: sparse:     got unsigned short [usertype] *
   drivers/hid/hid-himax.c:1504:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 const [usertype] *p @@     got unsigned short [usertype] * @@
   drivers/hid/hid-himax.c:1504:31: sparse:     expected restricted __be16 const [usertype] *p
   drivers/hid/hid-himax.c:1504:31: sparse:     got unsigned short [usertype] *
   drivers/hid/hid-himax.c:1589:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1589:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1589:26: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:1700:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1700:44: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1700:44: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1701:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1701:41: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1701:41: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1708:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1708:52: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1708:52: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1709:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1709:49: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1709:49: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1710:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1710:50: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1710:50: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1764:60: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1764:60: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1764:60: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1833:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1833:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1833:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:2444:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2446:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2448:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2450:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2452:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2454:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2456:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2458:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2460:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2462:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:2528:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:2528:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:2528:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:2530:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:2530:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:2530:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c: note: in included file (through include/drm/drm_panel.h, drivers/hid/hid-himax.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1503 drivers/hid/hid-himax.c

  1452	
  1453	/**
  1454	 * himax_mcu_tp_info_check() - Read touch information from touch chip
  1455	 * @ts: Himax touch screen data
  1456	 *
  1457	 * This function is used to read the touch information from the touch chip. The
  1458	 * information includes the touch resolution, touch point number, interrupt type,
  1459	 * button number, stylus function, stylus version, and stylus ratio. These information
  1460	 * is filled by FW after the FW initialized, so it must be called after FW finish
  1461	 * loading.
  1462	 *
  1463	 * Return: 0 on success, negative error code on failure
  1464	 */
  1465	static int himax_mcu_tp_info_check(struct himax_ts_data *ts)
  1466	{
  1467		int ret;
  1468		char data[HIMAX_REG_SZ];
  1469		u8 stylus_ratio;
  1470		u32 button_num;
  1471		u32 max_pt;
  1472		u32 rx_num;
  1473		u32 tx_num;
  1474		u32 x_res;
  1475		u32 y_res;
  1476		const u32 button_num_mask = 0x03;
  1477		const u32 interrupt_type_mask = 0x01;
  1478		const u32 interrupt_type_edge = 0x01;
  1479		bool int_is_edge;
  1480		bool stylus_func;
  1481		bool stylus_id_v2;
  1482	
  1483		ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_RXNUM_TXNUM, data, 4);
  1484		if (ret < 0) {
  1485			dev_err(ts->dev, "%s: read rx/tx num fail\n", __func__);
  1486			return ret;
  1487		}
  1488		rx_num = data[2];
  1489		tx_num = data[3];
  1490	
  1491		ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_MAXPT_XYRVS, data, 4);
  1492		if (ret < 0) {
  1493			dev_err(ts->dev, "%s: read max touch point fail\n", __func__);
  1494			return ret;
  1495		}
  1496		max_pt = data[0];
  1497	
  1498		ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_X_Y_RES, data, 4);
  1499		if (ret < 0) {
  1500			dev_err(ts->dev, "%s: read x/y resolution fail\n", __func__);
  1501			return ret;
  1502		}
> 1503		y_res = be16_to_cpup((u16 *)&data[0]);
  1504		x_res = be16_to_cpup((u16 *)&data[2]);
  1505	
  1506		ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_INT_IS_EDGE, data, 4);
  1507		if (ret < 0) {
  1508			dev_err(ts->dev, "%s: read interrupt type fail\n", __func__);
  1509			return ret;
  1510		}
  1511		if ((data[1] & interrupt_type_mask) == interrupt_type_edge)
  1512			int_is_edge = true;
  1513		else
  1514			int_is_edge = false;
  1515	
  1516		ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_MKEY, data, 4);
  1517		if (ret < 0) {
  1518			dev_err(ts->dev, "%s: read button number fail\n", __func__);
  1519			return ret;
  1520		}
  1521		button_num = data[0] & button_num_mask;
  1522	
  1523		ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_STYLUS_FUNCTION, data, 4);
  1524		if (ret < 0) {
  1525			dev_err(ts->dev, "%s: read stylus function fail\n", __func__);
  1526			return ret;
  1527		}
  1528		stylus_func = data[3] ? true : false;
  1529	
  1530		if (stylus_func) {
  1531			ret = himax_mcu_register_read(ts, HIMAX_DSRAM_ADDR_STYLUS_VERSION, data, 4);
  1532			if (ret < 0) {
  1533				dev_err(ts->dev, "%s: read stylus version fail\n", __func__);
  1534				return ret;
  1535			}
  1536			/* dsram_addr_stylus_version + 2 : 0=off 1=on */
  1537			stylus_id_v2 = data[2] ? true : false;
  1538			/* dsram_addr_stylus_version + 3 : 0=ratio_1 10=ratio_10 */
  1539			stylus_ratio = data[3];
  1540		}
  1541	
  1542		ts->ic_data.button_num = button_num;
  1543		ts->ic_data.stylus_function = stylus_func;
  1544		ts->ic_data.rx_num = rx_num;
  1545		ts->ic_data.tx_num = tx_num;
  1546		ts->ic_data.x_res = x_res;
  1547		ts->ic_data.y_res = y_res;
  1548		ts->ic_data.max_point = max_pt;
  1549		ts->ic_data.interrupt_is_edge = int_is_edge;
  1550		if (stylus_func) {
  1551			ts->ic_data.stylus_v2 = stylus_id_v2;
  1552			ts->ic_data.stylus_ratio = stylus_ratio;
  1553		} else {
  1554			ts->ic_data.stylus_v2 = false;
  1555			ts->ic_data.stylus_ratio = 0;
  1556		}
  1557	
  1558		dev_info(ts->dev, "%s: rx_num = %u, tx_num = %u\n", __func__,
  1559			 ts->ic_data.rx_num, ts->ic_data.tx_num);
  1560		dev_info(ts->dev, "%s: max_point = %u\n", __func__, ts->ic_data.max_point);
  1561		dev_info(ts->dev, "%s: interrupt_is_edge = %s, stylus_function = %s\n", __func__,
  1562			 ts->ic_data.interrupt_is_edge ? "true" : "false",
  1563			 ts->ic_data.stylus_function ? "true" : "false");
  1564		dev_info(ts->dev, "%s: stylus_v2 = %s, stylus_ratio = %u\n", __func__,
  1565			 ts->ic_data.stylus_v2 ? "true" : "false", ts->ic_data.stylus_ratio);
  1566		dev_info(ts->dev, "%s: TOUCH INFO updated\n", __func__);
  1567	
  1568		return 0;
  1569	}
  1570	
  1571	/**
  1572	 * himax_disable_fw_reload() - Disable the FW reload data from flash
  1573	 * @ts: Himax touch screen data
  1574	 *
  1575	 * This function is used to tell FW not to reload data from flash. It needs to be
  1576	 * set before FW start running.
  1577	 *
  1578	 * return: 0 on success, negative error code on failure
  1579	 */
  1580	static int himax_disable_fw_reload(struct himax_ts_data *ts)
  1581	{
  1582		union himax_dword_data data = {
  1583			/*
  1584			 * HIMAX_DSRAM_ADDR_FLASH_RELOAD: 0x10007f00
  1585			 * 0x10007f00 <= 0x9aa9, let FW know there's no flash
  1586			 *	      <= 0x5aa5, there has flash, but not reload
  1587			 *	      <= 0x0000, there has flash, and reload
  1588			 */
  1589			.dword = cpu_to_le32(HIMAX_DSRAM_DATA_DISABLE_FLASH_RELOAD)
  1590		};
  1591	
  1592		/* Disable Flash Reload */
  1593		return himax_mcu_register_write(ts, HIMAX_DSRAM_ADDR_FLASH_RELOAD, data.byte, 4);
  1594	}
  1595	
  1596	/**
  1597	 * himax_sram_write_crc_check() - Write the data to SRAM and check the CRC by hardware
  1598	 * @ts: Himax touch screen data
  1599	 * @addr: Address to write to
  1600	 * @data: Data to write
  1601	 * @len: Length of data
  1602	 *
  1603	 * This function is use to write FW code/data to SRAM and check the CRC by hardware to make
  1604	 * sure the written data is correct. The FW code is designed to be CRC result 0, so if the
  1605	 * CRC result is not 0, it means the written data is not correct.
  1606	 *
  1607	 * return: 0 on success, negative error code on failure
  1608	 */
  1609	static int himax_sram_write_crc_check(struct himax_ts_data *ts, u32 addr, const u8 *data, u32 len)
  1610	{
  1611		int ret;
  1612		u32 crc;
  1613		u32 retry_cnt;
  1614		const u32 retry_limit = 3;
  1615	
  1616		for (retry_cnt = 0; retry_cnt < retry_limit; retry_cnt++) {
  1617			dev_info(ts->dev, "%s: Write FW to SRAM - total write size = %u\n", __func__, len);
  1618			ret = himax_mcu_register_write(ts, addr, data, len);
  1619			if (ret) {
  1620				dev_err(ts->dev, "%s: write FW to SRAM fail\n", __func__);
  1621				return ret;
  1622			}
  1623			ret = himax_mcu_check_crc(ts, addr, len, &crc);
  1624			if (ret) {
  1625				dev_err(ts->dev, "%s: check CRC fail\n", __func__);
  1626				return ret;
  1627			}
  1628			dev_info(ts->dev, "%s: HW CRC %s in %u time\n", __func__,
  1629				 crc == 0 ? "OK" : "Fail", retry_cnt);
  1630	
  1631			if (crc == 0)
  1632				break;
  1633		}
  1634	
  1635		if (crc != 0) {
  1636			dev_err(ts->dev, "%s: HW CRC fail\n", __func__);
  1637			return -EINVAL;
  1638		}
  1639	
  1640		return 0;
  1641	}
  1642	
  1643	/**
  1644	 * himax_zf_part_info() - Get and write the partition from the firmware to SRAM
  1645	 * @fw: Firmware data
  1646	 * @ts: Himax touch screen data
  1647	 *
  1648	 * This function is used to get the partition information from the firmware and write
  1649	 * the partition to SRAM. The partition information includes the DSRAM address, the
  1650	 * firmware offset, and the write size. The function will get the partition information
  1651	 * into a table, and then write the partition to SRAM according to the table. After
  1652	 * writing the partition to SRAM, the function will check the CRC by hardware to make
  1653	 * sure the written data is correct.
  1654	 *
  1655	 * return: 0 on success, negative error code on failure
  1656	 */
  1657	static int himax_zf_part_info(const struct firmware *fw, struct himax_ts_data *ts)
  1658	{
  1659		int i;
  1660		int i_max = -1;
  1661		int i_min = -1;
  1662		int pnum;
  1663		int ret;
  1664		u8 buf[HIMAX_ZF_PARTITION_DESC_SZ];
  1665		u32 cfg_crc_sw;
  1666		u32 cfg_crc_hw;
  1667		u32 cfg_sz;
  1668		u32 dsram_base = 0xffffffff;
  1669		u32 dsram_max = 0;
  1670		u32 retry_cnt = 0;
  1671		u32 sram_min;
  1672		const u32 retry_limit = 3;
  1673		const u32 table_addr = ts->fw_info_table.addr_cfg_table;
  1674		struct himax_zf_info *info;
  1675	
  1676		/* 1. initial check */
  1677		ret = hx83102j_en_hw_crc(ts, true);
  1678		if (ret < 0) {
  1679			dev_err(ts->dev, "%s: Failed to enable HW CRC\n", __func__);
  1680			return ret;
  1681		}
  1682		pnum = fw->data[table_addr + HIMAX_ZF_PARTITION_AMOUNT_OFFSET];
  1683		if (pnum < 2) {
  1684			dev_err(ts->dev, "%s: partition number is not correct\n", __func__);
  1685			return -EINVAL;
  1686		}
  1687	
  1688		info = kcalloc(pnum, sizeof(struct himax_zf_info), GFP_KERNEL);
  1689		if (!info)
  1690			return -ENOMEM;
  1691	
  1692		memset(info, 0, pnum * sizeof(struct himax_zf_info));
  1693	
  1694		/*
  1695		 * 2. record partition information:
  1696		 * partition 0: FW main code
  1697		 */
  1698		memcpy(buf, &fw->data[table_addr], HIMAX_ZF_PARTITION_DESC_SZ);
  1699		memcpy(info[0].sram_addr, buf, 4);
> 1700		info[0].write_size = le32_to_cpup((u32 *)&buf[4]);
  1701		info[0].fw_addr = le32_to_cpup((u32 *)&buf[8]);
  1702	
  1703		/* partition 1 ~ n: config data */
  1704		for (i = 1; i < pnum; i++) {
  1705			memcpy(buf, &fw->data[i * HIMAX_ZF_PARTITION_DESC_SZ + table_addr],
  1706			       HIMAX_ZF_PARTITION_DESC_SZ);
  1707			memcpy(info[i].sram_addr, buf, 4);
  1708			info[i].write_size = le32_to_cpup((u32 *)&buf[4]);
  1709			info[i].fw_addr = le32_to_cpup((u32 *)&buf[8]);
  1710			info[i].cfg_addr = le32_to_cpup((u32 *)&info[i].sram_addr[0]);
  1711	
  1712			/* Write address must be multiple of 4 */
  1713			if (info[i].cfg_addr % 4 != 0) {
  1714				info[i].cfg_addr -= (info[i].cfg_addr % 4);
  1715				info[i].fw_addr -= (info[i].cfg_addr % 4);
  1716				info[i].write_size += (info[i].cfg_addr % 4);
  1717			}
  1718	
  1719			if (dsram_base > info[i].cfg_addr) {
  1720				dsram_base = info[i].cfg_addr;
  1721				i_min = i;
  1722			}
  1723			if (dsram_max < info[i].cfg_addr) {
  1724				dsram_max = info[i].cfg_addr;
  1725				i_max = i;
  1726			}
  1727		}
  1728	
  1729		if (i_min < 0 || i_max < 0) {
  1730			dev_err(ts->dev, "%s: DSRAM address invalid!\n", __func__);
  1731			return -EINVAL;
  1732		}
  1733	
  1734		/* 3. prepare data to update */
  1735		sram_min = info[i_min].cfg_addr;
  1736	
  1737		cfg_sz = (dsram_max - dsram_base) + info[i_max].write_size;
  1738		/* Wrtie size must be multiple of 4 */
  1739		if (cfg_sz % 4 != 0)
  1740			cfg_sz = cfg_sz + 4 - (cfg_sz % 4);
  1741	
  1742		dev_info(ts->dev, "%s: main code sz = %d, config sz = %d\n", __func__,
  1743			 info[0].write_size, cfg_sz);
  1744		/* config size should be smaller than DSRAM size */
  1745		if (cfg_sz > ts->chip_max_dsram_size) {
  1746			dev_err(ts->dev, "%s: config size error[%d, %u]!!\n", __func__,
  1747				cfg_sz, ts->chip_max_dsram_size);
  1748			ret = -EINVAL;
  1749			goto alloc_cfg_buffer_failed;
  1750		}
  1751	
  1752		memset(ts->zf_update_cfg_buffer, 0x00,
  1753		       ts->chip_max_dsram_size * sizeof(u8));
  1754	
  1755		/* Collect all partition in FW for DSRAM in a cfg buffer */
  1756		for (i = 1; i < pnum; i++)
  1757			memcpy(&ts->zf_update_cfg_buffer[info[i].cfg_addr - dsram_base],
  1758			       &fw->data[info[i].fw_addr], info[i].write_size);
  1759	
  1760		/*
  1761		 * 4. write to sram
  1762		 * First, write FW main code and check CRC by HW
  1763		 */
  1764		ret = himax_sram_write_crc_check(ts, le32_to_cpup((u32 *)info[0].sram_addr),
  1765						 &fw->data[info[0].fw_addr], info[0].write_size);
  1766		if (ret < 0) {
  1767			dev_err(ts->dev, "%s: HW CRC fail\n", __func__);
  1768			goto write_main_code_failed;
  1769		}
  1770	
  1771		/*
  1772		 * Second, FW config data: Calculate CRC of CFG data which is going to write.
  1773		 * CFG data don't have CRC pre-defined in FW and need to be calculated by driver.
  1774		 */
  1775		cfg_crc_sw = himax_mcu_calculate_crc(ts->zf_update_cfg_buffer, cfg_sz);
  1776		for (retry_cnt = 0; retry_cnt < retry_limit; retry_cnt++) {
  1777			/* Write hole cfg data to DSRAM */
  1778			dev_info(ts->dev, "%s: Write cfg to SRAM - total write size = %d\n",
  1779				 __func__, cfg_sz);
  1780			ret = himax_mcu_register_write(ts, sram_min, ts->zf_update_cfg_buffer, cfg_sz);
  1781			if (ret < 0) {
  1782				dev_err(ts->dev, "%s: write cfg to SRAM fail\n", __func__);
  1783				goto write_cfg_failed;
  1784			}
  1785			/*
  1786			 * Check CRC: Tell HW to calculate CRC from CFG start address in SRAM and check
  1787			 * size is equal to size of CFG buffer written. Then we compare the two CRC data
  1788			 * make sure data written is correct.
  1789			 */
  1790			ret = himax_mcu_check_crc(ts, sram_min, cfg_sz, &cfg_crc_hw);
  1791			if (ret) {
  1792				dev_err(ts->dev, "%s: check CRC failed!\n", __func__);
  1793				goto crc_failed;
  1794			}
  1795	
  1796			if (cfg_crc_hw != cfg_crc_sw)
  1797				dev_err(ts->dev, "%s: Cfg CRC FAIL, HWCRC = %X, SWCRC = %X, retry = %u\n",
  1798					__func__, cfg_crc_hw, cfg_crc_sw, retry_cnt);
  1799			else
  1800				break;
  1801		}
  1802	
  1803		if (retry_cnt == retry_limit && cfg_crc_hw != cfg_crc_sw) {
  1804			dev_err(ts->dev, "%s: Write cfg to SRAM fail\n", __func__);
  1805			ret = -EINVAL;
  1806			goto crc_not_match;
  1807		}
  1808	
  1809	crc_not_match:
  1810	crc_failed:
  1811	write_cfg_failed:
  1812	write_main_code_failed:
  1813	alloc_cfg_buffer_failed:
  1814		kfree(info);
  1815	
  1816		return ret;
  1817	}
  1818	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
