Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EAE211C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714588564; cv=none; b=lU1gj4o9YTs7ZeVbg2E0EASwAyC5Bvd4LJZ7Fc5Um5UQtQR32qpihOJzwcCWNoUcqhaFkcxk4LD+DYg6ngDj/VPNn3Zl541nSsIGsAcc8ACLMs299riswvPSwjj2lhKX7gO5XwqJxEsgiGSpyL3TWB266z3lljk46l8UHojKdSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714588564; c=relaxed/simple;
	bh=fo1f9AB8D5Cj1qAC6ZIzrtl5lB4y6KS5yFM3QpBpDmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtAoBVbtYpy1zppN26mmUsrI/ApnWU/AtNqKWtihmLvL5kBsIRhe4JEkCxve7cA7S06roQP+/xGHElZT5Dy9VIvlHPZ5XVeZx8i6i2fyMkUn014GtZY1bYd5fJCGWZvZUYM0iGp1t1Ys2QD6/b8iWc/+9jdtTZsF75j/vr8vHmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKiAzmkL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKiAzmkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714588562; x=1746124562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fo1f9AB8D5Cj1qAC6ZIzrtl5lB4y6KS5yFM3QpBpDmc=;
  b=kKiAzmkLwbbbRGGwc6unzgmyaFF6oTh62OXejANaYWM/8gzbGBYamAJI
   FfPwgT2lL7IGPUlfwNP/rS1g0BYiOniTJNrwxwh2Hy2Z/vGvc+O6eQ6z7
   L7vt0jaY8b7NgnBYWksAJgp2dJG9VCay5DYBN4CSkq8TLOyQNX58Irzr7
   qpFD+7RnPDTF/WWWmQcVlJm8yOydVsrBHRHqh/tkECZXjIxhRcW1qneKO
   b1d5SnjF3v3UM6Lp+mDW0A2BLsEI9/2TJfKnwaRziJkMYCyIXhaB3VtsZ
   yTTEk3fwS639ZZkEFm/+jdCppEo3IqYmalhlAVVBcaGvfLxsu+mx6x6Tk
   w==;
X-CSE-ConnectionGUID: MUgxs/vZRxat0cD1c0n52Q==
X-CSE-MsgGUID: 1RkJsC6LQDCweUX+NNll6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10264250"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="10264250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 11:36:02 -0700
X-CSE-ConnectionGUID: ov4m/6UfQySmQCXAdd04qw==
X-CSE-MsgGUID: UU50lK/MTLaSWEE4+wUmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="26914404"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 May 2024 11:36:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2EoA-0009tU-0S;
	Wed, 01 May 2024 18:35:58 +0000
Date: Thu, 2 May 2024 02:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:master 8979/10134]
 arch/powerpc/platforms/pseries/lparcfg.c:189:15: sparse: sparse: symbol
 'boot_pool_idle_time' was not declared. Should it be static?
Message-ID: <202405020233.DULp9nru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 9c74ecfd0fc46e2eaf92c1b6169cc0c8a87f1dc2 [8979/10134] powerpc/pseries: Add pool idle time at LPAR boot
config: powerpc64-randconfig-r132-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020233.DULp9nru-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240502/202405020233.DULp9nru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020233.DULp9nru-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/lparcfg.c:189:15: sparse: sparse: symbol 'boot_pool_idle_time' was not declared. Should it be static?
   arch/powerpc/platforms/pseries/lparcfg.c: note: in included file (through include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, include/linux/module.h):
   include/linux/mmzone.h:2013:40: sparse: sparse: self-comparison always evaluates to false

vim +/boot_pool_idle_time +189 arch/powerpc/platforms/pseries/lparcfg.c

   188	
 > 189	unsigned long boot_pool_idle_time;
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
