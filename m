Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642464C61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706697086; cv=none; b=EEkL3zBfolDR39x5Udo/v3em9EFCI/5gElRaqeh+oABhYRiqjuwxrXUW0rHhiRcCsZBCeOsIKwp51M7rRmiZ081o1OVtTU53hlVTDSlvYrQeNRT8MAA2mLVmW3TGzZ+etFVhrEHEHCfQFf1Hbw6Gb/Q5T4jxCdmfyyEnW7VwakA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706697086; c=relaxed/simple;
	bh=yJ/wZknYhDuWDo1qBFs2gPC4G8ZpdyOrsxg+JFKUZW0=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=fs8ZqnCrlKXjWoV798eISuWocVcBrdrSrzXZdyxFA3p28636Uz/OvrxRCPA0oM7oL1qDIriPoFL23pAR2XF1M/Axm1yG13whme22tPEG10fTAYIThKB09wUjzbyNmOEazuqbuujagez9A9YICS4kURGPoaAph5QU8Da9C8Rz4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=G7PhyQr0; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="G7PhyQr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTz7MaMuPLM1cq2rliOd+ts1745v/BEjnjd69pWc0Vk=;
  b=G7PhyQr0zUZ22Xqvcu9FDeq1FHKx2pncvtdFyrCROQtxWMCTYW5orZ/L
   l0DFZw6/U8uvAz664HElGt7kNtVu5Jd30e84UBCGq7Sf5GoZA9AtnS7QQ
   4EiEcYLtuNfd1aDjkPQyAovWHrnUN6CCw1IdVrtbuhXUYMQliDxhd+Ipa
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.05,231,1701126000"; 
   d="scan'208";a="78343153"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 11:31:19 +0100
Date: Wed, 31 Jan 2024 11:31:18 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: leoliu-oc <leoliu-oc@zhaoxin.com>
cc: kernel@openeuler.org, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2493/2888] arch/x86/events/zhaoxin/uncore.c:1593:1-6:
 alloc with no test, possible model on line 1609 (fwd)
Message-ID: <alpine.DEB.2.22.394.2401311130220.3245@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

There should be a NULL check after the kzalloc on line 1593.

julia

---------- Forwarded message ----------
Date: Wed, 31 Jan 2024 17:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 2493/2888]
    arch/x86/events/zhaoxin/uncore.c:1593:1-6: alloc with no test,
    possible model on line 1609

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: "leoliu-oc" <leoliu-oc@zhaoxin.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3fa3a33cab8bb921b3e1f6639855f4549009cd90
commit: 5cbf647edcff3d5cda5cb172c6bf0e4c1b6e8ec6 [2493/2888] x86/perf: Add uncore performance events support for Zhaoxin CPU
:::::: branch date: 2 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-104-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311737.oD4LmLlz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401311737.oD4LmLlz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:1593:1-6: alloc with no test, possible model on line 1609

vim +1593 arch/x86/events/zhaoxin/uncore.c

