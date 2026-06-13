Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3152D0C62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781363929; cv=none; b=mgC+e9gidJC5VIYyoo0Af/hV1E1SE/rp2+TmX5oexT5QMHTcYvdwsyrXpGSeFiEN1JvjtKacaJhWOiFj07uhKy2vpqZtxqhi76z4wrg6niIs3tsf7G0k9O/9rXcdo/t1Id8i/WhhyR+h+YkdpwmxYyMWxrmV/NkiyFGJM6B8/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781363929; c=relaxed/simple;
	bh=nbcGzsz1zmcuZEPZLlhW/JxvT0sthauhEoVApkXqHtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jC/yZe67QSohTK9aBIRoSSmxAPlshxYG5t6/s00lHM6zyc73ySZtnLEPYZv2UE6Ll33KxVmVRmItY+q2fqvVmMF90SEKp3aaedVC09Mt10ZYH2bRzNbhWTa3KIVbOK5Hs5iKoEP0qdSqqbmzshx3/BQEJt7Mb9/ZDJJwzL2v/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb1chQJm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb1chQJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781363928; x=1812899928;
  h=date:from:to:cc:subject:message-id;
  bh=nbcGzsz1zmcuZEPZLlhW/JxvT0sthauhEoVApkXqHtk=;
  b=Lb1chQJmgtz5P6zt9JuuDvg/Xwx6tQAVOHDpr4YHeBdv7RpqDcDPDoiU
   gmhCYnNbOGlk8OoxYlUXLhrRapzWLYqNsE2Xu8tvPzzmJYPAv198ujVQt
   Iqu7m5pdWFesgpI0p9o3qALCril3s1rAKHpHqfvyeQYDjrOj0HTIwGfmf
   HRWpPJyyabncTZ2O1dTY165WwBlGKQGqfxlI09Yxhsktqsc/249Mo++4z
   /dEXnvG71BqkXVvI+lKWG/G4nJRG59F+mi6u98jZ6/rjdmGyNkpKK9EFh
   Dan1SNDQ17/VZnjvqa6lZXj48gZvDkceKRovSnt0/t4ClLtzhd7LyI3DO
   w==;
X-CSE-ConnectionGUID: wXs7NDtJRpqBBNgQZV8udA==
X-CSE-MsgGUID: xX/G55LIQh+Xn+CoD8ry8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="81185225"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81185225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 08:18:45 -0700
X-CSE-ConnectionGUID: d9s35dfyTr+7qX9+Uh1fmg==
X-CSE-MsgGUID: ajSAgfqSSFOuRGB3YT1uzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="242926917"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2026 08:18:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYQ88-00000000PzU-3SnT;
	Sat, 13 Jun 2026 15:18:40 +0000
Date: Sat, 13 Jun 2026 23:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_unified_fs_V4 12/34]
 drivers/firmware/arm_scmi/telemetry.c:1220:34: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202606132356.LgvuF947-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: 3c8dd1213221c291f213a119bd82a635a1f390e9 [12/34] firmware: arm_scmi: Add support to parse SHMTIs areas
