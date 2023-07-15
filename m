Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E67EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 01:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689383449; x=1720919449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3HqGsc5llRMSU3HYDMg/1Oj11zCMqHcyymerH1KKrc=;
  b=csJzoGKwSCZuQ1d9ljUwBzpYjOJ6/LxKcoD9snigZ0YFyC+BVOjCPRnX
   36bJrnTjh1/MH3PnF+23RzBSiKETmy3hYPeyhawSmn0ANcI8XFfrQAbaw
   PBO1nw3z3f06aoNhycG03cRaXJKPsAa/874t/BM31hZICebFpEKXd/3mD
   JhEc01JkzeM8Z129o/OhR2smVB4A25WLE+0HO4IK/kw/EXES2LDkjtJPy
   ZckMDqtX/XRJ8sjfJV55xYvMJWUPyRpI0TfWTixG8MfvpH9P2qzrNYbmZ
   RErAy+6C76r9hk2k3PBq6znVFGDHIQup+0egV6wlHz8fdhxYZg684Eb80
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="355552346"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="355552346"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 18:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="672882228"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="672882228"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Jul 2023 18:10:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKTo6-0007oD-2b;
	Sat, 15 Jul 2023 01:10:46 +0000
Date: Sat, 15 Jul 2023 09:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:arm64-gcs 13/48] kernel/sys.c:2305:12: warning: no
 previous prototype for 'arch_get_shadow_stack_status'
Message-ID: <202307150912.lyo5tlfW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   e90b1663883e49f3f5aef612fde57503c21ad1ad
commit: b506a9cc113f13d910ab85a127c299d63a3c1fb1 [13/48] prctl: arch-agnostic prctl for shadow stack
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230715/202307150912.lyo5tlfW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150912.lyo5tlfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150912.lyo5tlfW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2305:12: warning: no previous prototype for 'arch_get_shadow_stack_status' [-Wmissing-prototypes]
    2305 | int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2310:12: warning: no previous prototype for 'arch_set_shadow_stack_status' [-Wmissing-prototypes]
    2310 | int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2315:12: warning: no previous prototype for 'arch_get_indir_br_lp_status' [-Wmissing-prototypes]
    2315 | int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2320:12: warning: no previous prototype for 'arch_set_indir_br_lp_status' [-Wmissing-prototypes]
    2320 | int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_get_shadow_stack_status +2305 kernel/sys.c

  2304	
> 2305	int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
  2306	{
  2307		return -EINVAL;
  2308	}
  2309	
> 2310	int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
  2311	{
  2312		return -EINVAL;
  2313	}
  2314	
> 2315	int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
  2316	{
  2317		return -EINVAL;
  2318	}
  2319	
> 2320	int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
  2321	{
  2322		return -EINVAL;
  2323	}
  2324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
