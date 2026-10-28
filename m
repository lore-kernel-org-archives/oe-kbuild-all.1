Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202304;
	b=wdnEcd+AzKS11F50m3GdAfnq5Eg51n/MhfFoIvN3SQ9GqUf4zsM2Uq/RjTuIhDKIlj+t
	 fbZPjT6pC3g1W8UAoFotLy0FFiZXXxMTL4Vrt75flVoIFk6Pr4+1uLPFfjku9j7joL0Bp
	 kJGYK3xEyUwCdn7jgXq8YuWutkK9eAhY2I6X8TgRVI3C4BPGOBMPUyg3PMXOwWIMldIVX
	 gmvYGDALjmVxDJKBuQt6NZz49hL9S0/OWyFzHg7YsNqE9jUZLeAWLKnDKJHAk2qIaiJwT
	 cZSyrNtnRBH8deMkLn8nXQfXJtzIjOOokl92R49EiKTH9n4TiSBlKRoKhq7MJBPIw6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aVP+h2x6RJp+vfFRJaAsqqaBD8F96n7edrIQxN4ZAXc=;
	b=lwwQ1pJUbQFm+K1rSld1w8WbN2tebRgXT8b0KzLdxlo0aLn3LEOgPZ6TM13s+grsiTbQ
	 IhuVzQHfGXF5+qC5fsRfuIPLNPgf/PUkFa6XJ7pT+mx1RMPj1yMmeBoskeqARmD1CXxEO
	 9EEHDn0HUhRixGynrGaZfyXvUNg5FLoGnXKT7X9/4v8gTIBqmS+LkvpUNxQ28teLiZojZ
	 c0rpXT2hnzLg+RpuCOUV+cpk44aXcX+qaxWNnRq5FlmRmHECsHKf/FOwNo1/rrofuLZWR
	 GXhkhhJkCu3iIH99zOmeLGHtjUTZyPZ0JrJOO6SgxeQ+Jrztwo3oN0o1RVV8oGaLYVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4PmoceA;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE89606A320
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 15:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4PmoceA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793202302; x=1824738302;
  h=date:from:to:cc:subject:message-id;
  bh=l+gE3p31NvgvBqYvZ8XYbquti6ESZozbKNfwOpLCOxw=;
  b=i4PmoceAGDZnd7B7ivKsGXVUfn96HQzYsRZBAnTBfYZQhQaFJcgn/8IF
   Urlj2NjOxhe83CvIC45rfz3mzqIkFAm84MkB/7HMc6N7bZUM4Ur1gFGfp
   +BXHNiVEWHF+k9lb8lEgfADp5T9VnIK0kNUTVtu0mJxulQhzuQq2jWAyf
   hRQvX+MzVwHdaoigS9JjylZO2kWitEtcFP2JG1+KPWOi4O8yL0qCB0UVd
   PwWA6VxdHBfuVsQn7OmwG1XTz9SU7bGSsuG0kjq64gqk2P4wRolBwDWQz
   aAwvIf4UAIg9ZqSa7loZ0yMuF5wvOO5divFZDSj2LnYEIWSGCU76lFA2n
   w==;
X-CSE-ConnectionGUID: E47vvt6RSNSrBMUvm0BppA==
X-CSE-MsgGUID: QMk7hx98T4iqtF5WYmHMVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1939905"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1939905"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 08:45:02 -0700
X-CSE-ConnectionGUID: HyVlC2IiRqq09i+dWzFABA==
X-CSE-MsgGUID: 5TWP8VWERKiKTZsN6wI0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5244016"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2026 08:45:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM5pi-000000004ul-1jpQ;
	Wed, 28 Oct 2026 15:44:58 +0000
Date: Wed, 28 Oct 2026 16:44:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 353/353]
 drivers/dma/fsl-qdma.c:387:15: sparse: sparse: restricted __le32 degrades to
 integer
