Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58528981F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 19:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732705; cv=none; b=QfEnUhWQJPTr5egELyGkxhTW0+TIEtsyL6BX/SXspam8+kW+/pAIfESHeDXUZcX3ihhNPa+XyRv+raGFGcxKsdBm9youqZDhV62JTt+VujRsEVDaR5Xrziz6Ou+hJioO0fVQoRbYo64mCjpnQC3WzVj1XlRUHRob4sx7wG7EofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732705; c=relaxed/simple;
	bh=x8pjrd18xdcUuF5OQ7k2zrvmSD7jlWpcgKMzIhDczdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V0eSkONXQXD0TD74NeCsiVRccBZMaSr/+9CV7gYSlJz8Fr5khlbuw18shf4Nfwx62QkMaQax3x1QPVmTZSPXiqWkBOaZWNPJPzNFNRC3D12lFo/tTQFsNnRo7Q6xCoesxLLPqu+l9ISdWYGCsjDeChqfilJASmwlmtwy8P1qwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G85gFW25; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G85gFW25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746732703; x=1778268703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8pjrd18xdcUuF5OQ7k2zrvmSD7jlWpcgKMzIhDczdA=;
  b=G85gFW25HVwq0IYlLC301UXJA6ddNL8OqYcZNGTEMkxZW2QGf2Tq4883
   abZz63mO+iwYjSS34Q60RRqPdBQmowwO6Vl6+RHN9PHIeJPLoMX2Tc+MP
   3uTK0NhiYMsY2RGDUI+HacS7IBXVBiED5ikH/fpnLB959aj1UMvz4/X+W
   I4J1GbbZcbDYlu68yxn89YjTSAnsSIDwtuSawDvfdOKZHD2NVMcDT1E0z
   Xz5Y9WMc6GUp2mTHhTy2LW3FBT8TkmHbbvh+DgbEorRr/wYLeM3cxpKet
   Aj0x0r5yUoao354c+JLY0NlcyFkP+YY1XFguJ39IslkWE6CayEcDJjl4l
   A==;
X-CSE-ConnectionGUID: m9bqrNFNSZaWybT7ZAcfMg==
X-CSE-MsgGUID: eavJQdh/RYSvLASrPwGWmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48651586"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48651586"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:31:39 -0700
X-CSE-ConnectionGUID: N/AVvQ3OSZOkDIU1+B8yYg==
X-CSE-MsgGUID: tPpuysgUQEW0PR2EbSwsmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136906944"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 12:31:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD6xy-000BJ3-2m;
	Thu, 08 May 2025 19:31:34 +0000
Date: Fri, 9 May 2025 03:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1/1] include/linux/lsm_hook_defs.h:410:18:
 warning: 'uring_sqpoll_default' defined but not used
Message-ID: <202505090356.JPYEL9gp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: c10004388b8cf563f38aa7424176b8c01e48331c [1/1] lsm,io_uring: add LSM hooks to io_uring
config: arm64-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090356.JPYEL9gp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090356.JPYEL9gp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090356.JPYEL9gp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> include/linux/lsm_hook_defs.h:410:18: warning: 'uring_sqpoll_default' defined but not used [-Wunused-const-variable=]
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
>> include/linux/lsm_hook_defs.h:409:18: warning: 'uring_override_creds_default' defined but not used [-Wunused-const-variable=]
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
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:394:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, bpf_prog_alloc_security, struct bpf_prog_aux *aux)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:392:18: warning: 'bpf_map_alloc_security_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, bpf_map_alloc_security, struct bpf_map *map)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)
                                   ^~~~
   security/security.c:713:2: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hook_defs.h:392:1: note: in expansion of macro 'LSM_HOOK'
    LSM_HOOK(int, 0, bpf_map_alloc_security, struct bpf_map *map)
    ^~~~~~~~
   include/linux/lsm_hook_defs.h:391:18: warning: 'bpf_prog_default' defined but not used [-Wunused-const-variable=]
    LSM_HOOK(int, 0, bpf_prog, struct bpf_prog *prog)
                     ^
   security/security.c:708:32: note: in definition of macro 'LSM_RET_DEFAULT'
    #define LSM_RET_DEFAULT(NAME) (NAME##_default)


vim +/uring_sqpoll_default +410 include/linux/lsm_hook_defs.h

   407	
   408	#ifdef CONFIG_IO_URING
 > 409	LSM_HOOK(int, 0, uring_override_creds, const struct cred *new)
 > 410	LSM_HOOK(int, 0, uring_sqpoll, void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
