Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC2127E24
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717416638; cv=none; b=GFA+zaISaKAOFB42if3ryLTuMJHiGTqTH6SrBNcNPeIkJlHXJENMGF7P59NxotA3+JWuuoN3jFYL6/nLDYlnQtC+09YQcC1loUQrleecga7DVeCglPS3u227M+to4S+7oJGXoPOCEhAEGc9h7w3YscdhZSKmz6Df1bmzN76RL5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717416638; c=relaxed/simple;
	bh=niRV/ZM7RAvBZdZEFODY/drKXOLrgSmIBAYuPVbhK54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9hxfXxU4n1yKh4D4n+cmcdk2JPNYq2uL7XocHOnjEMpLGlhQK12p9lpQQd0QZdAoCVBAd4FHOP+Nw6IudHXHdW5/RA/FrCp2T50BvtoRAKfHCsB1qtvtrqHDsEi+7Mud220sqy47EKCDsGDEtGbeNan13gptLMNNHWy5uQiXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ni1rJKHE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ni1rJKHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717416637; x=1748952637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=niRV/ZM7RAvBZdZEFODY/drKXOLrgSmIBAYuPVbhK54=;
  b=ni1rJKHEYLkV4RucF3g0t8oXwIPYOkhiTlsp8ThGcA9oDjIHIcFE6MKz
   Er4V6qFqjpUC94EjWSP+q6gOK2Coz4xgLTSbrk3ruFaVQavQk1Kdw7L27
   /2Bc60eKr77FKhMa4jDM4Kve6lRUBxMNJJPphmBf3ZhJBNaw/cvWPPufd
   A0TysizO2ZEfaxB2jruBtUWuwis6rnMVvzFhAzjwgPccVnJCn1jBQF7DN
   msMUlCdbWu6x0B+N7S0eEZNJKQ1QjdNs34RgrYbAcKaolUv0l7KBuMqo6
   /W1EZ+f2jE6QFutLlExlE0cZgNEUvZ6U3AV9hFVjJMeuJy1UD8kaUFy2i
   g==;
X-CSE-ConnectionGUID: JQVQ606wTIWpEyHuG+HbEA==
X-CSE-MsgGUID: g5Xspi3bQnmbtfqeGnfWbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14064719"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14064719"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 05:10:36 -0700
X-CSE-ConnectionGUID: /Lgx3jKaQhCjkPiEb3KB7A==
X-CSE-MsgGUID: eeWj0gZiRhmKz27JwxVFEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36970388"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2024 05:10:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE6WF-000LXL-0p;
	Mon, 03 Jun 2024 12:10:31 +0000
Date: Mon, 3 Jun 2024 20:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 8/8] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202406032017.LWpWkNka-lkp@intel.com>
References: <20240603054904.222589-9-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603054904.222589-9-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240603]
[cannot apply to drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.10-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Separate-VRR-related-register-definitions/20240603-140202
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240603054904.222589-9-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v11 8/8] drm/i915: Compute CMRR and calculate vtotal
config: i386-randconfig-006-20240603 (https://download.01.org/0day-ci/archive/20240603/202406032017.LWpWkNka-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406032017.LWpWkNka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406032017.LWpWkNka-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `cmrr_get_vtotal':
>> drivers/gpu/drm/i915/display/intel_vrr.c:152:(.text+0x54): undefined reference to `__udivdi3'


vim +152 drivers/gpu/drm/i915/display/intel_vrr.c

   135	
   136	static unsigned int
   137	cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
   138	{
   139		int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
   140		long long adjusted_pixel_rate;
   141		struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
   142	
   143		desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
   144	
   145		if (video_mode_required) {
   146			multiplier_m = 1001;
   147			multiplier_n = 1000;
   148		}
   149	
   150		crtc_state->cmrr.cmrr_n =
   151			desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
 > 152		vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
   153		adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
   154		crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
   155	
   156		return vtotal;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
