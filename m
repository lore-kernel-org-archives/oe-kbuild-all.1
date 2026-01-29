Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AA280327
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769663469; cv=none; b=QaYVrZPSOwTGSplNWK8yPeocOY7J2QpBeAcKQPyoB+X+b/4n4Id6HIChl0MrnJY0WJb2Kf39oyvC1dXRI6/BEHNfuRQcKiL2UHNt+nyp/uXDdy4dDdFPzB2LxOMUiDydSgDUsg999oDeSbgF3D/oUDFPMbsQjlDMFC2yfXOVdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769663469; c=relaxed/simple;
	bh=mF13Et/EWgnItatEdj3INsmfB1uPqfXpKYmBxrJp8S8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TFTK83ieBgeJIV2mafOeUOuJQpjFpIGgcX1DxYZbxGKN+NdBFKt7Kn4b0kzUzk1+z+LqIorySJxZYG9SaKFBGVBSRFXOTs9jjDgg+LJRP+PmXcylre7cpWprjInhvPZieQnmGjRjBHkzXt2c0OguDA3CB/IPGYSDYTI83Jl6hE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6KcyVuI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6KcyVuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769663469; x=1801199469;
  h=date:from:to:cc:subject:message-id;
  bh=mF13Et/EWgnItatEdj3INsmfB1uPqfXpKYmBxrJp8S8=;
  b=F6KcyVuI8AV8mQ2Gs/YP++z0yd8aMyc8EhEtxs1LeUjtUceqmfRkf/S5
   9KpTqFKoHTbCgnzEsvNKe+TqdRAIJBxJou2/p40+iTcTPi20f9SuKgoSP
   UxlOKvvM/CBoHuaoy9JxKg/rDjS6ES9gn2VDS31Vo4EgUENGb1w0W/YkA
   u/ZXvhsl7WhEI8Ny1YIUSZXy16gfnceQoZ5vR9vPSxxA/dLNL6tvG732o
   D3NdeYxTyvCEFS2IVHmHQEg8pCOUCSQmNvnLsM4Bzx7aXs6n4ir4xcSD5
   Wm9x3Ec1NMrgNw0wEZ6e/CVpQ9nNMaySYLwJWbsgKeiQCeN1xQ6VggGJg
   w==;
X-CSE-ConnectionGUID: tQOQNSRkQs6u5vPCnH8tyA==
X-CSE-MsgGUID: G4h4rL7RS3uLSNUxhP+3Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82319028"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="82319028"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 21:11:08 -0800
X-CSE-ConnectionGUID: U8lY9b6FQDiI0RjmzLAlYg==
X-CSE-MsgGUID: iHfzP5GTT1OGil6E9X+d7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208368737"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jan 2026 21:11:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlKJ6-00000000b7E-0U41;
	Thu, 29 Jan 2026 05:11:04 +0000
Date: Thu, 29 Jan 2026 13:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 2/17]
 include/linux/dma-buf.h:706:39: error: parameter name omitted
Message-ID: <202601291316.FZ2jsoqv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   76427c94d00817c6ba0956ffa50ece35759aa37c
commit: 085cecef6ce6cb8d0cbc931f9425224def2164ec [2/17] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: m68k-randconfig-r054-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291316.FZ2jsoqv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291316.FZ2jsoqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291316.FZ2jsoqv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/zcrx.h:6,
                    from io_uring/io_uring.c:101:
   include/linux/dma-buf.h: In function 'dma_buf_mmap':
>> include/linux/dma-buf.h:706:39: error: parameter name omitted
     706 |           struct vm_area_struct *vma, unsigned long)
         |                                       ^~~~~~~~~~~~~


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
