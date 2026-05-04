Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60E199931
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 05:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872182; cv=none; b=tSZSiOoSNNm03thB0E5n4VvopVXwxYflN2maPJwRq4DAQ7KnM7aIPg4c/PooGk7fZzxO5UuRr/p9M4HN+aBCoygfVqNCCSqbE7O2rtvCCH0wT4ITzFIy1so6wFn9s8hhca3wGdxXKAxu2x/usmT+aIyw59uPa0YjtH54eydRU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872182; c=relaxed/simple;
	bh=p5/Q3yDR7BygkxggtgA8aFQtPso8EZC5q2sNYG0Rto4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HzBbcW2Vcj1VxJI+KhoP25l7sHlwq9xEWlNiuw/h3rtjB1MoY87GyGdOTvNHA+lfPQck51fhY/vRycpVQrTdngAO3UrZZRSzxfg1Sgv3J2d02b8elL+1ATkD6S+dW1V2k4VSncAR4twh8J9yWsBIlUTCf2XHT+Rfrran/SdPK+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QK4tMq3+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QK4tMq3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777872181; x=1809408181;
  h=date:from:to:cc:subject:message-id;
  bh=p5/Q3yDR7BygkxggtgA8aFQtPso8EZC5q2sNYG0Rto4=;
  b=QK4tMq3+bEeR0wpePVafX2yyb4q6jqWlCXbIXC4AVQ5v0aURuAWhPMet
   uZbcywjjXBajWHisyekK7mrWQFjEQOUC02AZgxnr6Ym8jtRmDInTSnXyS
   M3Pg7+c7Pn4/dX8oddEuEK9VsvXBbKY6fCVBRHRG8o3Ycj2E4F9I2ulJX
   p/x8kchitIjeVCZHfBO9yNuw5FXQ7sOdMRHOQ33mUK6VGo5TTfCH+N7FW
   z1KSWgOhhRpMwIp9TBObO0F6Hfw1Bt3txminWSS1Iw8V/L7+LA5gN+lfL
   RzyIZBtGsvuFOhb1wWTqSnUcKOVD4dvBw0fwZSxdRXBFLo9Xw1eEXtdhx
   A==;
X-CSE-ConnectionGUID: k0rHL28nSvWlqZoqa28tUA==
X-CSE-MsgGUID: 5Xw8+1SoQJSiBaK9+HkGbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78919941"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78919941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 22:23:00 -0700
X-CSE-ConnectionGUID: NHDQNX5FTRqCQJia1xqHdQ==
X-CSE-MsgGUID: cy8ul7rdTqid9W9mhdMQBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="265766197"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2026 22:22:59 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJllS-000000003Uj-3vtv;
	Mon, 04 May 2026 05:22:47 +0000
Date: Mon, 04 May 2026 13:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [linux-next:master 14086/14440] lib/cmdline.c:188: undefined
 reference to `__efistub___lshrdi3'
Message-ID: <202605041353.nsZSMiIC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 7f448f913d6f048e448df40a877be6f5afb5249d [14086/14440] lib: fix memparse() to handle overflow
config: riscv-randconfig-001-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041353.nsZSMiIC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041353.nsZSMiIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041353.nsZSMiIC-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `memparse':
>> lib/cmdline.c:188: undefined reference to `__efistub___lshrdi3'


vim +188 lib/cmdline.c

   140	
   141	/**
   142	 *	memparse - parse a string with mem suffixes into a number
   143	 *	@ptr: Where parse begins
   144	 *	@retptr: (output) Optional pointer to next char after parse completes
   145	 *
   146	 *	Parses a string into a number.  The number stored at @ptr is
   147	 *	potentially suffixed with K, M, G, T, P, E.
   148	 */
   149	
   150	unsigned long long memparse(const char *ptr, char **retptr)
   151	{
   152		char *endptr;	/* local pointer to end of parsed string */
   153		unsigned long long ret = simple_strtoull(ptr, &endptr, 0);
   154		unsigned int shl = 0;
   155	
   156		/* Consume valid suffix even in case of overflow. */
   157		switch (*endptr) {
   158		case 'E':
   159		case 'e':
   160			shl += 10;
   161			fallthrough;
   162		case 'P':
   163		case 'p':
   164			shl += 10;
   165			fallthrough;
   166		case 'T':
   167		case 't':
   168			shl += 10;
   169			fallthrough;
   170		case 'G':
   171		case 'g':
   172			shl += 10;
   173			fallthrough;
   174		case 'M':
   175		case 'm':
   176			shl += 10;
   177			fallthrough;
   178		case 'K':
   179		case 'k':
   180			shl += 10;
   181			fallthrough;
   182		default:
   183			break;
   184		}
   185	
   186		if (shl && likely(ptr != endptr)) {
   187			/* Have valid suffix with preceding number. */
 > 188			if (unlikely(check_shl_overflow(ret, shl, &ret)))
   189				ret = ULLONG_MAX;
   190			endptr++;
   191		}
   192	
   193		if (retptr)
   194			*retptr = endptr;
   195	
   196		return ret;
   197	}
   198	EXPORT_SYMBOL(memparse);
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
