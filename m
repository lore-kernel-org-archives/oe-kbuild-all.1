Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F737A84F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756549; cv=none; b=LopfFoz/r3gOaDU3fCJvDrDODPwx67FE5oy+NuDsxqTfDRKfgE8BFNoNwfI7y1+MfJgDJP2r4ymomm2YzfQ2A4vraEs+fSBPKf+TgIgUFpWhL7fy+QOP54V7HbA/l5uEnBTO5t4eYMehAOTYnzML8OZVyGVc9eP80TnSFgivL04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756549; c=relaxed/simple;
	bh=MaUB4Yu3+2BvGflEPSWRarBmj8GdZshDDjnJ5bKjS4w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gHm/0ZTG4UYbPRpQCPsFmfMh8Mn1HHPSgR0B6muH5VHBJ/DoMusKLAdIE8ySt886PneAh5uCqsM/m0Z+xrc6DlAtJQkAJ+YH4/oQeNQcOiwn/A6JB8sq1OULMaXwFkshiDQeT/OGJqCH7YLcZ/V1lPOa37SWBhnV38VzRryA38A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDpARt3T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDpARt3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783756548; x=1815292548;
  h=date:from:to:cc:subject:message-id;
  bh=MaUB4Yu3+2BvGflEPSWRarBmj8GdZshDDjnJ5bKjS4w=;
  b=lDpARt3TMtLlhRDJSVl8u4oxspmCDk1qF5itu2vlkn+EbxK6S+LnfPmt
   ack+kNcOFzOXRBwSgQZN+nLVPUTFX8EcwT78zDK4DiZ0t7HHyevUYBS81
   QZ3b+gsTxLK6VHNCOqAnGQwtJ09a98C9QI3tVVqEwjw56hMgeKedfrcTH
   inksZE1qWP/vjDKqyY0g/e1W49gV144NFvXZsmKbyUS4Wvjwf3ge06Swg
   Y6uCdSBa8Qo8h/2m43L3c17ZcIQFnLLm7LkwLUvmCOmyFU2bn5p9cyLHZ
   M9zgXUhx/mpKN3Pb7MS3Qsqimg4cb+VxTxCBqhSL11r0rYBixWODxR3Y8
   g==;
X-CSE-ConnectionGUID: fB4l1s4yT8CaGgXdzKUduQ==
X-CSE-MsgGUID: f0TC6n3BRoqnISNWYFCoUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84543730"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84543730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 00:55:47 -0700
X-CSE-ConnectionGUID: 8AB0UxKcRxqx2VdvgKJevw==
X-CSE-MsgGUID: BZIZ33ZuRWGDMKMGizX1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279493132"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2026 00:55:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiSYp-00000000Jsl-1wse;
	Sat, 11 Jul 2026 07:55:43 +0000
Date: Sat, 11 Jul 2026 15:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-09 1/1]
 drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous
 prototype for function '__android_set_connected'
Message-ID: <202607111521.oSV2u64Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-09
head:   5e24956e1547fe617dada6fb3e853a856914ed20
commit: c6f183ea8e2b26be3fd296bd096c4cc579e891c3 [1/1] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-randconfig-r073-20260708 (https://download.01.org/0day-ci/archive/20260711/202607111521.oSV2u64Y-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111521.oSV2u64Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111521.oSV2u64Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/gadget/android_configfs_uevent.c:5:
   In file included from drivers/usb/gadget/android_configfs_uevent.h:9:
   In file included from include/linux/usb/android_configfs_uevent.h:9:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous prototype for function '__android_set_connected' [-Wmissing-prototypes]
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         |      ^
   drivers/usb/gadget/android_configfs_uevent.c:231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         | ^
         | static 
>> drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous prototype for function '__android_set_configured' [-Wmissing-prototypes]
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         |      ^
   drivers/usb/gadget/android_configfs_uevent.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         | ^
         | static 
   3 warnings generated.


vim +/__android_set_connected +231 drivers/usb/gadget/android_configfs_uevent.c

   230	
 > 231	void __android_set_connected(struct android_uevent_opts *opts,
   232			bool connected)
   233	{
   234		unsigned long flags;
   235	
   236		spin_lock_irqsave(&opts_lock, flags);
   237		// Don't send the uevent if connected state is not changed
   238		if (opts->connected != connected) {
   239			opts->connected = connected;
   240			schedule_work(&opts->work);
   241		}
   242		spin_unlock_irqrestore(&opts_lock, flags);
   243	}
   244	
 > 245	void __android_set_configured(struct android_uevent_opts *opts,
   246			bool configured)
   247	{
   248		unsigned long flags;
   249	
   250		spin_lock_irqsave(&opts_lock, flags);
   251		// Don't send the uevent if configure state is not changed
   252		if (opts->configured != configured) {
   253			opts->configured = configured;
   254			schedule_work(&opts->work);
   255		}
   256		spin_unlock_irqrestore(&opts_lock, flags);
   257	}
   258	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
