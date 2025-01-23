Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE221C07DC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 20:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663133; cv=none; b=Zb2FNmXjySH19vOg+hRDjxo05EXK4KaYjeA+ukvq0qqRTef6J2t1+oiNJTDxqfdG1+D3tLWs8Kg/j8UjZ+InTYVqLcRXAtjOE3eT5Z1XpsBpxGEosdzNB0+RRG1bLWKVikkCnV68tCmcGe/nT3VS0z30pEZuJ7GwMefBrVCRHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663133; c=relaxed/simple;
	bh=ZbhjH2JsYcOLsmADHH88OIwjVCFD1y+WKV3bjl6ezFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lvq/Usdx+1k6g1DmapsbPUQ7qiG/MiWAhVKAQo/X00UmzC5TGOpBMfa/Wbu2QgGcrTzDnrKTj2zbI4KrPVsINFjeat0CZX/nCS7nnFK/N/smWwq92JoSKDduL1UtCNO3PqTY5ChIZCDNiHt7SvbPKrfW9UoV7NS2W3cU44pkDhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b12AF5Jo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b12AF5Jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737663131; x=1769199131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZbhjH2JsYcOLsmADHH88OIwjVCFD1y+WKV3bjl6ezFQ=;
  b=b12AF5Jo8IXhh3ryL1fJmv3hP5zJcclzhnlc+K19R+kzwzJMvVBFqs2B
   Pl3V/eh0UNZ6FEUPEuUOpDt/OHLTjRh4c4VHFFQugeRFKHw+hn18hEhzY
   IjkPk3CcAMedxJBHkCIvIQiQBAv6oi30bMkqL3SgD+2QS2Q1zF7SkbHwY
   vVMWjWEexZr7fDQyl1H/NQD9ZO1K0kFg1qmQ4Fe3no1f328zCB4iZGRVs
   6LviFTuiYrMzRW7B2YMHxxOR90jJ53HHwBUkBct1f3YyjubNKASsg3ogW
   xa7LM1/lgo37saVCAkHt5GSRPsUlKhunO3KzqyNbiG5lR5iQIu4i5Z7ia
   g==;
X-CSE-ConnectionGUID: OGT79TQsQNadIMHG4HCeQQ==
X-CSE-MsgGUID: wOHvuENqSS61FxUyBunObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41944676"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="41944676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 12:12:11 -0800
X-CSE-ConnectionGUID: uR0kToM0ShOmGJYivOIu1A==
X-CSE-MsgGUID: vwR+oYMuT06imeYWQOMbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="107479300"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jan 2025 12:12:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb3Yd-000bcx-2b;
	Thu, 23 Jan 2025 20:12:07 +0000
Date: Fri, 24 Jan 2025 04:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_SHA256 when selected by INCREMENTAL_FS
Message-ID: <202501240454.IhaA1wOB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4ad760793763353e3e3a16ef238bb7a72eea3792
commit: a95005100dd1e4f70c4fce3abead12cb5f1d7b0d [1/1] ANDROID: Incremental fs: Remove unnecessary dependencies
config: arm-kismet-CONFIG_CRYPTO_SHA256-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240454.IhaA1wOB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240454.IhaA1wOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240454.IhaA1wOB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
