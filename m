Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5932F24
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712173275; cv=none; b=uJYj9AZm4ub1ZXPdCEGJAHg2aeCn2YRKrafKDwIp+QLUmQ2plhE0TihHlh0wvhIRsswDSy0WkF0QEZo2ehWrD1JvEnP1GhnVhnURnnkcA7km/9Bc4Y3ryoDJcNSBUHEKjp7xFryziCewCvutzpZiuD1S5YrI1vPvX1Jv/YomTGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712173275; c=relaxed/simple;
	bh=9VSoittwhxBN0J+TZzIu4jnPEtbhW4o2SOPhXU0s69A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDxrPbYH2NZ8n9lEMD3aaOYgunU0530g4X2C6GxnBptT+w7ZtnEPZnH4Nqn8K1io+00j/2YgW3vDWrkWne+7kFJtQ3ruJipOjpM7gnhzzgeKLyqBZywXCUcgsPFnsRe1SXRd00zISxIagp1Vq4Ann1nnNsM+Qukz3gWh0oxGmqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XL7mDeOL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XL7mDeOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712173273; x=1743709273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9VSoittwhxBN0J+TZzIu4jnPEtbhW4o2SOPhXU0s69A=;
  b=XL7mDeOLIsU9c5Gw75PVm34LFQwBIP0aA/o0r0Rta9fWU47X+sMfnmWA
   P6G1NqkEG51QjKSQ/Ps37ypA6gFxlVihguBHvXxq0RpP3T52PDLhdF0ev
   lZG+JV59ZK6jEgJ7FA/AyvxzOpQXY7PRCKZXr6FGQaTr2Ft+4qOVWssW/
   ZgbNMDBXwfV15shj7ZC55cOH04CG1VAaCblntHByIS+rYX+UUSSdtzSU3
   OsWLpKxje0Mh+KjO/WuiNgHycQXGjXwVF9nBn4GViEXnLKidtsQ1ygzFQ
   t5uxrIJSwUFFua6dNucIv69Cq6E49K/uB0682fOZJjm3fQ1xuK7MfCKew
   A==;
X-CSE-ConnectionGUID: s2eGs0gAS/OXVU5QBTdQbw==
X-CSE-MsgGUID: V3Kft6rLTRCFKOG8CRRsTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7618098"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7618098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 12:41:12 -0700
X-CSE-ConnectionGUID: vlhjbwg2TZqPmpDcWof3DA==
X-CSE-MsgGUID: DBFU7mndRMOcoq19iOrYWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="19147947"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Apr 2024 12:41:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs6Ts-0000Ak-2t;
	Wed, 03 Apr 2024 19:41:08 +0000
Date: Thu, 4 Apr 2024 03:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vivek-drm-tip:virtgpu_import_rfc 9/9]
 drivers/dma-buf/udmabuf.c:347:32: sparse: sparse: incorrect type in argument
 1 (different base types)
Message-ID: <202404040322.DvahaQq5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git virtgpu_import_rfc
head:   2347bf8ba6d850818b830aa54bb75d4b892fb6a8
commit: 2347bf8ba6d850818b830aa54bb75d4b892fb6a8 [9/9] udmabuf: Implement UDMABUF_CREATE_LIST_FOR_PCIDEV ioctl
config: powerpc64-randconfig-r131-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040322.DvahaQq5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404040322.DvahaQq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040322.DvahaQq5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/udmabuf.c:347:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *kaddr @@     got unsigned long @@
   drivers/dma-buf/udmabuf.c:347:32: sparse:     expected void const *kaddr
   drivers/dma-buf/udmabuf.c:347:32: sparse:     got unsigned long

vim +347 drivers/dma-buf/udmabuf.c

   299	
   300	static int handle_pcidev_pages(struct udmabuf *ubuf,
   301				       struct udmabuf_create_list *head,
   302				       struct udmabuf_create_item *list)
   303	{
   304		struct pci_dev *pdev = NULL;
   305		resource_size_t bar_size;
   306		pgoff_t pgbuf = 0;
   307		struct page *page;
   308		int i, ret;
   309		size_t size;
   310		void *addr;
   311	
   312		for (i = 0; i < head->count; i++) {
   313			if (!ubuf->pdev) {
   314				pdev = pci_get_domain_bus_and_slot(0,
   315							PCI_BUS_NUM(list[i].devid),
   316							list[i].devid & 0xff);
   317				if (!pdev) {
   318					ret = -ENODEV;
   319					goto err;
   320				}
   321	
   322				ubuf->pdev = pdev;
   323			}
   324	
   325			bar_size = pci_resource_len(pdev, list[i].bar);
   326			if (list[i].offset > bar_size ||
   327			    list[i].offset + list[i].size > bar_size) {
   328				ret = -EINVAL;
   329				goto err;
   330			}
   331	
   332			ret = pci_p2pdma_add_resource(pdev,
   333						      list[i].bar,
   334						      list[i].size,
   335						      list[i].offset);
   336			if (ret)
   337				goto err;
   338	
   339			addr = pci_alloc_p2pmem(pdev, list[i].size);
   340			if (!addr) {
   341				ret = -EINVAL;
   342				goto err;
   343			}
   344	
   345			size = 0;
   346			while (size < list[i].size) {
 > 347				page = virt_to_page((unsigned long)addr + size);
   348				ubuf->pages[pgbuf++] = page;
   349	
   350				size += PAGE_SIZE;
   351			}
   352		}
   353	
   354	err:
   355		while (pgbuf > 0 && ubuf->pages[--pgbuf])
   356			pci_free_p2pmem(pdev,
   357					page_to_virt(ubuf->pages[pgbuf]),
   358					PAGE_SIZE);
   359		if (pdev)
   360			pci_dev_put(pdev);
   361		return ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
