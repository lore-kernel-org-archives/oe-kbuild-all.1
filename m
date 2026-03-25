Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0418D636
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 12:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443158; cv=none; b=o8C9H5zIgeVSz1ID6o/4cIyl8ztT6BsEaWyjI1LyAPctcgj/SADGnhDTC6u2jUrSInRJdLB+ywgzUdzueTS5Wg+5kUVxfLYxIE/89FFy8LgjNFVfBSops4Guz425RRHTmYV4mTft+8CVVpn+zg8Mh06YHRdlzvExUgTWjkoSDGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443158; c=relaxed/simple;
	bh=RVCb4WNUH4ZLQFWYy8exP+Bz3M2wzIVpqllh3M8xU0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhbMmb2chyJ96JRy9+NTf9Gn/n9SY7D4LFELThMapRNkBNzDE5lLsEVPh4Fh9/wdzPDaMNtg9sCwgvMsT9xB4feY+oY9egor09Ac2eAR/lK+NJ4OzPdHxDV08XZ1sknzreuSBx2TBSkle0Rqfw7IZLBLWTzp+9EHqqY8IyZvSrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJSqfJPn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJSqfJPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774443157; x=1805979157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RVCb4WNUH4ZLQFWYy8exP+Bz3M2wzIVpqllh3M8xU0E=;
  b=FJSqfJPnlvmHws5UejVmC6DxgfMVCH93CXlRR+E4kfe0p3TZlPMXOTAQ
   oNImBMQ0ZWEZAXkKCVD9cHALDsdSnj69U8Jd0StfbaHwquIS7jVK3USmU
   t6gWSjsk+6VXKSgoVi2rU+aADSeVR+JDPfOCpcKJcAYC8h4NmyPVJ/lSP
   3zxmlkXigMW5At3I8I/ClJ+8LdCGScYBnUEeeK1ONWUG9ES9Kd2ubR5gC
   XfnlZ5AI90A/iNKC0OtZ40tpE6zxuewhLjOtzzquI8HdTuQVRm8dWhfEK
   QrXCL9DjYYgBjfCgGU9+ag4xwIRRPnrN5Nh7+3x8DqcXR3L0ozMI0HlYi
   g==;
X-CSE-ConnectionGUID: IPjKPDa/Rw2yts9hMCxHCg==
X-CSE-MsgGUID: aI+vCnLqR7Oz2JBkqzAPlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93055377"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="93055377"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:52:37 -0700
X-CSE-ConnectionGUID: ODRHO7rwQ3iuaKdTuKTzEg==
X-CSE-MsgGUID: UmQdDbavSoWbzhlAVZ0p1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224932699"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 05:52:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Niq-000000006qL-45Gq;
	Wed, 25 Mar 2026 12:52:32 +0000
Date: Wed, 25 Mar 2026 20:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: hamjin <jinham@qq.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hamjin <jinham@qq.com>
Subject: Re: [PATCH] lib: typecheck: initialize const variable to avoid Clang
 warning
Message-ID: <202603252052.cM1GQIHa-lkp@intel.com>
References: <tencent_274FD06231C70768C2C28FD13673A24C2B08@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_274FD06231C70768C2C28FD13673A24C2B08@qq.com>

Hi hamjin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hamjin/lib-typecheck-initialize-const-variable-to-avoid-Clang-warning/20260315-165617
base:   linus/master
patch link:    https://lore.kernel.org/r/tencent_274FD06231C70768C2C28FD13673A24C2B08%40qq.com
patch subject: [PATCH] lib: typecheck: initialize const variable to avoid Clang warning
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260325/202603252052.cM1GQIHa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252052.cM1GQIHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252052.cM1GQIHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/lowcore.h:14,
                    from arch/s390/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from arch/s390/kernel/asm-offsets.c:10:
   arch/s390/include/asm/ptrace.h: In function 'user_mode':
>> arch/s390/include/asm/ptrace.h:224:9: error: conversion to non-scalar type requested
     224 |         return psw_bits(regs->psw).pstate;
         |         ^~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +224 arch/s390/include/asm/ptrace.h

952974ac61f686 Heiko Carstens 2010-02-12  221  
afa8fa52a42c31 Jens Remus     2025-12-11  222  static __always_inline bool user_mode(const struct pt_regs *regs)
afa8fa52a42c31 Jens Remus     2025-12-11  223  {
afa8fa52a42c31 Jens Remus     2025-12-11 @224  	return psw_bits(regs->psw).pstate;
afa8fa52a42c31 Jens Remus     2025-12-11  225  }
afa8fa52a42c31 Jens Remus     2025-12-11  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
