Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876329A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443523; cv=none; b=OntYxd+BWF9/cIzBfY+IvjtV+2mRMzcQwnXPPZomCOdy52Cuew4uyR0CvaHDhjJlcPlO8jCaJFhsxaLJPSfnQc7Seerc74ipya6sYoTT1SIcldtXfn5GVASur/2MGW1ypR5/qv6qBXXQLM9J6wugypCX57iHbFZXH8wQbltuHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443523; c=relaxed/simple;
	bh=N4FGjZiRvBbaBx7dKMd0QZODbBZbbzF4GlzjGoHMeI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vBeM+1jitO0XP2g5TyxqKp+c7qVFF3gFSZov70/oyQpshtBq2mAYjiLSUGlSA4EbXueenJsQDPj1IzVo5v25Z3TVXiDvbTrssukR6OMFOAWZPbMTCC/IMxvBimoPAxKTMQzPw4wSZjP03aeJpynsC56FD4MyxOwatEevRQYqNvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgtaorTx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgtaorTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768443521; x=1799979521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4FGjZiRvBbaBx7dKMd0QZODbBZbbzF4GlzjGoHMeI0=;
  b=jgtaorTxAbMSUwLIbBDRJp1NKtrHTbjyzpy6SkoH+yLyqFIIiaMTZGCn
   PTesmVwCy52VtyfrpzDroG73iixeMEWUVe9TrVzwB/HIc5tsFYbR2ftVz
   ifUFW+INBeH0RjjsApBeMBt8EhAwgdQXvgRAzBRGhNUpkaHzye1Vrbkwz
   ov6adVCT6bvmXCw66WFIleaSnTuI0FmHMdV4p45fGcg5qAAtZIvsYGTdy
   Zfmy1FANZPePswBHswUrnN6xnRL2L5mKnVGSNpGe7LfiPheiyLy4bQzit
   znmGa37bwuNkseDqfB+PW2wh/aHHnlKydcGZPnvvUEFrVFXJ6iF4wkQpw
   w==;
X-CSE-ConnectionGUID: i7Q2/27mSAWqP0+HEFHS0A==
X-CSE-MsgGUID: ghn4h8H6S6KQWgrDQGjXWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73383465"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73383465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:18:40 -0800
X-CSE-ConnectionGUID: ymIifez0TbmnEB0zth44Rw==
X-CSE-MsgGUID: SP0jDg+lQTSrfm9KgLuO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204456137"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 18:18:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgCwW-00000000HOu-2xfD;
	Thu, 15 Jan 2026 02:18:36 +0000
Date: Thu, 15 Jan 2026 10:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 5/5]
 include/uapi/asm-generic/bitsperlong.h:35:2: error: #error Inconsistent word
 size. Check uapi/asm/bitsperlong.h
Message-ID: <202601151014.yFAZnnqB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   1e275830cc9112314c2b4297c5dd824860f68525
commit: 1e275830cc9112314c2b4297c5dd824860f68525 [5/5] asm-generic/bitsperlong.h: Add sanity checks for __BITS_PER_LONG
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260115/202601151014.yFAZnnqB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151014.yFAZnnqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151014.yFAZnnqB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bitsperlong.h:5,
                    from arch/s390/include/uapi/asm/bitsperlong.h:7,
                    from include/uapi/asm-generic/int-ll64.h:12,
                    from include/asm-generic/int-ll64.h:11,
                    from arch/s390/include/uapi/asm/types.h:11,
                    from arch/s390/include/asm/types.h:6,
                    from arch/s390/include/asm/page.h:12,
                    from arch/s390/kernel/vdso/vdso.lds.S:8:
>> include/uapi/asm-generic/bitsperlong.h:35:2: error: #error Inconsistent word size. Check uapi/asm/bitsperlong.h
      35 | #error Inconsistent word size. Check uapi/asm/bitsperlong.h
         |  ^~~~~
   make[3]: *** [scripts/Makefile.build:443: arch/s390/kernel/vdso/vdso.lds] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:155: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +35 include/uapi/asm-generic/bitsperlong.h

    30	
    31	/* Consistency checks */
    32	#ifdef __KERNEL__
    33	#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
    34	#if __BITS_PER_LONG != (__CHAR_BIT__ * __SIZEOF_LONG__)
  > 35	#error Inconsistent word size. Check uapi/asm/bitsperlong.h
    36	#endif
    37	#endif
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
