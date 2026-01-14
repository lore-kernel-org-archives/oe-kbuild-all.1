Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB4E356A35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768423462; cv=none; b=oQwh3k0mkKJhpCbxviGpc1v9q+RzD2N7BLK5QwIcVmfZ7b57/9P7jkyjT5R8Jayd3za7ah3/qV4eUHgkq2SlJau31FJg3scc4VdLVe5suwenMJbiaHdqFRDTCk8zhHUsxsOLbhFYfin1D+VRsj10cESaEocQeJf2d5R7baxEF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768423462; c=relaxed/simple;
	bh=jR+AOTEWLRStc1SnLnHRcYr27Yj2kmuPWKu2AkxLEwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Md0tTssJGuems2JGxWwt5q7ANfbA9kJz/oU6UpTlW6RJaw2rWRSOuPIER5ORBbvkQ1/F380JsqT681TdxjOailaWesWJr4LZ88+gBfHwh9A7H7FlFh2ruLtNJFWWKd06GyacdjjF02akJTAPVuM3SSMjI+SsKSMftUdLAP4+b/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MW6d0KdR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MW6d0KdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768423461; x=1799959461;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jR+AOTEWLRStc1SnLnHRcYr27Yj2kmuPWKu2AkxLEwQ=;
  b=MW6d0KdRZiikv3ZREv+2kuaVj+L9anWDPZg8N93bWFm2xTDFTCf2of8a
   8kl9y9bPwhpv90aj+5F3qs7Zev5WKXxlmmVfcD8BDBT2F7t+vwxPNYqF1
   xMtQFGr9gkOtnE/yxvgHpFTODjFeEzADAY9AOnN2BD5a+DMNwYc1OKEt8
   ffuaktpdsYjSgPSvDwLj5oYthsWBAVgPaVHG9ZzT0WK9GObhAhzRfMeKY
   zTHaQ2nXPgfwbAgS2MEHsVUxkHwcnYBeFuAlICkXug1ktTClmXWigjcL2
   AYY1i+UPj7GfeOfYPmj/i4ZMv79/1dU4m4hklhIwFesl84+y/rw0Cosft
   A==;
X-CSE-ConnectionGUID: /6V/xNrXThqP8rXbgX6m+A==
X-CSE-MsgGUID: DAd1IrbCSxWT61sqGTRbKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57284373"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="57284373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:44:20 -0800
X-CSE-ConnectionGUID: fsI0B59tR4a7P8jKwjqY3g==
X-CSE-MsgGUID: 54+7F5QkRNSNLsXudrXUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204394063"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 12:44:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg7iy-00000000GzM-3jpH;
	Wed, 14 Jan 2026 20:44:16 +0000
Date: Thu, 15 Jan 2026 04:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/bits-per-long-check 3/3]
 include/asm-generic/bitsperlong.h:16:2: error: #error Inconsistent word size.
 Check asm/bitsperlong.h
Message-ID: <202601150440.zly3zDKD-lkp@intel.com>
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
inux.git b4/bits-per-long-check
head:   8bd490bbab4f29e710da9e15f34432daf46dd31e
commit: 8bd490bbab4f29e710da9e15f34432daf46dd31e [3/3] BUILD_VDSO
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260115/=
202601150440.zly3zDKD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260115/202601150440.zly3zDKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150440.zly3zDKD-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11,
                    from include/uapi/asm-generic/int-ll64.h:12,
                    from include/asm-generic/int-ll64.h:11,
                    from include/uapi/asm-generic/types.h:7,
                    from ./arch/x86/include/generated/uapi/asm/types.h:1,
                    from include/uapi/linux/types.h:5,
                    from include/linux/types.h:6,
                    from arch/x86/include/asm/page.h:5,
                    from arch/x86/include/asm/thread_info.h:12,
                    from arch/x86/kernel/vmlinux.lds.S:26:
>> include/asm-generic/bitsperlong.h:16:2: error: #error Inconsistent word =
size. Check asm/bitsperlong.h
      16 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~


vim +16 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  13 =20
8bd490bbab4f29 Thomas Wei=C3=9Fschuh 2026-01-14  14  #ifndef BUILD_VDSO
8bd490bbab4f29 Thomas Wei=C3=9Fschuh 2026-01-14  15  #if BITS_PER_LONG !=3D =
__BITS_PER_LONG
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13 @16  #error Inconsistent word si=
ze. Check asm/bitsperlong.h
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  17  #endif
8bd490bbab4f29 Thomas Wei=C3=9Fschuh 2026-01-14  18  #endif
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  19 =20

:::::: The code at line 16 was first introduced by commit
:::::: c31ae4bb4a9fa4606a74c0a4fb61b74f804e861e asm-generic: introduce asm/=
bitsperlong.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@klappe2.(none)>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