config: arc-randconfig-r132-20260613 (https://download.01.org/0day-ci/archive/20260613/202606132356.LgvuF947-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132356.LgvuF947-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132356.LgvuF947-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:1854:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct scmi_telemetry_res_info * @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1854:16: sparse:     expected struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:1854:16: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:545:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:545:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:545:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:619:48: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:620:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:621:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:622:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:623:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:661:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:661:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:661:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:684:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:689:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:690:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:804:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:804:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:804:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:918:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:918:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:918:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:942:28: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:972:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 const @@
   drivers/firmware/arm_scmi/telemetry.c:972:56: sparse:     expected unsigned int
   drivers/firmware/arm_scmi/telemetry.c:972:56: sparse:     got restricted __le32 const
   drivers/firmware/arm_scmi/telemetry.c:1009:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1009:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1009:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:1220:34: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/firmware/arm_scmi/telemetry.c:1297:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1297:62: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1297:62: sparse:     got struct payload *payld
>> drivers/firmware/arm_scmi/telemetry.c:1333:44: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/telemetry.c:1333:44: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/telemetry.c:1333:44: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/telemetry.c:1333:44: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/telemetry.c:1333:44: sparse: sparse: cast to restricted __le32
>> drivers/firmware/arm_scmi/telemetry.c:1333:44: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/telemetry.c:1335:63: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload [noderef] __iomem *payld @@     got struct payload *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1335:63: sparse:     expected struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1335:63: sparse:     got struct payload *payld
>> drivers/firmware/arm_scmi/telemetry.c:1373:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1373:50: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1373:50: sparse:     got struct payload [noderef] __iomem *payld
>> drivers/firmware/arm_scmi/telemetry.c:1388:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *next @@     got unsigned char [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1388:14: sparse:     expected void *next
   drivers/firmware/arm_scmi/telemetry.c:1388:14: sparse:     got unsigned char [noderef] __iomem *
>> drivers/firmware/arm_scmi/telemetry.c:1390:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1390:21: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1390:21: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1444:65: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct payload *payld @@     got struct payload [noderef] __iomem *payld @@
   drivers/firmware/arm_scmi/telemetry.c:1444:65: sparse:     expected struct payload *payld
   drivers/firmware/arm_scmi/telemetry.c:1444:65: sparse:     got struct payload [noderef] __iomem *payld
   drivers/firmware/arm_scmi/telemetry.c:1581:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1605:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1605:29: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1605:29: sparse:     got void [noderef] __iomem *
>> drivers/firmware/arm_scmi/telemetry.c:1605:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg [noderef] __iomem *eplg @@     got struct eplg *_eplg @@
   drivers/firmware/arm_scmi/telemetry.c:1605:27: sparse:     expected struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:1605:27: sparse:     got struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1606:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1606:48: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1642:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1646:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 [usertype] v @@     got unsigned int @@
   drivers/firmware/arm_scmi/telemetry.c:1646:17: sparse:     expected restricted __le32 [usertype] v
   drivers/firmware/arm_scmi/telemetry.c:1646:17: sparse:     got unsigned int
   drivers/firmware/arm_scmi/telemetry.c:1658:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1722:55: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/firmware/arm_scmi/telemetry.c:1731:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1731:24: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1731:24: sparse:     got void [noderef] __iomem *
   drivers/firmware/arm_scmi/telemetry.c:1823:35: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct scmi_telemetry_res_info [noderef] * @@     got struct scmi_telemetry_res_info * @@
   drivers/firmware/arm_scmi/telemetry.c:1823:35: sparse:     expected struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1823:35: sparse:     got struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:1831:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1831:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1831:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1880:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1880:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1880:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1079:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1079:20: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1079:20: sparse:     got void [noderef] __iomem *
>> drivers/firmware/arm_scmi/telemetry.c:1303:40: sparse: sparse: non size-preserving pointer to integer cast
   drivers/firmware/arm_scmi/telemetry.c:1341:40: sparse: sparse: non size-preserving pointer to integer cast

vim +/__iomem +1220 drivers/firmware/arm_scmi/telemetry.c

  1212	
  1213	static void scmi_telemetry_blkts_update(struct telemetry_info *ti, u32 magic,
  1214						struct telemetry_block_ts *bts)
  1215	{
  1216		guard(mutex)(&bts->line.mtx);
  1217	
  1218		if (bts->line.last_magic != magic) {
  1219			bts->last_ts = BLK_TS_STAMP(&bts->line.payld->blk_tsl);
> 1220			bts->last_rate = BLK_TS_RATE(bts->line.payld);
  1221			/* BLK_TS clock rate value can change ONLY here on creation */
  1222			if (!bts->last_rate)
  1223				bts->last_rate = ti->default_blk_ts_rate;
  1224			bts->line.last_magic = magic;
  1225		}
  1226	}
  1227	
  1228	static void scmi_telemetry_line_put(struct telemetry_line *line, void *blob)
  1229	{
  1230		if (refcount_dec_and_test(&line->users)) {
  1231			scoped_guard(mutex, &line->mtx)
  1232				xa_erase(line->xa_lines, (unsigned long)line->payld);
  1233			kfree(blob);
  1234		}
  1235	}
  1236	
  1237	static void scmi_telemetry_blkts_unlink(struct telemetry_de *tde)
  1238	{
  1239		scmi_telemetry_line_put(&tde->bts->line, tde->bts);
  1240		tde->bts = NULL;
  1241	}
  1242	
  1243	static void scmi_telemetry_uuid_unlink(struct telemetry_de *tde)
  1244	{
  1245		scmi_telemetry_line_put(&tde->uuid->line, tde->uuid);
  1246		tde->uuid = NULL;
  1247	}
  1248	
  1249	static void scmi_telemetry_de_unlink(struct scmi_telemetry_de *de)
  1250	{
  1251		struct telemetry_de *tde = to_tde(de);
  1252	
  1253		/* Unlink all related lines triggering their deallocation */
  1254		if (tde->bts)
  1255			scmi_telemetry_blkts_unlink(tde);
  1256		if (tde->uuid)
  1257			scmi_telemetry_uuid_unlink(tde);
  1258	}
  1259	
  1260	static struct telemetry_line *
  1261	scmi_telemetry_line_get(struct xarray *xa_lines, struct payload *payld)
  1262	{
  1263		struct telemetry_line *line;
  1264	
  1265		line = xa_load(xa_lines, (unsigned long)payld);
  1266		if (!line)
  1267			return NULL;
  1268	
  1269		refcount_inc(&line->users);
  1270	
  1271		return line;
  1272	}
  1273	
  1274	static int
  1275	scmi_telemetry_line_init(struct telemetry_line *line, struct xarray *xa_lines,
  1276				 struct payload __iomem *payld)
  1277	{
  1278		refcount_set(&line->users, 1);
  1279		line->payld = payld;
  1280		line->xa_lines = xa_lines;
  1281		mutex_init(&line->mtx);
  1282	
  1283		return xa_insert(xa_lines, (unsigned long)payld, line, GFP_KERNEL);
  1284	}
  1285	
  1286	static struct telemetry_block_ts *
  1287	scmi_telemetry_blkts_create(struct device *dev, struct xarray *xa_lines,
  1288				    struct payload *payld)
  1289	{
  1290		struct telemetry_block_ts *bts;
  1291		int ret;
  1292	
  1293		bts = kzalloc_obj(*bts);
  1294		if (!bts)
  1295			return NULL;
  1296	
> 1297		ret = scmi_telemetry_line_init(&bts->line, xa_lines, payld);
  1298		if (ret) {
  1299			kfree(bts);
  1300			return NULL;
  1301		}
  1302	
> 1303		trace_scmi_tlm_collect(0, (u64)payld, 0, "SHMTI_NEW_BLKTS");
  1304	
  1305		return bts;
  1306	}
  1307	
  1308	static struct telemetry_block_ts *
  1309	scmi_telemetry_blkts_get_or_create(struct device *dev, struct xarray *xa_lines,
  1310					   struct payload *payld)
  1311	{
  1312		struct telemetry_line *line;
  1313	
  1314		line = scmi_telemetry_line_get(xa_lines, payld);
  1315		if (line)
  1316			return to_blkts(line);
  1317	
  1318		return scmi_telemetry_blkts_create(dev, xa_lines, payld);
  1319	}
  1320	
  1321	static struct telemetry_uuid *
  1322	scmi_telemetry_uuid_create(struct device *dev, struct xarray *xa_lines,
  1323				   struct payload *payld)
  1324	{
  1325		struct telemetry_uuid *uuid;
  1326		int ret;
  1327	
  1328		uuid = kzalloc_obj(*uuid);
  1329		if (!uuid)
  1330			return NULL;
  1331	
  1332		for (int i = 0; i < SCMI_TLM_DE_IMPL_MAX_DWORDS; i++)
> 1333			uuid->de_impl_version[i] = le32_to_cpu(payld->uuid_l.dwords[i]);
  1334	
> 1335		ret = scmi_telemetry_line_init(&uuid->line, xa_lines, payld);
  1336		if (ret) {
  1337			kfree(uuid);
  1338			return NULL;
  1339		}
  1340	
  1341		trace_scmi_tlm_collect(0, (u64)payld, 0, "SHMTI_NEW_UUID");
  1342	
  1343		return uuid;
  1344	}
  1345	
  1346	static struct telemetry_uuid *
  1347	scmi_telemetry_uuid_get_or_create(struct device *dev, struct xarray *xa_lines,
  1348					  struct payload *payld)
  1349	{
  1350		struct telemetry_line *line;
  1351	
  1352		line = scmi_telemetry_line_get(xa_lines, payld);
  1353		if (line)
  1354			return to_uuid(line);
  1355	
  1356		return scmi_telemetry_uuid_create(dev, xa_lines, payld);
  1357	}
  1358	
  1359	static void scmi_telemetry_tdcf_uuid_parse(struct telemetry_info *ti,
  1360						   struct payload __iomem *payld,
  1361						   struct telemetry_shmti *shmti,
  1362						   void **active_uuid)
  1363	{
  1364		struct telemetry_uuid *uuid;
  1365	
  1366		if (UUID_INVALID(payld)) {
  1367			trace_scmi_tlm_access(0, "UUID_INVALID", 0, 0);
  1368			return;
  1369		}
  1370	
  1371		/* A UUID descriptor MUST be returned: it is found or it is created */
  1372		uuid = scmi_telemetry_uuid_get_or_create(ti->ph->dev, &ti->xa_lines,
> 1373							 payld);
  1374		if (WARN_ON(!uuid))
  1375			return;
  1376	
  1377		*active_uuid = uuid;
  1378	}
  1379	
  1380	static struct payload *
  1381	scmi_telemetry_nearest_line_by_type(struct telemetry_shmti *shmti,
  1382					    void *last, enum tdcf_line_types ltype)
  1383	{
  1384		struct tdcf __iomem *tdcf = shmti->base;
  1385		void *next, *found = NULL;
  1386	
  1387		/* Scan from start of TDCF payloads up to last_payld */
> 1388		next = tdcf->payld;
  1389		while (next < last) {
> 1390			if (LINE_TYPE((struct payload *)next) == ltype)
  1391				found = next;
  1392	
  1393			next += LINE_LENGTH_WORDS((struct payload *)next);
  1394		}
  1395	
  1396		return found;
  1397	}
  1398	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
