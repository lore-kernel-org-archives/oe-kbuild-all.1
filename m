Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A425EFB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 23:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747785592; cv=none; b=KTTwKQwPEQJyBD1YU6b0uoaNWLrUsh/ds9Hqc9qLEaYhskTu9oEFGXRaACLVBS8GWyI40a8lWXuRyrG/2t9BkWGSMZEmT2vXIdCpPZeTgfWydb4to8NoLZGFanuv4mnWfDaWUlAvWzaO/py91Bojg5d63jv1mJLPNpC2jRJghO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747785592; c=relaxed/simple;
	bh=/V268KyQfl9hWFYL5xXQjdLRAje7mfEuZ9kssXlPxKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGzeurLMhEZGuFVxC3IVtqJtNlCi95g9cOlcBxn0Lp/19yyR7gHBMyD2IYDfn3Za5IeAOIGDkqHZn7cSCG8eLwbu5mN0C3iPyrnOn5kxqQ7/FOOZIsC2loTszwd3efS8UbyDt+H1gWL8tJyKkLkNEiMfTkY3qY9OSIb+kjqMw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWvQlp65; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWvQlp65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747785589; x=1779321589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/V268KyQfl9hWFYL5xXQjdLRAje7mfEuZ9kssXlPxKQ=;
  b=dWvQlp65hqb1o+B61x/XYMfniPiZL9WN9fHgkCyGvPTeFbjnY+PcTIeC
   nucL4LOQ5LsnltZLBtD1EsJj+wdO/R7cFvdgBaQsnQ49S3H6lRmH4FO3L
   0DS0Mnel4KEXyOggAT5YIMh3WxtJrUoEnwHV3PFX9OKjYjc7yoGdfpUJP
   a4JcPbv6wAa3WJy/rl6IlQw3jZU/QvHJOuER05Q62K1wYQxhcIgyyStw3
   FYAD4FEl/pUWJv3dS+cBVmvsG8eKaO19iK4Qk0U/CjF0LsuCs+QqhI4C0
   PGH6eUoqEqjTiuo2K/N9PwIRq2+iCW5nIZ0LIAsaE5geC2cq1sziDwXO9
   A==;
X-CSE-ConnectionGUID: 8aukOzjXRN6qdpSuVwAFoQ==
X-CSE-MsgGUID: R3/PczhlTsWemi0IUuoyjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49001987"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49001987"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 16:59:48 -0700
X-CSE-ConnectionGUID: ScSduOSBRlG3PXJsFzYkWQ==
X-CSE-MsgGUID: H+7wvUNSSJaSTVsnXNkQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140261725"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2025 16:59:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHWs5-000NgG-2T;
	Tue, 20 May 2025 23:59:45 +0000
Date: Wed, 21 May 2025 07:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 kernel/sched/core_sched.c:254:6: warning: no previous prototype for function
 'clear_all_cookie'
Message-ID: <202505210759.A4zKKLon-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ace7789354948892feb8f07d384af6d4af715703
commit: c02f4ea4082402d128afacbe2b4d2fc976a449ef [11/11] anolis: sched/core: introduce sysctl_sched_core
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250521/202505210759.A4zKKLon-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210759.A4zKKLon-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210759.A4zKKLon-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core_sched.c:256:6: warning: unused variable 'cpu' [-Wunused-variable]
     256 |         int cpu;
         |             ^~~
   kernel/sched/core_sched.c:258:6: warning: unused variable 'ret' [-Wunused-variable]
     258 |         int ret;
         |             ^~~
>> kernel/sched/core_sched.c:254:6: warning: no previous prototype for function 'clear_all_cookie' [-Wmissing-prototypes]
     254 | void clear_all_cookie(void)
         |      ^
   kernel/sched/core_sched.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | void clear_all_cookie(void)
         | ^
         | static 
   3 warnings generated.


vim +/clear_all_cookie +254 kernel/sched/core_sched.c

   253	
 > 254	void clear_all_cookie(void)
   255	{
   256		int cpu;
   257		struct task_struct *p, *t;
   258		int ret;
   259	
   260		read_lock(&tasklist_lock);
   261		for_each_process_thread(p, t)
   262			sched_core_share_pid(PR_SCHED_CORE_CLEAR, t->pid, PIDTYPE_PID, 0);
   263		read_unlock(&tasklist_lock);
   264	
   265		/*
   266		 * When sched_core_count become zero, the work which turn off __sched_core_enabled
   267		 * will queue in system_wq, so we flush it to make sure that __sched_core_enabled
   268		 * is really turned off.
   269		 */
   270		flush_workqueue(system_wq);
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
