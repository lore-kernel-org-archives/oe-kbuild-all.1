Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4397C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683364030; x=1714900030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+oIO6fQ/nBfNdlq7/yzwpbvfmZaldp64a20/OBklgM=;
  b=eJkvvpKEx5P/8b4ocXCLMnhPzmiy/LbufHOLMpQafyFH2TbSTYj5zIt5
   y6IfFDyIdWCHKffsUxn1WhUA2Vxhd8tq9xlhNpbgfH4MOBFd+KEVwL1fs
   jqKFt+9GGAg5G6IYf9ft0SSAzoDpf5o6uRAnIdEPDRkj0ky1yyLopwFei
   qVXsmv/Xe6rmvIn0gFyFHBzHdCoyzoVUwOrwO2PiArJfqvwf2RpeYBx1W
   1/YeU0zf6zIAzDhlQlTrW/IgL1lCegiqLTa3TcdunVw5tgP6r/FGJ/v8s
   1IqxlG8YV3AZCgAteqYYmmAbo1ufSDVmQacvL43gITPC+dyFnoFkdfWd8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="329719468"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="329719468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 02:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="809576570"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="809576570"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 May 2023 02:07:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvDsg-00005M-1z;
	Sat, 06 May 2023 09:07:06 +0000
Date: Sat, 6 May 2023 17:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan McDowell <noodles@earth.li>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 24/26]
 drivers/crypto/inside-secure/safexcel.c:1539:34: error: 'struct
 safexcel_ring' has no member named 'irq'
Message-ID: <202305061703.GB2pRO8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   7e4ab664280ce88c69fad5875e49d02c7c4cf810
commit: 6869200e5a4b96195cf90fe5ace37016197ef714 [24/26] crypto: safexcel - Cleanup ring IRQ workqueues on load failure
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230506/202305061703.GB2pRO8x-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=6869200e5a4b96195cf90fe5ace37016197ef714
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 6869200e5a4b96195cf90fe5ace37016197ef714
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/crypto/inside-secure/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061703.GB2pRO8x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
                    from drivers/crypto/inside-secure/safexcel.c:10:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:14: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/linux/clk.h:12,
                    from drivers/crypto/inside-secure/safexcel.c:8:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:16,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/mutex.h:18,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:139:34: note: in definition of macro 'WARN_ON_ONCE'
     139 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c: In function 'safexcel_probe_generic':
