Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D682D5935
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770794367; cv=none; b=a2AucYQOuJ/pyZoXe5omQtZk27LGuulOCwqMxeCu0PcberkEKxNRVixyUdYN442OeKLLMVN4Ky51G9K3L8jVZGYe2JcZmBLLgBURiFVSAunaMDKsCECuYYUeJxycp7dvnOs0jkbEXf9PAGDruwm0Uhra+delQiQ/3s0DSo1qd4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770794367; c=relaxed/simple;
	bh=Ozjd1lyydwnMvo3nfkBOPYfSyXPB8/wE/WfjBSDFd4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rb4KYS03Cps2F7GalbeoB4PWk9y6rmeZl1jHIBijIdNVjXVTzhljUkOk6nJV7HaxXFzGDCjxfi6Zc0Pm6b4b76U7TMduj+9Z68dR60MNnr7xeU0cnO+keNy0zcYLlBHAIxV5Ja1ay3CmHeoRhGA/Yu/YnlwxXxgVRTwd/1/IvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IixAQSw2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IixAQSw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770794366; x=1802330366;
  h=date:from:to:cc:subject:message-id;
  bh=Ozjd1lyydwnMvo3nfkBOPYfSyXPB8/wE/WfjBSDFd4Q=;
  b=IixAQSw2HnDACh0meWHF/pN6Bi/LngU0CvYUV3DAcsse0kR1pxl1FNl5
   a1WpS68CyeUMmXezbywC6vE+dagiZr2ctyJU6rpaPhlrxrgtFePAIpI/9
   PJOf3ZqxTa4d0jXx/9AxgPzNPQLPpOQT0KT7EvkVdpQ39yfON+RaGQTon
   NzHTk9VFPH4W3s+bPqo5Obln4Y92YE0IMcwwNkG0hsUDmhMh78IV34kx0
   IumiPnZlj0iPpByf4kobG92juZcuAYkGa+bbtz11Kras6Kk+EMrM1WrTd
   aupbYcYVMh4K+iHad9f3aGYrVWP3w71eGWB7ITxlEiyVHzW+kqvDM32iY
   Q==;
X-CSE-ConnectionGUID: nwfdpG0HQTmQegNFZw+wEw==
X-CSE-MsgGUID: PnPx5d4aQUex9MLVw2f91w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75781906"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75781906"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 23:19:25 -0800
X-CSE-ConnectionGUID: Pd7Hx/0USHGHp9RJxNfbsg==
X-CSE-MsgGUID: PEmLeiO4Tqm1aIpa/i1frg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211769464"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2026 23:19:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq4VN-0000000012L-2ZGx;
	Wed, 11 Feb 2026 07:19:21 +0000
Date: Wed, 11 Feb 2026 08:19:20 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] posix_timers.c:257:13:
 warning: 'check_sig_ign' defined but not used
Message-ID: <202602110844.2fz6eXhB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi HONG,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e625a969da56eb1e7cd097610614e0ecc10fe60d
commit: 32c1bffe815c9ed746ce7d84cae07da17db6bca4 [1/1] ANDROID: Compile kselftest_timers_posix_timers code
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110844.2fz6eXhB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110844.2fz6eXhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110844.2fz6eXhB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   posix_timers.c:399:13: warning: 'check_delete' defined but not used [-Wunused-function]
     399 | static void check_delete(void)
         |             ^~~~~~~~~~~~
   posix_timers.c:343:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     343 | static void check_rearm(void)
         |             ^~~~~~~~~~~
>> posix_timers.c:257:13: warning: 'check_sig_ign' defined but not used [-Wunused-function]
     257 | static void check_sig_ign(int thread)
         |             ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
