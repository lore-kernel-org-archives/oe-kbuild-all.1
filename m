Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35433987
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770770528; cv=none; b=Zd6kUlYaBjsak2jxd++a/b480mhsyPQ/hdBUPb/nIodMqYqsZRlCX9ipmeR7PIlWLzyTwxoYjvKqniJmfDHVLf8c5nbiLRH3o52CEDawo9USRqq1fpcegVhC0fg14CYSfJNETCR3Ar0XPetz2412O0CtRNiD5e16JQEsCGX8LMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770770528; c=relaxed/simple;
	bh=KrZdbwf3vW/6ekbDSEbfC6tRgs9QDXLJ2PdP+5wQZ5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYbZvivKXDM+8lyEEIVrNamgT2Vhx1kHDEa+/uFEUz7SxQUjHqouAK9idChgbyeCaCid/k071x5zxgqsYqt35m0+DHzYNbvwMqXJ2SqiHSjpi/hNULv/wCG+0FCuHoB5L5EnbnrryBZa2SMPiS9BwNiiAkH2j3Ir86s8kjSjccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlNcIk49; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlNcIk49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770770527; x=1802306527;
  h=date:from:to:cc:subject:message-id;
  bh=KrZdbwf3vW/6ekbDSEbfC6tRgs9QDXLJ2PdP+5wQZ5Q=;
  b=FlNcIk49pJbQoZtIJ9vZDII0qB5BJRocZVpjWL8XYh7DQDYoTJD/Tw/l
   qKDI5gGP/JCjkV+hQ4cgr59bkxWqRh0xeiZNbCGkI9A5q2xOCT/bUgExo
   JsT1sS4mBAP4YILxeoFn9lNVjNVFh0Qp0raEgVVrB2qwSCCdGjD2UvjJc
   MucoyiAKKSjCa9NfPrcf2fdsHyk/TUbXXvdmzu2i54CaWU4dF/e0ipX8x
   E8TAkOloYW8BFP8C/QR34sQ9dDYDaqtVNgZuflisk7wsGuAkCxMxwBg3/
   KuEnHVHzIL3bgF6UUtMgCp1Q62/afXe3HZTVVcmN+U9z7kYUuBnYEHI7q
   Q==;
X-CSE-ConnectionGUID: 8ORSc7K7TZiyUC79mxF6+w==
X-CSE-MsgGUID: hE4WGsSETG6TvzvudBRIEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72012294"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72012294"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:42:07 -0800
X-CSE-ConnectionGUID: Dm9VfcvkSLapdgtRK2CM3Q==
X-CSE-MsgGUID: Z93JO5t3T6CAb3rwoUqAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="235058143"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2026 16:42:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpyIt-00000000pXo-1xxr;
	Wed, 11 Feb 2026 00:42:03 +0000
Date: Wed, 11 Feb 2026 08:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 6/17] <stdin>:1630:2: warning:
 syscall container_wait not implemented
Message-ID: <202602110857.qxFJalpX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   ac4ec62cd4decf787406c1407f18ade110d80c5a
commit: 3445439bc23a673d813e0c9d2fd97745356e6f10 [6/17] containers: Implement container_{create,wait,kill}
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602110857.qxFJalpX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110857.qxFJalpX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110857.qxFJalpX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   error: include/uapi/linux/container.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/container.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1412: headers] Error 2
   <stdin>:1627:2: warning: syscall container_create not implemented [-W#warnings]
    1627 | #warning syscall container_create not implemented
         |  ^
>> <stdin>:1630:2: warning: syscall container_wait not implemented [-W#warnings]
    1630 | #warning syscall container_wait not implemented
         |  ^
>> <stdin>:1633:2: warning: syscall container_kill not implemented [-W#warnings]
    1633 | #warning syscall container_kill not implemented
         |  ^
   3 warnings generated.
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
