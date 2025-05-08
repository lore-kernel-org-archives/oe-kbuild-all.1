Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363D22538F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 22:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746743218; cv=none; b=sDKl83JTKD6JqMy3nKk7vMet8ZEVaQ1hSRR1s/35fjCOcjePyx9O2TL/Kx39LIL4b6DFjGxhSEvB6vROvs+GBIRkrVfUwctqdbSCPBxHWkWFdI2qPlhkOUCSwUPnPE/n0MyR327uMYhfDx9OGHzuu7bx22/1MHTo3zbiacsE/oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746743218; c=relaxed/simple;
	bh=gOg4DTKRIhvun4IPSd7apP933o08qvvPVL7df0hP06Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJoruo3NPd3boM3vlT9TaZPnksqjKibERiEZ8W0sdHnOe+TRvIzOOFnj4Bese+8Jv+XLtn+0uMd9NM2v8gHOe8EDy+vXCiA1MleSubHIHAO99fKQ06sfwjE8wcgk6e0yDof767XVoptKpYbGR5aCN56nGuyDu8y0V5QgrOM3qoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bo/Ts5p7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bo/Ts5p7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746743217; x=1778279217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gOg4DTKRIhvun4IPSd7apP933o08qvvPVL7df0hP06Q=;
  b=Bo/Ts5p7OdmfLIRY8jAHg/sMdcyj4xezDmjBUBJNgNLtbuuwu/FaqqhO
   MbsLRdwNCJsBvaSvvBR/Vs9cEa4tkJm+DwGVlLxDQbsFmB+rvW8CywIHg
   3cUn88FGaeIPPSdgZOVwlHsAvfwpjXCiB1h/J81644/iT38V42HvOpgeD
   ZrqiQJtvkIMOUzq1SCLRgLyMa01F81lxfYww+ETBRiXzOLsrTDaAOlAoT
   iAiyjJ4x6cbct+P+gqRKMacZ7gGm1htEoqkN7QBDVyq7I2irXdM+WTky/
   G2x56H/U4h3FSQ+kajLikOWw2qhaA5yprlPC+j7LB7y//sdO3tm4SRLtx
   A==;
X-CSE-ConnectionGUID: kJ7rcIfOSniikmZ1kyiVvw==
X-CSE-MsgGUID: 32s+avoAR0CdyAkfuKUf1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59896759"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59896759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:26:54 -0700
X-CSE-ConnectionGUID: 2No7CQnzS4yF8vMYfHgHTw==
X-CSE-MsgGUID: udMn74pRTcKpyhxSH/IxnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="167367857"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2025 15:26:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD9hb-000BQn-0A;
	Thu, 08 May 2025 22:26:51 +0000
Date: Fri, 9 May 2025 06:25:54 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1/1] include/linux/lsm_hook_defs.h:411:18:
 warning: 'uring_cmd_default' defined but not used
Message-ID: <202505090606.C1NLB1xm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luis,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: e1da86f75440e97049e698152538237c736a8cfa [1/1] lsm,io_uring: add LSM hooks for the new uring_cmd file op
config: arm64-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090606.C1NLB1xm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090606.C1NLB1xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090606.C1NLB1xm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/linux/lsm_hook_defs.h:411:18: warning: 'uring_cmd_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:411:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:410:18: warning: 'uring_sqpoll_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, uring_sqpoll, void)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:410:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, uring_sqpoll, void)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:409:18: warning: 'uring_override_creds_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:409:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:405:18: warning: 'perf_event_write_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:405:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:404:18: warning: 'perf_event_read_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:404:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:402:18: warning: 'perf_event_alloc_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, perf_event_alloc, struct perf_event *event)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:402:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, perf_event_alloc, struct perf_event *event)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:401:18: warning: 'perf_event_open_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:401:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:398:18: warning: 'locked_down_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:398:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:394:18: warning: 'bpf_prog_alloc_security_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, bpf_prog_alloc_security, struct bpf_prog_aux *aux)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/uring_cmd_default +411 include/linux/lsm_hook_defs.h

   407	
   408	#ifdef CONFIG_IO_URING
   409	LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
   410	LSM_HOOK(int, 0, uring_sqpoll, void)
 > 411	LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
