Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274EEC2C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 06:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqvkBpzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697522466; x=1729058466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GiuBqAkklEEGgXkgMw+/cdXbht9Da41/IBay7kVNgyE=;
  b=eqvkBpzbV5tjmdCgNwgMfQAqS6ADA/KX/cu9qjLsq6WdG+s0x8KR4NfN
   3jEh8KJOz1kyr1sN915Ja3iTNLvcp+Z7pPOq6Fy/58cXp4aa24/Y6md7N
   NYNPGGoIidwq5X+QbyhRYarvwQl9ZyW5xnl65S+UCwbV/tA/dWHRF/Fjw
   Jao9Ws+aac2JUjs3J5ss2yTKlHzxsqyRn51uqrefNEFLq30JXFtOaYaIf
   yg8WEXzZQIIBqyyFfbgnC52hNr+zo/gekn+BBSrq4OvBjeYDARVZ+9Skj
   e5pLGY4eg8DI7eRH0c610EK1WvZwANyOm1yxulCk5cE8me4RqfQClxSZm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449929432"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449929432"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872410369"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="872410369"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 23:01:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsd8W-00095y-0y;
	Tue, 17 Oct 2023 06:01:00 +0000
Date: Tue, 17 Oct 2023 14:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 android_debug_symbols.c:undefined reference to `__per_cpu_start'
Message-ID: <202310171324.4SWdKuvv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
config: arm-randconfig-003-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171324.4SWdKuvv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171324.4SWdKuvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171324.4SWdKuvv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: drivers/usb/gadget/function/f_audio_source.o: in function `audio_source_alloc_inst':
   f_audio_source.c:(.text+0x9b4): undefined reference to `create_function_device'
   arm-linux-gnueabi-ld: drivers/android/android_debug_symbols.o: in function `.LANCHOR1':
>> android_debug_symbols.c:(.rodata+0x14): undefined reference to `__per_cpu_start'
>> arm-linux-gnueabi-ld: android_debug_symbols.c:(.rodata+0x1c): undefined reference to `__per_cpu_end'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
