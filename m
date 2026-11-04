Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828096;
	b=eNlp//zwfXPwqF+iyvUUfq5yncDqN/GJfjKo23a9VTgcSynnThVwRNRjk1a/VOKH4UCc
	 5Nkifd5cYRiMaQE+7VKqAjh3ry/3w1qgRk0UV6IyP41qKPyGcy7Wi6Mmv0ATttTfmWkeE
	 n5E20+i3l5j3NQqSox0cXBYHsOfHGuXOOlme0+qFcLCUwNF2YhxaigVAPJco46Lcjtlbn
	 ovH6BSv6ipnL18wipe72rnxEdXaNUpct5aSOoXC1kQ1gsaeBV/Sn/UrqDoT6alO7L/NA2
	 cjCPO7w3qkOzbzB5D6pnCL5+9/Atv1JzhxOgvvGKJfiF8M6013YVasDsmD3mRyAuYCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828096;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mnwyhcl3LcO3h16UbcNcfaNPuKsomGOnsxeqrsXo5Bs=;
	b=jfRnPcEn3Rl4A6mQNXf+KYq2ONFASl2lZhnLrmJ4PbwGa1f4ncsF1Jn80AIeO2SNKHGO
	 dQPMhik8UUh/lPTgWwrqLohj/FeI2re2vLq3ucGnOj8wVR8Uxvo6/N1+BHBmnAjKaRbix
	 Mxf80jE+Y2obmigdtoEo+QVG3qL/ix5SmM2fTwqvve/dh+HWXk2R48KNM5QPTP4SLFQVT
	 8edcxJ5htlk7vpVjEPgONpJf8lpfO/e5diuy4/QM/+QZJuUXc4ULRbqRvB6GIU1irf96r
	 1PD2ZE1SsIDBlyzZBUAuXNG/2eoQjk0/NULaxII3B1lXeeMXTN+7I2Lscnw3EP1XzBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kuwwAb2I;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C139606D16C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 21:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C139606D16C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kuwwAb2I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793828095; x=1825364095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VGi1cMKOWJjHeSk80FF41hRufP53WNIxVj9SuZTL92s=;
  b=kuwwAb2Id2WlHPn9T/NQVvLEWsktPg5Li/kcuJ9V6bFzx4chv2bN8Wpw
   qxJbIPGDL+8GlsmvVIgf9CPxsp/0yIVTNl07e56ygf9Hu8jfOIbqzytDe
   6bJkAevMu23jIJgl+7TWzgeZZeDsvrPwNhIFrB++YvODPB4BgCMonXM7Y
   Gn10D1Gbiu2Y5CCewfiNk8v7Ln7Ev2oLO0Ak1GsbCf3QLwaC84rxp8b+Y
   6zgF9i8tVpr1b5y902kJyOAKdWxfVifKZwnKHa9tp59N+oD1joH7SsxQy
   H3eM2qdgl/SFgTp+E6dbeGqx8hdjNiddSqNQS3zoFgmK7DHyHbpLc15ao
   Q==;
X-CSE-ConnectionGUID: 8x6rCmjYQQeoc1tVJF3L1w==
X-CSE-MsgGUID: CHJve0VlTvKRqnISgVe3aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2498611"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2498611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:34:53 -0800
X-CSE-ConnectionGUID: Xq38MBSZTHyIvrklYIxRQQ==
X-CSE-MsgGUID: fLogzIRnRtqWB8SM5i8frg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7140866"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2026 13:34:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOid7-00000000l4d-0LBU;
	Wed, 04 Nov 2026 21:34:49 +0000
Date: Thu, 5 Nov 2026 05:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 10/14] drm/msm: Add LPAC submitqueue
Message-ID: <202611050552.1Ciiyf9b-lkp@intel.com>
References: <20261029-descriptive-name-lpac-upstream-v2-10-a21a5c850961@gmail.com>
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
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-10-a21a5c850961@gmail.com>

Hi Anna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9a967125427e03c7ebc24d7ad26e9307e8403d4e]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Maniscalco/iommu-arm-smmu-qcom-Configure-lpac-device-with-split-address-space/20261029-145238
base:   9a967125427e03c7ebc24d7ad26e9307e8403d4e
patch link:    https://lore.kernel.org/r/20261029-descriptive-name-lpac-upstream-v2-10-a21a5c850961%40gmail.com
patch subject: [PATCH RFC v2 10/14] drm/msm: Add LPAC submitqueue
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611050552.1Ciiyf9b-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050552.1Ciiyf9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050552.1Ciiyf9b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a6xx_gpu.c: In function 'a7xx_submit':
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:504:13: warning: unused variable 'timestamp_iova' [-Wunused-variable]
     504 |         u64 timestamp_iova;
         |             ^~~~~~~~~~~~~~


