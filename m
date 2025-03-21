Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9F91F09B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742550605; cv=none; b=TUZILY024j//v0a6tI9uzXErkLFcwcMX0KFrVY4fwF56/T0tT7fU4QVfRF2OqS/AYTGl9WldfQ09aY/VvjDGagaQSuoScA4jrI3mrJEymylo+OWzlPRgUrseBKxaDt+Uc9zuivG8+mMr/W4MdOavYSjbiE/elhl+DTTkRtn42Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742550605; c=relaxed/simple;
	bh=Z4YJkwwXKk5LxAbnKuu2FuJLNd2XqtTfaOBb9AEfSAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYrZiUdNB3ufqssOAl9mtjcMYjFDU1k3MroCllRw9UZykbbnxA2njwyyI2th0ep3dV3mDXTQCIiY1Qjp7BK8lSYnjPfIq9XeBY5XtF7hciM0KEQIz7VHeDJ6ezOJUd8En1CZwmSZJ8QqX0ZStUmQzdgi77sTiTB/1XgRO+4CmJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPaVYALl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPaVYALl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742550604; x=1774086604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4YJkwwXKk5LxAbnKuu2FuJLNd2XqtTfaOBb9AEfSAU=;
  b=mPaVYALlIb+WNaHTE+u5UiBQU5vEUbPSYupz+APrdl4NZPKiZMIt1ENf
   N3he8RUvM5GPYP9lzheMIFaCRPUVyGqNJhET1O9sNciPkIpIgM2RcntgM
   ykOrAfpDFcld3l4Qsw5G7YJ0Mkjucbgs4/yHYv2e3AA2+c8KKUzrl6WaS
   o1pkNjfbC3V2bNlYdXTu05IJ2n1gRjrO3Fd0A5iZ8wdrVlV7Xa/0OJpRS
   Q7sZOIbSCS0VanHpq5/xxdV+T9PaRdTZUrYbWz5CffbGrOXusuHvGbaEn
   HmwG5kY+/FisFAZ/ln3iYyH0WRU5MmK+foKXUGz40tQ+mhAk7SDtRZ9Ud
   g==;
X-CSE-ConnectionGUID: YoptckSaR7CqCjJaY4uDXA==
X-CSE-MsgGUID: SgLk8zU6QLamCNkoUcvhEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43825218"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="43825218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:50:04 -0700
X-CSE-ConnectionGUID: mrEBkid5T/ivnxSyPrU3YA==
X-CSE-MsgGUID: azqtXJf2QEeE2ePZKnXOMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123379759"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2025 02:50:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvZ0q-0001F3-1O;
	Fri, 21 Mar 2025 09:50:00 +0000
Date: Fri, 21 Mar 2025 17:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 1/1] error[E0635]: unknown
 feature `new_uninit`
Message-ID: <202503211748.YLGi5KY6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   69e641afed13f4ee53e66be0464646d326f9b5b1
commit: e2e9fb9a3f56253c509500c951621ad8d5b206ec [1/1] Merge remote-tracking branch 'real-aosp/android-mainline'
config: x86_64-buildonly-randconfig-005-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211748.YLGi5KY6-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211748.YLGi5KY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211748.YLGi5KY6-lkp@intel.com/

Note: the android-common/android-mainline-rust HEAD 69e641afed13f4ee53e66be0464646d326f9b5b1 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> error[E0635]: unknown feature `new_uninit`
   --> <crate attribute>:1:76
   |
   1 | feature(arbitrary_self_types,lint_reasons,allocator_api,asm_const,asm_goto,new_uninit,offset_of_nested,receiver_trait)
   |                                                                            ^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
