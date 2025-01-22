Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC7182BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 00:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737507538; cv=none; b=WyexqVJW6Ik3Z0MbYqDXdhFhIVlu0kaME9ZaPh6a8i5Ikr8Qym5sjdui+yA/E5XNx3y3NDa4x2paOKrRXT8zB+swYd+hh8GiUd5RzOcN25qvAAYasUuNImJp8UPbofUU8TB0+ieMRjWfqDpviW13AI8juV2CBf3xyChX0OTrzLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737507538; c=relaxed/simple;
	bh=w/oLny5UJO9irRllF7K2YmbpKldQvUYtgwxk+UkUg8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JS30orv7dUpLXu4KaCHq85B91JT44PgjcZEhxJTUCf3nAoRCBRUaYox2jVlyIO+rJCuhG4MTXYSAuBAKymwyfvT3s9mLnznl7PSm5ra+xMHzPoq8Yy+mpXPLgOv2m/en1tPaXRvFk1VPgPjGPknuBhQGrVYxSz+/6zzLNc/Tdqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YauNcUKH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YauNcUKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737507536; x=1769043536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/oLny5UJO9irRllF7K2YmbpKldQvUYtgwxk+UkUg8k=;
  b=YauNcUKH45xmNFWuBmcAvkhzVanDC3P3ZTOqjIkLY5DZzAGliv+JFVZT
   VMdXtJzoVNSdzpcfwgZFzIkNC8GZY4B/aIQisgnikKIjekXAuIHaUFFvM
   EbMd48B6FQzyOanRrGP7YTa4oIbOHb2qBaEOSRKL2QMsNrY7Yu3SIwLfV
   hgsALcrtAS95lioEtTfl3dnOzwECCznl7BUdEs+5QhkjF2gnBmVBEOT8w
   AFpFCuGZ3R+Oc9mXuVgt+USzMEqy6Q1z+gtxHKyqLxCtwX9tXNfqySxAE
   +2zVkp2C/Pduz041E9SRberw/+fxcu4mjir2HHDF9PrV6KcIB6ERbNBCG
   g==;
X-CSE-ConnectionGUID: X+6pawWfSGCdEFhXOXXDcw==
X-CSE-MsgGUID: D77/G5i4TVq8F6QQr0PzUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48938179"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="48938179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 16:58:55 -0800
X-CSE-ConnectionGUID: T+815YyxRFypOeJVLSnP7Q==
X-CSE-MsgGUID: Um/FnR7CQdaJptNFluNisw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137855746"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jan 2025 16:58:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taP52-000ZDB-0q;
	Wed, 22 Jan 2025 00:58:52 +0000
Date: Wed, 22 Jan 2025 08:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1410/1410] mm/vmscan.c:3257:28: error:
 implicit declaration of function 'kernel_swap_enabled'; did you mean
 'kernfs_ns_enabled'?
Message-ID: <202501220839.T9NIZlrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fdf62dff2537450d438667d817333e17ec71148a
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1410/1410] etmem: add original kernel swap enabled options
config: x86_64-randconfig-102-20250121 (https://download.01.org/0day-ci/archive/20250122/202501220839.T9NIZlrQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220839.T9NIZlrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220839.T9NIZlrQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_object.c:60: error: Cannot parse struct or union!
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'mem_glob' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'ops' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'dmabuf_release' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:98: warning: Function parameter or member 'dma_buf_size' not described in 'ttm_object_device'
   drivers/gpu/drm/ttm/ttm_object.c:129: warning: Function parameter or member 'rcu_head' not described in 'ttm_ref_object'
   drivers/gpu/drm/ttm/ttm_object.c:129: warning: Function parameter or member 'tfile' not described in 'ttm_ref_object'
   drivers/gpu/drm/ttm/ttm_object.c:561: warning: Function parameter or member 'dmabuf' not described in 'get_dma_buf_unless_doomed'
   drivers/gpu/drm/ttm/ttm_object.c:561: warning: Excess function parameter 'dma_buf' description in 'get_dma_buf_unless_doomed'
--
   drivers/pinctrl/core.c:168: warning: Function parameter or member 'pin' not described in 'pin_get_name'
   drivers/pinctrl/core.c:168: warning: Excess function parameter 'name' description in 'pin_get_name'
   drivers/pinctrl/core.c:607: warning: Function parameter or member 'selector' not described in 'pinctrl_generic_get_group'
   drivers/pinctrl/core.c:607: warning: Excess function parameter 'gselector' description in 'pinctrl_generic_get_group'
>> drivers/pinctrl/core.c:1338: error: Cannot parse struct or union!
   drivers/pinctrl/core.c:2226: warning: Function parameter or member 'pctldev' not described in 'devm_pinctrl_register_and_init'
--
   mm/vmscan.c: In function 'kernel_swap_check':
>> mm/vmscan.c:3257:28: error: implicit declaration of function 'kernel_swap_enabled'; did you mean 'kernfs_ns_enabled'? [-Werror=implicit-function-declaration]
    3257 |         if (sc != NULL && !kernel_swap_enabled())
         |                            ^~~~~~~~~~~~~~~~~~~
         |                            kernfs_ns_enabled
   cc1: some warnings being treated as errors


vim +3257 mm/vmscan.c

  3250	
  3251	/*
  3252	 * Check if original kernel swap is enabled
  3253	 * turn off kernel swap,but leave page cache reclaim on
  3254	 */
  3255	static inline void kernel_swap_check(struct scan_control *sc)
  3256	{
> 3257		if (sc != NULL && !kernel_swap_enabled())
  3258			sc->may_swap = 0;
  3259	}
  3260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
