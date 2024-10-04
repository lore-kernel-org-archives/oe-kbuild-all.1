Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0035E21B428
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051146; cv=none; b=ul28dIKBlAN6G1DWLQTX5lcAl6agjwSF/1YdoKw5zMqoOvYr7tM2xj8z3A1y2QkG2a1kvwSePqT0P64k4t8X+J6wei4GbAY/xwkDZU90v25uwoUTa6eOOKeQZrzc49AsUBPiSGcCTS9m0w91e9oI8gYbXLgTe0zzf4QHIpiLYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051146; c=relaxed/simple;
	bh=LYmqQ0b6iAk4MofLjvfm5gwUa341dIGkcykOTuQ+XFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rEb+29x1C9+d+ivr3ZL2oFkEFvbx1ZhZAaeowSEPUIB3Xegv0tKg3wW5sYloyDl+KgPjWKDWt7r44kBZ5V5tdXtbiwyTuKm091OQ+1d20aHaT26wr9nq7N/0Wvp/TMFu8zqzm3HPjo3Vowz+EBKMzRZ+1enEWpa1Hzsp0wwF+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkJPQw3s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkJPQw3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728051145; x=1759587145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LYmqQ0b6iAk4MofLjvfm5gwUa341dIGkcykOTuQ+XFQ=;
  b=BkJPQw3sQDnj3PRjqMMsR/ufgNVTyo0eFtPjY53c3cgaVLo5F6ht791G
   IrIu9ylcQlXkhw3m2jHeBPRph2k9iGkhSgxxVT+Ai+v9iL/LO26ThG58Q
   YWMTn5Rvya92ScOWFcIZG3kehwRjZkIqL1H6ZRaWEHB3RaeyrIwVsO7pT
   Ctu1jEglI/RlWFxNh7f7/cLuRN9O5ULrzV1rMHcJ9bPauEC7d+mrQCg8f
   cfznId+6IEPvVis0E8ojHmMKZXwh/linqiSaQI2mYSFq94KBstongwpYj
   G8viEOGNlbuLPogSp+ubNjWc3HfdZlqUEMsUMG64eHlFVefd3n6ELT4u7
   A==;
X-CSE-ConnectionGUID: DJsJV1FjQIisppbTspa/Pw==
X-CSE-MsgGUID: 6+n4nX2lQLqMQ2opdxOkWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44741456"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="44741456"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:12:22 -0700
X-CSE-ConnectionGUID: ABHmk9bISRKUxgBiuL5uYg==
X-CSE-MsgGUID: JMupn83yRrKHHf3V5CbMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79686352"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 07:12:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swj2Z-0001kE-1D;
	Fri, 04 Oct 2024 14:12:19 +0000
Date: Fri, 4 Oct 2024 22:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3516/16788]
 include/linux/irqchip/arm-gic-v3.h:604:10: fatal error: asm/arch_gicv3.h: No
 such file or directory
Message-ID: <202410042239.UuVkY9Qp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 9c44551f16501cd6708b9bba2aed2afbbfb59049 [3516/16788] firmware: imx: scu-pd: Add IRQSTEER wakeup support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410042239.UuVkY9Qp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042239.UuVkY9Qp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042239.UuVkY9Qp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pmdomain/imx/scu-pd.c:60:
>> include/linux/irqchip/arm-gic-v3.h:604:10: fatal error: asm/arch_gicv3.h: No such file or directory
     604 | #include <asm/arch_gicv3.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +604 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e10 Andre Przywara        2014-11-12  603  
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @604  #include <asm/arch_gicv3.h>
021f653791ad17 Marc Zyngier          2014-06-30  605  

:::::: The code at line 604 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor the arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
