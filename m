Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333E3EFD10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285137; cv=none; b=ND3y6PoOc2pYHmMEpWfwdEWrfzlqy56YKmVgAu3K/ijfKVJw9plO5w+BHsa48sJ5gyagVEC4oan9xWwfEcHNJVr/sUvPuvnrwe9as80G2LNRpq117don2JqZBOunNPlJ09N9aAO6kjcp+qETB/g9Grrb68eyEdWkJSYAhGgJBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285137; c=relaxed/simple;
	bh=vMA1OmgWoWCjQ08MNEmRJTgVBP2/9iWt5mA3P5lDKX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qsO54X8xmMRCsJ+1SXZMppDF/SDujrjEpv/dQAvdU87MeRdSpZ9mxlhBfeN/PnBvl9XCrzkyEyK66pqVrtXDVYhhAyjspXPd+6V940gPXDHGSvQa0rL8aF5WzIJz+AOIz3Q3sDdd4KsliN1omg56q+nnUuxntqxT7CXtd6xT8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0QDsewC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0QDsewC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784285136; x=1815821136;
  h=date:from:to:cc:subject:message-id;
  bh=vMA1OmgWoWCjQ08MNEmRJTgVBP2/9iWt5mA3P5lDKX4=;
  b=K0QDsewCzvT9uFyhAUKQNEOBDzsBjmVmRHnHJsTdBJiPCMidwqnD2xo1
   vMJdCOsO6qmeZd7kwREGes7uE3ID2t5l9xZ8tXoKAUZ/ES62XI0Rj+ith
   djBB6vqxYZ+a6BbnQyRbik6QYwBc+nTqJnd099CT8ZtKlTojHpCxzAy7c
   FnCc16Z35Er2WJGFSCx5Yhq/N9w804QpBGMyR9C/SYHlIeeis2yOa2/7X
   pWZSZb419zoqUe+6UiJmehtd6Z1c2kGYB32yirV4cOAcexUwRphGwmDnc
   aCh9bKF38YFcQh2PMCXFxIb9o8CLaHw+5MnJ7Lf4zapN27vM1nP8AsKr9
   g==;
X-CSE-ConnectionGUID: gBj1NVL0Qv+GI7Lkzfqfxg==
X-CSE-MsgGUID: go9DVpgjTru2+G5CoeA85w==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96319613"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="96319613"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:45:32 -0700
X-CSE-ConnectionGUID: /FoUgh7jRrSD49kTmypCoA==
X-CSE-MsgGUID: sQ3DauY1TOqn6b2MD359Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="253343556"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jul 2026 03:45:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkg4N-00000000SeG-3BbS;
	Fri, 17 Jul 2026 10:45:27 +0000
Date: Fri, 17 Jul 2026 18:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_lt_phy.c:246:35: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202607171852.GAoki6h6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: e1455196ada3ed892742b6b3459be7e6980a1590 drm/i915/ltphy: Read PHY_VDR_0_CONFIG register
date:   9 months ago
config: x86_64-randconfig-122-20260716 (https://download.01.org/0day-ci/archive/20260717/202607171852.GAoki6h6-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171852.GAoki6h6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e1455196ada3 ("drm/i915/ltphy: Read PHY_VDR_0_CONFIG register")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171852.GAoki6h6-lkp@intel.com/

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
