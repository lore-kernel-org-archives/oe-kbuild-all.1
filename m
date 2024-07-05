Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A3145FED
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720169975; cv=none; b=nmx3z8Q9HjXSw2GDoZ7C1E4jsfaSiAbZiEVtz0IKRA6cyms6B7feemUBIuy2h888Sf1Hpr4CO2dwVXe265lX7ABZp22DJuJ/D4zOXC709cbY0y4Rs9DWLzEy9Hhy+FO+TucvGz3F1hVAm+7Nrayvgf5+H6BVTWEprTqRzUr75KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720169975; c=relaxed/simple;
	bh=6henrfhxDIYbwuIBIQNjKE2nbQwCrY2SLRuF4qPRbMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdsDYT+SoeaR0xMOqJe2CrlJtPgz5+Sk1vcxuYNE578vEQ+5ickwaG1FmIpJBRHjfrqwojeCcndJxx+nbSYPNNN4vkTAjIMb0X3yrek9+73w+Ugs+JHDv7aLI+60BovoJZXUoJyH3rgB1wYqK+KxAykS7TH+h7VOVeX5bcqY7Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKaUvTl2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKaUvTl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720169974; x=1751705974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6henrfhxDIYbwuIBIQNjKE2nbQwCrY2SLRuF4qPRbMM=;
  b=UKaUvTl2b1DoIduXWF9YKsGImUAlBfYerBhwfMt5Kl4EFiC/x6ucFt6o
   /9H3BD0S4Sunf7TCv+bmSKgcrWMqQKbVfKHOLDxoj1NwiNz2TNFaBbAij
   nSM/kSNfJPJFsdVute158DVoeRUqDlStdWfqmOeoDBdCqMIpePzz/tRUQ
   DrevECQC2hNyawJEe0IYzGJH/L5mzQDEiku7QHtUw7EQfiKNZfRX2YfgZ
   +WXcwL2M4tHzHieaxmnVYLYR4wFFYbUR1RW+XrPppmMUgB/v5cndEt87V
   wzMb8rUAUcG8UaG0c0lsbH8717Gkd0L1EMXNPRUpDzHstgWBhs/wjatvS
   g==;
X-CSE-ConnectionGUID: tFgs0h18QXCZje3MLc8F8w==
X-CSE-MsgGUID: oWpZ+syRRvaYJHE/sKoVGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17587914"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17587914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 01:59:33 -0700
X-CSE-ConnectionGUID: PlBfqt6yQ3WVr1lo9I85jA==
X-CSE-MsgGUID: mm30ruSuS8+CfVuFAH/J0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46932748"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jul 2024 01:59:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPemv-000SAK-1Z;
	Fri, 05 Jul 2024 08:59:29 +0000
Date: Fri, 5 Jul 2024 16:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14612/15088]
 drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c:159:11:
 error: incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202407051613.p0UdJzBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   2166fa6b0c817630441a03552541b022f35cfc03
commit: c7f8bcb2b8858a5291cd7c06cc48e6520bbd7c8a [14612/15088] CHROMIUM: media: camx: Cache eeprom content
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240705/202407051613.p0UdJzBo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051613.p0UdJzBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051613.p0UdJzBo-lkp@intel.com/

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
