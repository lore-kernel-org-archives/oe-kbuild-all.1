Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009913EBF2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293008; cv=none; b=reu4H8i/g8olY7AhdgREmVcEgJN2H3sLAx551h9vzW+6qkeIJW7vLfJr4d2mTKnng6d9XVeB7A3OSXpWiXl9VHMjjMa1EQt7WSxeKoNrMjHKzg+/nKhamVNNs5mKgxGOTjt/xwK2TzZ2RoAmGem0UNoZMAqSStaqafK0iyUchsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293008; c=relaxed/simple;
	bh=KRqaVG6SyDIaElOivYQZJ/N1fT3m+lSPUk77+QfOnMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=siYeNFwzSEzZ9K0YpuuA/5eftkvwIFI03vdYncJt6JLjuQwsdvEjkxpbNo7vKxxfw59vACJjg3Sb3dzruCpTdPnTMVeQ8Hjt6EA9nALplTsJVS585XPptLmepfxRM5hWeQ3iemQMsELNM13utbuFTqVqHMeKZGm76TdsikeKRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jefGJMWu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jefGJMWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293007; x=1802829007;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KRqaVG6SyDIaElOivYQZJ/N1fT3m+lSPUk77+QfOnMc=;
  b=jefGJMWu+Uw3hw9nVRGgEzevcvJvmmBuETjfM/J6tmHlBdmWaINLIdTF
   wTMqDmF0L1QP1NJBXMqWPmhits0N8xUjl0NJffGe2JMwOeoTyZeieWn6F
   tdCO9y7A43RiSpvDlQQmwKxEI7VKc8RFqBsEXM0LoTngnsf/W/g/Il6ZT
   6k9Pbn8WudhSwb/pZQ4/4SzLubIenGbTWbEf7gi5dRJTjvMJjNGPJBMgB
   kYHos0z9FiimBvLBtkEA92ZbaXVRug2YVdsPiO/Zlh9VUU+Y3vMIz2b/d
   1H0VWTQP+u/8agBbhorkKHd6KD5iI8syV7JE51XKaS5MMQSwepOeSxkxt
   A==;
X-CSE-ConnectionGUID: eXCKFQ2qQJWthqFy35UuLw==
X-CSE-MsgGUID: cVukSPn7S5eWkKjaZJ1yQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82996447"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82996447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:50:04 -0800
X-CSE-ConnectionGUID: /p3JAM5ZQFC6A6kztyOv+Q==
X-CSE-MsgGUID: i6cRCHVjQX6HCejXqd6pBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217714755"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 17:50:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsADw-000000010Ty-3GTD;
	Tue, 17 Feb 2026 01:50:00 +0000
Date: Tue, 17 Feb 2026 09:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time /9]
 arch/mips/vdso/vgettimeofday.c:47:5: error: static declaration of
 '__vdso_clock_gettime64' follows non-static declaration
Message-ID: <202602170914.SSESHnV1-lkp@intel.com>
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
inux.git b4/vdso-compat_32bit_time
head:   b08c091b9f1d126d4ec8f7e985f468fed0359793
commit: f8d2fce36a976be2820a236aad541627dc50b465 [/9] mips
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20260217/=
202602170914.SSESHnV1-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260217/202602170914.SSESHnV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170914.SSESHnV1-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

>> arch/mips/vdso/vgettimeofday.c:47:5: error: static declaration of '__vds=
o_clock_gettime64' follows non-static declaration
      47 | int __vdso_clock_gettime64(clockid_t clock,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/mips/vdso/vgettimeofday.c:12:
   include/vdso/gettime.h:27:5: note: previous declaration of '__vdso_clock=
_gettime64' with type 'int(clockid_t,  struct __kernel_timespec *)' {aka 'i=
nt(int,  struct __kernel_timespec *)'}
      27 | int __vdso_clock_gettime64(clockid_t clock, struct __kernel_time=
spec *ts);
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> include/vdso/gettime.h:24:21: warning: '__vdso_time' declared 'static' b=
ut never defined [-Wunused-function]
      24 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
         |                     ^~~~~~~~~~~


vim +/__vdso_clock_gettime64 +47 arch/mips/vdso/vgettimeofday.c

abed3d826f2fb7 Vincenzo Frascino 2019-06-21  45 =20
f8d2fce36a976b Thomas Wei=C3=9Fschuh  2026-02-16  46  __time32_symbol
1f66c45db33023 Vincenzo Frascino 2019-06-21 @47  int __vdso_clock_gettime64=
(clockid_t clock,
1f66c45db33023 Vincenzo Frascino 2019-06-21  48  			   struct __kernel_time=
spec *ts)
1f66c45db33023 Vincenzo Frascino 2019-06-21  49  {
1f66c45db33023 Vincenzo Frascino 2019-06-21  50  	return __cvdso_clock_gett=
ime(clock, ts);
1f66c45db33023 Vincenzo Frascino 2019-06-21  51  }
1f66c45db33023 Vincenzo Frascino 2019-06-21  52 =20

:::::: The code at line 47 was first introduced by commit
:::::: 1f66c45db3302386ca3bb3b5ed05248434237fc9 mips: Add clock_gettime64 e=
ntry point

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Paul Burton <paul.burton@mips.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
