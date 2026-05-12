Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C410638D411
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588058; cv=none; b=mjomwch2qnsFtFlbrQM6YpQpqsmtk9i3em9p842hrECCn3lw56xS1NFgJ7PabMFreH9iB13P/mmNUOmqz0nwtPMcTfAzV5gKs3zTv7ukD/hdTKcWUZ8gayOIVlfBauCmSJkwSiCwvk0GpK3q+KHrw8Me7C+8R6Frh2WITdklxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588058; c=relaxed/simple;
	bh=Tvt0cg2guxoWBH8nrr6O4j/jZ5fzhvQwB5Rv7g9ArwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a2yPy8iok67sHhfGmUERGIITsmls2HokP/x5PxWRkNZHBmBmS45ioI1pli+ycw3/7lsJ6JmGS4Varx++mlukGWEFOheYsl43JGlzuDYzBhgw72pJKsQQTNQLyXvysrfoMlnclwJIs/x5NAS03TZfWW9xEWPyVWAPfNqIjCC3QZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9YlPBzp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9YlPBzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778588057; x=1810124057;
  h=date:from:to:cc:subject:message-id;
  bh=Tvt0cg2guxoWBH8nrr6O4j/jZ5fzhvQwB5Rv7g9ArwE=;
  b=O9YlPBzp7RBaLVV94AFBcb+X5MsLuLmZB7i04PPEwq8NZY6Hf6vZktWR
   9fvYqmkH/JmSm2W9+mA+vxyDcGIgLTECewgdjFwhg2Fs9crnepZNHAo7h
   vQiD6E0BIkIlnWviNhZBJxhSh5lTmWJClpBWQhNFgAIOtsags10ksvZZi
   S+SOs2XMxb2d65k/jdD4BSPU2La2myfBiRFmwZOpTmQbF+6YXKij/67Ks
   bv3jUHuWhIT4NYUHHGlZDl0FVdONznVrhBbL3zr6JwlkzaC0DWCVIau8z
   yObqi88UnC9cpeH6BnNYSaD5ldqPcqTYVbFeJbUuMVyz+U0GNyMj+Xbzi
   Q==;
X-CSE-ConnectionGUID: n+a0TEFhQ3mjlXWazKVNfw==
X-CSE-MsgGUID: DYu8C9VjSWi12hjqBAVFOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78640637"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="78640637"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:14:16 -0700
X-CSE-ConnectionGUID: jwd0dUSzR/6qZzmW6qhtcw==
X-CSE-MsgGUID: 9sYNnQpsQ0Wo8oy6oSjzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242723011"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 May 2026 05:14:15 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMm04-0000000026Z-29Bo;
	Tue, 12 May 2026 12:14:12 +0000
Date: Tue, 12 May 2026 20:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] ERROR: modpost:
 "kasan_inval_dcache" [mm/kasan/kasan_test.ko] undefined!
Message-ID: <202605122030.pHABhWVo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hyesoo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c29f3ebaed628d879aee622c88a118679c854b18
commit: 8d99997b19ad09073cb0bbbe68bc6ac02ef58ca1 [1/1] ANDROID: kasan: flush dcache after tag writes
config: arm64-randconfig-003-20260511 (https://download.01.org/0day-ci/archive/20260512/202605122030.pHABhWVo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122030.pHABhWVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122030.pHABhWVo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
>> ERROR: modpost: "kasan_inval_dcache" [mm/kasan/kasan_test.ko] undefined!
>> ERROR: modpost: "dcache_clean_inval_poc" [mm/kasan/kasan_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
