Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0739FCA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 21:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314132; cv=none; b=jlWpGppCFlyqTJnUD+7qONgB8JVunkWfG2PEcdonLyMnkGbEU3B27mI6jvHq0TDwW2mw9YVu2E2BDbWnXf2QniHct6aYHCfvxvBKVTME0tvF8P/uBN6/VmkQibf81cEHQb+tD89odLfzTcFnJ1J0x2TUni+uA2w6b4Qr14iiUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314132; c=relaxed/simple;
	bh=DG6NFWIiB5G5RclvbZWUbCtAq7DDbToi6UDHzQOsgVw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EXc/Gi8lMPdT70vxPO+U4KAaT63peSmu6ApZbPI6aqMCrlx/IgrJrag0TLbH7GiZIUAgq7FZQ45nwXy09yE4nGu2mB4xYEmKedYGpw5ugksDr13sg3sFEszBNC5QukGTkTstZqDodg4CXpTWv3f0GYZpFjOx+24gpwn404/aexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gF+jrL9H; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gF+jrL9H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779314132; x=1810850132;
  h=date:from:to:cc:subject:message-id;
  bh=DG6NFWIiB5G5RclvbZWUbCtAq7DDbToi6UDHzQOsgVw=;
  b=gF+jrL9HIn0e49nKox/9njf3tTEGNLVMv2+Mf+Edk1ghOfr/jtThmshh
   xd/4QoajvYz7URdX6yogq0Q/RxHQuorLnPMzdR4c9gQEcgpDNEko37eLG
   gu8hWw8+Tue6cDkj5bK1N1S2QNzKiejGe95b6/YcrD+STLaFXXKGLT8g8
   54C7q/pNKAvj2QSrk62/2Q6hefHK7pDoN+4dt8umEJNBrf+ZFG6JTiyrk
   iJ7PZ02cmZwJpz0vOt2DtNI3HQ1poI/TSx4sBhDdQYnNMXFi5ATXmsZKq
   +c+zuBjTVxGHuyBpxXXXj3GgMMJWbwDBZntqLk3V8ee5IVX8jECETzXtk
   g==;
X-CSE-ConnectionGUID: F+iKOyEgQI+cvku0kdRNYg==
X-CSE-MsgGUID: /chOi6tKSw60sIYnVaGfWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="102903404"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="102903404"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 14:55:31 -0700
X-CSE-ConnectionGUID: wSRju/rPQsK4cI6ZM9/WMA==
X-CSE-MsgGUID: UdkOCe8fTuOo6YdnTxK/2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="233977441"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 14:55:29 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPosf-000000003sb-13II;
	Wed, 20 May 2026 21:55:20 +0000
Date: Thu, 21 May 2026 05:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tvs 1/1] drivers/hwmon/tvs-mpfs.c:132:2: error:
 incompatible pointer types passing 'long *' to parameter of type 'uint64_t *'
 (aka 'unsigned long long *')
Message-ID: <202605210552.fkKrtG3W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tvs
head:   19e86059f1efbb9ff920c102348a64a042145a2a
commit: 19e86059f1efbb9ff920c102348a64a042145a2a [1/1] hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605210552.fkKrtG3W-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210552.fkKrtG3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210552.fkKrtG3W-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/hwmon/tvs-mpfs.c:132:2: warning: comparison of distinct pointer types ('typeof ((temp)) *' (aka 'long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/hwmon/tvs-mpfs.c:132:2: error: incompatible pointer types passing 'long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:174:38: note: passing argument to parameter 'dividend' here
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> drivers/hwmon/tvs-mpfs.c:132:2: warning: shift count >= width of type [-Wshift-count-overflow]
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   2 warnings and 1 error generated.


vim +132 drivers/hwmon/tvs-mpfs.c

   127	
   128	static ssize_t mpfs_tvs_interval_write(struct mpfs_tvs *data, long val)
   129	{
   130		long temp = val;
   131	
 > 132		do_div(temp, MPFS_TVS_INTERVAL_SCALE);
   133	
   134		/*
   135		 * The value is 8 bits wide, but 255 is described as
   136		 * "255= Do single set of transfers when scoverride set"
   137		 * but there's no scoverride bit in the tvs register region.
   138		 */
   139		if (temp > 254)
   140			return -EINVAL;
   141	
   142		temp <<= MPFS_TVS_INTERVAL_OFFSET;
   143		regmap_update_bits(data->regmap, MPFS_TVS_CONTROL,
   144				   MPFS_TVS_INTERVAL_MASK, temp);
   145	
   146		return 0;
   147	}
   148	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
