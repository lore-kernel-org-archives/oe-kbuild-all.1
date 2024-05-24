Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AACE12E1E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716571358; cv=none; b=S7gT2D2ngQy5fxYfMSTfhgdN+lapHYpRR6aJa8CwqWNywkKcmHAaoNVSFouBkx4Y2F0/CuojiXzAOPkyKS6Gg6im5AEykKSvztj3dwYPmxAxjZQFffroJE3vYlowjD3uk5pmVBREqIzwGwrRsVCoXx5LWrJTEg9DD0B2uqJUE9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716571358; c=relaxed/simple;
	bh=Of9RpLOFt2v/pKkMMarvOFwAOhTAVIqFn8N1GoP66zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7OZaSJpE/2TUuAWWL78zH6KUt/ckkuiirOh+BsxpMPXU7+IqdHGZLkF7XQh2otCRQrFHj5yHv8HBR325pr2zaawnIoCLcoOeycM0nZaCU2+620Vsyz7tKB1DgW3Q3WuLlTB5/nvWrdxpRt1OAVhBxcRAGl6Hn4lmF05WOxXGvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRQFfHug; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRQFfHug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716571355; x=1748107355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Of9RpLOFt2v/pKkMMarvOFwAOhTAVIqFn8N1GoP66zA=;
  b=dRQFfHugCssPlBNkDy78gsfoC/3g7zgHlS0s5ENom6RVzAq1zBcsr11T
   sHI8YggprlQ28EyHvzPjhqKXmqC6tiof37Zr4GtCLzozCMKknb2BolyUM
   51JqvLEckJyWmEhgR+9ELOrk5RQobt+HsBVlo5Gqg8eE9CFOJB46ZJmiH
   RM872SXDsKniJVWU3NGJMfcJEPofCjOvigWa6ZIMGTGkk3R2+5uRKWra6
   hKPo/ciIZouPU86iW5wyCAmpw+rgnXlFpFtcMLeqKSs+0eMLuR4Cif+1l
   LDvvA3Fz3dxO+0lobwcuoaJ1cwuJVA86GdpY3H4TekIA6a8NmSA6J3Vvr
   w==;
X-CSE-ConnectionGUID: JH7rCekcRCi/YkOVPEdfBg==
X-CSE-MsgGUID: kBTR8OfGS9KdU0LPxItygw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30495169"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="30495169"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 10:22:33 -0700
X-CSE-ConnectionGUID: c7qeuOAAS66oxD+1pH1rMg==
X-CSE-MsgGUID: STuLdXcjRoGWO8fFj0au0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34182342"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2024 10:22:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAYcd-0005jD-31;
	Fri, 24 May 2024 17:22:28 +0000
Date: Sat, 25 May 2024 01:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 3/8] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202405250142.FLXe7CwI-lkp@intel.com>
References: <20240524102432.2499104-4-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524102432.2499104-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240523]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Define-and-compute-Transcoder-CMRR-registers/20240524-183131
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240524102432.2499104-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v9 3/8] drm/i915: Compute CMRR and calculate vtotal
config: i386-randconfig-012-20240524 (https://download.01.org/0day-ci/archive/20240525/202405250142.FLXe7CwI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250142.FLXe7CwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250142.FLXe7CwI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `cmrr_get_vtotal':
>> drivers/gpu/drm/i915/display/intel_vrr.c:147:(.text+0x446): undefined reference to `__divdi3'
>> ld: drivers/gpu/drm/i915/display/intel_vrr.c:159:(.text+0x564): undefined reference to `__udivdi3'


vim +147 drivers/gpu/drm/i915/display/intel_vrr.c

   135	
   136	static unsigned int
   137	cmrr_get_vtotal(struct intel_crtc_state *crtc_state)
   138	{
   139		int multiplier_m = 1, multiplier_n = 1, vtotal;
   140		int actual_refresh_rate, desired_refresh_rate;
   141		long long actual_pixel_rate, adjusted_pixel_rate, pixel_clock_per_line;
   142		struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
   143	
   144		pixel_clock_per_line =
   145			adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
   146		actual_refresh_rate =
 > 147			pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
   148		desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
   149		actual_pixel_rate = actual_refresh_rate * adjusted_mode->crtc_vtotal;
   150		actual_pixel_rate =
   151			(actual_pixel_rate * adjusted_mode->crtc_htotal) / FIXED_POINT_PRECISION;
   152	
   153		multiplier_m = 1001;
   154		multiplier_n = 1000;
   155	
   156		crtc_state->cmrr.cmrr_n =
   157			((desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n) / multiplier_m);
   158		crtc_state->cmrr.cmrr_n *= multiplier_n;
 > 159		vtotal = (actual_pixel_rate * multiplier_n) / crtc_state->cmrr.cmrr_n;
   160		adjusted_pixel_rate = actual_pixel_rate * multiplier_m;
   161		crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
   162	
   163		return vtotal;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
