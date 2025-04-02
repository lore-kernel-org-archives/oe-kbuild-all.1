Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC0802
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743563378; cv=none; b=Rrmp5z6ILxLXIe61GZg7w3s1NfejdbWWBZcshMcoDluWssr3cFobyKDcXnKqRozuiuHaH2Rg/PMjt+I2eFunKBTty5Rq4J3cGMVQWwzSY/JHKTtATk8GwUEIzNrnSgu+0+VLH+vaUwbZXxc0cDAiOcwJCCgkT1WDH1GakCfd044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743563378; c=relaxed/simple;
	bh=XHz9j6xoolRr6DLwjUjZEiJfUejXNnnnZ+CKmijPMvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJVo4SykiIHXIXOAGzwZb46sYd+JhdpXRwo+Z2UINsAeExy77WoSwE16kYaMtlD1tXdfge2SJbg51CVJfqzVd5ym7zm5vyf0m5jUGz3taZvWsuI+kNPHj4tOmQJOeLb2nIrt7Txi4ASug18Syr6XaNSThfC3/IAtCorOQwJG8MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mwf/CZPH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mwf/CZPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743563376; x=1775099376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XHz9j6xoolRr6DLwjUjZEiJfUejXNnnnZ+CKmijPMvM=;
  b=Mwf/CZPHcCd3RAdRo72UphRCphWzXdQO6Vr4ipxgsxnrPgLGOELCDQpH
   Wk5aKmU0fq1fAaUF4qXYSKDsX2y0U0LjI1HTPmbDvoMGTGGszLRt89A0h
   zyEQZyYj51WxzQ1svnvP/XgqUAxqd/RM54uXf1ZHVwQ67UdzLZFzokSsN
   oG+RmuadSs7BeBrmQAdfZ78RWX2xrKKWG4EHkTFsW/cgxkicDImWetKvD
   OO6A0aTlSVSL6t1vrW1OoCqabCnU4leJApC/hAyXzP9rY+PjneCUK7cRU
   2YFKeTHphEb/jkzrLHUSDb8N38P78UM5bQR0Ref/3anxBBhD8LsCZNH8n
   g==;
X-CSE-ConnectionGUID: 9WHEVrw2QUuK4jyeHcmxsQ==
X-CSE-MsgGUID: 5e42MZUWTGKaNHzMulB9Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="32505418"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="32505418"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 20:09:36 -0700
X-CSE-ConnectionGUID: Yph41CcmQfi24YvS3oHKzQ==
X-CSE-MsgGUID: Cm2hxGfIQO6OnLLwXG8ebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131704631"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2025 20:09:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzoTs-000AO0-1Z;
	Wed, 02 Apr 2025 03:09:32 +0000
Date: Wed, 2 Apr 2025 11:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 39/39]
 drivers/hid/i2c-hid/i2c-hid-acpi.c:104:6: warning: no previous prototype for
 function 'init_i2c_hid_acpi_probe_quirks'
Message-ID: <202504021044.vwrFnGSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6ba07e208acf329bb8c57e735eec5abf2c64f653
commit: 3a335beff4d27defe6b75e0895f7a5aa37f2acaf [39/39] HACK: CHROMIUM: HID: i2c-hid: acpi: add acpi quriks for HX83121 on meliks
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504021044.vwrFnGSu-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021044.vwrFnGSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021044.vwrFnGSu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/i2c-hid/i2c-hid-acpi.c:24:
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
>> drivers/hid/i2c-hid/i2c-hid-acpi.c:104:6: warning: no previous prototype for function 'init_i2c_hid_acpi_probe_quirks' [-Wmissing-prototypes]
     104 | void init_i2c_hid_acpi_probe_quirks(struct i2c_hid_acpi *ihid_acpi)
         |      ^
   drivers/hid/i2c-hid/i2c-hid-acpi.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | void init_i2c_hid_acpi_probe_quirks(struct i2c_hid_acpi *ihid_acpi)
         | ^
         | static 
   5 warnings generated.


vim +/init_i2c_hid_acpi_probe_quirks +104 drivers/hid/i2c-hid/i2c-hid-acpi.c

   103	
 > 104	void init_i2c_hid_acpi_probe_quirks(struct i2c_hid_acpi *ihid_acpi)
   105	{
   106		const struct dmi_system_id *system_id =
   107				dmi_first_match(i2c_hid_acpi_dmi_quirks);
   108		struct acpi_device *adev = ihid_acpi->adev;
   109		acpi_handle handle = acpi_device_handle(adev);
   110	
   111		if (system_id) {
   112			if (acpi_match_device_ids(adev, i2c_hid_acpi_extra_delay_devices) == 0) {
   113				acpi_handle_debug(handle, "Start Extra Power Up delay\n");
   114				msleep(1000);
   115				acpi_handle_debug(handle, "End Extra Power Up delay\n");
   116			}
   117		}
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
