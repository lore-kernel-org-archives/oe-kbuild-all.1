Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27662270EAA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752683098; cv=none; b=E/pxB0KavWtigWAx58MAtAGrULbl0wqfG/sYdq6YcsUZFWkp5H0shaPsHhPxDJH1nL9WWwbD3rgEDjtbcH0OGgkibkm+BABFBGslaKh4ot2aarCfGuCV+DUVRSwSbAd+91RWtroNSCJOv/bftKjAn8FeSb52lkXL/sNw1rW6Qfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752683098; c=relaxed/simple;
	bh=iA885ZnUoIRLm5d69+ocWp9YJPpfTKySNSOVt6zudDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYZGVgBP1Azj6mq8OFS+4x1f1KGKcfUdLIjbQIlyxLGW+k6F3YeNyD+UjqiE9I4JNa93WhLtfqfsFFf9fgUmZbSladynPV0RNwAJu+vf3UWSEs6sgt5GtHVe/LcWKOA0mr1FvFEsQ6K5dPiBk6V8iToc35E4gq8HPQrT5OpJxKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS6kzuyY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS6kzuyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752683096; x=1784219096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iA885ZnUoIRLm5d69+ocWp9YJPpfTKySNSOVt6zudDE=;
  b=OS6kzuyYh/jwdrKJbswsVvfDrYUBwVotZnZXhW/gL5R5ppW8mEYEWTwJ
   lbz21euJDDd2+fbpHklmIDnRtoa5WFvLULz+uauHmxjMN0k5UiKkFIODN
   jrC2lDCmhJmQiGOI7sPEOZW0z86u9uMSbvTAEym/vH0UAJ8nULKGqkgJr
   OQOwgIEwj578PFHRI6L9yqbJ4lYbOAEqsb5Teq5DZLpebgRpBEcpJyAPE
   B7H5FoWys6H74DZ5D9FG6Jd8FQjhSnp9KXGO4+mc01GhRMFzgtIj/8H0Y
   +pKNA1/ugUqhtwnfmHbcwf5BCEfm5LBIz/KFME5UiGmrlT4zo2tPQW2FN
   w==;
X-CSE-ConnectionGUID: ceWyGIpKS6iYSuBLunzMNg==
X-CSE-MsgGUID: 1V42LhnNRJSqLIDOSjjJDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58748197"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="58748197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 09:24:55 -0700
X-CSE-ConnectionGUID: goPhe+KSR7CUoSxt3ZdIPw==
X-CSE-MsgGUID: 7Wq3ZXxrRYWw/JGDfEHykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="158271296"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jul 2025 09:24:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc4w7-000Cct-2M;
	Wed, 16 Jul 2025 16:24:51 +0000
Date: Thu, 17 Jul 2025 00:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] include/linux/lsm_hook_defs.h:411:18:
 warning: 'uring_cmd_default' defined but not used
Message-ID: <202507170020.FTOuQlC1-lkp@intel.com>
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
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: e1da86f75440e97049e698152538237c736a8cfa [92/92] lsm,io_uring: add LSM hooks for the new uring_cmd file op
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250717/202507170020.FTOuQlC1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507170020.FTOuQlC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507170020.FTOuQlC1-lkp@intel.com/

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
   include/linux/lsm_hook_defs.h:394:18: warning: 'bpf_prog_alloc_security_default' defined but not used [-Wunused-const-variable=]
     394 | LSM_HOOK(int, 0, bpf_prog_alloc_security, struct bpf_prog_aux *aux)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
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
