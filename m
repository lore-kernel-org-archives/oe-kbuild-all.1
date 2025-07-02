Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9A2F7CE7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483732; cv=none; b=mIYDnD/eH+k5k8sbCCL2Or77msejTCrQ85Wcs4hHgEnFEPT/LxZPX0/EhgHKJq158ItDJOCV3ob/iEaorxJwaoNP/3T7q78MftbAWK0kov889S9AwaWaWmGCdUI43kXmhuPPb8ya2TxEB2dPwHQuK7gF8xjVyMwmvwCsXPvLRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483732; c=relaxed/simple;
	bh=HRNMA0Uh64DJI6KnFUd9lfb0xqKkbqR3tHP/3+EmQak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/6tFWmTnTwHp8XsjoJ7ppWnjciz38lwzgqvgTNxG5eIpPu+2jDuQeIzYMjD3FVVj4agsVAJgzalNKjoPh/BWS3sCT3KYz9zgmDCzCxVAOOo5NrTLQwoLHvyrEzlTc8eeNDaAIr0/zzIG+jhocQNpmhGag0jghY7m4uoJW6MRgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlLSUobL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlLSUobL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751483731; x=1783019731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HRNMA0Uh64DJI6KnFUd9lfb0xqKkbqR3tHP/3+EmQak=;
  b=SlLSUobL6724sBV/AS7v7D/WTYEOurUnUWSIX70IPRLc5cJ6H1wQ9IX+
   dOKcac16pDmg7cs4I5Dwelh1wJOoRZmgPTAwaM19pgrQnHHNSgdg9VZbR
   erFoahW0S18AbGJPPYCO7sEFtdixFTVoWuQP9d11mIMJYSVyfAUi7Xo/Y
   9v7Jaa3s0jtw/f8rAe+P6jOaXBKBqiBkG6xfig5tH+sH3MOFXd5MTbobD
   iIMh+qtDFfDDbNu3xC23ex1HvTUNK4IR5XuqQxYlskGtW68meQJEj6bK6
   Uqu3GuYF5dU2sTPJaxsjadKzD/7xwYaCqLN97vAGLKoA8smMR60mudtoR
   A==;
X-CSE-ConnectionGUID: 8MmQWK/5RDavo2I9XYvoiQ==
X-CSE-MsgGUID: G1SDtvU+T4qyZSV7tc4ffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76343291"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="76343291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 12:15:30 -0700
X-CSE-ConnectionGUID: YMczgqn3TxaXzPrFc/i5jA==
X-CSE-MsgGUID: HmWkEbNcQayxW3SB7uAWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="185103910"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 02 Jul 2025 12:15:29 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX2vW-0000KX-38;
	Wed, 02 Jul 2025 19:15:26 +0000
Date: Wed, 2 Jul 2025 21:14:59 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 37/49]
 vdso_test_correctness.c:(.text.startup+0x2c): warning: Using 'dlopen' in
 statically linked applications requires at runtime the shared libraries from
 the glibc version used for linking
Message-ID: <202507022143.pVZucI5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   1d66824abdccea956a455fc694f5967c0163ce31
commit: 8cb2dc8e9b5a360dd41ca1df062e7a0045848c0b [37/49] vdso: hook up selftests to kunit
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20250702/202507022143.pVZucI5r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507022143.pVZucI5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022143.pVZucI5r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_correctness.c:22,
                    from lib/vdso/tests/vdso_test_correctness.c:3:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_config.h:61:20: warning: 'versions' defined but not used [-Wunused-variable]
      61 | static const char *versions[7] = {
         |                    ^~~~~~~~
   /usr/bin/ld: /tmp/ccdIzxl4.o: in function `main':
>> vdso_test_correctness.c:(.text.startup+0x2c): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
