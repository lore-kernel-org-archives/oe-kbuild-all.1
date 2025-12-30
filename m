Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150625B662
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 22:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135081; cv=none; b=qSt/ZiP+w3hj0gkaqFeOulCuGDRoovgYEyll3PpgMuyjoeXDuFPisGhGMa4a6eQ9gAmf9mtM5SCVj29dvZUQw+rWNxfH14aOPB24VN4mc83JLp16Sv7N+hc76X9/GcHbqvZhN6S5rOh8FlqjRakD1pydr/U2EbwukKA8Qn3DiLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135081; c=relaxed/simple;
	bh=iiIrdOFOFI+g5ldtCCr0SI9PsZxJwAVj2GLXKN3o2yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1e3sgsKLibVs8W7LKM/PdyK/+bbxzknoJdKaPwmO9hFnVdl47dyVpkQPK43mhHPA1k2UA1SEEC1TO1o9GIigqjIp6U3c07AkL1MKC6nirQaLwVIhj4KKn5oLfYXQbG7YFDXqMEbD/5cJ1DQMzr4liG3Y+GMTvUKY0EWRnxLHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BiIfpYXP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiIfpYXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767135079; x=1798671079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iiIrdOFOFI+g5ldtCCr0SI9PsZxJwAVj2GLXKN3o2yc=;
  b=BiIfpYXP9chOSdNo00DlgE3x5l6V7lZ0/2rfnwq0qkrznt6G+unF2If4
   y3oSOGlHd+PSARkGPbCL+T/zRdiHT/QpGJiyI7uM6FNqzU+8ArQctDOUB
   f+15q2kLuSbUmONarGrP86ywH7OHZ9GFGqnfH6Sd6SLVTjLNCkyyTayco
   QL5q8CJve8X9v5qtY8vQ1I8p+qvC0aexurzjggkje1jpUnPUpm8R4tUit
   4z/0r8fSikMLDATvrV7bpTCtGNScT7seKOR+758zuvsd55lSsS16efdDO
   qbI9yAU+4y+knUmLX3F5quloeeQLT7Xx+W9yyo2A28bS5gUhQQF66vaAA
   g==;
X-CSE-ConnectionGUID: TqGvDCfQTuqRBw4UI4GFXw==
X-CSE-MsgGUID: 07Zvyt9jTT2Wn5sjWmJSbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68472783"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="68472783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 14:51:19 -0800
X-CSE-ConnectionGUID: qnO7xPkvQMuvVXxVszJGXw==
X-CSE-MsgGUID: C1zcGa4bS1GI4uvX2ooaAA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 14:51:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaiYd-00000000820-1EEq;
	Tue, 30 Dec 2025 22:51:15 +0000
Date: Tue, 30 Dec 2025 23:50:49 +0100
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org
Subject: [drm-misc:for-linux-next 2/18] htmldocs:
 Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1521:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202512302319.1PGGt3CN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   40630210211a34f0714fe976530ccf1291e5ef78
commit: 9da0e06abda87b1f97014113d5231fdeb4700749 [2/18] drm/bridge: deprecate of_drm_find_bridge()
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512302319.1PGGt3CN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:397: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
   Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms:491: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
   Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
   Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1519: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1521: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/hdmi.h
   ERROR: Cannot find file ./include/linux/hdmi.h
   WARNING: No kernel-doc for file ./include/linux/hdmi.h
   WARNING: ./drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'
   Documentation/gpu/drm-uapi:607: ./drivers/gpu/drm/drm_ioctl.c:923: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
