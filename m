Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B24337BB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173136; cv=none; b=Z121iSQXeseOH/wvf9CPAceiPXJuFLjGL1bP9OSmrV1I6KelJzPOhYMiuS+4Ke886K6g7hzA9MYxY63T3GfKVM5tTqlTFisUtH+86v1YCYvm2KSQD0KtfW1BLUkMyymRdFp7YX79l2hTUfO3Jgg7uhnKvEWkrjK87sKTnYU/pbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173136; c=relaxed/simple;
	bh=P4xy7AxEOMKIaKgWfrQb+98xUGqW6+Li2Ailv2Fb9bQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RnRd4LorLf5Yzu7pFxpLbYZDr0fl5Uo78npG4sQHjoYVQlM4adj4AEkHNeGLEEvnB6yQYJ6mMRDYEOem8UYvRxPqsOJxdHTaNMTW2G5qBKIP3DTvc0MKvPMCrRZ3Esyg1fVXqgyHd6c8pYb2nxGrSRROZt8j3gaQ+QdS3jzGcz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIe7lSus; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIe7lSus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779173135; x=1810709135;
  h=date:from:to:cc:subject:message-id;
  bh=P4xy7AxEOMKIaKgWfrQb+98xUGqW6+Li2Ailv2Fb9bQ=;
  b=CIe7lSusB32LZcRGB9Gespfum4tZEkCodZeKcpa//cRLzeY7v8iqeV5p
   oBPpUH1ZH7zGSCZq+SMLNMJf2r4vrCfnfzYtaUqdlKlK2JQdsrQbAUZQa
   T7Z140XGmUqzEeBr2XkcN8E7apxp0b6w6fJ0bp+MO63Wx+um7ICeWuIW/
   b75xNlqDxwKqFXv0f+13/+Zh2VbhBd11DmFJsijJRGgIEJi1FVJdAj+s1
   Odsld30tT3XQS93FS7xCVPdhmejWJcgTGfN2lcT17QpOntKjZBciTGI0a
   ei+xYrkdnHWrPmysP2uR2ByvGMPo3bJEPZt+nVS7CiPowJjohDc4WcnL+
   w==;
X-CSE-ConnectionGUID: mXtYaTphTQ67ZxSuwZ6ZWw==
X-CSE-MsgGUID: udGx65aOQfSkeHX/8f2wpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91435827"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91435827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 23:45:35 -0700
X-CSE-ConnectionGUID: u/QO4RTTTkK6ATjkCvenWg==
X-CSE-MsgGUID: 2ufuI6qMSNKj+SDKOl8kMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237051093"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2026 23:45:32 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPEBy-000000000az-3cn2;
	Tue, 19 May 2026 06:44:48 +0000
Date: Tue, 19 May 2026 14:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Brian Masney <bmasney@redhat.com>
Subject: [linux-next:master 4652/6115]
 arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from
 constant value (18720 becomes 8720)
Message-ID: <202605191434.PQkj2Rki-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   80dd246accce631c328ea43294e53b2b2dd2aa32
commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8 [4652/6115] clk: rockchip: allow COMPILE_TEST builds
config: m68k-randconfig-r133-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191434.PQkj2Rki-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191434.PQkj2Rki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
>> arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (18720 becomes 8720)
>> arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bits from constant value (1e8e8 becomes e8e8)

vim +57 arch/m68k/include/asm/hash.h

