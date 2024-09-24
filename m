Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42EB139CE9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727210144; cv=none; b=drvw/xOu+3aSrJ6WL2LESj94s7cuGzfFy0+DzgiFYKrDeXePKBvm7Q977r+L6twx2Q3ZfqVyjuXvDZ4XqdVLAcFhilbnVMvlLbOycnMajIWPb9WIAs7pt6U25VDZUpJ6hzgBoyndYDZj6nuIQTo+k5yQejM84iufVEpsO4wqph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727210144; c=relaxed/simple;
	bh=r+shGq2VZ26nUsvuB5W3Uzil23dhay4LgQRkjS3wl0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGFzGQ9bvosKPsFL5nig++QvtqMg80diDuahT/b+a+H+WtYRa06+G1EaRNXLdkmoHekD5n9/joGOX2UpSAv0vzLDOAB0DdXTXxt5C/xVZk0HMjGOwqfr7Mfo10APECML4orUnccuwMivgru7gHaGqu/HiMYXmYDVlOZEIKZWQIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoCbK6gW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoCbK6gW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727210143; x=1758746143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+shGq2VZ26nUsvuB5W3Uzil23dhay4LgQRkjS3wl0Q=;
  b=DoCbK6gWRz7WmDYoiPbv+NC6LHWsylQg2sLtTchvXi05M2y2JPHjnI7n
   cNQAwsMZ+QOCUqgFGm3IDkSk8+aL+FNJhBu9gqOZFXxjYqQ7MGu9U03P/
   r5vAyI2FTjWoJudCeNU2H/HpDdHWKwyFanUGN+I6XACfz2J+R56Zpbbib
   RbQBBlqA1tPoajkjc7e1MX4gZ4KItiNjY22fT5OqlL3YbSw0z0rLU20Wv
   jsILRoZzgClMEDJcLkUphSf4hDhxLfQShcKNYkKfMO9tUDx6Cb/tBuGhI
   JVAEuPVmIVnW3XcfILzQgInPVoPVmoXhzab0cQCDSa8AZjMNRu+4Osfs7
   Q==;
X-CSE-ConnectionGUID: Iz5udlcaTsGvrsQ4EqOWsg==
X-CSE-MsgGUID: x6o0yr/9QWi9xm1uJ4L/4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30121535"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="30121535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 13:35:42 -0700
X-CSE-ConnectionGUID: vvGvhG+0QxSuQQurrbnMWw==
X-CSE-MsgGUID: N2rZVufBTrqjk9QW9Eamyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94869138"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 13:35:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stCG1-000Iov-0E;
	Tue, 24 Sep 2024 20:35:37 +0000
Date: Wed, 25 Sep 2024 04:35:36 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1934/2441]
 drivers/iommu/intel/dmar.c:1418:30: error: 'struct intel_iommu' has no
 member named 'num_prrs'
Message-ID: <202409250428.DYGlnOoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 291c0dc10cbc47487923c0c6b3d92703e09a5008 [1934/2441] iommu/vt-d: Add PRQ counter for debug
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240925/202409250428.DYGlnOoB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250428.DYGlnOoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250428.DYGlnOoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/dmar.c: In function 'qi_submit_sync':
>> drivers/iommu/intel/dmar.c:1418:30: error: 'struct intel_iommu' has no member named 'num_prrs'
    1418 |                         iommu->num_prrs++;
         |                              ^~
>> drivers/iommu/intel/dmar.c:1420:30: error: 'struct intel_iommu' has no member named 'num_prri'
    1420 |                         iommu->num_prri++;
         |                              ^~


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
