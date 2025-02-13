Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957D32010F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464381; cv=none; b=FKldCDTtOkKuhwmVYlAjdzr5BVo7EGtJ7gyZis9FMxkPKHPpJyiQAQUYtbwXIRor0t9JFldEBU1L5pS8/avMlHxEHdBe3sZgOH1OEzFkw4B6iyymywO1Pzfej0Y1PuSSLPFBXf8nUi23VmMj9JznGsfUbNCI/uzNuo7BUmf5dM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464381; c=relaxed/simple;
	bh=j0mfwVoS+AyGTSop8YAdRrnpw3s7F4Yc3xQPXmjqNs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlKx69PFBSwuyUtY0ebDwOJyzMy+Ur9WrkdDckD13IP83EyYjMMPB1Ek4dHF+jKbm/GHx253xzHyBz6AYCZNp/3IvUZZtT8OGefh2fB2R3p0aqbdMifa7yuzY29418XMd/YYu15SS6zBqWO1mYyxhp1BudyN9DidpCKx7slCRQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4SGjsKW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4SGjsKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739464380; x=1771000380;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j0mfwVoS+AyGTSop8YAdRrnpw3s7F4Yc3xQPXmjqNs0=;
  b=f4SGjsKWMFapddLoFottYzE6ZLNiphc3lWI9jUG/HhAsyeBQHoiF5nNz
   87s12jFgMVEUnsi1ruIuZ2HLhWDxWoSHCQqpwujXFA1ABlqWs+uOQx2il
   606QjPZJHbAlgqijTPbDFRZKw5ei4zt3FsfLPw3wRVXthyR3IF/KeQFlx
   H7pPckGImWQ5M/lIg/SGbL8xQhTSB/WNNMCluNsQVyyM/S7l+zMnGJ1wv
   RAIS11j/DPAZZvdiI4otkAKH6dOwnPi+d/ncNXBP/apKE4mGPQRelm6Ih
   NBEBVZ0s/sQRz/uX+iY8QpCb+lrWsKmwqFBn8qnQN9VB5kcfgMu3m/6vX
   w==;
X-CSE-ConnectionGUID: kyT+Oi1oQ8iJ0xDA1cByIA==
X-CSE-MsgGUID: b+GVThsQTRqLL7jSaYOpOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43942939"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="43942939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:32:59 -0800
X-CSE-ConnectionGUID: +AIYGZlYSzqAmuLw24yi9Q==
X-CSE-MsgGUID: AGwIF5Z9Rym9KU0dZWRnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113160404"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2025 08:32:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tic92-0018Qn-0J;
	Thu, 13 Feb 2025 16:32:56 +0000
Date: Fri, 14 Feb 2025 00:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 14/26]
 drivers/dma-buf/dma-fence-chain.c:65:21: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202502140014.CYel5X8d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   9c8d14ce8aff2d38bf494f5d5436a302e3236842
