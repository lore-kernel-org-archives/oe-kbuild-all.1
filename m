Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54718B477
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722356091; cv=none; b=UuEmx8TtBDf7jjtx16t5uTWu68yN3SZYjVhtEWQyLIk22oQD8OmLVjufumYmjVH929r4DCUGlpvKwKc0tJ1K71yrSaasaQQfanl/Q7zlUkcLE6AneKCvsSB7gMVY5inOJbcARTZCU+NF3yrc7qW30iQ7mVni8xBpotBLBMqgycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722356091; c=relaxed/simple;
	bh=9AzmfeT/IHJcvj0VsVYKaPFLD75+dlobrPHXiRRp8cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPPcTE80Nk1f5INXdM7choRQ+7lSxIE/DnHwoJnBXA4FDj1fRhAEUpXDMymnXkTPIWSwsOQGE48q/T+ZBOnw20IDU1pdPxQxoI9T/cYZxXsivw3Ozo/0PwoxE95yFRPcKeIG1vKqRShVLJD6YrtAuRx23TKKbx5Nw425QrCwcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP3K+iMo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP3K+iMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722356090; x=1753892090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AzmfeT/IHJcvj0VsVYKaPFLD75+dlobrPHXiRRp8cY=;
  b=DP3K+iMoN00FHr03Xp/Wya7gfn2OYLvQSsHwhEa+q4ZWm/DvHBncRVnP
   +blwHaJVPg4UalZWdljhJUdWapgDtKPqrDay+26p5T76UycN4ADl1cLPm
   wL7S15mm+VqDvCTTai59uRFAlygL7lwQ6Fub2nl5QwMPJT059BhuNEf/0
   zpadLuUi8vapSVU2xJP3n6iy/Wes+RQ45wmEVXfa6QHgLaP8jY8KDCCBE
   PN2IIzCqUcAGR6jmgnn9/MwK6ld1E8/xAFRz/EaMwbVQoRJRPLTPPh3gR
   saJRR+OffA5uKIJyFCuS371p9yrDhUE7SvE82Fj3DFvtSMXigGudHGXR9
   g==;
X-CSE-ConnectionGUID: 7jIG0NAKQ0WLg7hhwtUQ9Q==
X-CSE-MsgGUID: jTHtVKW6RRG1WgFo2jkoww==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19992109"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19992109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 09:14:49 -0700
X-CSE-ConnectionGUID: 1CQcQhkUTaefJp2f52DSfA==
X-CSE-MsgGUID: YXDN7RZqQM2oVzReXgrl9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54369803"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2024 09:14:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYpUr-000t5Y-1P;
	Tue, 30 Jul 2024 16:14:45 +0000
Date: Wed, 31 Jul 2024 00:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v7_611_rc1_full 40/40]
 drivers/tty/serial/8250/8250_platform.c:271:36: warning:
 'acpi_platform_serial_table' defined but not used
Message-ID: <202407310047.PIoWlrZZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v7_611_rc1_full
head:   4423be73ba644a89e48da1cebbdf901f04b801f3
commit: 4423be73ba644a89e48da1cebbdf901f04b801f3 [40/40] serial: 8250_platform: Enable generic 16550A platform devices
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240731/202407310047.PIoWlrZZ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310047.PIoWlrZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310047.PIoWlrZZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_platform.c:271:36: warning: 'acpi_platform_serial_table' defined but not used [-Wunused-const-variable=]
     271 | static const struct acpi_device_id acpi_platform_serial_table[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/acpi_platform_serial_table +271 drivers/tty/serial/8250/8250_platform.c

   270	
 > 271	static const struct acpi_device_id acpi_platform_serial_table[] = {
   272		{ "RSCV0003", 0 }, // RISC-V Generic 16550A UART
   273		{ },
   274	};
   275	MODULE_DEVICE_TABLE(acpi, acpi_platform_serial_table);
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