Message-ID: <202610281614.H43vvIyn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   c62bc3e4e5567addb17e760d66858dd3b1527063
commit: 237ecf1afe6c22534fa43abdf2bf0b0f52de0aaa [353/353] dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
config: arm-randconfig-r2303-20261026 (https://download.01.org/0day-ci/archive/20261028/202610281614.H43vvIyn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281614.H43vvIyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281614.H43vvIyn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-qdma.c:387:15: sparse: sparse: restricted __le32 degrades to integer
   drivers/dma/fsl-qdma.c:390:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] data @@     got unsigned long long @@
   drivers/dma/fsl-qdma.c:390:19: sparse:     expected restricted __le64 [usertype] data
   drivers/dma/fsl-qdma.c:390:19: sparse:     got unsigned long long
>> drivers/dma/fsl-qdma.c:392:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] cmd @@     got restricted __le32 [usertype] @@
   drivers/dma/fsl-qdma.c:392:13: sparse:     expected unsigned int [assigned] [usertype] cmd
   drivers/dma/fsl-qdma.c:392:13: sparse:     got restricted __le32 [usertype]
   drivers/dma/fsl-qdma.c:394:13: sparse: sparse: invalid assignment: |=
   drivers/dma/fsl-qdma.c:394:13: sparse:    left side has type unsigned int
   drivers/dma/fsl-qdma.c:394:13: sparse:    right side has type restricted __le32
   drivers/dma/fsl-qdma.c:395:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] data @@     got unsigned long long @@
   drivers/dma/fsl-qdma.c:395:19: sparse:     expected restricted __le64 [usertype] data
   drivers/dma/fsl-qdma.c:395:19: sparse:     got unsigned long long
   drivers/dma/fsl-qdma.c:646:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:646:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:646:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:682:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:682:58: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:682:58: sparse:     got void *
   drivers/dma/fsl-qdma.c:689:58: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:689:58: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:689:58: sparse:     got void *
   drivers/dma/fsl-qdma.c:697:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:697:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:697:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:703:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/dma/fsl-qdma.c:703:50: sparse:     expected void [noderef] __iomem *addr
   drivers/dma/fsl-qdma.c:703:50: sparse:     got void *
   drivers/dma/fsl-qdma.c:786:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *block @@     got void [noderef] __iomem *[assigned] block @@
   drivers/dma/fsl-qdma.c:786:67: sparse:     expected void *block
   drivers/dma/fsl-qdma.c:786:67: sparse:     got void [noderef] __iomem *[assigned] block

vim +387 drivers/dma/fsl-qdma.c

