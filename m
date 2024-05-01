Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B5502A9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714576892; cv=none; b=tCAnfWjid0xkjko7wFWB+iE0dbk8txDTPXMDqu5UToSAA5wkvq0cv+7h+MzFi6OHMcl8bxwJGBLbQc8HmipZqrCIvlIrNHygOHuMbuj7Kk3BbpBeHlksA8nMFrC2KDzG36m/KV5qz6136ns2NksH/nAFNsez/17bYEbQRrI5Tl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714576892; c=relaxed/simple;
	bh=9Sz5/Z1YyM3d+xRuPOKVQ148iXowdxcZBT5enqfQkIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyA4oe9ulmTt2Pdpi9T6BKriXbSnxwxC4YP+Du04GHJ9SPJsHQed8o5SyGbdeJDDcrVlapZNe1rC0DqngOXQDYqA9zACsh9HiXR2BDrxZHK8GkR7QzrsA1csf63ASz86Vn/L70XEKEt6AyhxSCZ+purRWZURALCQ7t8i0o90P+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVv0/OVY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVv0/OVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714576890; x=1746112890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Sz5/Z1YyM3d+xRuPOKVQ148iXowdxcZBT5enqfQkIQ=;
  b=ZVv0/OVYapb1/DXG2g9lsb2aD52CbAy74jUwqo5TpcJU2f2CTQToBw4O
   gWq7L9Xlz4rj87Szt7ycpkcNdPzVOuoofLiaRgvFnzOCjSp3MmITdTSW0
   LMydfrY/za8jB2ccr4rmfNMbq3MWUZ6W6druV4FIE8qcnWDzeHs5eKHHb
   daBK2CfcKoSYd0VJyJshLPkqt6YjgYcitqc20dbOGfAec2Oai02Wdqlu6
   75AgQK6vqCA2h9cMSU+0bzVbaZzuIGM9YnhtHqUB+x9RA9RG/u0dVRcnY
   GyFh1WkJo0WjmBlRZVc7UlFEg7aQRmqn7K0XFXYwT8UYJA8QbGJcts/D6
   A==;
X-CSE-ConnectionGUID: 0txdHWu7QTKBnQ1blSC7Pg==
X-CSE-MsgGUID: yrBU3XgYRuqyn5j0PR6xOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14085788"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="14085788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 08:21:29 -0700
X-CSE-ConnectionGUID: EF1BwJYTTEqaF9xhx/RYWQ==
X-CSE-MsgGUID: pMeJdbH4SvCjQrpL7tHQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="57700492"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 May 2024 08:21:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Blt-0009fK-0S;
	Wed, 01 May 2024 15:21:25 +0000
Date: Wed, 1 May 2024 23:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 9762/10134]
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:235: warning: Function parameter or
 struct member 'job' not described in 'sdma_v7_0_ring_emit_ib'
Message-ID: <202405012302.cOj1BNI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: b412351e91bde3a6ec546b598087bdc3fcc458ee [9762/10134] drm/amdgpu: Add sdma v7_0 ip block support (v7)
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405012302.cOj1BNI5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012302.cOj1BNI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012302.cOj1BNI5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:235: warning: Function parameter or struct member 'job' not described in 'sdma_v7_0_ring_emit_ib'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:235: warning: Function parameter or struct member 'flags' not described in 'sdma_v7_0_ring_emit_ib'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:269: warning: Excess function parameter 'job' description in 'sdma_v7_0_ring_emit_mem_sync'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:269: warning: Excess function parameter 'ib' description in 'sdma_v7_0_ring_emit_mem_sync'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:324: warning: Function parameter or struct member 'addr' not described in 'sdma_v7_0_ring_emit_fence'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:324: warning: Function parameter or struct member 'seq' not described in 'sdma_v7_0_ring_emit_fence'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:324: warning: Function parameter or struct member 'flags' not described in 'sdma_v7_0_ring_emit_fence'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:324: warning: Excess function parameter 'fence' description in 'sdma_v7_0_ring_emit_fence'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:915: warning: Function parameter or struct member 'timeout' not described in 'sdma_v7_0_ring_test_ib'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1043: warning: Function parameter or struct member 'value' not described in 'sdma_v7_0_vm_write_pte'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1043: warning: Excess function parameter 'addr' description in 'sdma_v7_0_vm_write_pte'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1043: warning: Excess function parameter 'flags' description in 'sdma_v7_0_vm_write_pte'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1095: warning: Function parameter or struct member 'ring' not described in 'sdma_v7_0_ring_pad_ib'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1147: warning: Function parameter or struct member 'vmid' not described in 'sdma_v7_0_ring_emit_vm_flush'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1147: warning: Function parameter or struct member 'pd_addr' not described in 'sdma_v7_0_ring_emit_vm_flush'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1147: warning: Excess function parameter 'vm' description in 'sdma_v7_0_ring_emit_vm_flush'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1555: warning: Function parameter or struct member 'ib' not described in 'sdma_v7_0_emit_copy_buffer'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1555: warning: Excess function parameter 'ring' description in 'sdma_v7_0_emit_copy_buffer'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1581: warning: Function parameter or struct member 'ib' not described in 'sdma_v7_0_emit_fill_buffer'
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1581: warning: Excess function parameter 'ring' description in 'sdma_v7_0_emit_fill_buffer'


