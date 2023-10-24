Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A001396
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 02:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMtaY/0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698115658; x=1729651658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HepMk2tBid574IdLLcJW1wWwmcdzgcidw8Vg9OpntTE=;
  b=JMtaY/0duITT0WUz6s6FjnWmgFR+yP3XtK0UDXj/MOy/yVw64NWibyNO
   A3ij94nh0HmE/S2b/7jFdgXMdau1VuaBUeUBnJMWBCsiVixGV75yw9ZyS
   Y0Hkc9q7DzxEYUKlTiNq1N8WksPwkTTqOO2ftdkeU8ql5S9zvvQZeU3Db
   1OwY5g5PD/T+FkmuY7gSJP2F8fhp3KDR1HVYsU3jlYZCGqQACfPmuG5Rm
   FMR0xWa5HRHjves9Nu6vBdssy9YQZiUwv4YUhAAegLlIuVbGqxi45M1u4
   g6mXWJpKQE53pOLWC75vlpcB3Hh3l/KYiJPr2y9QzPUHTJI8TuwsfCWti
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385869606"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385869606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 19:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="758330680"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="758330680"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Oct 2023 19:47:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv7SA-0007Ur-0N;
	Tue, 24 Oct 2023 02:47:34 +0000
Date: Tue, 24 Oct 2023 10:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 08/29] drm/dp: Add helpers to calculate the
 link BW overhead
Message-ID: <202310241055.Pz9vy06V-lkp@intel.com>
References: <20231024010925.3949910-9-imre.deak@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024010925.3949910-9-imre.deak@intel.com>

Hi Imre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-dp_mst-Fix-fractional-DSC-bpp-handling/20231024-091920
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231024010925.3949910-9-imre.deak%40intel.com
patch subject: [Intel-gfx] [PATCH 08/29] drm/dp: Add helpers to calculate the link BW overhead
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241055.Pz9vy06V-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241055.Pz9vy06V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241055.Pz9vy06V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_helper.c:4002: warning: Function parameter or member 'is_uhbr' not described in 'drm_dp_bw_channel_coding_efficiency'
>> drivers/gpu/drm/display/drm_dp_helper.c:4002: warning: expecting prototype for Returns the efficiency in the 100%/coding(). Prototype was for drm_dp_bw_channel_coding_efficiency() instead


vim +4002 drivers/gpu/drm/display/drm_dp_helper.c

  3996	
  3997	/**
  3998	 * Returns the efficiency in the 100%/coding-overhead% ratio in
  3999	 * 1ppm units.
  4000	 */
  4001	int drm_dp_bw_channel_coding_efficiency(bool is_uhbr)
> 4002	{
  4003		if (is_uhbr)
  4004			return 967100;
  4005		else
  4006			/*
  4007			 * Note that on 8b/10b MST the efficiency is only
  4008			 * 78.75% due to the 1 out of 64 MTPH packet overhead,
  4009			 * not accounted for here.
  4010			 */
  4011			return 800000;
  4012	}
  4013	EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
  4014	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
