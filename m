Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134234BA53
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 18:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758219646; cv=none; b=KbiqS6UjE0mvRdK3Ge8l6ClHGXt3Y2BE2+1RE4gwntfjT0jNg5snPM1J2N1IP+Potm727oxWbH7lD9w5oFeaEMTKeQfUduN+WIo5swksq4cj7dXvnW/8i1OubxMLPQLg7XJg/V1wvdZgkQmqd+aHKXxV1mDoWuM4toauVS5YCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758219646; c=relaxed/simple;
	bh=BKaZcET/XA1aCUuL0LQIoUCVuNc8eahB9JLFG6r5cI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yg5ID0Jsn50n4i9mpkt56r8nvi9RN0QkmKJo85EM3HulqLnFayBEf04Miho/KVTGJJ15WQdJV0WDgYc64ox6gQGRzKFJ3LPLT2RH9mcYZMwAa8HiwgyIgumCb3wM4EMWjZNp/NM4Sl/25AI87l/iLXmTMt2+wFM5A0BMt7W+ZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmciTowO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmciTowO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758219644; x=1789755644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BKaZcET/XA1aCUuL0LQIoUCVuNc8eahB9JLFG6r5cI8=;
  b=AmciTowOSR5GuHS7EKSXtopx4qwrqdCTafkFX4x4v+4gT3GWyA3MWNvr
   LBMtSoa+jXimepyCpU0AegkPGfs2Xp0QNAC8M1x9vgR9RzpV/PAhhwFkz
   xGtxyM+NT2Fn0ulVhDYmQkhPBIjey6ztxvO8ztM1sr6OsvY67NxXttjdI
   +Lmf6FN30F1MKP6hKVIId8S45MPL0MVCo8najoVeA9q1u9wd2Unw7xLnz
   oTepnvqI2nLElJWFl9nIRQycs4wtlWIcosHwbnoySn62D/IoTykN0hiGS
   272LV1LK0DShow0V0hxkcIfT8zOdAKbOsNwHnWgrPwMtDgTMWiU/NJR92
   A==;
X-CSE-ConnectionGUID: s9gQgUM1SwykGC8kMiddDA==
X-CSE-MsgGUID: zpr8tJETQmqNh0TnJLumkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="64200022"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="64200022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 11:20:44 -0700
X-CSE-ConnectionGUID: 1H7d/UhrRNKHM7SiIgClqQ==
X-CSE-MsgGUID: JslKFg6/SjW4Ug/yMugxDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="176440716"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2025 11:20:42 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzJFI-0003bL-1K;
	Thu, 18 Sep 2025 18:20:40 +0000
Date: Fri, 19 Sep 2025 02:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/spi/spi-phytium-plat.c:192:36: warning: unused variable
 'phytium_spi_acpi_match'
Message-ID: <202509190259.vGmXHuui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1d593bdfdaff241dea4989a81386a6f45887adf2
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1732/1732] spi: add phytium spi support
config: x86_64-buildonly-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250919/202509190259.vGmXHuui-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190259.vGmXHuui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190259.vGmXHuui-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:192:36: warning: unused variable 'phytium_spi_acpi_match' [-Wunused-const-variable]
     192 | static const struct acpi_device_id phytium_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/phytium_spi_acpi_match +192 drivers/spi/spi-phytium-plat.c

   191	
 > 192	static const struct acpi_device_id phytium_spi_acpi_match[] = {
   193		{"PHYT000E", 0},
   194		{}
   195	};
   196	MODULE_DEVICE_TABLE(acpi, phytium_spi_acpi_match);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
