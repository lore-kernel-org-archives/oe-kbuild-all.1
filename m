Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC283B895E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153092; cv=none; b=DK9nJZ71sjXI7Cxlx7NZsyxOAdBL6DGTCFw+1l5YX8TDZR1L7UXoz32c49oiGNopB92W8rwWuLYY5el27NTILQPkDGmYMYk4Uwar8hJc/TlhEmgR5GikDchMbs7vSa/s30zQ69kYq8tuE/a6MimdvrgauBBgBqFwYR8lT0/f1wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153092; c=relaxed/simple;
	bh=svEDuMs4Fq7x5PmYDa0zWn1N3FhZjQQBcwcHV3yyOJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BrbV4laWPONMbPNuIi24ned5R54OrIDXbHMG+X8TOypRQKqlaf8v30E4IoQyUPzqpDhtGZCsvIZftGAn9ro6LIg+U3oe/beaM/7aTSq3qs3VFJa0443a1b2yH1ZyXW/xzePeU+ceSpJqB6R2kCKmNIBjyX8dYIvVgjlFvMk/WME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMGKyxc8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMGKyxc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790153091; x=1821689091;
  h=date:from:to:cc:subject:message-id;
  bh=svEDuMs4Fq7x5PmYDa0zWn1N3FhZjQQBcwcHV3yyOJo=;
  b=FMGKyxc8DDD+EvPG3iHadtT/ssrf4oEQCu7sWeY8lWwgoUmLqNxoQ7Nj
   C7ySirxNxQFTfXLQImLCGJ3C1Upy+4dhAh08LyHe4sMzAkmcFYa2pmJR+
   HXTfk/U9/f9wadq/nin8SB4UPEyvcZ8xH5P/DRu6nufJOfeQdFXgdHY8w
   2yYqGdTN06Gy92Uc6heto/IDKl3VFdZFw7nmvTjVlSoNCoxOGi76VWTnO
   K9PsiDiyYLLTKXS5c24QZJQtjcdKP/iXSDdM7KtOIHm9I1+0ZkdwediCQ
   l+N50aLHjwMkS4mzTEIdoJv9fQ4/KFjpFZmNGvn8SlcmFR3coDPnkY13c
   g==;
X-CSE-ConnectionGUID: hGPohFsLTCOxM02jJlZi9g==
X-CSE-MsgGUID: jbCobxL5QkGcbQOhDdKwQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78379812"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78379812"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:44:50 -0700
X-CSE-ConnectionGUID: q1xedm8tSLutPvAMQPQv3g==
X-CSE-MsgGUID: l1PXRyVeRrqJALjQOKsp2w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 01:44:49 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Ias-000000000at-2sXM;
	Wed, 23 Sep 2026 08:44:46 +0000
Date: Wed, 23 Sep 2026 10:43:58 +0200
From: kernel test robot <lkp@intel.com>
To: Dominik Kaszewski <dominik.kaszewski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Chenyu Chen <chen-yu.chen@amd.com>, linux-doc@vger.kernel.org
Subject: [drm-amdgpu:drm-amdgpu-next 47/114] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:1 This comment
 starts with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609231020.wPkQLbDG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   cf48bd0a46279f4607956cb17c71bda96ee802e3
commit: 6f74688d7e2377e253671d36acd63a988186216b [47/114] drm/amd/display: Add lock-free memory pool
config: riscv-randconfig-2001-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231020.wPkQLbDG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231020.wPkQLbDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231020.wPkQLbDG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/dc_memory_pool.c:1 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Copyright (C) Advanced Micro Devices, Inc. All rights reserved.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
