Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C683921D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775865509; cv=none; b=AmAhYYDeFekisBqQokfMmqYyJuugeusA0f2HrtGRqovGXCPCppBg79LmoDyPXyiLdKL45GXf3ihujSjCDK7fYXeeqmX3Qkwds0VNjZADrIgDGg95TpUVb/GD/r3hDVpWB7VHhOrF13ZAY2miHcYGvh4+unzx1VxzXYHTTWYFki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775865509; c=relaxed/simple;
	bh=cDadZav3YxduTw2satuDF79O7HcEi9vBpNCAKek9khI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k2mQ06q13pvr0MkIgmsntFvYlhbjxhCSOMz1chlwqWkOwfQQvdD+CFs8uQZtFq7zKT3+qZbd5rmvAmqfLstxjEtCdZ1JsBSdc7Nhy7JPW50J9P46UCt6dGSPk6OyyRSJpU6sNT2SvkCAR5VMdQIrojutU44/tXbqP2wmfWVC5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+JipNW5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+JipNW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775865508; x=1807401508;
  h=date:from:to:cc:subject:message-id;
  bh=cDadZav3YxduTw2satuDF79O7HcEi9vBpNCAKek9khI=;
  b=a+JipNW5mtOnxPb4BTq3hXz5QNdnYiqR+g0zyq1eaG6WH5V6j/UtH2Zp
   f7BBO4CjkeU8Cq5Tpidqa1JlBUerpsPUywXFW0KbrhMucvO7M9KyKga4+
   tRvbQ/dIa4Kbjuaewa2ZLiA4CY/dd0oXf6osqzHdPrln/50Az8298m8Gt
   X4oVLTId3cJJRTNOSNzgFiMPeOyMTv8j+J0T7lBN1lJV/1Bu+mq1CiEXt
   Sc5XzI56R8EPIVs8SJiu9fzOmUrJjHkkYCsxRb8NdtEmBXbNQ/Xzn+iLS
   TxudxRwkYCYGyOuHG4a2JGALOzd7EqvTKd01s/SsHT8YfqEgyWieEElGa
   g==;
X-CSE-ConnectionGUID: +K3717GrSA2njDtsSAvvmg==
X-CSE-MsgGUID: OCC0SACsR0KxLjrCLbZq6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75932520"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="75932520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:58:28 -0700
X-CSE-ConnectionGUID: O0xJuI0qR2OJUc1QgMZnyQ==
X-CSE-MsgGUID: CsItnYpuQxqGv/by0vxrvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="233635474"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2026 16:58:26 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLjz-000000000Q5-1xhi;
	Fri, 10 Apr 2026 23:58:23 +0000
Date: Sat, 11 Apr 2026 07:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 2/22]
 include/linux/dma-buf.h:684:39: error: parameter name omitted
Message-ID: <202604110720.ygLAuQo8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   75bc54f772e3ac32677414b0f929df9ca6c2ed28
commit: a7123fbdd8fd4b221a823380ece329f285a7de4a [2/22] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: csky-randconfig-r061-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110720.ygLAuQo8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110720.ygLAuQo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110720.ygLAuQo8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/zcrx.h:6,
                    from io_uring/io_uring.c:89:
   include/linux/dma-buf.h: In function 'dma_buf_mmap':
>> include/linux/dma-buf.h:684:39: error: parameter name omitted
     684 |           struct vm_area_struct *vma, unsigned long)
         |                                       ^~~~~~~~~~~~~


vim +684 include/linux/dma-buf.h

   677	
   678	static inline void
   679	dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
   680					  struct sg_table *sg_table,
   681					  enum dma_data_direction direction) { }
   682	
   683	static inline int dma_buf_mmap(struct dma_buf *dmabuf,
 > 684				       struct vm_area_struct *vma, unsigned long)
   685	{
   686		return -EOPNOTSUPP;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
