Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204B1FBEB6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001023; cv=none; b=fgeguKSKEhHhhDy9h5VnL+JLLW3WX4zfcpkCDaEoole+d/SJiui1Z51INfACAJToKazBTQ4swej4mmXy2hpw6DnvOOcg01bHSDuRp1K0ZeT7dU36dhDer+DfW5gvJqKmrEyIYDxjKIbiuq3zznfjiDMMrHJEerf6ZAtVtzScpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001023; c=relaxed/simple;
	bh=+VqBBhZBCeoAw2ubvhHyzZUkjrXEDSn1rG3+isinRcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BoZe1dOuh/3gs3xHVMKfPge4iAR8l2Tj/yfnP6/h7ooutkESd2YW1aLswePGffioVKshKkFtsIbdQ0GMY1ll8JI918e2VuL7wPjWe9rgqEhqpqQB/CBL3X5bEsgbqTQHrVcsw92VcWQseQcYM7YMnY/DpdcZmQrQA2QnTvJEl1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuXbR7Vy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuXbR7Vy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757001022; x=1788537022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VqBBhZBCeoAw2ubvhHyzZUkjrXEDSn1rG3+isinRcE=;
  b=EuXbR7Vyt3ryssv2h0SdQzNwMDSpsOKjhTjzU/1DafRoLDFB5Zfn/SPz
   VsLXhuQZXnkqD7ZAyz75AiaupHZaIskgVy/0laiVGJW7ecFO2jIMrYzNS
   tkUqaS/CkdvqalGVIVps0ISAQ7iT4m8Cpn06PBRAWiVPtcuzc/GvH9O9E
   UQxamtgzfJwQa48H/pSdG1pn+TTLSf9oakYlbVDF/gyfK1BtRPmhzxd+r
   7yS1kb1JUzHnssSLgoMU8+N2hcAAKbM8GQMQZ7rnbEZ5oP42NG8mwQVj0
   ByKeE2zPE0aws3K+gWKiImwYVKGkAnjbuYzQKVEScIAygxRKnfw+fRqXL
   Q==;
X-CSE-ConnectionGUID: tG4GwppITA+gGELeDUElyw==
X-CSE-MsgGUID: j69IF3PkTYidfeuwmypQIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59044762"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="59044762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:50:21 -0700
X-CSE-ConnectionGUID: eBtfQWtPSse8SygtQDuQRg==
X-CSE-MsgGUID: zkAOWk1hRiuPyQ/lgoRTWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="209108915"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2025 08:50:19 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuCDM-0005S3-0e;
	Thu, 04 Sep 2025 15:49:46 +0000
Date: Thu, 4 Sep 2025 23:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [linux-next:master 6049/6355]
 include/linux/scatterlist.h:161:undefined reference to
 `page_range_contiguous'
Message-ID: <202509042330.paF1vmVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ac65880ebca1b68495bd8704263b26c050ac010
commit: 92c22f6cc03ea9d5b172276d6ae45c691993b257 [6049/6355] scatterlist: disallow non-contigous page ranges in a single SG entry
config: arm-randconfig-004-20250904 (https://download.01.org/0day-ci/archive/20250904/202509042330.paF1vmVV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042330.paF1vmVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042330.paF1vmVV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: net/core/skbuff.o: in function `sg_set_page':
>> include/linux/scatterlist.h:161:(.text+0x1864): undefined reference to `page_range_contiguous'
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in net/core/skbuff.o
>> include/linux/scatterlist.h:161:(.text+0x1864): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: kernel/dma/mapping.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x912): undefined reference to `page_range_contiguous'
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in kernel/dma/mapping.o
   include/linux/scatterlist.h:161:(.text+0x912): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: kernel/dma/direct.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x64c): undefined reference to `page_range_contiguous'
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in kernel/dma/direct.o
   include/linux/scatterlist.h:161:(.text+0x64c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: kernel/dma/ops_helpers.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x52): undefined reference to `page_range_contiguous'
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in kernel/dma/ops_helpers.o
   include/linux/scatterlist.h:161:(.text+0x52): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: mm/page_reporting.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x1d8): undefined reference to `page_range_contiguous'
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in mm/page_reporting.o
   include/linux/scatterlist.h:161:(.text+0x1d8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: crypto/scatterwalk.o:include/linux/scatterlist.h:161: more undefined references to `page_range_contiguous' follow
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/scatterwalk.o
   crypto/scatterwalk.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x296): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/ahash.o
   crypto/ahash.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x272): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/rsa-pkcs1pad.o
   crypto/rsa-pkcs1pad.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x54): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/gcm.o
   crypto/gcm.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x3e8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/drbg.o
   crypto/drbg.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x10c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/tcrypt.o
   crypto/tcrypt.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0xba): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in crypto/af_alg.o
   crypto/af_alg.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x12dc): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in block/blk-mq-dma.o
   block/blk-mq-dma.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x36a): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in block/blk-integrity.o
   block/blk-integrity.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x186): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in block/blk-crypto-fallback.o
   block/blk-crypto-fallback.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x3e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in lib/scatterlist.o
   lib/scatterlist.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x22c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in lib/kfifo.o
   lib/kfifo.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x640): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/char/virtio_console.o
   drivers/char/virtio_console.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x3be): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/scsi/scsi_lib.o
   drivers/scsi/scsi_lib.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x12b6): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/target/target_core_sbc.o
   drivers/target/target_core_sbc.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x646): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/mtd/nand/ecc-mxic.o
   drivers/mtd/nand/ecc-mxic.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x208): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/hsi/clients/ssi_protocol.o
   drivers/hsi/clients/ssi_protocol.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x1b2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/i2c/busses/i2c-qup.o
   drivers/i2c/busses/i2c-qup.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x5c2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/md/dm-integrity.o
   drivers/md/dm-integrity.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x1566): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in drivers/vhost/scsi.o
   drivers/vhost/scsi.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x602): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in sound/virtio/virtio_pcm_msg.o
   sound/virtio/virtio_pcm_msg.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x2bc): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in net/core/filter.o
   net/core/filter.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x4412): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in net/core/skmsg.o
   net/core/skmsg.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x8e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (page_range_contiguous): Unknown destination type (ARM/Thumb) in net/9p/trans_virtio.o
   net/9p/trans_virtio.o: in function `sg_set_page':
   include/linux/scatterlist.h:161:(.text+0x62): dangerous relocation: unsupported relocation


vim +161 include/linux/scatterlist.h

   143	
   144	/**
   145	 * sg_set_page - Set sg entry to point at given page
   146	 * @sg:		 SG entry
   147	 * @page:	 The page
   148	 * @len:	 Length of data
   149	 * @offset:	 Offset into page
   150	 *
   151	 * Description:
   152	 *   Use this function to set an sg entry pointing at a page, never assign
   153	 *   the page directly. We encode sg table information in the lower bits
   154	 *   of the page pointer. See sg_page() for looking up the page belonging
   155	 *   to an sg entry.
   156	 *
   157	 **/
   158	static inline void sg_set_page(struct scatterlist *sg, struct page *page,
   159				       unsigned int len, unsigned int offset)
   160	{
 > 161		VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
   162		sg_assign_page(sg, page);
   163		sg->offset = offset;
   164		sg->length = len;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
