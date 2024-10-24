Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D91CBA17
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791433; cv=none; b=QKUusldeGjAgY7kc+kz+DvNQYxaBZRAVXfhWKHLNQOTXggHynArGAXogwV5sJvRcyDCB/KBoz61aPiWT/jPr7Pbt5cO+xJTg3JU8EJFU+TclTRCMXUc1QD65xs8gifCRnEeW+RVKcO+/6xOwLF4wn48eVHX2PkluH7XGrw6dglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791433; c=relaxed/simple;
	bh=CN44mCoQTziRwSUZ4FaAyi/efakfy779eEZXufV4shI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wwxgu+KHhN49HzRiybu52RdcuUIV41IQ+NVonILvLfw8UWBTZxM0KN3ZbTLzZGkQOJar4ecOFOGuw4l39UXyxnOA25D69owZI5wuQ95ssOhsp76R65QXzHUEMbhr1/l1stV7KdrC9pxUSyySGGGU5bi5ELq2kgBsb1aPA+h6IBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kg09+Ajp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kg09+Ajp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729791431; x=1761327431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CN44mCoQTziRwSUZ4FaAyi/efakfy779eEZXufV4shI=;
  b=Kg09+AjpFHgCf/tAlKMIECwIuxNtC1a2JgrLLOLGPJcONGIYeJvJr6Xz
   IHdZJr3nd0RDiSxa1wFpwn9WSuN60iOqenZ22zj2McnpAaGFU/evcCGzg
   v8dJl2Yl1XUdi5s1rjC4VZXTF+uvdtlmaB6TQDRIFgJhfqK4SsrV9RQ0U
   jbtgdgwE9fCbIRKqIJeXqvzo8k+Am+u5Wqjlu4zHNy8HUauAXoBr5uXHQ
   ZLWMbYQW4tYYyOlHNk5iv6fVmg6aDBQzEFVVP1BvIH4Y7SMvGStKg4xY3
   DfWUdBpLm0uWRI9DPgEtCFzBUk4aFzFz8W+Km8rdAQQkrSQ9Vu/9ZXxSF
   g==;
X-CSE-ConnectionGUID: 7C6DpMyuSzO20AyD2AjAjg==
X-CSE-MsgGUID: L+7YLzKYRHuuPF9ch6in2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40028636"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="40028636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 10:37:10 -0700
X-CSE-ConnectionGUID: 7+e/7WGGQMaO1VHf3FexAA==
X-CSE-MsgGUID: YympQVDUTZ+rgVviFXVb9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80247264"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2024 10:37:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t41lj-000Wn0-0B;
	Thu, 24 Oct 2024 17:37:07 +0000
Date: Fri, 25 Oct 2024 01:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/7] drm/ttm: Handle cgroup based eviction in TTM
Message-ID: <202410250109.8mGX5ORG-lkp@intel.com>
References: <20241023075302.27194-4-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023075302.27194-4-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next next-20241024]
[cannot apply to tj-cgroup/for-next drm-xe/drm-xe-next akpm-mm/mm-everything drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/kernel-cgroup-Add-dev-memory-accounting-cgroup/20241023-155504
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023075302.27194-4-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 3/7] drm/ttm: Handle cgroup based eviction in TTM
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250109.8mGX5ORG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250109.8mGX5ORG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250109.8mGX5ORG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ttm/ttm_resource.c:29:
   include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |            ^~~
   include/linux/cgroup_dev.h:65:1: error: expected identifier or '(' before '{' token
      65 | {
         | ^
>> include/linux/cgroup_dev.h:61:16: error: 'dev_cgroup_try_charge' used but never defined [-Werror]
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |                ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/dev_cgroup_try_charge +61 include/linux/cgroup_dev.h

487073b1855ef4 Maarten Lankhorst 2024-10-23  60  
487073b1855ef4 Maarten Lankhorst 2024-10-23 @61  static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
487073b1855ef4 Maarten Lankhorst 2024-10-23  62  				     u32 index, u64 size,
487073b1855ef4 Maarten Lankhorst 2024-10-23  63  				     struct dev_cgroup_pool_state **ret_pool,
487073b1855ef4 Maarten Lankhorst 2024-10-23  64  				     struct dev_cgroup_pool_state **ret_limit_pool);
487073b1855ef4 Maarten Lankhorst 2024-10-23  65  {
487073b1855ef4 Maarten Lankhorst 2024-10-23  66  	*ret_pool = NULL;
487073b1855ef4 Maarten Lankhorst 2024-10-23  67  
487073b1855ef4 Maarten Lankhorst 2024-10-23  68  	if (ret_limit_pool)
487073b1855ef4 Maarten Lankhorst 2024-10-23  69  		*ret_limit_pool = NULL;
487073b1855ef4 Maarten Lankhorst 2024-10-23  70  
487073b1855ef4 Maarten Lankhorst 2024-10-23  71  	return 0;
487073b1855ef4 Maarten Lankhorst 2024-10-23  72  }
487073b1855ef4 Maarten Lankhorst 2024-10-23  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
