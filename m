Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C32512E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492429; cv=none; b=iZdpOrMtCd9dN+QSlI6Qkwm6GXnuZ8Oa76cZFk8d0eyV03eiIKDyJGVypysAfua9wgHPBtJKNM7wTNX2u7RJs0Y+B8upcx5fqfyP8l0hgsozJ2vY2tjQKsVZoYLxcJzyyqHBz/Vwg+IC+xuSz07gXcN4y3gMczI3Vz4R2L4bJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492429; c=relaxed/simple;
	bh=rjuwkUcjcBCl/umq5HlwGS9UCPmmuvRmBlkzU2HMJT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnG/NKiV9BM6MnuGFJTFnSiJluUDRn/JgUjrtsUbaFUWOtRFE997k4e2od4AmH2U1ceL6tNSovtoItgIaaNLDxAT0zMHAmTiNg8U1RUTAMw7HFyjlZax7eU+C2dncGLF7d0dgVM4fz8JpGi5OvQfPh+uBqhwXAFl3oFN6SDLZ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI7tOc+d; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI7tOc+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748492427; x=1780028427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rjuwkUcjcBCl/umq5HlwGS9UCPmmuvRmBlkzU2HMJT8=;
  b=WI7tOc+d3IAKyvqKRBiNQfZbcy4mnPlnNfV2mhsik16r2nl+rZ+HobOJ
   vE0n451j+xucBDheoW4p9I4u61pbT9304x0NUZF7XRJvuo1RWkojGFkga
   aBkHMm45Z09mZ91CornLwRHqeT0wfg18zH6hLX7cqhrXZsH+iDRoBejkv
   I+XWUE9RHam2l8kGBmUmeR3aYmqcpfvYhZXZXXRSkmcbfh+85Dq/jupcw
   38JuldbpyiTNNgZgt+bj3boBo32xx4cqj8DxAHDA6OvLWYPq3y23IXFXv
   eY20kGmV3aULEVWmDmwGLndklY1GFxtYAA8nP7kRE57WIHETPfsWSGxlw
   g==;
X-CSE-ConnectionGUID: SjIArcvpStqZ6d8PV4SQKQ==
X-CSE-MsgGUID: ksCJxPrHTTGKoEvGricN6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49786220"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="49786220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:20:27 -0700
X-CSE-ConnectionGUID: i/IviTLpQGuPGhhVhqM6Qg==
X-CSE-MsgGUID: ABclYyVNQwqj5n5FoKQmRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143415521"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2025 21:20:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKUkh-000WJy-1L;
	Thu, 29 May 2025 04:20:23 +0000
Date: Thu, 29 May 2025 12:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2331/2331] kismet: WARNING: unmet direct
 dependencies detected for DEBUG_FEATURE_BYPASS when selected by FAST_IRQ
Message-ID: <202505291226.uUVxetsW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: c294b5b18fc820cc006dd69fadefe24d4c321412 [2331/2331] arm64/Kconfig: Add turbo features submenuconfig
config: arm64-kismet-CONFIG_DEBUG_FEATURE_BYPASS-CONFIG_FAST_IRQ-0-0 (https://download.01.org/0day-ci/archive/20250529/202505291226.uUVxetsW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250529/202505291226.uUVxetsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505291226.uUVxetsW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_FEATURE_BYPASS when selected by FAST_IRQ
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for DEBUG_FEATURE_BYPASS
     Depends on [n]: (FAST_SYSCALL [=n] || FAST_IRQ [=y]) && !LOCKDEP [=y]
     Selected by [y]:
     - FAST_IRQ [=y] && ARM_GIC_V3 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
