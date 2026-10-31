Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463390;
	b=QyfKQWGPV9FUOCPRsaRaMn7s0eyw3LaXA9DEsaGNHwyTOoa3vfNfs3LlJPefY48oVni/
	 Mn+iR2RXa6vgkndW7g5MYhvq65Mxvo+X+MuaT4d3pY6IfOTso0lQSfCPrJ5eJDH/p9bev
	 ePSGRXOLD1zTc9JdfHfjPxX0R1vvYK2U/IKyEpnzKgafkPl3onWTX5CbJuK90SdD1XRw7
	 zuqldk1iCo8H4oXfBX9b+Pj+UnA7XRxCmTAMMjPJYlFixvqcVaBvUD22QxWNC/rGAPbve
	 gdUOKsLO1kL7Qc0xcLyrlezflC1p1mawO18EyFbzy0N8Nyil5LNlFuiwTut4RtiHMBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463390;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=HK9Xn0Rgqjzkply4FGDu4Bq8iqZzIA4WsPYXwbnQBMo=;
	b=4i7Y4FRc+GF/34Wy/2jJs5mpxwzwhc8MsIVCFjV2fBQkJc70Afq8sMwQJ1v5hpK4sNO0
	 VHQq7hEgOQHNxCaktXIiIy7E+/P+8A53T2ByMLFR3qRKzow4Swi+STtrLY1Uf0SNiTRTa
	 X9hSZzAnXWjv04n6WWehDlEwPWzzVU3vxMfqj8Tq8q4QWCROukug7c+yWL2Rv9Q0VDlSy
	 NZGhiNZLspG3ybyQby3AumEOBxiNZXXMiPRRiH+NneyiPAQBGFIcR4wvpPCWE1LypCWun
	 Ki1joigma4Bl3j+PY4PBT9c8wscED/S07o/IaraPc4lbAsBVnUqK3zZg0/UM+wqvJCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZdwvUxdy;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF245606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 16:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF245606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZdwvUxdy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793463388; x=1824999388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJmRjkBqyTwSUrTE3m6DW9MRMvcEzJZ1oBuRaaJ/G5E=;
  b=ZdwvUxdyANbYbSO2WgNISDOmGpk38oUxv/5EhE+1C8fzTxeYedsAlTVg
   nP5BYqIPFXTBcL6VWKciFzaSh44lffGRFSt7/DPxi3iE8+R5Ws1UbqLlQ
   1IdBnvosqyaofNIXAPxyT+5KBM2B0BpzMtc3TX8jvv8Ld5ULxkCNI8CbC
   qhfj9CqybRngw8ATqWDsnim+6Va0bGZZKMMAxvE+OxatxTnulX6p6T6Vd
   fqYkKpv5WPW5OGD3amSwr6SflsyknqfnkpCZPL+AcU0pMmBPDAqZo7Owz
   E3oeoScB7BqyFnMSmX3IheqLoV8vuOd9tUrCvxGJvvLC6KWDUW5ojnBW6
   Q==;
X-CSE-ConnectionGUID: ZleSRNG6TTKddt4Fr+euow==
X-CSE-MsgGUID: RF2zWr3jRM6eJM8jPLwctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2231732"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2231732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 09:16:27 -0700
X-CSE-ConnectionGUID: 95aQbypgR8Gxls8dM2ZtTg==
X-CSE-MsgGUID: 3waIpoHbTOC+7QDY9c4waw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5561187"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 31 Oct 2026 09:16:26 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNBkm-0000000063H-00rK;
	Sat, 31 Oct 2026 16:16:24 +0000
Date: Sat, 31 Oct 2026 17:16:06 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 21/25]
 lib/kunit/kunit-test.c:923: undefined reference to `kunit_uapi_run_kselftest'
Message-ID: <202610311735.5IJZCVYR-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   08d947e58a57885e518ef1b6ab3c81f199eac864
commit: 2b26a679c2fe1852afbbe25c9916d43c3136d0c8 [21/25] kunit: uapi: Validate the usability of /proc
config: mips-randconfig-r2309-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311735.5IJZCVYR-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311735.5IJZCVYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311735.5IJZCVYR-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: lib/kunit/kunit-test.o: in function `kunit_uapi_test':
>> lib/kunit/kunit-test.c:923: undefined reference to `kunit_uapi_run_kselftest'
   mips64-linux-ld: lib/kunit/kunit-example-test.o: in function `example_uapi_test':
   lib/kunit/kunit-example-test.c:501: undefined reference to `kunit_uapi_run_kselftest'


vim +923 lib/kunit/kunit-test.c

   917	
   918	static void kunit_uapi_test(struct kunit *test)
   919	{
   920		KUNIT_UAPI_EMBED_BLOB(kunit_test_uapi, "kunit-test-uapi");
   921	
   922		if (IS_ENABLED(CONFIG_KUNIT_UAPI))
 > 923			kunit_uapi_run_kselftest(test, &kunit_test_uapi);
   924		else
   925			kunit_skip(test, "CONFIG_KUNIT_UAPI is not enabled");
   926	}
   927	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
