Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5542113C3D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092336; cv=none; b=SouNb6ogQtppOvdQD6Y3dyjxQBe0ouGAaZPDQVgjdZWVOv2aDzFwkDpRBaC92ctq/YJ04gypLzpHKQuP3tLnkMPbaYLe2Sydkml+yE1YlKiaDWPa41sSAn5sWdISyAlDQCeWiGKiEZ0cbRztvK/ZIWlaTtrlsAHUOYCdlLYkS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092336; c=relaxed/simple;
	bh=npobd54TNh7s8xPDmegUER6qbR94JOCTdgYkJQKkgzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ah3igaxjXVJadbaRZTShY3gGfRkdV1kn4GcsAyCQ/HVEi+k3D7gALQXfJ6j2t8OI56u185/7EKKgbg9pXvURtjYgaEv5vph2z919KI4LBtCmRo3x3PIPqyddExjZIBnIqgldzPSkHJkp9ySoxOscgkFKt+tuZNcknlN8kOmAUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBs5/XO+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBs5/XO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725092335; x=1756628335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npobd54TNh7s8xPDmegUER6qbR94JOCTdgYkJQKkgzI=;
  b=cBs5/XO+IBg+Vf26kC+CE9l8dezDRty9+4a5/F/Wov8hjsWvBdJ2hV+q
   x1nwWearbZK0JNJcTE0FsDfo9BCsobXLjdx0McnT5eCrXISIc/OkFqOHr
   Slb7se/nqqMkNME5TqbBmNK+mNuM3T06oVhr37KokOUoETVTZM1zDWYQ1
   QIrIs5CwTwrlLz4fQJMOFr0spEx6TeLGdbtAht41AZwlDuiHsyS67qDpi
   jgMYw/jiNncKcEIsLdVZ+LLw1Yqu26j2qQnC1sAeA0kJImEc9YF52iLt6
   DMQhOstK6TGQE3IGlfylS/a4rlhAWNLrYD0e1V1rrqiD8VYnvUA7KdwS+
   A==;
X-CSE-ConnectionGUID: W1EaR2wBSCCa7jaashDbPw==
X-CSE-MsgGUID: Vpo3/UMKSeColvHJWreQ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34899128"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="34899128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:18:55 -0700
X-CSE-ConnectionGUID: Mlbj9nIKSxWJ3+kSWBhW8w==
X-CSE-MsgGUID: H4JuTJDIRJWpolmtC0T6xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="87356865"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2024 01:18:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJJp-0002S4-0N;
	Sat, 31 Aug 2024 08:18:49 +0000
Date: Sat, 31 Aug 2024 16:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, manikandan.m@microchip.com,
	dharma.b@microchip.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, hari.prasathge@microchip.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev
Subject: Re: [PATCH 2/3] drm/bridge: microchip-lvds: Drop unused headers
Message-ID: <202408311600.HvIve8JU-lkp@intel.com>
References: <20240827161223.4152195-3-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827161223.4152195-3-claudiu.beznea@tuxon.dev>

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu-Beznea/drm-bridge-microchip-lvds-Revert-clk_prepare_enable-in-case-of-failure/20240828-001456
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240827161223.4152195-3-claudiu.beznea%40tuxon.dev
patch subject: [PATCH 2/3] drm/bridge: microchip-lvds: Drop unused headers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408311600.HvIve8JU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311600.HvIve8JU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311600.HvIve8JU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/microchip-lvds.c: In function 'lvds_readl':
>> drivers/gpu/drm/bridge/microchip-lvds.c:62:16: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
      62 |         return readl_relaxed(lvds->regs + offset);
         |                ^~~~~~~~~~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c: In function 'lvds_writel':
>> drivers/gpu/drm/bridge/microchip-lvds.c:67:9: error: implicit declaration of function 'writel_relaxed' [-Werror=implicit-function-declaration]
      67 |         writel_relaxed(val, lvds->regs + offset);
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/readl_relaxed +62 drivers/gpu/drm/bridge/microchip-lvds.c

179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  59  
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  60  static inline u32 lvds_readl(struct mchp_lvds *lvds, u32 offset)
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  61  {
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21 @62  	return readl_relaxed(lvds->regs + offset);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  63  }
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  64  
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  65  static inline void lvds_writel(struct mchp_lvds *lvds, u32 offset, u32 val)
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  66  {
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21 @67  	writel_relaxed(val, lvds->regs + offset);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  68  }
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
