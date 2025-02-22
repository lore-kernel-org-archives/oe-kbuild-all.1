Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FF5200B85
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 21:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740259717; cv=none; b=q5IkFO2cWkcHJf2ynGQLbUCq5Mgq05VS8IG2XzHJH7PwL4es0fecS/zjYKEMUKo+MzJLrXczI5AJZFF32egrNfdfV82hlICBmvwaH2mmCTZ4LwnReUGu+GbCq2NuyRZu9QqWer4k3Vv9UF5nYmfqEric5iaS3lG1Xr9lnV1gvd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740259717; c=relaxed/simple;
	bh=tYrHWtHweJNTvOhQJk179jLnuJXDr3AeF3EjgVKonoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BB4QHwj0e53eaBV+aKyZHmUb4K/fpUqSCGHTTof5zcMzigFSVZvGFIIbgEv26Gk50gvbZjCMLacKKzO62nepGOUuy2JAk/oyTEva9XvTbd8kmSa+vHbSX5vOWTyKcCm+RbsPH/ue5jKtas7IY93DMrNucFkVMiaHEnS8WidAvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhwZlUKW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhwZlUKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740259716; x=1771795716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYrHWtHweJNTvOhQJk179jLnuJXDr3AeF3EjgVKonoE=;
  b=mhwZlUKWLGPQF+/wH6TNxiNl93g4oR4ee+NDmytAfb6wouw3lN8fb28G
   SARyHiiofkRIix7P/etPo3Y7PxtsudNX3TcurfbmpWA7vuR+Ln6c4ufBe
   KVaB5Z12TwajXEiDKYtiXO5k0HooyP/QG7lcrJPyAjZ7zpHDQbmmVf129
   78RNQdmWywCmVM2mSkJJCjsp8db9LmxjBXFp8lw/EiZXlj510/1NcXEB1
   4n8LPvVNT/qJXJwXzOnltm2Jl7YpPr8I8yi+43ocIGDCfO7sCO+LhzqIU
   TtvZ04Xx4v03uPO/AH/AqIafO+MCBocZAawDuxvVHBYCoZfMSBfrOOxJQ
   Q==;
X-CSE-ConnectionGUID: NhTO20HsSOOb2Tzg2E8GmA==
X-CSE-MsgGUID: C1dxoitXSUa+Jc+X5vBv9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40289672"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40289672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 13:28:35 -0800
X-CSE-ConnectionGUID: I9HuJ98AT2CkYPgY6ZlvWw==
X-CSE-MsgGUID: l8se03ZbQuijYpMa3Xw99w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115491268"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2025 13:28:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlx32-0006vJ-0V;
	Sat, 22 Feb 2025 21:28:32 +0000
Date: Sun, 23 Feb 2025 05:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 12/19] kernel/time/posix-timers.c:59:17:
 error: 'ret' undeclared; did you mean 'net'?
Message-ID: <202502230538.q10Yg5KA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   9d4caab4067bd0c9023b7e98205b0747dece9f66
commit: 2f36f99979f62c4d147b7443d56aa95e426fcd6f [12/19] posix-timers: Switch to per process storage
config: arc-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250223/202502230538.q10Yg5KA-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230538.q10Yg5KA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230538.q10Yg5KA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/posix-timers.c: In function 'posix_timer_add':
>> kernel/time/posix-timers.c:59:17: error: 'ret' undeclared (first use in this function); did you mean 'net'?
      59 |                 ret = xa_insert(&sig->posix_timer_store, id, timer, GFP_KERNEL);
         |                 ^~~
         |                 net
   kernel/time/posix-timers.c:59:17: note: each undeclared identifier is reported only once for each function it appears in
   kernel/time/posix-timers.c: In function 'do_timer_create':
   kernel/time/posix-timers.c:351:9: error: 'new_timer_id' undeclared (first use in this function); did you mean 'new_timer'?
     351 |         new_timer_id = posix_timer_add(new_timer);
         |         ^~~~~~~~~~~~
         |         new_timer


vim +59 kernel/time/posix-timers.c

    49	
    50	static int posix_timer_add(struct k_itimer *timer)
    51	{
    52		struct signal_struct *sig = current->signal;
    53	
    54		for (unsigned int cnt = 0; cnt <= INT_MAX; cnt++) {
    55			/* Get the next timer ID and clamp it to positive space */
    56			unsigned int id = (atomic_inc_return(&sig->next_posix_timer_id) - 1) & INT_MAX;
    57	
    58			/* xa_insert() fails with -EBUSY when @id contains a timer already */
  > 59			ret = xa_insert(&sig->posix_timer_store, id, timer, GFP_KERNEL);
    60			if (!ret)
    61				return id;
    62			if (ret != -EBUSY)
    63				return ret;
    64			cond_resched();
    65		}
    66		/* POSIX return code when no timer ID could be allocated */
    67		return -EAGAIN;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
