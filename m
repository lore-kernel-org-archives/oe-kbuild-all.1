Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B269184121
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 21:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714427104; cv=none; b=Zfj4znVzUfvXfGxK+FPlI2S3WoE6uiJUIMsTjDoyyWGGdb7Yllk+qW2BjI7F66e7x79wvyDjq2kXYZM24xRtTID9Jp2+4RfM4RCVU6/dgb0f2LlMAQKRgK3wcN2Eoc6atBNzb4Bs5/jQHL7pjDWbfEEgTaTorJT5/I/oBFlEDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714427104; c=relaxed/simple;
	bh=OecYBMnRUrtuWVMKQip2oxUEgVD/6hRpP/7UZx7cjGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2rel22DNgrscXjgJY6hQ8kDLwi2SVJU7wjdlz28j5jGu0VslqyUfVICgrYJSbdsl4+ShPdevdSy9ybNb02dSO6GRpE129h5Jyf/JNEVjGmPJJ5EmDT9WvlVdcYaDjZ9IpB5PkHKkwIeApVtWZuOPWLYVhxACPUUxiMIsq16sr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjA+xzDX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjA+xzDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714427102; x=1745963102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OecYBMnRUrtuWVMKQip2oxUEgVD/6hRpP/7UZx7cjGU=;
  b=FjA+xzDXxsaWpdKB0iLsc8MwNFWEYUl9GyqBNp4SxxVTfLiVakqhZ6/9
   LOodE9e+iBHypftZvjQikg5vQe4ubHjL1F/hvfypOOSrZzAiORIrkEHgv
   RwkW7Mf33cYXgrehg0Ww+QHeFyIrPoBdneNb6CvqMFvbu6VdYH9nss/mm
   pp+LePKhuI1j6SFmN6N2gSoMoZunWCbVJ8vDU+mFJYlo41KcuyIMfITUZ
   GgqNVGvum7Z59JZG+4Q8dIFALvNkDiLPhBwC4bavY2uFLfsk7m5J4PKMg
   nbqJeZiNYntVyx0a/Ewra5ZCRYgPYQitxvLdLLOGIZs8Ct23TavR/G7Q0
   A==;
X-CSE-ConnectionGUID: y9zc/GBDRFGhunyx6LWYlA==
X-CSE-MsgGUID: IIRC9bi9TqKr8nVpv+rGdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20727485"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20727485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 14:45:01 -0700
X-CSE-ConnectionGUID: EfZxWn4fQrG3BfBpVoSQgw==
X-CSE-MsgGUID: +Yp+CQRNROyYW2WXmjSJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="57115400"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Apr 2024 14:45:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Yny-0007SO-05;
	Mon, 29 Apr 2024 21:44:58 +0000
Date: Tue, 30 Apr 2024 05:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3285/29983] vtl_ts.c:undefined
 reference to `i2c_transfer'
Message-ID: <202404300558.IJpJ4wM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: 5fd1a9756fe0090bd795889b135e4dfb78141f0a [3285/29983] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: sparc64-randconfig-001-20240429 (https://download.01.org/0day-ci/archive/20240430/202404300558.IJpJ4wM6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300558.IJpJ4wM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300558.IJpJ4wM6-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: warning: arch/sparc/lib/xor.o: missing .note.GNU-stack section implies executable stack
   sparc64-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   sparc64-linux-ld: warning: arch/sparc/lib/xor.o: missing .note.GNU-stack section implies executable stack
   sparc64-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   sparc64-linux-ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `vtl_ts_workfunc':
>> vtl_ts.c:(.text+0x3d8): undefined reference to `i2c_transfer'
   sparc64-linux-ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `ct36x_test_tp':
   vtl_ts.c:(.text+0x538): undefined reference to `i2c_transfer'
   sparc64-linux-ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `vtl_ts_driver_init':
>> vtl_ts.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
   sparc64-linux-ld: drivers/input/touchscreen/vtl/vtl_ts.o: in function `vtl_ts_driver_exit':
>> vtl_ts.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
