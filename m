Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04BF1F0991
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771307903; cv=none; b=Om/EzpvGY2sg6XCnELSjydTYzv+h5xSXuqqjqmg89IzK6dxBsXcKnHr1AtvsYfUeIAApc7dp8nXgRVoSI4JIk93uzp/jB0axEnBItF5dmyV2iotTVAmBy6/aUmXO9Py9/Pa7XZUl/w/vub6zzdJqwyDK1mnh3EMhO6gyPwshcvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771307903; c=relaxed/simple;
	bh=x+5MhVObRTEKbtMeefbK9CUOppvpm1La/nPfFa+LwT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W/5o3DU7glZd6TdAowsDjwuYkCZfv5FOXnxpxO8S/6vVPZBgFgBusBSzTfT6oghu59U3vD6Lmt7fT/NKJ/zrNBOIYaFE/uIlBvtJxS4nMwU54TD5UGZy7rrLSLmZFnKjN6N2R9COfu7X4p3xH/b6c4hrW6C+qVEl1oxqDbO+DZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1J5luzB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1J5luzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771307901; x=1802843901;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x+5MhVObRTEKbtMeefbK9CUOppvpm1La/nPfFa+LwT0=;
  b=I1J5luzBns1Anidcp4s69GIJHvFRPOA3NvFUUvWb2t5MLCobiBNRaICg
   xdufzTw9m92Lj9PpPclvfHsqyQBi2vaMSrfw0UdeUvEGHEV3HHr1j7wpI
   RTI6r9X5q5cSss10+PezYwrHA8OtKweXbImEL2qJJAmDM/JeALzzBjrWj
   G7fDwxQIJfsgoU/3AkjCzGo/4s/JVOk4JXIuHlEo9JJeBEVsO/pNKRLqp
   mYXDY0blG7GAwJukN2s71EQPgkACJByfEGOZTI4MxrjOHew2d/AP4ilYx
   mK9pEEc5Xfwp6YAw7yPfxAqNm5lzpsCxIdp6W0MbtFbaSJyV9haeJkXsH
   w==;
X-CSE-ConnectionGUID: HJAMnhA5SOCkIsGcup5rcg==
X-CSE-MsgGUID: XCbrG+ugQYOw4qqrL7UAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83737100"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83737100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:58:20 -0800
X-CSE-ConnectionGUID: 7J2iWVaRSkCSyMTbKclHlQ==
X-CSE-MsgGUID: 51ANRz4STlO9LWjE+bU1Rg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Feb 2026 21:58:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsE6B-000000010fI-47Fx;
	Tue, 17 Feb 2026 05:58:15 +0000
Date: Tue, 17 Feb 2026 13:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/51]
 drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct member
 'slot_count' description in 'panthor_queue'
Message-ID: <202602171314.dS8vRx25-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Adri=C3=A1n,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-deskt=
op
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: ed0515a9d077a37940e717c75a106f783a011d89 [0/51] drm/panthor: introd=
uce job cycle and timestamp accounting
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260217=
/202602171314.dS8vRx25-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260217/202602171314.dS8vRx25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171314.dS8vRx25-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct memb=
er 'runnable' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct memb=
er 'idle' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct memb=
er 'waiting' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct memb=
er 'has_ref' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct memb=
er 'in_progress' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:322: warning: Excess struct memb=
er 'stopped_groups' description in 'panthor_scheduler'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'mem' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'input' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'output' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'input_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'output_fw_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'gpu_va' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'ref' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'gt' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'sync64' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'bo' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'offset' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'kmap' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'lock' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'id' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'last_fence' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'in_flight_jobs' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'slots' description in 'panthor_queue'
>> drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'slot_count' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:494: warning: Excess struct memb=
er 'seqno' description in 'panthor_queue'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'size' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'latest_flush' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'start' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'end' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'mask' description in 'panthor_job'
>> drivers/gpu/drm/panthor/panthor_sched.c:814: warning: Excess struct memb=
er 'slot' description in 'panthor_job'
   drivers/gpu/drm/panthor/panthor_sched.c:1741: warning: Function paramete=
r or struct member 'ptdev' not described in 'panthor_sched_report_fw_events'
   drivers/gpu/drm/panthor/panthor_sched.c:1741: warning: Function paramete=