5cbf647edcff3d5 leoliu-oc 2023-11-30  1567
5cbf647edcff3d5 leoliu-oc 2023-11-30  1568  /*
5cbf647edcff3d5 leoliu-oc 2023-11-30  1569   * add a pci uncore device
5cbf647edcff3d5 leoliu-oc 2023-11-30  1570   */
5cbf647edcff3d5 leoliu-oc 2023-11-30  1571  static int uncore_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1572  {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1573  	struct zhaoxin_uncore_type *type;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1574  	struct zhaoxin_uncore_pmu *pmu;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1575  	struct zhaoxin_uncore_box *box;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1576  	struct zhaoxin_uncore_box **boxes;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1577
5cbf647edcff3d5 leoliu-oc 2023-11-30  1578  	int loop, i, j = 0;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1579
5cbf647edcff3d5 leoliu-oc 2023-11-30  1580  	int subnode_id, ret = 0;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1581
5cbf647edcff3d5 leoliu-oc 2023-11-30  1582  	subnode_id = uncore_pcibus_to_subnodeid(pdev->bus);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1583  	if (subnode_id < 0)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1584  		return -EINVAL;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1585
5cbf647edcff3d5 leoliu-oc 2023-11-30  1586  	type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data)];
5cbf647edcff3d5 leoliu-oc 2023-11-30  1587
5cbf647edcff3d5 leoliu-oc 2023-11-30  1588  	if (!strcmp(type->name, "mc0"))
5cbf647edcff3d5 leoliu-oc 2023-11-30  1589  		loop = 2;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1590  	else
5cbf647edcff3d5 leoliu-oc 2023-11-30  1591  		loop = 1;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1592
5cbf647edcff3d5 leoliu-oc 2023-11-30 @1593  	boxes = kzalloc(loop * sizeof(struct zhaoxin_uncore_box *), GFP_KERNEL);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1594
5cbf647edcff3d5 leoliu-oc 2023-11-30  1595  	for (i = 0; i < loop; i++) {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1596  		type = uncore_pci_uncores[UNCORE_PCI_DEV_TYPE(id->driver_data) + j];
5cbf647edcff3d5 leoliu-oc 2023-11-30  1597
5cbf647edcff3d5 leoliu-oc 2023-11-30  1598  		if (!type)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1599  			continue;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1600  		/*
5cbf647edcff3d5 leoliu-oc 2023-11-30  1601  		 * for performance monitoring unit with multiple boxes,
5cbf647edcff3d5 leoliu-oc 2023-11-30  1602  		 * each box has a different function id.
5cbf647edcff3d5 leoliu-oc 2023-11-30  1603  		 */
5cbf647edcff3d5 leoliu-oc 2023-11-30  1604
5cbf647edcff3d5 leoliu-oc 2023-11-30  1605  		pmu = &type->pmus[UNCORE_PCI_DEV_IDX(id->driver_data)];
5cbf647edcff3d5 leoliu-oc 2023-11-30  1606
5cbf647edcff3d5 leoliu-oc 2023-11-30  1607  		if (WARN_ON_ONCE(pmu->boxes[subnode_id] != NULL))
5cbf647edcff3d5 leoliu-oc 2023-11-30  1608  			return -EINVAL;
5cbf647edcff3d5 leoliu-oc 2023-11-30 @1609  		box = uncore_alloc_box(type, NUMA_NO_NODE);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1610  		if (!box)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1611  			return -ENOMEM;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1612
5cbf647edcff3d5 leoliu-oc 2023-11-30  1613  		if (pmu->func_id < 0)
5cbf647edcff3d5 leoliu-oc 2023-11-30  1614  			pmu->func_id = pdev->devfn;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1615  		else
5cbf647edcff3d5 leoliu-oc 2023-11-30  1616  			WARN_ON_ONCE(pmu->func_id != pdev->devfn);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1617
5cbf647edcff3d5 leoliu-oc 2023-11-30  1618  		atomic_inc(&box->refcnt);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1619  		box->subnode_id = subnode_id;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1620  		box->pci_dev = pdev;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1621  		box->pmu = pmu;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1622  		uncore_box_init(box);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1623  		boxes[i] = box;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1624
5cbf647edcff3d5 leoliu-oc 2023-11-30  1625  		pci_set_drvdata(pdev, boxes);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1626  		pmu->boxes[subnode_id] = box;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1627  		if (atomic_inc_return(&pmu->activeboxes) > 1) {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1628  			if (!strcmp(type->name, "mc0"))
5cbf647edcff3d5 leoliu-oc 2023-11-30  1629  				goto next_loop;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1630  			else
5cbf647edcff3d5 leoliu-oc 2023-11-30  1631  				return 0;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1632  		}
5cbf647edcff3d5 leoliu-oc 2023-11-30  1633  		/* First active box registers the pmu */
5cbf647edcff3d5 leoliu-oc 2023-11-30  1634  		ret = uncore_pmu_register(pmu);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1635  		if (ret) {
5cbf647edcff3d5 leoliu-oc 2023-11-30  1636  			pci_set_drvdata(pdev, NULL);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1637  			pmu->boxes[subnode_id] = NULL;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1638  			uncore_box_exit(box);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1639  			kfree(box);
5cbf647edcff3d5 leoliu-oc 2023-11-30  1640  		}
5cbf647edcff3d5 leoliu-oc 2023-11-30  1641  next_loop:
5cbf647edcff3d5 leoliu-oc 2023-11-30  1642  		j++;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1643  	}
5cbf647edcff3d5 leoliu-oc 2023-11-30  1644  	return ret;
5cbf647edcff3d5 leoliu-oc 2023-11-30  1645  }
5cbf647edcff3d5 leoliu-oc 2023-11-30  1646

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
