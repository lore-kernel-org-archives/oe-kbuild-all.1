Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512413AF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241973; cv=none; b=Xr7tYPSfIT7jpnLZ5eI3rvjFe2D+PumfDRj4NWvPycsdsGvNDwVF/9pIasKdZ4Qo3RpPBaGizliO7mNvOzcbRXfp9FV7bhvTv2KkJGYwI2e00njbxmWsR+UswvqCa7vMi4mfhRP5J7K0wsmSEwc1sS+atu+tUF2jrepnZhTl7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241973; c=relaxed/simple;
	bh=teQF578L67rwIC7OnjyfaI1viH8z3gmM44mCrOBZ5HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8E4cGU4UlmE4YNG1XCLxVPNc63sKSzIpdHETzOEy+t6VPOBptYdZ9z+nUCaThdSwbhNUWYYKNtJFn45P8cNbfDsx4lauFxvumarrISqv/P5RdOLHwH+3q1KnGtzqUPq7vwzyyOe2cLK8PYvCnmLZQaV2HuKKMnPfm4MSY3TFjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRiipQPq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRiipQPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241971; x=1797777971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=teQF578L67rwIC7OnjyfaI1viH8z3gmM44mCrOBZ5HQ=;
  b=WRiipQPq8KqINujKwFMf6XoI3+gqB8YydNKXZD6yjUzQk0fFK4taT27g
   lzhq8W0cCyyV/U+EWLxQfA3GiXWleNkr5Pz+UEo/pUST3Sgg8qRvtcxdE
   y5egGhDYBnPCgZZ6t3GGKw22EPGRe6wW7VZUfxU15E1Ghg1BS/V4A9Ofe
   ek03ZWPiICOgOmXluMAy7lSA1zW+LF/nmboUmFpnTgWD5tdEZwuPrVaDN
   hwGECVVb7AKmRFiQ2yirzoyu0rDgN4p3mbX/4RUXUd4mQKPboSrsCq+ny
   C7k1y91feGcwTrG+wTbbdTZobVM7DeKspRfGgjwJ/jrDBbaiquILI/bkj
   A==;
X-CSE-ConnectionGUID: ZBiph0ujTkqdNRyyZGA3eQ==
X-CSE-MsgGUID: m2lfoiX0RFukTB16j5cKDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294949"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: bzpzg4FBRtSxBX+/70YYjQ==
X-CSE-MsgGUID: ABnKrK5QQMS0cCG0QCQZgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986992"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004g5-25QF;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:kerne-unload 6/6] include/uapi/linux/bpf.h:13:10: fatal
 error: 'linux/trace_pritk.h' file not found
Message-ID: <202512202217.XxN9OWu6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux kerne-unload
head:   04bdfeb9b9df4788222284b4c6ca893be2634104
commit: 04bdfeb9b9df4788222284b4c6ca893be2634104 [6/6] drop trace_printk.h
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202217.XxN9OWu6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202217.XxN9OWu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202217.XxN9OWu6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:7:
>> include/uapi/linux/bpf.h:13:10: fatal error: 'linux/trace_pritk.h' file not found
      13 | #include <linux/trace_pritk.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +13 include/uapi/linux/bpf.h

    10	
    11	#include <linux/types.h>
    12	#include <linux/bpf_common.h>
  > 13	#include <linux/trace_pritk.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
