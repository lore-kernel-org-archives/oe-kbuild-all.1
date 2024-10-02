Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454D7FD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 02:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727834985; cv=none; b=FrnQz9QCEBc8L2BEcICsUEEhlSG1KcQDOxb9FdpX2TOZnEp0m59/nOmP1tbEXll9sfb+joMLkRxT6sbUg8o736/X8wApQd4tcFCPHN8Dd6hnBrqLyovyrwa4ssexeiBgNmhtdKbUJ0XhmsB4FcL8y4Uq+K+w0P7Nf2bEn9gpnMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727834985; c=relaxed/simple;
	bh=V3pTbNzMevHZknMB0/YAiDF3yxkv5mrruHMY7Gj26ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sunKb9Qh/8U8Mi+wJGIQScOs6vWSDMtrhhy5OwulzuKZislJORHo/CsKBJZFLbxzqCc5UlAelj5c8vGSg5RYaGKnVGUEXPZacVuXM1EqVYP0OljWu+HKaLtXvuhzBq8jAtNVgSXp4bio6Fu+B9OXDhX98Qyiyp+an+4CRLkCiC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m68ujV1e; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m68ujV1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727834984; x=1759370984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V3pTbNzMevHZknMB0/YAiDF3yxkv5mrruHMY7Gj26ok=;
  b=m68ujV1ekAMjHZ+pfc3alp+xPhq8ykQe4+XomSS7AK4iOMzLgOMFEUzx
   TvC1UvoBT++w25b7dO6V7D8KBOsd/G5Gz23Ntts0cOF1R2e/nkXgCdEmE
   qXX4w3JSCLho/l4II4/HELojfkYQKE1uhIRBZwzMrAr2ygY1R913rXjMV
   wsRBlwTKodIID5Uopdg7VfgqaA2cqiml3ONeZuo1zQxTf5RDyiTEPOVrG
   p6vQOP09AH56RoMboY0wsCDC/46TIfOJsIasz1Abt2gLQXAwzqR3d9GxG
   wBuNkkgHkZKbgXDcgc/HzdHkTlSWnLefYmposkVfD81JzCmCiGA1y6uxE
   w==;
X-CSE-ConnectionGUID: W3XCycyJRbudYKR0dlGhWA==
X-CSE-MsgGUID: 6YB2/0bFQ/aA5/rLATI7tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30881354"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="30881354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 19:09:43 -0700
X-CSE-ConnectionGUID: d5KJv2ZqRROeWsP6pe+IAA==
X-CSE-MsgGUID: 0uY0GTOgSbOaPIf15Ls/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73978133"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2024 19:09:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svoo7-000RQt-36;
	Wed, 02 Oct 2024 02:09:39 +0000
Date: Wed, 2 Oct 2024 10:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 1097/1347]
 drivers/gpu/drm/i915/i915_gpu_error.c:2415:9: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202410021019.tNX2tCCb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
commit: 2edc6a75f26c112d90ca67ff412ba79622069818 [1097/1347] drm/i915: switch intel_wakeref_t underlying type to struct ref_tracker *
config: i386-randconfig-062-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021019.tNX2tCCb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021019.tNX2tCCb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021019.tNX2tCCb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_gpu_error.c:2415:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/i915/i915_gpu_error.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +2415 drivers/gpu/drm/i915/i915_gpu_error.c

4fca51984371d9 Jani Nikula 2023-10-31  2407  
4fca51984371d9 Jani Nikula 2023-10-31  2408  static int i915_gpu_info_open(struct inode *inode, struct file *file)
4fca51984371d9 Jani Nikula 2023-10-31  2409  {
4fca51984371d9 Jani Nikula 2023-10-31  2410  	struct drm_i915_private *i915 = inode->i_private;
4fca51984371d9 Jani Nikula 2023-10-31  2411  	struct i915_gpu_coredump *gpu;
4fca51984371d9 Jani Nikula 2023-10-31  2412  	intel_wakeref_t wakeref;
4fca51984371d9 Jani Nikula 2023-10-31  2413  
4fca51984371d9 Jani Nikula 2023-10-31  2414  	gpu = NULL;
4fca51984371d9 Jani Nikula 2023-10-31 @2415  	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
4fca51984371d9 Jani Nikula 2023-10-31  2416  		gpu = i915_gpu_coredump(to_gt(i915), ALL_ENGINES, CORE_DUMP_FLAG_NONE);
4fca51984371d9 Jani Nikula 2023-10-31  2417  
4fca51984371d9 Jani Nikula 2023-10-31  2418  	if (IS_ERR(gpu))
4fca51984371d9 Jani Nikula 2023-10-31  2419  		return PTR_ERR(gpu);
4fca51984371d9 Jani Nikula 2023-10-31  2420  
4fca51984371d9 Jani Nikula 2023-10-31  2421  	file->private_data = gpu;
4fca51984371d9 Jani Nikula 2023-10-31  2422  	return 0;
4fca51984371d9 Jani Nikula 2023-10-31  2423  }
4fca51984371d9 Jani Nikula 2023-10-31  2424  

:::::: The code at line 2415 was first introduced by commit
:::::: 4fca51984371d930a5d9d5a8b0848b892dbfdecc drm/i915: move gpu error debugfs to i915_gpu_error.c

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
