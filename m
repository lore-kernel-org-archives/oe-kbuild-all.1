Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F425F79A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830349; cv=none; b=mfh+2jjzqX5OdXQPsIDR7AkGVYNUJ0qDLmpNxC+MTc8GAtb5+aYJPoCHMhOz1rzZ1JnltPeaFu+ye7p23QOfpPaMtCpsOrOC3cUAvnIfOh+n4++zW6xpv6ueZFshYnbTHT2wTYMNcCLJtPueuLC+uYmM53g1C8YLfb7yEx0qLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830349; c=relaxed/simple;
	bh=SN4zdohWl+f2WVfWjJXdW5/SDruKtX9HWxzDAnL2lHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hf2f+CTwkxUe33fDHVpdBMrhx6qmXgIq2G76jjttbsWaUN+UoJZ9aPfsckL9zVHRNqm0BC21El2yehsCHs3ynHTA1uQVEEavv+VpE48XktJuCLuG/lThmAJIoOHqd7Ov2yq3LpRuxsRcg5ctQVuO2DtXwpaJzFnOs+Usyn3GCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VE1ne1AS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VE1ne1AS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746830347; x=1778366347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SN4zdohWl+f2WVfWjJXdW5/SDruKtX9HWxzDAnL2lHc=;
  b=VE1ne1AS/bd3YeFOHqF4dQ0GI6rF6r9fzemhFQ1N+b2ZpGVPXXWtR9Ht
   qneSUOMThoMNbFNB9H0uUSJqniREeq/ZXPl8hHpEe0Hq5Wp7nMpxTDnZZ
   zlC0O934aa9Qf/xN3bBkAXf+441y34p6w3VSB/LuSzAUY5ropqMXk5AFZ
   0VsqC6RdQr0g2ilWwOXCPmPWFQBFJlnOm2MofZZwETIJ3OfNuXJlsW7ed
   mWzU1boKrz187x22MRXSonfNLbicjBYltm6GFIUqwvhFoPQGjU2FcQT69
   AWRK8Q8eCkhhnEIdMKjSOxsb3PLqoAempavjcW6wtsf0shoVbUh6RtjsY
   A==;
X-CSE-ConnectionGUID: e1xVUTWtQR+DWi2ypqN2bQ==
X-CSE-MsgGUID: n0YS3VPaS1WOOR1stnTXzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51332037"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="51332037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 15:39:07 -0700
X-CSE-ConnectionGUID: p69aYkqWQsi+XYT0Mcir4g==
X-CSE-MsgGUID: sRA58C+hTESNeKWtNX2U5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="173918463"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2025 15:39:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDWMx-000CXv-1d;
	Fri, 09 May 2025 22:39:03 +0000
Date: Sat, 10 May 2025 06:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-v4 26/27]
 include/linux/compiler_types.h:557:38: error: call to
 '__compiletime_assert_674' declared with attribute error: BUILD_BUG_ON
 failed: 1
Message-ID: <202505100636.9S4swc9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-v4
head:   5731383379ee882b2a7f7c82f36939a9f4e52fda
commit: 28491e22c921e270365748a18c6197eb103764c5 [26/27] arm64: Kconfig: Enable GICv5
config: arm64-randconfig-001-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100636.9S4swc9b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100636.9S4swc9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100636.9S4swc9b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   drivers/irqchip/irq-gic-v5.c: In function 'gicv5_irq_domain_translate.isra.10':
>> include/linux/compiler_types.h:557:38: error: call to '__compiletime_assert_674' declared with attribute error: BUILD_BUG_ON failed: 1
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:538:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v5.c:579:3: note: in expansion of macro 'BUILD_BUG_ON'
      BUILD_BUG_ON(1);
      ^~~~~~~~~~~~


vim +/__compiletime_assert_674 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
