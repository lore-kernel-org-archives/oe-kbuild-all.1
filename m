Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11FEC0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 05:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLR3S9kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703395149; x=1734931149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHiRigEuxb8Kx6xtgT1l8+NQl2utfuIxG7TyTncjKRQ=;
  b=QLR3S9kpA3h8An/YA325vBWbk1V/OeH/XozDtveztgI4rxuSPMCMJprJ
   irNg4duYKhCH0xL/WQCafR4vEwjQ1vyTgK4O2YkS+2I6Qv9Co6vVgjMhF
   BFbxPFphOwnDyfQFeYbWsCAiS6T/PHeR2TgoVLg0IyOePsmgR7g0LDa4f
   cyqRStm00oliP/2wkCNZPweKHL0pmYlsEj4d/CRgwEMH4YQ1K17vuKrg+
   YcX8UbaiCtF+Qu3N6CWbKMGhUCXbofRSPG/yoDR76HGwSTc6YhjRpY1PY
   68o/NMi2Sn00boigSFBtZF0TS5xhgincI51qCmbsI7HA5U8/pR5C/RJFc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="386656459"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="386656459"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 21:19:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="843390884"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="843390884"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Dec 2023 21:19:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHGtC-000BrK-29;
	Sun, 24 Dec 2023 05:19:03 +0000
Date: Sun, 24 Dec 2023 13:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: davidgow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 8621/10295] scripts/kernel-doc:
 lib/kunit/device.c:68: warning: Function parameter or struct member 'test'
 not described in 'kunit_driver_create'
Message-ID: <202312241333.C8KYj8aY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: d03c720e03bd9bf0b784d80b5d3ede7e2daf3b6e [8621/10295] kunit: Add APIs for managing devices
config: arc-randconfig-001-20231223 (https://download.01.org/0day-ci/archive/20231224/202312241333.C8KYj8aY-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241333.C8KYj8aY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241333.C8KYj8aY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: lib/kunit/device.c:68: warning: Function parameter or struct member 'test' not described in 'kunit_driver_create'
>> scripts/kernel-doc: lib/kunit/device.c:68: warning: Function parameter or struct member 'name' not described in 'kunit_driver_create'
>> scripts/kernel-doc: lib/kunit/device.c:68: warning: expecting prototype for Create and register a KUnit(). Prototype was for kunit_driver_create() instead
>> scripts/kernel-doc: lib/kunit/device.c:134: warning: Function parameter or struct member 'test' not described in 'kunit_device_register_with_driver'
>> scripts/kernel-doc: lib/kunit/device.c:134: warning: Function parameter or struct member 'name' not described in 'kunit_device_register_with_driver'
>> scripts/kernel-doc: lib/kunit/device.c:134: warning: Function parameter or struct member 'drv' not described in 'kunit_device_register_with_driver'
>> scripts/kernel-doc: lib/kunit/device.c:134: warning: expecting prototype for Create and register a new KUnit-managed device, using the user(). Prototype was for kunit_device_register_with_driver() instead
>> scripts/kernel-doc: lib/kunit/device.c:149: warning: Function parameter or struct member 'test' not described in 'kunit_device_register'
>> scripts/kernel-doc: lib/kunit/device.c:149: warning: Function parameter or struct member 'name' not described in 'kunit_device_register'
>> scripts/kernel-doc: lib/kunit/device.c:149: warning: expecting prototype for Create and register a new KUnit(). Prototype was for kunit_device_register() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
