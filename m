Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810787;
	b=wTMWHGKiGQmaTDCgtjfhgvyWy/xWehfXX+ZJ7qLf9MluWZwEFhbwikHH731LIZOeXlFw
	 1LB4pkQeQK385+r+7c45b7ib/f6/7oUPylDc3Mb0JibqL4PDKF1jWkALjHlVD/J8qj15/
	 rEJruR5T87tQhZcBCHBdEhSt2nRSyiquHDIGrrQRKQkMmj/CnQ/YG5nL3JfomhbS1Ut17
	 dDcFqswOcqmaYboIEAbyVWvXFFkzKPwLRlRcNwxz29s1ma8/jghfiiNu1nxf34p6Jw210
	 YX6X+FYYoNYqkCjPQ4LPw+hcZh4qP0Ajk2RV7BKzuc4/5sic6WOJ6XzfuIMyUzCrUxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810787;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=rUqdXStgrxgHMHAYAqzw9w0IUKwTHMJboqKHzelUFnc=;
	b=e6Yj/7BCuFB+sMDkwtTTAHjB5OsP0K7dyO701eo/gzo2ZXY75zBTPnSMeZOepgPKONzF
	 aweFAugOfsj1nzaEZWPbquOyegI+hTeUdZvsm/rgVTnPZRE6rXFXMIRkf+I7GqTDpu/l7
	 JwRC8lu0KHNXbXhbVHxkuqRzOK4uR5HLGsGhelZUv2Pu2hAh3yGUmvONEp6optG5zb4Xi
	 41HIsgFUPNCfIXNPDRCyQiLY0MhVVk0SsKIDqcXNt100Qb3Zdatahr6Vwt4d44nv5WzMb
	 gvlB7D0rdp4XHMqOyp8upPO4SQHkobz8WpbcFRvHVcHtdIUjAMP4rCxUadbHm6sn5fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJk9qItS;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3667D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 02:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3667D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eJk9qItS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792810786; x=1824346786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uj1QXSL3gGmfAzLBkDD5gMtF/nJIRsP3Hi7iBAjgMK0=;
  b=eJk9qItSlTSghsnk/zBifNBGw6zXuNW+zqHkdU4UyT45Po2k11qFAzi3
   JAFW+Vo/LHJBrLHYYcomf6UbKsmhA72LHnIsAdi4TzhMi/uPgCIqvLys9
   Kb5Zg6O/zxcJb+ITsxQmq3hWlpsstnQb9UT96ASQYo/pCub+swZseK1q4
   x4NypOqLVo2IPUGKEHJyf0NuutoJft0d0vCgx1haFJ39PBS8ACrqnPToY
   xxwtmv5xMq6iRR0Wv7GyPG8GmNFyf2yb2KoYHgx250dELsdmHga0R7MLQ
   w+P9nUtXkZ04+jHJwzjCJSWn/n+hG8f8+0kkMRBSReUSwJ5Rqwv+wZIS+
   A==;
X-CSE-ConnectionGUID: B08RFXIERpmqALb4LqGj/g==
X-CSE-MsgGUID: ZblYvp75RlyFNppXaLlj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1442449"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1442449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:59:46 -0700
X-CSE-ConnectionGUID: LUItt/ZKQY+RKheZg9sWEA==
X-CSE-MsgGUID: LAVgR9c3Srm90AsBYzengQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3801344"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2026 19:59:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRyw-00000000TWW-2gv6;
	Sat, 24 Oct 2026 02:59:42 +0000
Date: Sat, 24 Oct 2026 10:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/41]
 aux_clock_test.c:undefined reference to `__divdi3'
Message-ID: <202610241020.0A4M8T49-lkp@intel.com>
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
config: i386-buildonly-randconfig-1004-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241020.0A4M8T49-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241020.0A4M8T49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241020.0A4M8T49-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/time/aux_clock_test.o: in function `mono_conv.cold':
>> aux_clock_test.c:(.text.unlikely+0xa1): undefined reference to `__divdi3'
>> ld: aux_clock_test.c:(.text.unlikely+0x171): undefined reference to `__divdi3'
   ld: aux_clock_test.c:(.text.unlikely+0x276): undefined reference to `__divdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
