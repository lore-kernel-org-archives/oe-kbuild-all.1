Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272002FB97D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303235; cv=none; b=RNaAL8IA1dtc2r3AvyJnKjMYY6jE5ruKb3uH8iSCyGc8O3DkmpdIXisP+xHlgv3Q29YheoCg2NEBGgkSnxouw0YPUAK+gnu0sA5JGkhMZIRZBsNNrsqnxyzSKQUKUrJ5Y83CFYONg4B3ljZT9k+3GnoOYST1UTXcKCbLtqaQ3PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303235; c=relaxed/simple;
	bh=Y//a4HvpmZkcNnb0AD45ua/GZ2fzKYagpSKaG/d0KbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qcOZthVSeLqFTf97XN9IUanxfSMdlWlYO4TM5C9ETdu54Q8LkRUmlqvcDUg8SsVlPP2IHREPS1tPpn+zgkchgFFyqK2302mxwgAG71ovgFXAGzM7z/p5VheqYU1AJw+VBSINh568DB/N6gkoGXzcdD+Hg1GiijRe7Ntby7EeCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/GCb4bI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/GCb4bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781303234; x=1812839234;
  h=date:from:to:cc:subject:message-id;
  bh=Y//a4HvpmZkcNnb0AD45ua/GZ2fzKYagpSKaG/d0KbY=;
  b=n/GCb4bIvP5/PFDV0RfnZGG0UmKMJ6p0H/9+caohN16jxtKbqi3P4e3a
   lgjFJ22738Ly5fYDHMq/ekZuJOTJfknImKniNxd8PoFoZXv4w4aJOCgfU
   kh0JNIbrdWmwqxWHq1h0Ffeiqn0FqLdZqnanpGJUTNqSXw9ZQXgKUqd9g
   i+NJTWTJZFNyr4M8NE2kanMpBG7yUMFeKMYdAppDh+2seMomcMxdyZdKu
   kEYMQKzvxWp12JEVp1X6d6W6+Bva/HEHvSNXXz9XK95YqXXLpuQVtiXB/
   XbWPBdH3yqUya7AmmHIdb/n2odLKnSk6GwR89AdlLgydjy+1/AGMoZMr0
   w==;
X-CSE-ConnectionGUID: m3FGeK+6Rzia0H3EyLFeoA==
X-CSE-MsgGUID: PU4Al6agQY6Ogsu4HGesfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85774924"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="85774924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 15:27:14 -0700
X-CSE-ConnectionGUID: 4lga8c1IR8iP/4lLo8JGpA==
X-CSE-MsgGUID: obqWLJutTiGCDdkXcyHfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250849485"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 15:27:12 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYALF-000000004LV-3yJE;
	Fri, 12 Jun 2026 22:27:09 +0000
Date: Sat, 13 Jun 2026 00:26:55 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tsm_d0 1/1] drivers/pci/tsm.c:898:9: error: implicit
 declaration of function 'PM_RUNTIME_ACQUIRE'
Message-ID: <202606130037.MA3k7IPJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux tsm_d0
head:   1b171c8bdd4577ceb504cb77b4a6b51f98436722
commit: 1b171c8bdd4577ceb504cb77b4a6b51f98436722 [1/1] PCI/TSM: Resume device to D0 for CMA-SPDM operation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260613/202606130037.MA3k7IPJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130037.MA3k7IPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130037.MA3k7IPJ-lkp@intel.com/

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
--
   drivers/crypto/ccp/sev-dev-tsm.c: In function 'sev_tio_spdm_cmd':
>> drivers/crypto/ccp/sev-dev-tsm.c:42:9: error: implicit declaration of function 'PM_RUNTIME_ACQUIRE' [-Wimplicit-function-declaration]
      42 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/sev-dev-tsm.c:42:52: error: 'pm' undeclared (first use in this function); did you mean 'tm'?
      42 |         PM_RUNTIME_ACQUIRE(dsm->tsm.base_tsm.pdev, pm);
         |                                                    ^~
         |                                                    tm
   drivers/crypto/ccp/sev-dev-tsm.c:42:52: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/crypto/ccp/sev-dev-tsm.c:43:22: error: implicit declaration of function 'PM_RUNTIME_ACQUIRE_ERR' [-Wimplicit-function-declaration]
      43 |         if (pm_ret = PM_RUNTIME_ACQUIRE_ERR(&pm))
         |                      ^~~~~~~~~~~~~~~~~~~~~~


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
