Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6927C14A60F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782607956; cv=none; b=KhqhmqMBe/BUAvDF90ZI6GWEOtxZvbryid9ti7zOORTAa8DcIiLhEqMqhJ5zkrUJp5z0sXfrpEhawgy7pX6WzrZgYtX49lvG+uAdd/8vSuyxENB5U90WxH4Ds/okZ4DAZ4IJjSUb5MjRIaJEdGbSL8EYeqm+gMNkpwUJVqO4oaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782607956; c=relaxed/simple;
	bh=MVEccNjg7zG6kEUwYAlpT7WPj9BnxQ5AYqx+HR/9QDA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PhFRs9vYU0R3kCfa3L4rJ1W+ozsk4kVAzac3hMjM6keExzDUxFGPopadJGVbp2b33bqWfRDJy/Oi/IRtNCXTgdXl9GEqEQyDiLiA7t7/zejfp3uH5RnaCVtrYzQUP2Rb5mbkTsgNtOhDkXuf8MmYxrPi+X9Ke+OJcajtv49phik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf8FNwVs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf8FNwVs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782607955; x=1814143955;
  h=date:from:to:cc:subject:message-id;
  bh=MVEccNjg7zG6kEUwYAlpT7WPj9BnxQ5AYqx+HR/9QDA=;
  b=Tf8FNwVsRZPfkyzt96tfmztUQE+0xagOCqmhgwIYvNFImXUgYRgDgJWY
   0Y1eFT6tfBmjrtAbBhVsGRscEs5WgXBQxqL7uw8+FrZ8vfKc6P0PxpltK
   9avUcC2VFyR7VFFGCh8FlXUXCjXJTFG9fz0PO5QZ5q57nWot5XQTw/+C4
   sAdkDI35wWhnaz9AX/qltsfjMmMUmnoA1XtZLKbEDlFq+pR6/fk67ars4
   lf1sqIL4xd437Y/fweZtZJGrj5npiG6iU1sq0q9dY7xhtbjj8/dl7F2Z2
   hdSr+O+ZArVnkMszw6A6GCxocfYRvRgef5pkGLGrmr1OP46MQeQYzXif0
   w==;
X-CSE-ConnectionGUID: QnQ29O3WSwW37LyrNjmGpQ==
X-CSE-MsgGUID: 7NyoPvyLQw6/YpIhHtc6pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="93930388"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="93930388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 17:52:34 -0700
X-CSE-ConnectionGUID: +4YOgRnTQoiy+J63mSLg+A==
X-CSE-MsgGUID: DogvZ2pPRE2inoZHJ5nhdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="247168995"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2026 17:52:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wddl7-0000000068j-3LuW;
	Sun, 28 Jun 2026 00:52:29 +0000
Date: Sun, 28 Jun 2026 08:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: ERROR: modpost: "drm_connector_hdmi_audio_plugged_notify"
 [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
Message-ID: <202606280845.FVTkiTDA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   780d569e6c4b422290f5cba319eb904b355d64be
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
date:   6 months ago
config: powerpc-randconfig-r063-20260628 (https://download.01.org/0day-ci/archive/20260628/202606280845.FVTkiTDA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606280845.FVTkiTDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c08c123d4cd6 ("drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606280845.FVTkiTDA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_connector_hdmi_audio_plugged_notify" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
