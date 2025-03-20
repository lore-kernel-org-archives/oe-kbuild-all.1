Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9B22756A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742494055; cv=none; b=s8M0igygtfZImgvS2GQ5iD41T/OwBVSP20f3OCyMaVzrrV5AKyJB8Dzj+Qi6tR8zwDignAOXuT5nOU8hWRi8XxMOKmPGxZw8MXkRkVk3cEbtJysxiEG1xNKWDYVHvL3nBww3onpfoGKcEvyJr4LUaadGTNgKtay6gXBhuMOW0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742494055; c=relaxed/simple;
	bh=A9gqEINbwa1vlJINmcf218CB2euavGtGsCataZ4WuQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvtgCDLUR2U3jd0RIOzga9R7D2rxcppZ/WuHIhn2Hkf6ylmcveG8m9xWHFNXr4DXXILlQ0NFBwhhvuNY3V0i+ZAm+lUnz++OPM7myb01rueXm6aHwZpOH4mY2ubUS8++LuJ9aDwDFAh4srwoPT4iABSeL8ykQcFVR63z0lDG6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4kfmH6r; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4kfmH6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742494046; x=1774030046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9gqEINbwa1vlJINmcf218CB2euavGtGsCataZ4WuQ8=;
  b=S4kfmH6ruhpvw/EmHZxfbDgX3NP8bIR2EPle5etpHriGb2l8rU/M+qb6
   VqFoOyj2mwx79FBK7JZaXCBLqz5FQyHQ6QyCazBkG9A9m7mlH7uSrvYyA
   uVJcrKv9S9RspQ5JtTU63nYFz9nLt0yI/PGpQGCogp+qdfYRymoeHW62l
   /PSws0H3eswToVLcbjjl6GIcoRm8iITpBthrn+zzCiGfP8s2qqM4GbSh9
   V2UYbAKL1RcFaUaM+2ZqJNPSv+iFt+qmMgNjzWto7O+O6/26VrMu3c59p
   0HNt7d0eq6uj+Ywx3KSg1a82t3kHpvFOxLLYSxWHCLFMAt5g8QayRozzQ
   w==;
X-CSE-ConnectionGUID: yE5P0la9ShuHs8ye3XUoSw==
X-CSE-MsgGUID: bV1OvirAQNO7werHjx2V1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43913089"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="43913089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 11:07:25 -0700
X-CSE-ConnectionGUID: jEQ4lMjSSK+Twapq/z+NzA==
X-CSE-MsgGUID: zI1nn8cIT5eLiwzLWo+oBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="123140000"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2025 11:07:24 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvKIc-0000el-0m;
	Thu, 20 Mar 2025 18:07:22 +0000
Date: Fri, 21 Mar 2025 02:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] ERROR: modpost:
 "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Message-ID: <202503210246.BFI5Oj48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   7b65a6d404ec082697bd8150d890e65b9e24164c
commit: 00a31dd3acea0f88f947fc71e268ebb34b59f218 [1/1] asm-generic/div64: optimize/simplify __div64_const32()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250321/202503210246.BFI5Oj48-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210246.BFI5Oj48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210246.BFI5Oj48-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
