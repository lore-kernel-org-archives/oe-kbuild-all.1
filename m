Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406142087C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783465856; cv=none; b=dhxgXtVpIo62i2x64xphJb6t0i7zbSoK8pSs6fPxMSNlEblFO7ugaQ1Jq0a6OWHYUsEXthVMQNi9jh8PnQhDvV/Q6J7Vhj3FZ8bsa6N3ft7ysUOcoELmJw5U/CAiwG1p/utQYGDO7cNcztP+L6CbegSvl48CSoGzNQukDkvH+HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783465856; c=relaxed/simple;
	bh=iKKZUGCq0lgYzJbVmZcf4J3qNyQ3vb+7SCphi/vY6IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H/oOj3AuF2UYYXty03T+65RJBJ6F8egAZXfHWJs+qSN7VTVFj/7lDRdiwQJPuZi+kdcGcVMTegu268E0y7+UD2wpXmrgVSRVfHaRNIzANSDB7T1/HilCAH9S52CsPOoaw/6OL+WRWYFN0x4S76t8SX8R4Oem6aNPJKdC6QtLZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUOiBEJ1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUOiBEJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783465854; x=1815001854;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iKKZUGCq0lgYzJbVmZcf4J3qNyQ3vb+7SCphi/vY6IY=;
  b=fUOiBEJ1bma53C3lJz3nD/2xLMv/ZHAJuOTK1Pv1z1DIO8+57nr2W3xE
   zSemLloQzc81CtW54KiOBLxQrws6vFabb8RIBaekizeeeRufjH3rC0dHO
   9QfFt56t163vJkA1m5aa7glYhpKbe//0JnC2vMPbiBNIOCKbfnCCYaBRj
   LtKLzcCJz4acLCLxx2Qu3a4KyHQ+HheTIqrCMm6jm4fbNLvJtDuxQOaXT
   ccHoPg0dYVPsuna1Q4aohJr+uyKd2zDLiZ/LhX8wFwnvFkRAf/M5MUvZs
   eczMK1A8CFsFPc8iL7a5TGv5XZXXINbvcrBrHqXCIJSNo//diUlpbzy9/
   Q==;
X-CSE-ConnectionGUID: HF/3iUTiS2SojgCJzQRMfA==
X-CSE-MsgGUID: TQ7QhK7+TKGallSWgwhR8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84148398"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84148398"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 16:10:54 -0700
X-CSE-ConnectionGUID: tv8XrfYNRwS/pRbHutdaLA==
X-CSE-MsgGUID: /gCDJ0niTLe4ERBp1RSr9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258005042"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Jul 2026 16:10:53 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whEwE-000000002cn-1z4G;
	Tue, 07 Jul 2026 23:10:50 +0000
Date: Wed, 08 Jul 2026 01:10:36 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-have_generic_vdso 3/5]
 lib/vdso/Kconfig:27: unexpected 'if' within menu block
Message-ID: <202607080112.WNMfZGvC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-have_generic_vdso
head:   e7bbb5fec675b89cb1e2ff5ccf7bb9651491d888
commit: 0653329d39fdbb29480a2e1d996b1385e3d8beef [3/5] HAVE_GENERIC_VDSO
config: x86_64-rhel-9.4-rust (attached as .config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260708/202607080112.WNMfZGvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080112.WNMfZGvC-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0=
-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/lib/kbuild.sh:5520: make_config_allyes
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5527: make_config
     from /zdci/src/kernel-tests/lib/kbuild.sh:6386: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
>> lib/vdso/Kconfig:27: unexpected 'if' within menu block
>> lib/Kconfig:597: syntax error
   lib/Kconfig:597: invalid statement
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:763: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0=
-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/lib/kbuild.sh:5520: make_config_allyes
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5527: make_config
     from /zdci/src/kernel-tests/lib/kbuild.sh:6382: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:101: main
>> lib/vdso/Kconfig:27: unexpected 'if' within menu block
>> lib/Kconfig:597: syntax error
   lib/Kconfig:597: invalid statement
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:763: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +/if +27 lib/vdso/Kconfig

00b26474c2f161 Vincenzo Frascino  2019-06-21   2 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21   3  config HAVE_GENERIC_VDSO
00b26474c2f161 Vincenzo Frascino  2019-06-21   4  	bool
00b26474c2f161 Vincenzo Frascino  2019-06-21   5 =20
00b26474c2f161 Vincenzo Frascino  2019-06-21   6  config GENERIC_GETTIMEOFD=
AY
00b26474c2f161 Vincenzo Frascino  2019-06-21   7  	bool
0653329d39fdbb Thomas Wei=C3=9Fschuh   2026-07-08   8  	select HAVE_GENERIC=
_VDSO
00b26474c2f161 Vincenzo Frascino  2019-06-21   9  	help
00b26474c2f161 Vincenzo Frascino  2019-06-21  10  	  This is a generic impl=
ementation of gettimeofday vdso.
00b26474c2f161 Vincenzo Frascino  2019-06-21  11  	  Each architecture that=
 enables this feature has to
00b26474c2f161 Vincenzo Frascino  2019-06-21  12  	  provide the fallback i=
mplementation.
00b26474c2f161 Vincenzo Frascino  2019-06-21  13 =20
0c68458b0a5878 Adrian Hunter      2024-03-25  14  config GENERIC_VDSO_OVERF=
LOW_PROTECT
0c68458b0a5878 Adrian Hunter      2024-03-25  15  	bool
0c68458b0a5878 Adrian Hunter      2024-03-25  16  	help
0c68458b0a5878 Adrian Hunter      2024-03-25  17  	  Select to add multipli=
cation overflow protection to the VDSO
0c68458b0a5878 Adrian Hunter      2024-03-25  18  	  time getter functions =
for the price of an extra conditional
0c68458b0a5878 Adrian Hunter      2024-03-25  19  	  in the hotpath.
0c68458b0a5878 Adrian Hunter      2024-03-25  20 =20
4ad10a5f5f78a5 Jason A. Donenfeld 2022-11-18  21  config VDSO_GETRANDOM
4ad10a5f5f78a5 Jason A. Donenfeld 2022-11-18  22  	bool
0653329d39fdbb Thomas Wei=C3=9Fschuh   2026-07-08  23  	select HAVE_GENERIC=
_VDSO
4ad10a5f5f78a5 Jason A. Donenfeld 2022-11-18  24  	help
4ad10a5f5f78a5 Jason A. Donenfeld 2022-11-18  25  	  Selected by architectu=
res that support vDSO getrandom().
258b37c6e62662 Thomas Wei=C3=9Fschuh   2025-08-26  26 =20
258b37c6e62662 Thomas Wei=C3=9Fschuh   2025-08-26 @27  endif

:::::: The code at line 27 was first introduced by commit
:::::: 258b37c6e626625fe441e16ab90e6a542a66eaee vdso: Gate VDSO_GETRANDOM b=
ehind HAVE_GENERIC_VDSO

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
