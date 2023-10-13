Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B4A63DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiVdD98n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697193913; x=1728729913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSl711bdOOEKLb67CqXybD88KH1PGSa66HEXzJJoOLc=;
  b=RiVdD98np2I/nzb2Uaz4VnS/03ritNBgHFbDdaSnT9FDaCRrC9QNAF0D
   tyypgU8L+pxPha0ZMAgdVirrdTpDQQTKTOh21xcaUa5cs2SkgVsB+LImd
   S0T15MqBSnrRKIn3XRqxiY14f1IOE5SXIKt0VXqeW0otgqW5tulQ3qIqI
   IZrHA4I4sMl4/hIE2KuXzdsBTinuWlp50FKatXi9aLRGIWeznOsi0UoKX
   saRXmk1gGGrDt+qi/GGUSDDT1JfOsL5DI3OXRHBEc+5iBKRAqZg52yEV7
   cr/DR5INQqsxgQM0zEPoCagZvWBjWkXA/YlHbtx5yoEQkunAEHE8mgh+G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375503487"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375503487"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731323642"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="731323642"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 03:45:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFfJ-0004dz-1K;
	Fri, 13 Oct 2023 10:45:09 +0000
Date: Fri, 13 Oct 2023 18:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1577/30000]
 drivers/input/touchscreen/focaltech_touch/focaltech_core.c:1328:12: warning:
 'fts_ts_resume' defined but not used
Message-ID: <202310131802.cLKL0ZUv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: b5805df1b1a6c25d66b734c9249ac30c5f419b9d [1577/30000] MLK-14392-1 input: touch: add focaltech touch screen support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231013/202310131802.cLKL0ZUv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131802.cLKL0ZUv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131802.cLKL0ZUv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:18,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_core.h:36,
                    from drivers/input/touchscreen/focaltech_touch/focaltech_core.c:34:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1242:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1242 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1228:27: note: 'mem_section' declared here
    1228 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c: In function 'fts_parse_dt':
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c:970:31: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     970 |         if (pdata->reset_gpio < 0)
         |                               ^
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c:976:29: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     976 |         if (pdata->irq_gpio < 0)
         |                             ^
   drivers/input/touchscreen/focaltech_touch/focaltech_core.c: At top level:
>> drivers/input/touchscreen/focaltech_touch/focaltech_core.c:1328:12: warning: 'fts_ts_resume' defined but not used [-Wunused-function]
    1328 | static int fts_ts_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/input/touchscreen/focaltech_touch/focaltech_core.c:1267:12: warning: 'fts_ts_suspend' defined but not used [-Wunused-function]
    1267 | static int fts_ts_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/fts_ts_resume +1328 drivers/input/touchscreen/focaltech_touch/focaltech_core.c

  1259	
  1260	/*****************************************************************************
  1261	*  Name: fts_ts_suspend
  1262	*  Brief:
  1263	*  Input:
  1264	*  Output:
  1265	*  Return:
  1266	*****************************************************************************/
> 1267	static int fts_ts_suspend(struct device *dev)
  1268	{
  1269		struct fts_ts_data *data = dev_get_drvdata(dev);
  1270		int retval = 0;
  1271	
  1272		FTS_FUNC_ENTER();
  1273		if (data->suspended) {
  1274			FTS_INFO("Already in suspend state");
  1275			FTS_FUNC_EXIT();
  1276			return -1;
  1277		}
  1278	
  1279		fts_release_all_finger();
  1280	
  1281	#if FTS_GESTURE_EN
  1282		retval = fts_gesture_suspend(data->client);
  1283		if (retval == 0) {
  1284			/* Enter into gesture mode(suspend) */
  1285			retval = enable_irq_wake(fts_wq_data->client->irq);
  1286			if (retval)
  1287				FTS_ERROR("%s: set_irq_wake failed", __func__);
  1288			data->suspended = true;
  1289			FTS_FUNC_EXIT();
  1290			return 0;
  1291		}
  1292	#endif
  1293	
  1294	#if FTS_PSENSOR_EN
  1295		if (fts_sensor_suspend(data) != 0) {
  1296			enable_irq_wake(data->client->irq);
  1297			data->suspended = true;
  1298			return 0;
  1299		}
  1300	#endif
  1301	
  1302	#if FTS_ESDCHECK_EN
  1303		fts_esdcheck_suspend();
  1304	#endif
  1305	
  1306		fts_irq_disable();
  1307	
  1308		/* TP enter sleep mode */
  1309		retval =
  1310		    fts_i2c_write_reg(data->client, FTS_REG_POWER_MODE,
  1311				      FTS_REG_POWER_MODE_SLEEP_VALUE);
  1312		if (retval < 0)
  1313			FTS_ERROR("Set TP to sleep mode fail, ret=%d!", retval);
  1314		data->suspended = true;
  1315	
  1316		FTS_FUNC_EXIT();
  1317	
  1318		return 0;
  1319	}
  1320	
  1321	/*****************************************************************************
  1322	*  Name: fts_ts_resume
  1323	*  Brief:
  1324	*  Input:
  1325	*  Output:
  1326	*  Return:
  1327	*****************************************************************************/
> 1328	static int fts_ts_resume(struct device *dev)
  1329	{
  1330		struct fts_ts_data *data = dev_get_drvdata(dev);
  1331	
  1332		FTS_FUNC_ENTER();
  1333		if (!data->suspended) {
  1334			FTS_DEBUG("Already in awake state");
  1335			FTS_FUNC_EXIT();
  1336			return -1;
  1337		}
  1338	
  1339		if (!fts_chip_idc(data))
  1340			fts_reset_proc(200);
  1341	
  1342		fts_tp_state_recovery(data->client);
  1343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
