Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040C2010E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376757; cv=none; b=szjD2UdXdxS9P6gaw78JAAsJCGzVjZ5EV+leIIHkTwEORphhXq9YroM1+fKZOeaUno/SFm25vM7gZ4PwUnUvkJ5TMJz3e0O2/OG4poFbIIwFFGW2AR9E94Sw+ss39a1AWdI6s3iNYwr7Iw5+y2w5Br013T99++U1TtH5Cr3anEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376757; c=relaxed/simple;
	bh=7JJtZdwsczBVYkYi5nTowxOKaz6Q75REdRB7sGW5clc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dTri7Z+uZ47WG5balu2IDUHa3LAW8Yz13De+Sgx+mH871CLoT+94JmSdtRFcmOASSBxaT8zReRol1BsxmwKH68Y5gpVMoZwL9NIkNGjEavQ5B85G5GVkt13XHwv9P9O4VEiqNhROFBXO85P2bplFE23c4/9nlvNMMX519Kx4mEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkC4Q2l6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkC4Q2l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731376756; x=1762912756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JJtZdwsczBVYkYi5nTowxOKaz6Q75REdRB7sGW5clc=;
  b=TkC4Q2l6nlk77kUb7p01io3ua1D10QIgWk/f1AQIokcMP/E2Q+ADaTCC
   YjmJrdWdf00RzNvvFWtoM3He7GmLv/VZ9j1ySjFyubTH+IO5coQ2E79Gl
   HszUBs41qic2IJnbt5ejNYGn08Tqr16v/8ixDqE4zheLLLGFcVQNmTUhx
   /P1KxaX8pHrTBRj4+o6RKWVIZ5oXOMUn/arpAg8LcSN3CNx2DebQbln4C
   yUlhIGIB+87JpKUsfh5Fq0JjcuKydpL2cxD7yvB7xyD3BYdrD3+3hnn/F
   GRN4t069/aoaTKTMtSFY7mRdU152N+JC0UsGHkmx0YUJ0eC4TAw2K1FIC
   A==;
X-CSE-ConnectionGUID: Xo7+2gFrQwS3jxePmOryAw==
X-CSE-MsgGUID: oz9S0QqeScaW60laUlibKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31156022"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31156022"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 17:59:15 -0800
X-CSE-ConnectionGUID: EKZ7PfdNT6ytzF0JxtHhPw==
X-CSE-MsgGUID: 8tLj5sekTLK5Rj5Zhu9RVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; 
   d="scan'208";a="91709184"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2024 17:59:14 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAgBU-0000Ld-00;
	Tue, 12 Nov 2024 01:59:12 +0000
Date: Tue, 12 Nov 2024 09:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 5201/30000]
 arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype
 for '__kernel_time'
Message-ID: <202411120905.w49KEkVE-lkp@intel.com>
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
head:   7e62fa505ac29c320cb5f59527c9ba13421454f0
commit: 7bbd50f11d3086fe75fac78882de0d42e27293fa [5201/30000] ANDROID: arch: arm64: vdso: export the symbols for time()
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241112/202411120905.w49KEkVE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411120905.w49KEkVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411120905.w49KEkVE-lkp@intel.com/

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

   > 9	int __kernel_clock_gettime(clockid_t clock,
    10				   struct __kernel_timespec *ts)
    11	{
    12		return __cvdso_clock_gettime(clock, ts);
    13	}
    14	
    15	int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
    16				  struct timezone *tz)
    17	{
    18		return __cvdso_gettimeofday(tv, tz);
    19	}
    20	
    21	int __kernel_clock_getres(clockid_t clock_id,
    22				  struct __kernel_timespec *res)
    23	{
    24		return __cvdso_clock_getres(clock_id, res);
    25	}
    26	
  > 27	time_t __kernel_time(time_t *time)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
