Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134F79CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747446413; cv=none; b=Hqo8Yw4wQT0Lqng0HBC8b+rhehHDAi6Rjx6tOsGBFG9wGeN++HaKZMBKc8sz2GYh08m7lBsRfMyrW14/2lNsEB5/EtYjpJXO+SYGf4xYZH5mbRsclCBukANp4FVO+8f5IVk9yAqvzEy+PUgat9sICr8h/2RAEVByW3k/9yZZl9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747446413; c=relaxed/simple;
	bh=qhHf/CN+nQMdB1jNouEpCr+jio+Axdml2oSrZq+jb28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R8qI4tpidpe+qgR/1YbXKuqlriYwM4+R1OIT+FLYMNd5wB6umaA8zux+X5s8aYfYxKPhRL9k/MyY+C3rzHqf9nBdiwiSyunwi25/K9qwiErIvmONW5K2mduqfEaeGfHYClgYBAHbFfmZ71ikmhSgdiTIxHDAtN4WVeMfaA1V01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VznzuHCg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VznzuHCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747446412; x=1778982412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qhHf/CN+nQMdB1jNouEpCr+jio+Axdml2oSrZq+jb28=;
  b=VznzuHCghdsxS6LR52NI7IoLMm/1i5bPBU5F5JP6EbfQMXMx/Sjt9UMi
   j4N70uHZyx9B/80LoAvn4i6dNcR59p6rfpCZjM2vDeLF5OHBIfaLpu0OP
   QoT/FTeKRu++Z0tmrsJVxH80TZPCmn/E5yg4mMB1Dr5ja4Gzdmy1KjIg+
   snHP/8DT2Y9Vw+aSfVfLtxO10yZLVf9eMLsPk5ib0kPRJeTc0hOFeFwnf
   hQwKBlWvmxib+ipGqiUYEcD67L85n6KnHqviPiD5q9BhHJqw7D37/heQj
   AjBI1bJMCdVFETMoxpZbcbVm4aZlTbqZkwDjFG3e4Bd+gweMAiG0gxoDb
   Q==;
X-CSE-ConnectionGUID: kar1BgF5SL6lEM1S+9CAvA==
X-CSE-MsgGUID: 2FS/oCSgRGaqLRvCGT9Bcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="74826550"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="74826550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 18:46:51 -0700
X-CSE-ConnectionGUID: DXkGYu9iRhatpsJclK4b7g==
X-CSE-MsgGUID: YquvSE2LSFG+XMJnHavc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143830372"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2025 18:46:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG6dT-000JrO-1E;
	Sat, 17 May 2025 01:46:47 +0000
Date: Sat, 17 May 2025 09:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: [intel-lts:6.12/emt 68/68] arch/um/kernel/skas/syscall.c:43:
 undefined reference to `tt_extra_sched_jiffies'
Message-ID: <202505170958.rzcPEZZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   8cd9b3d1a5325c02ab427d55d75814ee3d974ecc
commit: da780c4a075ba2deb05ae29f0af4a990578c7901 [68/68] um: work around sched_yield not yielding in time-travel mode
config: um-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170958.rzcPEZZI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170958.rzcPEZZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170958.rzcPEZZI-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/um/kernel/skas/syscall.o: in function `handle_syscall':
>> arch/um/kernel/skas/syscall.c:43: undefined reference to `tt_extra_sched_jiffies'
   collect2: error: ld returned 1 exit status


vim +43 arch/um/kernel/skas/syscall.c

    16	
    17	void handle_syscall(struct uml_pt_regs *r)
    18	{
    19		struct pt_regs *regs = container_of(r, struct pt_regs, regs);
    20		int syscall;
    21	
    22		/* Initialize the syscall number and default return value. */
    23		UPT_SYSCALL_NR(r) = PT_SYSCALL_NR(r->gp);
    24		PT_REGS_SET_SYSCALL_RETURN(regs, -ENOSYS);
    25	
    26		if (syscall_trace_enter(regs))
    27			goto out;
    28	
    29		/* Do the seccomp check after ptrace; failures should be fast. */
    30		if (secure_computing() == -1)
    31			goto out;
    32	
    33		syscall = UPT_SYSCALL_NR(r);
    34	
    35		/*
    36		 * If no time passes, then sched_yield may not actually yield, causing
    37		 * broken spinlock implementations in userspace (ASAN) to hang for long
    38		 * periods of time.
    39		 */
    40		if ((time_travel_mode == TT_MODE_INFCPU ||
    41		     time_travel_mode == TT_MODE_EXTERNAL) &&
    42		    syscall == __NR_sched_yield)
  > 43			tt_extra_sched_jiffies += 1;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
