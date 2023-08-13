Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E24015BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Aug 2023 06:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691906614; x=1723442614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZ7KqzSYEranv4/L/Bb3RpUnQT1Tfc8VRdCy/vrMAm0=;
  b=ARRsuJY+LkJ3qDwhXqDfg32qaIGacf/LaZFJv8QSa5ZHOzpziTnkS0Gu
   vMNNtKQENxG0ibO/iA9412YIVRVIIYYL6EdJykFxDBe5lBDLw2gwrGAXt
   yKhxWi5Ju5+vSUlIB8O890z1Ein4cKWRlfSu+ZVO09KTMnSO+bCDFcNsV
   3gH2dP6Z2mKfazjFkpaqHxcLZRHgytIpFvNMJG+AaiOFBjPPJLTCInm4i
   EExIURycj0T8x92F+vQxyFesRFrU6/D+PIq0O5g7PmUCOLvcPnxDpogFk
   WXjdL++DRaWe10XksKX/1SWETqsZKU/fM2pBYT+3/5TYNJuoo6RyK1eUR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="375576104"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="375576104"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 23:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="682947542"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="682947542"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Aug 2023 23:03:31 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV4CJ-0008ye-2X;
	Sun, 13 Aug 2023 06:03:31 +0000
Date: Sun, 13 Aug 2023 14:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 12286/28677]
 include/trace/hooks/v4l2mc.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202308131408.Ohq2qFtq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   020f099b296ebdd186f3ece99fd8da51fcc478cc
commit: e6a59da61ee8027a97faa3e93945e3f397570a1e [12286/28677] ANDROID: media: v4l2-core: Fix deadlock in vendor hook
config: i386-randconfig-i063-20230813 (https://download.01.org/0day-ci/archive/20230813/202308131408.Ohq2qFtq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131408.Ohq2qFtq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308131408.Ohq2qFtq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/mc/mc-device.c: note: in included file:
>> include/trace/hooks/v4l2mc.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2mc.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2mc.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   drivers/media/v4l2-core/v4l2-subdev.c: note: in included file:
>> include/trace/hooks/v4l2core.h:52:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:52:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:52:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:57:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:57:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:57:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:47:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:47:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:47:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +19 include/trace/hooks/v4l2mc.h

    12	
    13	struct media_link;
    14	struct media_link_desc;
    15	DECLARE_HOOK(android_vh_media_device_setup_link,
    16		TP_PROTO(struct media_link *link, struct media_link_desc *linkd, int *ret),
    17		TP_ARGS(link, linkd, ret));
    18	
  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_media_device_setup_link,
    20		TP_PROTO(struct media_link *link,
    21		struct media_link_desc *linkd, int *ret),
    22		TP_ARGS(link, linkd, ret), 1);
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
