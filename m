Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7844E2C15B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771601244; cv=none; b=Ayc2Bdsiz6ngevr4XmobIgdrjqmNCXUwkF3V1qgEP65HnrkTeEOl5+pI07uJmeedmWYzvc1qktIUDZNTlSV68emvHeEeHmcWskBBoAXMKigsSva5h5zF9gj/BPA8eoD67e3yROmTJdTm87PpYuQJtJF9XUZ+vbhPd6czVO6WzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771601244; c=relaxed/simple;
	bh=/ljxvKjNVqQi5FhV8ljMZ2GIov4d/dVTIZeCRX/qEMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TASFwgxcbEXuZ+V0is9BmaiWxJdYg5Xpa8HGnqIRAcO62pf5NgZLjs6IDQcmGuCFlaTwngmU4bFG0KxVRr6n3WLBBUEVR51WQRA7eqH4xmklfxkrwgDKwCMmb4Qlz3CCj8WhyBpSFgMu33B15jjQlRoKdZUZqFnCFh3vyHeW3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIuPxEaG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIuPxEaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771601243; x=1803137243;
  h=date:from:to:cc:subject:message-id;
  bh=/ljxvKjNVqQi5FhV8ljMZ2GIov4d/dVTIZeCRX/qEMw=;
  b=VIuPxEaGAwCfrSuJF1VjjOTmx7tKyxRvk/M7mhEQr0bcoJuEst9QAR3f
   ehmCG8XF1jEKhpAlLBJerH7+e4hGLvK1bNDZAtuyLQgqXuR2t8XjH5imG
   PRXE1ObZlsy3kNNisT+19j6I7timupBOOAanjK1z1XQVQ/hw7MPY2t4Xj
   BYn+hVdhI6ubl/kwSQl9M3dWMBadGHIPyD7U5Gnm9ZATbEGNKrX64ztCQ
   OHWO1sO9lYUjXVeSht83pmvUiEVLA+NWv3iGOoYTJEdGXvolbzX1BM65A
   vJkVgTLN6WMXN1PCI7HUVRAsJTEwIVLXjOs0/VRy2TbsZBvtP4ProwI1O
   A==;
X-CSE-ConnectionGUID: mmy7wGHlTr6wSjRpBfFNfw==
X-CSE-MsgGUID: 1NgMTJXuSRm1nV9S84XbfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90104665"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90104665"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 07:27:22 -0800
X-CSE-ConnectionGUID: DVBKEK6sRIaGDiCQQJrZyg==
X-CSE-MsgGUID: Np6XIx4GRjq/LbuDlcpvZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="215003813"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2026 07:27:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtSPR-000000014Ce-2jL7;
	Fri, 20 Feb 2026 15:27:13 +0000
Date: Fri, 20 Feb 2026 23:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Li <Roman.Li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>
Subject: [agd5f:amd-staging-drm-next 2435/2443] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn42/dcn42_hwseq.c:1296 bad
 line:
Message-ID: <202602202335.7JDXvUQL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   0eacf005c3d8e75a555e93ab749143550bd5e1fe
commit: 7bdc07ea7348639cafb08a6d1d5cddd06c924581 [2435/2443] drm/amd/display: Enable dcn42 DC
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260220/202602202335.7JDXvUQL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602202335.7JDXvUQL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602202335.7JDXvUQL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn42/dcn42_hwseq.c:1296 bad line: 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
