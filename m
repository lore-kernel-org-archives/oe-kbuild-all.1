Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54270254AFF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779987952; cv=none; b=l6VqBLHkvKPc4c0vIerTYflIMSAf8s3e/raGTVIQnWxbzxgvqzXPjKGxzDGE2e2ubLgLb3YHaQioRyypeFnGQ4TzHgtBjmkSzsq83EAOEcoWUe/qelhRD2wL/LVwWRFxF301AMEiheGd3Qsp5FR+kLHjhpP73W0yiE+Vynj3Q+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779987952; c=relaxed/simple;
	bh=bYXc1CDQyKWv2aNEHABOAIhFaKHVmx03Jz0HJu4qtwo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R17mmAXcR8owuCnsJCDGI3QQ3KnZCuL0WuTPc/um8YDoXW1Uuq5hJyiViBZHgquXy17V7vsZIz+4eSezqZDv2LIm4l/6jdlKRrw3LbrxREVOfas9261XMYWyGX/ry68qMP1s9zPcUnube/CX8gf+JKIWIxbFTt7sPIE/8G9p2YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEKsn80X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEKsn80X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779987950; x=1811523950;
  h=date:from:to:cc:subject:message-id;
  bh=bYXc1CDQyKWv2aNEHABOAIhFaKHVmx03Jz0HJu4qtwo=;
  b=oEKsn80XJOGr0CroOCDcvFNOFMUy1T8nW3+mIouvnR45jRKLcYa9ewOa
   e2cCUcBFSlodvF6uZkoLKAHnv4vp6zX/LmrxM/tj5y4hSNWY44gl0uuYJ
   Y1OAgi/Cro2OjW1UkImnrN6yNHXV1yyFImNWwbEz21hESntg/lxBpkSt1
   IzSfwJ9iyAJD3iIZB7wM9Bn5rM5twAd0ihmE1tSZmN8ORM7xeBMUTgq8Y
   dIUaC1Y7GRbHC1ZUp3afn7LIAbzHJGCKQrnX9rEdKEA7P47Z3c7OQ1vfU
   gXSPGtHoXBX5QchHdPUiKfhXeK8f9pHhxQ3aP5j8B8TZ4l7tBvC8VkeuN
   w==;
X-CSE-ConnectionGUID: oNv1blA2SISvRrONXlS/Pg==
X-CSE-MsgGUID: BvSx6BRtSB+vEUwFNnRYrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="83413024"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="83413024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 10:05:43 -0700
X-CSE-ConnectionGUID: 6o43GLd4SrG1Z1pXgMdr5Q==
X-CSE-MsgGUID: ZSa+ulnWQ66eQwhqE5Zp8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="240039296"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2026 10:05:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSeAu-000000006C0-1lYI;
	Thu, 28 May 2026 17:05:40 +0000
Date: Fri, 29 May 2026 01:05:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 16/23] <stdin>:1636:2: warning: syscall
 rootns_kill not implemented
Message-ID: <202605290129.Fy8GTS0x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   0026164101f5eaeb1e2394b381d1c3863faeb79d
commit: da83f86c3cc6d1e45d3612acc20e200409a7f196 [16/23] rootns: Implement rootns_kill()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260529/202605290129.Fy8GTS0x-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290129.Fy8GTS0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290129.Fy8GTS0x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1630:2: warning: syscall rootns_create not implemented [-W#warnings]
    1630 | #warning syscall rootns_create not implemented
         |  ^
   <stdin>:1633:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1633 | #warning syscall rootns_wait not implemented
         |  ^
>> <stdin>:1636:2: warning: syscall rootns_kill not implemented [-W#warnings]
    1636 | #warning syscall rootns_kill not implemented
         |  ^
   3 warnings generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
