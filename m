Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E321D5AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644014; cv=none; b=YxdiFIeydrjBH1dVLs2RS1wOBds1FsIbTHGcGWiafkaG06aXPQ//ztmqSlkUo2FzdHUx691ZsYppi2cTYR742v2YTYLEQmQbY9k5ollgSttR+Bw9lnOAv8n2mZza56fryGgjiheU/O1s3sLeEWwoAnwk6cCsZSJq5VPuw1LYMRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644014; c=relaxed/simple;
	bh=EuUfN459XUC86EHjm78O0Cdw/dwLwQFBGbmK4+0QMfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XkCFKL5JnLdYXo8D3PCnxXz8t1MmALutu+tyDi1hWmXV+9l6rLmmpo3zsYVHXLxzBS2WG+WDIvvlddFQebl11oZiwtD7Br7nwGLn6/yFS/KVyeKnWuEk2k2G6l1jLMC1iPyhNRje+DaHWxDvNf13uyyxIU8/WOqT8dugiCKnJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwbjVbO5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwbjVbO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769644013; x=1801180013;
  h=date:from:to:cc:subject:message-id;
  bh=EuUfN459XUC86EHjm78O0Cdw/dwLwQFBGbmK4+0QMfY=;
  b=HwbjVbO5ljUD9+f+trB8i0K87HR8yS2QQLmiwi2O+cP0EoCLpqNhuFkI
   +FH5/C7ue8nzJLMLXyiKF2xiNux3hJtpOrqBHPg90lnulSBJeIl9kXto/
   jC5NwW2iI9/PMslGRUfNqlnCXxv1qIH67nj+aDnTa1KW/z9vxfIOYKduY
   rXRGvJ7GTovFTgjiglmgzpOY1bI8OxdxR1o9mbqV9Wc20m5S4CniXsftO
   X7DjaCXiWlR3XBMgnjOO4Tzk3rRnDUEgK7k18OZPK1j7a8xPb6ZYHhzPU
   3KOgNLyWjqhc1TH8mFbrxzsZl2VIhra6pezEbkeOkjkv6hgRUBmgSxsVz
   A==;
X-CSE-ConnectionGUID: OWJunG7yShiEOxxYeAMcgQ==
X-CSE-MsgGUID: znPCjVL2Q5+xWONmuymjug==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70910636"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70910636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 15:46:52 -0800
X-CSE-ConnectionGUID: e21Rmv/WS/KTWL3znMGg9g==
X-CSE-MsgGUID: 1tAgHD+HRpqBT3FeuhqK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208768585"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jan 2026 15:46:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFFJ-00000000auk-11Nl;
	Wed, 28 Jan 2026 23:46:49 +0000
Date: Thu, 29 Jan 2026 07:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 2/17]
 include/linux/dma-buf.h:706:52: warning: omitting the parameter name in a
 function definition is a C2x extension
Message-ID: <202601290718.NX3MjMPd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   76427c94d00817c6ba0956ffa50ece35759aa37c
commit: 085cecef6ce6cb8d0cbc931f9425224def2164ec [2/17] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: powerpc-mpc834x_itx_defconfig (https://download.01.org/0day-ci/archive/20260129/202601290718.NX3MjMPd-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290718.NX3MjMPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290718.NX3MjMPd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:101:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:706:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                  struct vm_area_struct *vma, unsigned long)
                                                                           ^
   1 warning generated.


vim +706 include/linux/dma-buf.h

   699	
   700	static inline void
   701	dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
   702					  struct sg_table *sg_table,
   703					  enum dma_data_direction direction) { }
   704	
   705	static inline int dma_buf_mmap(struct dma_buf *dmabuf,
 > 706				       struct vm_area_struct *vma, unsigned long)
   707	{
   708		return -EOPNOTSUPP;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
