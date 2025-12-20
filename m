Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58C26ED58
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766272373; cv=none; b=ZnPKuMNxn9h4eGmNm6/uHCUYmn4NVaIHdA+vQThOqVjUcagu7Dad9mEEUIVcHcAb9H7Y01RXUHGygJ0ZFZAEZzRzbWd5krqmF+PnuL91nsVmxIqoDK/Mp30qYIDucrsaXAgDglMKkEN3Jo5R93gcZ9zMZaUiV+cz1cqRuY3oi4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766272373; c=relaxed/simple;
	bh=O+0xK4Ln5zYTeI9RcC3XM6MqD0pDffnd7I8ABazyXdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqwTOSQzKmT+aWMqPSJLwusASpHTraynq96kE9iiI44rvcb0v6thkKZmWmYw8l98wWriQ2XfHf4cJIxVX24Nqn9cW/9Acrs2hRWJeQ5PFm2rIEdQIxwmWD4p+MU/eWfkNSfeCaKWyI3nfl3LE0Kfu37L5k9hQmnSrAbYwqB9trI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+751jgT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+751jgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766272371; x=1797808371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+0xK4Ln5zYTeI9RcC3XM6MqD0pDffnd7I8ABazyXdU=;
  b=P+751jgTXyMAljBLrIbGwW/i7+FKiVp5E/wS1MNc/2ZBf/UR72eMzO/D
   LJxMIW9pBDkXq0bc02svCkgbXemRIMF7TFcrEwf62g99pv4tO9yapnt9E
   rJTgWyW9GDiWBOlh9tEvaZG3bvlMs5vfhj8Rpggk+K1TjXDz/UlXkTpvE
   UT647XBrNGqfPa8y4vR7PIf+h3H7HwSekbV40shyelqfLz9pK7bI9HHSZ
   jJXasikUsEXF7fn4LWVHaCnidKNELAZMHbKMTdi0EQMFO8QDivSb8NKOq
   xf2pQ4J8e+XAriHGQIQPSUXWoxkYsN4wH3uMg2+1Ll+fdVt7i5wFJf1HM
   Q==;
X-CSE-ConnectionGUID: T7I+sORaTzaah9KN9XlegA==
X-CSE-MsgGUID: FUuiLJTKR9euEAXWbvsJTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68124955"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68124955"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 15:12:51 -0800
X-CSE-ConnectionGUID: d64TpFpCTFWbiuIkkOp1rQ==
X-CSE-MsgGUID: VSN/CYwtSTWrVSSkLEfF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199433518"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 15:12:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX67z-000000004p2-0C9I;
	Sat, 20 Dec 2025 23:12:47 +0000
Date: Sun, 21 Dec 2025 00:12:03 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when
 selected by GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202512210026.yPXV8Eny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [12/12] ANDROID: GKI: enable hidden configs for DMA
config: x86_64-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512210026.yPXV8Eny-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210026.yPXV8Eny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210026.yPXV8Eny-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
