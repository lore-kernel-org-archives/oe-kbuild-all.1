Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD2194A73
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 01:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097660; cv=none; b=rE2cPPr+qJD6xbGE4XWQKph4/uBemDz20EyzYVyPhKP0W5dm+rFDKbBJByJt67eXZktrGJjo0Yi4Ec+Z5jNZZjsSiGGj9h1prvALqf798DTP6l07I4GnMr7jvelUpSR0M6c5aOLgJouPzN1unFIG8MgGAh12JETV9OGEdKgRURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097660; c=relaxed/simple;
	bh=raUxk6pdQ7Dtq0HgkXHZBuiANJL2LyIqDvUsLfCQA4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkUG6tHR6uelW6Hau1/RnEZCRezc4fuOP6enG5X0Eq72Ak+teT/kizNFfIeGXcp1fxA8tqb1tKLAuBfFUOJv5qYoFxFMURLvBKkhk/W+0nAC6y7uKyzBM2Id83nlILPP9xzUY7tYoTxOM25pmH3ai7qF5+bHPwBWt2GWo0cjfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSegYP/z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSegYP/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761097660; x=1792633660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=raUxk6pdQ7Dtq0HgkXHZBuiANJL2LyIqDvUsLfCQA4U=;
  b=nSegYP/zbWBxBV6r+mWz16hdKyIoFyLgZ/g0bHv1/KdWuOgnKI4SlbzT
   4VH0M8jWjLKuzLolw0vMOS0alGuYifb8q2Gdrcr1cBMtVqSAXHBTEx7oK
   sJQ4ljkdyoyX/3kWwkAsuApvs26vnSIN2Bv6yKcn8mkZSxJ319jdiaZu6
   YsprEbq4eiEpiTiUoPeaPPvshLRYjDOldZWQp3msZxiZpwBGIUTtCDfGq
   SYcAkzRfKiHHb3CenuObUXz8c/zfuW3ZeInKsuCvK75S/alW6wXRnMaH+
   7/pae/zhOUVx+oQ/kPbsFcpOEKR6smvnHa/AcEM811MNtQvnUXdedKTQh
   Q==;
X-CSE-ConnectionGUID: OQRLyUSSQY+0pslWn39XGQ==
X-CSE-MsgGUID: Oc7EnJZeTECDw2wDe6bZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63131837"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63131837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 18:47:39 -0700
X-CSE-ConnectionGUID: I7ieUI85RPirHhBpUFqP2g==
X-CSE-MsgGUID: Smv+FN1bSBa8aZCwoMONMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184221231"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2025 18:47:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBNwt-000Bue-1F;
	Wed, 22 Oct 2025 01:47:35 +0000
Date: Wed, 22 Oct 2025 09:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: [linux-next:master 2906/3056]
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.c:3494:82:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202510220954.lcvy1Yp7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
commit: f96012baa5d3b4336092855e4e6d24830ea50736 [2906/3056] drm/amd/display: add new block sequence-building/executing functions
config: loongarch-randconfig-r123-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220954.lcvy1Yp7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220954.lcvy1Yp7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220954.lcvy1Yp7-lkp@intel.com/

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
