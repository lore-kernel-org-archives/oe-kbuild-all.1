Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4767A49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 03:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695178840; x=1726714840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOIvXQQbVxnyLwcwmNxqAXupHoHGzulbhbnvyaC4f50=;
  b=jghS51j3MSngSnOH0F3RhFwVJ72FKtL6o8sR8ZhKAPLLidxO/h7p+HBu
   yB/MYtb91VK66OohoOSZijDG1M/JSQSejclR6XMIf//CjBgPIW/L+V1j9
   S8WafiHVnO2N6wq5JPT3822AxNZbQeH+GTGtHxhfWMkoSLhYHlesQ9vb3
   5dyXFr95+L+YWkWEjkk2rG132OoHWqTA1xXpY16bJbz6WTUVpkn9xPo5A
   MOp8P4LLmIkJEtM3IImBojWa+hEX0AvI1vF6BSWvKO4sgwJfARTPe/vOc
   HGpHSY+Gp2kVB38JJgdgJcCsFqhMHizFYddSYtkwBSPaZaZp8RSBtQWt8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378999137"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="378999137"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 20:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889737330"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="889737330"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2023 19:59:51 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qinS8-0008Cc-31;
	Wed, 20 Sep 2023 03:00:36 +0000
Date: Wed, 20 Sep 2023 10:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 74/166]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:55:17: warning:
 'apply_128b_132b_stream_overhead' defined but not used
Message-ID: <202309201033.obS01oWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   fd1a1970676435366dd0f58cb455292d92d7ecce
commit: 26681b7d8fc3e5ea6e65a2999e1589f59a2dad1d [74/166] drm/amd/display: Add stream overhead in BW calculations for 128b/132b
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201033.obS01oWG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201033.obS01oWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201033.obS01oWG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c:55:17: warning: 'apply_128b_132b_stream_overhead' defined but not used [-Wunused-function]
      55 | static uint32_t apply_128b_132b_stream_overhead(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/apply_128b_132b_stream_overhead +55 drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dc_dsc.c

    51	
    52	/* Need to account for padding due to pixel-to-symbol packing
    53	 * for uncompressed 128b/132b streams.
    54	 */
  > 55	static uint32_t apply_128b_132b_stream_overhead(
    56		const struct dc_crtc_timing *timing, const uint32_t kbps)
    57	{
    58		uint32_t total_kbps = kbps;
    59	
    60		if (disable_128b_132b_stream_overhead)
    61			return kbps;
    62	
    63		if (!timing->flags.DSC) {
    64			struct fixed31_32 bpp;
    65			struct fixed31_32 overhead_factor;
    66	
    67			bpp = dc_fixpt_from_int(kbps);
    68			bpp = dc_fixpt_div_int(bpp, timing->pix_clk_100hz / 10);
    69	
    70			/* Symbols_per_HActive = HActive * bpp / (4 lanes * 32-bit symbol size)
    71			 * Overhead_factor = ceil(Symbols_per_HActive) / Symbols_per_HActive
    72			 */
    73			overhead_factor = dc_fixpt_from_int(timing->h_addressable);
    74			overhead_factor = dc_fixpt_mul(overhead_factor, bpp);
    75			overhead_factor = dc_fixpt_div_int(overhead_factor, 128);
    76			overhead_factor = dc_fixpt_div(
    77				dc_fixpt_from_int(dc_fixpt_ceil(overhead_factor)),
    78				overhead_factor);
    79	
    80			total_kbps = dc_fixpt_ceil(
    81				dc_fixpt_mul_int(overhead_factor, total_kbps));
    82		}
    83	
    84		return total_kbps;
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
