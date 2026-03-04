Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F030CDAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772648620; cv=none; b=IUCC4p10Lx9d+mr6elU+QSe1ZzrwTppVvgOICBWn59PiofOjoxHpW33ts997O4UalMmNE4JyYaoZxUoAm9nVfYQ0eZJIuL//VuEz6DNsHta1somOuNVp8/7CSUguvavdlAFoQfO8wRHJzaBb/ij3aW7QBkfYpeE40isab6/dfAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772648620; c=relaxed/simple;
	bh=Dak7RTCOwsd5/wPcTlr2v+M04rd+U7KhAiXPLDBZZwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hzQJH4PWWCC3xB6YebI+pe+iTLoJMYoJDdCPjUVIf03LJf5yg4hWGg5ONE9Y6gFMxgdncsdhvWznRT5VmsTAiBPD5vrKAlMX9kXNoH3+u4QVxauqLQI4IJul+l4/tLuSxB934LT2vQofrH9o1w46IHxVn1YE4rXifIp1ps8iwJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btNYFOBW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btNYFOBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772648618; x=1804184618;
  h=date:from:to:cc:subject:message-id;
  bh=Dak7RTCOwsd5/wPcTlr2v+M04rd+U7KhAiXPLDBZZwQ=;
  b=btNYFOBWl1u1enfEgG9LCyyNBUGeAYuFQXKSa6X2anJ8EeWxKzJ35Rg7
   wvHks6nYWTIE6r6AapweZ7pJkR924GoHuDlPK8PEYpDtaH+l/2loL9O/4
   PstJquFWugNwOVyypUWi0u0ouqF3j8SCU3UmmYKo3UtH7D8IyQ/AhTArW
   Sa8TsoBX8cxxWkWu973cKHa02r9q49LJ47BRO3bcDhIbvdONU6CvO9cC6
   ydvI6qKkNDBApBYFMGZXiHPpl2VLUbLnNf7IDZDJ7YwfqSvWSqwi+0tz5
   TLgpplJRuwtHMDj4+IOORaboPbUzp3S5PsJuUj2hVVxNngO+sGId4pAfg
   A==;
X-CSE-ConnectionGUID: 3VHWyJcJTh2W+ldApIZ9ZQ==
X-CSE-MsgGUID: xrYV/1o/QD+iXv6E/JflkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72919154"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72919154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 10:23:21 -0800
X-CSE-ConnectionGUID: 95tWHhanSz2yU5zidUe0Fg==
X-CSE-MsgGUID: TVyBRIMbQqWGkKbE6+N9aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="248898465"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 10:23:19 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxqsN-000000004Ht-3My0;
	Wed, 04 Mar 2026 18:23:15 +0000
Date: Thu, 05 Mar 2026 02:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: 
 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23:
 sparse: sparse: cast to restricted __be32
Message-ID: <202603050230.ONrYuERr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecc64d2dc9ff9738d2a896beb68e02c2feaf9a02
commit: bf9ec461a7d1b82bbc3fe110fba9e9533879849d fbdev: omapfb: Make FB_DEVICE dependency optional
date:   3 weeks ago
config: nios2-randconfig-r112-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050230.ONrYuERr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050230.ONrYuERr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050230.ONrYuERr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:218:23: sparse: sparse: cast to restricted __be32

vim +218 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c

f76ee892a99e68 Tomi Valkeinen 2015-12-09  210  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  211  static int panel_enabled(struct panel_drv_data *ddata)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  212  {
f76ee892a99e68 Tomi Valkeinen 2015-12-09  213  	u32 disp_status;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  214  	int enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  215  
f76ee892a99e68 Tomi Valkeinen 2015-12-09  216  	acx565akm_read(ddata, MIPID_CMD_READ_DISP_STATUS,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  217  			(u8 *)&disp_status, 4);
f76ee892a99e68 Tomi Valkeinen 2015-12-09 @218  	disp_status = __be32_to_cpu(disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  219  	enabled = (disp_status & (1 << 17)) && (disp_status & (1 << 10));
f76ee892a99e68 Tomi Valkeinen 2015-12-09  220  	dev_dbg(&ddata->spi->dev,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  221  		"LCD panel %senabled by bootloader (status 0x%04x)\n",
f76ee892a99e68 Tomi Valkeinen 2015-12-09  222  		enabled ? "" : "not ", disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  223  	return enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  224  }
f76ee892a99e68 Tomi Valkeinen 2015-12-09  225  

:::::: The code at line 218 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & displays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
