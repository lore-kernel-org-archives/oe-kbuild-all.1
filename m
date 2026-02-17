Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2513EBF2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 01:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293006; cv=none; b=TOdMPd8yLeXgGPJytDtNaAaw0XnmTjo6NO6eHFgB/Ha6VBgmfWHLJvhFM+SCbLWsU+RwHLNLV3eA2OaABUzTl/AOcxu+xxII8JzWYClSalCXOkAdIhdLnIoKv+qReRFFtH6KwQP0bArB5fIrB+FcQpn6w4vQyztk/z+bY444UHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293006; c=relaxed/simple;
	bh=ydXFUGDHK0X1oyGEEfNUyykXPLPeJLQ+Wvda5kNUQKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ixj8ToMaxLej2IQnrVDZr3HCxSQLZRB3Aan+4VgF64fh1yaoXEWWT4VxEiUTZPk1XYnJ0TF+27pz8e6htPGLFnV855nxJlXtJms5jUCkIbd9euVQBCZvURPE4LN8U551mkr6Ir8YFuU2Mm56NGjZZqnFaFx5k1UjePUoOjI2b/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHzo5W+K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHzo5W+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293005; x=1802829005;
  h=date:from:to:cc:subject:message-id;
  bh=ydXFUGDHK0X1oyGEEfNUyykXPLPeJLQ+Wvda5kNUQKU=;
  b=JHzo5W+KFEVUJTeGhaNMUMZERF+kFExtOFkhUSsHo28zRP0YLBRZkkJj
   ytzVVI/Upir2s7JSOcKuRwcgaIMRtoRssn/B5KtjrTjTAHfmhcNUdjnyw
   VblPYNanTbJNIdg0Ky3LOeafdmaIUMWsNUSccu2TT0WJL5cIR58U3ftbA
   SXLbvIhewbZKjs11JN7PxyJCy12B52P/ZU6pfc2smBhPp6ehGSQ2kiFVv
   VtCxs/gCSUQKzWhdgNhUFg21SypGmBCiSofLMnR0wSSrPT+m7x/nfGiMn
   Rbo+K8jS35bv7VPo656Clc8l5m9LW7iiKPjMqdFArKn53Jh2ua1TeR+Xr
   w==;
X-CSE-ConnectionGUID: EpjkZITbSlm50bKbAEBjUw==
X-CSE-MsgGUID: T7dYQdYST8q2eQJz70TsiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82996444"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82996444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:50:04 -0800
X-CSE-ConnectionGUID: ztlxphVNSeu9fEu1ROaATQ==
X-CSE-MsgGUID: xYLXgBpzQrahZ9vDBOENgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217714748"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 17:50:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsADw-000000010Tw-36u2;
	Tue, 17 Feb 2026 01:50:00 +0000
Date: Tue, 17 Feb 2026 09:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:highmem-reduce 19/20] Warning:
 drivers/gpu/drm/drm_gem.c:130 function parameter 'gfp' not described in
 'drm_gem_object_init_with_mnt'
Message-ID: <202602170927.EFRL0Sta-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git highmem-reduce
head:   718dd72a00e45b52f424a6db19645b761fefc2ac
commit: 076a0021788d8a03d976c2d17e9887ec2c0b17b2 [19/20] drm: add explict 'gfp' argument to drm_gem_object_init()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602170927.EFRL0Sta-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170927.EFRL0Sta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170927.EFRL0Sta-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem.c:130 function parameter 'gfp' not described in 'drm_gem_object_init_with_mnt'
>> Warning: drivers/gpu/drm/drm_gem.c:163 function parameter 'gfp' not described in 'drm_gem_object_init'
>> Warning: drivers/gpu/drm/drm_gem.c:130 function parameter 'gfp' not described in 'drm_gem_object_init_with_mnt'
>> Warning: drivers/gpu/drm/drm_gem.c:163 function parameter 'gfp' not described in 'drm_gem_object_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
