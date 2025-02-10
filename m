Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C75231A23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201679; cv=none; b=XrtUMGcfxQLcLBTtbr4haCS1eGBmJW4gbTs+Twynds+5BQBf7dqXcOpKWhkZNJYAIXfjHvby/xxZpYS1aaAtSJY5hsw+FwOPXHSBbRTQtZJyx2FN78YdboaaGvgqhNx5OKPBBX3IHddAEbQwtSrHsU7NTEUzr82/R5DMh6xzVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201679; c=relaxed/simple;
	bh=OOrnmuqtL2dSCkUj/XXGetqz78lrbriOA+RqUEfU6o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp02fN+2MOyw/eGRlZdpzSBU5hx11zBDvTgyaHp6vLrs+67ymLfkCQEAA1/f7KwYQ+crMoLWcnrXZUcwL10kR4D5z90FcMW8uXZT6GZJjZVXNd6Wy50RRJLWMC0lVzo75omn30D/C7kCUmNBBcQKCTyrx3dc4aWSSMvjbhomoBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Olb5cxoh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Olb5cxoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739201677; x=1770737677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OOrnmuqtL2dSCkUj/XXGetqz78lrbriOA+RqUEfU6o4=;
  b=Olb5cxohzQX2AhWnIGQr9fjBNWspD11MYKNi2lb5KwjAqOyS30hNPb00
   5fPnTKSGMxb5KXrR+v1ECCoKEn6BY1ZOUrDfGGlBCK69tejAVPWsQckqg
   ql4RDU3ci7O+qAn4VVitHgD8v5+oCbAj2t7uHL8HjY60NOMppZztDCyhA
   UXHHK3WnYUhdX5J8d0EuDXJXG9LNHo0Slu7Y7I0j0mnGLvPg0wB+dGqiU
   BdA1hHXkTuHVX2ajMDs73c/2TlV/GBVaVTLElEOSmorq8hBLILKhOvDw3
   Md8WWtJBIvT7qzZXBZjrudfgf0wT9YNZV1GX2//4lHz0rTKC33Par9I4c
   A==;
X-CSE-ConnectionGUID: Zwl06akQQ0uE/05rarnZXw==
X-CSE-MsgGUID: AMMV6f37SqyKjhGNg13x4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50417799"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50417799"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:34:36 -0800
X-CSE-ConnectionGUID: vmEMLkMfTKKQWeyEJdNg3w==
X-CSE-MsgGUID: qrBMJDRBSQm85WgzuPx7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112441674"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Feb 2025 07:34:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thVnt-0012y3-1e;
	Mon, 10 Feb 2025 15:34:33 +0000
Date: Mon, 10 Feb 2025 23:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Reaver <me@davidreaver.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] debugfs: Replace debugfs_node #define with
 struct wrapping dentry
