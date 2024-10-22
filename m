Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102351A3028
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729631047; cv=none; b=QFXY+8QwBjeOk9rPRfA9bDP/50nDf6J+XBV9jTg5em/FEhMIXecYOruO/UHMk9mRlksm36w4kG1uOe9LU5hmgP7EfYpm7gqyzFvGrUUz+ID1m2lByPcAIfRR6oZZwWAAWfy1tUux+7cSqGGH/P7Kum0L/RcVCn5tQcMOHG1+fXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729631047; c=relaxed/simple;
	bh=YJ/yUTrv2y209PfQKe9EQz6k1BXPXboZVdC/OsolvXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnyCmC4ZRKKn/Xj6CbUY5uZuhsER39eLZrksE7ODXH+CgJM7KH4IQ0iSnJ0KUCdQfW8Aq0GYakm1LQUinmdOkqw1teqdqW6ha9AfhwqifkxgeU/2wBepHZnV6GrByWy93DtLaWjtkT9HZylYuxDryBNY4vQ3mM9AxQ0yoK7mT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hl1/45Ug; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hl1/45Ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729631045; x=1761167045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YJ/yUTrv2y209PfQKe9EQz6k1BXPXboZVdC/OsolvXo=;
  b=hl1/45Ug4ygbDBctHSw1zvKM85WyQTyxVvMpRaBmuMWET0rFi8uYMmC0
   Cz1PKZ67aDs+47xnXtYpYLD26spSejvb0vlCpUAJNoJXj5fpeN1DuW4uX
   H/C/s4eG9h5ywamqcAHms64TQ/ZfYIx1VsgTyoO8MgzwrwaDeQy1M71Xc
   Q1cAH1uzbtINgWe74LzbHL7SbpaKLMEyKGFyk+a+tY8XfnqiOGwbJuDdc
   28C58xOvIrotcJUUJ+qCLyEIuMn7vtkXsI7w5Qm6OAi1RbWytDERp08sC
   qajYjD4c4ieR5ZmvA++V1septxYgfBp1+Jmf0FrYgIM2uVANeMWvfeS2/
   A==;
X-CSE-ConnectionGUID: 9zQfaNCtRlaVtsKZcLQZNA==
X-CSE-MsgGUID: xYIn7qlpQuqMju3kjF2HpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28654074"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="28654074"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 14:04:04 -0700
X-CSE-ConnectionGUID: A6ryL8UbT2CHb6yLPUnK/Q==
X-CSE-MsgGUID: yAS+sqXpT9O8gfKcoUTf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="103282995"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2024 14:04:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3M2r-000U66-1u;
	Tue, 22 Oct 2024 21:04:01 +0000
Date: Wed, 23 Oct 2024 05:03:35 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/6] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <202410230437.YZGMuoOn-lkp@intel.com>
References: <20241019192030.1505020-4-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019192030.1505020-4-matthew.brost@intel.com>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-exynos/exynos-drm-next next-20241022]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-ttm-Add-ttm_bo_access/20241020-032144
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241019192030.1505020-4-matthew.brost%40intel.com
patch subject: [PATCH v3 3/6] drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20241023/202410230437.YZGMuoOn-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230437.YZGMuoOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230437.YZGMuoOn-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/gpu/drm/xe/xe_migrate.o: in function `xe_migrate_vram':
>> .tmp_gl_xe_migrate.o:(.text+0x3dd4): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
