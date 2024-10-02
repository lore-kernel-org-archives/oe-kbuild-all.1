Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFE10E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881519; cv=none; b=mw8stZqoZTrGjesnC3QfHeljVdeMosrhF+cbi37BN5Ov8/SdsAkXA+qn+sgzeP3WDeKosl7/jDGiQ2Hm/rfRnOQALfNhutnm8YnnhXs7Rb47OAXEj5C01E7LzKd1l0UsFMLS+MeM23uNtG8NyNF6j6hNDcBUSB9ytnC9bOINtz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881519; c=relaxed/simple;
	bh=tYXlXu06cp7U4JKH4rXqwN8AIGpb7/3rdwaUb45RDBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVS6rE+Ps++n62nsqBsNiWIb7Ip+FmotBZhx74DQSMkoNbabsnCoR8PwBjiCAJZu2x7GMGo98Yw6rd7UEPVlXhnJaQFzqdtD+5N8ierBPe4ScNEnwiJEQa/xCifGDa50Ui5BpYBWnfkxX9Kg9KeF4FXAbiuJ4Z+06n8SdWaLsoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAe8jLlY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAe8jLlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727881518; x=1759417518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tYXlXu06cp7U4JKH4rXqwN8AIGpb7/3rdwaUb45RDBk=;
  b=LAe8jLlYx2mkb8cwyurZ0ltel9iShDMyhk355guoCEskzo+YUl4tMZgo
   xkhpZxK0rNilrbSVRVm1EG5enO0jAjXGfu2jg/w5ErdU95s/K9elFmRa/
   EXw2KZf7sOvpm8TVTCxIcev0Fry9pKYl0hQgrYmfPgd1Qv6vQ0cAlw3MB
   fPJN8Xnlf8ZDUeMEZI3o3BpxyR6CVzxaypKxlFUqXVm/KtqQ2MMn0EqL1
   qnQyQZ8812Xvx6r8jAPK85rxT969PSYMWNvX6DFy3npl4ogh/LIIbTylm
   ZxQ310NSYY6HEVKl3iCildU0ioZYLZ+r0sagObO9AUd3NhSsW/OeMFTQm
   Q==;
X-CSE-ConnectionGUID: wu+t6tZ5T5iASkDaLj8gmQ==
X-CSE-MsgGUID: lbI5t0iUSLyqcElrWx/fXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26553861"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26553861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:05:18 -0700
X-CSE-ConnectionGUID: E9XNMYbTTCiKzKnQx3IZGA==
X-CSE-MsgGUID: igpaoHONQgeZTJ2zhBq+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="104839243"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Oct 2024 08:05:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw0ug-000U7j-0n;
	Wed, 02 Oct 2024 15:05:14 +0000
Date: Wed, 2 Oct 2024 23:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15301/20658]
 drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c:159:11:
 error: incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202410022250.21ruGtzb-lkp@intel.com>
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
head:   a81f127d7432274edb73f16568b5b097fca99d2a
commit: c7f8bcb2b8858a5291cd7c06cc48e6520bbd7c8a [15301/20658] CHROMIUM: media: camx: Cache eeprom content
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410022250.21ruGtzb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410022250.21ruGtzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410022250.21ruGtzb-lkp@intel.com/

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
