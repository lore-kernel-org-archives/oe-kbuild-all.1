Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64E3D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718433108; cv=none; b=MdWLmzdNJQNy17Grt5XgkUch+fGDynY12bm15+snbSFBspcn7mjRSwL/cp/HBxen+EzrUwpXhtSh+a2icChYGUONmUJK67YxyHiZcZvTFJkdswLeSRazv00FBRwvRFEhWSSW3cW2nN2FA25kzViauu0TdKAzSN2ZI24HatVZjbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718433108; c=relaxed/simple;
	bh=BXzABCCc+UPJPUlfVPrrYLYzMXYUj4EtoLDuCefbtII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttUad3SyzglIga4hvX+xZeEm/EPf21FNdbiXznbsgUzCW7ETmztenlbCD/EcrHPaXb3zK93r7F8DXs9ANSWutSSKRXs0hMycLLv68WiptGOLlP9BeTslZRpdzkxjBEJF5k+K7BqqmZ2uYRSt9trDLBBrBAvv/GshtQ/Zmm0RSS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4jQQmI0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4jQQmI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718433107; x=1749969107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXzABCCc+UPJPUlfVPrrYLYzMXYUj4EtoLDuCefbtII=;
  b=E4jQQmI0eo48dn2vRLIahW4bh1G3B5Nz2kbxiZqc1nG6GrlJocQMxN6/
   eIxsy2HwFUeKYUtm2SxMOiYxv3bJPkVYRNAE5jSdZaCXYbR11yDwFStxK
   ibFJO/Hz5Imed2LY3BXTUFjdPrTlOmkcZPgQ6kaD2L0Crz1bxIgZhHY+C
   mj70sDVDxRkicvltmQ5PX+ylIPzMGXqc8mz3vYlL4cPyRiFFohMVwhVdf
   GYwQ7lplDzWKF1fdf4byNKLfZC2eWjQCJf7q4vHUn5bhnyoN7ayZBzp9z
   jHlFB1syJAjZZ2PKyuqfbX9jczO2mI/slosNLVrUDSzWFX9DEgbI4aRY2
   A==;
X-CSE-ConnectionGUID: sDqrJqzZQZuGPG4DUUV4WA==
X-CSE-MsgGUID: mdkgv9sJRGqdUFhlepfQUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="32807187"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="32807187"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 23:31:47 -0700
X-CSE-ConnectionGUID: onkUJbT/SYOGt/AliTiRgA==
X-CSE-MsgGUID: Tb6vcusRQEaRkxuLVv5ALQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="45819706"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2024 23:31:46 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIMww-0002Gv-2j;
	Sat, 15 Jun 2024 06:31:42 +0000
Date: Sat, 15 Jun 2024 14:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 115/199] WARNING: modpost: module
 mediatek-drm uses symbol dma_buf_vmap from namespace DMA_BUF, but does not
 import it.
Message-ID: <202406151407.hMvJ57Um-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   b16825740f3f827da82b8dcfa7807f141438e560
commit: 73fa5231cece782171bbb15056e093e37e65e72f [115/199] BACKPORT: FROMLIST: drm/mediatek: Add secure buffer control flow to mtk_drm_gem
config: arm64-randconfig-002-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151407.hMvJ57Um-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151407.hMvJ57Um-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151407.hMvJ57Um-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module mediatek-drm uses symbol dma_buf_vmap from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module mediatek-drm uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module mediatek-drm uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module mediatek-drm uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module mediatek-drm uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module mediatek-drm uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
