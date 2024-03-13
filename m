Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44147A7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 16:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710346019; cv=none; b=J8WZgDUbfp5HMbFLK+z7BXx/aUYS+V0g8yZ5D0rPB6zOmylEKdxcU3yGoYWIyjMhBWNzcLJ9FVh3veSh2TcqQAsYP6YjZ+qZab89E5/MxzBmZwgvjumJ4Rgg0bZpNyOSQjHPHHY0NIyA061mp7gp/TLfidxaxsI5mkfh4+PcZk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710346019; c=relaxed/simple;
	bh=FX5Tk4dqtJFOjO6GWdFOhI473N3gYdGqihsPZeAayO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cK2rzP44wdh99zaQsjAjvwz6m250jwNwcLu0xgsfjRe53NNLufYy0KwNEgPAl+0fpbA80bnvfDwPKZ0BB/J/G2DeqB0DD1gi9Q/M+FdM5vjZ+41Cnvh362nqH2Gk3e31uvb9ruA64rSBd+fzeKke/9Jij3riceKgxxJDYOJZ1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISujKmek; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISujKmek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710346018; x=1741882018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FX5Tk4dqtJFOjO6GWdFOhI473N3gYdGqihsPZeAayO8=;
  b=ISujKmekl61NFvrKjmYveFt86Q93cjoLL3twBziw0CKeKo8SdzIjcvhf
   94tQQNhux8GM2aJejxn9vsPkrRu4dxh0P7BWmz5/gG1w5+kRMYzjKYyDP
   KHXmKadd6t/Zr76/l9x9NZ7nKFZfAmD+hJG5yx1CKeyzSueBcreirL6fg
   ImpmdtsY6S2s/ov/dcoAiVe4Y8dftP9UEPE+NaUH9+Bq9nvNLtDXnAKvR
   /UmYdjrTdk2oyaC3Oi2VzLcRgPvwXmlSIgRTsH/OC8ghOW5lXxUn/vKtT
   FMqJPqJQqHFeOoOuhgxz5eGCpJ+lsjpAi5vOrGc64FuhRbF6o6lE77Tus
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4980779"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="4980779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 09:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="16644818"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Mar 2024 09:06:53 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkR7z-000CVd-1U;
	Wed, 13 Mar 2024 16:06:51 +0000
Date: Thu, 14 Mar 2024 00:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/intel/dmar.c:1418:11: error: no member named
 'num_prrs' in 'struct intel_iommu'
Message-ID: <202403140032.gCRNBAdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: 3ea366ee4c592580a2ceba619db10d3bbdfdf3db iommu/vt-d: Add PRQ counter for debug
date:   9 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240314/202403140032.gCRNBAdE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140032.gCRNBAdE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140032.gCRNBAdE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/dmar.c:1418:11: error: no member named 'num_prrs' in 'struct intel_iommu'
    1418 |                         iommu->num_prrs++;
         |                         ~~~~~  ^
>> drivers/iommu/intel/dmar.c:1420:11: error: no member named 'num_prri' in 'struct intel_iommu'
    1420 |                         iommu->num_prri++;
         |                         ~~~~~  ^
   2 errors generated.


