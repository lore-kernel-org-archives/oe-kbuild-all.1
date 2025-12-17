Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21E224B01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 01:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936778; cv=none; b=IC9uxBpFCaAQKFUHEEg27sOHXJpQA2lhZEpODMEXW8m6DF6OVphYs6uDZ/iC6d+g8PF1drZRweE4cBLTvVCnBe53KEADvCymU2NzWCRf3zWXCW4ZlxKds30fOaajut02fPj7swmn2sEMCjO8djWYP9c7/tHhQp6JsopmNWCvafo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936778; c=relaxed/simple;
	bh=XtC/6bPLP+XCE2JX8wQDgikv7q22/axBAuLgOmRd8/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZREuA/h/jPKHB9LbFwhMW4CiwmjpzhTu2Cx5tZAG9fFcFB3Y/G6vIRZJbqyfYfO/x32dImag1AWSyt2FowcfFu9p6tfoy7BVPMOH7vvnKD4H1VDI4p4LgxS53DUR7EWsFX7Ex/T7srYwVqVr0YkmI6KEPQbWhqEqMCzNou04uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPwl+vPu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPwl+vPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765936775; x=1797472775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XtC/6bPLP+XCE2JX8wQDgikv7q22/axBAuLgOmRd8/8=;
  b=LPwl+vPuJm9fM6bChn/NkL7WveklY+4XRk/E6zOHyK19eOIt4OT+oh9M
   KGsMrPBsPDR7TEae5r4DI/8JjiJWq0RL/X9Q09HL/t8pY/39Gz0+uby3N
   pCAJV4PSi4kcYV/UEm9JwEC/bJsF/TUUN2wbQ1HAOAmTnBUMdfC0yAqJF
   ps0nfYuMw5om3up+8qD3xP2c0IzZFsS8GICz2cO1kYHHZMtbuHl5A/MFZ
   H6RxJhhxb74pxMSoJtZZqEQGRZ0FgJYG9aTSHnU1QoiTkQXi6cu0jpg69
   ptKZiMYf3TiqLm1SJ8QHaUuF4DG3/UlSAF1vByXn63givxYyrafteZmSK
   Q==;
X-CSE-ConnectionGUID: H9YsAbPvRuKHJF1Z1gt6Fg==
X-CSE-MsgGUID: xNmnar3wSvSknADSmRFV+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67826775"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67826775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 17:59:33 -0800
X-CSE-ConnectionGUID: /p850BSERNShHP4Jl4Nhyw==
X-CSE-MsgGUID: 2OtFOAxAT5+gLTfGYrV4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="202673380"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2025 17:59:32 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVgp7-0000000043Q-22ds;
	Wed, 17 Dec 2025 01:59:29 +0000
Date: Wed, 17 Dec 2025 09:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1944/1944] lib/prime_numbers.c:8:
 warning: "bitmap_size" redefined
Message-ID: <202512170947.gjTMu0Jt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   49bc452fdcb1e9ec3f9bb20cd3e15b865a2933fd
commit: 9e8111c56a2515c7634662d19c29fde636758a02 [1944/1944] bitmap: introduce generic optimized bitmap_size()
config: arm64-randconfig-r052-20251217 (https://download.01.org/0day-ci/archive/20251217/202512170947.gjTMu0Jt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170947.gjTMu0Jt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170947.gjTMu0Jt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/prime_numbers.c:8: warning: "bitmap_size" redefined
       8 | #define bitmap_size(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
         | 
   In file included from include/linux/cpumask.h:12,
                    from include/linux/rcupdate.h:44,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arm64/include/asm/compat.h:25,
                    from arch/arm64/include/asm/stat.h:24,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:11,
                    from lib/prime_numbers.c:3:
   include/linux/bitmap.h:215: note: this is the location of the previous definition
     215 | #define bitmap_size(nbits) (ALIGN(nbits, BITS_PER_LONG) / BITS_PER_BYTE)
         | 


vim +/bitmap_size +8 lib/prime_numbers.c

cf4a7207b1cb4a Chris Wilson 2016-12-22  7  
cf4a7207b1cb4a Chris Wilson 2016-12-22 @8  #define bitmap_size(nbits) (BITS_TO_LONGS(nbits) * sizeof(unsigned long))
cf4a7207b1cb4a Chris Wilson 2016-12-22  9  

:::::: The code at line 8 was first introduced by commit
:::::: cf4a7207b1cb4a3c3fe3aa11a83c9d673722a7f5 lib: Add a simple prime number generator

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
