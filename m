Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41AE21FF47
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854738; cv=none; b=FI0xoYTgDPtT2Hj0xXKC1zI8LvFaY1727u5ZjYKLF66XBTtwKzyuAb6dWj7n9L37sie1HEB/8GkvDUDKNWob3/Q6rbCVXu6xnpvkCiOHP8+pc6jO9S1jOOqvOuHLLakUnPtUyE+efPIWxpAxVbyfuiueb/Aw+7gSnrNQGbf7LhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854738; c=relaxed/simple;
	bh=kntFpkMWALjVuExOTmm0j7SkmbM4SVEPn6yhcDi7UQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rrFo+cGlYObVzp6HuRq2rl+c+387llzKfmvKGdJM5FvBXZ2u4r8kgWX/+zddirFUqNlx5oms/+/AHebEaKL3PtVjguktH3IVOYaSJ5n8MOCZKCO9L7/UuOB6Z73K716Vm1ELGiSwvOZ7MXqYlYGBxw3TPbmSFnC/OpoNJOPqCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBSzDaXp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBSzDaXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768854737; x=1800390737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kntFpkMWALjVuExOTmm0j7SkmbM4SVEPn6yhcDi7UQw=;
  b=kBSzDaXpkGBaz8qCSMV74A+FO55M8SgruV3Iyu0s/ok+emq023mqepHx
   dLS20Os0XR+lGZg53sg+RPGyv2iwSH99mRykHyxWZtyKtyqqoJibOKNQk
   ORU5N3TwY9pOR10txz93e6a8ki+LOAPkvcm2EnJLeMudntQvU0nToah40
   +ObS+VPMY9k3XxgUk8goIui2tma6gReczPYgMAezl2u//qha4NbxHS0jg
   U+VWLQXL2ctuKqxQVbqdg1eLQDKxtvrP1g50EQvKNmr3Q8cpaGtM8Lb+C
   GqS9+bqVoyMOU7ktZZWdrxHgFWjSncihWpcjB8Y3blaJSs1x7mbh78MfX
   g==;
X-CSE-ConnectionGUID: hZBiTTvCRx2BSbzPPkVhWA==
X-CSE-MsgGUID: ZPMmCjAIQUO3ad8XZLAmqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95539194"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95539194"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 12:32:16 -0800
X-CSE-ConnectionGUID: Gb9PPlnvSxi35fm17QGZfA==
X-CSE-MsgGUID: M4okjbe9Tn+LSd0+/UxMGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="228877529"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 12:32:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvv3-00000000OHl-0TJt;
	Mon, 19 Jan 2026 20:32:13 +0000
Date: Tue, 20 Jan 2026 04:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 6/6]
 include/uapi/asm-generic/bitsperlong.h:38:1: error: static assertion failed:
 "Inconsistent word size. Check uapi/asm/bitsperlong.h"
Message-ID: <202601200653.PrzDVE03-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   2c10d418835ea89400ff0c01e5d51f62a1ae93be
commit: 2c10d418835ea89400ff0c01e5d51f62a1ae93be [6/6] asm-generic/bitsperlong.h: Add sanity checks for __BITS_PER_LONG
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601200653.PrzDVE03-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200653.PrzDVE03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200653.PrzDVE03-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bitsperlong.h:5,
                    from arch/powerpc/include/uapi/asm/bitsperlong.h:11,
                    from include/uapi/asm-generic/int-ll64.h:12,
                    from include/asm-generic/int-ll64.h:11,
                    from arch/powerpc/include/uapi/asm/types.h:28,
                    from arch/powerpc/include/asm/types.h:12,
                    from include/uapi/linux/types.h:5,
                    from include/linux/types.h:6,
                    from arch/powerpc/include/asm/unistd.h:14,
                    from arch/powerpc/kernel/compat_audit.c:4:
   include/uapi/asm-generic/bitsperlong.h:34:2: error: #error Inconsistent word size. Check uapi/asm/bitsperlong.h
      34 | #error Inconsistent word size. Check uapi/asm/bitsperlong.h
         |  ^~~~~
>> include/uapi/asm-generic/bitsperlong.h:38:1: error: static assertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
      38 | _Static_assert(sizeof(long) * 8 == __BITS_PER_LONG,
         | ^~~~~~~~~~~~~~


vim +38 include/uapi/asm-generic/bitsperlong.h

    36	
    37	#ifndef __ASSEMBLER__
  > 38	_Static_assert(sizeof(long) * 8 == __BITS_PER_LONG,
    39		       "Inconsistent word size. Check uapi/asm/bitsperlong.h");
    40	#endif
    41	#endif /* __KERNEL__ */
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
