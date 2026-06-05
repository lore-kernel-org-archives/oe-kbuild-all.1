Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D627404E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780691588; cv=none; b=O8QOcbVUOPzdPnp/jY2vFmzljmgH+enCUzxToYD9qLABR4VRULgxRIib3HqHFClZqlE52bmnIx3rCB0baGTU2mAiWCzi0iGzhqae/lXgYGPSZ7hUt4esBagiRNLr3g53/7n7iM72eAvX5nD7b7B7k6k6PSm+E/euML7Qypd9MQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780691588; c=relaxed/simple;
	bh=7+MYABtSn1Op+jjdZpJHaW0EKuu0iWWNBhTbNgBkgKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=As5lNflDeSXPwvUFi8/YyGfO2tHvi1XcbCREHQjNJBjSkP40KMsTaMMisedg8admdMdLoP9/JHB1ywV9QYim/9iEZi6arhSQJuyfvL5Bq6ZcvYwuD4PcfFNH97TTaXn4cYVbSiRTX9wpIGCoVWbeeZ5ZIoMJXEbLMKOy4UXSlfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gve93y4e; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gve93y4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780691587; x=1812227587;
  h=date:from:to:cc:subject:message-id;
  bh=7+MYABtSn1Op+jjdZpJHaW0EKuu0iWWNBhTbNgBkgKw=;
  b=Gve93y4eLDsiru3iBVyAF90+9mM0pHq/w/Uj9mI2xonCIo3NCFLXXzU6
   6YArtBtdGn2Yb0W6G6hKoWDBD9idI6NSMGYiMtmUDYgynOwKZY4jlXiZA
   zhJbLsGynVfpBs+ioM3+CE12qO8yXzcWi94heB0Qhu6jLsrHDqgcFV2Y1
   1bPlYXxmkXr/MW+Dtv7Zts7PSlktqB0FQveT1QTPhWXzBNPI87QXg2NEW
   fequpKxuDTE+n1RMYmY0c0qH//OYlNGzbihjmj81NFGcq/pHGG51Gsst8
   WpAp+bWz0Sl0KW3TO49RbUPhLqrNyOxaUq5v04MwnVIqubX5zs06ONB7H
   A==;
X-CSE-ConnectionGUID: I7nc95ZLRh6N9uJ9AmxrzQ==
X-CSE-MsgGUID: 7scTE/hrTuSBlgzfO3Ofcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="99103941"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="99103941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 13:33:06 -0700
X-CSE-ConnectionGUID: QXXQaL1kSJmhW/ugYHcWpA==
X-CSE-MsgGUID: obtLw7OcTZyt92SWfjgywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="246773296"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 13:33:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVbDy-00000000GRa-19dJ;
	Fri, 05 Jun 2026 20:33:02 +0000
Date: Sat, 06 Jun 2026 04:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-dnu 2/22]
 include/linux/dma-buf.h:681:52: warning: omitting the parameter name in a
 function definition is a C2x extension
Message-ID: <202606060452.jWoyoQsS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-dnu
head:   3f82c4921593bc77b715a413ab2eb6d99396ea68
commit: 28248187ee4c7ab861b06f44f148f583fb1429eb [2/22] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260606/202606060452.jWoyoQsS-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060452.jWoyoQsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606060452.jWoyoQsS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:89:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:681:52: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
                                  struct vm_area_struct *vma, unsigned long)
                                                                           ^
   1 warning generated.


vim +681 include/linux/dma-buf.h

   674	
   675	static inline void
   676	dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
   677					  struct sg_table *sg_table,
   678					  enum dma_data_direction direction) { }
   679	
   680	static inline int dma_buf_mmap(struct dma_buf *dmabuf,
 > 681				       struct vm_area_struct *vma, unsigned long)
   682	{
   683		return -EOPNOTSUPP;
   684	}
   685	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
