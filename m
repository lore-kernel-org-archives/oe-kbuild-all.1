Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44253E17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKzSRm9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703539149; x=1735075149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2F9sIGA7EdUrJwN8U58kfuIehKLMIfG25GHB6Ov/Fg4=;
  b=PKzSRm9UVY+ZO8y36A6WkPz7o2XGB7iOruPpGgQE6gfcmz/0Gz2WJDw5
   xmXZlIROTEA0poyIBYCwMKukFoiOrUQ77loqu/jwJZgWeB8NyfkAVEpgg
   PFVh84DsLKOfp6EEnUmAzFyheE5HEFMuVEhXRn/WgZ//FWT1cFA4sAKt6
   rsLiApUVkCs1qsUSKxHg3EctNfRTwce/L/rkQxMQp+NeAbVsMX2c6Z1WW
   WXaF9BRyxTN6Cv9/1HAdLPug19WpV/5+PXbHgZiMLzN3dF6oUW6ADHvkP
   /2HR7n4pcOQ/QcbxBeTeP0bosR71yUrnqEJ2K5OB8gSjtJbd49mCdKYs+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="17868703"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="17868703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 13:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="12276686"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2023 13:19:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHsLl-000DgT-21;
	Mon, 25 Dec 2023 21:19:01 +0000
Date: Tue, 26 Dec 2023 05:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent FERT <laurent.fert@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Yann Fouassier <yann.fouassier@intel.com>
Subject: [intel-lts:4.19/android_s 3068/30000]
 drivers/hwtracing/intel_th/msu.c:1320: warning: Function parameter or member
 'buf' not described in 'stop_buffer_trace'
