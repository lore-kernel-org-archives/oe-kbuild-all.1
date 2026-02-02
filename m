Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF082F1FFC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770057681; cv=none; b=kC26QQZz0SW/aUB3BG1Z+lk+iBuEE8ekE0NapMYmxggmUji5DGPmurLX2H2V7k6sAL1FOuvJvkeZTRUEbIX8YyHLWNIlq1O4FXDBBxEueRJ3ne9MgtsUbg8koYx3wKrc3d1xSPAVfJHO+J1pz18IhYG7Jxzq8tpbYaUbSf3/x0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770057681; c=relaxed/simple;
	bh=cgKNRqDqgyfdlVgA/OKVkxuHkDly2rMJnO9rkoWnfAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KuJnUDMQYyKwrllE8kQydYRq6msasNYPB4W+WjuEqGEVpRT5RMNAaRnQfFHy9i0DzWpDtdpB3BP6xG9nPbcvHLz6APF/+KCTn5ZbklzAO13/4JUBG7Ygvq0CpRRTsLgZ0o199S0MezDDpm8dNtz5XPtp3u0nsMRVxIov+ERsbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dd2Mh44w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dd2Mh44w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770057679; x=1801593679;
  h=date:from:to:cc:subject:message-id;
  bh=cgKNRqDqgyfdlVgA/OKVkxuHkDly2rMJnO9rkoWnfAk=;
  b=dd2Mh44wp+DPN9xedjt08V7tTZL0eKE86s+osekXpGXOe+dudFmLnvZ/
   S3t10uKQXeRotX35FNaQu2rKAlQKKEkXjtLJfuwr9ogEJeLDgHgLPfwu9
   Xg+CXOTqm9FRBsTRvprsziFIHWbmEQKEtEyIjVYMJZBwBWSQiCKIEo4qb
   Yc/iPxW6ryFaLvpiXz935wFoo7qqsHZh9A3Q1AU/SUyfC3IqAP9qcj4Zu
   ajvHzMi20BkCIJ2Sgxo8nCxeneIpbTcF35Jd2iM6gX1aLv5dvZLALxL7X
   kKHQugrUD7C7TQJUL76kLyJ1p5hwP1g44JAjcqfyuq5Ue/HmUlQKPh9yU
   A==;
X-CSE-ConnectionGUID: V+W8XzFNRbi38wBtUR/H3g==
X-CSE-MsgGUID: bsdHYqWuSRaciMivHNwtxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71121341"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71121341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 10:41:17 -0800
X-CSE-ConnectionGUID: VSGg1QmDTReLxNPLrHXVng==
X-CSE-MsgGUID: QfQ/YhJdROeb8AtzKdP7Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209743163"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2026 10:41:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmyrJ-00000000frW-0r6K;
	Mon, 02 Feb 2026 18:41:13 +0000
