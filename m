Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64229CFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLGn0ddg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699916083; x=1731452083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nM8oXg6NlWdaZi1x+Pshqgt0LOd5wq3aRv+YRElrtaY=;
  b=TLGn0ddgcduXv7H1cM0n75XXpPj0/FvhonSa9ikCS7pQHrsbPEjFFRje
   wFbPWuNbQTVHl3wtu4MDd/B89iR5RFssdYWijr2NzBB09IOpgxSc3Ns23
   VYMTLSebarR8XsPEMtZ7n4e9L2pBqc96Dmz61Q14F99i+KMI944b3HDTN
   plwxT2k0Ho2iyn/FqspklJIQEeX8q+FBAXsmryn6zNgGPnvMcDw8DUcHU
   Nv+79BanUmyBG2Ord5rVOx01FZBXjIX01mTTWNuM6AO9wChYcTWt0L4+8
   UA7qLRVrsJBwI1Rc9bxXwEM9jxH0s3TvrM2dM8EglNNFpL/25PE4s/TLT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3611226"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3611226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 14:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12223544"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2023 14:54:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2fpH-000CaU-09;
	Mon, 13 Nov 2023 22:54:39 +0000
Date: Tue, 14 Nov 2023 06:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/dp_mst: Fix PBN divider calculation for UHBR
 rates
Message-ID: <202311140620.1gHQRb4g-lkp@intel.com>
References: <20231113201110.510724-4-imre.deak@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113201110.510724-4-imre.deak@intel.com>

Hi Imre,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-i915-dp-Fix-UHBR-link-M-N-values/20231114-043135
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231113201110.510724-4-imre.deak%40intel.com
patch subject: [PATCH 4/4] drm/dp_mst: Fix PBN divider calculation for UHBR rates
config: i386-buildonly-randconfig-002-20231114 (https://download.01.org/0day-ci/archive/20231114/202311140620.1gHQRb4g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140620.1gHQRb4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311140620.1gHQRb4g-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `drm_dp_get_vc_payload_bw':
>> drm_dp_mst_topology.c:(.text+0x931): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
