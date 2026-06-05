Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A040E8CE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666666; cv=none; b=bIQmNXrh31kPw6SfOeZKZyHD3yuFYuTQ9rfruySl99WPChYJip4Tzb5SKETKGzMeHOIPZKhY5TnjHjBAKH/ez/cjvjQ3iH97JhiGv9/+VfZfjEBiwwDzBUHFj12dWbjkf5LRFhJPAQNWdRIAUippuvN2+T83q1gwwGYAQ4uvYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666666; c=relaxed/simple;
	bh=MuH3A/KYs27Ygq3c3WW2rfh5rGalTbVCnTq6kEprK0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N+PusLt5+QXfjbkTcV1/bR1N3gSyu7knw9s5yL0CVs/zis2tBFdAzlxTbycIKnwzLjDgIqY8E0DUjsJg8hYeYZayJ73calfUHz7kQimaTt16VvrwogD7Da3BdcA1pKJOScTeVW8Hvv/QpzALfRqpwpcmKiU2tg2dVXZ3KQm1kGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rca8emgJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rca8emgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780666665; x=1812202665;
  h=date:from:to:cc:subject:message-id;
  bh=MuH3A/KYs27Ygq3c3WW2rfh5rGalTbVCnTq6kEprK0k=;
  b=Rca8emgJXzQZ0iRsSFX7SatRGtw1LRw8gAhUPDqcAwMx2uEppXC6fcmn
   ekMzFTZ14awgjOO2lLKTyTtShupk1LNB8OVdGapDfNGfSgj2cx7RLv9RU
   z8Yvt5qrLBCvTzHvKZxubLHE/Y5qt0N9+pVEw2fpX9cTE+j4PhqCljB3w
   tEsg9r2DPaBHMgSp8wlGVFMYQz8FWqwBBks357+zBHP1Va6cXztNP+t0Q
   CCkvYf1mu+ntgFlQs3sd3AasbQ1jfHS2CusSUlI+m0bwRsixhs0Zey/M4
   KWTjLaBfAzq6wiYeScSrErAXNUU/1ryxyyJijIDWxPE6Ij38W6flQGoGg
   w==;
X-CSE-ConnectionGUID: uO8jZt93RXSwUQeRkbP6zQ==
X-CSE-MsgGUID: TfZD+hQSRhGRrETRGhjrPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80636239"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80636239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 06:37:44 -0700
X-CSE-ConnectionGUID: 0R8OoJRYTZqrHZfyqNjmSQ==
X-CSE-MsgGUID: 0BPL5VNUQe+dwGhel912jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="246677688"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 06:37:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVUk1-00000000G4Y-0vGz;
	Fri, 05 Jun 2026 13:37:41 +0000
Date: Fri, 05 Jun 2026 21:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat-2026-06-04 58/62]
 kernel/sched/debug.c:274:9: error: implicit declaration of function
 '__sched_cgroup_mode_update'
Message-ID: <202606052114.Z6ZwCm6J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat-2026-06-04
head:   b89fcd232db2b7117a3255be623eeb4c67ece726
commit: 582f7ee48dc53ebe117cf24e3a2b2102b25dcbd7 [58/62] sched/fair: Add cgroup_mode: up
config: i386-randconfig-141-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052114.Z6ZwCm6J-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052114.Z6ZwCm6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052114.Z6ZwCm6J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:71:
   kernel/sched/debug.c: In function 'sched_dynamic_write':
>> kernel/sched/debug.c:274:9: error: implicit declaration of function '__sched_cgroup_mode_update' [-Wimplicit-function-declaration]
     274 |         __sched_cgroup_mode_update(mode);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__sched_cgroup_mode_update +274 kernel/sched/debug.c

   256	
   257	static ssize_t sched_dynamic_write(struct file *filp, const char __user *ubuf,
   258					   size_t cnt, loff_t *ppos)
   259	{
   260		char buf[16];
   261		int mode;
   262	
   263		if (cnt > 15)
   264			cnt = 15;
   265	
   266		if (copy_from_user(buf, ubuf, cnt))
   267			return -EFAULT;
   268	
   269		buf[cnt] = 0;
   270		mode = sched_dynamic_mode(strstrip(buf));
   271		if (mode < 0)
   272			return mode;
   273	
 > 274		__sched_cgroup_mode_update(mode);
   275		sched_dynamic_update(mode);
   276	
   277		*ppos += cnt;
   278	
   279		return cnt;
   280	}
   281	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
