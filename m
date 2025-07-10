Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C321259CA7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154707; cv=none; b=g2EyWlKoWeHpSw/SGB9GVhL3nKcwJHMWaLTJe/EKGUGEhvQuNDQhbVOTCr4LsQkLnHx2OE/QCq7uV0Q5EnZXxT4veGzj9a+JaNv+UUkRbwAONjGkiU0ru30ygBkE60dtEqMbfWqNlrpG1Va6I96qvl1KHI/QsSysufwukpwdkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154707; c=relaxed/simple;
	bh=2cKlhrHRJ1eO7/j+78PufSuGY5J1P1WUaWIiQIgb6ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KT1NUNhta/i9RezsNK2kggVbOzBIM6VC2mrJ4xvF1P7+8pb0h7McOyfBxILE1cQ1VjVgTO4d0DtwhvM4AXr66CZuLyzDDPFVdljug3pIcOPO4TEJsIS6VWYeE1dKb0o3bNo2k0bLXjje0UOEh892VjEl8jfqb67A04dzloIoMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hwx/c2mr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hwx/c2mr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752154705; x=1783690705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cKlhrHRJ1eO7/j+78PufSuGY5J1P1WUaWIiQIgb6ZY=;
  b=Hwx/c2mrET/IJfR9RnYM02cRy9dsUrcOmHIBw6hfPyIZCKC30SG0yndE
   nwwhNkARi18a5kVFYKVaLuGf2FRjzi0nwDLrBEjPEevHGN+/5P0qDdSr9
   E1PRNd24N26TQdraw89Ftw5KyTutnI80PzFBGYsA3fP0GFMfHPVth+5Bx
   gzkJU/dn0ZE/UFsnKLKh9gsQLoIFj1FD+j2Dsc4CJ5z62kxl1Usa0AlPo
   ELLJNHzamKYbmOL0fj04NK6evsprht/Gr4aFGTbYgtgT12yn+XUGP0edN
   DMrRWZ/ZZRXa9rVdinCrsJhIQ3dzI5KMUxsOToOvcAWaV+Ap1Z9kv7zAV
   A==;
X-CSE-ConnectionGUID: a2ihZUnsSrW9T0vdgeizzA==
X-CSE-MsgGUID: DH7Ixnh2SUmUSSoXJ2FYfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65787055"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65787055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:38:25 -0700
X-CSE-ConnectionGUID: 54HblQEtQOuSm9Yfv4sIfw==
X-CSE-MsgGUID: iyWcRRoQR7OUifXP9+4VOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156808205"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2025 06:38:24 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZrTh-00009W-2y;
	Thu, 10 Jul 2025 13:38:21 +0000
Date: Thu, 10 Jul 2025 15:37:42 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype
 for '__kernel_time'
Message-ID: <202507101502.cJE0B8wu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d72ce6ed64bff7c0d20b483c34d3a80f3069205c
commit: 7bbd50f11d3086fe75fac78882de0d42e27293fa [1/1] ANDROID: arch: arm64: vdso: export the symbols for time()
config: arm64-randconfig-2003-20250630 (https://download.01.org/0day-ci/archive/20250710/202507101502.cJE0B8wu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101502.cJE0B8wu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101502.cJE0B8wu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/vdso/vgettimeofday.c:9:5: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
       9 | int __kernel_clock_gettime(clockid_t clock,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:15:5: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
      15 | int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:21:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
      21 | int __kernel_clock_getres(clockid_t clock_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype for '__kernel_time' [-Wmissing-prototypes]
      27 | time_t __kernel_time(time_t *time)
         |        ^~~~~~~~~~~~~
--
   scripts/extract-cert.c: In function 'display_openssl_errors':
   scripts/extract-cert.c:46:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |         ^~~~~
   In file included from scripts/extract-cert.c:23:
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'drain_openssl_errors':
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |         ^~~~~
   /usr/include/openssl/err.h:423:15: note: declared here
     423 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'main':
   scripts/extract-cert.c:124:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from scripts/extract-cert.c:24:
   /usr/include/openssl/engine.h:358:28: note: declared here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:126:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                 ^
   /usr/include/openssl/engine.h:336:31: note: declared here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         |                               ^~~~~~~~~~~~
   scripts/extract-cert.c:128:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                 ^~
   /usr/include/openssl/engine.h:620:27: note: declared here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         |                           ^~~~~~~~~~~
   scripts/extract-cert.c:133:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                         ^~~
   /usr/include/openssl/engine.h:479:5: note: declared here
     479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:134:17: warning: 'ENGINE_ctrl_cmd' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^~~~~~~~~~~~~~~
   /usr/include/openssl/engine.h:450:27: note: declared here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         |                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:9:5: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
       9 | int __kernel_clock_gettime(clockid_t clock,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:15:5: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
      15 | int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:21:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
      21 | int __kernel_clock_getres(clockid_t clock_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype for '__kernel_time' [-Wmissing-prototypes]
      27 | time_t __kernel_time(time_t *time)
         |        ^~~~~~~~~~~~~


vim +/__kernel_time +27 arch/arm64/kernel/vdso/vgettimeofday.c

    26	
  > 27	time_t __kernel_time(time_t *time)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
