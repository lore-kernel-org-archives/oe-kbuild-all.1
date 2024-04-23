Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414BD1422D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904127; cv=none; b=IqTTVy+k9afI+/OzDDNPtggTi6wJFqCy3CbtShHtahu8BaOr7MhnkGHE0nPlFHTPhbl+7MXbZZxk6ReIv+l+46wkJGF1rt2TeJniEdyOAnivkP4dkPcLqhFKMRbiG4SguvjllK+3yNud8dkMTnpKG1S1lqo4Zv0lEt8qCxlpzn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904127; c=relaxed/simple;
	bh=DQa1ri0KXNjn+pHiNfwtddKXvjpJ3kc/VGNKS+BlrEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mg4aoQT2OaCDI39c+AbhktlZAG6/QHxu6UjIsyMbohfX6pGaUPkAOKE5N+mhTbcJ8FPxMcm+XuRw5sJInuKSZcEqySmrdVN9Qs8HKrBWhPMxlFC1eZNap/q91aqYD6SwS+8V0ceMlW8dAv4+qY2q6nTPd4Rm7KX0/V2qphgqzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZzUcLFj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZzUcLFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713904125; x=1745440125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DQa1ri0KXNjn+pHiNfwtddKXvjpJ3kc/VGNKS+BlrEI=;
  b=MZzUcLFjQHaJgPlI1wuTvwKNuJYhqUDi8OI6OktsgOAVuxXs18kcfHsW
   ht6OXgU7a0vABfOHbA6EBfXTWm78FSmVgU5vYSsDPLrKX9LYPgNq5LK3/
   NIzrjarK0G8V4ynV/aRwb6rx7NepapFR94wqOyN1nMmYlueXvQ86brnKb
   a4i8V4rqih7y/QvTfHg90xgx5nPuqrIl+iDgbCBKCCjOYXeaHAPi6kHSC
   xBUPxcI8HoGakKDHMBG2hQQCIIYI1dDCqo56W1o6kx9fGEJgJOeXCbgVk
   bnZkU4gb4CmxtGw2svv+3NV+194Vs2aUSgAhBiDNFIlnhl1v7E+Qv+ZR8
   g==;
X-CSE-ConnectionGUID: JrNC6BCuQvWYPszm5Oog1A==
X-CSE-MsgGUID: Z5jrRltsT6Gifft2sasxUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9728259"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9728259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:28:45 -0700
X-CSE-ConnectionGUID: BoDR1I9XR8ucPCf7nwQIhQ==
X-CSE-MsgGUID: dAf3ZMxsR5Stk3/zwzqsng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47755885"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Apr 2024 13:28:44 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzMkr-0000Va-1y;
	Tue, 23 Apr 2024 20:28:41 +0000
Date: Wed, 24 Apr 2024 04:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 17/79] net/core/page_pool.c:408:9: error:
 implicit declaration of function '__dma_sync_single_for_device'; did you
 mean 'dma_sync_single_for_device'?
Message-ID: <202404240428.Jf85xYQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   ea045e0636b90b47497dc78195735fb6c00f5259
commit: 193d037feac1b91fb278ab334878f56f320517b5 [17/79] page_pool: check for DMA sync shortcut earlier
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240428.Jf85xYQt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240428.Jf85xYQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240428.Jf85xYQt-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/page_pool.c: In function '__page_pool_dma_sync_for_device':
>> net/core/page_pool.c:408:9: error: implicit declaration of function '__dma_sync_single_for_device'; did you mean 'dma_sync_single_for_device'? [-Werror=implicit-function-declaration]
     408 |         __dma_sync_single_for_device(pool->p.dev, dma_addr + pool->p.offset,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         dma_sync_single_for_device
   cc1: some warnings being treated as errors


vim +408 net/core/page_pool.c

   400	
   401	static void __page_pool_dma_sync_for_device(const struct page_pool *pool,
   402						    const struct page *page,
   403						    u32 dma_sync_size)
   404	{
   405		dma_addr_t dma_addr = page_pool_get_dma_addr(page);
   406	
   407		dma_sync_size = min(dma_sync_size, pool->p.max_len);
 > 408		__dma_sync_single_for_device(pool->p.dev, dma_addr + pool->p.offset,
   409					     dma_sync_size, pool->p.dma_dir);
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
