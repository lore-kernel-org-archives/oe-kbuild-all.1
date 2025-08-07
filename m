Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEBA202F71
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754567490; cv=none; b=esAxkOwRi5YZu3QF451mDmSspwlnWdfb73jzixw9s6MLjOiJGWUuScIM913gCR2sQGBIqjAkWk0sSf+99GQBnHRI++QPR4kbW3HxNTSIuSH9t/l40ukv56vVV9Jd7DACBNhshNosck06GWjHx5jURK3voa1kh67kEX4ej3t1cKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754567490; c=relaxed/simple;
	bh=xPuFKqgmLtHLalLToz54t1vj3vmx93fzwXAW18UoA9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m1GaegCMY+Fccxa+7w2Q7REd5SBEQI/uyK8pOY6i1T4h3HSpSV2YvAqK4JwBUKLEOQ0hmfjf+9U1Uqv9GxRh5E9UAYxC1THVu9yya35Lkh50F40q/SCfPr+MkzU5fN+CyRaQEtr3DwB9BChd6QNEsey/DbzGBIYuF2O5mkbFE8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lk4fM6FK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lk4fM6FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754567490; x=1786103490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xPuFKqgmLtHLalLToz54t1vj3vmx93fzwXAW18UoA9I=;
  b=Lk4fM6FKAaei0wI2YqLQAEA2/m4/RlZ2RL5WRjAHr5NbSDFMI38N5cSY
   WmJPKA/7KQRBbpuUVeI4ECpSAAHolGRj2SiM97hhsnGxC7XIRds36AeFo
   LNZBKBrbqxZzR0MYXT3vIEZX69HUsVx8Xxk4aOhGcGgkcdD+A1eaKK+rX
   hqwSIqSGEW4+arhfP9ociVlkJjOWWF5jWPiWQUWqksLmv3Hk7E7XspIcm
   QwHwI8YssJ9Sokbr/lV5FhbE4uk1NyKZbjmTfsiNGTe5pJcjDVjlx4zZS
   s8USzGcwT0tgc3pQT6iH38Rn8KWglVjOtL9nnJLf6Hy5UntpHLLydvymO
   A==;
X-CSE-ConnectionGUID: XS5enhNASXSj8WU/GyWy2A==
X-CSE-MsgGUID: DeMySeIrShCLkJxZwVYqHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56770459"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56770459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:51:28 -0700
X-CSE-ConnectionGUID: ygWyORSCQdCnFAuwjXfGZA==
X-CSE-MsgGUID: wti+dRh9Q4i/a2QpNulxaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169505008"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 04:51:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujz9X-0002kI-2f;
	Thu, 07 Aug 2025 11:51:23 +0000
Date: Thu, 7 Aug 2025 19:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/xfer_to_guest_mode 1/1] kernel/entry/kvm.c:19:59:
 error: 'vcpu' undeclared; did you mean 'cpu'?
Message-ID: <202508071919.NHW2cmY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/xfer_to_guest_mode
head:   faf41e8a0bb349871cbc8e77efe024197509566a
commit: faf41e8a0bb349871cbc8e77efe024197509566a [1/1] entry/kvm: KVM: Move KVM details related to signal/-EINTR into KVM proper
config: x86_64-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071919.NHW2cmY0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071919.NHW2cmY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071919.NHW2cmY0-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/kvm.c: In function 'xfer_to_guest_mode_work':
>> kernel/entry/kvm.c:19:59: error: 'vcpu' undeclared (first use in this function); did you mean 'cpu'?
      19 |                 ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
         |                                                           ^~~~
         |                                                           cpu
   kernel/entry/kvm.c:19:59: note: each undeclared identifier is reported only once for each function it appears in


vim +19 kernel/entry/kvm.c

935ace2fb5cc49 Thomas Gleixner     2020-07-22   4  
faf41e8a0bb349 Sean Christopherson 2023-09-15   5  static int xfer_to_guest_mode_work(unsigned long ti_work)
935ace2fb5cc49 Thomas Gleixner     2020-07-22   6  {
935ace2fb5cc49 Thomas Gleixner     2020-07-22   7  	do {
935ace2fb5cc49 Thomas Gleixner     2020-07-22   8  		int ret;
935ace2fb5cc49 Thomas Gleixner     2020-07-22   9  
faf41e8a0bb349 Sean Christopherson 2023-09-15  10  		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
935ace2fb5cc49 Thomas Gleixner     2020-07-22  11  			return -EINTR;
935ace2fb5cc49 Thomas Gleixner     2020-07-22  12  
26baa1f1c4bdc3 Peter Zijlstra      2024-10-04  13  		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
935ace2fb5cc49 Thomas Gleixner     2020-07-22  14  			schedule();
935ace2fb5cc49 Thomas Gleixner     2020-07-22  15  
3c532798ec96b6 Jens Axboe          2020-10-03  16  		if (ti_work & _TIF_NOTIFY_RESUME)
03248addadf1a5 Eric W. Biederman   2022-02-09  17  			resume_user_mode_work(NULL);
935ace2fb5cc49 Thomas Gleixner     2020-07-22  18  
935ace2fb5cc49 Thomas Gleixner     2020-07-22 @19  		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
935ace2fb5cc49 Thomas Gleixner     2020-07-22  20  		if (ret)
935ace2fb5cc49 Thomas Gleixner     2020-07-22  21  			return ret;
935ace2fb5cc49 Thomas Gleixner     2020-07-22  22  
6ce895128b3bff Mark Rutland        2021-11-29  23  		ti_work = read_thread_flags();
26baa1f1c4bdc3 Peter Zijlstra      2024-10-04  24  	} while (ti_work & XFER_TO_GUEST_MODE_WORK);
935ace2fb5cc49 Thomas Gleixner     2020-07-22  25  	return 0;
935ace2fb5cc49 Thomas Gleixner     2020-07-22  26  }
935ace2fb5cc49 Thomas Gleixner     2020-07-22  27  

:::::: The code at line 19 was first introduced by commit
:::::: 935ace2fb5cc49ae88bd1f1735ddc51cdc2ebfb3 entry: Provide infrastructure for work before transitioning to guest mode

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
