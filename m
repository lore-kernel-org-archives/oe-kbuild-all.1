Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B41FAC42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 23:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767227; cv=none; b=sBzQtysP8OcsABOAwUoUSOLsLCTBNI9pFgBpwVrn1TBf2TmaIrdAEWlvsAKEO0bJy10XbXxf5MHz/EPRA+iJ2bLEuCBrfD1gzFhEgTdslHo4upTyIDd0zYPsIezF7ucqppRCbtHYA4+I3a5HD2zn0ln5PGFL9T+zR7jPtlEfPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767227; c=relaxed/simple;
	bh=1OOBcK5tdsC9yl6QZ6/5qx1FYbLURxvXFRt+efSnYyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VXZ77GPo1mDrTzNcv3fbjPd335R3tZ7Uo2r6jfoy+X8zwHXyH8TNCI/17c63t3U8vZzkLqg8J9SAlgjprCnCXpBCgonQEoX3drZwP/IfQ8FNsc1AqKz984m/3iCos9CVmG5TZLB2rYeXiKaMhQdrnI4nsduGsr+QobMKfhJ3L2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7+55cZx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7+55cZx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770767226; x=1802303226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OOBcK5tdsC9yl6QZ6/5qx1FYbLURxvXFRt+efSnYyU=;
  b=S7+55cZxnGG9QgJK2pqj6WiWAtYEAKg/Kp+GZAV2cGVE+ATF2+XjGiH/
   8HFx5shB3w5TfkfKAO98mZbAFGij6ai1ECZUdm+8+ZskR5a/BvBdXbraj
   7gFNW9vA7+Jc6ObKSQk5Tgkr4vSppRDx4oLl9ZcJTinyVWAJ/PHhWbOHy
   Jku2idRu+7lWVZSDwqgtXKUJ7/jfqAaGXfnIikl6IQ+dK+gwdwqVhL0/n
   q7PxThLn2N5Dn4ZQdK8AG0zzcQw7TaIJNo5BkPeFDfmGdW5kZVifhsF2l
   lQHaIyXrS7N8nRtrA9DQMAGIiY+PPthxHFbF7hJXgqXH7Bl4MacqlrB9e
   A==;
X-CSE-ConnectionGUID: pKg8FBROTTmIKgOm8dMjdA==
X-CSE-MsgGUID: /mpmjxmqQuW+C8eIzQ3tfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71897201"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71897201"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:47:05 -0800
X-CSE-ConnectionGUID: 69k+KyeYQGCau3PjUp/3ZQ==
X-CSE-MsgGUID: /YgJs9yJSRu2uTGuO9tbPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211698691"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2026 15:47:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpxRe-00000000pW8-0rcM;
	Tue, 10 Feb 2026 23:47:02 +0000
Date: Wed, 11 Feb 2026 07:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 60/61]
 drivers/accel/ethosu/ethosu_drv.c:26:1: error: type specifier missing,
 defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202602110741.1mZIfoab-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   b160ea7e81b14378daf7dc40cd85e1b26ebb6634
commit: 409d5f2c32913392326ac7923364665eca17c1bb [60/61] accel/ethosu: enable drm.debug control
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110741.1mZIfoab-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110741.1mZIfoab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110741.1mZIfoab-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ethosu/ethosu_drv.c:26:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      26 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^
         | int
>> drivers/accel/ethosu/ethosu_drv.c:26:18: error: a parameter list without types is only allowed in a function definition
      26 | DRM_CLASSMAP_USE(drm_debug_classes);
         |                  ^
   2 errors generated.


vim +/int +26 drivers/accel/ethosu/ethosu_drv.c

    25	
  > 26	DRM_CLASSMAP_USE(drm_debug_classes);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