vim +/timestamp_iova +504 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

   494	
   495	static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
   496	{
   497		unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
   498		struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
   499		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
   500		struct msm_ringbuffer *ring = submit->ring;
   501		u32 rbbm_perfctr_cp0, cp_always_on_context,
   502		    cp_always_on_counter;
   503		bool is_lpac = ring == gpu->lpac_rb;
 > 504		u64 timestamp_iova;
   505		unsigned int i, ibs = 0;
   506	
   507		adreno_check_and_reenable_stall(adreno_gpu);
   508	
   509		/*
   510		 * Toggle concurrent binning for pagetable switch and set the thread to
   511		 * BR since only it can execute the pagetable switch packets.
   512		 */
   513		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
   514		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
   515	
   516		a6xx_set_pagetable(a6xx_gpu, ring, submit);
   517	
   518		/*
   519		 * If preemption is enabled, then set the pseudo register for the save
   520		 * sequence
   521		 */
   522		if (gpu->nr_rings > 1 && !is_lpac)
   523			a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
   524	
   525		if (adreno_is_a8xx(adreno_gpu)) {
   526			rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
   527			cp_always_on_context = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
   528			cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
   529		} else {
   530			rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
   531			cp_always_on_context = REG_A6XX_CP_ALWAYS_ON_CONTEXT;
   532			cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
   533		}
   534	
   535		get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
   536		if (is_lpac)
   537			get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_start));
   538		else
   539			get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
   540	
   541		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
   542		OUT_RING(ring, CP_SET_THREAD_BOTH);
   543	
   544		OUT_PKT7(ring, CP_SET_MARKER, 1);
   545		OUT_RING(ring, 0x101); /* IFPC disable */
   546	
   547		if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
   548			OUT_PKT7(ring, CP_SET_MARKER, 1);
   549			OUT_RING(ring, 0x00d); /* IB1LIST start */
   550		}
   551	
   552		/* Submit the commands */
   553		for (i = 0; i < submit->nr_cmds; i++) {
   554			switch (submit->cmd[i].type) {
   555			case MSM_SUBMIT_CMD_IB_TARGET_BUF:
   556				break;
   557			case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
   558				if (ring->cur_ctx_seqno == submit->queue->ctx->seqno)
   559					break;
   560				fallthrough;
   561			case MSM_SUBMIT_CMD_BUF:
   562				OUT_PKT7(ring, CP_INDIRECT_BUFFER, 3);
   563				OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
   564				OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
   565				OUT_RING(ring, A5XX_CP_INDIRECT_BUFFER_2_IB_SIZE(submit->cmd[i].size));
   566				ibs++;
   567				break;
   568			}
   569	
   570			/*
   571			 * Periodically update shadow-wptr if needed, so that we
   572			 * can see partial progress of submits with large # of
   573			 * cmds.. otherwise we could needlessly stall waiting for
   574			 * ringbuffer state, simply due to looking at a shadow
   575			 * rptr value that has not been updated
   576			 */
   577			if ((ibs % 32) == 0)
   578				update_shadow_rptr(gpu, ring);
   579		}
   580	
   581		if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
   582			OUT_PKT7(ring, CP_SET_MARKER, 1);
   583			OUT_RING(ring, 0x00e); /* IB1LIST end */
   584		}
   585	
   586		get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_end));
   587		get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_end));
   588	
   589		/* Write the fence to the scratch register */
   590		if (adreno_is_a8xx(adreno_gpu)) {
   591			OUT_PKT4(ring, REG_A8XX_CP_SCRATCH_GLOBAL(2), 1);
   592			OUT_RING(ring, submit->seqno);
   593		} else {
   594			OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
   595			OUT_RING(ring, submit->seqno);
   596		}
   597	
   598		if (!is_lpac) {
   599			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
   600			OUT_RING(ring, CP_SET_THREAD_BR);
   601	
   602			OUT_PKT7(ring, CP_EVENT_WRITE, 1);
   603			OUT_RING(ring, CCU_INVALIDATE_DEPTH);
   604	
   605			OUT_PKT7(ring, CP_EVENT_WRITE, 1);
   606			OUT_RING(ring, CCU_INVALIDATE_COLOR);
   607	
   608			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
   609			OUT_RING(ring, CP_SET_THREAD_BV);
   610		}
   611	
   612		/*
   613		 * Make sure the timestamp is committed once BV pipe is
   614		 * completely done with this submission.
   615		 */
   616		OUT_PKT7(ring, CP_EVENT_WRITE, 4);
   617		OUT_RING(ring, CACHE_CLEAN | BIT(27));
   618		OUT_RING(ring, lower_32_bits(rbmemptr(ring, bv_fence)));
   619		OUT_RING(ring, upper_32_bits(rbmemptr(ring, bv_fence)));
   620		OUT_RING(ring, submit->seqno);
   621	
   622		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
   623		OUT_RING(ring, CP_SET_THREAD_BR);
   624	
   625		/*
   626		 * This makes sure that BR doesn't race ahead and commit
   627		 * timestamp to memstore while BV is still processing
   628		 * this submission.
   629		 */
   630		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
   631		OUT_RING(ring, 0);
   632		OUT_RING(ring, lower_32_bits(rbmemptr(ring, bv_fence)));
   633		OUT_RING(ring, upper_32_bits(rbmemptr(ring, bv_fence)));
   634		OUT_RING(ring, submit->seqno);
   635	
   636		a6xx_gpu->last_seqno[ring->id] = submit->seqno;
   637	
   638		/* write the ringbuffer timestamp */
   639		OUT_PKT7(ring, CP_EVENT_WRITE, 4);
   640		OUT_RING(ring, CACHE_CLEAN | CP_EVENT_WRITE_0_IRQ | BIT(27));
   641		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
   642		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
   643		OUT_RING(ring, submit->seqno);
   644	
   645		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
   646		OUT_RING(ring, CP_SET_THREAD_BOTH);
   647	
   648		OUT_PKT7(ring, CP_SET_MARKER, 1);
   649		OUT_RING(ring, 0x100); /* IFPC enable */
   650	
   651		trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
   652	
   653		a6xx_flush_yield(gpu, ring);
   654	
   655		/* Check to see if we need to start preemption */
   656		if (!is_lpac) {
   657			if (adreno_is_a8xx(adreno_gpu))
   658				a8xx_preempt_trigger(gpu);
   659			else
   660				a6xx_preempt_trigger(gpu);
   661		}
   662	}
   663	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
