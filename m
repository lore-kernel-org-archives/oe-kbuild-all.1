Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C05381
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 04:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709700794; cv=none; b=GHTR9JC3imC34LJeUY5gDD9D9uSz1jH5kXgHYoKbyibgzeCW0KFgFLzn/dnwNkPCAGK93+iI7LZ/P1Jo1g7CYaQFRisaJS2F4oCN5OENKPySFlrNO8Om4p07eLjUEpnDBkel/viLrV5oGhGIOyFFUEV4C9E0XMy3sSMnpTn1Ums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709700794; c=relaxed/simple;
	bh=8csO4cPUzMeAgjL7T++LpMH2qn+B9vBibNjYikuKkD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tW59xe9Mrr2rq0E/b8Mg0tfuzuF35WZ7be2cCitgzL6oXc3nNrbWI/uZPoWB/Ee9nUdEu4LqH1GoSGdLKpEbSayLJLTmqB/Fg8RPQpEMJ/Fpvc/Gp7hRuTqwqG4SESMJaU1htnayRr346rWZSCGzNCs9NO0gKx9/AhGQgaxk1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZbI23AD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZbI23AD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709700792; x=1741236792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8csO4cPUzMeAgjL7T++LpMH2qn+B9vBibNjYikuKkD8=;
  b=TZbI23ADVe5Ty23Bm0wRLrBNdtcsfGalcDxOyXSOpXewePEpfw5vrfn2
   WsxFWW+Te8SweipAjUN2eQbeIuAUXhsNjSc10rZLWXRTCGPQ0zI/Hxi9I
   JLw/qI060DWHNdT9MBF7hLfUUZAbY217A6L4d29/ZkrV893iem053u6Xp
   alvEra/5i6CYqP3tQTjwFLKn2PVdnJEvAu44QqoWwqyqzvKjUshi7ZTX9
   X7kDwY29VQiJAXbPrMJNIKL1Gawfe69NQLzZkvQ6Umv0RO19/Zv6mpsCK
   O+2Yecu7Cl83+OppKz8xIj2kyAW9xNxjhcOJ6SdkH9EaoWRGlosi0LZ8h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4157936"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4157936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 20:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14187637"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2024 20:53:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhjH9-0003vH-0e;
	Wed, 06 Mar 2024 04:53:07 +0000
Date: Wed, 6 Mar 2024 12:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/dma/mapping.c:557:29: sparse: sparse: macro "alloc_pages"
 passed 5 arguments, but takes just 2
Message-ID: <202403061212.u0pnci17-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 7bf38ec8bc7226fa384ae9f39ed8e1e2465b7b1a dma-mapping: add a new dma_alloc_pages API
date:   9 months ago
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240306/202403061212.u0pnci17-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061212.u0pnci17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061212.u0pnci17-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/dma/mapping.c:557:29: sparse: sparse: macro "alloc_pages" passed 5 arguments, but takes just 2

vim +/alloc_pages +557 kernel/dma/mapping.c

   541	
   542	struct page *dma_alloc_pages(struct device *dev, size_t size,
   543			dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
   544	{
   545		const struct dma_map_ops *ops = get_dma_ops(dev);
   546		struct page *page;
   547	
   548		if (WARN_ON_ONCE(!dev->coherent_dma_mask))
   549			return NULL;
   550		if (WARN_ON_ONCE(gfp & (__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM)))
   551			return NULL;
   552	
   553		size = PAGE_ALIGN(size);
   554		if (dma_alloc_direct(dev, ops))
   555			page = dma_direct_alloc_pages(dev, size, dma_handle, dir, gfp);
   556		else if (ops->alloc_pages)
 > 557			page = ops->alloc_pages(dev, size, dma_handle, dir, gfp);
   558		else
   559			return NULL;
   560	
   561		debug_dma_map_page(dev, page, 0, size, dir, *dma_handle);
   562	
   563		return page;
   564	}
   565	EXPORT_SYMBOL_GPL(dma_alloc_pages);
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
