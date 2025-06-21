Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51C3D69
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750510975; cv=none; b=iGRi61dAjtP+sZr9MmL+Dt7irS3ERFSE1Gx8AdV8whP1W70OqFDxOJziOcrBSDRE0wD/GF1lUZN38By77RyupJrut3dGB++Up1unWFOdaTGlx/D4qwPnbrl0OyopMOubdxzqYevMQelYjt/9hctFO8ZfgWVBz7UMB6lHSI7nDdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750510975; c=relaxed/simple;
	bh=y9nIhriWDjCqNmTam3MvN8/AwbXTVkFCnaCoyIFn0XM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOuGS74jL1tFFtMg8kr/bbkT0IJYddQorgXE17n/4F1fO2nZIzI8FQx2u+NwqudmGd3QpZcQIjvygxGJPIF8fYVFqU+JWRoNFtasTCJTUCNqO3D7QoXsXk91aOEYpuodNTfqOW63R0OJgYSPuWWE13tVFIlm/L/ENboWK4/zPB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHPcnOrR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHPcnOrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750510974; x=1782046974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9nIhriWDjCqNmTam3MvN8/AwbXTVkFCnaCoyIFn0XM=;
  b=OHPcnOrRnh0G7daaFY5jvZj88Rm64KOl2U8nEtEu+4OJuqmILdfSzPIN
   o/+7Wt3ISIMZ6O3ilwbUDlclxMde71rDxcpkLJ2ccs4yoZ+KSgvjr4u79
   ODODmeqjUEqV4DwknL8ZGv9X4VdakzoM87ghNMZv5qGKYpmWFVAj+ANFS
   ibErSP82+5ZoWA39VpQXFsW1IjLdMvJJHSYdt0//Io23foJHLapq2Nc74
   AGMYEDvvYSdkCvurd/mxd1rg414ykyVqrBjpV1Pz6o/0Bh89sF90c8WPR
   yr37eNgUJndP3bkWDxZwbFL4C/PON2cRcRjmdIhODcT8I3BYiNyewfu+j
   A==;
X-CSE-ConnectionGUID: /hCehwS/R/qB5XvEaw40Iw==
X-CSE-MsgGUID: aqSzZPUGTGChadJpJKV8kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="63029289"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="63029289"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 06:02:54 -0700
X-CSE-ConnectionGUID: uGIQwDWKQtibqfhVFt+93w==
X-CSE-MsgGUID: BBbRWzYMS+ShlJ68Difa/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="150741997"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jun 2025 06:02:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSxru-000Md2-19;
	Sat, 21 Jun 2025 13:02:50 +0000
Date: Sat, 21 Jun 2025 21:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 37/49]
 lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:182:48:
 error: 'AT_SYSINFO_EHDR' undeclared
Message-ID: <202506212049.uPkoikVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   7c2a5fb4d342d9fee958d8881e69704a964a7982
commit: 8cb2dc8e9b5a360dd41ca1df062e7a0045848c0b [37/49] vdso: hook up selftests to kunit
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250621/202506212049.uPkoikVo-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506212049.uPkoikVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506212049.uPkoikVo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/vdso/tests/vdso_test_abi.c:4:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c: In function 'main':
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:182:48: error: 'AT_SYSINFO_EHDR' undeclared (first use in this function)
     182 |         unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
         |                                                ^~~~~~~~~~~~~~~
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:182:48: note: each undeclared identifier is reported only once for each function it appears in
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:192:28: error: 'VDSO_VERSION' undeclared (first use in this function); did you mean 'EI_VERSION'?
     192 |         version = versions[VDSO_VERSION];
         |                            ^~~~~~~~~~~~
         |                            EI_VERSION
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c:193:38: error: 'VDSO_NAMES' undeclared (first use in this function)
     193 |         name = (const char **)&names[VDSO_NAMES];
         |                                      ^~~~~~~~~~
