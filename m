Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A713FC0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 11:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750591660; cv=none; b=Zrts479980lXKNxca9KcEEU5QbxUUGV/VwTwUBvBjbf55F0CxXQKTrc08DGezgxDuhafd0Z3arHxpWUIWLufu1Ri0o7LWa21sH4scWtArzScczKuN2WyLFLu80LBtXg7DxZZv+lOu8mzoaEuCKAg3V8gA1hKUQ+uw3qXFMn0now=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750591660; c=relaxed/simple;
	bh=jHJ4clKGrU64aTEFgCbN8NZDX11gJtaZmbq6PuhTzvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qs3Tr2yYFfjvzRuXjdzyDLIcwtOVZo78uRX650sVmq/9JHAt0CZDHvepJ4vzsEcL/WxVFM5bn2fRMwNETj5YWVF68qLb5Ga5TcY/XtGsfxH0V60m6bKnSb+7lUyWDgUZMYK+ajw/12A2ZsSL2u7q3W6OaTc5+MmwXeEkHPNTKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJ1u7oAq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJ1u7oAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750591659; x=1782127659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jHJ4clKGrU64aTEFgCbN8NZDX11gJtaZmbq6PuhTzvg=;
  b=lJ1u7oAqX2sV5lOuvB765fq+D+bm7uUDuCffNyzDs0xwQuTg2pzodN92
   eNt4izB85CBHi872f9TiT+lap4jpEfHohTBKuEjsBM/axA6Y7vV+WBVUI
   p9cqXGXUQOsHo4tMChcyNmVuTvsl1pAdsZ2Q8GLmKBhpHB5NamBTNVi7e
   QaecM5FH3SnhHMRVsSTz09xOXDHzJcBQocsp8IMA2mqClZeX5B6pX8ISp
   2JWBrQs5RyV9LOhQlMaqQ1j4tUP3WTX5C9l5HEkOVLxa2jY5h6rKZHefF
   BiF0B7kL4AVUmAmdQv58lIq7L0opHp/bwJTolFUv2yPyyG0LWQ4ZX5+5w
   g==;
X-CSE-ConnectionGUID: mTBQEaNQSHib3DCSRMtmXQ==
X-CSE-MsgGUID: dXHJNE6zRoGezyoMzN6E1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="56473108"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="56473108"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 04:27:38 -0700
X-CSE-ConnectionGUID: iNR0h5NnR/uV1EFb7w9ILA==
X-CSE-MsgGUID: +J/RXa05R9eSTyJ5DC9g+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="157127929"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jun 2025 04:27:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTIrG-000NEo-0h;
	Sun, 22 Jun 2025 11:27:34 +0000
Date: Sun, 22 Jun 2025 19:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 37/49]
 vdso_test_correctness.c:(.text.startup+0x2c): warning: Using 'dlopen' in
 statically linked applications requires at runtime the shared libraries from
 the glibc version used for linking
Message-ID: <202506221928.o1isX5KY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   7c2a5fb4d342d9fee958d8881e69704a964a7982
commit: 8cb2dc8e9b5a360dd41ca1df062e7a0045848c0b [37/49] vdso: hook up selftests to kunit
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250622/202506221928.o1isX5KY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221928.o1isX5KY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221928.o1isX5KY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_correctness.c:22,
                    from lib/vdso/tests/vdso_test_correctness.c:3:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_config.h:61:20: warning: 'versions' defined but not used [-Wunused-variable]
      61 | static const char *versions[7] = {
         |                    ^~~~~~~~
   /usr/bin/ld: /tmp/cch2AeN4.o: in function `main':
>> vdso_test_correctness.c:(.text.startup+0x2c): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
