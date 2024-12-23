Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0BE18E35D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734992479; cv=none; b=SlN10KyDfadDRMAM0YJytuaez6JbNaCUXZ2yg6B1Z01K6VFaIV32ZknDZ9/7BfaH5k639G1ToxgepjYzCxisF6DDlCFoNWe1ZA6+lUuAXR7TQNnFSU/Mp4TE8m6kiDVG71yVJ1DYMTdEBmtrgllXmNSR3pKcz8RVgp6BK4t+3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734992479; c=relaxed/simple;
	bh=WBHhibfIhxUlE0XqYeA7z4Yp/QJh7CnTQ1BLZhSbd2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3A+pKjCtapjnDBp26haPnewXGbWImzkRPre8QeEfJOLGpdsY5CuPWVyaTj5PQOHfumV3OdpxQc4XVSGgNHeTqMfh10tbzhxAs+U0UxWrjvT7wf9Zp+4kThM0oDGm6FKrirl0zmzscpFWEJnciaUodDvnueK8XDFZyOieaDF0xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HObrDvZ8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HObrDvZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734992477; x=1766528477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBHhibfIhxUlE0XqYeA7z4Yp/QJh7CnTQ1BLZhSbd2g=;
  b=HObrDvZ8UHau/pjVWzEblHWDYMwxTz68bmMzkvf9SrYHdvRJjyt02qjQ
   NXwf0eYuLKvtCgLWzq6UXR9/YUsjJQHo6mnP4WiW/hSMJ0oNdg+fGH9M6
   Sj6vCiAPO5fmXkhURw2krTooFZxnKyC2IhBbmbBfKev7ReY5bUstZj2kH
   jnvJz77oqT8VWAPiD81uKigMPnel68buvlrtAGBBH5EFIHc1T7LyOQTDk
   wQVBTp7cymQ487vbGZlmMENbd0aebZaNHC+thbnOxHdPWQir8vLRp1CMA
   1ApMKyBxoexVcZdpe/ItoLuWUVBytK0iIoTi1vRPRcvaRQGjbDjG1SwgP
   w==;
X-CSE-ConnectionGUID: rf7SZAOQSS+8y9QpLn/4zg==
X-CSE-MsgGUID: wzDz1Dc1Rb6BNqvGpAOYyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35601052"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35601052"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 14:21:15 -0800
X-CSE-ConnectionGUID: ZwrKRZJsS7m2GMjKLq+Meg==
X-CSE-MsgGUID: PoCOOkocR5mp7c0GWAs+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99174292"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2024 14:21:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPqnX-0000ec-2d;
	Mon, 23 Dec 2024 22:21:11 +0000
Date: Tue, 24 Dec 2024 06:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 24/32] kernel/fork.c:982:9: error: implicit
 declaration of function 'unwind_task_free'
Message-ID: <202412240616.7v7msXkm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   19d5505fa5d16718cbcfbb98eac598d414b1a2f4
commit: 8dfca20aad716091c6710cba8cdf736fb95ebcbb [24/32] unwind: Add deferred user space unwinding API
config: i386-buildonly-randconfig-002-20241224 (https://download.01.org/0day-ci/archive/20241224/202412240616.7v7msXkm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240616.7v7msXkm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240616.7v7msXkm-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c: In function '__put_task_struct':
>> kernel/fork.c:982:9: error: implicit declaration of function 'unwind_task_free' [-Werror=implicit-function-declaration]
     982 |         unwind_task_free(tsk);
         |         ^~~~~~~~~~~~~~~~
   kernel/fork.c: In function 'copy_process':
>> kernel/fork.c:2376:9: error: implicit declaration of function 'unwind_task_init'; did you mean 'kcov_task_init'? [-Werror=implicit-function-declaration]
    2376 |         unwind_task_init(p);
         |         ^~~~~~~~~~~~~~~~
         |         kcov_task_init
   cc1: some warnings being treated as errors
--
   In file included from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/kernel/irq_work.c:12:
   include/linux/entry-common.h: In function 'enter_from_user_mode':
>> include/linux/entry-common.h:116:9: error: implicit declaration of function 'unwind_enter_from_user_mode'; did you mean 'arch_enter_from_user_mode'? [-Werror=implicit-function-declaration]
     116 |         unwind_enter_from_user_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         arch_enter_from_user_mode
   cc1: some warnings being treated as errors


vim +/unwind_task_free +982 kernel/fork.c

   975	
   976	void __put_task_struct(struct task_struct *tsk)
   977	{
   978		WARN_ON(!tsk->exit_state);
   979		WARN_ON(refcount_read(&tsk->usage));
   980		WARN_ON(tsk == current);
   981	
 > 982		unwind_task_free(tsk);
   983		sched_ext_free(tsk);
   984		io_uring_free(tsk);
   985		cgroup_free(tsk);
   986		task_numa_free(tsk, true);
   987		security_task_free(tsk);
   988		exit_creds(tsk);
   989		delayacct_tsk_free(tsk);
   990		put_signal_struct(tsk->signal);
   991		sched_core_free(tsk);
   992		free_task(tsk);
   993	}
   994	EXPORT_SYMBOL_GPL(__put_task_struct);
   995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
