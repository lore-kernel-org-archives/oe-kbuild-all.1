Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52D2DFA32
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424899; cv=none; b=QLXcxs+aKxi5x2Uc6AD1tV1eLU8XJR/xN6Yip+r8ywSonh4xCVPOPJ1DrU/hTmfrGaoyXLi/ZK+O8GG+k0/d3UL4xEyQJ42QCeZZD/i0Nb9l224/GSrDsyuBEM0Mn7pYRDylxdTKgvotUpvtWLt7lT7r8Ciermj86V/mKvYnur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424899; c=relaxed/simple;
	bh=W6E+S7NiJJsAcDAwU2dLMFiRcLe7Es/dnZOryHJAj7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A10cbnpDWuRuXaFIEx5sDnguKWyoae4fjq8dKwjnUFOYqH247BYgcG5lQjIO6be7jqL0NZMxzTDITRcyrA02ZudIaCh/z46y0SCZBOL5tdkqw9GiCsCE0NCA3wnU+rvenybOwhhHIV4fIXM0WURW+w55zqhOTRmIRZ9/0quCOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9wnwr3T; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9wnwr3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766424898; x=1797960898;
  h=date:from:to:cc:subject:message-id;
  bh=W6E+S7NiJJsAcDAwU2dLMFiRcLe7Es/dnZOryHJAj7Q=;
  b=U9wnwr3TXW/6cCEUA6FZK5lfcaHPRZiwwtlq6awSyTc6ze8HGuvTEXeg
   6PpL5UHkFSYu3MCqlLDaCLymLx3GBtUwopMArkcFXAhYTzGLL2GehRX1i
   9nmXCjCLu81N7BndPYuM4xR/ygxQ4pFPdtEjrmHEO1w44jW8Fb45Uk29E
   5tcS1egMqclW1UqQIv1b5CfqCk2QI5RNClUHvN72MygxsA4LnojKDEanH
   vDwwBRPfi+CFlorBD5RfLrFkVzyP6fbYrm9IcEsu46pMfuDBauUWFYyYd
   aY6KCzslsyCeC0P/c3Kq4mcLGQAlX2PvrKtZ8wCKEnn98H/sUmkXwTYFz
   g==;
X-CSE-ConnectionGUID: vfZ6ym+rRqqvexzxnfbtBg==
X-CSE-MsgGUID: E2GPBC/sRO6AdOMCQATs3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72132559"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="72132559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:34:58 -0800
X-CSE-ConnectionGUID: oqFsc27FQwu89xhlMgsjaw==
X-CSE-MsgGUID: IncpWO5zQAa6juqxBCGwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199490213"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 09:34:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjo4-000000000w5-2Dyl;
	Mon, 22 Dec 2025 17:34:52 +0000
Date: Tue, 23 Dec 2025 01:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:3494:82:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202512230120.bouZOGIU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: f96012baa5d3b4336092855e4e6d24830ea50736 drm/amd/display: add new block sequence-building/executing functions
date:   9 weeks ago
config: i386-randconfig-063-20251221 (https://download.01.org/0day-ci/archive/20251223/202512230120.bouZOGIU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230120.bouZOGIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230120.bouZOGIU-lkp@intel.com/

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
