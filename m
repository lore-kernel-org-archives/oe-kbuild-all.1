Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B503A945
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 19:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687029770; x=1718565770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8ZYlwE1dubyL8Mg6yzQmomYFpeP8KfX6wJ5FQA52K0=;
  b=VWYWOnxiejM5iQJlYPUxKmwYoGZ+dT+tgwVSmSBClLChLOHenWUkHj8w
   /WhzgijSF9xrlKs3A+AVVGoF/SGDcb8qKdbFxXeotA+4Wa48ckrn/Uojx
   JsduT/wMcoDNXO8mUVhTGCE7qoGz/jZ4jTciOVR4bwROWK0FUIVS+0Dzp
   fMIQvyLuy3lyOYiiMIszHR1OcPihL7w22Et4fA4zOmNPbswC+ozADY5kn
   vhPsIJjUqiTOsaO7mNbXvLjAtQJ1RJZgXpo6bzXBBghvccm4++aaYPULd
   0WFKqkunZvEvCogv7fSclC1m5VZTGIupDTEFMZqYlpV/GgaUrR174DTa3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="359429312"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="359429312"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 12:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="826120554"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="826120554"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2023 12:22:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAbVX-00032W-1k;
	Sat, 17 Jun 2023 19:22:47 +0000
Date: Sun, 18 Jun 2023 03:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1925/27674]
 include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202306180323.QkBEaPvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: 62e32cf8f39709054e9dc0308e2c103e433b7f20 [1925/27674] ANDROID: mm: Create vendor hooks to control ZONE_MOVABLE allocations
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230618/202306180323.QkBEaPvB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180323.QkBEaPvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180323.QkBEaPvB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/readahead.c: note: in included file:
>> include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +23 include/trace/hooks/mm.h

    16	
    17	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    18				TP_PROTO(gfp_t *flags),
    19				TP_ARGS(flags), 1);
    20	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    21				TP_PROTO(gfp_t *flags),
    22				TP_ARGS(flags), 1);
  > 23	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    24				TP_PROTO(gfp_t *flags),
    25				TP_ARGS(flags), 1);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