>> drivers/crypto/inside-secure/safexcel.c:1539:34: error: 'struct safexcel_ring' has no member named 'irq'
    1539 |                 if (priv->ring[i].irq)
         |                                  ^
   drivers/crypto/inside-secure/safexcel.c:1540:60: error: 'struct safexcel_ring' has no member named 'irq'
    1540 |                         irq_set_affinity_hint(priv->ring[i].irq, NULL);
         |                                                            ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +1539 drivers/crypto/inside-secure/safexcel.c

  1299	
  1300	/*
  1301	 * Generic part of probe routine, shared by platform and PCI driver
  1302	 *
  1303	 * Assumes IO resources have been mapped, private data mem has been allocated,
  1304	 * clocks have been enabled, device pointer has been assigned etc.
  1305	 *
  1306	 */
  1307	static int safexcel_probe_generic(void *pdev,
  1308					  struct safexcel_crypto_priv *priv,
  1309					  int is_pci_dev)
  1310	{
  1311		struct device *dev = priv->dev;
  1312		u32 peid, version, mask, val, hiaopt;
  1313		int i, ret, hwctg;
  1314	
  1315		priv->context_pool = dmam_pool_create("safexcel-context", dev,
  1316						      sizeof(struct safexcel_context_record),
  1317						      1, 0);
  1318		if (!priv->context_pool)
  1319			return -ENOMEM;
  1320	
  1321		/*
  1322		 * First try the EIP97 HIA version regs
  1323		 * For the EIP197, this is guaranteed to NOT return any of the test
  1324		 * values
  1325		 */
  1326		version = readl(priv->base + EIP97_HIA_AIC_BASE + EIP197_HIA_VERSION);
  1327	
  1328		mask = 0;  /* do not swap */
  1329		if (EIP197_REG_LO16(version) == EIP197_HIA_VERSION_LE) {
  1330			priv->hwconfig.hiaver = EIP197_VERSION_MASK(version);
  1331		} else if (EIP197_REG_HI16(version) == EIP197_HIA_VERSION_BE) {
  1332			/* read back byte-swapped, so complement byte swap bits */
  1333			mask = EIP197_MST_CTRL_BYTE_SWAP_BITS;
  1334			priv->hwconfig.hiaver = EIP197_VERSION_SWAP(version);
  1335		} else {
  1336			/* So it wasn't an EIP97 ... maybe it's an EIP197? */
  1337			version = readl(priv->base + EIP197_HIA_AIC_BASE +
  1338					EIP197_HIA_VERSION);
  1339			if (EIP197_REG_LO16(version) == EIP197_HIA_VERSION_LE) {
  1340				priv->hwconfig.hiaver = EIP197_VERSION_MASK(version);
  1341				priv->flags |= SAFEXCEL_HW_EIP197;
  1342			} else if (EIP197_REG_HI16(version) ==
  1343				   EIP197_HIA_VERSION_BE) {
  1344				/* read back byte-swapped, so complement swap bits */
  1345				mask = EIP197_MST_CTRL_BYTE_SWAP_BITS;
  1346				priv->hwconfig.hiaver = EIP197_VERSION_SWAP(version);
  1347				priv->flags |= SAFEXCEL_HW_EIP197;
  1348			} else {
  1349				return -ENODEV;
  1350			}
  1351		}
  1352	
  1353		/* Now initialize the reg offsets based on the probing info so far */
  1354		safexcel_init_register_offsets(priv);
  1355	
  1356		/*
  1357		 * If the version was read byte-swapped, we need to flip the device
  1358		 * swapping Keep in mind here, though, that what we write will also be
  1359		 * byte-swapped ...
  1360		 */
  1361		if (mask) {
  1362			val = readl(EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
  1363			val = val ^ (mask >> 24); /* toggle byte swap bits */
  1364			writel(val, EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
  1365		}
  1366	
  1367		/*
  1368		 * We're not done probing yet! We may fall through to here if no HIA
  1369		 * was found at all. So, with the endianness presumably correct now and
  1370		 * the offsets setup, *really* probe for the EIP97/EIP197.
  1371		 */
  1372		version = readl(EIP197_GLOBAL(priv) + EIP197_VERSION);
  1373		if (((priv->flags & SAFEXCEL_HW_EIP197) &&
  1374		     (EIP197_REG_LO16(version) != EIP197_VERSION_LE)) ||
  1375		    ((!(priv->flags & SAFEXCEL_HW_EIP197) &&
  1376		     (EIP197_REG_LO16(version) != EIP97_VERSION_LE)))) {
  1377			/*
  1378			 * We did not find the device that matched our initial probing
  1379			 * (or our initial probing failed) Report appropriate error.
  1380			 */
  1381			return -ENODEV;
  1382		}
  1383	
  1384		priv->hwconfig.hwver = EIP197_VERSION_MASK(version);
  1385		hwctg = version >> 28;
  1386		peid = version & 255;
  1387	
  1388		/* Detect EIP96 packet engine and version */
  1389		version = readl(EIP197_PE(priv) + EIP197_PE_EIP96_VERSION(0));
  1390		if (EIP197_REG_LO16(version) != EIP96_VERSION_LE) {
  1391			dev_err(dev, "EIP%d: EIP96 not detected.\n", peid);
  1392			return -ENODEV;
  1393		}
  1394		priv->hwconfig.pever = EIP197_VERSION_MASK(version);
  1395	
  1396		hiaopt = readl(EIP197_HIA_AIC(priv) + EIP197_HIA_OPTIONS);
  1397	
  1398		if (priv->flags & SAFEXCEL_HW_EIP197) {
  1399			/* EIP197 */
  1400			priv->hwconfig.hwdataw  = (hiaopt >> EIP197_HWDATAW_OFFSET) &
  1401						  EIP197_HWDATAW_MASK;
  1402			priv->hwconfig.hwcfsize = ((hiaopt >> EIP197_CFSIZE_OFFSET) &
  1403						   EIP197_CFSIZE_MASK) +
  1404						  EIP197_CFSIZE_ADJUST;
  1405			priv->hwconfig.hwrfsize = ((hiaopt >> EIP197_RFSIZE_OFFSET) &
  1406						   EIP197_RFSIZE_MASK) +
  1407						  EIP197_RFSIZE_ADJUST;
  1408		} else {
  1409			/* EIP97 */
  1410			priv->hwconfig.hwdataw  = (hiaopt >> EIP197_HWDATAW_OFFSET) &
  1411						  EIP97_HWDATAW_MASK;
  1412			priv->hwconfig.hwcfsize = (hiaopt >> EIP97_CFSIZE_OFFSET) &
  1413						  EIP97_CFSIZE_MASK;
  1414			priv->hwconfig.hwrfsize = (hiaopt >> EIP97_RFSIZE_OFFSET) &
  1415						  EIP97_RFSIZE_MASK;
  1416		}
  1417	
  1418		/* Get supported algorithms from EIP96 transform engine */
  1419		priv->hwconfig.algo_flags = readl(EIP197_PE(priv) +
  1420					    EIP197_PE_EIP96_OPTIONS(0));
  1421	
  1422		/* Print single info line describing what we just detected */
  1423		dev_info(priv->dev, "EIP%d:%x(%d)-HIA:%x(%d,%d,%d),PE:%x,alg:%08x\n",
  1424			 peid, priv->hwconfig.hwver, hwctg, priv->hwconfig.hiaver,
  1425			 priv->hwconfig.hwdataw, priv->hwconfig.hwcfsize,
  1426			 priv->hwconfig.hwrfsize, priv->hwconfig.pever,
  1427			 priv->hwconfig.algo_flags);
  1428	
  1429		safexcel_configure(priv);
  1430	
  1431		if (IS_ENABLED(CONFIG_PCI) && priv->version == EIP197_DEVBRD) {
  1432			/*
  1433			 * Request MSI vectors for global + 1 per ring -
  1434			 * or just 1 for older dev images
  1435			 */
  1436			struct pci_dev *pci_pdev = pdev;
  1437	
  1438			ret = pci_alloc_irq_vectors(pci_pdev,
  1439						    priv->config.rings + 1,
  1440						    priv->config.rings + 1,
  1441						    PCI_IRQ_MSI | PCI_IRQ_MSIX);
  1442			if (ret < 0) {
  1443				dev_err(dev, "Failed to allocate PCI MSI interrupts\n");
  1444				return ret;
  1445			}
  1446		}
  1447	
  1448		/* Register the ring IRQ handlers and configure the rings */
  1449		priv->ring = devm_kcalloc(dev, priv->config.rings,
  1450					  sizeof(*priv->ring),
  1451					  GFP_KERNEL);
  1452		if (!priv->ring)
  1453			return -ENOMEM;
  1454	
  1455		for (i = 0; i < priv->config.rings; i++) {
  1456			char wq_name[9] = {0};
  1457			int irq;
  1458			struct safexcel_ring_irq_data *ring_irq;
  1459	
  1460			ret = safexcel_init_ring_descriptors(priv,
  1461							     &priv->ring[i].cdr,
  1462							     &priv->ring[i].rdr);
  1463			if (ret) {
  1464				dev_err(dev, "Failed to initialize rings\n");
  1465				goto err_cleanup_rings;
  1466			}
  1467	
  1468			priv->ring[i].rdr_req = devm_kcalloc(dev,
  1469				EIP197_DEFAULT_RING_SIZE,
  1470				sizeof(*priv->ring[i].rdr_req),
  1471				GFP_KERNEL);
  1472			if (!priv->ring[i].rdr_req) {
  1473				ret = -ENOMEM;
  1474				goto err_cleanup_rings;
  1475			}
  1476	
  1477			ring_irq = devm_kzalloc(dev, sizeof(*ring_irq), GFP_KERNEL);
  1478			if (!ring_irq) {
  1479				ret = -ENOMEM;
  1480				goto err_cleanup_rings;
  1481			}
  1482	
  1483			ring_irq->priv = priv;
  1484			ring_irq->ring = i;
  1485	
  1486			irq = safexcel_request_ring_irq(pdev,
  1487							EIP197_IRQ_NUMBER(i, is_pci_dev),
  1488							is_pci_dev,
  1489							safexcel_irq_ring,
  1490							safexcel_irq_ring_thread,
  1491							ring_irq);
  1492			if (irq < 0) {
  1493				dev_err(dev, "Failed to get IRQ ID for ring %d\n", i);
  1494				ret = irq;
  1495				goto err_cleanup_rings;
  1496			}
  1497	
  1498			priv->ring[i].work_data.priv = priv;
  1499			priv->ring[i].work_data.ring = i;
  1500			INIT_WORK(&priv->ring[i].work_data.work,
  1501				  safexcel_dequeue_work);
  1502	
  1503			snprintf(wq_name, 9, "wq_ring%d", i);
  1504			priv->ring[i].workqueue =
  1505				create_singlethread_workqueue(wq_name);
  1506			if (!priv->ring[i].workqueue) {
  1507				ret = -ENOMEM;
  1508				goto err_cleanup_rings;
  1509			}
  1510	
  1511			priv->ring[i].requests = 0;
  1512			priv->ring[i].busy = false;
  1513	
  1514			crypto_init_queue(&priv->ring[i].queue,
  1515					  EIP197_DEFAULT_RING_SIZE);
  1516	
  1517			spin_lock_init(&priv->ring[i].lock);
  1518			spin_lock_init(&priv->ring[i].queue_lock);
  1519		}
  1520	
  1521		atomic_set(&priv->ring_used, 0);
  1522	
  1523		ret = safexcel_hw_init(priv);
  1524		if (ret) {
  1525			dev_err(dev, "HW init failed (%d)\n", ret);
  1526			goto err_cleanup_rings;
  1527		}
  1528	
  1529		ret = safexcel_register_algorithms(priv);
  1530		if (ret) {
  1531			dev_err(dev, "Failed to register algorithms (%d)\n", ret);
  1532			goto err_cleanup_rings;
  1533		}
  1534	
  1535		return 0;
  1536	
  1537	err_cleanup_rings:
  1538		for (i = 0; i < priv->config.rings; i++) {
> 1539			if (priv->ring[i].irq)
  1540				irq_set_affinity_hint(priv->ring[i].irq, NULL);
  1541			if (priv->ring[i].workqueue)
  1542				destroy_workqueue(priv->ring[i].workqueue);
  1543		}
  1544	
  1545		return ret;
  1546	}
  1547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
