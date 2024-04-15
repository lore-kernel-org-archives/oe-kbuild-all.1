Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F583BBF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713172976; cv=none; b=JwzeDWFacIw9wdgdRYFgWRsCwYLPR8V8ovri1O1qkngkNrKcqW+3qIXBY4AIRhHC717UcPcCuKk0Z5GZLh0/b1QEwhY7q91jDZLgjkjZoUPg2Z6zCbdpAmnnzfSs4+q1JY6rBSznlPMuWw1ajZ2fOoH2f6ywubkkNIuGnN4QuPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713172976; c=relaxed/simple;
	bh=4QkrXgcwhOPIcawn0BgbAuh08XcHq7yN3P/VokHeuug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V6/g/tL453f4kkvbpKQIcLRqD+bMUbM5z27A4Vngdz6sEgPQLz8yBVPL0E7DVw3bU+dgWRGYs2ufle+F80malFXdhZ+Qe0CRT4Kp8YvrffObuGqaH/yYR4fs6IJenTgJZwwpVUqeBigx4SdHetAjGndu9+HvVmegxQHl+QQDBXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoE75CWr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoE75CWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713172974; x=1744708974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4QkrXgcwhOPIcawn0BgbAuh08XcHq7yN3P/VokHeuug=;
  b=RoE75CWrICQE8e+7jfvMl0farU03gjRIj70XU3wIMnFJsD/m2UNvnbcI
   SSSB9Qq3Off8sh66tapgVlkJcjObR+QY5qf5IGYgEUcCYT7k+NDfZIFfj
   FmdfxggRQuIuawazMT4Ft1cUSa47MSi5lKv6Og19yHdIeSpDroxI6ZR6V
   iPdJ6uumhGRLZkeorhhGIi4fHijW1g3riNoRxf/6gStYPgEVALxAXn6be
   npFC1OPL7p5N2Vsx/WRVc4e6GTVwyPZ13Zby7x/YK0EXZv/SkL1mP+CqR
   3M6LPUK5H5DurZhlGFjcZIR+nPiB33yd1QVc+KaDZPD1x8OXKMe+jLA0g
   g==;
X-CSE-ConnectionGUID: 8+tWrDK3QeKDWANEY2Q/BA==
X-CSE-MsgGUID: UCuF7d39Sw29UNcfvR1bRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8406383"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8406383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 02:22:53 -0700
X-CSE-ConnectionGUID: aDOHXE/ATUOHw59qqUNBQw==
X-CSE-MsgGUID: QuZlDn9dSJW2Y1NxggjO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21773639"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Apr 2024 02:22:52 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwIY5-000460-0N;
	Mon, 15 Apr 2024 09:22:49 +0000
Date: Mon, 15 Apr 2024 17:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 3145/6266] dw_hdmi-rockchip.c:undefined reference
 to `dw_hdmi_resume'
Message-ID: <202404151720.HA4KzY01-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: 0209df3b4731516fe77638bfc52ba2e9629c67cd [3145/6266] drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable
config: loongarch-randconfig-r131-20240415 (https://download.01.org/0day-ci/archive/20240415/202404151720.HA4KzY01-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240415/202404151720.HA4KzY01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151720.HA4KzY01-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `dw_hdmi_rockchip_resume':
>> dw_hdmi-rockchip.c:(.text+0x98): undefined reference to `dw_hdmi_resume'
   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `dw_hdmi_rk3328_setup_hpd':
>> dw_hdmi-rockchip.c:(.text+0x20c): undefined reference to `dw_hdmi_phy_setup_hpd'
   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `dw_hdmi_rk3228_setup_hpd':
   dw_hdmi-rockchip.c:(.text+0x280): undefined reference to `dw_hdmi_phy_setup_hpd'
   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `dw_hdmi_rk3328_read_hpd':
>> dw_hdmi-rockchip.c:(.text+0x2e4): undefined reference to `dw_hdmi_phy_read_hpd'
   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `dw_hdmi_rockchip_unbind':
>> dw_hdmi-rockchip.c:(.text+0x410): undefined reference to `dw_hdmi_unbind'
   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `dw_hdmi_rockchip_bind':
>> dw_hdmi-rockchip.c:(.text+0x8c0): undefined reference to `dw_hdmi_bind'
   loongarch64-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi-rockchip.o: in function `.LANCHOR0':
>> dw_hdmi-rockchip.c:(.rodata+0x8e0): undefined reference to `dw_hdmi_phy_update_hpd'
>> loongarch64-linux-ld: dw_hdmi-rockchip.c:(.rodata+0xa10): undefined reference to `dw_hdmi_phy_read_hpd'
>> loongarch64-linux-ld: dw_hdmi-rockchip.c:(.rodata+0xa18): undefined reference to `dw_hdmi_phy_update_hpd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
