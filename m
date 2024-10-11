Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B560928EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 04:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621778; cv=none; b=o873cVzfkgsUHhMmo54aKFp9h2/ucs5Z5uaTnEHaxP77gynXM2BwOCoO/TfzCVM8ZGtjhz1jG6NS78YUf+cLhz3DN/TTPPkizoKg4jvwH8ZL7ojqQVgTSTOkV0Z+zu6bytHPPUfH67Lpb24a4HOVJiSA6MwZMwecFkz+jR58xbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621778; c=relaxed/simple;
	bh=+jCMTcr2YNfp0I9IIHpuQy/RU9BmpHT+Nb+yREQhuv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkLsTcYZJrFQGAlHK9j7uPedtSOL4kf7+rKxuALEQ1ArKSMngWrKw0l8LmTgw6d9rcsKGU95MFNLjNmdpQs6n7fkkS/jTt0+hy9WfT1iOQsAmus2oO21ETifyAD7majbMRrGAcbO7659p6W0EGwSKeBqAec9oCDppixfKeVpbrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbCdKhLc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbCdKhLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728621777; x=1760157777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jCMTcr2YNfp0I9IIHpuQy/RU9BmpHT+Nb+yREQhuv8=;
  b=lbCdKhLcYLXCK3negIfaOWfDNxELe0hmX+CsCEKoZZrvpSwvDqkNL5es
   uS4+/bQFkN+bgcQ29SzoZ//USoO+cU6nNMbVFX16B8YKCyQTNgc2OJoiC
   ORtGuiyIGjinCSIzNS/ZtUl1+a45EbKk55eeiTA1xuaRY9zbUyZT5UcfQ
   u5yY3Bz6Qt1PUjQjDXwWt3Fakunxl/vyS+metGKeHmgv42KWjQ8fznClk
   e7oxwzM5YdqbWuRENoXY79TQSCSVLHe1Ya1qaWXjWZv9vAqvW/8oBE5tD
   LHAPZXjXn4qSLYElNCg6ubqsRLl7oAp9g9hbVfytTkAYWbZQPBPBD0OOD
   w==;
X-CSE-ConnectionGUID: XbD2WxmhRh6+1CcdHH41yA==
X-CSE-MsgGUID: yltUft6RTi6u9D6pmta2IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27959184"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="27959184"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 21:42:56 -0700
X-CSE-ConnectionGUID: fNuYAbd5RBe3pgmRl94MfQ==
X-CSE-MsgGUID: AsmmP6POScG75dJCt8MHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76712343"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2024 21:42:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz7UL-000Bof-0N;
	Fri, 11 Oct 2024 04:42:53 +0000
Date: Fri, 11 Oct 2024 12:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:kfifo-include 1/1] include/linux/kfifo.h:745:60: error:
 'DMA_MAPPING_ERROR' undeclared
Message-ID: <202410111216.3o3f3B02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git kfifo-include
head:   5a122872045100223f0e44256a62ed2b1f85d985
commit: 5a122872045100223f0e44256a62ed2b1f85d985 [1/1] kfifo: don't include dma-mapping.h in kfifo.h
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241011/202410111216.3o3f3B02-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111216.3o3f3B02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111216.3o3f3B02-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/kfifo/dma-example.c:9:
   samples/kfifo/dma-example.c: In function 'example_init':
>> include/linux/kfifo.h:745:60: error: 'DMA_MAPPING_ERROR' undeclared (first use in this function)
     745 |         kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                            ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:740:34: note: in definition of macro 'kfifo_dma_in_prepare_mapped'
     740 |                                  dma) : \
         |                                  ^~~
   samples/kfifo/dma-example.c:64:17: note: in expansion of macro 'kfifo_dma_in_prepare'
      64 |         nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:745:60: note: each undeclared identifier is reported only once for each function it appears in
     745 |         kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
         |                                                            ^~~~~~~~~~~~~~~~~
   include/linux/kfifo.h:740:34: note: in definition of macro 'kfifo_dma_in_prepare_mapped'
     740 |                                  dma) : \
         |                                  ^~~
   samples/kfifo/dma-example.c:64:17: note: in expansion of macro 'kfifo_dma_in_prepare'
      64 |         nents = kfifo_dma_in_prepare(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/DMA_MAPPING_ERROR +745 include/linux/kfifo.h

86d48803136038 Stefani Seibold   2009-12-21  743  
d52b761e4b1acc Jiri Slaby (SUSE  2024-04-05  744) #define kfifo_dma_in_prepare(fifo, sgl, nents, len) \
d52b761e4b1acc Jiri Slaby (SUSE  2024-04-05 @745) 	kfifo_dma_in_prepare_mapped(fifo, sgl, nents, len, DMA_MAPPING_ERROR)
d52b761e4b1acc Jiri Slaby (SUSE  2024-04-05  746) 

:::::: The code at line 745 was first introduced by commit
:::::: d52b761e4b1acc897e65bcc8eff42b0537ac0134 kfifo: add kfifo_dma_out_prepare_mapped()

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
