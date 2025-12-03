Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6A02D7DE3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797138; cv=none; b=NohfT1ICvor02Yn0UeMefG+VRIp4oGeX14VQsV1dGAa6Rnf3BC27/eaawF58HcvoJoZwmJDg1Z7NlxR67WxyJT9mpX/bYPuCFiv0UQpCZ6p15BMNzryJ+wB0cmD2tY4auzZ1As3W8F+KOnpcqIUyZphLJQTDNCz/aW7rHgFVkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797138; c=relaxed/simple;
	bh=pQwPYVZQZHnjFO5kYOFsdRRQjROmIjUutuTcyweariQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXPRXOJabbi2KCmcvAVVGdrNtDljclBpTQzP0xBbwbCRzfd3kMpW49CotqJdjgWJIZVrJ7zA1rL0j0lVZIt0Io8MjniDHWVPURIFm5zgt9QIrL3P/l2izT+3p1ySvTD9XOioK5l0JGzwmzDQpMqTcIdU8dTwJSR9OMDrmXY+Xk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E38q8w6x; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E38q8w6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764797137; x=1796333137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQwPYVZQZHnjFO5kYOFsdRRQjROmIjUutuTcyweariQ=;
  b=E38q8w6xAvNlaENMcGMa8nM06NzJd5FZ/vFFWdoSrfvbU7Pr/T/s6I9x
   /exxvlGStoItFzJfBWxCUe9qNeyQuDKeep99Mo3yXxvi42gAMHbzTP+3t
   l5EmfmIXlaBkBFzYzBTcgi38Rd0NnIG6QxSIoHnOhZu8iFk+FOFz2WtV9
   38goG7fEhDvQ9RE6BJ1k6ql36F3gJvDrpvE8rUN39oz6jMyxDIOKKRgQR
   RPZal8KyfkW+k1LSreDUq57HYS1HBobZwVCZQ7svJk8Hm0Io7MXREvKtL
   f7EdnKjJgMC1T2KZMqLxBFjN8dv+ziZksnqAnudKR0pQ4r4bjwhd3bUAR
   A==;
X-CSE-ConnectionGUID: W8ja+wItSe2wGv/pBb6UGA==
X-CSE-MsgGUID: mDr9rMSYRL2BP3waV6uRLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66768830"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66768830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:25:36 -0800
X-CSE-ConnectionGUID: Oc7Xoy/4RIe6yuwXjITYgw==
X-CSE-MsgGUID: Aoptm3NsQIyeslSexeNftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194840465"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2025 13:25:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuLr-00000000DAb-22ZB;
	Wed, 03 Dec 2025 21:25:31 +0000
Date: Thu, 4 Dec 2025 05:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 11276/13147]
 drivers/iommu/iommufd/io_pagetable.c:498:undefined reference to
 `dma_buf_get'
Message-ID: <202512040559.t95L72Wy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b2c27842ba853508b0da00187a7508eb3a96c8f7
commit: 44ebaa1744fd79cd86d10f5453c90b8c4e22b7f4 [11276/13147] iommufd: Accept a DMABUF through IOMMU_IOAS_MAP_FILE
config: loongarch-randconfig-r061-20251204 (https://download.01.org/0day-ci/archive/20251204/202512040559.t95L72Wy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040559.t95L72Wy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040559.t95L72Wy-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/iommu/iommufd/io_pagetable.o: in function `.LBB1739':
>> drivers/iommu/iommufd/io_pagetable.c:498:(.text+0x2908): undefined reference to `dma_buf_get'
   loongarch64-linux-ld: drivers/iommu/iommufd/io_pagetable.o: in function `.LBB1758':
>> drivers/iommu/iommufd/io_pagetable.c:504:(.text+0x2a84): undefined reference to `dma_buf_put'


vim +498 drivers/iommu/iommufd/io_pagetable.c

   469	
   470	/**
   471	 * iopt_map_file_pages() - Like iopt_map_user_pages, but map a file.
   472	 * @ictx: iommufd_ctx the iopt is part of
   473	 * @iopt: io_pagetable to act on
   474	 * @iova: If IOPT_ALLOC_IOVA is set this is unused on input and contains
   475	 *        the chosen iova on output. Otherwise is the iova to map to on input
   476	 * @fd: fdno of a file to map
   477	 * @start: map file starting at this byte offset
   478	 * @length: Number of bytes to map
   479	 * @iommu_prot: Combination of IOMMU_READ/WRITE/etc bits for the mapping
   480	 * @flags: IOPT_ALLOC_IOVA or zero
   481	 */
   482	int iopt_map_file_pages(struct iommufd_ctx *ictx, struct io_pagetable *iopt,
   483				unsigned long *iova, int fd, unsigned long start,
   484				unsigned long length, int iommu_prot,
   485				unsigned int flags)
   486	{
   487		struct iopt_pages *pages;
   488		struct dma_buf *dmabuf;
   489		unsigned long start_byte;
   490		unsigned long last;
   491	
   492		if (!length)
   493			return -EINVAL;
   494		if (check_add_overflow(start, length - 1, &last))
   495			return -EOVERFLOW;
   496	
   497		start_byte = start - ALIGN_DOWN(start, PAGE_SIZE);
 > 498		dmabuf = dma_buf_get(fd);
   499		if (!IS_ERR(dmabuf)) {
   500			pages = iopt_alloc_dmabuf_pages(ictx, dmabuf, start_byte, start,
   501							length,
   502							iommu_prot & IOMMU_WRITE);
   503			if (IS_ERR(pages)) {
 > 504				dma_buf_put(dmabuf);
   505				return PTR_ERR(pages);
   506			}
   507		} else {
   508			struct file *file;
   509	
   510			file = fget(fd);
   511			if (!file)
   512				return -EBADF;
   513	
   514			pages = iopt_alloc_file_pages(file, start_byte, start, length,
   515						      iommu_prot & IOMMU_WRITE);
   516			fput(file);
   517			if (IS_ERR(pages))
   518				return PTR_ERR(pages);
   519		}
   520	
   521		return iopt_map_common(ictx, iopt, pages, iova, length,
   522				       start_byte, iommu_prot, flags);
   523	}
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
