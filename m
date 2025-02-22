Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A351F3FD0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740261061; cv=none; b=AuvqCX57A9yuyLIas29InMHylV7f+hZ98f3Pq7xep8kkd6GjWob46vayE6dwiDDFDM490N6D0/v8tZ77dZ5ss7Tf+0Av8VnqVrqAjTFWOAnvsWP2i9IzHhQelhRm/ZXX4zB3Le8mLo8Ype8ludzYKy6Zkk61M4KmIinXOxxfOXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740261061; c=relaxed/simple;
	bh=2R5qujEEloH0J2WeuDV5YEE25FIBC13XpHPe5Vs356o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXRqn0FH21QsjECTtPTA1Tjy0Nr8LarYtpl/k0VMvOyUYKv8i9FUnpgffJ3twoHsqqdsKeY/esKVrAMBqR+HXJwsImqG3JoqyrxHFWc5TStw0T0plzBXzFQOlbRdl8PZv6aibeFrfREi+ZyD5k0NNNAUB0XCyLU2cp46hljjfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sfb0Bsmb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfb0Bsmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740261058; x=1771797058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2R5qujEEloH0J2WeuDV5YEE25FIBC13XpHPe5Vs356o=;
  b=Sfb0BsmbliRaVTE6ZEtBaY1nkScfzggVumcTBMtbPD0N1z25NfkBbCjm
   bkcLPs5qMgYEJyzB+RuIpOZEGxRR30x/YBwtll1tp+/dDTpNGbiacvJwr
   SeF3e/m3hHNPoqNM50PgdHd0KD3yTNyblKIwZ/pGppV/EGQq6QhRuizH/
   Y/bz3qjK4r1EuyzIcwymmvUs60s2j1cyIx+tpISXNw4dvpO4CYnot5sVA
   iKad5mhMzhpnwbhSipBGV0+S4KZerfs7xdd5tcbo3CYT4dVVvKS54mff6
   pPy9ctsi3N4FjTK9T7nYWpf30fR0r0ycFIEFCPTT8AKQ/HfPbugadfIuj
   w==;
X-CSE-ConnectionGUID: MVasq2gjTdazQCHqZEzqXA==
X-CSE-MsgGUID: 9X9FCkXKR8iVAMGr5kCKrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="52457529"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="52457529"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 13:50:56 -0800
X-CSE-ConnectionGUID: T4SPzZQYRDOOJZJBKAc+Ag==
X-CSE-MsgGUID: 3/KA3k9USNm8V5cAB7eykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="116206478"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2025 13:50:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlxOe-0006vn-1Q;
	Sat, 22 Feb 2025 21:50:52 +0000
Date: Sun, 23 Feb 2025 05:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: ERROR: try to enable LD_HEAD_STUB_CATCH config option
Message-ID: <202502230551.b0qoNRCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff202c5028a195c07b16e1a2fbb8ca6b7ba11a1c
commit: 5270316c9fec8cc99aa0e0a258509c5c7f789d12 kbuild: Use -fmin-function-alignment when available
date:   12 months ago
config: powerpc64-randconfig-r052-20250221 (https://download.01.org/0day-ci/archive/20250223/202502230551.b0qoNRCG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230551.b0qoNRCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230551.b0qoNRCG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ERROR: start_text address is c000000000000700, should be c000000000000200
>> ERROR: try to enable LD_HEAD_STUB_CATCH config option
>> ERROR: see comments in arch/powerpc/tools/head_check.sh

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
