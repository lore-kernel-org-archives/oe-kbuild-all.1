Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E725524C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765643287; cv=none; b=f2eeCV01xsm3DXozBpSGut34BPdGPirbubep/4AiIC7IyzsSgbtWulieMsF3UD5VAisHJaiyx05Rs0huic228snH/c24mILeV6MZQYgfJVydApDQkzh21g4YwmtmHBioZN3865NfdOPIUZdMAKkQm+iUPtDzz6Ky8Md3p+7j66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765643287; c=relaxed/simple;
	bh=q0GItAfrcho7xdiIZRnNwm3xSzhUwvVlKjKqF4dqq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKtWebFQc84DB6FkwtjOT/mpxOcboBZ5Okr2xbDqCtH3u62S9Oh98LcnnEgFcrEDm//2LO+HrZHODJfJCL7fzOlmwwCsxgsTDVqgBaYbpOyGka7G/dVbNwi0Jvj1ZeqIC7390QrQVpT4aQRlujc7LmCCXmKeW8SySH/1bsnLyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcI5uU8K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcI5uU8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765643286; x=1797179286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q0GItAfrcho7xdiIZRnNwm3xSzhUwvVlKjKqF4dqq7Y=;
  b=XcI5uU8K+8Po5D/Nu6eNC77HPb7aU/R7yMeixmFbKmqhqupHgeKJAoNm
   j0hDw1ucL/01Ps6k5HXlFqVCCCwaRHqzuD/cw23ZPKM5kXbSy3hA7wP61
   CYmQ+YQBNAltUGLY1Fw/vdo9XVIiaAsrk0TvTl1c7mKFnRh3uCbo+1M5u
   D/Nwv3CzIDIeniOgytRLmTplBHoHy4hKBMt7feobtr3olPAfw2jNfgR21
   MCB2UjIE6q4GpOIo8kkrONDg8NTkAnHD8OZSqqxoqSFnHH9R0NK2Jp/+p
   IvzfccE2XZaHJe7W+glaJxPezdJNUoe1ANS/st8JSf5jxQNNZj6GFBNLK
   Q==;
X-CSE-ConnectionGUID: fmpUHAsLQnWb80qwhNn2qQ==
X-CSE-MsgGUID: lOxGSVm6QNufZaApzE0VJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66788788"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66788788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:28:04 -0800
X-CSE-ConnectionGUID: j8LQvggTRkS059j37ZUtnQ==
X-CSE-MsgGUID: miCJf+3hQKqZSznvMiJ3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196617823"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 08:28:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSTP-000000007ul-317I;
	Sat, 13 Dec 2025 16:27:59 +0000
Date: Sun, 14 Dec 2025 00:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18]
 drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member
 'slots' description in 'panthor_queue'
