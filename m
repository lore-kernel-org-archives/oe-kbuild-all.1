Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9D4AF9EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054783; cv=none; b=ZPg+7JWkql1nz+ThWY39qzPJgh+oKket07Xzv5nv8RSVarMQkximwoPHsU9iszkq+MNO8VVDUp944UqeHxucu/AcX2dcGVqNODLSepMGu1flMXB9tOJEjNUF2m5rLovizxkIreIoNXkoI7EpVMnkkXXLBVtCTBGeV622dBuVFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054783; c=relaxed/simple;
	bh=BfwXgEQxot6tAbJmy7aE3ArDYrHJrqvbP9kkHxRC+pI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YDlFmY2yM6ar5qVNP8tIvyp/TTQThh+Sza8K9k2+Lvvh2RKOV8DMBSdKrHAJmL+wjpR5rgTQzv946XvXWQH4YRff+KM778KDv1dmt6ji6jXqUtloXCVcbZcr4jKdD1HzIX8I7X25UHGmgvOwSObxY64QGhoKTDNOinIdwAUKTEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZtQRCIm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZtQRCIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054781; x=1820590781;
  h=date:from:to:cc:subject:message-id;
  bh=BfwXgEQxot6tAbJmy7aE3ArDYrHJrqvbP9kkHxRC+pI=;
  b=FZtQRCImnJ4w2v57IjWPBdbF+r4jsV2nUo3P1tEiKhouBbaxBDTTL+jN
   s+O61Pqa+udPfyykJvapQzQtJz4p5S8BUvKJevHIiuCeZfFeWQwl7NrfL
   PJ+y/Z/vXiDu4jrHs1+i7KeOSRIm6cZija0kWYqn8wNDutpHyKDyg4ja/
   fSJmUI0T0VNKzBYQ39Lnejm8cL26cI1eU6YWWKtDw3JuXk7rL8PajOPtn
   VBzI9mbvEFWDq9m0pp5WC39O5X24ntrh+icr+a6TF/6/NOc8Wu5i716v8
   +3Ug3EgW2otPQOjCMLuF5uXGLRcmW1PF2tLQkIx3+MnPjzobA+ome/Sd0
   Q==;
X-CSE-ConnectionGUID: 4BDO4QPhSpaib9LKAzLivg==
X-CSE-MsgGUID: Tzwil/2RS0GJjCf0N7w5pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271600"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271600"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: IHZdGBuHREO5VDZ4WlZnZQ==
X-CSE-MsgGUID: ClaF1Tv0T3OziegcF3Yc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395200"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000Q1-3rOu;
	Thu, 10 Sep 2026 15:39:28 +0000
Date: Thu, 10 Sep 2026 17:39:17 +0200
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lumag-msm:msm-cu-sm8650 38/50] Warning:
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1499 function parameter 'crtc_state'
 not described in 'dpu_crtc_needs_dspp'
Message-ID: <202609092048.7qSBs4Rr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/lumag/msm msm-cu-sm8650
head:   c86dec94e08197257d1a569f3ef45f02380a5080
commit: 77208dad5ccce8f22e979abb76fcbe14fe9c706c [38/50] drm/msm/dpu: only reassign resources when the encoder is reprogrammed
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260909/202609092048.7qSBs4Rr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092048.7qSBs4Rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609092048.7qSBs4Rr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1499 function parameter 'crtc_state' not described in 'dpu_crtc_needs_dspp'
>> Warning: drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:1499 expecting prototype for dpu_crtc_check_mode_changed(). Prototype was for dpu_crtc_needs_dspp() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
