Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF95272E63
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253226; cv=none; b=namSsADw4n9zGeUEoYYjUjZd9+czcbxZBL1n8gC7KdOO6anwZ2cPJjv80oE7pPqYPFjIvjVhASrr7qkPreTYh9Yoa8+AQYWQy7h6BGJvRAjWTjw/3PAxzlGOOXydKT/ovk25xriwtD+sPGc59dANyC5dOiO/wfPbJLr1hplAMXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253226; c=relaxed/simple;
	bh=gScxm6CnROa3uZ09KE5cxAsJBQSDQEuKnhuhP8jWQHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idlQGmxuQJfoyfXIv74Z5A9ISAzj4jywZJKN3JHlRLnEC3UBfoeN4Yd8vqofl2x0BoTbJXqTsHmdaA77y6tq9WVZIuAt19O2r0wayK4LxOKtIxDMuNObepbyKSALlc1s1XskyRXUjdPVPR5PGqqrSo/YuAgynn5yQZJy5PQVG4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbWJUBS/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbWJUBS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762253224; x=1793789224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gScxm6CnROa3uZ09KE5cxAsJBQSDQEuKnhuhP8jWQHk=;
  b=PbWJUBS/WN7AbY7RHXuJ07yc0kctIzmDfXDzsveozJY/IXMWi8NnXxsI
   W/pW2O0oz9EwMzH5fKyVnzF0mP56hTMo8huF5oZ2Jyanpwhh4pgQhqJiO
   spa8Fh8bDFXClKxBBIXy5NyGbNtnPBClfm39ohs3L5MUSDheFMgRUeYnA
   1CUMwAKCbrlRnO1xv3D3B+8MAz5MLLVPG3xpTZCdCIllEwTGgo0kv440S
   3xpRCJvKEQWVInxYODfHxONewwRLIUCK6mO0Orx5dQwx1DvzGuaOa1zN8
   Q72NxG77B6zMdyzwVCdGg/5LGt/WCZrFosrF4FxdriqQE5DvZWRGGolpn
   Q==;
X-CSE-ConnectionGUID: ys/5NUpyRVqiAf5PyGu1Xg==
X-CSE-MsgGUID: u2rRjIJGSIqd+HvwRh5KwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68203400"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="68203400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:47:03 -0800
X-CSE-ConnectionGUID: LCDNcIwxTLuuHqI7P897uQ==
X-CSE-MsgGUID: vAR0sPbITIuR5jwjWmkh0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191434867"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 02:47:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGEZ2-000RIA-1v;
	Tue, 04 Nov 2025 10:47:00 +0000
Date: Tue, 4 Nov 2025 18:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 4/9] PCI/TSM: Establish Secure Sessions and Link
 Encryption
Message-ID: <202511041832.ylcgIiqN-lkp@intel.com>
References: <20251031212902.2256310-5-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031212902.2256310-5-dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/coco-tsm-Introduce-a-core-device-for-TEE-Security-Managers/20251101-053254
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251031212902.2256310-5-dan.j.williams%40intel.com
patch subject: [PATCH v8 4/9] PCI/TSM: Establish Secure Sessions and Link Encryption
config: sparc-randconfig-r064-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041832.ylcgIiqN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041832.ylcgIiqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041832.ylcgIiqN-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/pci/tsm.o: in function `connect_store':
>> drivers/pci/tsm.c:256:(.text+0xbdc): undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]


vim +256 drivers/pci/tsm.c

   238	
   239	static ssize_t connect_store(struct device *dev, struct device_attribute *attr,
   240				     const char *buf, size_t len)
   241	{
   242		struct pci_dev *pdev = to_pci_dev(dev);
   243		int rc, id;
   244	
   245		rc = sscanf(buf, "tsm%d\n", &id);
   246		if (rc != 1)
   247			return -EINVAL;
   248	
   249		ACQUIRE(rwsem_write_kill, lock)(&pci_tsm_rwsem);
   250		if ((rc = ACQUIRE_ERR(rwsem_write_kill, &lock)))
   251			return rc;
   252	
   253		if (pdev->tsm)
   254			return -EBUSY;
   255	
 > 256		struct tsm_dev *tsm_dev __free(put_tsm_dev) = find_tsm_dev(id);
   257		if (!is_link_tsm(tsm_dev))
   258			return -ENXIO;
   259	
   260		rc = pci_tsm_connect(pdev, tsm_dev);
   261		if (rc)
   262			return rc;
   263		return len;
   264	}
   265	static DEVICE_ATTR_RW(connect);
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
