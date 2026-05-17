Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC41B81CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 04:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778991738; cv=none; b=CngxP3Ih1mOid6Wbm3p81hDQu9ItcNLiN71mr1++4UTWpe9uhXufVo/M3pRdDeX2dTcKKs3x9ORcRIfeiqRk291/kH8ypNxyuz57Oca1J3QUqKqWNCuqOyYQUVCOfh1zJ21B5cZJD37kkMoHIGm3piE/9kDE0LkvaBQPgfMx7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778991738; c=relaxed/simple;
	bh=gNak+dyUGcBUaRn05JzheHkXmanBYuAu6sdPE0zl/e8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jIziGtIpN+mif3mf2GIFKy9hSSdkYF3hSFhUS4EaWhOsW5AEQ2OV0VRBOaSQm8IEK58vX1qhXY8vvMd2IAvcU+zrmvusxCRNr/1TD4/L73cT8AMrZuYRWKVfvJ3+8glqyEa1idFP4UgXm0IJIUI0GZ76DKbWxLSd6ZBicVDl8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOlJS8/9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOlJS8/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778991737; x=1810527737;
  h=date:from:to:cc:subject:message-id;
  bh=gNak+dyUGcBUaRn05JzheHkXmanBYuAu6sdPE0zl/e8=;
  b=ZOlJS8/9+lHBc0dU+bp7q9eQGajm4NM7danLO0d7UVQrHcHJMDsNCji8
   NmCsXW1J/YCa6Q+dKlxyAtzL9GzecIT6Wg8tEwVvh3mjQkgHc12P/bDjS
   MtPJCDWrPGqRwx3MESY040UbvF3EAbzuqPE9/w8tcK31nNKYKVlhoLuTA
   ZY+ZEiC5DqbCcQ+mYRrZx3GU7A4FVlCFzeOwKqf/93L8Iy5L7BLy5v0vG
   lJFfgPum/co8yUuHKIXHY3wc3q/+NEBGEWBHQnBmPLjLcPpDBrvvvCBa0
   eKc/fpM07Vz31k9htZHkRRKLBfD7LViFBgSaiqGAX/ehP/Na/BRARiYIg
   Q==;
X-CSE-ConnectionGUID: RTZKHAaWRmy97FZDLz2HEw==
X-CSE-MsgGUID: pV+e0U+oR1eO+FeXYq85cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="91278214"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="91278214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 21:22:16 -0700
X-CSE-ConnectionGUID: qnRpwIUXR7q44d48jdGa0w==
X-CSE-MsgGUID: 6KmabcsfRZeo6yTYR7CiWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="238104358"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2026 21:22:14 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOT11-000000001Lu-3s3y;
	Sun, 17 May 2026 04:22:11 +0000
Date: Sun, 17 May 2026 12:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.2 31/37] ERROR: modpost:
 "sdca_asoc_q78_get_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
Message-ID: <202605171213.E6PFGg5B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.2
head:   e0014849e9af1e08aaaf2b7bc26b1918d8275f24
commit: 5d9cb740cd38fa17247b4a62af135901fa5c4d9c [31/37] ASoC: es9356-sdca: Add ES9356 SDCA driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260517/202605171213.E6PFGg5B-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171213.E6PFGg5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171213.E6PFGg5B-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sdca_asoc_q78_get_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!
>> ERROR: modpost: "sdca_asoc_q78_put_volsw" [sound/soc/codecs/snd-soc-es9356.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
