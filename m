Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C063290C5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772958023; cv=none; b=Tghucnpclvc6lDuMO7TUQaN9+gvQK9SA6NPft/BY+v2DPZzcKdaTYTwpCkRtrUfNhEut/3+fqjv3tAozj6EymHTIECxLXFS2rCnvuN6IFJWUvmlLcS4sENqWit6EQA4uRqsry5j5KRfU1Ek7eOWKJxvyDrsdYo7lKXKWByyfgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772958023; c=relaxed/simple;
	bh=Pe3lvvOiPMFQ46F7OuVkf8+omFdhw7YDqvcnRRAGsLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnURvYHtLZMG3dATYsHCy8WqRiGKLU86tN+pu7w0nG1F2E6X7iJcXgGr1fwRpn6lcWUTTQDCHgUQwSG9ZAkweCFA2R1fGeoKi6mxPOrHVlpDC7jxHDYNE4CQbSC7pkWgC6cjS/bN2aJkhv2ntcVvPv5l/WBOzYcktIN0hJzdMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhzSpwvQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhzSpwvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772958022; x=1804494022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pe3lvvOiPMFQ46F7OuVkf8+omFdhw7YDqvcnRRAGsLQ=;
  b=jhzSpwvQ7KaZYjKMgn1lflsjKV8gC5YN3lbXNeg9cWyUgljN81PP2eDb
   fxM2teGUn34KqAYJkoMjEeD2y/Z+aOnYUeekliE8FuKhmc036pb611heZ
   DiQ/+oa8l/9kLwto/KaePgOwlZWqkito/EdblXM8c4bbVwWB9dDQORqOE
   KqoDNq9F/ASoCd2FLvqoKbLAWoqx/lptRA9dNiQXqRYOSOkBQ7I+pOuw/
   rSopFeTIWpy9ELVRaXUkhAzyksTcWgSLFlWRFt/90wla9IuOqSvBshxDR
   I3mlzPiDwOLxlhEWn6qtLgo/+FJ5Mhcii20JhfFJDgtYR9PU7q9pXMoJd
   A==;
X-CSE-ConnectionGUID: Y/ICb3PUR7ul4T0cYVxlGQ==
X-CSE-MsgGUID: VjlPdVRtRNqbf7E64vh+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73977853"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="73977853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 00:20:22 -0800
X-CSE-ConnectionGUID: lA4yGwBVQuKcjREHK06l5Q==
X-CSE-MsgGUID: A+qRt4H6RvW8JfY0/nx6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="218641940"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2026 00:20:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz9N1-000000002eD-2dND;
	Sun, 08 Mar 2026 08:20:15 +0000
Date: Sun, 8 Mar 2026 09:19:42 +0100
From: kernel test robot <lkp@intel.com>
To: Rafael Passos <rafael@rcpassos.me>, alexdeucher@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, BhuvanaChandra.Pinninti@amd.com,
	Harry.Wentland@amd.com, Martin.Leung@amd.com, Sunpeng.Li@amd.com,
	alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
	daniel.wheeler@amd.com, davidbtadokoro@ime.usp.br,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rafael@rcpassos.me, ray.wu@amd.com, rcpassos@ime.usp.br,
	siqueira@igalia.com
Subject: Re: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir
 iGPU
Message-ID: <202603080959.llKqWvRQ-lkp@intel.com>
References: <20260308000515.890688-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308000515.890688-1-rafael@rcpassos.me>

Hi Rafael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-Passos/drm-amd-display-fix-resuming-from-S3-sleep-for-Renoir-iGPU/20260308-080715
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260308000515.890688-1-rafael%40rcpassos.me
patch subject: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir iGPU
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260308/202603080959.llKqWvRQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080959.llKqWvRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080959.llKqWvRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.c:99:6: warning: no previous prototype for 'dccg21_init' [-Wmissing-prototypes]
      99 | void dccg21_init(struct dccg *dccg)
         |      ^~~~~~~~~~~


vim +/dccg21_init +99 drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn21/dcn21_dccg.c

    98	
  > 99	void dccg21_init(struct dccg *dccg)
   100	{
   101		struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
   102	
   103		/* Hardcoded register values for DCN21
   104		 * These are specific to 100Mhz refclk
   105		 * Different ASICs with different refclk may override this in their own init
   106		 */
   107		REG_WRITE(MICROSECOND_TIME_BASE_DIV, 0x00120464);
   108		REG_WRITE(MILLISECOND_TIME_BASE_DIV, 0x001186a0);
   109		REG_WRITE(DISPCLK_FREQ_CHANGE_CNTL, 0x0e01003c);
   110	
   111		if (REG(REFCLK_CNTL))
   112			REG_WRITE(REFCLK_CNTL, 0);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
