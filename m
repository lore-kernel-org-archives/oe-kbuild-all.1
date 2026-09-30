Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE53A75A3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790743504; cv=none; b=NnrpWH9zOUkV1GLwntt6bHKkyetmm1u9qpDiWs4rodRZ5rpUisiZC64GaKrDmDwknb6KImBB41OJItfSCVgq3NvU9a2r+Q4EhNi5Uv5zfdRtahPbIsa8aWlpXRQEy5wR42oXQTl5fph58D9g+6JgTv7CU1esgqIN2s6vMn2MpFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790743504; c=relaxed/simple;
	bh=Z/oxtnwo5HJ3NixpPGqQwD2x88ans9fGtgNoX/Mld1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lfauQZnMmzKxhnTa8eG1AUHnkpMi3zGTcf+8qLBKXCRZuT2ahW5ttvs4ciSoOj+0qDVehrWqrfcvdX0KMWXtYEBAHbv1xPPOXICgNBVYUiD56OrDh1Hbi2GIAd5UKRien7rIp3brFTWXax/TE5KWtFKbMG5vM2TRLMPUFdOGSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi2MR+Mm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi2MR+Mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790743503; x=1822279503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/oxtnwo5HJ3NixpPGqQwD2x88ans9fGtgNoX/Mld1Y=;
  b=hi2MR+MmdSY3HfkEZ5sad9KoUO7k+t5UkzmWE1Kk8UNbCYojy2G2Y590
   SXw0qzvUQcoqmTYIlsuNDG5cB3PBtXzw+vIfB35lnhy9+uu2zVpwPcNIB
   rPhsbTh2V94tUXrVb6VY6foCkcAY+Y9WhGETvG+Az/ZENrYAtGtMgtg3w
   glYshOLhyed+5FkhFKS2ZZKaujgkVvr5FsTPpjt4kk3AWrX3ph9lLAgOI
   5d/fCbtuRy5KQOXGdlSpmxFFFjUw0DDLnQH/xerpBvywqOSp/VD/ZN6Pn
   SV+q7n9Ky1e/1RGctm1+z0ZhLDdOmMT6fBPRyxN0EVNLgTUzwUPV6weew
   g==;
X-CSE-ConnectionGUID: y5N7gEhETbulJXLsrqFqDA==
X-CSE-MsgGUID: OUTLsKf0TS+W976FRgdDdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90334054"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90334054"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 21:45:01 -0700
X-CSE-ConnectionGUID: iHpVFfZcT9al1EoeChS3Hg==
X-CSE-MsgGUID: alBFQ5+OTHmACXZefbqdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="283666191"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Sep 2026 21:44:59 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBmBd-000000001kA-09D0;
	Wed, 30 Sep 2026 04:44:57 +0000
Date: Wed, 30 Sep 2026 06:44:00 +0200
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [tip:timers/vdso 1/4] include/vdso/math64.h:14:3: error:
 implicit declaration of function 'OPTIMIZER_HIDE_VAR'
Message-ID: <202609300626.zwNjKaO6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   ca46a07c4b68246c4e400ce3649ab7228a878d8f
commit: 37db375ad90467d7e3ce4e450b3d1c4f297d4ed3 [1/4] vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
config: m68k-randconfig-r2307-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300626.zwNjKaO6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300626.zwNjKaO6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300626.zwNjKaO6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/math64.h:8,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from kernel/ucount.c:3:
   include/vdso/math64.h: In function '__iter_div_u64_rem':
>> include/vdso/math64.h:14:3: error: implicit declaration of function 'OPTIMIZER_HIDE_VAR' [-Werror=implicit-function-declaration]
      14 |   OPTIMIZER_HIDE_VAR(dividend);
         |   ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/OPTIMIZER_HIDE_VAR +14 include/vdso/math64.h

     4	
     5	static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
     6	{
     7		u32 ret = 0;
     8	
     9		while (dividend >= divisor) {
    10			/*
    11			 * Prevent the compiler from optimising this loop into a
    12			 * modulo operation.
    13			 */
  > 14			OPTIMIZER_HIDE_VAR(dividend);
    15	
    16			dividend -= divisor;
    17			ret++;
    18		}
    19	
    20		*remainder = dividend;
    21	
    22		return ret;
    23	}
    24	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
