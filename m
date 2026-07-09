Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1236DA0F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783565925; cv=none; b=AXZcSBDmk2PfvtC1sBzvwGo9BQvVNn15jtVPc/+0TQWeHP8I6RDKr47CL6haQUy88Q6U5oca5Fq90KnHzjLR8D7DZQHL/mzJ0cAc/nG29Vsk5fI9yKPF8qOXRrKwso4vI05iGesmy9KYO18UpknhDHkcX32R1JLT7qx+BRu52TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783565925; c=relaxed/simple;
	bh=x0XPmvOOvrdQcArDnmpc8drsjLTVBpg0glx3e3wwxc0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GENJSzS3N6FKQJYRMgha88ndfvj3TjYDGjz+U/AklsT8ouz1/azutjKg46ziUfMgGsO0Km5I7hKP5GcO81fTLzMECm/BgkdkvrKg5dfpnt5ECmL2hR0TWQRYCXaZ1Trt9+/H09zLgUP6IJsYT9Gb7T7jjKXYj8s+dpt8yhawAdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOyTm+pb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOyTm+pb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783565924; x=1815101924;
  h=date:from:to:cc:subject:message-id;
  bh=x0XPmvOOvrdQcArDnmpc8drsjLTVBpg0glx3e3wwxc0=;
  b=NOyTm+pbMtggawS9lVmkPM8eAIhdCuzQBDHfXCJQkKc+d9AP6OzAplCw
   63lf72JTQDkF29ds5NHe7z39o4gRh7vvVFHHddDdg0E4U8C0KkqX5sMBC
   CTkXNGfTUyk/w49rvKEAUlTs9PLrhXbJYyWywYZgfE6zEu4ea4kiGde5M
   FhNtzFq3Yu5wC1jtcWDvgyEYxmHuAnzUgEHyXWQz5UekACsQwN86/5ulA
   Upfy+xKkeux3+3h5tb8aqSENuySk2Jfk/LHi4sDO6B3Sbq6ObASRubjdx
   a6W4Zdh0/L3snY7S5rwQTq1sYWLBFFLpZiOZvOtJyDh5Ae39z9bShmpHL
   Q==;
X-CSE-ConnectionGUID: fT852JC3RFKEG6bVFRwrlg==
X-CSE-MsgGUID: be5JUehPSkqbu2k+E6mBwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84211469"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84211469"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 19:58:43 -0700
X-CSE-ConnectionGUID: 5eQlKbW4Sy66rkDobiPdMQ==
X-CSE-MsgGUID: kQtsnYSGSKqNwwqXFsSDkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278850418"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2026 19:58:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wheyE-00000000HDp-3USd;
	Thu, 09 Jul 2026 02:58:38 +0000
Date: Thu, 09 Jul 2026 10:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rosalie Wanders <rosalie@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jiri Kosina <jikos@kernel.org>
Subject: include/linux/build_bug.h:80:41: error: static assertion
 failed: "sizeof(struct motion_output_report_02) == 7"
Message-ID: <202607091026.R9Pxd3PG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 4b9c410e7d6dacef1a27baddb176fece2c6a6a30 HID: sony: fix style issues
date:   3 months ago
config: arm-randconfig-003-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091026.R9Pxd3PG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091026.R9Pxd3PG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4b9c410e7d6d ("HID: sony: fix style issues")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091026.R9Pxd3PG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/hid/hid-sony.c:32:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "sizeof(struct motion_output_report_02) == 7"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/hid/hid-sony.c:506:1: note: in expansion of macro 'static_assert'
     506 | static_assert(sizeof(struct motion_output_report_02) == 7);
         | ^~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  61  
6bab69c65013be Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  63   * static_assert - check integer constant expression at build time
6ffd853b0b10e1 Randy Dunlap     2026-03-01  64   * @expr: expression to be checked
6bab69c65013be Rasmus Villemoes 2019-03-07  65   *
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  67   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  69   *
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  74   *
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  76   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  78   */
6bab69c65013be Rasmus Villemoes 2019-03-07  79  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @80  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  81  
07a368b3f55a79 Maxim Levitsky   2022-10-25  82  

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