14c44b95b3dcb8f George Spelvin 2016-05-26   4  
14c44b95b3dcb8f George Spelvin 2016-05-26   5  /*
14c44b95b3dcb8f George Spelvin 2016-05-26   6   * If CONFIG_M68000=y (original mc68000/010), this file is #included
14c44b95b3dcb8f George Spelvin 2016-05-26   7   * to work around the lack of a MULU.L instruction.
14c44b95b3dcb8f George Spelvin 2016-05-26   8   */
14c44b95b3dcb8f George Spelvin 2016-05-26   9  
14c44b95b3dcb8f George Spelvin 2016-05-26  10  #define HAVE_ARCH__HASH_32 1
14c44b95b3dcb8f George Spelvin 2016-05-26  11  /*
14c44b95b3dcb8f George Spelvin 2016-05-26  12   * While it would be legal to substitute a different hash operation
14c44b95b3dcb8f George Spelvin 2016-05-26  13   * entirely, let's keep it simple and just use an optimized multiply
14c44b95b3dcb8f George Spelvin 2016-05-26  14   * by GOLDEN_RATIO_32 = 0x61C88647.
14c44b95b3dcb8f George Spelvin 2016-05-26  15   *
14c44b95b3dcb8f George Spelvin 2016-05-26  16   * The best way to do that appears to be to multiply by 0x8647 with
14c44b95b3dcb8f George Spelvin 2016-05-26  17   * shifts and adds, and use mulu.w to multiply the high half by 0x61C8.
14c44b95b3dcb8f George Spelvin 2016-05-26  18   *
14c44b95b3dcb8f George Spelvin 2016-05-26  19   * Because the 68000 has multi-cycle shifts, this addition chain is
14c44b95b3dcb8f George Spelvin 2016-05-26  20   * chosen to minimise the shift distances.
14c44b95b3dcb8f George Spelvin 2016-05-26  21   *
14c44b95b3dcb8f George Spelvin 2016-05-26  22   * Despite every attempt to spoon-feed it simple operations, GCC
14c44b95b3dcb8f George Spelvin 2016-05-26  23   * 6.1.1 doggedly insists on doing annoying things like converting
14c44b95b3dcb8f George Spelvin 2016-05-26  24   * "lsl.l #2,<reg>" (12 cycles) to two adds (8+8 cycles).
14c44b95b3dcb8f George Spelvin 2016-05-26  25   *
14c44b95b3dcb8f George Spelvin 2016-05-26  26   * It also likes to notice two shifts in a row, like "a = x << 2" and
14c44b95b3dcb8f George Spelvin 2016-05-26  27   * "a <<= 7", and convert that to "a = x << 9".  But shifts longer
14c44b95b3dcb8f George Spelvin 2016-05-26  28   * than 8 bits are extra-slow on m68k, so that's a lose.
14c44b95b3dcb8f George Spelvin 2016-05-26  29   *
14c44b95b3dcb8f George Spelvin 2016-05-26  30   * Since the 68000 is a very simple in-order processor with no
14c44b95b3dcb8f George Spelvin 2016-05-26  31   * instruction scheduling effects on execution time, we can safely
14c44b95b3dcb8f George Spelvin 2016-05-26  32   * take it out of GCC's hands and write one big asm() block.
14c44b95b3dcb8f George Spelvin 2016-05-26  33   *
14c44b95b3dcb8f George Spelvin 2016-05-26  34   * Without calling overhead, this operation is 30 bytes (14 instructions
14c44b95b3dcb8f George Spelvin 2016-05-26  35   * plus one immediate constant) and 166 cycles.
14c44b95b3dcb8f George Spelvin 2016-05-26  36   *
14c44b95b3dcb8f George Spelvin 2016-05-26  37   * (Because %2 is fetched twice, it can't be postincrement, and thus it
14c44b95b3dcb8f George Spelvin 2016-05-26  38   * can't be a fully general "g" or "m".  Register is preferred, but
14c44b95b3dcb8f George Spelvin 2016-05-26  39   * offsettable memory or immediate will work.)
14c44b95b3dcb8f George Spelvin 2016-05-26  40   */
14c44b95b3dcb8f George Spelvin 2016-05-26  41  static inline u32 __attribute_const__ __hash_32(u32 x)
14c44b95b3dcb8f George Spelvin 2016-05-26  42  {
14c44b95b3dcb8f George Spelvin 2016-05-26  43  	u32 a, b;
14c44b95b3dcb8f George Spelvin 2016-05-26  44  
14c44b95b3dcb8f George Spelvin 2016-05-26  45  	asm(   "move.l %2,%0"	/* a = x * 0x0001 */
14c44b95b3dcb8f George Spelvin 2016-05-26  46  	"\n	lsl.l #2,%0"	/* a = x * 0x0004 */
14c44b95b3dcb8f George Spelvin 2016-05-26  47  	"\n	move.l %0,%1"
14c44b95b3dcb8f George Spelvin 2016-05-26  48  	"\n	lsl.l #7,%0"	/* a = x * 0x0200 */
14c44b95b3dcb8f George Spelvin 2016-05-26  49  	"\n	add.l %2,%0"	/* a = x * 0x0201 */
14c44b95b3dcb8f George Spelvin 2016-05-26  50  	"\n	add.l %0,%1"	/* b = x * 0x0205 */
14c44b95b3dcb8f George Spelvin 2016-05-26  51  	"\n	add.l %0,%0"	/* a = x * 0x0402 */
14c44b95b3dcb8f George Spelvin 2016-05-26  52  	"\n	add.l %0,%1"	/* b = x * 0x0607 */
14c44b95b3dcb8f George Spelvin 2016-05-26  53  	"\n	lsl.l #5,%0"	/* a = x * 0x8040 */
14c44b95b3dcb8f George Spelvin 2016-05-26  54  	: "=&d,d" (a), "=&r,r" (b)
14c44b95b3dcb8f George Spelvin 2016-05-26  55  	: "r,roi?" (x));	/* a+b = x*0x8647 */
14c44b95b3dcb8f George Spelvin 2016-05-26  56  
14c44b95b3dcb8f George Spelvin 2016-05-26 @57  	return ((u16)(x*0x61c8) << 16) + a + b;
14c44b95b3dcb8f George Spelvin 2016-05-26  58  }
14c44b95b3dcb8f George Spelvin 2016-05-26  59  

:::::: The code at line 57 was first introduced by commit
:::::: 14c44b95b3dcb8ff1d627e6b78f57c4373d375cb m68k: Add <asm/hash.h>

:::::: TO: George Spelvin <linux@sciencehorizons.net>
:::::: CC: George Spelvin <linux@sciencehorizons.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
