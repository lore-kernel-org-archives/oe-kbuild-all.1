Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052521CE6E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726325528; cv=none; b=Tq/xLMwtKITZO1jJsVQJ8ysK/pDZWjbcaSG4+M7jDFVOD8effgxtjCbFQUszszfvNdMSzR3Fwp50qmQxMh7uJLFDkyUSnioDcr3rnu8vtAC3TJHqMpsyLFi9OZaIroIQIT6c3xQv8H8aRfrwV5sfq5XRZnYCuKf/JVdlMqVyD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726325528; c=relaxed/simple;
	bh=+p9lxYVCJaMsYm6JyWBJ5DgPpfUqxiohdby8VtNEn+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n0C4CSvmtZHnGSNRW6e3IiFBa9+Z+ucOsPanWQUtz3iDjb6O9hhEYtCVPcCx9y4G4kPJM4UJrRR+SSjmVFK2hXldpuHD9ZzDU5f8guIw2mRg51zsjCzBzEda7Gwz8q49z2vAaL/irY13XR1Pa8P/8B2D09gfnwvmvgQ90iUjK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S019vJgi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S019vJgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726325526; x=1757861526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+p9lxYVCJaMsYm6JyWBJ5DgPpfUqxiohdby8VtNEn+U=;
  b=S019vJgiZDZKRt+6bswU3NDEhy1EJFHqP1E1xmFER6O9Y4xZnt/Lp8ho
   prthOd59THvPjgI24AgJZAzRHviRHK60sn9fbBRRHYtAD6U+PpJrVxMpE
   CLxMBi9N9thrUp7IQYl33paZTQjc3NpGUCGYwUZJjC4Wx8fhdFkFYu+pO
   6/S1KXBOxEahxJd19o724j9rzAm9CF9+vZMALvD/swJQuSU/mHmR0Dqpi
   taNCi5nHV+qnehxHLjKLDd408qe4hr+/1n1GamBI2TuiFZdoOMSHt83dl
   y2kUOzNslIb1tFe1Lc3II9hucZ+QZFvkRcsoRhQekuYfpaVw9HX6vCJit
   g==;
X-CSE-ConnectionGUID: T7lYjiZVS0uQpqGo9V3wsg==
X-CSE-MsgGUID: Sq2JNEu5TuWgfHwyQ4PJZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="50634048"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="50634048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:52:05 -0700
X-CSE-ConnectionGUID: EB8mz1zsTH6Qyc6bjeTOVg==
X-CSE-MsgGUID: 8Vv0RYPtQDypGPOw2CTEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72529408"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Sep 2024 07:52:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spU82-0007rB-16;
	Sat, 14 Sep 2024 14:52:02 +0000
Date: Sat, 14 Sep 2024 22:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14612/15124]
 drivers/media/platform/camx/cam_sensor_module/cam_eeprom/cam_eeprom_dev.c:159:11:
 error: incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202409142225.0nfFOjTM-lkp@intel.com>
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
head:   ad8dacd5a4263ddf51685be3c2190a341c26869b
commit: c7f8bcb2b8858a5291cd7c06cc48e6520bbd7c8a [14612/15124] CHROMIUM: media: camx: Cache eeprom content
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409142225.0nfFOjTM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142225.0nfFOjTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142225.0nfFOjTM-lkp@intel.com/

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