b092529e0aa098 Peng Ma 2018-10-30  354  
b092529e0aa098 Peng Ma 2018-10-30  355  static void fsl_qdma_comp_fill_memcpy(struct fsl_qdma_comp *fsl_comp,
b092529e0aa098 Peng Ma 2018-10-30  356  				      dma_addr_t dst, dma_addr_t src, u32 len)
b092529e0aa098 Peng Ma 2018-10-30  357  {
8f95adcf3a5aab Peng Ma 2019-05-22  358  	u32 cmd;
b092529e0aa098 Peng Ma 2018-10-30  359  	struct fsl_qdma_format *sdf, *ddf;
b092529e0aa098 Peng Ma 2018-10-30  360  	struct fsl_qdma_format *ccdf, *csgf_desc, *csgf_src, *csgf_dest;
b092529e0aa098 Peng Ma 2018-10-30  361  
b092529e0aa098 Peng Ma 2018-10-30  362  	ccdf = fsl_comp->virt_addr;
b092529e0aa098 Peng Ma 2018-10-30  363  	csgf_desc = fsl_comp->virt_addr + 1;
b092529e0aa098 Peng Ma 2018-10-30  364  	csgf_src = fsl_comp->virt_addr + 2;
b092529e0aa098 Peng Ma 2018-10-30  365  	csgf_dest = fsl_comp->virt_addr + 3;
b092529e0aa098 Peng Ma 2018-10-30  366  	sdf = fsl_comp->desc_virt_addr;
b092529e0aa098 Peng Ma 2018-10-30  367  	ddf = fsl_comp->desc_virt_addr + 1;
b092529e0aa098 Peng Ma 2018-10-30  368  
b092529e0aa098 Peng Ma 2018-10-30  369  	memset(fsl_comp->virt_addr, 0, FSL_QDMA_COMMAND_BUFFER_SIZE);
b092529e0aa098 Peng Ma 2018-10-30  370  	memset(fsl_comp->desc_virt_addr, 0, FSL_QDMA_DESCRIPTOR_BUFFER_SIZE);
b092529e0aa098 Peng Ma 2018-10-30  371  	/* Head Command Descriptor(Frame Descriptor) */
b092529e0aa098 Peng Ma 2018-10-30  372  	qdma_desc_addr_set64(ccdf, fsl_comp->bus_addr + 16);
b092529e0aa098 Peng Ma 2018-10-30  373  	qdma_ccdf_set_format(ccdf, qdma_ccdf_get_offset(ccdf));
b092529e0aa098 Peng Ma 2018-10-30  374  	qdma_ccdf_set_ser(ccdf, qdma_ccdf_get_status(ccdf));
b092529e0aa098 Peng Ma 2018-10-30  375  	/* Status notification is enqueued to status queue. */
b092529e0aa098 Peng Ma 2018-10-30  376  	/* Compound Command Descriptor(Frame List Table) */
b092529e0aa098 Peng Ma 2018-10-30  377  	qdma_desc_addr_set64(csgf_desc, fsl_comp->desc_bus_addr);
b092529e0aa098 Peng Ma 2018-10-30  378  	/* It must be 32 as Compound S/G Descriptor */
b092529e0aa098 Peng Ma 2018-10-30  379  	qdma_csgf_set_len(csgf_desc, 32);
b092529e0aa098 Peng Ma 2018-10-30  380  	qdma_desc_addr_set64(csgf_src, src);
b092529e0aa098 Peng Ma 2018-10-30  381  	qdma_csgf_set_len(csgf_src, len);
b092529e0aa098 Peng Ma 2018-10-30  382  	qdma_desc_addr_set64(csgf_dest, dst);
b092529e0aa098 Peng Ma 2018-10-30  383  	qdma_csgf_set_len(csgf_dest, len);
b092529e0aa098 Peng Ma 2018-10-30  384  	/* This entry is the last entry. */
b092529e0aa098 Peng Ma 2018-10-30  385  	qdma_csgf_set_f(csgf_dest, len);
b092529e0aa098 Peng Ma 2018-10-30  386  	/* Descriptor Buffer */
8f95adcf3a5aab Peng Ma 2019-05-22 @387  	cmd = cpu_to_le32(FSL_QDMA_CMD_RWTTYPE <<
237ecf1afe6c22 Peng Ma 2024-02-01  388  			  FSL_QDMA_CMD_RWTTYPE_OFFSET) |
237ecf1afe6c22 Peng Ma 2024-02-01  389  			  FSL_QDMA_CMD_PF;
8f95adcf3a5aab Peng Ma 2019-05-22  390  	sdf->data = QDMA_SDDF_CMD(cmd);
8f95adcf3a5aab Peng Ma 2019-05-22  391  
8f95adcf3a5aab Peng Ma 2019-05-22 @392  	cmd = cpu_to_le32(FSL_QDMA_CMD_RWTTYPE <<
b092529e0aa098 Peng Ma 2018-10-30  393  			  FSL_QDMA_CMD_RWTTYPE_OFFSET);
8f95adcf3a5aab Peng Ma 2019-05-22  394  	cmd |= cpu_to_le32(FSL_QDMA_CMD_LWC << FSL_QDMA_CMD_LWC_OFFSET);
8f95adcf3a5aab Peng Ma 2019-05-22  395  	ddf->data = QDMA_SDDF_CMD(cmd);
b092529e0aa098 Peng Ma 2018-10-30  396  }
b092529e0aa098 Peng Ma 2018-10-30  397  

:::::: The code at line 387 was first introduced by commit
:::::: 8f95adcf3a5aabb7a416d3c03c561acd580df213 dmaengine: fsl-qdma: fixed the source/destination descriptor format

:::::: TO: Peng Ma <peng.ma@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
