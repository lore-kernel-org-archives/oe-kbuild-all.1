Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9463382285
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542857; cv=none; b=VSE4FlX74SZQ9ved2ITuATxWiYOycnJY1WX4ScWZ6iRP50rpmT35aOrHd3GYcUXs5gG4NyJKAOMA89sMLOZ6Tu2+SGnIMYGTSekO9XrmvsfoTO7HLfz9gvVkSlkExtEwb+9ETWFXhNMiodVDI5VohfD563/SLLNMlpKMZXNz4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542857; c=relaxed/simple;
	bh=5TbuXwepCP1fqGiFhiteh2eWDHkI1FQVegWaWLLX+RI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRXQ2xQmuE9GcJEhD9nRQUIbsV/aH90g6lVwnPWLz142X11UFftKLJFePeveuWfVwSbgVDKOiOFnYPURBKqmEuQspqFTXpZo1si8umN60sjx5jQ8ooL4gVGIH5JVBJCSsICrhRjxgbpr9hsL5TmCXblMiSS7R23ngh99GCw+UCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig3yu13O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig3yu13O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775542855; x=1807078855;
  h=date:from:to:cc:subject:message-id;
  bh=5TbuXwepCP1fqGiFhiteh2eWDHkI1FQVegWaWLLX+RI=;
  b=ig3yu13OmD66tfr/YT4ZYoU61IoLDiCOkIQb+HKcITAibpqAuBqdeZIE
   wH6c5UyczPy7aQgafQ7bpmJMz9ZWxXj1VDj0kPSNlbA12a2GTouSg2/Gb
   i8s0UUh5pLKjNpv+V1uEjwb2wVrzTbjDuTO9funzZ1lgOYp8P9doxGs6v
   /CHav8yFAVJowMF2W2ZiIqS5GDKbd8iLDOB7j+rHl9xGIRLDUTbyT/s+t
   ZCnHQz7+iZ/49JrfMhgleqTIG5oCvkFT/ETL1avrhH9iqFYNJixUzj07j
   TKOg4/pUwjJ0FA2mK3NA8soudq9JlI3JOSssDDzNkPIZKe6ZY5dWWE9FL
   Q==;
X-CSE-ConnectionGUID: S/da3iOiRcedk5Cie25+1g==
X-CSE-MsgGUID: DhQZMKoqT2CA+pcIZREftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76569961"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76569961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:20:53 -0700
X-CSE-ConnectionGUID: YDT3cvnwRcmcj4cT+DAJoQ==
X-CSE-MsgGUID: UAzUJYaARSWcDKmgFrlfxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227983830"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 23:20:53 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9znu-000000000Fx-05vA;
	Tue, 07 Apr 2026 06:20:50 +0000
Date: Tue, 07 Apr 2026 14:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 2/17]
 include/linux/dma-buf.h:706:52: warning: omitting the parameter name in a
 function definition is a C23 extension
Message-ID: <202604071417.2Ruqru2s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Viresh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   b6c438e7620f0d55318710ee8705e3c173c968bf
commit: 085cecef6ce6cb8d0cbc931f9425224def2164ec [2/17] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: um-defconfig (https://download.01.org/0day-ci/archive/20260407/202604071417.2Ruqru2s-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071417.2Ruqru2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071417.2Ruqru2s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:101:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:706:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     706 |                                struct vm_area_struct *vma, unsigned long)
         |                                                                         ^
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
