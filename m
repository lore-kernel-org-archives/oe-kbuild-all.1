Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9382101A4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730993002; cv=none; b=KYd6M9QcWcaImkIHPplhgJsDeJkp1Z2oR+/ezAh6RIro9KvhhJ/q8hOFx0C2x9MWgTyq1zS5MSbfQEv3flcX9h0DNwfDloBLOyfpnjv50KUcU7kXhXnTCwCe36Ep+W//O9JCYPKL6H1w9AOsmaVQ8qFcmixNsvPUAqWo2uSz7bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730993002; c=relaxed/simple;
	bh=WUHrOZ+Yy5wonwjJhUgyudCTplwX4Rfh8mCD/3y7mPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTii10wPRYTrGKRSX6eZ1hMYENN0bhPAzYaLmvaZjBxmKLShOsv3oKAulSVzO2494W/jGN7xbsJRIusKOee7q3KP7/p2v197GlYRRimq5+HBuLpg3ouneBUg87WGFEEC2T3blzLSxJGpNqtfzNwLj3BeI+Hb5Xv4n9A12NChenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTIC7W5w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTIC7W5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730993001; x=1762529001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUHrOZ+Yy5wonwjJhUgyudCTplwX4Rfh8mCD/3y7mPA=;
  b=UTIC7W5wfnbi2aW1hZcCCF7Pgh9zyV3773MaMJpdMFGA5+nKd8hRKthT
   YZ1k5IFI3gMU3hpP1PAVQLGh3C2mOo0gwteIl9SXo5jLAvMhreYShrzTI
   PYC4WjHlOpH/TdjXBEb59zHTfEvLGBjUbuo75NgZAn0nDIWxcc3TJ2Wpc
   5nCHYMy6lTlo58KTVezG2H8w0EmWRlso8iQzXoyIlVzARxjXtEEHnMY45
   rhTcU//kbsLxUHZ6SqfK0XlClOW0RLtrjGE7qzTictTP9D8eljVNkkRIM
   bNuxBNZrIw/bTSbaCf5oug4morEBWD6jecslimy5CFWmE79QKNVIB2D3F
   Q==;
X-CSE-ConnectionGUID: d4+sMv9DTuacJ8K+pFxsnQ==
X-CSE-MsgGUID: C30tP0SFSx2Tw27K8wnpGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34619172"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="34619172"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 07:23:20 -0800
X-CSE-ConnectionGUID: 3GKgG2qwRtOe0lCW0R7sWg==
X-CSE-MsgGUID: x/dUsDr/SmaESf35DSuFLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="85921492"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2024 07:23:20 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t94Lt-000qRG-0Q;
	Thu, 07 Nov 2024 15:23:17 +0000
Date: Thu, 7 Nov 2024 23:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15301/23134]
 drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c:159:11:
 error: incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202411072305.C2yJS4nD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   352e4b287416dd463dd665a1f35bc9ed6ae9dd58
commit: c7f8bcb2b8858a5291cd7c06cc48e6520bbd7c8a [15301/23134] CHROMIUM: media: camx: Cache eeprom content
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241107/202411072305.C2yJS4nD-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411072305.C2yJS4nD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411072305.C2yJS4nD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c:18:
   In file included from drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.h:16:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:37:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2222:
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
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
>> drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c:159:11: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     159 |                         return ERR_PTR(ret);
         |                                ^~~~~~~~~~~~
   5 warnings and 1 error generated.


vim +159 drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c

   141	
   142	static int cam_eeprom_cache_content(struct cam_eeprom_ctrl_t *e_ctrl)
   143	{
   144		int ret;
   145		int i;
   146	
   147		e_ctrl->eeprom_content = kzalloc(e_ctrl->memory_bytes, GFP_KERNEL);
   148		if (!e_ctrl->eeprom_content)
   149			return -ENOMEM;
   150	
   151		for (i = 0; i < e_ctrl->memory_bytes; i += I2C_REG_DATA_MAX) {
   152			int block = umin(I2C_REG_DATA_MAX, e_ctrl->memory_bytes - i);
   153	
   154			ret = cam_eeprom_nvmem_read(e_ctrl, i,
   155						    e_ctrl->eeprom_content + i, block);
   156			if (ret) {
   157				kfree(e_ctrl->eeprom_content);
   158				e_ctrl->eeprom_content = NULL;
 > 159				return ERR_PTR(ret);
   160			}
   161		}
   162	
   163		return 0;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
