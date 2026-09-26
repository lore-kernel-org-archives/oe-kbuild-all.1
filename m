Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FC02E762C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 04:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396087; cv=none; b=IX4H8Pu6YhHmh7ZmbQ/aEuhvJtYks9CGkmzX3H9gIlCnl4Fl8KfgF10/QPSrgBowkyDz3ixvXNmQOtch+BNqODRdmxHP2Wa0kXGSZx0rK7HLS7JIngMxLYTblTCodYfUnZ9Q4rm2/PoVr+w/LyjQG/UJWGr6ku6S6Izy1ygbh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396087; c=relaxed/simple;
	bh=ToGbVoKD8URfEZXSRXJtk7NCrPsWuAq3zaKihYWdTFc=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozIcRnwHDuzY/3cXCB6xpE/i98WCieUuiyLNQNUa4leb9L1HMOtK2YOMrx3Q0aF3sOyfZS93HN0NPYG6e8zkV9lNor/JlP+F/QbV8VDLu/fPpfxv8wBRArWESfJ9hjywF18oxVUSDIGBIel4g/6ZjpklIv8frSJaxo0TslfwDkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdWPefRB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdWPefRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790396086; x=1821932086;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=ToGbVoKD8URfEZXSRXJtk7NCrPsWuAq3zaKihYWdTFc=;
  b=TdWPefRBM68JHyEa0p0+Yc8LHVhvZOGYFizQrpHPpqM0UEnPiNq9wWp+
   T0tiemwrsQgXvho88MexoZm4FumxfePD58EoO98E3JkrxGqBv2KfTMiPl
   f9jlSCdYMvWLqnkjpf8ZQtpdl+kfXtrBmWwmbhO63hs7RjSXxTbI/unq+
   ZRAYHhjw4/lZzjwOuMvozCoz8cJV2kpE1gnwLidOnlUq+1s3/c+K4FkeF
   MVr5SvfUpFbfs3KVdigA9YsYt/EDb3a2K/h4hAdVEuYIh9AxT/tOVX122
   gG5nYDzEcqwUJQWM//+C1TPPfqB0WUdVPX2DINwd+7gVrsBoMSD3n3HjW
   g==;
X-CSE-ConnectionGUID: WHEmGzcrQNSczd2MtkpmDg==
X-CSE-MsgGUID: DSAJKHvnTxG+rSpM1uSllg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="112966218"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="112966218"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 21:14:45 -0700
X-CSE-ConnectionGUID: 0jD1gUJKRhu45BJEH6Lj4w==
X-CSE-MsgGUID: 3u5jKDQgS3iTl6JS5MSZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272656214"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2026 21:14:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAJoA-00000000LUz-01S4
	for oe-kbuild-all@lists.linux.dev;
	Sat, 26 Sep 2026 04:14:42 +0000
Date: Sat, 26 Sep 2026 12:14:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609261228.YR1oPNSc-lkp@intel.com>
References: <202609261228.YR1oPNSc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609261228.YR1oPNSc-lkp@intel.com>

Hi Xizhe,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Xizhe-Tang/drm-i915-dp-Only-send-AS-SDP-when-VRR-CMRR-is-enabled-or-PR-async/20260924-035159
base:   
patch link:    https://lore.kernel.org/r/202609261228.YR1oPNSc-lkp%40intel.com
config: x86_64-randconfig-r1308-20260926 (https://download.01.org/0day-ci/archive/20260926/202609261228.YR1oPNSc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261228.YR1oPNSc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261228.YR1oPNSc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_dp.c: In function 'intel_dp_needs_as_sdp':
>> drivers/gpu/drm/i915/display/intel_dp.c:3117:26: error: 'struct intel_crtc_state' has no member named 'cmrr'
    3117 |                crtc_state->cmrr.enable;
         |                          ^~
>> drivers/gpu/drm/i915/display/intel_dp.c:3118:1: warning: control reaches end of non-void function [-Wreturn-type]
    3118 | }
         | ^


vim +3117 drivers/gpu/drm/i915/display/intel_dp.c

  3099	
  3100	static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
  3101					  struct intel_crtc_state *crtc_state)
  3102	{
  3103		if (!intel_dp->as_sdp_v2_supported)
  3104			return false;
  3105	
  3106		/*
  3107		 * #TODO: Add AS SDP v1 support for PCONs (DP branch devices).
  3108		 */
  3109		if (drm_dp_is_branch(intel_dp->dpcd))
  3110			return false;
  3111	
  3112		if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
  3113		    !intel_psr_pr_async_video_timing_supported(intel_dp))
  3114			return true;
  3115	
  3116		return crtc_state->vrr.enable ||
> 3117		       crtc_state->cmrr.enable;
> 3118	}
  3119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
