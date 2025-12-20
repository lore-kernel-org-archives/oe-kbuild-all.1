Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E854727E7EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246245; cv=none; b=pzndMUABbZ9CpwkgpFHejfndgyz+KiYU77PkGIOhTQidqJadsdAj6lIIwTqsKMxhRD38najC9Pk7T1pFzaAV/iNG1ROfdQ2P8WqijpF2dTTEFyQPIYttuzUNX1SFa4lMndOBCT1l5kv8VRIFtnXbPcXuV3YFhhRoEj7PFO0XkdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246245; c=relaxed/simple;
	bh=syR6Hg9uLACiJsmpduVS7ohGP+f4y9vfeNemYUHPaHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=soG/ZMy4pxpZqxeangh6sEPaLh6wJez0rQx57e/kL+ERSGjVnhoI1QCvZqMhblVjMcm4+8kTtW0r1CgmWOVWvpl1p1aaethO3DrGtq715MCLHVpEK9LLc+IjSjK1EzsM1Wn9yBHXtirGK0CaOrr+sbYQ4kgV/fTBAyl6XeBdpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kt+JAY7B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt+JAY7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246244; x=1797782244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syR6Hg9uLACiJsmpduVS7ohGP+f4y9vfeNemYUHPaHw=;
  b=Kt+JAY7Bzr8EtqK+xOg3GBQkbe2AfULOpjGHr7hHLihrN1tjzwJDSmcf
   v/DmyoaKhPWtKCEGT93PpFFzP5I3dRwxXuX+OWy7sDLOscuxodMj2O1er
   abtPLJ2L2B7urquDsrmpJlZUHqfD3fDjcocy+y4kjvyHOc9AMmCizgfF4
   j7cy/0HeI1Gdzr433AtZPVplChACNQi3FtbzzqvO685Dvi0XO4L+t9evh
   BFQ6zvPhYhmQM9Q1N+4ISvVYf+ly62N9HkKpKTRKjLBBwfB06NOLedMEG
   p7QxYduOAlD42P/5nrLBPNpaXpFNqhXqgSVJfT0JiLJIzb45WFYs/WS2I
   w==;
X-CSE-ConnectionGUID: By8kMYg/RJ6kCW9m7NaxWA==
X-CSE-MsgGUID: zNS0rkayTFiIoqhleGly2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70748095"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70748095"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:57:22 -0800
X-CSE-ConnectionGUID: DiljvyOfQgOOKPk7NjbhZQ==
X-CSE-MsgGUID: Ngr1c1jiQt2rdLePQ3KwmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199642892"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2025 07:57:21 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzKZ-000000004oC-00xP;
	Sat, 20 Dec 2025 15:57:19 +0000
Date: Sat, 20 Dec 2025 23:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3415/3415] fs/fscache/main.c:51:21: warning:
 unused variable 'fscache_min_object_max_active'
Message-ID: <202512202356.o0JDRNMp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baokun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: c55fa11d134b40dbe1a4a5512a7fe43497cb6d5e [3415/3415] fscache: limit fscache_object_max_active to avoid blocking
config: x86_64-buildonly-randconfig-006-20251215 (https://download.01.org/0day-ci/archive/20251220/202512202356.o0JDRNMp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202356.o0JDRNMp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202356.o0JDRNMp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> fs/fscache/main.c:51:21: warning: unused variable 'fscache_min_object_max_active' [-Wunused-variable]
      51 | static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/fscache/main.c:52:21: warning: unused variable 'fscache_min_op_max_active' [-Wunused-variable]
      52 | static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/fscache_min_object_max_active +51 fs/fscache/main.c

    46	
    47	/* these values serve as lower bounds, will be adjusted in fscache_init() */
    48	#define FSCACHE_MIN_OBJECT_MAX_ACTIVE 4
    49	static unsigned int fscache_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
    50	static unsigned int fscache_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
  > 51	static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
  > 52	static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
