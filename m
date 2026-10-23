Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768935;
	b=Y+EA4Qel8ncKkxurqwas/vTV/nXPwNtwPzkbmSAkkExoGB7cQTdIIeX5276aYm3Em9KR
	 i5TZ5K+RW65jOYnJPixhoyFRoTdPo6Ujbw6G1OX9QwX7LCOiRJ4tf5gM5iL4SUUAYKHW+
	 Z9QvVh7sBwDqTrAhZNaVRGUJRm253PAf/aJdsb3ZWqXxVxC4zMgVg/9DQWmPy+WtGfxdk
	 SgnjwD0fIHw99TGuMw1Mo2yX+5GkMenw41ZlpKx7yHzl8Wg58NEJIm2s6oJLPa9SSy0yX
	 wW1Tgq2MC8w8DJKjIo+sGV3IHYZOsS3aLqFlAwYipXzkiQbiM8s4J4qNYXoqd1xwxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768935;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=7K1HeCL4wS6FgmpdSCuo2rrNZwXhg+1p0N4xXr/Ugyk=;
	b=NSIY5Fhy8VBM5E5sYQEqdvrex595CvR5DF3Z5LMtSO4VUFTjlfajimX3DUf06TTpVurh
	 rNWGuCM7hRv817oF/Bzo/g4PTpgap0eVZxqEeQm/KrFFa6vlniP52W/V0NR4GLpdEPFXi
	 3LZ2kfdGceQPvobeKR0RNVScjjSLtaTbt+fjjAEE6JRa4vD4qtfvaB41zd6h+1a9395Tu
	 23csa6ol4vhafdUNbjSqJ7F161wTSpq7JMxIYLMkiocsgpjm6GabN1ohhCK5GMyW/iyDW
	 3AhMJ+vTlLVQEVR0a6wFqMfw71r4ylqVlJrAJn4PYr7yGwQz6j470fqcEYfbrw5hwdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ORkCzjkW;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 15:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A439B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ORkCzjkW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792768935; x=1824304935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y782qnHBsxZoFmH8G7dFbQiYsu8YHlT1/D+WBtYMNsc=;
  b=ORkCzjkWHs9Xl7v0E9ExSTofjsN3a86Ceqi7nJKh4a1vpsM30O9xKCMQ
   S/jQKgBYx2iWxC8q0Zd2e3WnBiRfQjp9L4j5bs8j1caOa660u4b7oJOhv
   vS+Bx1r0gd36u3xFbZtK+025pKjyqmVK2aBiTSSDuzQJmvRcbIZlQGPq+
   s7OTVmAGPemtSus/lIOoq9Rg/Jl+qXlXnXQA8bTJSszSmBfn6utBcGurG
   kcaLizuyJEfui8iia1144935aaI6HL5Ec6zWsg7g76C4Id31m/vo+KsIk
   mTDWdFY9RJBql3rpM+5evYFFtysx4A7684fyJHNlvobccZwnU3yLAi0z9
   A==;
X-CSE-ConnectionGUID: kNaLJSnuSEy0zqTutKlX4g==
X-CSE-MsgGUID: stV/ydZcSYyNeZst7of6xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1434773"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1434773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 08:22:14 -0700
X-CSE-ConnectionGUID: K+AgvoUBTMuR11pVAYohKw==
X-CSE-MsgGUID: gItc0PxdTMGXqTbO1r5Tvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3615073"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Oct 2026 08:22:13 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKH5v-000000000dj-09Ew;
	Fri, 23 Oct 2026 15:22:11 +0000
Date: Fri, 23 Oct 2026 17:21:44 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/41]
 aux_clock_test.c:undefined reference to `__divdi3'
Message-ID: <202610231723.MSYfNGG7-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   a40991dd87115c3f70bf87884b803ed7e09dc387
commit: 503828dc4bd6f98d85d169659fdfc68f30032df4 [18/41] timekeeping: Add a test for auxiliary to monotonic clock conversions
config: m68k-randconfig-r2303-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231723.MSYfNGG7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231723.MSYfNGG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231723.MSYfNGG7-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 87
   kernel/time/aux_clock_test.o: in function `mono_conv':
>> aux_clock_test.c:(.text+0x2b6): undefined reference to `__divdi3'
>> m68k-linux-ld: aux_clock_test.c:(.text+0x3c4): undefined reference to `__divdi3'
   m68k-linux-ld: aux_clock_test.c:(.text+0x494): undefined reference to `__divdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