Message-ID: <202512140006.JWv6Zcqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: ed0515a9d077a37940e717c75a106f783a011d89 [0/18] drm/panthor: introduce job cycle and timestamp accounting
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251214/202512140006.JWv6Zcqx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140006.JWv6Zcqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140006.JWv6Zcqx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct member 'stopped_groups' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'last_fence' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'in_flight_jobs' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'slots' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'slot_count' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'mask' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct member 'slot' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1741: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1741: warning: Function parameter or struct member 'events' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:2634: warning: Function parameter or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +494 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  397  
de85488138247d Boris Brezillon 2024-02-29  398  	/** @ringbuf: Command stream ring-buffer. */
de85488138247d Boris Brezillon 2024-02-29  399  	struct panthor_kernel_bo *ringbuf;
de85488138247d Boris Brezillon 2024-02-29  400  
de85488138247d Boris Brezillon 2024-02-29  401  	/** @iface: Firmware interface. */
de85488138247d Boris Brezillon 2024-02-29  402  	struct {
de85488138247d Boris Brezillon 2024-02-29  403  		/** @mem: FW memory allocated for this interface. */
de85488138247d Boris Brezillon 2024-02-29  404  		struct panthor_kernel_bo *mem;
de85488138247d Boris Brezillon 2024-02-29  405  
de85488138247d Boris Brezillon 2024-02-29  406  		/** @input: Input interface. */
de85488138247d Boris Brezillon 2024-02-29  407  		struct panthor_fw_ringbuf_input_iface *input;
de85488138247d Boris Brezillon 2024-02-29  408  
de85488138247d Boris Brezillon 2024-02-29  409  		/** @output: Output interface. */
de85488138247d Boris Brezillon 2024-02-29  410  		const struct panthor_fw_ringbuf_output_iface *output;
de85488138247d Boris Brezillon 2024-02-29  411  
de85488138247d Boris Brezillon 2024-02-29  412  		/** @input_fw_va: FW virtual address of the input interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  413  		u32 input_fw_va;
de85488138247d Boris Brezillon 2024-02-29  414  
de85488138247d Boris Brezillon 2024-02-29  415  		/** @output_fw_va: FW virtual address of the output interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  416  		u32 output_fw_va;
de85488138247d Boris Brezillon 2024-02-29  417  	} iface;
de85488138247d Boris Brezillon 2024-02-29  418  
de85488138247d Boris Brezillon 2024-02-29  419  	/**
de85488138247d Boris Brezillon 2024-02-29  420  	 * @syncwait: Stores information about the synchronization object this
de85488138247d Boris Brezillon 2024-02-29  421  	 * queue is waiting on.
de85488138247d Boris Brezillon 2024-02-29  422  	 */
de85488138247d Boris Brezillon 2024-02-29  423  	struct {
de85488138247d Boris Brezillon 2024-02-29  424  		/** @gpu_va: GPU address of the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  425  		u64 gpu_va;
de85488138247d Boris Brezillon 2024-02-29  426  
de85488138247d Boris Brezillon 2024-02-29  427  		/** @ref: Reference value to compare against. */
de85488138247d Boris Brezillon 2024-02-29  428  		u64 ref;
de85488138247d Boris Brezillon 2024-02-29  429  
de85488138247d Boris Brezillon 2024-02-29  430  		/** @gt: True if this is a greater-than test. */
de85488138247d Boris Brezillon 2024-02-29  431  		bool gt;
de85488138247d Boris Brezillon 2024-02-29  432  
de85488138247d Boris Brezillon 2024-02-29  433  		/** @sync64: True if this is a 64-bit sync object. */
de85488138247d Boris Brezillon 2024-02-29  434  		bool sync64;
de85488138247d Boris Brezillon 2024-02-29  435  
de85488138247d Boris Brezillon 2024-02-29  436  		/** @bo: Buffer object holding the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  437  		struct drm_gem_object *obj;
de85488138247d Boris Brezillon 2024-02-29  438  
de85488138247d Boris Brezillon 2024-02-29  439  		/** @offset: Offset of the synchronization object inside @bo. */
de85488138247d Boris Brezillon 2024-02-29  440  		u64 offset;
de85488138247d Boris Brezillon 2024-02-29  441  
de85488138247d Boris Brezillon 2024-02-29  442  		/**
de85488138247d Boris Brezillon 2024-02-29  443  		 * @kmap: Kernel mapping of the buffer object holding the
de85488138247d Boris Brezillon 2024-02-29  444  		 * synchronization object.
de85488138247d Boris Brezillon 2024-02-29  445  		 */
de85488138247d Boris Brezillon 2024-02-29  446  		void *kmap;
de85488138247d Boris Brezillon 2024-02-29  447  	} syncwait;
de85488138247d Boris Brezillon 2024-02-29  448  
de85488138247d Boris Brezillon 2024-02-29  449  	/** @fence_ctx: Fence context fields. */
de85488138247d Boris Brezillon 2024-02-29  450  	struct {
de85488138247d Boris Brezillon 2024-02-29  451  		/** @lock: Used to protect access to all fences allocated by this context. */
de85488138247d Boris Brezillon 2024-02-29  452  		spinlock_t lock;
de85488138247d Boris Brezillon 2024-02-29  453  
de85488138247d Boris Brezillon 2024-02-29  454  		/**
de85488138247d Boris Brezillon 2024-02-29  455  		 * @id: Fence context ID.
de85488138247d Boris Brezillon 2024-02-29  456  		 *
de85488138247d Boris Brezillon 2024-02-29  457  		 * Allocated with dma_fence_context_alloc().
de85488138247d Boris Brezillon 2024-02-29  458  		 */
de85488138247d Boris Brezillon 2024-02-29  459  		u64 id;
de85488138247d Boris Brezillon 2024-02-29  460  
de85488138247d Boris Brezillon 2024-02-29  461  		/** @seqno: Sequence number of the last initialized fence. */
de85488138247d Boris Brezillon 2024-02-29  462  		atomic64_t seqno;
de85488138247d Boris Brezillon 2024-02-29  463  
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  464  		/**
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  465  		 * @last_fence: Fence of the last submitted job.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  466  		 *
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  467  		 * We return this fence when we get an empty command stream.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  468  		 * This way, we are guaranteed that all earlier jobs have completed
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  469  		 * when drm_sched_job::s_fence::finished without having to feed
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  470  		 * the CS ring buffer with a dummy job that only signals the fence.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  471  		 */
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  472  		struct dma_fence *last_fence;
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  473  
de85488138247d Boris Brezillon 2024-02-29  474  		/**
de85488138247d Boris Brezillon 2024-02-29  475  		 * @in_flight_jobs: List containing all in-flight jobs.
de85488138247d Boris Brezillon 2024-02-29  476  		 *
de85488138247d Boris Brezillon 2024-02-29  477  		 * Used to keep track and signal panthor_job::done_fence when the
de85488138247d Boris Brezillon 2024-02-29  478  		 * synchronization object attached to the queue is signaled.
de85488138247d Boris Brezillon 2024-02-29  479  		 */
de85488138247d Boris Brezillon 2024-02-29  480  		struct list_head in_flight_jobs;
de85488138247d Boris Brezillon 2024-02-29  481  	} fence_ctx;
ed0515a9d077a3 Adrián Larumbe  2024-09-24  482  
ed0515a9d077a3 Adrián Larumbe  2024-09-24  483  	/** @profiling: Job profiling data slots and access information. */
ed0515a9d077a3 Adrián Larumbe  2024-09-24  484  	struct {
ed0515a9d077a3 Adrián Larumbe  2024-09-24  485  		/** @slots: Kernel BO holding the slots. */
ed0515a9d077a3 Adrián Larumbe  2024-09-24  486  		struct panthor_kernel_bo *slots;
ed0515a9d077a3 Adrián Larumbe  2024-09-24  487  
ed0515a9d077a3 Adrián Larumbe  2024-09-24  488  		/** @slot_count: Number of jobs ringbuffer can hold at once. */
ed0515a9d077a3 Adrián Larumbe  2024-09-24  489  		u32 slot_count;
ed0515a9d077a3 Adrián Larumbe  2024-09-24  490  
ed0515a9d077a3 Adrián Larumbe  2024-09-24  491  		/** @seqno: Index of the next available profiling information slot. */
ed0515a9d077a3 Adrián Larumbe  2024-09-24  492  		u32 seqno;
ed0515a9d077a3 Adrián Larumbe  2024-09-24  493  	} profiling;
de85488138247d Boris Brezillon 2024-02-29 @494  };
de85488138247d Boris Brezillon 2024-02-29  495  

:::::: The code at line 494 was first introduced by commit
:::::: de85488138247d034eb3241840424a54d660926b drm/panthor: Add the scheduler logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
