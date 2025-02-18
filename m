Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FFB28628C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 21:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739912507; cv=none; b=E+2eShwgIw7ZbMfN2ab/SklhwYj7sZLU/2mOU7KiQhrdfCV1JaB/jBmHUzPyt1uc2pjO0Y7G267hGOHB3tmADNo7m1VQz6me5qJ1CoyxV9YvzWFnGkSf+nY1u+wpFHbTdzM9HcChpiDo2VJjXuffdpqkbJDDidXSmKn3j/NfiDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739912507; c=relaxed/simple;
	bh=4iAjNWBRHULUQ3ImOuIWROZJrkYl7LMbn2TzSgF5CyE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2jGy9JSQbkCgnO4wnjGXo5GI/qa+WDUdxHWmSLJQerdT0Rp9XyMRgQakxYKUHLvemqcCJ3RhSOlSp3RclHqFWSuSSlwg3t/YGRlDOZmA0acyPw18yYd0xsl89VUwF5OyYLd2Hg4QpGXcXQPoepdurSWElnfkaGlqR6NeOVrnHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UK7MT4Hi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UK7MT4Hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739912506; x=1771448506;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4iAjNWBRHULUQ3ImOuIWROZJrkYl7LMbn2TzSgF5CyE=;
  b=UK7MT4HiXClgDSy/Q2QVG0V9nuNgVCVyrmcc8OeJ+CuZ6jYB2jZQAfP/
   y9hP66iqBQIZCCbrgKZFnSk2HF14P0pbszi3ZHnCKqaIKfq/T5f/NStJs
   p336uamomfPabGhZfitFEAEMrCuBgUmkw1aAbz6nIkBnDCnnCCKSxYyc0
   OOefI+kaboeYJnnOPDTLhiYNUhZR3bPIETu7wvdbmJkwC+rjUK0GSd1b/
   rNZKmdT2iQTtzzlG847TMqJ/MJWHVLFABU/u4DaXAm3xA/KIePyZ5Uj+x
   YBttIS2Sl2ehsf494SEseXFYsIbIx3vpd0U1k9t/g5qKYUV8KTJcKMLpK
   A==;
X-CSE-ConnectionGUID: uL6Ks5KLRiaRUTzxJz/K0Q==
X-CSE-MsgGUID: iTfwZy2MQtWsGVQiFyxtNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43461945"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="43461945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 13:01:43 -0800
X-CSE-ConnectionGUID: EbuHM/rYShuCdIFpfP7YXg==
X-CSE-MsgGUID: VIO/PPX5QXKhJwZzNBZL1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145410991"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2025 13:01:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkUiq-0000sR-0e
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 21:01:40 +0000
Date: Wed, 19 Feb 2025 05:00:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/60 1/1] ERROR: "__icmp_send"
 [drivers/net/ethernet/sun/sunvnet_common.ko] undefined!
Message-ID: <202502190430.m8h7x2fy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 9ef6b42ad6fd7929dd1b6092cb02014e382c6a91 [1/1] net: Add __icmp_send helper.
config: sparc-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190430.m8h7x2fy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190430.m8h7x2fy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190430.m8h7x2fy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "__icmp_send" [drivers/net/ethernet/sun/sunvnet_common.ko] undefined!
   ERROR: "ip_route_output_flow" [drivers/net/ethernet/sun/sunvnet_common.ko] undefined!
   ERROR: "ip_send_check" [drivers/net/ethernet/sun/sunvnet_common.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