commit: f7039fb7b3a9459a6c5ed166c267bdf294492c1b [14/26] rcu: Support Clang's capability analysis
config: arc-randconfig-r112-20250213 (https://download.01.org/0day-ci/archive/20250214/202502140014.CYel5X8d-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250214/202502140014.CYel5X8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140014.CYel5X8d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-fence-chain.c:65:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected struct dma_fence *tmp @@     got void @@
   drivers/dma-buf/dma-fence-chain.c:65:21: sparse:     expected struct dma_fence *tmp
   drivers/dma-buf/dma-fence-chain.c:65:21: sparse:     got void

vim +65 drivers/dma-buf/dma-fence-chain.c

7bf60c52e093d9 Christian König 2019-04-01  30  
7bf60c52e093d9 Christian König 2019-04-01  31  /**
7bf60c52e093d9 Christian König 2019-04-01  32   * dma_fence_chain_walk - chain walking function
7bf60c52e093d9 Christian König 2019-04-01  33   * @fence: current chain node
7bf60c52e093d9 Christian König 2019-04-01  34   *
7bf60c52e093d9 Christian König 2019-04-01  35   * Walk the chain to the next node. Returns the next fence or NULL if we are at
7bf60c52e093d9 Christian König 2019-04-01  36   * the end of the chain. Garbage collects chain nodes which are already
7bf60c52e093d9 Christian König 2019-04-01  37   * signaled.
7bf60c52e093d9 Christian König 2019-04-01  38   */
7bf60c52e093d9 Christian König 2019-04-01  39  struct dma_fence *dma_fence_chain_walk(struct dma_fence *fence)
7bf60c52e093d9 Christian König 2019-04-01  40  {
7bf60c52e093d9 Christian König 2019-04-01  41  	struct dma_fence_chain *chain, *prev_chain;
7bf60c52e093d9 Christian König 2019-04-01  42  	struct dma_fence *prev, *replacement, *tmp;
7bf60c52e093d9 Christian König 2019-04-01  43  
7bf60c52e093d9 Christian König 2019-04-01  44  	chain = to_dma_fence_chain(fence);
7bf60c52e093d9 Christian König 2019-04-01  45  	if (!chain) {
7bf60c52e093d9 Christian König 2019-04-01  46  		dma_fence_put(fence);
7bf60c52e093d9 Christian König 2019-04-01  47  		return NULL;
7bf60c52e093d9 Christian König 2019-04-01  48  	}
7bf60c52e093d9 Christian König 2019-04-01  49  
7bf60c52e093d9 Christian König 2019-04-01  50  	while ((prev = dma_fence_chain_get_prev(chain))) {
7bf60c52e093d9 Christian König 2019-04-01  51  
7bf60c52e093d9 Christian König 2019-04-01  52  		prev_chain = to_dma_fence_chain(prev);
7bf60c52e093d9 Christian König 2019-04-01  53  		if (prev_chain) {
7bf60c52e093d9 Christian König 2019-04-01  54  			if (!dma_fence_is_signaled(prev_chain->fence))
7bf60c52e093d9 Christian König 2019-04-01  55  				break;
7bf60c52e093d9 Christian König 2019-04-01  56  
7bf60c52e093d9 Christian König 2019-04-01  57  			replacement = dma_fence_chain_get_prev(prev_chain);
7bf60c52e093d9 Christian König 2019-04-01  58  		} else {
7bf60c52e093d9 Christian König 2019-04-01  59  			if (!dma_fence_is_signaled(prev))
7bf60c52e093d9 Christian König 2019-04-01  60  				break;
7bf60c52e093d9 Christian König 2019-04-01  61  
7bf60c52e093d9 Christian König 2019-04-01  62  			replacement = NULL;
7bf60c52e093d9 Christian König 2019-04-01  63  		}
7bf60c52e093d9 Christian König 2019-04-01  64  
14374e3eee1b02 Christian König 2022-05-11 @65  		tmp = unrcu_pointer(cmpxchg(&chain->prev, RCU_INITIALIZER(prev),
14374e3eee1b02 Christian König 2022-05-11  66  					     RCU_INITIALIZER(replacement)));
7bf60c52e093d9 Christian König 2019-04-01  67  		if (tmp == prev)
7bf60c52e093d9 Christian König 2019-04-01  68  			dma_fence_put(tmp);
7bf60c52e093d9 Christian König 2019-04-01  69  		else
7bf60c52e093d9 Christian König 2019-04-01  70  			dma_fence_put(replacement);
7bf60c52e093d9 Christian König 2019-04-01  71  		dma_fence_put(prev);
7bf60c52e093d9 Christian König 2019-04-01  72  	}
7bf60c52e093d9 Christian König 2019-04-01  73  
7bf60c52e093d9 Christian König 2019-04-01  74  	dma_fence_put(fence);
7bf60c52e093d9 Christian König 2019-04-01  75  	return prev;
7bf60c52e093d9 Christian König 2019-04-01  76  }
7bf60c52e093d9 Christian König 2019-04-01  77  EXPORT_SYMBOL(dma_fence_chain_walk);
7bf60c52e093d9 Christian König 2019-04-01  78  

:::::: The code at line 65 was first introduced by commit
:::::: 14374e3eee1b02dbf162e1dd75b789373f07ef43 dma-buf: cleanup dma_fence_chain_walk

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