vim +1418 drivers/iommu/intel/dmar.c

  1341	
  1342	/*
  1343	 * Function to submit invalidation descriptors of all types to the queued
  1344	 * invalidation interface(QI). Multiple descriptors can be submitted at a
  1345	 * time, a wait descriptor will be appended to each submission to ensure
  1346	 * hardware has completed the invalidation before return. Wait descriptors
  1347	 * can be part of the submission but it will not be polled for completion.
  1348	 */
  1349	int qi_submit_sync(struct intel_iommu *iommu, struct qi_desc *desc,
  1350			   unsigned int count, unsigned long options)
  1351	{
  1352		struct q_inval *qi = iommu->qi;
  1353		s64 devtlb_start_ktime = 0;
  1354		s64 iotlb_start_ktime = 0;
  1355		s64 iec_start_ktime = 0;
  1356		struct qi_desc wait_desc;
  1357		int wait_index, index;
  1358		unsigned long flags;
  1359		int offset, shift;
  1360		int rc, i;
  1361		u64 type;
  1362	
  1363		if (!qi)
  1364			return 0;
  1365	
  1366		type = desc->qw0 & GENMASK_ULL(3, 0);
  1367	
  1368		if ((type == QI_IOTLB_TYPE || type == QI_EIOTLB_TYPE) &&
  1369		    dmar_latency_enabled(iommu, DMAR_LATENCY_INV_IOTLB))
  1370			iotlb_start_ktime = ktime_to_ns(ktime_get());
  1371	
  1372		if ((type == QI_DIOTLB_TYPE || type == QI_DEIOTLB_TYPE) &&
  1373		    dmar_latency_enabled(iommu, DMAR_LATENCY_INV_DEVTLB))
  1374			devtlb_start_ktime = ktime_to_ns(ktime_get());
  1375	
  1376		if (type == QI_IEC_TYPE &&
  1377		    dmar_latency_enabled(iommu, DMAR_LATENCY_INV_IEC))
  1378			iec_start_ktime = ktime_to_ns(ktime_get());
  1379	
  1380	restart:
  1381		rc = 0;
  1382	
  1383		raw_spin_lock_irqsave(&qi->q_lock, flags);
  1384		/*
  1385		 * Check if we have enough empty slots in the queue to submit,
  1386		 * the calculation is based on:
  1387		 * # of desc + 1 wait desc + 1 space between head and tail
  1388		 */
  1389		while (qi->free_cnt < count + 2) {
  1390			raw_spin_unlock_irqrestore(&qi->q_lock, flags);
  1391			cpu_relax();
  1392			raw_spin_lock_irqsave(&qi->q_lock, flags);
  1393		}
  1394	
  1395		index = qi->free_head;
  1396		wait_index = (index + count) % QI_LENGTH;
  1397		shift = qi_shift(iommu);
  1398	
  1399		for (i = 0; i < count; i++) {
  1400			offset = ((index + i) % QI_LENGTH) << shift;
  1401			memcpy(qi->desc + offset, &desc[i], 1 << shift);
  1402			qi->desc_status[(index + i) % QI_LENGTH] = QI_IN_USE;
  1403			trace_qi_submit(iommu, desc[i].qw0, desc[i].qw1,
  1404					desc[i].qw2, desc[i].qw3);
  1405		}
  1406		qi->desc_status[wait_index] = QI_IN_USE;
  1407	
  1408		wait_desc.qw0 = QI_IWD_STATUS_DATA(QI_DONE) |
  1409				QI_IWD_STATUS_WRITE | QI_IWD_TYPE;
  1410		if (options & QI_OPT_WAIT_DRAIN)
  1411			wait_desc.qw0 |= QI_IWD_PRQ_DRAIN;
  1412		wait_desc.qw1 = virt_to_phys(&qi->desc_status[wait_index]);
  1413		wait_desc.qw2 = 0;
  1414		wait_desc.qw3 = 0;
  1415	
  1416		if ((desc[count - 1].qw0 & 0xF) == 9) {
  1417			if ((desc[count - 1].qw0 & 0xF000) == 0)
> 1418				iommu->num_prrs++;
  1419			else if ((desc[count - 1].qw0 & 0xF000) == 0x1000)
> 1420				iommu->num_prri++;
  1421		}
  1422	
  1423		offset = wait_index << shift;
  1424		memcpy(qi->desc + offset, &wait_desc, 1 << shift);
  1425	
  1426		qi->free_head = (qi->free_head + count + 1) % QI_LENGTH;
  1427		qi->free_cnt -= count + 1;
  1428	
  1429		/*
  1430		 * update the HW tail register indicating the presence of
  1431		 * new descriptors.
  1432		 */
  1433		writel(qi->free_head << shift, iommu->reg + DMAR_IQT_REG);
  1434	
  1435		while (qi->desc_status[wait_index] != QI_DONE) {
  1436			/*
  1437			 * We will leave the interrupts disabled, to prevent interrupt
  1438			 * context to queue another cmd while a cmd is already submitted
  1439			 * and waiting for completion on this cpu. This is to avoid
  1440			 * a deadlock where the interrupt context can wait indefinitely
  1441			 * for free slots in the queue.
  1442			 */
  1443			rc = qi_check_fault(iommu, index, wait_index);
  1444			if (rc)
  1445				break;
  1446	
  1447			if (!qi_done_no_cpu_relax) {
  1448				raw_spin_unlock(&qi->q_lock);
  1449				cpu_relax();
  1450				raw_spin_lock(&qi->q_lock);
  1451			}
  1452		}
  1453	
  1454		for (i = 0; i < count; i++)
  1455			qi->desc_status[(index + i) % QI_LENGTH] = QI_DONE;
  1456	
  1457		reclaim_free_desc(qi);
  1458		raw_spin_unlock_irqrestore(&qi->q_lock, flags);
  1459	
  1460		if (rc == -EAGAIN)
  1461			goto restart;
  1462	
  1463		if (iotlb_start_ktime)
  1464			dmar_latency_update(iommu, DMAR_LATENCY_INV_IOTLB,
  1465					ktime_to_ns(ktime_get()) - iotlb_start_ktime);
  1466	
  1467		if (devtlb_start_ktime)
  1468			dmar_latency_update(iommu, DMAR_LATENCY_INV_DEVTLB,
  1469					ktime_to_ns(ktime_get()) - devtlb_start_ktime);
  1470	
  1471		if (iec_start_ktime)
  1472			dmar_latency_update(iommu, DMAR_LATENCY_INV_IEC,
  1473					ktime_to_ns(ktime_get()) - iec_start_ktime);
  1474	
  1475		return rc;
  1476	}
  1477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
