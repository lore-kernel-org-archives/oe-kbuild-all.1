Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81D29CE1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 01:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764378766; cv=none; b=sGvkakED/icuHVemj03LZA7l98c8xD/cLOfdKetTeUDWjjLYZ+P88ZmGFTURaI3Z8ARTM+5G8e5Tcvt2gUbF8Z/GehWlqnE5LulYgu/UMekF73oj46UHTvSfbulXrn4EiYDWJGDIBdU/Kkn/z2jR6ck9Fsy5uHRTR6AfJ2QaOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764378766; c=relaxed/simple;
	bh=io20QEZAE3QHJMO/m7sWO6+D7/XXHozAEoNPEtfKofg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPp9nRjHCDIOIjVzr5kQ9fuUQUVrG5XzeMkskg4IN/MOoUUomo4Q4uYmBhhMr74HDI1mgRReyril4ofRck6I192wrRq6KMwG4X69QGl4hVUs6aeCwgenuzCEz6eUt1SJ2jnNn96VB3AuMCJxcbEyOcWybs7N06tFf9Eur3cR14E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIySrjCS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIySrjCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764378764; x=1795914764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=io20QEZAE3QHJMO/m7sWO6+D7/XXHozAEoNPEtfKofg=;
  b=aIySrjCSvkNQGmdSZGtxWExYWRmmzcBQR0u1HBzb6fmsd3opvhrhylhJ
   rHPmv+keKAQET+dAeTjscjoy0zJu1qPwOP9+HWsgWMh4DN1wT1BeVVA94
   Qtessim4042lw+lNO1rOcqfqnJgu5wDyiwQ4doG9tqErdewPmuR3bYwAK
   SFr+J51/WL9uJGhJ9QoF9keGW5jVMetWcpKfBOW5g6WxJcbHW15iyPbEK
   r1GLOg/uY3C9UdGJgbs1MgYkYRoSrSjjQYd+RTzBYRr5KdYMz69Wi0NKC
   mMJS5eYZVc7I8gY1+1XKKafXOS1fJ+MjCEfNcMoHE+di0g78PJnDA+hdQ
   g==;
X-CSE-ConnectionGUID: /XxGpKGFSJKdIRBj7yThfQ==
X-CSE-MsgGUID: jDaeAlisQ8CypqMwoV9NHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66115653"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66115653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 17:12:43 -0800
X-CSE-ConnectionGUID: b4v+EaRmQvSf70Y6A7kEtA==
X-CSE-MsgGUID: u8VRRNz5RqKdNr82lVOjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="194349646"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2025 17:12:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP9Vw-000000006s1-2bAF;
	Sat, 29 Nov 2025 01:12:40 +0000
Date: Sat, 29 Nov 2025 09:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 2/17] include/linux/dma-buf.h:664:45: error:
 parameter name omitted
Message-ID: <202511290908.XA0aUVr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   7d55937317d42c150c9f632983368a4c8c4a020d
commit: 697e6c89948bf345b67ed9efe910be81cdc1ffe8 [2/17] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: powerpc64-randconfig-r064-20251129 (https://download.01.org/0day-ci/archive/20251129/202511290908.XA0aUVr1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290908.XA0aUVr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290908.XA0aUVr1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/videobuf2-core.h:18,
                    from include/media/dvb_vb2.h:21,
                    from include/media/dmxdev.h:37,
                    from drivers/media/dvb-core/dmxdev.c:20:
   include/linux/dma-buf.h: In function 'dma_buf_unmap_attachment':
>> include/linux/dma-buf.h:664:45: error: parameter name omitted
     664 | static inline void dma_buf_unmap_attachment(struct dma_buf_attachment *,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:665:10: error: parameter name omitted
     665 |          struct sg_table *,
         |          ^~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:666:10: error: parameter name omitted
     666 |          enum dma_data_direction) { }
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h: In function 'dma_buf_mmap':
   include/linux/dma-buf.h:694:32: error: parameter name omitted
     694 | static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
         |                                ^~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:694:50: error: parameter name omitted
     694 | static inline int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:695:11: error: parameter name omitted
     695 |           unsigned long)
         |           ^~~~~~~~~~~~~


vim +664 include/linux/dma-buf.h

   663	
 > 664	static inline void dma_buf_unmap_attachment(struct dma_buf_attachment *,
   665						    struct sg_table *,
   666						    enum dma_data_direction) { }
   667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
