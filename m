Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE81D9A5F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 21:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764970946; cv=none; b=DRtaGSdZPLGlez9s+3jnyv98zdvCSkSEdRBtmfnRr7PkyhkRmHcFuJnG0CHgW5QJ+Xp/lEyzDJyn83edMFJ5qC+zFu29xs5pjCmEeErIPECVVZjgbspqVyFDwjdIhslgVGOpZQKOyGf9LQCMTezF0F9uVxoy07Jtud7PhYfcKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764970946; c=relaxed/simple;
	bh=YhIpuIyQUMofNHyx/2v1GA+pqLufSOsdNBUEgSTK/BI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJLjbcxUmOHmUyeiuLcwbLaaMMywkdTw35YPEe3JFK9/2YrMQwkhDAQ65qnQDRaZ38EXs3I3aAfSxgH0Kazk18yd2Mt7OQI06W715We2XS8s7dMTYdW47nIP7wLiDciQV8HDQaeM3lZALte32L9SBgljMM0KF+UxjIeeyQFfsmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuSanF8q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuSanF8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764970944; x=1796506944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhIpuIyQUMofNHyx/2v1GA+pqLufSOsdNBUEgSTK/BI=;
  b=BuSanF8qi8bI+KEcqqlUqnxQ1DSfxEzP6q3OAI6er/eZfVylgMiN0LSj
   +gNZEndiduqS/WRwwcIqWoccR8VUgMv+lyRCL5lpR0XTMLZenoPNiJrqi
   eqA08o1ZzX4t7pMqBc3E6TWne55bfasPFYGcr/QmS+yo5ZTGoburXTfHK
   P0J1BCJQhDw1QZ8zowHabZApgzxwSi/1poA2D8jB/RD6DpIyvtnISfEmQ
   bVfLvgGpOQlSL6T6jPlqTwbGgnbKHDzN0wCYORwDtU+6zkrc1g/stx8J/
   MFAVji+nat9B5dosGnZwm9Xha3m039FfDUNChoTuZYFa5DJAPSoQbT6QK
   Q==;
X-CSE-ConnectionGUID: Qjw3XGF8SEq0WTxwHtcU3g==
X-CSE-MsgGUID: itX/ftwPRJC6q+zayJMPlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66904249"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="66904249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 13:42:23 -0800
X-CSE-ConnectionGUID: opOk9X5PRsusfzBe4OSvuA==
X-CSE-MsgGUID: HJ1XrQ+hSn6L+3UkVw0q+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195412713"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Dec 2025 13:42:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRdZE-00000000FZT-0dmG;
	Fri, 05 Dec 2025 21:42:20 +0000
Date: Sat, 6 Dec 2025 05:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3382/3382]
 drivers/crypto/hisilicon/migration/acc_vf_migration.c:1622:43: error:
 'struct pci_dev' has no member named 'sriov'
Message-ID: <202512060558.eWAtEGfZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   06a8b520851290347ca458d4335bebc607fe3b58
commit: f1fd3a9b0bfc6f7da507ee6f9a32398c962281a6 [3382/3382] vfio/migration: Modify the vf id acquisition method
config: arm64-randconfig-r122-20251205 (https://download.01.org/0day-ci/archive/20251206/202512060558.eWAtEGfZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060558.eWAtEGfZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060558.eWAtEGfZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/crypto/hisilicon/migration/acc_vf_migration.c:11:
   include/linux/pci.h: In function 'pci_physfn':
   include/linux/pci.h:546:14: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
      dev = dev->physfn;
                 ^~~~~~
                 is_physfn
   drivers/crypto/hisilicon/migration/acc_vf_migration.c: In function 'vf_qm_pci_init':
   drivers/crypto/hisilicon/migration/acc_vf_migration.c:1535:8: error: implicit declaration of function 'pci_request_mem_regions'; did you mean 'pci_request_regions'? [-Werror=implicit-function-declaration]
     ret = pci_request_mem_regions(pdev, vfqm->dev_name);
           ^~~~~~~~~~~~~~~~~~~~~~~
           pci_request_regions
   drivers/crypto/hisilicon/migration/acc_vf_migration.c:1571:2: error: implicit declaration of function 'pci_release_mem_regions'; did you mean 'pci_release_regions'? [-Werror=implicit-function-declaration]
     pci_release_mem_regions(pdev);
     ^~~~~~~~~~~~~~~~~~~~~~~
     pci_release_regions
   drivers/crypto/hisilicon/migration/acc_vf_migration.c: In function 'hisi_acc_get_vf_id':
>> drivers/crypto/hisilicon/migration/acc_vf_migration.c:1622:43: error: 'struct pci_dev' has no member named 'sriov'
      ((pf->bus->number << 8) + pf->devfn + pf->sriov->offset)) /
                                              ^~
   drivers/crypto/hisilicon/migration/acc_vf_migration.c:1623:11: error: 'struct pci_dev' has no member named 'sriov'
            pf->sriov->stride;
              ^~
   drivers/crypto/hisilicon/migration/acc_vf_migration.c: In function 'acc_vf_probe':
   drivers/crypto/hisilicon/migration/acc_vf_migration.c:1633:17: error: 'struct pci_dev' has no member named 'physfn'; did you mean 'is_physfn'?
     pf_dev = pdev->physfn;
                    ^~~~~~
                    is_physfn
   drivers/crypto/hisilicon/migration/acc_vf_migration.c: In function 'hisi_acc_get_vf_id':
>> drivers/crypto/hisilicon/migration/acc_vf_migration.c:1624:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_IOV
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - CRYPTO_DEV_HISI_MIGRATION [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]


vim +1622 drivers/crypto/hisilicon/migration/acc_vf_migration.c

  1612	
  1613	static int hisi_acc_get_vf_id(struct pci_dev *dev)
  1614	{
  1615		struct pci_dev *pf;
  1616	
  1617		if (!dev->is_virtfn)
  1618			return -EINVAL;
  1619	
  1620		pf = pci_physfn(dev);
  1621		return (((dev->bus->number << 8) + dev->devfn) -
> 1622			((pf->bus->number << 8) + pf->devfn + pf->sriov->offset)) /
  1623		       pf->sriov->stride;
> 1624	}
  1625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
