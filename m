Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18172F99A3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296732; cv=none; b=ApZUbwoOVAdYruTRhlaCm8LnX4RRcy31bHUGirCFsF3Wb2kvHnIJXSnRKG7wUan5cLh6aSTupT17KPEgN0aszaZBxH9UhYjTMj3V+X9KeULhFNg2bSE2LwPBAKDVkxpPH8s9+Hnfsi4CAAzdrfD0tTMtVWwJb8xz+Y/XsHqa0es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296732; c=relaxed/simple;
	bh=OxYu1k+uApTK6suBvTCdHBkLl9nfBhpDaPV+/R0q7iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aMZyTajc95D5bZxhZDFn0Sa6mfZ6mH36V6WUGIDRvqj5YVxm2gPoePl5yCisOKWEo+9kf2XBW3TrEXYCWl3pASoX676zmhr95dpQuEkDEBBGe3tEGKt9pWdZdW+IParR7qzeHELuYngMmSUpmgRmvw08ijDWVZ4dAXJoeCEeoR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1FOoluy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1FOoluy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765296731; x=1796832731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxYu1k+uApTK6suBvTCdHBkLl9nfBhpDaPV+/R0q7iw=;
  b=i1FOoluyxAPDqSDjPn9BeP/c4vcIB+TIeRdoUUg0FAGIkRu2eu5lPQZF
   +VPV+5IuGVv7DsJ+DAuBiFup7rEO1BNOg3Fyo8PPefxPftARDiQyjeeC6
   wr5BspQRbMkz+nf9VSOSwEPASTtSIMIOF9yp/m/u650wl9bQtFIhcEIjw
   x+Ji4O5O98a6AXM3EjAb6upJNJYkkI6XY6C8YtZXcrDllWe7rcTDoae9A
   Njyyk7KInoFhnd2VQVooDZDJeGpq3CjJ/Ff+yLTw/HejKYkuI8oOfBSW0
   JwRs0RbL3AWs3WCEB0Z6zWQUuUZhBD2D1AHbSVCuIi4U1IKiGib3avhS6
   g==;
X-CSE-ConnectionGUID: +h3HWLpqSgGBvYZ/vLa7Pg==
X-CSE-MsgGUID: KDXtrU0eQSeHOYKrlYJ6YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66981217"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="66981217"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 08:12:10 -0800
X-CSE-ConnectionGUID: vH/KSpUMS1uhbgCVZavFZA==
X-CSE-MsgGUID: NMvUw40+QkqmLtmIfT3fNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="233668249"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Dec 2025 08:12:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT0Jq-000000000JN-28UF;
	Tue, 09 Dec 2025 16:12:06 +0000
Date: Tue, 9 Dec 2025 17:11:24 +0100
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
Message-ID: <202512091755.t78NWgRT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: f673055a46784ccea04465b9213e999f7bc5187e drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
date:   1 year, 3 months ago
config: um-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20251209/202512091755.t78NWgRT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091755.t78NWgRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091755.t78NWgRT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
