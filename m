Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108F2F34
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729644738; cv=none; b=ZrBT/I1SeZ4ge8CvWMTimDfk/YkNjbYTm6uCzlonGmtWJxL72uLNvh6ZKvCqPD5rspsyLzV85PGymxfZn5QzgFEZbWrwejZoaKKNmadzsoh5pPOBDd6dQ5HZHmOVbkVt95EIGmNkitbiozCFGkenQRat+XQ/keKGN3Z9uWD+cI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729644738; c=relaxed/simple;
	bh=LME+btAYOdkAjpynULlZEI5KdQfluWs6/gSG6cLsuD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGdC277HA78hOA0Gq6kuNAITpyB69dGU41WBN8X3Yzaq6vmBlmT7RA/CoAL5mkjsbYy6D1nizS77KnHcoYacoS7ellK4Jyx+RcRM1iIEIoT/mL8epmJ/Mvx6y6Izx9cKtaxAvT6WZ0zirojdstyyNEv1KS9ls542E4BtlDFO0f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNmEEN7c; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNmEEN7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729644737; x=1761180737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LME+btAYOdkAjpynULlZEI5KdQfluWs6/gSG6cLsuD0=;
  b=UNmEEN7ccOn1GyaDDKUibI/kIjCPHwMTsymz0IOVYpjUrulNpWQt9bAI
   8gECtA7orZ350U3xYnSQZddyFC6qCdlcXeiWwJsARSwJz6HZVpZPINI0J
   kAKD/ZmUKFicz2eBbKYRDaDQP/qfHWYQFADFAK+dqlxOZjxQi34baTfA8
   2BQK5seYV2g7tNqJWtatxlnNAJ4FFOuzD/XxcsvwB41XPkRUdOkIF0R89
   0DtSO1BvFOscZ0NP7KRlvAEchko79X+V8GRNc3VUeLVuF5sSAaryfrVe1
   bR2cKZxaNgDW32G8G64WuLxTMs2IeY8pRTYbzqD4rKKxJXfhmpW6PFafI
   w==;
X-CSE-ConnectionGUID: rs8+Ot8/Q1m6BN8i5qmXeA==
X-CSE-MsgGUID: Az4wj3kjS7ea/oHhU6NohQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33027110"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="33027110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 17:52:16 -0700
X-CSE-ConnectionGUID: F6Kuu/gyQSWJ0K28yeg1zA==
X-CSE-MsgGUID: f41lxIaIQ6SIJNJzMuDzqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80451506"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 17:52:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Pbf-000UHG-2E;
	Wed, 23 Oct 2024 00:52:11 +0000
Date: Wed, 23 Oct 2024 08:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wen Zhiwei <wenzhiwei@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14690/15185] include/linux/dma-direct.h:53:10:
 fatal error: asm/dma-direct.h: No such file or directory
Message-ID: <202410230856.2tl76ThF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b436b5d324a6e9fcdbdfc942a4a7b07b8511aae7
commit: fd7608989d69c46482cdbd13f8fa909b0f305dbd [14690/15185] LoongArch: Remove the unused dma-direct.h
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20241023/202410230856.2tl76ThF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230856.2tl76ThF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230856.2tl76ThF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/dma.c:6:
>> include/linux/dma-direct.h:53:10: fatal error: asm/dma-direct.h: No such file or directory
      53 | #include <asm/dma-direct.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +53 include/linux/dma-direct.h

e0d072782c734d Jim Quinlan       2020-09-17  51  
ea8c64ace86647 Christoph Hellwig 2018-01-10  52  #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
ea8c64ace86647 Christoph Hellwig 2018-01-10 @53  #include <asm/dma-direct.h>
5ceda74093a5c1 Christoph Hellwig 2020-08-17  54  #ifndef phys_to_dma_unencrypted
5ceda74093a5c1 Christoph Hellwig 2020-08-17  55  #define phys_to_dma_unencrypted		phys_to_dma
5ceda74093a5c1 Christoph Hellwig 2020-08-17  56  #endif
ea8c64ace86647 Christoph Hellwig 2018-01-10  57  #else
5ceda74093a5c1 Christoph Hellwig 2020-08-17  58  static inline dma_addr_t phys_to_dma_unencrypted(struct device *dev,
5ceda74093a5c1 Christoph Hellwig 2020-08-17  59  		phys_addr_t paddr)
ea8c64ace86647 Christoph Hellwig 2018-01-10  60  {
e0d072782c734d Jim Quinlan       2020-09-17  61  	if (dev->dma_range_map)
e0d072782c734d Jim Quinlan       2020-09-17  62  		return translate_phys_to_dma(dev, paddr);
e0d072782c734d Jim Quinlan       2020-09-17  63  	return paddr;
ea8c64ace86647 Christoph Hellwig 2018-01-10  64  }
ea8c64ace86647 Christoph Hellwig 2018-01-10  65  

:::::: The code at line 53 was first introduced by commit
:::::: ea8c64ace86647260ec4255f483e5844d62af2df dma-mapping: move swiotlb arch helpers to a new header

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
