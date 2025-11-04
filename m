Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894EB2D0C76
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234815; cv=none; b=KpqX1lBhbfpkaQxk0Tg/ke66QHdiUWkB4JpYYg2iTuVJOWGc1XT3minSPO+W7olFchVPxWtZqPelQBHrZXCMMWeZ5MmBENCN3zYbUvpE87pancSrjq30ZbQs4iPo+hRPf7NQQtHwDRouWO0uKbxAE3WE/KcWSNgnNsaMX4RASEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234815; c=relaxed/simple;
	bh=rBUzD1yxmVfDNy3grg2GjueIZD+r9V9Q5s1ig4TnyFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KF6LgfKCsZSY/eynr+4W98sv/LO5+0J2IbpZUGehyX1EghUiZHqH8kayHad4WLs6jZXDddhdRIcieNJ5kdG6eSJo2Se0Mtv8pN9l/K+acZzGLHStNlNSsWW2dcerzjVuceX3H1JN+6rCkGfN+6Tk7OEa/wUFblPSx1YmBpfv4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkQEJEr3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkQEJEr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762234813; x=1793770813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rBUzD1yxmVfDNy3grg2GjueIZD+r9V9Q5s1ig4TnyFk=;
  b=YkQEJEr3kvCXF7Vdhsm8yFmm6pq7T6VVQDpnRVX0fMZenmmK9Hp1pBXw
   qywHFgW8J+BCuMJpwMfIepVMVQa6OMiMhlvwhV390iiqIb+eorbuZF8cO
   bgkEUShtsjfpdhlqOtnA7HRKCk8IPnVRn5aEem6VfMzt6bhk+FvjL2laW
   k4RGcK1MQEQxWmxehJlIlhZ2UkFqX24VM8Jl2cvmoKFoxnMtQiQtB/s2y
   ROy+TJAKYO9avg6EtVLKtmd7tp2k1TRMrKJkvEvvil5vMp+xRwoow/PuW
   y7Fn5JFYxJ7rNoef4ZnmNB4D15icppoBMaRkzx9T3aeekF1R10OBAYr7E
   Q==;
X-CSE-ConnectionGUID: BPTbJstRRbGfsmfMgL3m2g==
X-CSE-MsgGUID: 3TBiXDpzTKSC/x1Y0BfNkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="66934517"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="66934517"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 21:40:12 -0800
X-CSE-ConnectionGUID: EDmZYHd9QJSvqPehavReyg==
X-CSE-MsgGUID: 10lNZL+0T8CKlNagQ2sWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="192228007"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2025 21:40:11 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG9m5-000QxM-0Z;
	Tue, 04 Nov 2025 05:40:09 +0000
Date: Tue, 4 Nov 2025 13:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:kernel-6.19.cred 37/39]
 kernel/trace/trace_events_user.c:1456:23: error: redefinition of 'cred'
Message-ID: <202511041333.25hxA4L9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git kernel-6.19.cred
head:   59e578cf86c391d6595e005247ebefd4f371242c
commit: 9dd471f9caa5eb3aba71eebec26fab60dd0a220a [37/39] trace: use prepare credential guard
config: i386-randconfig-r072-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041333.25hxA4L9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041333.25hxA4L9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041333.25hxA4L9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/trace/trace_events_user.c:1456:2: warning: attribute declaration must precede definition [-Wignored-attributes]
    1456 |         CLASS(prepare_creds, cred)();
         |         ^
   include/linux/cleanup.h:290:24: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                               ^
   include/linux/compiler-clang.h:15:25: note: expanded from macro '__cleanup'
      15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
         |                         ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   kernel/trace/trace_events_user.c:1454:15: note: previous definition is here
    1454 |         struct cred *cred;
         |                      ^
>> kernel/trace/trace_events_user.c:1456:2: warning: attribute declaration must precede definition [-Wignored-attributes]
    1456 |         CLASS(prepare_creds, cred)();
         |         ^
   include/linux/cleanup.h:290:24: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |                               ^
   include/linux/compiler-clang.h:15:55: note: expanded from macro '__cleanup'
      15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
         |                                                       ^
   kernel/trace/trace_events_user.c:1454:15: note: previous definition is here
    1454 |         struct cred *cred;
         |                      ^
>> kernel/trace/trace_events_user.c:1456:23: error: redefinition of 'cred'
    1456 |         CLASS(prepare_creds, cred)();
         |                              ^
   kernel/trace/trace_events_user.c:1454:15: note: previous definition is here
    1454 |         struct cred *cred;
         |                      ^
   2 warnings and 1 error generated.


vim +/cred +1456 kernel/trace/trace_events_user.c

  1449	
  1450	static int user_event_set_call_visible(struct user_event *user, bool visible)
  1451	{
  1452		int ret;
  1453		const struct cred *old_cred;
  1454		struct cred *cred;
  1455	
> 1456		CLASS(prepare_creds, cred)();
  1457		if (!cred)
  1458			return -ENOMEM;
  1459	
  1460		/*
  1461		 * While by default tracefs is locked down, systems can be configured
  1462		 * to allow user_event files to be less locked down. The extreme case
  1463		 * being "other" has read/write access to user_events_data/status.
  1464		 *
  1465		 * When not locked down, processes may not have permissions to
  1466		 * add/remove calls themselves to tracefs. We need to temporarily
  1467		 * switch to root file permission to allow for this scenario.
  1468		 */
  1469		cred->fsuid = GLOBAL_ROOT_UID;
  1470	
  1471		old_cred = override_creds(cred);
  1472	
  1473		if (visible)
  1474			ret = trace_add_event_call(&user->call);
  1475		else
  1476			ret = trace_remove_event_call(&user->call);
  1477	
  1478		revert_creds(old_cred);
  1479	
  1480		return ret;
  1481	}
  1482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
