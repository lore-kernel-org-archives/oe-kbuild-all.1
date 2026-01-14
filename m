Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E83093BF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768421603; cv=none; b=q5X5ubuRMIVmyslG/Zt2FyomlpYX6ddBhmMxKD76bbVTsTgALW2OTjyIv1fOEb1tPkPa71njmR40u1zhNMReUZWg8XJ21Xp3+iAs6rU8H4GCtfilYhEdSIiGxC+o60dtxasqr1INeZr+UZ0roq20YsOsfJc4BA/ov3H7Pl7Sblk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768421603; c=relaxed/simple;
	bh=D+QIz5p5cDXX1KO38GRxWtu1fS8MpTv7579++ScMSrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VR/ifE24/dbWXgQhjtSFk87/TOuhuw9sfpdUC5MSfyXeUtu5YlGJSJZ7Cclo9GEEJslJfUj41gb8GqPft2ve0fGd/rj9fuJgxnqpwguQAi5X9BEYQjGi9e+mdcF5k6LnppieMle5By7Ul5f2YP4KUSgZ3oebbxSiYtKsTm3G1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edP00iEV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edP00iEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768421600; x=1799957600;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D+QIz5p5cDXX1KO38GRxWtu1fS8MpTv7579++ScMSrM=;
  b=edP00iEV6MqeETfepQK/G+++TtkNgX5asNWqUibbsX0IXjB7rCoWrvPB
   EAvq/oVFMmodMkfqWQY6+XYWk47XhIkfbdzj1qIGNJaedYz/m07FJu89T
   rU3Y6NoO6zlN3f/3sAIDGZCkarC+Zw1GmEP7dJyiedWwvUmIJXmXWRuBj
   L+5dHVr+cvpknl0p/YFg0HWUFz5gqjMyseavfi2tBOmBDfHtqf91s9+h8
   q+0qz037BnHOCn07NcpiGou/V2YEbwOH72q4NKk0zhAQZm+OHdhRvwsXG
   2xBoOOPrD4rWO3tKfPLHJ21sxY4+OBqT0OG9+XivQscqmuULkxQJRtqRt
   g==;
X-CSE-ConnectionGUID: PziWT37sTqmDmWMN35e8/Q==
X-CSE-MsgGUID: +uZ0zAqmRGOdDki8Y7kqXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68740652"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="68740652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:13:20 -0800
X-CSE-ConnectionGUID: ThC89W+xTzKGjVCs+cBSLQ==
X-CSE-MsgGUID: ykZtNf17Q4yVtmit6SAoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="203989445"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 12:13:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg7Ex-00000000GxN-3P7r;
	Wed, 14 Jan 2026 20:13:15 +0000
Date: Thu, 15 Jan 2026 04:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/bits-per-long-check 3/3]
 include/asm-generic/bitsperlong.h:16:2: error: Inconsistent word size. Check
 asm/bitsperlong.h
Message-ID: <202601150416.4lKeXma5-lkp@intel.com>
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
config: x86_64-randconfig-161-20260115 (https://download.01.org/0day-ci/arc=
hive/20260115/202601150416.4lKeXma5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260115/202601150416.4lKeXma5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150416.4lKeXma5-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/realmode/rm/header.S:8:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   In file included from arch/x86/include/asm/ibt.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
>> include/asm-generic/bitsperlong.h:16:2: error: Inconsistent word size. C=
heck asm/bitsperlong.h
      16 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^
   1 error generated.


vim +16 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa46 Arnd Bergmann    2009-05-13  13 =20
8bd490bbab4f29e Thomas Wei=C3=9Fschuh 2026-01-14  14  #ifndef BUILD_VDSO
8bd490bbab4f29e Thomas Wei=C3=9Fschuh 2026-01-14  15  #if BITS_PER_LONG !=
=3D __BITS_PER_LONG
c31ae4bb4a9fa46 Arnd Bergmann    2009-05-13 @16  #error Inconsistent word s=
ize. Check asm/bitsperlong.h
c31ae4bb4a9fa46 Arnd Bergmann    2009-05-13  17  #endif
8bd490bbab4f29e Thomas Wei=C3=9Fschuh 2026-01-14  18  #endif
c31ae4bb4a9fa46 Arnd Bergmann    2009-05-13  19 =20

:::::: The code at line 16 was first introduced by commit
:::::: c31ae4bb4a9fa4606a74c0a4fb61b74f804e861e asm-generic: introduce asm/=
bitsperlong.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@klappe2.(none)>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
