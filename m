Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C41389462
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096769; cv=none; b=if+7flKgbMOl92AmN336+TQu1AdunFM343j+PLhOXley2Seu9Qs96Q4g24UsvxfOyICLNzYEj9eFKAiJerPv0H0xcKg6LI7golSg3uHG2EUSL30igUDmgpn481uy/6qoUWqZXDGSSSeLO4WERc0m5x9ir+xOECYhIHHpBclQH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096769; c=relaxed/simple;
	bh=xO/3nbjP9bY5DBQzm79iQYJKnG5FZ9c8/kRFYLLWMC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eq9KWL2almLDrytQpU7/PIUljWffs2uvEGbmbGEm6B++MEBqYHx+9/Au0HTw38lOZX8ZPjEVKQdOImnkdpI7M4YCKc8xM6PMRw2hLNZbwJqasVjX3x5iuzsUY4geTvNXf7q4iy2nVS2QEcGYxTAndMJg9eoy79HgkWUup7KaU0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqcGdv61; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqcGdv61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772096767; x=1803632767;
  h=date:from:to:cc:subject:message-id;
  bh=xO/3nbjP9bY5DBQzm79iQYJKnG5FZ9c8/kRFYLLWMC0=;
  b=SqcGdv610N1cy46TIQMyOKP26v0I7DTo6BhK8C6yQ+qaLvn1ut08M7TM
   kRpdVFBItnLFZtyHJdUb6wB0bpeMgqSxSbFXBb/dk5cvim6dh0VQrudFe
   yDg0cV5dUcCFfU0UK3mqagkAIypE8vKVcPssk3bvgSOfhH55x2afuotHL
   Y1jVcASOjqeM6ysoxdaWsXIJRxx961fpCXOLynWWIHEC78GJEIOk9t0yt
   w0Hx0d+zCDrsRZhepo2xXI8H36N0rVrq1ShpkcQaZevwVeA4DR1DETE7Y
   TU12UPbM76VEJK7nXSkicpN/7OYfZSS33rSSA7aFSwozpOXMrHTg9+gma
   g==;
X-CSE-ConnectionGUID: z00pT12AR7O9Js5UiQ7AEw==
X-CSE-MsgGUID: 3EjNBL6pQLWs6zZmJxcEWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83783742"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="83783742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:06:07 -0800
X-CSE-ConnectionGUID: eW5eqXNVR+yhZaOX4GIbRQ==
X-CSE-MsgGUID: j1H+UQRGS06aEEKA7X760A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214509516"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 01:06:05 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvXJP-000000008gf-0Tn4;
	Thu, 26 Feb 2026 09:05:46 +0000
Date: Thu, 26 Feb 2026 17:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 41/41]
 drivers/gpu/drm/mediatek/mtk_crtc.c:1636:19: error: no member named
 'cmdq_client' in 'struct mtk_crtc'
Message-ID: <202602261734.S2XV2x1b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   cfa82fac335412032c982a02638ffd5e49e16323
commit: cfe9fe44771fdec6b88e7dbac8e80abf4c1c9d50 [41/41] CHROMIUM: drm/mediatek: fix the issue: black line appears when suspend/resume
config: arm64-randconfig-004-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261734.S2XV2x1b-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261734.S2XV2x1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261734.S2XV2x1b-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_crtc.c:598:25: warning: variable 'state' set but not used [-Wunused-but-set-variable]
     598 |         struct mtk_crtc_state *state;
         |                                ^
>> drivers/gpu/drm/mediatek/mtk_crtc.c:1636:19: error: no member named 'cmdq_client' in 'struct mtk_crtc'
    1636 |                         if (!mtk_crtc->cmdq_client.chan)
         |                              ~~~~~~~~  ^
   1 warning and 1 error generated.


vim +1636 drivers/gpu/drm/mediatek/mtk_crtc.c

  1625	
  1626	static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
  1627					  struct drm_atomic_state *state)
  1628	{
  1629		struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
  1630		int i;
  1631	
  1632		if (crtc->state->color_mgmt_changed)
  1633			for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
  1634				mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
  1635	
> 1636				if (!mtk_crtc->cmdq_client.chan)
  1637					mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state, NULL);
  1638			}
  1639	
  1640		mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
  1641	}
  1642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