r or struct member 'events' not described in 'panthor_sched_report_fw_event=
s'
   drivers/gpu/drm/panthor/panthor_sched.c:2634: warning: Function paramete=
r or struct member 'ptdev' not described in 'panthor_sched_report_mmu_fault'


vim +494 drivers/gpu/drm/panthor/panthor_sched.c

de85488138247d Boris Brezillon 2024-02-29  397 =20
de85488138247d Boris Brezillon 2024-02-29  398  	/** @ringbuf: Command stre=
am ring-buffer. */
de85488138247d Boris Brezillon 2024-02-29  399  	struct panthor_kernel_bo *=
ringbuf;
de85488138247d Boris Brezillon 2024-02-29  400 =20
de85488138247d Boris Brezillon 2024-02-29  401  	/** @iface: Firmware inter=
face. */
de85488138247d Boris Brezillon 2024-02-29  402  	struct {
de85488138247d Boris Brezillon 2024-02-29  403  		/** @mem: FW memory alloc=
ated for this interface. */
de85488138247d Boris Brezillon 2024-02-29  404  		struct panthor_kernel_bo =
*mem;
de85488138247d Boris Brezillon 2024-02-29  405 =20
de85488138247d Boris Brezillon 2024-02-29  406  		/** @input: Input interfa=
ce. */
de85488138247d Boris Brezillon 2024-02-29  407  		struct panthor_fw_ringbuf=
_input_iface *input;
de85488138247d Boris Brezillon 2024-02-29  408 =20
de85488138247d Boris Brezillon 2024-02-29  409  		/** @output: Output inter=
face. */
de85488138247d Boris Brezillon 2024-02-29  410  		const struct panthor_fw_r=
ingbuf_output_iface *output;
de85488138247d Boris Brezillon 2024-02-29  411 =20
de85488138247d Boris Brezillon 2024-02-29  412  		/** @input_fw_va: FW virt=
ual address of the input interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  413  		u32 input_fw_va;
de85488138247d Boris Brezillon 2024-02-29  414 =20
de85488138247d Boris Brezillon 2024-02-29  415  		/** @output_fw_va: FW vir=
tual address of the output interface buffer. */
de85488138247d Boris Brezillon 2024-02-29  416  		u32 output_fw_va;
de85488138247d Boris Brezillon 2024-02-29  417  	} iface;
de85488138247d Boris Brezillon 2024-02-29  418 =20
de85488138247d Boris Brezillon 2024-02-29  419  	/**
de85488138247d Boris Brezillon 2024-02-29  420  	 * @syncwait: Stores infor=
mation about the synchronization object this
de85488138247d Boris Brezillon 2024-02-29  421  	 * queue is waiting on.
de85488138247d Boris Brezillon 2024-02-29  422  	 */
de85488138247d Boris Brezillon 2024-02-29  423  	struct {
de85488138247d Boris Brezillon 2024-02-29  424  		/** @gpu_va: GPU address =
of the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  425  		u64 gpu_va;
de85488138247d Boris Brezillon 2024-02-29  426 =20
de85488138247d Boris Brezillon 2024-02-29  427  		/** @ref: Reference value=
 to compare against. */
de85488138247d Boris Brezillon 2024-02-29  428  		u64 ref;
de85488138247d Boris Brezillon 2024-02-29  429 =20
de85488138247d Boris Brezillon 2024-02-29  430  		/** @gt: True if this is =
a greater-than test. */
de85488138247d Boris Brezillon 2024-02-29  431  		bool gt;
de85488138247d Boris Brezillon 2024-02-29  432 =20
de85488138247d Boris Brezillon 2024-02-29  433  		/** @sync64: True if this=
 is a 64-bit sync object. */
de85488138247d Boris Brezillon 2024-02-29  434  		bool sync64;
de85488138247d Boris Brezillon 2024-02-29  435 =20
de85488138247d Boris Brezillon 2024-02-29  436  		/** @bo: Buffer object ho=
lding the synchronization object. */
de85488138247d Boris Brezillon 2024-02-29  437  		struct drm_gem_object *ob=
j;
de85488138247d Boris Brezillon 2024-02-29  438 =20
de85488138247d Boris Brezillon 2024-02-29  439  		/** @offset: Offset of th=
e synchronization object inside @bo. */
de85488138247d Boris Brezillon 2024-02-29  440  		u64 offset;
de85488138247d Boris Brezillon 2024-02-29  441 =20
de85488138247d Boris Brezillon 2024-02-29  442  		/**
de85488138247d Boris Brezillon 2024-02-29  443  		 * @kmap: Kernel mapping =
of the buffer object holding the
de85488138247d Boris Brezillon 2024-02-29  444  		 * synchronization object.
de85488138247d Boris Brezillon 2024-02-29  445  		 */
de85488138247d Boris Brezillon 2024-02-29  446  		void *kmap;
de85488138247d Boris Brezillon 2024-02-29  447  	} syncwait;
de85488138247d Boris Brezillon 2024-02-29  448 =20
de85488138247d Boris Brezillon 2024-02-29  449  	/** @fence_ctx: Fence cont=
ext fields. */
de85488138247d Boris Brezillon 2024-02-29  450  	struct {
de85488138247d Boris Brezillon 2024-02-29  451  		/** @lock: Used to protec=
t access to all fences allocated by this context. */
de85488138247d Boris Brezillon 2024-02-29  452  		spinlock_t lock;
de85488138247d Boris Brezillon 2024-02-29  453 =20
de85488138247d Boris Brezillon 2024-02-29  454  		/**
de85488138247d Boris Brezillon 2024-02-29  455  		 * @id: Fence context ID.
de85488138247d Boris Brezillon 2024-02-29  456  		 *
de85488138247d Boris Brezillon 2024-02-29  457  		 * Allocated with dma_fen=
ce_context_alloc().
de85488138247d Boris Brezillon 2024-02-29  458  		 */
de85488138247d Boris Brezillon 2024-02-29  459  		u64 id;
de85488138247d Boris Brezillon 2024-02-29  460 =20
de85488138247d Boris Brezillon 2024-02-29  461  		/** @seqno: Sequence numb=
er of the last initialized fence. */
de85488138247d Boris Brezillon 2024-02-29  462  		atomic64_t seqno;
de85488138247d Boris Brezillon 2024-02-29  463 =20
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  464  		/**
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  465  		 * @last_fence: Fence of =
the last submitted job.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  466  		 *
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  467  		 * We return this fence w=
hen we get an empty command stream.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  468  		 * This way, we are guara=
nteed that all earlier jobs have completed
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  469  		 * when drm_sched_job::s_=
fence::finished without having to feed
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  470  		 * the CS ring buffer wit=
h a dummy job that only signals the fence.
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  471  		 */
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  472  		struct dma_fence *last_fe=
nce;
7b6f9ec6ad5112 Boris Brezillon 2024-07-03  473 =20
de85488138247d Boris Brezillon 2024-02-29  474  		/**
de85488138247d Boris Brezillon 2024-02-29  475  		 * @in_flight_jobs: List =
containing all in-flight jobs.
de85488138247d Boris Brezillon 2024-02-29  476  		 *
de85488138247d Boris Brezillon 2024-02-29  477  		 * Used to keep track and=
 signal panthor_job::done_fence when the
de85488138247d Boris Brezillon 2024-02-29  478  		 * synchronization object=
 attached to the queue is signaled.
de85488138247d Boris Brezillon 2024-02-29  479  		 */
de85488138247d Boris Brezillon 2024-02-29  480  		struct list_head in_fligh=
t_jobs;
de85488138247d Boris Brezillon 2024-02-29  481  	} fence_ctx;
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  482 =20
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  483  	/** @profiling: Job p=
rofiling data slots and access information. */
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  484  	struct {
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  485  		/** @slots: Kernel B=
O holding the slots. */
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  486  		struct panthor_kerne=
l_bo *slots;
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  487 =20
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  488  		/** @slot_count: Num=
ber of jobs ringbuffer can hold at once. */
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  489  		u32 slot_count;
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  490 =20
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  491  		/** @seqno: Index of=
 the next available profiling information slot. */
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  492  		u32 seqno;
ed0515a9d077a3 Adri=C3=A1n Larumbe  2024-09-24  493  	} profiling;
de85488138247d Boris Brezillon 2024-02-29 @494  };
de85488138247d Boris Brezillon 2024-02-29  495 =20

:::::: The code at line 494 was first introduced by commit
:::::: de85488138247d034eb3241840424a54d660926b drm/panthor: Add the schedu=
ler logical block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
