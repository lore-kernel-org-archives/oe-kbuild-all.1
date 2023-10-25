Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0712C848
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkOQY/0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698248835; x=1729784835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OwnmmK9lGWcUyo1ABI7AcEqEXUZI5NNj8MDhXPWHTaw=;
  b=BkOQY/0rsI/fwv9tMHlZdPRpoV99FsdUMRp1QwHPecAtdfseg6d7v7uD
   6uFmHMRBG5UNpj0bOaolvwa3cMW58K4sNgCycvf1sFTqOdpnEcTPo/jyn
   aLwmJ44OijcbFMN/Jw+PZjBd/ksal0WW4E9GF4D3tXgn+FPpf7HheLJiE
   o5eFo+rrvAvZeNfZrzmtnE7ymrDkA+NRCKgaN2lBLkDQ5SKGwnSoMSPBQ
   FvOYTgqdE0BAYPqG+C3qDl9qE5UdTJXushAUm9Jd/nOLso9kaAD+BYD+s
   lTQACUID9/uccM0W5IznNmvAPr0p6pqr/QBA0lKIlZRx0cWByy8LTYLXF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="114937"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="114937"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 08:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849572104"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849572104"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2023 08:47:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvg6A-0008yN-2Q;
	Wed, 25 Oct 2023 15:47:10 +0000
Date: Wed, 25 Oct 2023 23:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 08/29] drm/dp: Add helpers to calculate the
 link BW overhead
Message-ID: <202310252345.i0qKzGuh-lkp@intel.com>
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
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20231025/202310252345.i0qKzGuh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252345.i0qKzGuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252345.i0qKzGuh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function `drm_dp_calc_pbn_mode':
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:4745:(.text+0x12b0): undefined reference to `drm_dp_bw_overhead'


vim +4745 drivers/gpu/drm/display/drm_dp_mst_topology.c

  4718	
  4719	/**
  4720	 * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
  4721	 * @clock: dot clock
  4722	 * @bpp: bpp as .4 binary fixed point
  4723	 *
  4724	 * This uses the formula in the spec to calculate the PBN value for a mode.
  4725	 */
  4726	int drm_dp_calc_pbn_mode(int clock, int bpp)
  4727	{
  4728		/*
  4729		 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
  4730		 * common multiplier to render an integer PBN for all link rate/lane
  4731		 * counts combinations
  4732		 * calculate
  4733		 * peak_kbps = clock * bpp / 16
  4734		 * peak_kbps *= SSC overhead / 1000000
  4735		 * peak_kbps /= 8    convert to Kbytes
  4736		 * peak_kBps *= (64/54) / 1000    convert to PBN
  4737		 */
  4738		/*
  4739		 * TODO: Use the actual link and mode parameters to calculate
  4740		 * the overhead. For now it's assumed that these are
  4741		 * 4 link lanes, 4096 hactive pixels, which don't add any
  4742		 * significant data padding overhead and that there is no DSC
  4743		 * or FEC overhead.
  4744		 */
> 4745		int overhead = drm_dp_bw_overhead(4, 4096, 0, bpp,
  4746						  DRM_DP_BW_OVERHEAD_MST |
  4747						  DRM_DP_BW_OVERHEAD_SSC);
  4748	
  4749		return DIV64_U64_ROUND_UP(mul_u32_u32(clock * bpp, 64 * overhead >> 4),
  4750					  1000000ULL * 8 * 54 * 1000);
  4751	}
  4752	EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
  4753	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
