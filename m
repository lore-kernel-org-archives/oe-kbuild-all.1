Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978538;
	b=NLDZOnTNx/mCcGuXECC0FW9+Vdiy4uhFu0TFTFNi6i2txI7+fWcjvvufMGDo9iKZ1LL2
	 d3c3+mo0u8JUc6H4GwbG56wZcHYf/i7ROlkP1YR/7CYsqd1Rst4TNbxMPyNiyDbRLfp3J
	 8l3aeUeQZBNivFG5CXPykiTV3m9+3iZQ46PZdO8tF/qb+Zn7bbREdQDErWOczQcrOfVjm
	 lGtcK+cyqNOpz11r7F+weWMZQtUTJP0Nlx+OG4/6YRFVyD4Wba08rQ5uciOSwnHCwy8Nc
	 vAXTS5d2YkZ+0fGHPGLT4pmTfJBelTuEFSlfgm7MkaSfK8+0QkcbhxU6FiWmpsYPnlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lGz688wnSiLBt9+k0E3kJwGc/ixPHcTO0dNjdQ1l4Hg=;
	b=xwBs5yoZN/Q967MCfrYRRZ5/IwkMNMnhoRV6fn0t/envBIVADb0otpZmIXSIbGORe+hy
	 F0aZSkFA/y1f1U6D6pRWn56AZpVEwYmzUaAkZycrzWR7GC1B31z0IUY/4XdX9EK73G0eT
	 JyF0Zp62ySv8dmTHKqRozNUFmxoF4eSyNQdt57b6n2pO0vbzAWFAbxnttiHg4RWsKwkDT
	 rpkOPw1b+fmizD1MB98lFZt2wp1fNZlXNxfuB2i708JlmdrAAr64URXBqXdNvXYZIXxkp
	 z/ek9QTWh4+qdT1hrdoacmHC4GJn0DM6Yq73rRGbvbzWv6jvIIToguWRGZQ7jb/xPuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSEUPBH6;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390A2606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 01:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eSEUPBH6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792978537; x=1824514537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6XeH1nDmIKEwWHahs4esRbq75DGdv4dggga0X48z5aw=;
  b=eSEUPBH6T8Q016bNzJ00C1hFieXAsgN/C7tVsDrH19JAyM2h5bh2QWhW
   BGnkiq4VTpHMwWhVc8f1Sulj8btJEcI+pPQjx2aQIk0EyD7pMY+Q/L0r8
   v3Q/q8oJaF59VbrztuxMU5ontR2mxuWqQ/I5QwjwVxQ95xe5IeUPt5ZV0
   tnW/OkzEC17HUaWUSH8uKnE8bHRIBxLZZjlmap0l/sg44sXvIPz0NhyQ5
   UqcE5tAYvbGyfNeCTSRSOj9EBISmA6R1pScW0KgO6w/t5v4qvHeqhYbuO
   r+Bwx5kDZd+8iuXVCjwmwVutp9LhA9KyFW2tGDykYgNIbrTWo3x0aCkEH
   w==;
X-CSE-ConnectionGUID: yCtyomzHTXmD87f+g2gXAQ==
X-CSE-MsgGUID: UHXgkLZ8RWijqcNp/5CA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1516728"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1516728"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 18:35:36 -0700
X-CSE-ConnectionGUID: vn57Yzv8QpO+fs+7TSm88Q==
X-CSE-MsgGUID: UBJTCDoEQU252vSwaq5npw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4147146"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2026 18:35:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL9cW-00000000VL4-0M45;
	Mon, 26 Oct 2026 01:35:28 +0000
Date: Mon, 26 Oct 2026 09:34:44 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 2/2] dma-buf/dma-fence: Order setting of the signaled-bit
 properly
Message-ID: <202610260958.IcV50YNq-lkp@intel.com>
References: <20261021095512.1345191-4-phasta@kernel.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021095512.1345191-4-phasta@kernel.org>

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1ecab8b0bad393750c60cc3819ce9c256595463c]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/asm-generic-bitops-Add-set_bit_release/20261021-115512
base:   1ecab8b0bad393750c60cc3819ce9c256595463c
patch link:    https://lore.kernel.org/r/20261021095512.1345191-4-phasta%40kernel.org
patch subject: [PATCH 2/2] dma-buf/dma-fence: Order setting of the signaled-bit properly
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261026/202610260958.IcV50YNq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610260958.IcV50YNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610260958.IcV50YNq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/dma-fence.c: In function 'dma_fence_signal_timestamp_locked':
>> drivers/dma-buf/dma-fence.c:393:9: error: implicit declaration of function 'set_bit_release'; did you mean 'seq_release'? [-Wimplicit-function-declaration]
     393 |         set_bit_release(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
         |         ^~~~~~~~~~~~~~~
         |         seq_release


vim +393 drivers/dma-buf/dma-fence.c

   337	
   338	/**
   339	 * dma_fence_signal_timestamp_locked - signal completion of a fence
   340	 * @fence: the fence to signal
   341	 * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
   342	 *
   343	 * Signal completion for software callbacks on a fence, this will unblock
   344	 * dma_fence_wait() calls and run all the callbacks added with
   345	 * dma_fence_add_callback(). Can be called multiple times, but since a fence
   346	 * can only go from the unsignaled to the signaled state and not back, it will
   347	 * only be effective the first time. Set the timestamp provided as the fence
   348	 * signal timestamp.
   349	 *
   350	 * Unlike dma_fence_signal_timestamp(), this function must be called with
   351	 * &dma_fence.lock held.
   352	 */
   353	void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
   354					      ktime_t timestamp)
   355	{
   356		const struct dma_fence_ops *ops;
   357		struct dma_fence_cb *cur, *tmp;
   358		struct list_head cb_list;
   359	
   360		dma_fence_assert_held(fence);
   361	
   362		if (unlikely(dma_fence_test_signaled_flag(fence)))
   363			return;
   364	
   365		trace_dma_fence_signaled(fence);
   366	
   367		/*
   368		 * When neither a release nor a wait operation is specified set the ops
   369		 * pointer to NULL to allow the fence structure to become independent
   370		 * from who originally issued it.
   371		 */
   372		ops = rcu_dereference_protected(fence->ops, true);
   373		if (!ops->release && !ops->wait)
   374			RCU_INIT_POINTER(fence->ops, NULL);
   375	
   376		/* Stash the cb_list before replacing it with the timestamp */
   377		list_replace(&fence->cb_list, &cb_list);
   378	
   379		fence->timestamp = timestamp;
   380		set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
   381	
   382		list_for_each_entry_safe(cur, tmp, &cb_list, node) {
   383			INIT_LIST_HEAD(&cur->node);
   384			cur->func(fence, cur);
   385		}
   386	
   387		/*
   388		 * This orders the signaled-state with the test_bit_acquire() in
   389		 * dma_fence_test_signaled_flag(). This ensures that functions like
   390		 * dma_fence_is_signaled() can only ever return true once signaling is
   391		 * completed (i.e., after the callbacks above ran).
   392		 */
 > 393		set_bit_release(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
   394	}
   395	EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
   396	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
