Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B81B413D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748317344; cv=none; b=BK2JhKtp4nhvA/jxE+Xrbm+nRwcYEMb7p0+F2N3bgNlS3ckhCP0hfpNliGrNknLat7oZIRzFnCPtylZknYojPh76iQEMQDzuj2oKjgAMv1srGQVlTZ9b6+MJyvallvgB+iU82jdv61fzFC7S/S4eDEjA2nBjIqboL5jXp4D9f3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748317344; c=relaxed/simple;
	bh=Wmyn531Tf2TTv+Ecpk+FB7W7RXg3tj8kYtaffpe8EL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzUHJVDe+DvKj0zQeU2Ah3c5oO0rv5rJ5TIU3xMq4VCx2EHSxM+fuYip38XNk0C++cInUdc8YdLHVTpS1q7F0ItJBUKP2gas+52q9/L/In82Cfmh9sODi7d4uYqH0x+V3n9HYAd+qpyKuWzjfi4TK5OtM7E22uJSa6zn2bzIXqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3DfwDug; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3DfwDug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748317343; x=1779853343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wmyn531Tf2TTv+Ecpk+FB7W7RXg3tj8kYtaffpe8EL8=;
  b=E3DfwDugoRxN38tyZLRdRGvkOn6bXtrLoR9NhGC6NyTsnIED8durRxcc
   UF9HvuStQ+ULSh7IKF0WZsKKI+wwt57P4IOnKxdkHvEcaF0FoaNniFS1L
   wWun5PFPXJ7tE8yQ3Lz5qApOCW7ntvhH5/C92BWjh5GQSib4VpFGhMl5o
   lU7AVfAfOYizSahnFx8GYNes5a2LiLd/3cChZlyjY32XkNUePRJmPkobA
   SSDek/wjYSrNfXON08jtwuTib5NvYFqW3JwTLg1Psl1C7rEuGyxctDrcV
   H/27tpZLz6PETzZmoLsOK1SgAJ8eJ2sVkKF9GEjl6Qmtrteo420NFtJDq
   g==;
X-CSE-ConnectionGUID: zY36UsZYSwa5XJsPvRgPPA==
X-CSE-MsgGUID: lKHkJiyHTnGQp3xoqfI3og==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49541488"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49541488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 20:42:22 -0700
X-CSE-ConnectionGUID: VqPRiFygQNCzAf8RFRrs1A==
X-CSE-MsgGUID: 1IJsDkYZTHq++0QagcCNgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147500507"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 May 2025 20:42:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJlCk-000Srq-2N;
	Tue, 27 May 2025 03:42:18 +0000
Date: Tue, 27 May 2025 11:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 8/8]
 drivers/gpu/drm/drm_modes.c:772:6: warning: comparison of distinct pointer
 types ('typeof (mode->clock) *' (aka 'const int *') and 'typeof (num) *'
 (aka 'unsigned int *'))
Message-ID: <202505271145.ki3Qds5a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c91b41e6a4cc972b62dc7c0f433436091b4028e5
commit: c91b41e6a4cc972b62dc7c0f433436091b4028e5 [8/8] drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250527/202505271145.ki3Qds5a-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271145.ki3Qds5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271145.ki3Qds5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_modes.c:772:6: warning: comparison of distinct pointer types ('typeof (mode->clock) *' (aka 'const int *') and 'typeof (num) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     772 |         if (check_mul_overflow(mode->clock, num, &num))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:88:15: note: expanded from macro 'check_mul_overflow'
      88 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
>> drivers/gpu/drm/drm_modes.c:772:6: warning: comparison of distinct pointer types ('typeof (mode->clock) *' (aka 'const int *') and 'typeof (&num)' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     772 |         if (check_mul_overflow(mode->clock, num, &num))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:89:15: note: expanded from macro 'check_mul_overflow'
      89 |         (void) (&__a == __d);                   \
         |                 ~~~~ ^  ~~~
>> drivers/gpu/drm/drm_modes.c:775:6: warning: comparison of distinct pointer types ('typeof (mode->htotal * mode->vtotal) *' (aka 'int *') and 'typeof (den) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     775 |         if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:88:15: note: expanded from macro 'check_mul_overflow'
      88 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
>> drivers/gpu/drm/drm_modes.c:775:6: warning: comparison of distinct pointer types ('typeof (mode->htotal * mode->vtotal) *' (aka 'int *') and 'typeof (&den)' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     775 |         if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:89:15: note: expanded from macro 'check_mul_overflow'
      89 |         (void) (&__a == __d);                   \
         |                 ~~~~ ^  ~~~
   4 warnings generated.


vim +772 drivers/gpu/drm/drm_modes.c

   749	
   750	/**
   751	 * drm_mode_vrefresh - get the vrefresh of a mode
   752	 * @mode: mode
   753	 *
   754	 * Returns:
   755	 * @modes's vrefresh rate in Hz, rounded to the nearest integer. Calculates the
   756	 * value first if it is not yet set.
   757	 */
   758	int drm_mode_vrefresh(const struct drm_display_mode *mode)
   759	{
   760		unsigned int num = 1, den = 1;
   761	
   762		if (mode->htotal == 0 || mode->vtotal == 0)
   763			return 0;
   764	
   765		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
   766			num *= 2;
   767		if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
   768			den *= 2;
   769		if (mode->vscan > 1)
   770			den *= mode->vscan;
   771	
 > 772		if (check_mul_overflow(mode->clock, num, &num))
   773			return 0;
   774	
 > 775		if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
   776			return 0;
   777	
   778		return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
   779	}
   780	EXPORT_SYMBOL(drm_mode_vrefresh);
   781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
