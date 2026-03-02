Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2133121F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447852; cv=none; b=ut2ZrLt8QP3n33yvf0zfPahsnJ+8q/nSZDdqeCr5jmrg5y9ZmrL2DM5s1oO0lxcD+KvztLCSLgg3ThWUYUz/8j2TPuXTQSdVMfcbsQuCHxEqYAZFTvoi2BZ71/RupDX85JuI30HZgseyLUIa02rKQ5YLAeOeGENMbNSOxwe4BJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447852; c=relaxed/simple;
	bh=gxjGmr7oFeimvAXDU7GEs++BhqwvGUJhisIFnlmh278=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BV31ItewUzCwlKIpEgOgoCbnOrYWs0M9/lEkh70d7uDGsV59myUwWw8OXOh8ufMvIsX0pdi1YQdFPp0NDeLEzeE5oP0+o2efvKt2TcJJJVxpM1fXFR8R+lHBaN/y0UF7+6oB5fK0aOU74Pji94bY5kvXWrftjbLVNBeCBrQoZT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSIar3fy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSIar3fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772447850; x=1803983850;
  h=date:from:to:cc:subject:message-id;
  bh=gxjGmr7oFeimvAXDU7GEs++BhqwvGUJhisIFnlmh278=;
  b=XSIar3fyfERvIO/ETa47WoHz6YRKKMNMxTb4AgZZ1K9zup2i/+mBEBal
   bpYRLjeBKZPdl+lbIGzRQweEd4aFvaDzgfYPhYKVfs4awF8dd8A4RwKQP
   tp2y/ncoiA4jZxlJfLBvE70CF+IunAGMm7mmg1ys9WxF7yJ1OPtG7doGe
   af5AERdrOXdZUBfWkFyav8/DAtTMnIHLTwgxxelDDxR4yv7+AOMWni9/y
   +0X8+HpLlL3GXEqVH7hItC1Cn7/IYJ0E8f99xhWPNu61q3o5FEyGwfreN
   sHGuLMa/KGcTvnDftwpYw15Xuz8QGE9izVEAdtpB2EOH8PfkdVrFopmgq
   g==;
X-CSE-ConnectionGUID: SiPrq1HLRUepq2DNVdfTXw==
X-CSE-MsgGUID: GFg0RxkxRa6p4fabMZyKNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73637090"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73637090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:37:28 -0800
X-CSE-ConnectionGUID: /g/g9oDhSDGug8b2CSs3Ww==
X-CSE-MsgGUID: hzytZtVlQQGoL+tVYCcE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="221768169"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Mar 2026 02:37:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx0eR-000000000k9-3oqU;
	Mon, 02 Mar 2026 10:37:23 +0000
Date: Mon, 02 Mar 2026 18:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_lt_phy.c:246:35: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202603021838.U7fteS8P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: e1455196ada3ed892742b6b3459be7e6980a1590 drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
date:   4 months ago
config: x86_64-randconfig-122-20260302 (https://download.01.org/0day-ci/archive/20260302/202603021838.U7fteS8P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021838.U7fteS8P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021838.U7fteS8P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_lt_phy.c:246:35: sparse: sparse: Using plain integer as NULL pointer

vim +246 drivers/gpu/drm/i915/display/intel_lt_phy.c

   238	
   239	void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
   240				     const struct intel_crtc_state *crtc_state)
   241	{
   242		struct intel_display *display = to_intel_display(encoder);
   243		struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
   244		bool lane_reversal = dig_port->lane_reversal;
   245		u8 owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
 > 246		intel_wakeref_t wakeref = 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
