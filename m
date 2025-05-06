Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5827FB1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534105; cv=none; b=fEx/kFrBHAReEPw4f/FJ4jXYH2i90+HckSFUB6x3ktaBgPwg3g0RXXcwl4GdULR8jNKGp1wXU/W4IlJvO3BKEwjskaJqayD5WtNU2y0/SclwnZmOuf+4PDL4c+qF05fslX1ijnSniA6e4Q8ZAczVz8WsLJ4vo0aOjo+/+22M+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534105; c=relaxed/simple;
	bh=lGks/h1M36zpUGqEX/tnyi+lEft5xlkJIGym0UTc7oE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TD9rDsyFJUnxr4Qd8m4Rjag/jjuNVcYL68jesxnFkXYa9OfGepzKgVhlqLHtCUTlA/CYcGlbHAaJdYhixietOUs+SvJUeI+BjrYyH6TvxZn+OScj4H1PUaWMVci8KdBpJHAqwtbVsKSGB5qxeyKqnCghTR2gC2dFMndG008OaJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVbVd9Jd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVbVd9Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746534103; x=1778070103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGks/h1M36zpUGqEX/tnyi+lEft5xlkJIGym0UTc7oE=;
  b=UVbVd9Jd2ZTP/XR+Sl9AnAbYxVw7jpVcT3GK3lAm7/cC3OiP5Wga1L2J
   fyv0Kv0/zNV+OvSy/6yRl3loOgQuiuZs18EFmgWyT9c5IFK0hJZBhWInL
   CB9Xz25ZWDekPSFevFdoO1lhZzOHRoxsVHXtVmHE4JMi6VEkEFnYnnuLF
   fiqQIQlURN7o1zroiRz0X71gyAJVPXD4JbyCo4zuuIFACWYpBhTQDenLq
   s4A8x8IjbjYl3S36cTO6tm3l/zh3agNgElXj+hRtCogh59nFs89n8JRGY
   +8Le1Jywh3cZQQsu3QLCW5myv4NfXw2lYDKYVRnOCjtc/C/bEaESSqGiA
   Q==;
X-CSE-ConnectionGUID: N1P6o/TiRg+Xu3ZsVNAXDw==
X-CSE-MsgGUID: BHIS2oyeRp6DNZ2uSXu2pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35819424"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="35819424"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:21:39 -0700
X-CSE-ConnectionGUID: oworW2pmRUujLAiBCQz1Zg==
X-CSE-MsgGUID: qwZbwHQpTbmeXjC1Ekd49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135508099"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2025 05:21:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCHIl-0006Y7-1B;
	Tue, 06 May 2025 12:21:35 +0000
Date: Tue, 6 May 2025 20:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_SHA256 when selected by INCREMENTAL_FS
Message-ID: <202505062023.e52NALKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: a95005100dd1e4f70c4fce3abead12cb5f1d7b0d [2/2] ANDROID: Incremental fs: Remove unnecessary dependencies
config: i386-kismet-CONFIG_CRYPTO_SHA256-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505062023.e52NALKD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505062023.e52NALKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505062023.e52NALKD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_SHA256 when selected by INCREMENTAL_FS
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
