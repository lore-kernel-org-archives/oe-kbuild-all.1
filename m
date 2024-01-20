Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219751111
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 04:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705726410; cv=none; b=qGDn7UAo+1752ECFuQraLcI6smhpbHub44h4N6B5PhQfgq4yoTHCTwnjsuLC7O4oy5mVQKOlWKOgFxlclElEUNFVKImEnqlpE4o4x4AsuCD2voKZVhgELQoxWOAEkuRmiNoO4nNuk7kyQd0pxZL4TgXpw2To4dvJuUnQsLo1xE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705726410; c=relaxed/simple;
	bh=O+a3wq0ufZZj6CTy/2aXgE1cw/lbOOdZJpkiRQYhDwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FxfT55sJ0e4RifIgzzMIYvZTOI1DMM/flw8BzYM8e6EQdZeyHCBZsWJGB/TH26/hRuDJLiIiofx+LQbz8yCnIBEBZxh8Sd5T6BQdZqAzJHHakbbaBy6rKUzn3uHmGoelwQGHXhSJX10vfJSJsCqH7nN/iRXOpAE90TnmdtHL9Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0lIzI7r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0lIzI7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705726409; x=1737262409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+a3wq0ufZZj6CTy/2aXgE1cw/lbOOdZJpkiRQYhDwc=;
  b=R0lIzI7rLdpN+a9MANEbarlFb9IEbZuyIn4Y3znqb2rOP5pAtygCjnwn
   XZw4g4Z7AY9s5xdwHRzceMZBBtfndc7S3zTJiWb8JTQ+KU0bePxLAl3de
   3rs9VwnPWy3xtbGB12zyqBSTgI0fP3Kfs4p8/zOUy8KF3J05h1vI8ldHP
   O885dNZUKnD/uJQRiSWTI7tCXpH64Vr30kb7q3Z645USHFsP+VcsZtQK4
   HQJWhrnD45ympaTlT6V1xDp76HXsvweLpkwOSeIBBtSTtXnu9DbaOGrQ1
   1XFttwNWOTG+2bpzXu644tDN2nBqczZhswUznv07O1aYDXr+/a5yMwgQ8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="820990"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="820990"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 20:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928558441"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="928558441"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2024 20:53:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR3MC-0004lK-2m;
	Sat, 20 Jan 2024 04:53:24 +0000
Date: Sat, 20 Jan 2024 12:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 6/15] arch/x86/include/asm/processor.h:416:16:
 error: implicit declaration of function 'per_cpu_offset'
Message-ID: <202401201228.lBmoRWMP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   29ffb3695f4c4dbeaf110a752cee0d918e3b6519
commit: e68ec274b0f929ef4ccb4be27152a2464a103f74 [6/15] x86: Use stack protector with guard symbol if supported
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240120/202401201228.lBmoRWMP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201228.lBmoRWMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201228.lBmoRWMP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/processor.h: In function 'cpu_kernelmode_gs_base':
>> arch/x86/include/asm/processor.h:416:16: error: implicit declaration of function 'per_cpu_offset' [-Werror=implicit-function-declaration]
     416 |         return per_cpu_offset(cpu);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/per_cpu_offset +416 arch/x86/include/asm/processor.h

   413	
   414	static inline unsigned long cpu_kernelmode_gs_base(int cpu)
   415	{
 > 416		return per_cpu_offset(cpu);
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