vim +235 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c

   222	
   223	/**
   224	 * sdma_v7_0_ring_emit_ib - Schedule an IB on the DMA engine
   225	 *
   226	 * @ring: amdgpu ring pointer
   227	 * @ib: IB object to schedule
   228	 *
   229	 * Schedule an IB in the DMA ring.
   230	 */
   231	static void sdma_v7_0_ring_emit_ib(struct amdgpu_ring *ring,
   232					   struct amdgpu_job *job,
   233					   struct amdgpu_ib *ib,
   234					   uint32_t flags)
 > 235	{
   236		unsigned vmid = AMDGPU_JOB_GET_VMID(job);
   237		uint64_t csa_mc_addr = amdgpu_sdma_get_csa_mc_addr(ring, vmid);
   238	
   239		/* An IB packet must end on a 8 DW boundary--the next dword
   240		 * must be on a 8-dword boundary. Our IB packet below is 6
   241		 * dwords long, thus add x number of NOPs, such that, in
   242		 * modular arithmetic,
   243		 * wptr + 6 + x = 8k, k >= 0, which in C is,
   244		 * (wptr + 6 + x) % 8 = 0.
   245		 * The expression below, is a solution of x.
   246		 */
   247		sdma_v7_0_ring_insert_nop(ring, (2 - lower_32_bits(ring->wptr)) & 7);
   248	
   249		amdgpu_ring_write(ring, SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_INDIRECT) |
   250				  SDMA_PKT_INDIRECT_HEADER_VMID(vmid & 0xf));
   251		/* base must be 32 byte aligned */
   252		amdgpu_ring_write(ring, lower_32_bits(ib->gpu_addr) & 0xffffffe0);
   253		amdgpu_ring_write(ring, upper_32_bits(ib->gpu_addr));
   254		amdgpu_ring_write(ring, ib->length_dw);
   255		amdgpu_ring_write(ring, lower_32_bits(csa_mc_addr));
   256		amdgpu_ring_write(ring, upper_32_bits(csa_mc_addr));
   257	}
   258	
   259	/**
   260	 * sdma_v7_0_ring_emit_mem_sync - flush the IB by graphics cache rinse
   261	 *
   262	 * @ring: amdgpu ring pointer
   263	 * @job: job to retrieve vmid from
   264	 * @ib: IB object to schedule
   265	 *
   266	 * flush the IB by graphics cache rinse.
   267	 */
   268	static void sdma_v7_0_ring_emit_mem_sync(struct amdgpu_ring *ring)
 > 269	{
   270		uint32_t gcr_cntl = SDMA_GCR_GL2_INV | SDMA_GCR_GL2_WB | SDMA_GCR_GLM_INV |
   271			SDMA_GCR_GL1_INV | SDMA_GCR_GLV_INV | SDMA_GCR_GLK_INV |
   272			SDMA_GCR_GLI_INV(1);
   273	
   274		/* flush entire cache L0/L1/L2, this can be optimized by performance requirement */
   275		amdgpu_ring_write(ring, SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_GCR_REQ));
   276		amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD1_BASE_VA_31_7(0));
   277		amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD2_GCR_CONTROL_15_0(gcr_cntl) |
   278				  SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(0));
   279		amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD3_LIMIT_VA_31_7(0) |
   280				  SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(gcr_cntl >> 16));
   281		amdgpu_ring_write(ring, SDMA_PKT_GCR_REQ_PAYLOAD4_LIMIT_VA_47_32(0) |
   282				  SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(0));
   283	}
   284	
   285	
   286	/**
   287	 * sdma_v7_0_ring_emit_hdp_flush - emit an hdp flush on the DMA ring
   288	 *
   289	 * @ring: amdgpu ring pointer
   290	 *
   291	 * Emit an hdp flush packet on the requested DMA ring.
   292	 */
   293	static void sdma_v7_0_ring_emit_hdp_flush(struct amdgpu_ring *ring)
   294	{
   295		struct amdgpu_device *adev = ring->adev;
   296		u32 ref_and_mask = 0;
   297		const struct nbio_hdp_flush_reg *nbio_hf_reg = adev->nbio.hdp_flush_reg;
   298	
   299		ref_and_mask = nbio_hf_reg->ref_and_mask_sdma0 << ring->me;
   300	
   301		amdgpu_ring_write(ring, SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_POLL_REGMEM) |
   302				  SDMA_PKT_POLL_REGMEM_HEADER_HDP_FLUSH(1) |
   303				  SDMA_PKT_POLL_REGMEM_HEADER_FUNC(3)); /* == */
   304		amdgpu_ring_write(ring, (adev->nbio.funcs->get_hdp_flush_done_offset(adev)) << 2);
   305		amdgpu_ring_write(ring, (adev->nbio.funcs->get_hdp_flush_req_offset(adev)) << 2);
   306		amdgpu_ring_write(ring, ref_and_mask); /* reference */
   307		amdgpu_ring_write(ring, ref_and_mask); /* mask */
   308		amdgpu_ring_write(ring, SDMA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(0xfff) |
   309				  SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(10)); /* retry count, poll interval */
   310	}
   311	
   312	/**
   313	 * sdma_v7_0_ring_emit_fence - emit a fence on the DMA ring
   314	 *
   315	 * @ring: amdgpu ring pointer
   316	 * @fence: amdgpu fence object
   317	 *
   318	 * Add a DMA fence packet to the ring to write
   319	 * the fence seq number and DMA trap packet to generate
   320	 * an interrupt if needed.
   321	 */
   322	static void sdma_v7_0_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
   323					      unsigned flags)
 > 324	{
   325		bool write64bit = flags & AMDGPU_FENCE_FLAG_64BIT;
   326		/* write the fence */
   327		amdgpu_ring_write(ring, SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_FENCE) |
   328				  SDMA_PKT_FENCE_HEADER_MTYPE(0x3)); /* Ucached(UC) */
   329		/* zero in first two bits */
   330		BUG_ON(addr & 0x3);
   331		amdgpu_ring_write(ring, lower_32_bits(addr));
   332		amdgpu_ring_write(ring, upper_32_bits(addr));
   333		amdgpu_ring_write(ring, lower_32_bits(seq));
   334	
   335		/* optionally write high bits as well */
   336		if (write64bit) {
   337			addr += 4;
   338			amdgpu_ring_write(ring, SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_FENCE) |
   339					  SDMA_PKT_FENCE_HEADER_MTYPE(0x3));
   340			/* zero in first two bits */
   341			BUG_ON(addr & 0x3);
   342			amdgpu_ring_write(ring, lower_32_bits(addr));
   343			amdgpu_ring_write(ring, upper_32_bits(addr));
   344			amdgpu_ring_write(ring, upper_32_bits(seq));
   345		}
   346	
   347		if (flags & AMDGPU_FENCE_FLAG_INT) {
   348			uint32_t ctx = ring->is_mes_queue ?
   349				(ring->hw_queue_id | AMDGPU_FENCE_MES_QUEUE_FLAG) : 0;
   350			/* generate an interrupt */
   351			amdgpu_ring_write(ring, SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_TRAP));
   352			amdgpu_ring_write(ring, SDMA_PKT_TRAP_INT_CONTEXT_INT_CONTEXT(ctx));
   353		}
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
