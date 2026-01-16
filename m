Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0A34165E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768535979; cv=none; b=l3UTmiRqwziuIjTKLf/zo2jYtL8meWvg1NHS6N60qDXTTetk0kJ3NjFXOTfflGHB1Q34mAJgDkSu+eJNl3kCgRThEufTk3qlAefA6Ulc7h+B0ks0EwRSxGMcXi4/hDUcak8/d3TOrJpVHaXpIl3YELzur9ki+j5yp6NnA4F+nQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768535979; c=relaxed/simple;
	bh=QkXFBZMhpaoFpnjvGh5HZA0qRmLwZIUrp/on5jgDNIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0Vzpo8Z3ekXL5dFvEYIZGiJkZ+XIO0PzJ6Zkq/T4m/pN8ICoVZPygQObusahrf9nbeSEdqnfs3d8s5XMGLAzljemgDSff/S7XnO/gPDRi4l4xfdrV9C+/cVnyintqnidfMZgSA+APOJ5BYkpSPopAcCk9jPnRktQMj14aupdXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfGAPeOt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfGAPeOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768535978; x=1800071978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QkXFBZMhpaoFpnjvGh5HZA0qRmLwZIUrp/on5jgDNIw=;
  b=XfGAPeOt074Oz5q7L3yg7yLwGM2NLeW4sHwqU3AuVucWlWeowPRkfq4s
   axSwMZwLzhLNl+Km5ZzyPoUbOoh851dEt5CRtypBJhnM2G+7SpbWvLSTC
   NXmaOQ/JlfHwc+BuFgja7/5WK+PA6zEoysIMjDDm5RIJNJcHYPYneLnqv
   2f4FbMh9118Pvl08ap2d0rTZ/tcMi/1A3RgAM8/UhrnNl6FkBbqcd4Qr6
   ylYhpKAjl0VQ03Uf/C7hBj7UwbaqbIaGPpzbtamsrsKCmFx1ZdCpAKjk+
   4cOhSAd0hr+A14ML7kolTa/xRbdaGo64LPwcmLx+98wJ6trippQzjTLgT
   g==;
X-CSE-ConnectionGUID: 2yIq9H94T1CTDAm7LmEI4g==
X-CSE-MsgGUID: weAnFhMEQxW/xPASI3mczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95329403"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="95329403"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 19:59:37 -0800
X-CSE-ConnectionGUID: d/hOxleFTVKOUmdwQ4Gdng==
X-CSE-MsgGUID: B+O/2jvGTLOG4YtTXUwD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="235828036"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 19:59:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgazl-00000000KLo-3Foo;
	Fri, 16 Jan 2026 03:59:33 +0000
Date: Fri, 16 Jan 2026 11:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/2] cxl/region: Translate HPA to DPA and memdev in
 unaligned regions
Message-ID: <202601161110.EaybOpWU-lkp@intel.com>
References: <5d1de87c8e2ac9e3d9b43af5c0d975f7f4ac269a.1768504636.git.alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d1de87c8e2ac9e3d9b43af5c0d975f7f4ac269a.1768504636.git.alison.schofield@intel.com>

Hi Alison,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb]

url:    https://github.com/intel-lab-lkp/linux/commits/Alison-Schofield/cxl-region-Translate-DPA-HPA-in-unaligned-MOD3-regions/20260116-041147
base:   9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
patch link:    https://lore.kernel.org/r/5d1de87c8e2ac9e3d9b43af5c0d975f7f4ac269a.1768504636.git.alison.schofield%40intel.com
patch subject: [PATCH v5 2/2] cxl/region: Translate HPA to DPA and memdev in unaligned regions
config: i386-randconfig-054-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161110.EaybOpWU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161110.EaybOpWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161110.EaybOpWU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cxl/core/region.o: in function `unaligned_region_offset_to_dpa_result':
>> drivers/cxl/core/region.c:3335:(.text+0x607d): undefined reference to `__udivdi3'
>> ld: drivers/cxl/core/region.c:3336:(.text+0x60a5): undefined reference to `__umoddi3'


vim +3335 drivers/cxl/core/region.c

  3316	
  3317	static int unaligned_region_offset_to_dpa_result(struct cxl_region *cxlr,
  3318							 u64 offset,
  3319							 struct dpa_result *result)
  3320	{
  3321		struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(cxlr->dev.parent);
  3322		struct cxl_decoder *cxld = &cxlrd->cxlsd.cxld;
  3323		struct cxl_region_params *p = &cxlr->params;
  3324		u64 interleave_width, interleave_index;
  3325		u64 gran, gran_offset, dpa_offset;
  3326		u64 hpa = p->res->start + offset;
  3327	
  3328		/*
  3329		 * Unaligned addresses are not algebraically invertible. Calculate
  3330		 * a dpa_offset independent of the target device and then enumerate
  3331		 * and test that dpa_offset against each candidate endpoint decoder.
  3332		 */
  3333		gran = cxld->interleave_granularity;
  3334		interleave_width = gran * cxld->interleave_ways;
> 3335		interleave_index = offset / interleave_width;
> 3336		gran_offset = offset % gran;
  3337	
  3338		dpa_offset = interleave_index * gran + gran_offset;
  3339	
  3340		for (int i = 0; i < p->nr_targets; i++) {
  3341			struct cxl_endpoint_decoder *cxled = p->targets[i];
  3342			int pos = cxled->pos;
  3343			u64 test_hpa;
  3344	
  3345			test_hpa = unaligned_dpa_to_hpa(cxld, p, pos, dpa_offset);
  3346			if (test_hpa == hpa) {
  3347				result->cxlmd = cxled_to_memdev(cxled);
  3348				result->dpa =
  3349					cxl_dpa_resource_start(cxled) + dpa_offset;
  3350				return 0;
  3351			}
  3352		}
  3353		dev_err(&cxlr->dev,
  3354			"failed to resolve HPA %#llx in unaligned MOD3 region\n", hpa);
  3355	
  3356		return -ENXIO;
  3357	}
  3358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
