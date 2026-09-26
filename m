Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE317BED0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444913; cv=none; b=WjWYafyiJn/HXRXvesk0UPGgRVH4tY2UBUZg3B6kK9HjfFRZZ4nz6bAPgCiDrUSenInnFTA+8DOFNSH9zkwQmqYOev6LuUN+N6B1b4dT8yDXKJkC/DYECmGuK9qzlQdG5SrkELLntAFtk1an46oR/PaLNWUfkrhEgRkKVe0Q6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444913; c=relaxed/simple;
	bh=m9rcUbmznByf8GDhuCsNg7+iMckZPDk/baBhodK8tMU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ta4gt0IKHIo5qlViucvl+XKRm1y/BDa6I7RA8PJ4M8B/9HE2SMQapObYDt0M1Q5/XwqGSKQrCHoTKQ6i97Fw7zCPNKGdgYBSlOs3383lk5yLmToCYvBaA09k3/+uz8oO+2iFQ05aQAyZecWdUyMKyKeWQzuA3DskLUSCXAkmMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mF5Q4HYP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF5Q4HYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790444911; x=1821980911;
  h=date:from:to:cc:subject:message-id;
  bh=m9rcUbmznByf8GDhuCsNg7+iMckZPDk/baBhodK8tMU=;
  b=mF5Q4HYPo3eNigQH7GCoBTSVmFuXqMA1kNyTiN+wyErJ/vGg3mLsXVDJ
   R/s/wMy4lu8udLsZF0ENUBtiJh3mPS/q2zY5FlJC5S6+9vGcHzYczqFs1
   rIa1iACfF6rXJysbp1fSsPuN6LJkFx/hWJTncfU174LKWWWhVde2avxZo
   JPcg0hHArglHWBnzTd6hG1mB3fQ9HliG543S03/OUkf8tt+W+O6ki70uZ
   RVY8GQo6V3dyZWXLsrVGSpP8u52pmOQ/NAFUuypfI++fIVqP4SzlWH8WJ
   +0y0k6ljnx7ck7Hgt5Zz5Mji26K4fXK++2d2oyAa+/trKNA7UqZZMxT4n
   Q==;
X-CSE-ConnectionGUID: gJJXep8jSbG9drW1wiGV9w==
X-CSE-MsgGUID: 7Ljy3eSdSq6Hwlgtd5PJLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101727921"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="101727921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 10:48:31 -0700
X-CSE-ConnectionGUID: J1ru9+e5RZSL58WIeR1J2w==
X-CSE-MsgGUID: XEWmn/PlRaab3QKngTMiuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="273244918"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2026 10:48:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAWVe-00000000M4D-1sfV;
	Sat, 26 Sep 2026 17:48:26 +0000
Date: Sun, 27 Sep 2026 01:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 8/22] drivers/gpu/drm/tegra/hdmi.h:122:9:
 warning: "ACR_ENABLE" redefined
Message-ID: <202609270155.T6UyiOkH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   eafb2e6e489faacf921ddea1e9232e555f7abca6
commit: 577d5b84921290953e5b4b19198eedea1fa2fcec [8/22] m68k: coldfire: enable common clock framework
config: m68k-randconfig-r1305-20260926 (https://download.01.org/0day-ci/archive/20260927/202609270155.T6UyiOkH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609270155.T6UyiOkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270155.T6UyiOkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tegra/hdmi.c:36:
>> drivers/gpu/drm/tegra/hdmi.h:122:9: warning: "ACR_ENABLE" redefined
     122 | #define ACR_ENABLE         (1 << 31)
         |         ^~~~~~~~~~
   In file included from arch/m68k/include/asm/m54xxsim.h:17,
                    from arch/m68k/include/asm/mcfsim.h:46,
                    from arch/m68k/include/asm/io_no.h:35,
                    from arch/m68k/include/asm/io.h:6,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:27,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from drivers/gpu/drm/tegra/hdmi.c:17:
   arch/m68k/include/asm/m54xxacr.h:34:9: note: this is the location of the previous definition
      34 | #define ACR_ENABLE      0x00008000      /* Enable address */
         |         ^~~~~~~~~~


vim +/ACR_ENABLE +122 drivers/gpu/drm/tegra/hdmi.h

edec4af4c3d6d2 Thierry Reding 2012-11-15  119  
edec4af4c3d6d2 Thierry Reding 2012-11-15  120  #define ACR_SUBPACK_CTS(x) (((x) & 0xffffff) << 8)
edec4af4c3d6d2 Thierry Reding 2012-11-15  121  #define ACR_SUBPACK_N(x)   (((x) & 0xffffff) << 0)
edec4af4c3d6d2 Thierry Reding 2012-11-15 @122  #define ACR_ENABLE         (1 << 31)
edec4af4c3d6d2 Thierry Reding 2012-11-15  123  

:::::: The code at line 122 was first introduced by commit
:::::: edec4af4c3d6d225578290a9acc38c78147df55b drm: tegra: Add HDMI support

:::::: TO: Thierry Reding <thierry.reding@avionic-design.de>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
