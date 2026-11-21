Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261370;
	b=0s37MubrZUoQ0HV5+U0Af3KkBHiAv1k/Gb2XlxRxgK+0vIUu+XD2uBneU4YdX90Hi4Y4
	 kSefPWCbIEK4art37QaVNAan+IpanrPnS7wc+RkyrZw14mwIkZoOtZcOgrcCLM7jekK3P
	 WvgXx3UT3GJqZYcjQhbHozJA7gDQL/JmUiW/Rt1Uh/thla3SlaDtsdJZppSjzUqb2BnQ4
	 r86g3dGrp552OcFMTwKlPZPnQ5Hp10/o5KRaZP8gI9tw7LCIJLNd+EQlZmtA86QHu0vEQ
	 9kP22PX3yTB1M3PBC46aBOoCCdosRuh9FlTdeqftZ6jpCD9zF0Wwne2k2Y1KvyL1gsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261370;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=VF/zh9gGViLUhlTLchUkDtrkJhM+0ywoZlBU1b1KSGY=;
	b=WZTZzgfPt+mHLynLasaovsFN0qJ0mUBOZ2J2QIlPBi3BE9+laN29sYyBNkwqSGFPNAPO
	 9GO8U+P+by+iNrJXdwKKResRGDEISWlD73YsGBUsnZ/u8jhFitSo/Y97k0CAuZNwoBt6e
	 uUDQ3DTZZtbAxg6Xo8BT7JSsfE9kc3PhUTv7VUkO4wefWqNsmldSh3ed+62s3lj5cguBX
	 6q/hlsS7W6aSzrCjpNTGd8IGaeShnwHJ/VutCRBimyLC1s2kqX+GX7+b8ID1f2vk69EwP
	 WnNDxtgH9cBj5FzyVYcGHtloQwDmzRYR9nvgaC2pT+j5gP/BFSI6NzZrBdISNpej/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJNx5Qhx;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B0606A320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428B0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJNx5Qhx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795261369; x=1826797369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVmKY5SS2zDGBm3d+Bx1OhgL6c0A1yadjEWr0RgINZM=;
  b=IJNx5Qhx1Qoe5zdsTDIW+Kx0x4DylRCjkbwHHUDa09acjNl9vsAcmNi9
   2qbocIbsTFlETaZsD3Iyk7L2nQI8jeSz7w0qpIw3aU17L1xEPkfbsxX+/
   rMawu9VRQ20emINCBJskQnmppUdL44cyIeugNY30HvL/rcNauJTmchsuL
   /85aaU6zpjc6UF35x3Qhp4ni6piNEpdaDaP7HlyBykVlj5XHMXOfYdOw6
   g9hqFs6u/eo+xOq3rICGOjPidFuYsArJYxqr3pM8d2BthBQ5qVcO9qM81
   V3aYZ6ALLmy5Vdhi0hUHNloXlpPFdoibSB2eSpJoTtBnrrpnospdyT7BN
   w==;
X-CSE-ConnectionGUID: EdXmDbO7RVqhC3fOSFjk6w==
X-CSE-MsgGUID: CAWjw2zuQyGRf7KU1lm9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4124976"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4124976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 03:42:49 -0800
X-CSE-ConnectionGUID: Lrg8bOzaTBuBBP92HxkEVQ==
X-CSE-MsgGUID: /LK5sV55Se+xSCUix3INaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11172845"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2026 03:42:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUjUT-000000004J7-0knn;
	Sat, 21 Nov 2026 11:42:45 +0000
Date: Sat, 21 Nov 2026 12:42:12 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Micka=C3=ABl?= =?utf-8?Q?_Sala=C3=BCn"?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, =?utf-8?Q?"G=C3=BCnther?= Noack" <gnoack@google.com>
Subject: [linux-next:master 9036/10560] security/landlock/cap.c:108
 hook_mmap_addr() warn: always true condition '(addr >= 0) => (0-u32max >= 0)'
Message-ID: <20261121123703.ufHSg06x-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   909ef7a9a30fa139e69e555e3606680f5cca7726
commit: 25590e68c40753e28e4713d2dbfde6ba10a7daeb [9036/10560] landlock: Mediate CAP_SYS_RAWIO for mappings below mmap_min_addr
config: m68k-randconfig-2200-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121123703.ufHSg06x-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121123703.ufHSg06x-lkp@intel.com/

New smatch warnings:
security/landlock/cap.c:108 hook_mmap_addr() warn: always true condition '(addr >= 0) => (0-u32max >= 0)'

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'

vim +108 security/landlock/cap.c

    93	
    94	/**
    95	 * hook_mmap_addr - Restrict mappings below dac_mmap_min_addr
    96	 *
    97	 * @addr: Address of the new mapping.
    98	 *
    99	 * cap_mmap_addr() requires CAP_SYS_RAWIO to map below dac_mmap_min_addr, but
   100	 * calls cap_capable() directly, which skips hook_capable().  Check the same
   101	 * condition against the domain.  commoncap runs first, so this only sees
   102	 * mappings that commoncap allowed.
   103	 *
   104	 * Return: 0 if allowed, -EPERM if CAP_SYS_RAWIO use is denied.
   105	 */
   106	static int hook_mmap_addr(unsigned long addr)
   107	{
 > 108		if (addr >= dac_mmap_min_addr)
   109			return 0;
   110	
   111		return check_cap(current_cred(), CAP_SYS_RAWIO, CAP_OPT_NONE);
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
