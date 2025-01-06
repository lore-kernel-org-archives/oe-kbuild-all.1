Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8342040
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170321; cv=none; b=iKFYtw5RqFpzDvUsvGsutKGLV4eq6GY55cQzWMFuOFy1ZZFrF4Zt96GLk18p91PfUEfBkuOA+UCY3fSoKvP1KGvJ9UXGwGDljULNHR2yYESpvMGP9Q/o02s3xDAbaPuxjuMe1hBnvmS2eD0Eaa4BPGY4X2MbbIo30nLthiL3GXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170321; c=relaxed/simple;
	bh=SSJCwAu+wW16iH/blVYmr0wAxI6LUbsj5Re+R/s5nJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MdjofauGpPGvmBtLS7Z/5W59UuQJv8gBQj5Jp2KJca5dWIc8FmB57ohAMbDQBPg61JXqaI0Z69TxZ0Ezc+Ey1yh3aKF3GHaSM760Om0YJaN4ozyHbSEYF1k+vqwazKfaA/kNcwMjz/v89e6vVyScSx5Y3707E0QATyJSoBORSdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UB6Ufbe9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UB6Ufbe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736170319; x=1767706319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSJCwAu+wW16iH/blVYmr0wAxI6LUbsj5Re+R/s5nJk=;
  b=UB6Ufbe9Z6U4KcYfydG0jQy4uDSuPWvJc1GxQR1M/0xc3FHHsOy3bui2
   Cs3nooPMT3OC9y5gelms8L0yeBzmGffqJ32wlBQzMsZRxyr7cX2PrQEuj
   ryhM1Hnwc/txy1DRSV/vepdD/pUr4khyGCCPB23WEa7V6p6kXusoyfWrz
   oJ4ENQFnVMM6lBpYUGQFZCmjAoMiKGYqxcDAdbqYcGEYsGVcVLGqtZXbB
   /Aqt0++/PwpjIjco6nWNkP2phGLqlegI5Zr3WfjOiNyHeZgsN4i3R2cev
   XW/s/3rN2pDPTbBlCPshpttAH5R96B1TJcwiU8SPFlI8xID9SqbFul5xQ
   g==;
X-CSE-ConnectionGUID: wXB3K3hfR+qhDC4HE+nrog==
X-CSE-MsgGUID: AREdmoP7T6uR6CsECbk91g==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53861453"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="53861453"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 05:31:58 -0800
X-CSE-ConnectionGUID: YMMlpYqzQQ+4diPgtRW4bA==
X-CSE-MsgGUID: nLDGzRaOQ9Cpgjr45VrYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102298316"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 05:31:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUnD0-000Cen-2O;
	Mon, 06 Jan 2025 13:31:54 +0000
Date: Mon, 6 Jan 2025 21:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 824/1347]
 include/linux/lsm_hook_defs.h:411:18: warning: 'uring_cmd_default' defined
 but not used
Message-ID: <202501062110.g3EXMK1j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: e1da86f75440e97049e698152538237c736a8cfa [824/1347] lsm,io_uring: add LSM hooks for the new uring_cmd file op
config: x86_64-buildonly-randconfig-005-20250106 (https://download.01.org/0day-ci/archive/20250106/202501062110.g3EXMK1j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062110.g3EXMK1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062110.g3EXMK1j-lkp@intel.com/

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
