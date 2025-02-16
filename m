Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F84DDD2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 04:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739678719; cv=none; b=m6DEt3aiaBlWXNOoHWeyRCH/57lFYOHtAjid8XqRPnoaGKdpYb09fcFJCpgVBIBGFvPhDUdhSu4/g8j+RsjAKUHcuelceqxeuoQeK0HjcPxeUzDg7owR0jd3qQ0eNra5cG2lPNXHOMRAggi4iOvF3wNo+KyKqxGxrPgylBL1/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739678719; c=relaxed/simple;
	bh=MitFostZ17U+RCr5KrEZh7zn5g9fU/ze8H4EG6qBnpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7tIty9A4Ute8tItvyEk0EZa8BvNufDfxM7qA2C0Pc686kQPDvgrlrRCTDv1jIWAzFrAu5uH4QolQfE9u/rw5dL4E3DEiliWvf/IUmlegRD+3HB/KzNB8zaRo7AATWQjwyUMOZHqCRMCRXnO12/PiBZbT5Z88LVgZ+mX1oQM0nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfQj7L+m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfQj7L+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739678718; x=1771214718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MitFostZ17U+RCr5KrEZh7zn5g9fU/ze8H4EG6qBnpI=;
  b=NfQj7L+mHzOX5SE14PXJ2MQgkXY8s9xy2kKU3kyMq0dEidFHDQC4AONa
   u899Ri5OXGuAhi8z7hy2bcbXcy1hDIDS6/xRYFdIA/jJGiQcgMMamjihJ
   zELDfWHNFKJl14Pv51rBmF2XyIjDOmNV5hhj2M001zn44FJ5iwpB1YF1T
   fZtzul1mo4V1vTrQicWqTko+JEuCz2E7e1DZVdbHv/CskRtLCrB+uGzSE
   E2DJDVnL32mSh7vFFqxdiqjhorC4L88DIFelTV7gyA0t92/HJ0XBENQpO
   AmtT3m89CyFzpUDceEeMSj4auYFWaLETzQZNhlhbtdMNuZjPyvpMdYO4I
   A==;
X-CSE-ConnectionGUID: oYNusNfFTYOQr4frUlG6mw==
X-CSE-MsgGUID: 3AsJYl62TmSHE7ceWMcPjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40248156"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="40248156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 20:05:18 -0800
X-CSE-ConnectionGUID: VqXrDgtxTMCJXfftZyAToQ==
X-CSE-MsgGUID: XVzuNlpFRkC/9ViMMlQpGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150978133"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2025 20:05:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjVu5-001BYh-0L;
	Sun, 16 Feb 2025 04:05:13 +0000
Date: Sun, 16 Feb 2025 12:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
	alex.zuo@intel.com, joonas.lahtinen@intel.com,
	lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client
 pagefault info
Message-ID: <202502161130.qHItt8dh-lkp@intel.com>
References: <20250214203757.27895-4-jonathan.cavitt@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214203757.27895-4-jonathan.cavitt@intel.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master v6.14-rc2 next-20250214]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-xe-xe_exec_queue-Add-ID-param-to-exec-queue-struct/20250215-043933
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250214203757.27895-4-jonathan.cavitt%40intel.com
patch subject: [PATCH 3/4] FIXME: drm/xe/xe_drm_client: Add per drm client pagefault info
config: alpha-randconfig-r051-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161130.qHItt8dh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161130.qHItt8dh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_gt_pagefault.c:342:3-8: WARNING: NULL check before some freeing functions is not needed.

vim +342 drivers/gpu/drm/xe/xe_gt_pagefault.c

   332	
   333	static void save_pagefault_to_engine(struct xe_gt *gt, struct pagefault *pf)
   334	{
   335		struct xe_hw_engine *hwe;
   336	
   337		hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
   338		if (hwe) {
   339			spin_lock(&hwe->pf.lock);
   340			/** The latest pagefault is pf, so remove old pf info from engine */
   341			if (hwe->pf.info)
 > 342				kfree(hwe->pf.info);
   343			hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);
   344			if (hwe->pf.info)
   345				memcpy(hwe->pf.info, pf, sizeof(struct pagefault));
   346			spin_unlock(&hwe->pf.lock);
   347		}
   348	}
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
