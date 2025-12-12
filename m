Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B698184524
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765583384; cv=none; b=thMy5hBjxIAFYADU0q00Lt1VuWhErpDZpLDj0xHXAklWt2rH0Hza1kmOR0M4ia3gXxMXAASzeg8p19BANtso2WnpACiwdlCvlT/6P9fdKG9FRwXrkXapQODS3RqAydd8HqR15tegeoZpKqUlq3g/pvcrKNxdeGwYLfDyi/cG8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765583384; c=relaxed/simple;
	bh=GaIhACMNGlOgZhequb4LU4JhbBF1donCqCAGbm/3LwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qmo8KCySqstmzeq7MtHdwNX04jJOui7p+O+JI5Q7OUmolVgXs2IjXEM0hxgujFtHQSlNhYWSSyOxEGbSjGGVmLWgH5lVrUjp9gcf6KZH9jhnsnJhx2N4OrPFSSYkszQgKxu3qnslhTkOIuvnZBh1XkmY01amtSaql2HK3K4ux9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbdSKYHO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbdSKYHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765583382; x=1797119382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GaIhACMNGlOgZhequb4LU4JhbBF1donCqCAGbm/3LwM=;
  b=fbdSKYHOQ6/c6fAoZ7OPvPiwbJnCrYWAK9lpr7qxa3PC2ODij7ONzPpo
   I76Vy6DryQWapVQxUcprunNfiXohio/tr2JxMrObWPpD5MPV9BzjHkwMi
   Jx7J2S+/yQyW+LaW/2VlFliXcDae1WyvQ802zDMqneA9j0N60ov3ubatr
   rEMm0NqO/Scpbm1lveawe3U2BAOgrboLKHBUsIzFkR4IMQnrAMJg4TO7U
   /UGT0Jei+VTD3GD+xPeSzF8TpNszqdI+J2f8cpKWwvNvyibM1UQCrCn3j
   NykSqeopxCj21TMD2pvLMIH7P6elC0ky/vIdhNmikJKkyLnFwjX80mwdO
   w==;
X-CSE-ConnectionGUID: LTe55kHoSxWexTwGmQ4RzA==
X-CSE-MsgGUID: 5WTXGgomSGGF0MXHGvHPSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78706060"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78706060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:49:41 -0800
X-CSE-ConnectionGUID: RCXRjqbbSYKMLtg27hwMrg==
X-CSE-MsgGUID: PA2Q+brkTPeql9Y7iRhbSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197108043"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 15:49:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCtG-000000006n3-0cPo;
	Fri, 12 Dec 2025 23:49:38 +0000
Date: Sat, 13 Dec 2025 07:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3407/3407] kernel/watchdog_hld.c:502:12:
 warning: no previous prototype for function
 '__hardlockup_detector_perf_init'
Message-ID: <202512130732.r3cU7k46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wei,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [3407/3407] watchdog: Fix sleeping function called from atomic context
config: x86_64-randconfig-005-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130732.r3cU7k46-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130732.r3cU7k46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130732.r3cU7k46-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/watchdog_hld.c:502:12: warning: no previous prototype for function '__hardlockup_detector_perf_init' [-Wmissing-prototypes]
     502 | int __init __hardlockup_detector_perf_init(void *not_used)
         |            ^
   kernel/watchdog_hld.c:502:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     502 | int __init __hardlockup_detector_perf_init(void *not_used)
         | ^
         | static 
   2 warnings generated.


vim +/__hardlockup_detector_perf_init +502 kernel/watchdog_hld.c

   501	
 > 502	int __init __hardlockup_detector_perf_init(void *not_used)
   503	{
   504		int ret = hardlockup_detector_event_create();
   505	
   506		if (ret) {
   507			pr_info("Perf NMI watchdog permanently disabled\n");
   508		} else {
   509			perf_event_release_kernel(this_cpu_read(watchdog_ev));
   510			this_cpu_write(watchdog_ev, NULL);
   511		}
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
