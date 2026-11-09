Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209328;
	b=MzBCYtW2we4//i4LA5Fk81r+HjY6pwORi8ALjiaf9BL9Qg1xzx+70tytQTBmuuzQYdNs
	 PXGlmozp2ANiNZ0BdYs4/o5hP3oTau/kKpHfRXZGwHKHeV2QXz7j/QDACpROP04FJaiMr
	 lKvl4/3HyLEP4kXG6ovsIwgLk99jIk4uhwKj5v2vDN5k5W8mIptoItzycUW5D4YxNnwbv
	 Z6QN7X2rEFmQwFDQPi6quCHwM2R19oPqwG4sCcmuyDHA1/6p+FR/5ysPZDI54hVo5ZV+z
	 ZN8qkpthIJEwC4tFe+Me35h55SAeq/aIffj8MzRzg/MXuwq3PqcQBPLzH+A6DMr7r+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209328;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=XC90LXHW3V3wTgPzcWjRApNw0aK6tC6mZtGyM9d4kj0=;
	b=Bbqnf2vc07qaO2Q5iSI2sUVRGEVyY/tAuv1wX61L5gTdFL4R84RE6BBf5oWIZjP4bxZz
	 DFGfetgn+Jf+9eIEe5pz45OYRQPaQvGycLVQHQZ323h6+TckR2ZpyEDdm7OQu2sXipDnT
	 uShr1h2EUtomgGmfOYKMdBjA4ZTOCzIobF4da0mHNzEKxWEzYXJ5EFj4V6eBIZVmwhDGP
	 kF1xLx5MVtW4WoL1OZCs1RkTSWvioq2YUKXCR6U+y4++aT3ugtD9zOtDc4PrUK8Iip/Tq
	 yrjA73UhzQ48GUJEdl1sojSce+WMJZTcAiyxVvAzcgR9STO2ZHBXiUcjQlvQ9Et757A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYpWjjGZ;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34118606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 07:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34118606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JYpWjjGZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794209326; x=1825745326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etJDHKGsgFEEXWg9se/XDm6MtPh6hty2QrkiTlFMGbI=;
  b=JYpWjjGZCdworvFzoursvFgxJP5yLJctyg6R5SqiS8Zrp6s06qSj8CYl
   DwnX2Z+vd//EKnUB57EYLJ51z2Oq5OIkaht6Y7nWeWAcIlS5Qtjtu8VpA
   /gsWT1DhTd5rwVOwXYdDQRs+ZY5JLbJvkFUpVb2yg7+qni49ewEMrkqGi
   PJKBUsoG0qf6957c9s5kMSCQYorcVyAXncAQPv9V0KqzzYVK3O/lHnekT
   DY84QNCoSPBSe0lIwj4PL9lYhuHIgFsuPeW3EWTDUfOHrUmzT/llRy204
   3IsCLDGv0jfpWWUl3aE1Ku8HKaqZEJLM0w0BNjIwpJl9bWbskHMM0wCRe
   w==;
X-CSE-ConnectionGUID: vG7kSdxqTZKw0DRLFIrZDQ==
X-CSE-MsgGUID: ScMnLH9BQEGh2ZsLz7QcWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2815809"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2815809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 23:28:45 -0800
X-CSE-ConnectionGUID: 5wbJ3SaDTIOv/OBz5+8S1w==
X-CSE-MsgGUID: Q6OJ+83CQ9urB3aikg/AcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7835600"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Nov 2026 23:28:43 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQJo0-00000000u5v-11tD;
	Mon, 09 Nov 2026 07:28:40 +0000
Date: Mon, 09 Nov 2026 15:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50]
 s390-linux-ld:arch/s390/kernel/vdso/vdso.lds:598: syntax error
Message-ID: <202611091416.UP6vOeK7-lkp@intel.com>
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

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: s390-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091416.UP6vOeK7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091416.UP6vOeK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091416.UP6vOeK7-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld:arch/s390/kernel/vdso/vdso.lds:598: ignoring invalid character `#' in expression
>> s390-linux-ld:arch/s390/kernel/vdso/vdso.lds:598: syntax error
   make[3]: *** [arch/s390/kernel/vdso/Makefile:52: arch/s390/kernel/vdso/vdso.so.dbg] Error 1 shuffle=2962905420
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/s390/Makefile:159: vdso_prepare] Error 2 shuffle=2962905420
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2962905420
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2962905420
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
