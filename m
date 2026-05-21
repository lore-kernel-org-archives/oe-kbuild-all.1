Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655A25B0BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779401746; cv=none; b=OMREuGuKySNo3dbpOXk32FX1Napusb6a3zW9g/qDiVEffllRUhgvSrkD+FtwbzuCIeTOK1QOp3uLfOlCkjWL4PMiJ/NQijmi2LzHja6bmqFfnbu9GN6JZ0f6eSr/K3erWLIFSSLnNu3p8S2HyA2NozrbeWmd1L5zVWosYHUen0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779401746; c=relaxed/simple;
	bh=IGEAM5P7Z3ZWtOp8fNwAnu6DAHr+iVGzFBBVrZkHWEw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nY2CXFPg175YVv5yhdl1N2H8iwqqpKAOAQlYMa+sGUw2wENTq4WDIkUzOlpAqKPwCoZEW+Yo6nUUh5O7LqtKMW7nMtK9e17+t4RvPeRd/qW+ggESSpAJxNuoQ34gCrroBrfJUdSFOlLlGRErQoelB2SCjOKrxwSm/TeXHOaorbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKR/2A17; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKR/2A17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779401743; x=1810937743;
  h=date:from:to:cc:subject:message-id;
  bh=IGEAM5P7Z3ZWtOp8fNwAnu6DAHr+iVGzFBBVrZkHWEw=;
  b=fKR/2A17OzWKBsOQckp4wHI5386NIQN2XvSU0MAwx24jr4HETtINfhvK
   LSL7Ssp1QNiEKm8Ippmc/ZOvcRpY8NPLl3EXYwvoyQi2LXO7ETO3iNPIi
   fTu7cucjhH3Y+YMeVHg6NstwFlQ2G+av/ehZsN9y7DR8HwJ7l7jk3tpa0
   +Lb9laAdCsBCfMhEP4opBsrfGH97CojYRXUY9cBGFSirJ7idg2VlvazFO
   gRyEtogOG7InUETyteWWPRc7cW3RNabh4LRj8XgfK7aiYCGcRU2w535+c
   rTujLX3M6xUc+Me33tgQDPcTlmUgmk0jAuzOYr3dGUhEFVpNVMliekB1T
   g==;
X-CSE-ConnectionGUID: WL84r7MGTXaumYPdVLFPEQ==
X-CSE-MsgGUID: apRZasTFQAm391nssvxvMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80314018"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80314018"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:15:42 -0700
X-CSE-ConnectionGUID: cs3hU0geSZuuVxjo0oOJQg==
X-CSE-MsgGUID: 9D4XT5uVRWucVCgyhW6ZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="240902419"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2026 15:15:42 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQBg3-000000001Fd-0OiW;
	Thu, 21 May 2026 22:15:39 +0000
Date: Fri, 22 May 2026 06:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tvs 1/1] drivers/hwmon/tvs-mpfs.c:132:2: error:
 incompatible pointer types passing 'unsigned long *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202605220657.hQp0mLTu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tvs
head:   a8e63a4eb29267ba6d666e969ae0d6ddae1a6bd4
commit: 810c4b84588a0a0208e74778ed10914faffbcddc [1/1] hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605220657.hQp0mLTu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220657.hQp0mLTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220657.hQp0mLTu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/hwmon/tvs-mpfs.c:132:2: warning: comparison of distinct pointer types ('typeof ((temp)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/hwmon/tvs-mpfs.c:132:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     132 |         do_div(temp, MPFS_TVS_INTERVAL_SCALE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:174:38: note: passing argument to parameter 'dividend' here
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/hwmon/tvs-mpfs.c:132:2: warning: shift count >= width of type [-Wshift-count-overflow]
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
   128	static int mpfs_tvs_interval_write(struct mpfs_tvs *data, long val)
   129	{
   130		unsigned long temp = val;
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
