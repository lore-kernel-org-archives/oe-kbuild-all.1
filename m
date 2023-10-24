Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F7273D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 12:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLRI2rOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698150899; x=1729686899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YXEgxfClpxoOTrTLJ2mMCyIwfrxA1zy8MWow44XXHBs=;
  b=NLRI2rOJFace9Ak0gX9u7cYWEzdplvpB+4vI3sv3IA7neMFGUDqrcidq
   WypSOmXN7S+QOKZbT8XHliLe+BMfDNec6yCRS9RlxQ438a8GtUhi95vPW
   ItlBJLIhF2K5ad6n7D3vVgDd8Ovk/g1tCRekcCxqhT9aZvuTOGQa0pCqD
   sTypqEBgf1uS2uG/f1LaAe3lVlIIhhoYufANVF5cfj8aNRKV5k/0LK1aB
   cFuvsxFg8kXHs9/rRNy86XReoXMR/H5ecf3x2XoVQLAenVs1SLNWje0v1
   adD+YEF3TEPwY3utXOz0/Gp5UiNVUaZhSchEUDrGAKfKpkqC0WQKYLK0r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="389893310"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="389893310"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 05:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762085738"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="762085738"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2023 05:34:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvGca-0007rl-0W;
	Tue, 24 Oct 2023 12:34:56 +0000
Date: Tue, 24 Oct 2023 20:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 08/29] drm/dp: Add helpers to calculate the
 link BW overhead
Message-ID: <202310242019.Hp2KseM1-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-dp_mst-Fix-fractional-DSC-bpp-handling/20231024-091920
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231024010925.3949910-9-imre.deak%40intel.com
patch subject: [Intel-gfx] [PATCH 08/29] drm/dp: Add helpers to calculate the link BW overhead
config: x86_64-buildonly-randconfig-003-20231024 (https://download.01.org/0day-ci/archive/20231024/202310242019.Hp2KseM1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310242019.Hp2KseM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310242019.Hp2KseM1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `drm_dp_calc_pbn_mode':
>> drm_dp_mst_topology.c:(.text+0x1403): undefined reference to `drm_dp_bw_overhead'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
