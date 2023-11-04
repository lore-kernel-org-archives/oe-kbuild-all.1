Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FCC17CB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 01:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/Z1CRBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699061737; x=1730597737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fuCaJB53PuPpfkCp3qXy+MxFjmavbeVv5g/U7Jlobn4=;
  b=c/Z1CRBkSEoUGaW25HR/Edb+UfPqkSubYqc/AZyMgQDWryseBwwPQGza
   dh6J0D66dLaRJi4VJZrwuWqzW6skiNhhFLD5+QtCalbRR/LnJJN2IA51K
   sdGRhNZpikd6QGtvkAwMhS+EUvDTLtnijU0tK8bBfi4v8+ttct0zo0kJb
   Gj/wlFpXYR7mZWwM8gj7isuJRddCfrY9bHMFS2BLKIrQYOfkbHMg7mca+
   YXMWm8hIW6OfAhJVkHNxeIV0WjWN/Hda253hbkIGQXRcvsY4FE3X8Up3K
   IPi318l7vAJUgmmfPWKt3iv26DN3HSTVyRjKpqT86UE8403WUFReGL++8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1932577"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1932577"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 18:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1093243900"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1093243900"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2023 18:35:35 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz5ZV-0003Bw-21;
	Sat, 04 Nov 2023 01:35:33 +0000
Date: Sat, 4 Nov 2023 09:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 21/22] mm/swap_slots.c:95:6: warning:
 no previous prototype for function 'is_swap_slot_cache_enabled'
Message-ID: <202311040904.arB2j5dZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: e064059673798b931f95f724c7e377fa8cd15df7 [21/22] ANDROID: create and export is_swap_slot_cache_enabled
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311040904.arB2j5dZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040904.arB2j5dZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040904.arB2j5dZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_slots.c:95:6: warning: no previous prototype for function 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
   bool is_swap_slot_cache_enabled(void)
        ^
   mm/swap_slots.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_swap_slot_cache_enabled(void)
   ^
   static 
   mm/swap_slots.c:101:6: warning: no previous prototype for function 'check_cache_active' [-Wmissing-prototypes]
   bool check_cache_active(void)
        ^
   mm/swap_slots.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool check_cache_active(void)
   ^
   static 
   2 warnings generated.


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
