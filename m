Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443131;
	b=QQFNYUxLkjVUvmIeIcmxzXYh04hZT2QHihgnVLf8Txhhvp/Qk/8LhXOnYdwEp0bg5sWY
	 rDRuVbAroGygP3tW3x33KXcnYijW+9X5/Bxb0qN9XBqctCUk6wuF83v19HaoZF0eZJIaG
	 RYPocPh4eDzV3AAH5XHcXsAMbtTzDC3SkOXuPx8wkZ9yqMmLj0k3a1FBqhkKLaCIyQ0ky
	 Cs1w1eVvzedj0IEAc2C33m1FDC3szbCIZmNVzejLwengMVqElULshzwftlSDjmimzOUo7
	 1Kjjb6i3WSBAuE9iCwiMJQgzCJS/2Dw1Kb+AI7NUdnsNe+XJP13QZNjlwRdMHbDEA5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443131;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Pz0y4y+sbrf7tDGPIwurzW5Pr48odp9ZfqznGs2qHKI=;
	b=inJxbIi7RYwrCQ+zCwHJjKh1hLz/Vj50u5xD7hkfgiqNyUVa8b/qfxMRmj8lACjxh5G8
	 ReRLnNTE43/gRCy4FlUWqTyAXdpG484y60Fy+dw524kET1IHNB3D5mqmS7nULMawjnlOv
	 V9Viuts4OvYCTE49GCWGEPwzRmAtgvQ9DRobSW/VRSZpnw3xo543vqR0od+SW6zYiGZUi
	 mJ/o1p6ihPoxEFuKVtfUNiHvZioBDfK6ld/aLqcUTCqIDhLQ8wkJJtya81fxIRXFUJXth
	 MCaztM88XJiNQ/DdFGtLwghXJGJA0NXcYKqx44yv9RC8/MSaWUR8U0ojxDS19FtZdbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbwr6ePd;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151C606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 10:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2151C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hbwr6ePd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793443129; x=1824979129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOYmfNfdKhlKkH5j0ytDBG91/4RTcRz8Q7PqvsgCCKQ=;
  b=hbwr6ePd1QMYmZL8295I9HThgmtR33saIHXGHV05Ml5nRhxvhM3HRq1T
   /vL1r2ka9ikdpmE+END1gCtD4qsAzYJ97TWUqJTp3BGpAw3VmaHyvuWHg
   Ghs+v8s6t2NCtmwL0rVNMMfqmKnDo06OE7hI3Op7vHSSUVhgmEeWmVuvV
   er513t5JhdrZemXNRwbWPcSxdk/+cloVkkbHYvv3gnylUmA9dqPlVu0mP
   WMydObKxDS+GaspiJeAlvqn+e93RUpwrO6I+epHjIAnvMXWCDTmwkuo9k
   80JAOAVExMg1pUWmxMDLLv2MqltA7/+zHlikgQ7yZeTD4vGhTEYNIciN4
   g==;
X-CSE-ConnectionGUID: ++dUUngSQvK/Q1/siB1L7A==
X-CSE-MsgGUID: 5Ty0Qk70RgGJ3/u+X/i5aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2204445"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2204445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 03:38:48 -0700
X-CSE-ConnectionGUID: QGlJrxJ2ShCQ0b5Be/gzBQ==
X-CSE-MsgGUID: vyBKk7zAT+Wch0Y936/HaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6207993"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 31 Oct 2026 03:38:47 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN6U0-000000005xz-4BlR;
	Sat, 31 Oct 2026 10:38:44 +0000
Date: Sat, 31 Oct 2026 11:38:28 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, David Gow <davidgow@google.com>
Subject: [thomas-weissschuh:b4/kunit-kselftests 19/25]
 lib/kunit/kunit-example-test.c:501: undefined reference to
 `kunit_uapi_run_kselftest'
Message-ID: <202610311114.jzuYXzTG-lkp@intel.com>
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
commit: 8fb46c51d64c60c6a4f76666ceed9e8a63a2d69a [19/25] kunit: uapi: Add example for UAPI tests
config: mips-randconfig-r2309-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311114.jzuYXzTG-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311114.jzuYXzTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311114.jzuYXzTG-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: lib/kunit/kunit-example-test.o: in function `example_uapi_test':
>> lib/kunit/kunit-example-test.c:501: undefined reference to `kunit_uapi_run_kselftest'


vim +501 lib/kunit/kunit-example-test.c

   492	
   493	/*
   494	 * This test shows the usage of UAPI tests.
   495	 */
   496	static void example_uapi_test(struct kunit *test)
   497	{
   498		KUNIT_UAPI_EMBED_BLOB(kunit_example_uapi, "kunit-example-uapi");
   499	
   500		if (IS_ENABLED(CONFIG_KUNIT_UAPI))
 > 501			kunit_uapi_run_kselftest(test, &kunit_example_uapi);
   502		else
   503			kunit_skip(test, "CONFIG_KUNIT_UAPI is not enabled");
   504	}
   505	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
