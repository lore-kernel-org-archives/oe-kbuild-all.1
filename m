Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F7423B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755129871; cv=none; b=QqvcdLHs1EpONuu79edxbROrMej1fXVY817l83kOrFw9uq0kCSCZls88nyAhazN0xndxA/vPK+Y8BfR90or4x5MgAeDiNKW7yLTtp7x+zgbvvjteiD49LFXV0eUxn57dwtDEmSvLznWDjMSmtHS/cIMBzue9xH08zFQLgqUyf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755129871; c=relaxed/simple;
	bh=fptLH/QifsYey4WFvFxRRAyk+CNAGV1QwKinYSiOw7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzxbJKy0OmlyqInfS3KC9S950hCGnflKthkuEmWIjjO/VNTf1CDYF5la/h2W6WwPYs7MH5Q2DIidmS6bTAD+uoRTp93Yla3GdTV8oZzEyaBrl6ay+r6SBe94pbXvU8zaTKe+UREc/SnJQ3CAZo0W0dNd+QQHgDiMYuT/JfTIzXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD0l7MkU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD0l7MkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755129870; x=1786665870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fptLH/QifsYey4WFvFxRRAyk+CNAGV1QwKinYSiOw7s=;
  b=aD0l7MkUI/SCrtLZkududINQc9KRepOJNk9N/cAHMjiq4ykTSSUcCPiA
   fg2VZJLqcIpHrtmBbZ2BNkTI2yH89PhU3AtLjaVX2XpkvCfQ6YwhBj4rw
   o4VRBnkC2wUda5kGnAQXX0W990w+cO2alJl2wLyCFV+0Q6UI6Zh/Cdt0I
   +6wE+lKH35VVvUSMd2HI0tRIeWDO8aJIRxi77QYpeeYqvazFU4Q7pnJ0o
   l4z8nsfRzMjKEQfDzx7a8jMsyFm3mj79LRMETG1zUX3y9zWZ+bORRx3Cd
   LilQ8U9BjevLM0ey4yqWtJXafqSbSUcWQ9sNgN+fNpaZdAi070xwBzmaa
   w==;
X-CSE-ConnectionGUID: rujIu+wRRcKj0AA2oHa7dQ==
X-CSE-MsgGUID: 6S8FsuxtTo6k0bsijDVaaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56651007"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="56651007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:04:30 -0700
X-CSE-ConnectionGUID: rAS0xr+jSf6hlo0B9x8OxQ==
X-CSE-MsgGUID: ZAnfPfHjQya0mCsQBxDIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165831111"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2025 17:04:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLSE-000AR6-0T;
	Thu, 14 Aug 2025 00:04:26 +0000
Date: Thu, 14 Aug 2025 08:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/perf 18/19] include/linux/resume_user_mode.h:63:41:
 error: incompatible type for argument 2 of 'rseq_handle_notify_resume'
Message-ID: <202508140713.4mpveHUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/perf
head:   c3f9d97d82881880460dacf48da60a280f4797cd
commit: 058ca455608c53ec5783faa318eb25abf0fd3aea [18/19] rseq: Skip fixup when returning from a syscall
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20250814/202508140713.4mpveHUH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140713.4mpveHUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140713.4mpveHUH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/task_work.c:5:
   include/linux/resume_user_mode.h: In function 'exit_to_user_notify_resume':
   include/linux/resume_user_mode.h:63:35: error: passing argument 1 of 'rseq_handle_notify_resume' from incompatible pointer type [-Werror=incompatible-pointer-types]
      63 |         rseq_handle_notify_resume(regs, from_irq);
         |                                   ^~~~
         |                                   |
         |                                   struct pt_regs *
   In file included from include/linux/resume_user_mode.h:9,
                    from kernel/task_work.c:5:
   include/linux/rseq.h:78:62: note: expected 'struct ksignal *' but argument is of type 'struct pt_regs *'
      78 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                                              ~~~~~~~~~~~~~~~~^~~~
   In file included from kernel/task_work.c:5:
>> include/linux/resume_user_mode.h:63:41: error: incompatible type for argument 2 of 'rseq_handle_notify_resume'
      63 |         rseq_handle_notify_resume(regs, from_irq);
         |                                         ^~~~~~~~
         |                                         |
         |                                         bool {aka _Bool}
   In file included from include/linux/resume_user_mode.h:9,
                    from kernel/task_work.c:5:
   include/linux/rseq.h:78:84: note: expected 'struct pt_regs *' but argument is of type 'bool' {aka '_Bool'}
      78 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                                                                    ~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/rseq_handle_notify_resume +63 include/linux/resume_user_mode.h

    59	
    60		mem_cgroup_handle_over_high(GFP_KERNEL);
    61		blkcg_maybe_throttle_current();
    62	
  > 63		rseq_handle_notify_resume(regs, from_irq);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
