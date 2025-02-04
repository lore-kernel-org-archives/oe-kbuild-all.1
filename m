Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90061139CE3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658257; cv=none; b=l46edxFLosRV5ox9ZIQG13Krdda9xqn7r5JqOqOtM4XwRSp9d1HXdTeF8QWIyVMhcaHZqwPHqwHdH6ix5dA7Hnm+N+uJWTu2SVwbGKN72JxvbcYb3o9EP04veCN68YDVDNPqSELzC7II9P1RiWMVqSLaew13YNyQXPYKt8djEj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658257; c=relaxed/simple;
	bh=wMSGGfaDfWq0eSUFYH6A8THdtCDnvNDI8aaJvSr9b1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBgSksJu9pTMbFL+48UUHEaC68iKDBw4MjrWNhnyj1SzTignkBIR+P89cTZdKzTZdBbGYzdayh+vT+/VPQR9XAUnXshcCc7iJLv2ULJvP+8xkZmd8ox+BoDqxyMmkMgypBQX5f3UzfdgEhIy1ajIWD1ex1iWaY5lgqHslVwOiEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8HTGRIo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8HTGRIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738658256; x=1770194256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMSGGfaDfWq0eSUFYH6A8THdtCDnvNDI8aaJvSr9b1w=;
  b=C8HTGRIo9YkoFJlAIA7l9VhWO+3EfPBahocK01oGgNJuuWx8ap35qGEK
   9VirT83en7J+9CBXgdZmncLfX+kj4bHPi1GO8yRmSzFeylSMZDOr+HwEY
   UVjU3FuJ6bdi1gsyyLS5xDLNPw/xwEs3hkAG0DCUmFa48wwolzUHUn9wA
   mluAWeGsXxWxyw1LTZk67jWn+OCPK3of0GWw+enstB2TuC7DgMGAACcjT
   +gqOrLDg8ChB/nCUhDBYfieBm0tCcg61I5WNujMIauIkQgaKjUNni8NV3
   dFDAmjYCoj1mbA33T+hTh4QBmnWGh2AwRYe5Eq+V+oVKUGJKpURUD5VW1
   w==;
X-CSE-ConnectionGUID: xqHbc9A3TXS6/I1tra5Yrw==
X-CSE-MsgGUID: ScyTO5W+T3K0EaVKlRyloQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50562714"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50562714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:37:35 -0800
X-CSE-ConnectionGUID: Oq1aZUPfQgSVYbeMIw+PwQ==
X-CSE-MsgGUID: TkxX7MzOQTigpxvgeqVUQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111113519"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Feb 2025 00:37:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfER2-000sCZ-00;
	Tue, 04 Feb 2025 08:37:32 +0000
Date: Tue, 4 Feb 2025 16:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170] drivers/media/i2c/gc5035.c:1518:46:
 warning: unused variable 'gc5035_internal_ops'
Message-ID: <202502041659.h1X8Zeeu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 2aa4f6ff52e147c3d01a521323fa3ccf4e8c42cf [170/170] BACKPORT: media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502041659.h1X8Zeeu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041659.h1X8Zeeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041659.h1X8Zeeu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/gc5035.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/gc5035.c:1518:46: warning: unused variable 'gc5035_internal_ops' [-Wunused-const-variable]
    1518 | static const struct v4l2_subdev_internal_ops gc5035_internal_ops = {
         |                                              ^~~~~~~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from drivers/media/platform/renesas/vsp1/vsp1_entity.c:14:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:1628:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/renesas/vsp1/vsp1_entity.c:402:5: warning: no previous prototype for function 'vsp1_entity_init_state' [-Wmissing-prototypes]
     402 | int vsp1_entity_init_state(struct v4l2_subdev *subdev,
         |     ^
   drivers/media/platform/renesas/vsp1/vsp1_entity.c:402:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     402 | int vsp1_entity_init_state(struct v4l2_subdev *subdev,
         | ^
         | static 
   5 warnings generated.


vim +/gc5035_internal_ops +1518 drivers/media/i2c/gc5035.c

  1517	
> 1518	static const struct v4l2_subdev_internal_ops gc5035_internal_ops = {
  1519		.init_state = gc5035_init_state,
  1520	};
  1521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
