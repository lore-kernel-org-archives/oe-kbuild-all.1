Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469B2C08A8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772987092; cv=none; b=fOkDhZlXiOOcvO1yNDHsnkDerpCpDqIXDbsvUIahG823M5zJq6DONchBqbTcMWShofxe0SV8EYXF9GsZaeDdO9aN7jkv/Vf1CY51AuMQzghr7WScX3mCkMV+DWRkkdonnK0C9JhZEiGpk8f8RaMLxGTqiCfPMbVljGRgTXPW+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772987092; c=relaxed/simple;
	bh=rTWIJZBcalYJMD/t0wxWOLNYJhY28C5F43rXAM+gZOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO79t7FcMPTR0zj8nGRbH5XGOp9KhDr7Tz6z3ffo6aSf+m2TTZ+vZbudnbmlI6SCVqG8OgRsctQZV9qJ4PmM5zO1LU022943aa/UWEly+4QGGS0th9Nrbyy8KwhhJrfzcjXiiiAGhtZSi6z5ORA0PXrn7b+g2LEyICufY4DFrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMDXHICc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMDXHICc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772987090; x=1804523090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rTWIJZBcalYJMD/t0wxWOLNYJhY28C5F43rXAM+gZOo=;
  b=RMDXHICcdMrQzXkt7FCBqWH3FgkeM+pV5nE42oh4ZFiZ6wSv+lTebS3W
   cEDoT+Zx1aUzYUMcoCtU24hgmoLI49JVEbindScZD4QJJpBvB9Ily3Ux2
   ee+sqwLHR5+XKgdiX3/Tdf3MynFH5xZe+iVXdsVUW1sdx8Ijvq7ITWxZf
   46HAZKJqanVMgQkxzPokcnwxBw+BlXSDjC3ZHI0cWJCsZGn1Bqk7Df5HK
   IVbatZ+0UNnA1uTjjwJ5OZ5moSuV97xcf8GPVW3L+1/66IV2o+ps38nfu
   KJmuBfJEuUY4LN21GPCQHWgkgcg9hbKNW+j9F6FZnr3lhRzGvv44vHNbt
   g==;
X-CSE-ConnectionGUID: 1R1sg033RQCj6SiT74Utyw==
X-CSE-MsgGUID: HLRzpC0sSBKQcqjUla7YoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85499929"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85499929"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 09:24:50 -0700
X-CSE-ConnectionGUID: 946eHPfJQZyqreQ/mFLVhw==
X-CSE-MsgGUID: ORm1g5ejSMi8QdGGBSMLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219645059"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Mar 2026 09:24:46 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzGvq-000000003FU-1oV2;
	Sun, 08 Mar 2026 16:24:42 +0000
Date: Mon, 9 Mar 2026 00:23:58 +0800
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
Message-ID: <202603090058.Jvh5jmdd-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260309/202603090058.Jvh5jmdd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090058.Jvh5jmdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090058.Jvh5jmdd-lkp@intel.com/

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
