Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD0712B93
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 02:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883244; cv=none; b=mDmRvX54bz2/XoinkWf5thnDtH+sgwJNsiIlZfxDemW/aOVxo0FZJ00+EISSIKSbvmpGVMCRCf3mduhSks8a+QxF6l57xQm4ctLvTbrhS3RC1XqwXO3fW5jFW0kIalonhqQTqWDEH2vShHXfgJH63fEISafR1p/yHvY6ByPKvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883244; c=relaxed/simple;
	bh=03iF2nqHYk7VywKAHgoN0lR6h7STvmcJ86JbsjbjSjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gqbOn7IeKeACf6zKpyBirhrDRmYMppZwKzWOC8Rj3gf44q+vT5Q8FeUo0WjwMjQ9TaSqI8s7JfOgnwcu+Rye/Jhg17pVTvHSe9js5O2p5XtBc3mtfwaOpJiI5Qjdd6KrClqPQ/1ngYBTWG6h47ouxRPEImdanaHK1Yn2FLDVN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6rAvSwj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6rAvSwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740883242; x=1772419242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03iF2nqHYk7VywKAHgoN0lR6h7STvmcJ86JbsjbjSjI=;
  b=M6rAvSwj948C5lAXb5ZMCaazPhS4RwPoWCige3zghqsSD4evEKE2WrL+
   rj+J7iYjZNBvse5/nuWi36TL3mCgjteuue2FsUW2eEQ0yig/GJp8zcCkJ
   d23KO0GaHQ8y7nNO2BmfTC8yH2ZRpBS1k2M0/9dWAa6Elj3AKj4+yOe3E
   73luhI1SH9RGU6sbQW421nzkwUV/ATYRfvtF5uutQybnp66yjhfzXwjEl
   NkomOaektTAG+wr1juROho+om3FjXHsiBvkrOPtQioILFz9c19uncoK6u
   SkMuIA3pIH26Nd93XfV1BkFDCOFNIaENNYieIIx+pupKg1dfd3l5NiCRz
   A==;
X-CSE-ConnectionGUID: 4IOpeMTjRdGJ21Tj7wDYHg==
X-CSE-MsgGUID: boNQRJzfQYyBlKHGIjnqRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41806898"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41806898"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 18:40:42 -0800
X-CSE-ConnectionGUID: Jjah3d7pS3eYGoF3Ei77wA==
X-CSE-MsgGUID: JIQGUsVeQQCm613pfpgnEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118578357"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 18:40:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toZFr-000GyM-2l;
	Sun, 02 Mar 2025 02:40:37 +0000
Date: Sun, 2 Mar 2025 10:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 17/25] kernel/locking/locktorture.c:394:
 undefined reference to `resilient_tas_spin_lock'
Message-ID: <202503021016.WvqmR2tW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   c6b97ff28d4cd12bd2b957513acb6bd5c220427a
commit: 86261c2424a935d6eaec2740140fccc18bf517f7 [17/25] rqspinlock: Add locktorture support
config: i386-buildonly-randconfig-006-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021016.WvqmR2tW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021016.WvqmR2tW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021016.WvqmR2tW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/locking/locktorture.o: in function `res_spin_unlock':
   include/asm-generic/rqspinlock.h:183: undefined reference to `rqspinlock_held_locks'
   ld: include/asm-generic/rqspinlock.h:185: undefined reference to `rqspinlock_held_locks'
   ld: include/asm-generic/rqspinlock.h:205: undefined reference to `rqspinlock_held_locks'
   ld: include/asm-generic/rqspinlock.h:183: undefined reference to `rqspinlock_held_locks'
   ld: include/asm-generic/rqspinlock.h:185: undefined reference to `rqspinlock_held_locks'
   ld: kernel/locking/locktorture.o:include/asm-generic/rqspinlock.h:205: more undefined references to `rqspinlock_held_locks' follow
   ld: kernel/locking/locktorture.o: in function `torture_raw_res_spin_write_lock_irq':
>> kernel/locking/locktorture.c:394: undefined reference to `resilient_tas_spin_lock'
   ld: kernel/locking/locktorture.o: in function `torture_raw_res_spin_write_lock':
   kernel/locking/locktorture.c:370: undefined reference to `resilient_tas_spin_lock'


vim +394 kernel/locking/locktorture.c

   389	
   390	static int torture_raw_res_spin_write_lock_irq(int tid __maybe_unused)
   391	{
   392		unsigned long flags;
   393	
 > 394		raw_res_spin_lock_irqsave(&rqspinlock, flags);
   395		cxt.cur_ops->flags = flags;
   396		return 0;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
