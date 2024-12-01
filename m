Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE28410A3E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 23:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733094813; cv=none; b=tUtDMRbTXSOF4oEd5dc53s4r6AmKAPr0uqk7y8JVh9Jq/OISvME8FnfNaZtftFvEyOKL+NNxfMjAEFVdyE5tRRGXT2YjG74KKI1OG6QOCS5UcqRhuWXG4pW2tZQCQ5PZvWMFgKXxtjHr7AkQO+qR/rBkShRCpXztfLk3TmbPwn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733094813; c=relaxed/simple;
	bh=v3aHscLPsU8szLPau3udrwFlYkISY2AEUyEKaMmnSlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kcw7dCxF0SjkRQjJVtumaNa2aEUHQ6OGGYMxCuYtaDJmCS8E/JQF0+bRc34cCUsaOI+HANJ3l44csZctdHcxqnaFOCNmoRg9sU7ILh7rXJYEvb9taRLL1+rhobWwc+tCmYDuy+uFg+kY9WTE/HrY1NzaAEK6XFIJLaubv5kGgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wo3V44R2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wo3V44R2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733094812; x=1764630812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v3aHscLPsU8szLPau3udrwFlYkISY2AEUyEKaMmnSlo=;
  b=Wo3V44R2U28yvluoNTKLXPrlMHRBZfSDSwrnHOfLc17AKZxIHqqU8oys
   ZTyeplaS/txTgHsIaurawHIcEl6XXfTYAvKsWBLvOn7bVOsMOLNOhYMrS
   G7lNAt9s2y0oBucvga1hhNL1ZspXmNBB7EWgSx+bBQlkDsCBCE6txYJTa
   c5pIDDph6WzTpHj+Ijt1lxV1whtRepwfTLEYkGTuOYmY2f9iigkFWl3Zt
   3AVVnc1MlsM5La+RUO12FRGoQl8YIIC5w2si908/DwqoUPIsujnr9rjmf
   QjHTlBBrjhGzmzqPKU26nlDaR0xGBaGCaVI99uxLzTxLmw7WT4h6NB9r7
   Q==;
X-CSE-ConnectionGUID: jZAn8sXAQqCf1gif4ZpAQw==
X-CSE-MsgGUID: 0UH1WkrgQZ6+CeGU0mtAZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="32997014"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="32997014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 15:13:32 -0800
X-CSE-ConnectionGUID: l/j6eSjNQH2Di8r+nHWpDQ==
X-CSE-MsgGUID: Vt/veqb2RP+B1VbKZGxuIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93329087"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Dec 2024 15:13:30 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHt7c-0001v7-33;
	Sun, 01 Dec 2024 23:13:13 +0000
Date: Mon, 2 Dec 2024 07:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 4628/30000]
 arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype
 for '__kernel_time'
Message-ID: <202412020709.0fBTGIJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chiawei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   eb0803d4658c42bd3e9de688fb72a1cf6cf4e28a
commit: 7bbd50f11d3086fe75fac78882de0d42e27293fa [4628/30000] ANDROID: arch: arm64: vdso: export the symbols for time()
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241202/202412020709.0fBTGIJl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020709.0fBTGIJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020709.0fBTGIJl-lkp@intel.com/

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
