Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851916132A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 22:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727563986; cv=none; b=uF2DasBciKIqJCREXb0fDpibsdWdPxeN4nG/TB/qwAVu8M8caWL3QBkIPg/3cOul3mOxFQ+f1Q0GUzZbI117GQH+T34TLwF/8cpD+4kIiq38Yw2VQfM2UjOHYTTlrmVxwF2c/rjurLNeIciCClz5HRnVk9Zrm7U4ufYkpI0Dr/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727563986; c=relaxed/simple;
	bh=MJ0TIp2IsRDwqv49ScJgbggwgkVMHAmc2zz9TGlZQSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QGl3zYya/MLqgoNrlS/9rwp3kNtLt3z215OoWWifJxR1CEYNaO4YC2LCHNyger0RepCNaVJ6bD7P+FGNJHxRJFWCptOHRVGp/5R7GhlYTFaXUpL2G1thLJf6HSWWWNxCceRyyd4ohuiNgB1IHdtVjwLbsSQP5Bi1UXu/egt+cOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5V+u50/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5V+u50/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727563984; x=1759099984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJ0TIp2IsRDwqv49ScJgbggwgkVMHAmc2zz9TGlZQSk=;
  b=b5V+u50/9jocEBCTWMzYn33fLGRcC5M7Emn2KUL7tTq7narliZaqoj9k
   BGigxnmS87cnS1/qUL5tzCckDK3PdeKjNeSIW8YVGN7SvS8dlvasN3zop
   cocD8blt7MgnNouJ0NXkEwYCoN+8iRIMYczVmZUW3iH9qnlMJi69lBY7G
   N45MaIQit75AZHoNIHdpLYYBTj/D+2p16zRyVJIV/CW9vMbJhhQdTxwIC
   zRD/pz1pan+YH8FT3BBYkHqkdAun0oQkOSRn5sh64yedIuUc+i62K7t0y
   5sIoY0tTB2Q/ATRD7MiXjDEkAYg5v9pDML+o+Al9K2VWPbnJjliuj8WCn
   Q==;
X-CSE-ConnectionGUID: 7CWrssXqQEynzW+CNjjDcw==
X-CSE-MsgGUID: 4TOgjnWhSgG1GSsdNRuP6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="52096686"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="52096686"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 15:53:03 -0700
X-CSE-ConnectionGUID: yooKelx8Qk+SXAbfgbTbPA==
X-CSE-MsgGUID: 2zU1Eg00TdK12atOXq9YyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72760529"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 15:53:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sugJA-000Njl-00;
	Sat, 28 Sep 2024 22:53:00 +0000
Date: Sun, 29 Sep 2024 06:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5677/16788]
 drivers/pci/controller/dwc/pci-imx6.c:1305:6: warning: variable 'ret' set
 but not used
Message-ID: <202409290634.IEtJJX3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: d2e6b139a3734c4126b26efbd41105e27334cdb9 [5677/16788] LF-10626-4: PCI: imx6: Add i.MX95 PCIe support.
config: arm-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290634.IEtJJX3v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290634.IEtJJX3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290634.IEtJJX3v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/dwc/pci-imx6.c:25:
   In file included from include/linux/pci.h:1620:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/pci/controller/dwc/pci-imx6.c:1174:30: error: use of undeclared identifier 'PCIEAX1PCIEBX1SATA'
    1174 |                         && imx6_pcie->hsio_cfg == PCIEAX1PCIEBX1SATA
         |                                                   ^
>> drivers/pci/controller/dwc/pci-imx6.c:1305:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1305 |         int ret = 0;
         |             ^
   2 warnings and 1 error generated.


vim +/ret +1305 drivers/pci/controller/dwc/pci-imx6.c

  1281	
  1282	/*
  1283	 * Simple static config lut according to dts settings
  1284	 * DAC index and stream ID used as a match result of LUT.
  1285	 * Pre-allocated and used by PCIes.
  1286	 *
  1287	 * Currently stream ID from 32-64 for PCIe.
  1288	 * 32-40: first PCI bus.
  1289	 * 40-48: second PCI bus.
  1290	 *
  1291	 * DAC_ID is index of TRDC.DAC index, start from 2 at iMX95.
  1292	 * ITS [pci(2bit): streamid(6bits)]
  1293	 *	pci 0 is 0
  1294	 *	pci 1 is 3
  1295	 */
  1296	static int imx6_pcie_config_sid(struct imx6_pcie *imx6_pcie)
  1297	{
  1298		struct imx6_of_map *msi_map = NULL, *smmu_map = NULL, *cur;
  1299		struct dw_pcie *pci = imx6_pcie->pci;
  1300		struct device *dev = pci->dev;
  1301		int i, j, lut_index, nr_map, msi_size = 0, smmu_size = 0;
  1302		u32 msi_map_mask = 0xffff, smmu_map_mask = 0xffff;
  1303		u32 mask;
  1304		int size;
> 1305		int ret = 0;
  1306	
  1307		of_get_property(dev->of_node, "msi-map", &msi_size);
  1308		if (msi_size) {
  1309			msi_map = devm_kzalloc(dev, msi_size, GFP_KERNEL);
  1310			if (!msi_map)
  1311				return -ENOMEM;
  1312	
  1313			if (of_property_read_u32_array(dev->of_node, "msi-map",
  1314						       (u32 *)msi_map,
  1315						       msi_size / sizeof(u32)))
  1316				return -EINVAL;
  1317	
  1318			of_property_read_u32(dev->of_node, "msi-map-mask",
  1319					     &msi_map_mask);
  1320		}
  1321		cur = msi_map;
  1322		size = msi_size;
  1323		mask = msi_map_mask;
  1324	
  1325		of_get_property(dev->of_node, "iommu-map", &smmu_size);
  1326		if (smmu_size) {
  1327			smmu_map = devm_kzalloc(dev, smmu_size, GFP_KERNEL);
  1328			if (!smmu_map)
  1329				return -ENOMEM;
  1330	
  1331			if (of_property_read_u32_array(dev->of_node, "iommu-map",
  1332						       (u32 *)smmu_map,
  1333						       smmu_size / sizeof(u32)))
  1334				return -EINVAL;
  1335	
  1336			of_property_read_u32(dev->of_node, "smmu_map_mask",
  1337					     &smmu_map_mask);
  1338		}
  1339	
  1340		if (imx6_check_msi_and_smmmu(imx6_pcie, msi_map, msi_size, msi_map_mask,
  1341					     smmu_map, smmu_size, smmu_map_mask))
  1342			return -EINVAL;
  1343	
  1344		if (!cur) {
  1345			cur = smmu_map;
  1346			size = smmu_size;
  1347			mask = smmu_map_mask;
  1348		}
  1349	
  1350		nr_map = size / (sizeof(*cur));
  1351	
  1352		lut_index = 0;
  1353		for (i = 0; i < nr_map; i++) {
  1354			for (j = 0; j < cur->sid_len; j++) {
  1355				imx6_pcie_update_lut(imx6_pcie, lut_index,
  1356						     cur->bdf + j, mask,
  1357						     (cur->sid + j) & IMX95_SID_MASK);
  1358				lut_index++;
  1359			}
  1360			cur++;
  1361	
  1362			if (lut_index >= IMX95_MAX_LUT) {
  1363				dev_err(dev, "its-map/iommu-map exceed HW limiation\n");
  1364				ret = -EINVAL;
  1365				break;
  1366			}
  1367		}
  1368	
  1369		kfree(smmu_map);
  1370		kfree(msi_map);
  1371	
  1372		return 0;
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