Message-ID: <202502102334.VOT8cUT6-lkp@intel.com>
References: <20250210052039.144513-7-me@davidreaver.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210052039.144513-7-me@davidreaver.com>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on a64dcfb451e254085a7daee5fe51bf22959d52d3]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Reaver/debugfs-Add-temporary-define-debugfs_node-dentry-directives/20250210-132642
base:   a64dcfb451e254085a7daee5fe51bf22959d52d3
patch link:    https://lore.kernel.org/r/20250210052039.144513-7-me%40davidreaver.com
patch subject: [RFC PATCH 6/6] debugfs: Replace debugfs_node #define with struct wrapping dentry
config: arm64-randconfig-001-20250210 (https://download.01.org/0day-ci/archive/20250210/202502102334.VOT8cUT6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102334.VOT8cUT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102334.VOT8cUT6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_debugfs.c:21:24: error: initialization of 'void (*)(struct pvr_device *, struct dentry *)' from incompatible pointer type 'void (*)(struct pvr_device *, struct debugfs_node *)' [-Wincompatible-pointer-types]
      21 |         {"pvr_params", pvr_params_debugfs_init},
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_debugfs.c:21:24: note: (near initialization for 'pvr_debugfs_entries[0].init')
   drivers/gpu/drm/imagination/pvr_debugfs.c:22:20: error: initialization of 'void (*)(struct pvr_device *, struct dentry *)' from incompatible pointer type 'void (*)(struct pvr_device *, struct debugfs_node *)' [-Wincompatible-pointer-types]
      22 |         {"pvr_fw", pvr_fw_trace_debugfs_init},
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_debugfs.c:22:20: note: (near initialization for 'pvr_debugfs_entries[1].init')
   drivers/gpu/drm/imagination/pvr_debugfs.c: In function 'pvr_debugfs_init':
>> drivers/gpu/drm/imagination/pvr_debugfs.c:45:38: error: passing argument 2 of 'entry->init' from incompatible pointer type [-Wincompatible-pointer-types]
      45 |                 entry->init(pvr_dev, dir);
         |                                      ^~~
         |                                      |
         |                                      struct debugfs_node *
   drivers/gpu/drm/imagination/pvr_debugfs.c:45:38: note: expected 'struct dentry *' but argument is of type 'struct debugfs_node *'


vim +21 drivers/gpu/drm/imagination/pvr_debugfs.c

cb56cd61086645 Sarah Walker 2023-11-22  19  
cb56cd61086645 Sarah Walker 2023-11-22  20  static const struct pvr_debugfs_entry pvr_debugfs_entries[] = {
cb56cd61086645 Sarah Walker 2023-11-22 @21  	{"pvr_params", pvr_params_debugfs_init},
cb56cd61086645 Sarah Walker 2023-11-22  22  	{"pvr_fw", pvr_fw_trace_debugfs_init},
cb56cd61086645 Sarah Walker 2023-11-22  23  };
cb56cd61086645 Sarah Walker 2023-11-22  24  
cb56cd61086645 Sarah Walker 2023-11-22  25  void
cb56cd61086645 Sarah Walker 2023-11-22  26  pvr_debugfs_init(struct drm_minor *minor)
cb56cd61086645 Sarah Walker 2023-11-22  27  {
cb56cd61086645 Sarah Walker 2023-11-22  28  	struct drm_device *drm_dev = minor->dev;
cb56cd61086645 Sarah Walker 2023-11-22  29  	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
ff2c46c29b70e2 David Reaver 2025-02-09  30  	struct debugfs_node *root = minor->debugfs_root;
cb56cd61086645 Sarah Walker 2023-11-22  31  	size_t i;
cb56cd61086645 Sarah Walker 2023-11-22  32  
cb56cd61086645 Sarah Walker 2023-11-22  33  	for (i = 0; i < ARRAY_SIZE(pvr_debugfs_entries); ++i) {
cb56cd61086645 Sarah Walker 2023-11-22  34  		const struct pvr_debugfs_entry *entry = &pvr_debugfs_entries[i];
ff2c46c29b70e2 David Reaver 2025-02-09  35  		struct debugfs_node *dir;
cb56cd61086645 Sarah Walker 2023-11-22  36  
cb56cd61086645 Sarah Walker 2023-11-22  37  		dir = debugfs_create_dir(entry->name, root);
cb56cd61086645 Sarah Walker 2023-11-22  38  		if (IS_ERR(dir)) {
cb56cd61086645 Sarah Walker 2023-11-22  39  			drm_warn(drm_dev,
cb56cd61086645 Sarah Walker 2023-11-22  40  				 "failed to create debugfs dir '%s' (err=%d)",
cb56cd61086645 Sarah Walker 2023-11-22  41  				 entry->name, (int)PTR_ERR(dir));
cb56cd61086645 Sarah Walker 2023-11-22  42  			continue;
cb56cd61086645 Sarah Walker 2023-11-22  43  		}
cb56cd61086645 Sarah Walker 2023-11-22  44  
cb56cd61086645 Sarah Walker 2023-11-22 @45  		entry->init(pvr_dev, dir);
cb56cd61086645 Sarah Walker 2023-11-22  46  	}
cb56cd61086645 Sarah Walker 2023-11-22  47  }
cb56cd61086645 Sarah Walker 2023-11-22  48  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