Date: Tue, 03 Feb 2026 02:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/soc/qcom/smem.c:1204:16: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202602030206.DwMWtnAe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   495b51e8206a71e8493d1493110959a6c67042eb
commit: 495b51e8206a71e8493d1493110959a6c67042eb [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: sh-randconfig-r111-20260202 (https://download.01.org/0day-ci/archive/20260203/202602030206.DwMWtnAe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030206.DwMWtnAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030206.DwMWtnAe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/soc/qcom/smem.c:472:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_header *header @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:472:16: sparse:     expected struct smem_header *header
   drivers/soc/qcom/smem.c:472:16: sparse:     got void [noderef] __iomem *virt_base
   drivers/soc/qcom/smem.c:561:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_header *header @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:561:16: sparse:     expected struct smem_header *header
   drivers/soc/qcom/smem.c:561:16: sparse:     got void [noderef] __iomem *virt_base
   drivers/soc/qcom/smem.c:581:50: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/soc/qcom/smem.c:581:50: sparse:     expected void *
   drivers/soc/qcom/smem.c:581:50: sparse:     got void [noderef] __iomem *
   drivers/soc/qcom/smem.c:735:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_partition_header *phdr @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:735:22: sparse:     expected struct smem_partition_header *phdr
   drivers/soc/qcom/smem.c:735:22: sparse:     got void [noderef] __iomem *virt_base
   drivers/soc/qcom/smem.c:739:27: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/smem.c:743:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_partition_header *phdr @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:743:22: sparse:     expected struct smem_partition_header *phdr
   drivers/soc/qcom/smem.c:743:22: sparse:     got void [noderef] __iomem *virt_base
   drivers/soc/qcom/smem.c:747:27: sparse: sparse: cast to restricted __le32
   drivers/soc/qcom/smem.c:750:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_header *header @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:750:24: sparse:     expected struct smem_header *header
   drivers/soc/qcom/smem.c:750:24: sparse:     got void [noderef] __iomem *virt_base
   drivers/soc/qcom/smem.c:784:36: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/qcom/smem.c:793:28: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/qcom/smem.c:802:36: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/soc/qcom/smem.c:872:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_header *header @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:872:16: sparse:     expected struct smem_header *header
   drivers/soc/qcom/smem.c:872:16: sparse:     got void [noderef] __iomem *virt_base
   drivers/soc/qcom/smem.c:926:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_partition_header *header @@     got void [noderef] __iomem * @@
   drivers/soc/qcom/smem.c:926:16: sparse:     expected struct smem_partition_header *header
   drivers/soc/qcom/smem.c:926:16: sparse:     got void [noderef] __iomem *
   drivers/soc/qcom/smem.c:1077:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_ptable *ptable @@     got void [noderef] __iomem * @@
   drivers/soc/qcom/smem.c:1077:22: sparse:     expected struct smem_ptable *ptable
   drivers/soc/qcom/smem.c:1077:22: sparse:     got void [noderef] __iomem *
   drivers/soc/qcom/smem.c:1185:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct smem_header *header @@     got void [noderef] __iomem *virt_base @@
   drivers/soc/qcom/smem.c:1185:16: sparse:     expected struct smem_header *header
   drivers/soc/qcom/smem.c:1185:16: sparse:     got void [noderef] __iomem *virt_base
>> drivers/soc/qcom/smem.c:1204:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got restricted __le32 * @@
   drivers/soc/qcom/smem.c:1204:16: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smem.c:1204:16: sparse:     got restricted __le32 *
   drivers/soc/qcom/smem.c:1204:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got restricted __le32 * @@
   drivers/soc/qcom/smem.c:1204:52: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/soc/qcom/smem.c:1204:52: sparse:     got restricted __le32 *

vim +1204 drivers/soc/qcom/smem.c

4b638df4c9d556 Bjorn Andersson    2015-06-26  1124  
4b638df4c9d556 Bjorn Andersson    2015-06-26  1125  static int qcom_smem_probe(struct platform_device *pdev)
4b638df4c9d556 Bjorn Andersson    2015-06-26  1126  {
4b638df4c9d556 Bjorn Andersson    2015-06-26  1127  	struct smem_header *header;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1128  	struct reserved_mem *rmem;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1129  	struct qcom_smem *smem;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1130  	unsigned long flags;
d0bfd7c9b16261 Stephen Boyd       2015-10-08  1131  	int num_regions;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1132  	int hwlock_id;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1133  	u32 version;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1134  	u32 size;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1135  	int ret;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1136  	int i;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1137  
d0bfd7c9b16261 Stephen Boyd       2015-10-08  1138  	num_regions = 1;
4a1b9f4eb122f3 Rob Herring        2023-03-10  1139  	if (of_property_present(pdev->dev.of_node, "qcom,rpm-msg-ram"))
d0bfd7c9b16261 Stephen Boyd       2015-10-08  1140  		num_regions++;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1141  
cbdd13bfea7856 Christophe JAILLET 2023-07-12  1142  	smem = devm_kzalloc(&pdev->dev, struct_size(smem, regions, num_regions),
cbdd13bfea7856 Christophe JAILLET 2023-07-12  1143  			    GFP_KERNEL);
4b638df4c9d556 Bjorn Andersson    2015-06-26  1144  	if (!smem)
4b638df4c9d556 Bjorn Andersson    2015-06-26  1145  		return -ENOMEM;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1146  
4b638df4c9d556 Bjorn Andersson    2015-06-26  1147  	smem->dev = &pdev->dev;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1148  	smem->num_regions = num_regions;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1149  
b5af64fceb04dc Bjorn Andersson    2021-09-30  1150  	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
b5af64fceb04dc Bjorn Andersson    2021-09-30  1151  	if (rmem) {
b5af64fceb04dc Bjorn Andersson    2021-09-30  1152  		smem->regions[0].aux_base = rmem->base;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1153  		smem->regions[0].size = rmem->size;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1154  	} else {
b5af64fceb04dc Bjorn Andersson    2021-09-30  1155  		/*
b5af64fceb04dc Bjorn Andersson    2021-09-30  1156  		 * Fall back to the memory-region reference, if we're not a
b5af64fceb04dc Bjorn Andersson    2021-09-30  1157  		 * reserved-memory node.
b5af64fceb04dc Bjorn Andersson    2021-09-30  1158  		 */
b5af64fceb04dc Bjorn Andersson    2021-09-30  1159  		ret = qcom_smem_resolve_mem(smem, "memory-region", &smem->regions[0]);
4b638df4c9d556 Bjorn Andersson    2015-06-26  1160  		if (ret)
4b638df4c9d556 Bjorn Andersson    2015-06-26  1161  			return ret;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1162  	}
4b638df4c9d556 Bjorn Andersson    2015-06-26  1163  
b5af64fceb04dc Bjorn Andersson    2021-09-30  1164  	if (num_regions > 1) {
b5af64fceb04dc Bjorn Andersson    2021-09-30  1165  		ret = qcom_smem_resolve_mem(smem, "qcom,rpm-msg-ram", &smem->regions[1]);
b5af64fceb04dc Bjorn Andersson    2021-09-30  1166  		if (ret)
d0bfd7c9b16261 Stephen Boyd       2015-10-08  1167  			return ret;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1168  	}
b5af64fceb04dc Bjorn Andersson    2021-09-30  1169  
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1170  
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1171  	ret = qcom_smem_map_toc(smem, &smem->regions[0]);
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1172  	if (ret)
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1173  		return ret;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1174  
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1175  	for (i = 1; i < num_regions; i++) {
b5af64fceb04dc Bjorn Andersson    2021-09-30  1176  		smem->regions[i].virt_base = devm_ioremap_wc(&pdev->dev,
b5af64fceb04dc Bjorn Andersson    2021-09-30  1177  							     smem->regions[i].aux_base,
b5af64fceb04dc Bjorn Andersson    2021-09-30  1178  							     smem->regions[i].size);
b5af64fceb04dc Bjorn Andersson    2021-09-30  1179  		if (!smem->regions[i].virt_base) {
b5af64fceb04dc Bjorn Andersson    2021-09-30  1180  			dev_err(&pdev->dev, "failed to remap %pa\n", &smem->regions[i].aux_base);
b5af64fceb04dc Bjorn Andersson    2021-09-30  1181  			return -ENOMEM;
b5af64fceb04dc Bjorn Andersson    2021-09-30  1182  		}
b5af64fceb04dc Bjorn Andersson    2021-09-30  1183  	}
4b638df4c9d556 Bjorn Andersson    2015-06-26  1184  
4b638df4c9d556 Bjorn Andersson    2015-06-26  1185  	header = smem->regions[0].virt_base;
9806884d8cd552 Stephen Boyd       2015-09-02  1186  	if (le32_to_cpu(header->initialized) != 1 ||
9806884d8cd552 Stephen Boyd       2015-09-02  1187  	    le32_to_cpu(header->reserved)) {
7a94d5f31b549e Christian Marangi  2025-10-31  1188  		__smem = ERR_PTR(-ENODEV);
7a94d5f31b549e Christian Marangi  2025-10-31  1189  		return dev_err_probe(&pdev->dev, PTR_ERR(__smem), "SMEM is not initialized by SBL\n");
4b638df4c9d556 Bjorn Andersson    2015-06-26  1190  	}
4b638df4c9d556 Bjorn Andersson    2015-06-26  1191  
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1192  	hwlock_id = of_hwspin_lock_get_id(pdev->dev.of_node, 0);
876b405004842b Zhang Zekun        2024-09-09  1193  	if (hwlock_id < 0)
876b405004842b Zhang Zekun        2024-09-09  1194  		return dev_err_probe(&pdev->dev, hwlock_id,
876b405004842b Zhang Zekun        2024-09-09  1195  				     "failed to retrieve hwlock\n");
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1196  
dc5db35073a19f Haotian Zhang      2025-10-29  1197  	smem->hwlock = devm_hwspin_lock_request_specific(&pdev->dev, hwlock_id);
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1198  	if (!smem->hwlock)
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1199  		return -ENXIO;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1200  
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1201  	ret = hwspin_lock_timeout_irqsave(smem->hwlock, HWSPINLOCK_TIMEOUT, &flags);
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1202  	if (ret)
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1203  		return ret;
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01 @1204  	size = readl_relaxed(&header->available) + readl_relaxed(&header->free_offset);
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1205  	hwspin_unlock_irqrestore(smem->hwlock, &flags);
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1206  
4b638df4c9d556 Bjorn Andersson    2015-06-26  1207  	version = qcom_smem_get_sbl_version(smem);
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1208  	/*
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1209  	 * smem header mapping is required only in heap version scheme, so unmap
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1210  	 * it here. It will be remapped in qcom_smem_map_global() when whole
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1211  	 * partition is mapped again.
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1212  	 */
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1213  	devm_iounmap(smem->dev, smem->regions[0].virt_base);
d52e404874369f Chris Lew          2017-10-11  1214  	switch (version >> 16) {
d52e404874369f Chris Lew          2017-10-11  1215  	case SMEM_GLOBAL_PART_VERSION:
d52e404874369f Chris Lew          2017-10-11  1216  		ret = qcom_smem_set_global_partition(smem);
d52e404874369f Chris Lew          2017-10-11  1217  		if (ret < 0)
d52e404874369f Chris Lew          2017-10-11  1218  			return ret;
5b3940676107dd Chris Lew          2017-10-11  1219  		smem->item_count = qcom_smem_get_item_count(smem);
5b3940676107dd Chris Lew          2017-10-11  1220  		break;
d52e404874369f Chris Lew          2017-10-11  1221  	case SMEM_GLOBAL_HEAP_VERSION:
20bb6c9de1b7e1 Deepak Kumar Singh 2022-03-01  1222  		qcom_smem_map_global(smem, size);
5b3940676107dd Chris Lew          2017-10-11  1223  		smem->item_count = SMEM_ITEM_COUNT;
d52e404874369f Chris Lew          2017-10-11  1224  		break;
d52e404874369f Chris Lew          2017-10-11  1225  	default:
4b638df4c9d556 Bjorn Andersson    2015-06-26  1226  		dev_err(&pdev->dev, "Unsupported SMEM version 0x%x\n", version);
4b638df4c9d556 Bjorn Andersson    2015-06-26  1227  		return -EINVAL;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1228  	}
4b638df4c9d556 Bjorn Andersson    2015-06-26  1229  
13a920ae7898ff Alex Elder         2018-06-25  1230  	BUILD_BUG_ON(SMEM_HOST_APPS >= SMEM_HOST_COUNT);
4b638df4c9d556 Bjorn Andersson    2015-06-26  1231  	ret = qcom_smem_enumerate_partitions(smem, SMEM_HOST_APPS);
d52e404874369f Chris Lew          2017-10-11  1232  	if (ret < 0 && ret != -ENOENT)
4b638df4c9d556 Bjorn Andersson    2015-06-26  1233  		return ret;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1234  
4b638df4c9d556 Bjorn Andersson    2015-06-26  1235  	__smem = smem;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1236  
efb448d0a3fca0 Imran Khan         2019-07-24  1237  	smem->socinfo = platform_device_register_data(&pdev->dev, "qcom-socinfo",
efb448d0a3fca0 Imran Khan         2019-07-24  1238  						      PLATFORM_DEVID_NONE, NULL,
efb448d0a3fca0 Imran Khan         2019-07-24  1239  						      0);
efb448d0a3fca0 Imran Khan         2019-07-24  1240  	if (IS_ERR(smem->socinfo))
efb448d0a3fca0 Imran Khan         2019-07-24  1241  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
efb448d0a3fca0 Imran Khan         2019-07-24  1242  
4b638df4c9d556 Bjorn Andersson    2015-06-26  1243  	return 0;
4b638df4c9d556 Bjorn Andersson    2015-06-26  1244  }
4b638df4c9d556 Bjorn Andersson    2015-06-26  1245  

:::::: The code at line 1204 was first introduced by commit
:::::: 20bb6c9de1b7e13f11d2ffe73686f4449c426807 soc: qcom: smem: map only partitions used by local HOST

:::::: TO: Deepak Kumar Singh <quic_deesin@quicinc.com>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
