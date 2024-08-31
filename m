Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02984139D1B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725137484; cv=none; b=m2vk1mtcuGw1l5ZOQzc2tRzMOSB0A1zQzrzxgpj4R2/TEFutL1jHm24mOkRxh1He9NycqIubHOScFiZWLX887dDcDsMq1mNOWBvFNtCJ4tYy6svCweXiDFCPm+g7DBv9WUJbbCKMPYMQiCKBwARtM7sO3sKeTlqHeBgyg8P7s1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725137484; c=relaxed/simple;
	bh=tsQb2fey/yeK6AlaA9X9bgbDeyxzL2IVJE60eeI26tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsGPgGVjt5F0Tf5TnNr6aRDIxCGESsW706fY0Pjo16Xysj/mx/7Pz/TmY//V6aNjqwRx6yzB41gfDGvmE1qBciB9SCFhLd5Hq2yjWITLLssTBRjlkTqrA546AN67R82AM0FAAJqRlDQxvo4AsME7UbKOH1jePmfnQIULokj26k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QT4AXQh2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QT4AXQh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725137482; x=1756673482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsQb2fey/yeK6AlaA9X9bgbDeyxzL2IVJE60eeI26tA=;
  b=QT4AXQh2FDU0FQjoEoH8XyRjFgCQc0qzfiywwJtE6O6WrV+60SWwEfI1
   JuV57chnWuz+KuUJbVQfCu2pyAff+k/yw8H8zEDBCs/xRsM1LxnegLOT5
   i8ks7TQmcYUUY1MejKw9OSDN3W6wntDREGO6tt5ifMoqYEsUUb0/KH8HO
   4asC7ROZZuy18qkQQ0ScnLHYejIk6p3h5MmE5cRIVvv8J3okNEPSpGBNh
   jfJxYUZ8ovC6U+v99rrljUrYhZqnzLYysc8DUvi+UphsDBOkGCVKko4cs
   +lCLPypqs45CLgicw6tM7IECOakbYSa/wnKL9jIZ5ytBGXD9pDcvMVZg2
   Q==;
X-CSE-ConnectionGUID: cX4atZIiRhqKMUJ/uBFKVg==
X-CSE-MsgGUID: fpZRJtnwSMOFfdm1axXYtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34327025"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34327025"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 13:51:21 -0700
X-CSE-ConnectionGUID: F/lpIS7gRDe80F0Xnt73dQ==
X-CSE-MsgGUID: 5+HhaZkSR5iF/NEYnugjJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="69050624"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2024 13:51:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skV41-00037W-34;
	Sat, 31 Aug 2024 20:51:17 +0000
Date: Sun, 1 Sep 2024 04:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 23605/23944]
 include/linux/lsm_hook_defs.h:410:18: warning: 'uring_sqpoll_default'
 defined but not used
Message-ID: <202409010427.b53bAVGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: c10004388b8cf563f38aa7424176b8c01e48331c [23605/23944] lsm,io_uring: add LSM hooks to io_uring
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240901/202409010427.b53bAVGc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010427.b53bAVGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010427.b53bAVGc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/linux/lsm_hook_defs.h:410:18: warning: 'uring_sqpoll_default' defined but not used [-Wunused-const-variable=]
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
>> include/linux/lsm_hook_defs.h:409:18: warning: 'uring_override_creds_default' defined but not used [-Wunused-const-variable=]
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
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:394:1: note: in expansion of macro 'LSM_HOOK'
     394 | LSM_HOOK(int, 0, bpf_prog_alloc_security, struct bpf_prog_aux *aux)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:392:18: warning: 'bpf_map_alloc_security_default' defined but not used [-Wunused-const-variable=]
     392 | LSM_HOOK(int, 0, bpf_map_alloc_security, struct bpf_map *map)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:713:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     713 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:392:1: note: in expansion of macro 'LSM_HOOK'
     392 | LSM_HOOK(int, 0, bpf_map_alloc_security, struct bpf_map *map)
         | ^~~~~~~~
   include/linux/lsm_hook_defs.h:391:18: warning: 'bpf_prog_default' defined but not used [-Wunused-const-variable=]
     391 | LSM_HOOK(int, 0, bpf_prog, struct bpf_prog *prog)
         |                  ^~~~~~~~
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
     708 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/uring_sqpoll_default +410 include/linux/lsm_hook_defs.h

   407	
   408	#ifdef CONFIG_IO_URING
 > 409	LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
 > 410	LSM_HOOK(int, 0, uring_sqpoll, void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
