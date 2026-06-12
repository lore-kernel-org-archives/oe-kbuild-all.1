Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965EE3148DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781294240; cv=none; b=RXoaUuFjPq66+k1udsvMN2Daho25UE/llvK2RrqFbOSOU27mA7DNem3lDsijHhscn6OPrSJsewLB3zPGIGg8DlLNPS6+PAd0bw2lhcfN9HoduAoxyK5UulKC5ForNsk681LDTrLe6HcYEP5H9ZcTtOr/2qDkuMPHebxLOD5q5Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781294240; c=relaxed/simple;
	bh=j62z+6Rqqomof3dWkbb7J3rFXCzn2rE1dphjpIVBHW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bu3muk88Bq8MyXDUPzqxongZ71n1zW2ffrlbtqcNnVCb35JIS9Am/k3ouK4JW3vzaxGELzKl0zaNj6hpaqi/f3V5BvKrip9UaDljiKqX9KiKoXSWQ21WlELMv01/frWIao957K8dBehQ4bpaGB1deUuAheQ86q3j+pQWWt2qCXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdLfntyC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdLfntyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781294239; x=1812830239;
  h=date:from:to:cc:subject:message-id;
  bh=j62z+6Rqqomof3dWkbb7J3rFXCzn2rE1dphjpIVBHW4=;
  b=XdLfntyCk+YqX2QTBa0UWFNCieJ7+hzk36yljdyU3XpQxiseNWkwVRN4
   EWNmkhuuBxStM5lmLtt31H0X572LVgPPatNK4HhJE38sqxogotftr6mhY
   sXZuoYmXxgGeQsgrqt3hlw3bQHDi2ahNMN1r2IvHkW23GaELzvnDVrWpF
   2fpjugcrzXlAI4ossHlBuzoCaUUBP6wURF8y5OxHk1DalpLvzhpq65ogr
   eDCrmCmH9M9mibG08olmoBCeWRBQN6pH7z+cs9xTdXlt+MqNLo3qgF+45
   QHwfnPQstTgznOA3N/VILOU9LGTjG+3NWb7PxMTWE6LyjBMeFrcgloIy7
   w==;
X-CSE-ConnectionGUID: ke/xgrc9TZuLBUztQW4QoQ==
X-CSE-MsgGUID: olT3MiZWQyKwk2ngcpKmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99553188"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="99553188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 12:57:18 -0700
X-CSE-ConnectionGUID: sxAG23eOQkuubAWqgH9ICw==
X-CSE-MsgGUID: /0Rdi4c2RUyibCI3WtvLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="277099974"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 12:57:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY80A-00000000PGz-1W0A;
	Fri, 12 Jun 2026 19:57:14 +0000
Date: Sat, 13 Jun 2026 03:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/pci/tsm.c:898:9: error: implicit
 declaration of function 'PM_RUNTIME_ACQUIRE'
Message-ID: <202606130304.iOT1SrkW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   1b171c8bdd4577ceb504cb77b4a6b51f98436722
commit: 1b171c8bdd4577ceb504cb77b4a6b51f98436722 [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606130304.iOT1SrkW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130304.iOT1SrkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130304.iOT1SrkW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/tsm.c: In function 'pci_tsm_doe_transfer':
>> drivers/pci/tsm.c:898:9: error: implicit declaration of function 'PM_RUNTIME_ACQUIRE' [-Wimplicit-function-declaration]
     898 |         PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/pci/tsm.c:898:40: error: 'pm' undeclared (first use in this function); did you mean 'tm'?
     898 |         PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
         |                                        ^~
         |                                        tm
   drivers/pci/tsm.c:898:40: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/pci/tsm.c:899:18: error: implicit declaration of function 'PM_RUNTIME_ACQUIRE_ERR' [-Wimplicit-function-declaration]
     899 |         if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/PM_RUNTIME_ACQUIRE +898 drivers/pci/tsm.c

   884	
   885	int pci_tsm_doe_transfer(struct pci_dev *pdev, u8 type, const void *req,
   886				 size_t req_sz, void *resp, size_t resp_sz)
   887	{
   888		struct pci_tsm_pf0 *tsm;
   889		int rc;
   890	
   891		if (!pdev->tsm || !is_pci_tsm_pf0(pdev))
   892			return -ENXIO;
   893	
   894		tsm = to_pci_tsm_pf0(pdev->tsm);
   895		if (!tsm->doe_mb)
   896			return -ENXIO;
   897	
 > 898		PM_RUNTIME_ACQUIRE(&pdev->dev, pm);
 > 899		if (rc = PM_RUNTIME_ACQUIRE_ERR(&pm))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
