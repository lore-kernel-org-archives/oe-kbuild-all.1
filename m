Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D422227E8C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516595; cv=none; b=OTpLxkTCdUqPMoAemxsBApVJVeTwHopIJH/vKc0M0O/NvUlYmRD8fndPtdKFa3qVZxixvNr5J6ReZPsdw3Yp7dV6jPeEXo9z7q6SsVeT8ApYLgzSpWMJoHFLNXFIjCgNHKEdlkSl7TKG8XZygn/1KGEpPYc/VvDdD6fOW9zr3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516595; c=relaxed/simple;
	bh=WfuaSNqn8FSFyrGbIi6bsNoPZ6sSCVG4dBj+9ga5Ufo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X6+APITZWmQfy/cru3kkF4iDmYQOqWtCrzT5+lJ0zIFsrCMdGC+WV5TXDnJiXYp795TgF6O/AKQNpuCKWJ8I9vWDOQ7PhttL7imSCPMNmmJO7AvCHryl6HJWzs93P+Be6gM8/CKTEZnUohGe+JT2ab7WiZKNEBzp0hg1vuUC6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCgqg5BJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCgqg5BJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516594; x=1780052594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfuaSNqn8FSFyrGbIi6bsNoPZ6sSCVG4dBj+9ga5Ufo=;
  b=lCgqg5BJV6wfGoueIwCtHzjlaWiCLqLj8HLEkQbhNCkA1WdqliMlXPyt
   luiTUf88XqY0oIpng8HBKjBG00ylv9WRTHKnClrEApX+RWyDVGneTIMtU
   GuT25W46aB3J0pmm4fhRA+3+Ci6plFl4XHgKiHKbw8u5Ob9kbPZZHR8Y1
   J1dCg+hjHQS2X+Zlv4XCnmcXuhZ5p4X44Sp9WSrPZ5W+nbL4AcZrNkQiJ
   x8Z4Erp170FoFHkkIbrdJyJoCIqoi5RCjKV/iRfTtOOTU75dBquF+XmKI
   AYnl+1fyvXKClqjg/sVX9mF2SSq6S4S3588ic5NnrcQo7Wm4O1LBF6cNL
   A==;
X-CSE-ConnectionGUID: 7PRrIzotQD2p8XXwoNqOPA==
X-CSE-MsgGUID: t2/389hBT/CLBkopawMGHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369591"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369591"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:11 -0700
X-CSE-ConnectionGUID: 5gEmnTmBT5m08kbN0VNA2w==
X-CSE-MsgGUID: /vTwMMgSRIyq6RCvB3ynxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303613"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:09 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000Fr-2F;
	Thu, 29 May 2025 11:03:07 +0000
Date: Mon, 26 May 2025 23:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] include/linux/lsm_hook_defs.h:411:18:
 warning: 'uring_cmd_default' defined but not used
Message-ID: <202505262320.XFzThxFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: e1da86f75440e97049e698152538237c736a8cfa [0/1] lsm,io_uring: add LSM hooks for the new uring_cmd file op
config: x86_64-buildonly-randconfig-2004-20250514 (https://download.01.org/0day-ci/archive/20250526/202505262320.XFzThxFa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262320.XFzThxFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505262320.XFzThxFa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/linux/lsm_hook_defs.h:411:18: warning: 'uring_cmd_default' defined but not used [-Wunused-const-variable=]
     411 | LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)
         |                  ^~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:411:1: note: in expansion of macro 'LSM_HOOK'
     411 | LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:410:18: warning: 'uring_sqpoll_default' defined but not used [-Wunused-const-variable=]
     410 | LSM_HOOK(int, 0, uring_sqpoll, void)
         |                  ^~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:410:1: note: in expansion of macro 'LSM_HOOK'
     410 | LSM_HOOK(int, 0, uring_sqpoll, void)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:409:18: warning: 'uring_override_creds_default' defined but not used [-Wunused-const-variable=]
     409 | LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:409:1: note: in expansion of macro 'LSM_HOOK'
     409 | LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:405:18: warning: 'perf_event_write_default' defined but not used [-Wunused-const-variable=]
     405 | LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:405:1: note: in expansion of macro 'LSM_HOOK'
     405 | LSM_HOOK(int, 0, perf_event_write, struct perf_event *event)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:404:18: warning: 'perf_event_read_default' defined but not used [-Wunused-const-variable=]
     404 | LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:404:1: note: in expansion of macro 'LSM_HOOK'
     404 | LSM_HOOK(int, 0, perf_event_read, struct perf_event *event)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:402:18: warning: 'perf_event_alloc_default' defined but not used [-Wunused-const-variable=]
     402 | LSM_HOOK(int, 0, perf_event_alloc, struct perf_event *event)
         |                  ^~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:402:1: note: in expansion of macro 'LSM_HOOK'
     402 | LSM_HOOK(int, 0, perf_event_alloc, struct perf_event *event)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:401:18: warning: 'perf_event_open_default' defined but not used [-Wunused-const-variable=]
     401 | LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:401:1: note: in expansion of macro 'LSM_HOOK'
     401 | LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:398:18: warning: 'locked_down_default' defined but not used [-Wunused-const-variable=]
     398 | LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
         |                  ^~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:398:1: note: in expansion of macro 'LSM_HOOK'
     398 | LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:377:18: warning: 'key_getsecurity_default' defined but not used [-Wunused-const-variable=]
     377 | LSM_HOOK(int, 0, key_getsecurity, struct key *key, char **_buffer)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/uring_cmd_default +411 include/linux/lsm_hook_defs.h

   407	
   408	#ifdef CONFIG_IO_URING
   409	LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
   410	LSM_HOOK(int, 0, uring_sqpoll, void)
 > 411	LSM_HOOK(int, 0, uring_cmd, struct io_uring_cmd *ioucmd)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
