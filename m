Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE091A5BB2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 23:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741216791; cv=none; b=OV+4BQEsm+c0ksm5iOGbCr/K2zxMlGXo7WfXD10azFTKWjMWZ6xi3DgsM8pcHmEBxkmYL0SKDOE31EY6ThJU44TiE6GSwlwycNfDDISxY6F1YO2n2eS7xApRvktLLGDFbnalWZZDWoPbr6b+eMjjLH7qUhyvXLlmjYCBXOR4A6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741216791; c=relaxed/simple;
	bh=14Nxh4l+Po6hHqi1MkaST0wvA68jJVpNEuF0UoWjzTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvETy/vJnYy0z4iQwtdNJDFA3IBzz9IfC6DcFJWlJolfi3npbCCOQcpW8t4O8uQRA5fZ5QuWvlhxTDNPkX86Is/teBQW+T1LkdH1/i0nHg7PfGBWWN+8HX3TtfwGAsqltcm4vnoSOjUt4wG4vh9qjmhN2lsJXAnokVEYuE54Q3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeSOtDiL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeSOtDiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741216789; x=1772752789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=14Nxh4l+Po6hHqi1MkaST0wvA68jJVpNEuF0UoWjzTo=;
  b=jeSOtDiLpAn0c01imNo5B235r7nuAdORSirPOnFDixUvx75ZZ0l2Gneh
   zVzPcb4eXtppHAYlloN4VLBmMv+OaZbOTcPtNkAWWh0ktPWR9SYwAxzDz
   eDDh36P5B9RIWZ7DFytrKUWrch4Eb7QXTfudKgLwDl0DzfFhV/cvXrRFU
   eAxac3imLVlb2eiR0Jq2KAxFc6ncbT7+RQN4Xw7hPoMvXv8LW2UZtcsUy
   niUZqkjUMnp0sqNHflPUZUfSt13JnU++xiJXmrkLomRBtwsmt9SIhODBL
   xON2K3zLBYg3ggLaPtNICZoHJeLM+Q8GR1dDM9zzJ+WZpq54c1PqY49Ez
   Q==;
X-CSE-ConnectionGUID: TJkF6+MOSEGls4TIw8C/Lw==
X-CSE-MsgGUID: 90gkWG5RTj27PDCbtW69cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64650142"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="64650142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 15:19:49 -0800
X-CSE-ConnectionGUID: Sq/TyaUjQK2qzD+0WnDf5Q==
X-CSE-MsgGUID: gd8BGUrlQhez80nX3AKd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119341245"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Mar 2025 15:19:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpy1h-000MJ4-2S;
	Wed, 05 Mar 2025 23:19:45 +0000
Date: Thu, 6 Mar 2025 07:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 05/10] drm/i915/display: Compute the scaler filter
 coefficients
Message-ID: <202503060720.C5qW8bAI-lkp@intel.com>
References: <20250304102857.326544-6-nemesa.garg@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304102857.326544-6-nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250305]
[cannot apply to drm-exynos/exynos-drm-next linus/master v6.14-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-i915-display-Introduce-sharpness-strength-property/20250304-184502
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250304102857.326544-6-nemesa.garg%40intel.com
patch subject: [PATCH 05/10] drm/i915/display: Compute the scaler filter coefficients
config: mips-randconfig-r132-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060720.C5qW8bAI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250306/202503060720.C5qW8bAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060720.C5qW8bAI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_casf.c:43:11: sparse: sparse: symbol 'filtercoeff_1' was not declared. Should it be static?
>> drivers/gpu/drm/i915/display/intel_casf.c:49:11: sparse: sparse: symbol 'filtercoeff_2' was not declared. Should it be static?
>> drivers/gpu/drm/i915/display/intel_casf.c:55:11: sparse: sparse: symbol 'filtercoeff_3' was not declared. Should it be static?

vim +/filtercoeff_1 +43 drivers/gpu/drm/i915/display/intel_casf.c

    42	
  > 43	const u16 filtercoeff_1[] = {
    44		FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
    45		FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
    46		FILTER_COEFF_0_0,
    47	};
    48	
  > 49	const u16 filtercoeff_2[] = {
    50		FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
    51		FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
    52		FILTER_COEFF_0_0,
    53	};
    54	
  > 55	const u16 filtercoeff_3[] = {
    56		FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
    57		FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
    58		FILTER_COEFF_0_125,
    59	};
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