--
   In file included from lib/vdso/tests/vdso_test_getcpu.c:4:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c: In function 'main':
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c:25:40: error: 'VDSO_VERSION' undeclared (first use in this function); did you mean 'EI_VERSION'?
      25 |         const char *version = versions[VDSO_VERSION];
         |                                        ^~~~~~~~~~~~
         |                                        EI_VERSION
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c:25:40: note: each undeclared identifier is reported only once for each function it appears in
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c:26:51: error: 'VDSO_NAMES' undeclared (first use in this function)
      26 |         const char **name = (const char **)&names[VDSO_NAMES];
         |                                                   ^~~~~~~~~~
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_getcpu.c:32:34: error: 'AT_SYSINFO_EHDR' undeclared (first use in this function)
      32 |         sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
         |                                  ^~~~~~~~~~~~~~~
--
   In file included from lib/vdso/tests/vdso_test_gettimeofday.c:4:
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c: In function 'main':
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:26:40: error: 'VDSO_VERSION' undeclared (first use in this function); did you mean 'EI_VERSION'?
      26 |         const char *version = versions[VDSO_VERSION];
         |                                        ^~~~~~~~~~~~
         |                                        EI_VERSION
   lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:26:40: note: each undeclared identifier is reported only once for each function it appears in
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:27:51: error: 'VDSO_NAMES' undeclared (first use in this function)
      27 |         const char **name = (const char **)&names[VDSO_NAMES];
         |                                                   ^~~~~~~~~~
>> lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_gettimeofday.c:29:48: error: 'AT_SYSINFO_EHDR' undeclared (first use in this function)
      29 |         unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
         |                                                ^~~~~~~~~~~~~~~


vim +/AT_SYSINFO_EHDR +182 lib/vdso/tests/../../../tools/testing/selftests/vDSO/vdso_test_abi.c

ec049891b2dc16 Vincenzo Frascino 2022-01-31  179  
693f5ca08ca076 Vincenzo Frascino 2020-10-26  180  int main(int argc, char **argv)
693f5ca08ca076 Vincenzo Frascino 2020-10-26  181  {
693f5ca08ca076 Vincenzo Frascino 2020-10-26 @182  	unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
ec049891b2dc16 Vincenzo Frascino 2022-01-31  183  
ec049891b2dc16 Vincenzo Frascino 2022-01-31  184  	ksft_print_header();
ec049891b2dc16 Vincenzo Frascino 2022-01-31  185  	ksft_set_plan(VDSO_TEST_PLAN);
693f5ca08ca076 Vincenzo Frascino 2020-10-26  186  
693f5ca08ca076 Vincenzo Frascino 2020-10-26  187  	if (!sysinfo_ehdr) {
25cfe960a858dd Mark Brown        2023-11-23  188  		ksft_print_msg("AT_SYSINFO_EHDR is not present!\n");
693f5ca08ca076 Vincenzo Frascino 2020-10-26  189  		return KSFT_SKIP;
693f5ca08ca076 Vincenzo Frascino 2020-10-26  190  	}
693f5ca08ca076 Vincenzo Frascino 2020-10-26  191  
693f5ca08ca076 Vincenzo Frascino 2020-10-26 @192  	version = versions[VDSO_VERSION];
693f5ca08ca076 Vincenzo Frascino 2020-10-26 @193  	name = (const char **)&names[VDSO_NAMES];
693f5ca08ca076 Vincenzo Frascino 2020-10-26  194  
25cfe960a858dd Mark Brown        2023-11-23  195  	ksft_print_msg("[vDSO kselftest] VDSO_VERSION: %s\n", version);
693f5ca08ca076 Vincenzo Frascino 2020-10-26  196  
693f5ca08ca076 Vincenzo Frascino 2020-10-26  197  	vdso_init_from_sysinfo_ehdr(getauxval(AT_SYSINFO_EHDR));
693f5ca08ca076 Vincenzo Frascino 2020-10-26  198  
ec049891b2dc16 Vincenzo Frascino 2022-01-31  199  	vdso_test_gettimeofday();
693f5ca08ca076 Vincenzo Frascino 2020-10-26  200  

:::::: The code at line 182 was first introduced by commit
:::::: 693f5ca08ca0767b407b7ca634dbf1b783676ec3 kselftest: Extend vDSO selftest

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
