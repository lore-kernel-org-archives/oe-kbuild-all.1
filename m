Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5FF9CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 03:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391498; cv=none; b=CVCs1o20XOy8u/r4ePc0mMjVf+kkv9nkkOV2ZwDV1fyYVfWv8nrLQQ7G44wM2LybR5Wzp8v+IAo1AuxMnYljyuCqvNBpFYuTQWImgAcZL/IoEST1hr7PknZgRbsxi0mQQZZ1j0fbw2plnBts+wAlDK6eOOSceqJ+sRBs88zXtkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391498; c=relaxed/simple;
	bh=6wWaLPjt0RwA9NVnT1ywjHAZZgiUtPmCUP7uReTroCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9w38CQjk1OecMMoVBv8+U2h/ntSGZW2oLtEBFuwH91zZY7PnKGG6anuOsvzoqlucnoUz+lZY4p6cYlh086l5gFrZ1xfIv5l2PR+M6PHrvTOcRtlMCPe6waXs7JigPU2uDuz7aAHKh0OcOmXgQzlXzQQ+06J1h2IVw1E35ZeOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku4ums4Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku4ums4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743391496; x=1774927496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wWaLPjt0RwA9NVnT1ywjHAZZgiUtPmCUP7uReTroCI=;
  b=ku4ums4ZBi92FY4UbWn4ri0MN6fyVCQ1hq+5P3Hne+p66iamq4rlCtgz
   aKudJDgYWd4w0RKIp+IPwXqcqqhyR0mVRXM5t6JoVyj8td224X/U48Auj
   Kvdm1Xs0P6CeE6qJ7LmelnfaP4EsRknN09MAA1t/Egf1Gu1mpFNYuTH7B
   ywNtSA7TyGQmYYbItTrNZVfCfgyELuRJAqSywOLK9WpSXT0/9lLN49B9P
   pRXuPza8JscWmh0Qd5LG4NLlB5wNLDQy1Fvlpsv+JR9pem2bOKnyFMa0v
   ySmP0Z4Cbl/lFBi/tGtmr0VGQ2xjM4j3yA4NtxpSeW3hq4200Hi6uHlvU
   w==;
X-CSE-ConnectionGUID: ww5NrYdKTnuNWEH9V2DaBQ==
X-CSE-MsgGUID: 3Mia8uQ0Sc2DdhyztQtJVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44562549"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="44562549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 20:24:55 -0700
X-CSE-ConnectionGUID: STbMl31YTXS6R1yV17QIWA==
X-CSE-MsgGUID: 8nO9HLsoT6OXzQxxRMyJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="125979825"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Mar 2025 20:24:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz5lb-00091C-1i;
	Mon, 31 Mar 2025 03:24:51 +0000
Date: Mon, 31 Mar 2025 11:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] ERROR: modpost:
 "kasan_inval_dcache" [mm/kasan/kasan_test.ko] undefined!
Message-ID: <202503311128.w8jZhNDL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   b007708642feb84db41492468392d502f8eff553
commit: 8d99997b19ad09073cb0bbbe68bc6ac02ef58ca1 [2/2] ANDROID: kasan: flush dcache after tag writes
config: arm64-randconfig-002-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311128.w8jZhNDL-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311128.w8jZhNDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311128.w8jZhNDL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xenbus/xenbus_probe_frontend.o
>> ERROR: modpost: "kasan_inval_dcache" [mm/kasan/kasan_test.ko] undefined!
>> ERROR: modpost: "dcache_clean_inval_poc" [mm/kasan/kasan_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
