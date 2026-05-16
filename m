Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9661643B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948212; cv=none; b=N/D/Qtt6MkAuoOIT36TiLseKTLh8OB5W/zb1HRI92AoY/JD5oZT1ORT2vMT9e+LjiYQt1u+lMmM6JHj/I+lYURECs+NJa4pHg4gR6iMeNRWtqfHqfxhx3XmL/X+majBp/sbfmT8GPgTPT8b02wfmlAYk0/KJh0u+YB4QeP5FGjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948212; c=relaxed/simple;
	bh=3VvwZK6hAy/BhGMNXtxkwNosvVsyVN+K0AbtmDqBhNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lOxLdRUL6yOx7db2vd0o0YI41o7TkXdrE/sgOuKQeYLVoSz/y/ULdcjLRBL/X1EalslE88M0v9gb2g2Epp1/giWnd/9zA6fiubM/gfbPvVTnBTUKqRxZMWr6otO3wTRC3umIQJRNG9iIPVPxfjAGnwAHu7lJnPd+0efIyxOktGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFQFqHd0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFQFqHd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778948210; x=1810484210;
  h=date:from:to:cc:subject:message-id;
  bh=3VvwZK6hAy/BhGMNXtxkwNosvVsyVN+K0AbtmDqBhNM=;
  b=AFQFqHd0DT4/XJL8wSNPdI3M0sALUzvTpEEkRAroPbBG2KK1ylxLwZVd
   29upjD3KNCSslbsOSyvkeBXzC+3MJFBwsiTLOMBHlOYnJOd2Y4o6621mB
   l6qCI8DcEVrqQenK0tkURrL5kuVYaoC8EqemWZ5OWT3oq79lDwHcPVv1M
   8IlGrpwokfyH0Drm0ukCNFxIlMlftnDjSZL2N1TABboLg9KsfiqfhA5tg
   SKwtPFKle1garcKM1naYzJtE+EgtlJZodqMrL2xVE9zk4VfFuwhzpCtZu
   we9LDUQgOdb9KO1XbfjjfcXZO3L0SrZfsoafq5lOmDRht99mA68jLx+0a
   g==;
X-CSE-ConnectionGUID: W9KUwOuKQkyGJp/CZWKhtA==
X-CSE-MsgGUID: /U+moQfuQPSIfdVg3BCbjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90976551"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90976551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 09:16:49 -0700
X-CSE-ConnectionGUID: U+0kj3vJS4SNbwMk4EMHqw==
X-CSE-MsgGUID: uxq1pXBZREKNTArr0uHgMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="277100506"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2026 09:16:48 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOHgy-000000000xS-3izx;
	Sat, 16 May 2026 16:16:44 +0000
Date: Sun, 17 May 2026 00:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:3494:82:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202605170017.AdL9I8UO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: f96012baa5d3b4336092855e4e6d24830ea50736 drm/amd/display: add new block sequence-building/executing functions
date:   7 months ago
config: x86_64-randconfig-r112-20260516 (https://download.01.org/0day-ci/archive/20260517/202605170017.AdL9I8UO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170017.AdL9I8UO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f96012baa5d3 ("drm/amd/display: add new block sequence-building/executing functions")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170017.AdL9I8UO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:3494:82: sparse: sparse: Using plain integer as NULL pointer

vim +3494 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c

  3458	
  3459	void dcn401_post_unlock_reset_opp_sequence(
  3460			struct dc *dc,
  3461			struct pipe_ctx *opp_head,
  3462			struct block_sequence_state *seq_state)
  3463	{
  3464		struct display_stream_compressor *dsc = opp_head->stream_res.dsc;
  3465		struct dccg *dccg = dc->res_pool->dccg;
  3466	
  3467		/* Wait for all DPP pipes in current mpc blending tree completes double
  3468		 * buffered disconnection before resetting OPP
  3469		 */
  3470		if (dc->hwss.wait_for_mpcc_disconnect_sequence)
  3471			dc->hwss.wait_for_mpcc_disconnect_sequence(dc, dc->res_pool, opp_head, seq_state);
  3472	
  3473		if (dsc) {
  3474			bool *is_ungated = NULL;
  3475			/* Check DSC power gate status */
  3476			if (dc->hwseq && dc->hwseq->funcs.dsc_pg_status) {
  3477				hwss_add_dsc_pg_status(seq_state, dc->hwseq, dsc->inst, false);
  3478			}
  3479	
  3480			/* Seamless update specific where we will postpone non
  3481				* double buffered DSCCLK disable logic in post unlock
  3482				* sequence after DSC is disconnected from OPP but not
  3483				* yet power gated.
  3484				*/
  3485	
  3486			/* DSC wait disconnect pending clear */
  3487			hwss_add_dsc_wait_disconnect_pending_clear(seq_state, dsc, is_ungated);
  3488	
  3489			/* DSC disable */
  3490			hwss_add_dsc_disable(seq_state, dsc, is_ungated);
  3491	
  3492			/* Set reference DSCCLK */
  3493			if (dccg && dccg->funcs->set_ref_dscclk) {
> 3494				hwss_add_dccg_set_ref_dscclk(seq_state, dccg, dsc->inst, 0);
  3495			}
  3496		}
  3497	}
  3498	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