Message-ID: <202312260500.tS1Coybf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a45f8ae6659a25c2743eb4a9bc5ee7954a00d784
commit: f1edb90e17515062e4de1a93c80f56938d8c1791 [3068/30000] intel_th: Support NPKT ACPI table in MSU
config: i386-randconfig-r001-20230906 (https://download.01.org/0day-ci/archive/20231226/202312260500.tS1Coybf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260500.tS1Coybf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260500.tS1Coybf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from drivers/hwtracing/intel_th/msu.c:11:
   drivers/hwtracing/intel_th/msu.c: In function 'npkt_bind_buffer':
>> include/linux/kern_levels.h:5:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t {aka unsigned int}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:308:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   drivers/hwtracing/intel_th/msu.c:1418:3: note: in expansion of macro 'pr_err'
      pr_err("ioremap failed for buffer %s 0x%llx size:0x%x\n",
      ^~~~~~
   drivers/hwtracing/intel_th/msu.c:57: warning: Function parameter or member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:99: warning: bad line: 
   drivers/hwtracing/intel_th/msu.c:132: warning: Function parameter or member 'iter_list' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:896: warning: Function parameter or member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:896: warning: Function parameter or member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:896: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'
>> drivers/hwtracing/intel_th/msu.c:1320: warning: Function parameter or member 'buf' not described in 'stop_buffer_trace'
>> drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'file' not described in 'read_npkt_dump_buf'
>> drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'user_buf' not described in 'read_npkt_dump_buf'
>> drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'count' not described in 'read_npkt_dump_buf'
>> drivers/hwtracing/intel_th/msu.c:1358: warning: Function parameter or member 'ppos' not described in 'read_npkt_dump_buf'
>> drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'type' not described in 'npkt_bind_buffer'
>> drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'abuf' not described in 'npkt_bind_buffer'
>> drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'flags' not described in 'npkt_bind_buffer'
>> drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'buf' not described in 'npkt_bind_buffer'
>> drivers/hwtracing/intel_th/msu.c:1392: warning: Function parameter or member 'msc' not described in 'npkt_bind_buffer'
>> drivers/hwtracing/intel_th/msu.c:1450: warning: Function parameter or member 'msc' not described in 'intel_th_npkt_init'
>> drivers/hwtracing/intel_th/msu.c:1489: warning: Function parameter or member 'msc' not described in 'intel_th_npkt_remove'
>> drivers/hwtracing/intel_th/msu.c:1507: warning: Function parameter or member 'thdev' not described in 'intel_th_msc_first_trace'


vim +1320 drivers/hwtracing/intel_th/msu.c

  1313	
  1314	/**
  1315	 * Stop current trace if a buffer was marked with a capture in pogress.
  1316	 *
  1317	 * Update buffer write offset and wrap status after stopping the trace.
  1318	 */
  1319	static void stop_buffer_trace(struct npkt_buf *buf)
> 1320	{
  1321		u32 reg, mode;
  1322		struct msc *msc = buf->msc;
  1323	
  1324		mutex_lock(&npkt_lock);
  1325		if (!atomic_read(&buf->active))
  1326			goto unlock;
  1327	
  1328		reg = ioread32(msc->reg_base + REG_MSU_MSC0CTL);
  1329		mode = (reg & MSC_MODE) >> __ffs(MSC_MODE);
  1330		if (!(reg & MSC_EN) || mode != MSC_MODE_SINGLE) {
  1331			/* Assume full buffer */
  1332			pr_warn("NPKT reported CSR in use but not tracing to CSR\n");
  1333			buf->offset = 0;
  1334			buf->wrapped = true;
  1335			atomic_set(&buf->active, 0);
  1336			goto unlock;
  1337		}
  1338	
  1339		/* The hub must be able to stop a capture not started by the driver */
  1340		intel_th_trace_disable(msc->thdev);
  1341	
  1342		/* Update offset and wrap status */
  1343		reg = ioread32(msc->reg_base + REG_MSU_MSC0MWP);
  1344		buf->offset = reg - (u32)buf->phy;
  1345		reg = ioread32(msc->reg_base + REG_MSU_MSC0STS);
  1346		buf->wrapped = !!(reg & MSCSTS_WRAPSTAT);
  1347		atomic_set(&buf->active, 0);
  1348	
  1349	unlock:
  1350		mutex_unlock(&npkt_lock);
  1351	}
  1352	
  1353	/**
  1354	 * Copy re-ordered data from an NPKT buffer to a user buffer.
  1355	 */
  1356	static ssize_t read_npkt_dump_buf(struct file *file, char __user *user_buf,
  1357					  size_t count, loff_t *ppos)
> 1358	{
  1359		struct npkt_buf *buf = file->private_data;
  1360		size_t size = buf->size;
  1361		loff_t off = *ppos;
  1362		ssize_t ret;
  1363	
  1364		if (atomic_read(&buf->active))
  1365			stop_buffer_trace(buf);
  1366	
  1367		if (off >= size)
  1368			return 0;
  1369	
  1370		ret = msc_single_to_user(buf->buf, size >> PAGE_SHIFT,
  1371					 buf->offset, buf->wrapped,
  1372					 user_buf, off, count);
  1373		if (ret > 0)
  1374			*ppos += ret;
  1375	
  1376		return ret;
  1377	}
  1378	
  1379	static const struct file_operations npkt_dump_buf_fops = {
  1380		.read	= read_npkt_dump_buf,
  1381		.open	= simple_open,
  1382		.llseek	= noop_llseek,
  1383	};
  1384	
  1385	/**
  1386	 * Prepare a buffer with remapped address for a given NPKT buffer and add
  1387	 * an entry for it in debugfs.
  1388	 */
  1389	static void npkt_bind_buffer(enum NPKT_BUF_TYPE type,
  1390				     struct acpi_npkt_buf *abuf, u8 flags,
  1391				     struct npkt_buf *buf, struct msc *msc)
> 1392	{
  1393		const char *name = npkt_buf_name[type];
  1394	
  1395		/* No buffer handed through ACPI */
  1396		if (!abuf->addr || !abuf->size)
  1397			return;
  1398	
  1399		/* Only expect multiples of page size */
  1400		if (abuf->size & (PAGE_SIZE - 1)) {
  1401			pr_warn("invalid size 0x%x for buffer %s\n",
  1402				abuf->size, name);
  1403			return;
  1404		}
  1405	
  1406		buf->size = abuf->size;
  1407		buf->offset = abuf->offset;
  1408		buf->wrapped = !!(flags & BIT(type));
  1409		/* CSR may still be active */
  1410		if (type == NPKT_CSR && (flags & NPKT_CSR_USED)) {
  1411			atomic_set(&buf->active, 1);
  1412			buf->msc = msc;
  1413		}
  1414	
  1415		buf->phy = abuf->addr;
  1416		buf->buf = (__force void *)ioremap(buf->phy, buf->size);
  1417		if (!buf->buf) {
> 1418			pr_err("ioremap failed for buffer %s 0x%llx size:0x%x\n",
  1419			       name, buf->phy, buf->size);
  1420			return;
  1421		}
  1422	
  1423		debugfs_create_file(name, S_IRUGO, npkt_dump_dir, buf,
  1424				    &npkt_dump_buf_fops);
  1425	}
  1426	
  1427	static void npkt_bind_buffers(struct acpi_table_npkt *npkt,
  1428				      struct npkt_buf *bufs, struct msc *msc)
  1429	{
  1430		int i;
  1431	
  1432		for (i = 0; i < NPKT_NBUF; i++)
  1433			npkt_bind_buffer(i, &npkt->buffers[i], npkt->flags,
  1434					 &bufs[i], msc);
  1435	}
  1436	
  1437	static void npkt_unbind_buffers(struct npkt_buf *bufs)
  1438	{
  1439		int i;
  1440	
  1441		for (i = 0; i < NPKT_NBUF; i++)
  1442			if (bufs[i].buf)
  1443				iounmap((__force void __iomem *)bufs[i].buf);
  1444	}
  1445	
  1446	/**
  1447	 * Prepare debugfs access to NPKT buffers.
  1448	 */
  1449	static void intel_th_npkt_init(struct msc *msc)
> 1450	{
  1451		acpi_status status;
  1452		struct acpi_table_npkt *npkt;
  1453	
  1454		/* Associate NPKT to msc0 */
  1455		if (npkt_bufs || msc->index != 0)
  1456			return;
  1457	
  1458		status = acpi_get_table(ACPI_SIG_NPKT, 0,
  1459					(struct acpi_table_header **)&npkt);
  1460		if (ACPI_FAILURE(status)) {
  1461			pr_warn("Failed to get NPKT table, %s\n",
  1462				acpi_format_exception(status));
  1463			return;
  1464		}
  1465	
  1466		npkt_bufs = kzalloc(sizeof(struct npkt_buf) * NPKT_NBUF, GFP_KERNEL);
  1467		if (!npkt_bufs)
  1468			return;
  1469	
  1470		npkt_dump_dir = debugfs_create_dir("npkt_dump", NULL);
  1471		if (!npkt_dump_dir) {
  1472			pr_err("npkt_dump debugfs create dir failed\n");
  1473			goto free_npkt_bufs;
  1474		}
  1475	
  1476		npkt_bind_buffers(npkt, npkt_bufs, msc);
  1477	
  1478		return;
  1479	
  1480	free_npkt_bufs:
  1481		kfree(npkt_bufs);
  1482		npkt_bufs = NULL;
  1483	}
  1484	
  1485	/**
  1486	 * Remove debugfs access to NPKT buffers and release resources.
  1487	 */
  1488	static void intel_th_npkt_remove(struct msc *msc)
> 1489	{
  1490		/* Only clean for msc 0 if necessary */
  1491		if (!npkt_bufs || msc->index != 0)
  1492			return;
  1493	
  1494		npkt_unbind_buffers(npkt_bufs);
  1495		debugfs_remove_recursive(npkt_dump_dir);
  1496		kfree(npkt_bufs);
  1497		npkt_bufs = NULL;
  1498	}
  1499	
  1500	/**
  1501	 * First trace callback.
  1502	 *
  1503	 * If NPKT notified a CSR capture is in progress, stop it and update buffer
  1504	 * write offset and wrap status.
  1505	 */
  1506	static void intel_th_msc_first_trace(struct intel_th_device *thdev)
> 1507	{
  1508		struct device *dev = &thdev->dev;
  1509		struct msc *msc = dev_get_drvdata(dev);
  1510		struct npkt_buf *buf;
  1511	
  1512		if (!npkt_bufs || msc->index != 0)
  1513			return;
  1514	
  1515		buf = &npkt_bufs[NPKT_CSR];
  1516		if (atomic_read(&buf->active))
  1517			stop_buffer_trace(buf);
  1518	}
  1519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
