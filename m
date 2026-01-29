Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5432F6168
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 18:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769711292; cv=none; b=RNcL4w9R+kMC9XguIWcTQ6ibG1NU4RkljzubnJ0gm4YFP8osmWXgapvjeukEWsraT4dadn4v+/OokFLGGKPY5hC3UPAPIYmwocZwafupeWPCdzNhlHh2rSbyUOfCmRChSnXDAQUAvd43yAexAc9OYABKNo4VESzPKxhYFBDcQV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769711292; c=relaxed/simple;
	bh=whYiHaUtJvlKXomBu0jkfoHGHioa0kxoeVVxQZUC45c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Io7vQse/UC7crW7oXhIEZaYM/VgrILmt5MfkFnoOSeHpqFSCM5OWsm/jR1R2pMi1PIF8tiv4QKJA1elx0Z1WiWJtsdAS3gmv0fKLrF5p9BjOUPu1Y3cA5zCNxRI1XHGfhuTAnyL/LOeEedx6ztnrQutBovYPUf8pLdm6NzfQ64A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6RRmuKj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6RRmuKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769711291; x=1801247291;
  h=date:from:to:cc:subject:message-id;
  bh=whYiHaUtJvlKXomBu0jkfoHGHioa0kxoeVVxQZUC45c=;
  b=D6RRmuKjFVKKWZdjlFSxKZI6pPowPf+djBlfeXCMj4WXsrWZbR2f33ac
   EUdseSokOIVCEdIgVFa2bIJs3n4uk0q8ifuceHCBd/4sAsQisQaiqJ8z+
   3kvt48ClmSaJyV0ug5PfAb6YKyoXFcjzXaoIPpTA11/va7ZImKuEO0w/G
   XghODrSwe/0c622p6ruG0uoI4JV9BVQWtU9Clu1KssNPTO6ZC1sVBxUu6
   riQbvp2ZPlthTu1C09TTl4uB935Eg2e+sT0mSWpGEZv/Z0u4teQTlLI50
   oL8PfzHWDHd2megoY8Ra61qZGg+c9Ktn1OWbybH+DJHNorII+rdLPEBJt
   Q==;
X-CSE-ConnectionGUID: qkbpAt7cQcml6U2BMD18WA==
X-CSE-MsgGUID: bFXL81ZbRvK8a6V/fuafPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70159287"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="70159287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 10:28:10 -0800
X-CSE-ConnectionGUID: uFEEUl5vQDG/E0J1i4sfFg==
X-CSE-MsgGUID: 8i3E/urwTVezYzRxVUhHFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208257601"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2026 10:28:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlWkQ-00000000bma-42Mz;
	Thu, 29 Jan 2026 18:28:06 +0000
Date: Fri, 30 Jan 2026 02:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] WARNING: modpost: module vcam uses
 symbol dma_buf_put from namespace DMA_BUF, but does not import it.
Message-ID: <202601300213.Xi3MSiZv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   f29b36ecc2e18e1d170008dd2401fea768fac4f0
commit: f29b36ecc2e18e1d170008dd2401fea768fac4f0 [5/5] media: Virtual camera driver
config: sparc-randconfig-r131-20260129 (https://download.01.org/0day-ci/archive/20260130/202601300213.Xi3MSiZv-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601300213.Xi3MSiZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601300213.Xi3MSiZv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module vcam uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module vcam uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
>> WARNING: modpost: module vcam uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
ERROR: modpost: "v4l2_compat_translate_cmd" [drivers/media/vcam.ko] undefined!
ERROR: modpost: "v4l2_compat_get_user" [drivers/media/vcam.ko] undefined!
ERROR: modpost: "v4l2_compat_put_user" [drivers/media/vcam.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
