Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E05661
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766551924; cv=none; b=BY0M4fvusTGI8rRs5Od0Sv2rYwr8id3+oCDTKxaqnlIxsMYbQZoUgvCKQG6u12ieFabWEP3MJ9a3tlYpfbk3unIRSy6hojeez8iUPHlJoluFwFJGA/dg15au7GiiF0JB1kiFOrzT/fHPL5o4C1+nd5tbcpbyJXY4E1xGxKjwwOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766551924; c=relaxed/simple;
	bh=03M6J2xYdQsQrpuWsEkMdbdvBKmb/rknvhwI9qv+nzc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XkmdTgR68FBfyPK1WzawRn+mlMnrLvaE47cbRXbWh9cIM0wBBdy1BC6imoQ5bs93M/XEZ6+5wtNwyeFCaieM0vB6W6R8FcCg/T0gzuWpDj7fVfApbSGX3FxBFBAKwnNn5AvSrVxsI1+BiD+VRWV1MjFfJnryjQY35cKf7r8PLt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1GPTh2t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1GPTh2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766551923; x=1798087923;
  h=date:from:to:cc:subject:message-id;
  bh=03M6J2xYdQsQrpuWsEkMdbdvBKmb/rknvhwI9qv+nzc=;
  b=K1GPTh2t+85YJ3MZ2+HUPi+I4WRJnejUKc7aEPd03AjHoqFJx6+4MYt5
   rnzVY1yaLOsCODNy7r5+6693ykUBNF2QoD87Nr+XwMZzi6rWkUPD2mu2b
   CIjrpZJDO5nk+nmD8tPmCBu1VxcvQ5YmrNFR85TUiFd+BCEYezrEUivHc
   3rgNgQ9csiauV//5cueDmxgDqymz1FAA54YGGYkgb+VuJGKcg+I7963EX
   05g+0gW7Ub4DNVcc8zwb6Ii0YSJ55xiyTuZe5etw4iDO1VOfjbUsyrDI9
   GiKleguPqSG+3QQYkxAF6HTLmTx/rGLgmO0HmL6Titpx+nJ0mRnGz+az/
   g==;
X-CSE-ConnectionGUID: RCgaKaXPSZmCScoVVtfK4w==
X-CSE-MsgGUID: qEJ5AciwRD2zDF60DbpNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68436651"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68436651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:52:02 -0800
X-CSE-ConnectionGUID: MzfcDTNCQTuIgRjI6Asbzw==
X-CSE-MsgGUID: iQ5tRVbhR82c18FGlq+9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199692590"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2025 20:52:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYGqn-000000002gj-2Mjn;
	Wed, 24 Dec 2025 04:51:53 +0000
Date: Wed, 24 Dec 2025 12:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:3494:82:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202512241240.tF5GyPW8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: f96012baa5d3b4336092855e4e6d24830ea50736 drm/amd/display: add new block sequence-building/executing functions
date:   9 weeks ago
config: i386-randconfig-063-20251221 (https://download.01.org/0day-ci/archive/20251224/202512241240.tF5GyPW8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241240.tF5GyPW8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241240.tF5GyPW8-lkp@intel.com/

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
