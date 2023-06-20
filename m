Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C40E566
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687257794; x=1718793794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JF8/4yMk2YVqcjm9AkITTOFFsXVwww38aC4p+1iip+Q=;
  b=R+T9gFyV/+0UnzYFgzNK+K9OGHvm901/dmzJHFibahlT0RK+RnVh6iV6
   Z5EptWFjMHdgj2c62NAykSs3HC3QNaZUP/HijiDRgRgvMFSBDVGje1YqT
   FlGenhBeC0dphul6yKZyeiqEyF3u75wSBWOhaEXbLHZiLRqQONDMULUIy
   Jm9x5jpls4Jeymv3o52ofnErKg59SK8OG55CDJ/TvW1xzXuv1cLw3EGfM
   4nsWxrN5yYKII6PjrRfeNfyRNVwjbX83bm0siY540pI4ifO9cANrKdTfY
   yuOyrtfYXTJtVCQjCRj/cMSkUwb/rdClX8+3Cs2WWf/RP44xHM0KLuTI3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="425781889"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="425781889"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858538336"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="858538336"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 03:43:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBYpL-0005or-23;
	Tue, 20 Jun 2023 10:43:11 +0000
Date: Tue, 20 Jun 2023 18:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-07 12192/27195]
 include/trace/hooks/v4l2mc.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202306201853.QcM50caW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-07
head:   c93516a2d02c0a1f0466b3f512977c40c1bee4f0
commit: e6a59da61ee8027a97faa3e93945e3f397570a1e [12192/27195] ANDROID: media: v4l2-core: Fix deadlock in vendor hook
config: i386-randconfig-s003-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201853.QcM50caW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201853.QcM50caW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201853.QcM50caW-lkp@intel.com/

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
