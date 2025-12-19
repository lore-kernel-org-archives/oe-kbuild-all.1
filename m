Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0EE298CBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766123398; cv=none; b=Q8sJ0729DMF6SzP+pjSA7adpdSLxvZaBdiqgvi8L8ziEb6RoyfeRefu8+hINU9MrnTaidBWg0MQMUa/NxD1hhIjp43ObkoRNcvQ+FEYdhO8AtPzl/osu7rqvNBtlcwwZlClGRVyOS2uvoJjVGlqyRcyh0z1lzt6HI1ENeRSiGYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766123398; c=relaxed/simple;
	bh=Vy/bp+MKweigZHP7MiaS/ScoNBqWmFI/chGOW/9mPgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBbs9cBtShRLDwdoCgzoSUsLElIr/FWrmqp6m5L4WnQQrljLPODlP3lbh5q61EL8DxB1b1qPqYlXEYfN8NWPn87Cmp4FNzS00uFN9wglSrbqJUqT+QE1Erd7kerhHbqY9YzPKXoVrxXQCZag1ERYfTyNmc3rJ9f8XXnoMFdQz1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGSM/z4A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGSM/z4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766123397; x=1797659397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vy/bp+MKweigZHP7MiaS/ScoNBqWmFI/chGOW/9mPgo=;
  b=gGSM/z4AmEIo2okWxRvBlKs/voiyyCJoQExA/AOTrTUpIRBeuhsE5ShF
   uAJalv83k+LKrdy7tVQ+ozxP6ikF754fRQgRMeaIESqoZhbFISgHyiFhA
   kUb4FgKVV/0MINdAEHfQ3sxCf+DwAMglkWrumLa8pDvPj4haJybo+Prex
   z5phoI+ImcFcSaEnTuSr8+20d/Tu+Z7WC+jb8ib62TXZ9NYmSjThWLLHW
   dvVgR6C8VvJiAwrLVimNmOxzd424nNDWn1l57M4c+pkYYjjSkuW+d4tR4
   SQuW77ESfa5KJOUGfjccj+R9CAG670kyLFwcN+MplFt789cFdI7TwXLHS
   A==;
X-CSE-ConnectionGUID: hoFbGv9TQSiAwKa3TyxWnA==
X-CSE-MsgGUID: kdAYcZMrRn2UfNhTIwCIAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78401048"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78401048"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:49:57 -0800
X-CSE-ConnectionGUID: SY4gUTRPQpi8giou1cFDEg==
X-CSE-MsgGUID: 9+AhF/PXRCKdz5Fz+IpKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229815151"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Dec 2025 21:49:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWTNA-00000000365-3uLF;
	Fri, 19 Dec 2025 05:49:52 +0000
Date: Fri, 19 Dec 2025 13:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 1/1]
 drivers/dma-buf/dma-buf.c:77:5: warning: no previous prototype for
 'get_dmabuf_debugfs_data'
Message-ID: <202512191339.jTyuEJu3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oreoluwa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   48e14edb7739412123f814f9bb148ea2100a844f
commit: 4e54be02ffdb8819ccb4390b922690c1a9e55ce2 [1/1] ANDROID: dma-buf: Export API to iterate through dmabuf debugfs info
config: arm64-randconfig-003-20251219 (https://download.01.org/0day-ci/archive/20251219/202512191339.jTyuEJu3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191339.jTyuEJu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191339.jTyuEJu3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:77:5: warning: no previous prototype for 'get_dmabuf_debugfs_data' [-Wmissing-prototypes]
      77 | int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/get_dmabuf_debugfs_data +77 drivers/dma-buf/dma-buf.c

    66	
    67	static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
    68	{
    69		if (!dmabuf)
    70			return;
    71	
    72		mutex_lock(&debugfs_list_mutex);
    73		list_del(&dmabuf->list_node);
    74		mutex_unlock(&debugfs_list_mutex);
    75	}
    76	#else
  > 77	int get_dmabuf_debugfs_data(int (*fn)(const struct dma_buf *, void *),
    78				void *private)
    79	{
    80		return -EINVAL;
    81	}
    82	EXPORT_SYMBOL_NS_GPL(get_dmabuf_debugfs_data, DMA_BUF);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
