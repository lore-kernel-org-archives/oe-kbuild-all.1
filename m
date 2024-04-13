Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DFE33C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712993711; cv=none; b=hl4KGHFfThBXTrTUzoRLjiM/w8Z4hknLBgW3/5aOxkTerm3F482MQ1DgGH0bGgdG/ga1EWr4EKRtYqgYpefuksU5SLwOLk4jTjNA7RId3zxA75vda2L+fNAS0Wy4ahpe3D96GDU5t6ubdW+9HdAExoS3SoC3W5397RbRNxiV3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712993711; c=relaxed/simple;
	bh=FwKZzWTbU9hkkOah2qPqDUIoyA4O5ryYVo9mbFInw6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xgu6UMWd1M6CVGkEy5+tIaXojmZ01ZzvAjmYcXkycr1k2JiHdPKqen/r6zI0GU8tf5LTc1Zl7mDn0oZWENgJQcslH3MXivhCApzJmqAzXQ9NMqGaMp/sLYeKGWU7dyBSqObieIUChA5qp18wItz3mGkpomPOG2teeBZMWVMg9RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXuDk4Ky; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXuDk4Ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712993709; x=1744529709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FwKZzWTbU9hkkOah2qPqDUIoyA4O5ryYVo9mbFInw6U=;
  b=eXuDk4KysT18H/A4uy8tWXk30D+zfvuHVoDBPZsFfBygXHNBKWsN2y0c
   YNKlUTh3duNP9QK7Oz+EowKd5ThU+ia0HGsRPgbwKMFc9IWLGqrphY1Ue
   r/+KJ/AEWd4wysNZ589AdoMTKq7hRphH1AeWa5LmFuCJGDRcvXbsqRjgt
   G/Bmr4k6RF6sQDQiqYiLRsezdTTe6xlYAaqoiuTDRx/i0jIhM30mmKvmS
   5uHam+WilFVQSDj/LH8nG3ZAq/YiGmluqgL06qDo6z6MVS++G7OjUyi1G
   xBSixbGirhncHh7agk9NNM7HoBr/rRjcwZSdme4Ger/xYMQSPhbhJ9kDP
   Q==;
X-CSE-ConnectionGUID: gj5e1kBRSPihX0Ak5eDkbA==
X-CSE-MsgGUID: qAjQIdyMQ++Qw/PBDcHEFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8370887"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8370887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 00:35:08 -0700
X-CSE-ConnectionGUID: SVw57huNQGO1bLQS1B/N2A==
X-CSE-MsgGUID: sVV0jce9RGSJYYxFCTI8wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="26132262"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2024 00:35:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvXuj-00021B-0K;
	Sat, 13 Apr 2024 07:35:05 +0000
Date: Sat, 13 Apr 2024 15:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/6] PCI/TSM: Authenticate devices via platform TSM
Message-ID: <202404131527.J7luI66n-lkp@intel.com>
References: <171291193308.3532867.129739584130889725.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171291193308.3532867.129739584130889725.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/configfs-tsm-Namespace-TSM-report-symbols/20240412-171254
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/171291193308.3532867.129739584130889725.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [RFC PATCH v2 5/6] PCI/TSM: Authenticate devices via platform TSM
config: i386-randconfig-r111-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131527.J7luI66n-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131527.J7luI66n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131527.J7luI66n-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/tsm.o: in function `pci_tsm_doe_transfer':
>> drivers/pci/tsm.c:212:(.text+0x186): undefined reference to `pci_doe'
   ld: drivers/pci/tsm.o: in function `pci_tsm_init':
>> drivers/pci/tsm.c:247:(.text+0x4d2): undefined reference to `pci_find_doe_mailbox'


vim +212 drivers/pci/tsm.c

   204	
   205	int pci_tsm_doe_transfer(struct pci_dev *pdev, enum pci_doe_proto type,
   206				 const void *req, size_t req_sz, void *resp,
   207				 size_t resp_sz)
   208	{
   209		if (!pdev->tsm || !pdev->tsm->doe_mb)
   210			return -ENXIO;
   211	
 > 212		return pci_doe(pdev->tsm->doe_mb, PCI_VENDOR_ID_PCI_SIG, type, req,
   213			       req_sz, resp, resp_sz);
   214	}
   215	EXPORT_SYMBOL_GPL(pci_tsm_doe_transfer);
   216	
   217	static unsigned long pci_tsm_devid(struct pci_dev *pdev)
   218	{
   219		return FIELD_PREP(GENMASK(15, 0),
   220				  PCI_DEVID(pdev->bus->number, pdev->devfn)) |
   221		       FIELD_PREP(GENMASK(31, 16), pci_domain_nr(pdev->bus));
   222	}
   223	
   224	void pci_tsm_init(struct pci_dev *pdev)
   225	{
   226		bool tee_cap;
   227		u16 ide_cap;
   228		int rc;
   229	
   230		ide_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_IDE);
   231		tee_cap = pdev->devcap & PCI_EXP_DEVCAP_TEE;
   232	
   233		if (ide_cap || tee_cap)
   234			pci_dbg(pdev,
   235				"Device security capabailities detected (%s%s ), init TSM\n",
   236				ide_cap ? " ide" : "", tee_cap ? " tee" : "");
   237		else
   238			return;
   239	
   240		struct pci_tsm *pci_tsm __free(kfree) = kzalloc(sizeof(*pci_tsm), GFP_KERNEL);
   241		if (!pci_tsm)
   242			return;
   243	
   244		pci_tsm->ide_cap = ide_cap;
   245		mutex_init(&pci_tsm->exec_lock);
   246	
 > 247		pci_tsm->doe_mb = pci_find_doe_mailbox(pdev, PCI_VENDOR_ID_PCI_SIG,
   248						       PCI_DOE_PROTO_CMA);
   249		if (!pci_tsm->doe_mb)
   250			return;
   251	
   252		rc = xa_insert(&pci_tsm_devs, pci_tsm_devid(pdev), pdev, GFP_KERNEL);
   253		if (rc) {
   254			pci_dbg(pdev, "failed to register TSM capable device\n");
   255			return;
   256		}
   257	
   258		guard(rwsem_write)(&pci_tsm_rwsem);
   259		pdev->tsm = no_free_ptr(pci_tsm);
   260		pci_tsm_add(pdev);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
