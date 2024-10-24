Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E586CDBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 11:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769873; cv=none; b=F16Nviglcfx1RWSeOGhsv3gn2zTZgKQORNy+kq0rpcAkh3DGGtoSyOw/bH5xvzMVtv1HefQ7FvTz2v1+r6ICNyZrCLbsqZyIBIvwVEXrWWdqOVd6DbvkmDPq8Atv/2fSIum5f4dLLpVFBBA7yUrM0rYTyHWM4KVBq9O9U9F9Mok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769873; c=relaxed/simple;
	bh=rULX2dCE1o4q6ssWSBB1h6omSIRCI/KsXsuX9geeYtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJkPdvTOGaePVzsu3wvxoyDpHt4fg7ob/OoBf48mEnRGIDBBM5E8F5EoefD9Q5xV1F9F3fEsCZHkhFmQW+QPvyTXFDIQcbNZtQkjScX+uCMyIIlGgePj/Xe2J8D9KrZCTFONTdgIcRS8M5KUTgm2uJzt+1nssUA93hHSbg7LOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH8d/pGa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH8d/pGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729769872; x=1761305872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rULX2dCE1o4q6ssWSBB1h6omSIRCI/KsXsuX9geeYtI=;
  b=dH8d/pGatPYN4XqLYY83OyDIcLi6kKSQLtjdnRtUJO2u3i/sibY6Fix5
   WXaoHN2Us3pgkHDBTMHuQqCrbqgkI9ZhL+7gXja6dN7Ay8vYpO8u/3hzT
   dxrfJm+n+hRSnUtNFEfZvkgMiUjgbx7boTXCfzU2kXsIrNMjt9WmIzSXg
   3upH1P14jUP4GAP8Bj2viGmZSLAHVAHINDIJIZpfs/+CLxVo0Zk4n/oir
   BtiPYNdokc3jLT6LUtAPjqs5eQYsaJS95t9vCv6relppo+DM3HaPbpb5o
   nW4Onss4msUcJwek4+xc8z7baVecbk6jlu41+J9oQhzKm3vKcT6/+xPh9
   A==;
X-CSE-ConnectionGUID: n3UhNByPSYeKKVsDihCn4A==
X-CSE-MsgGUID: WwEaMnbRTsCPoM/DroPAuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33087683"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33087683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:37:51 -0700
X-CSE-ConnectionGUID: vZz2GL3zTriFnm6fpurlCQ==
X-CSE-MsgGUID: chYzBXqFRP61JcoZS94B6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80222842"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2024 04:37:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3w9z-000WLF-1e;
	Thu, 24 Oct 2024 11:37:47 +0000
Date: Thu, 24 Oct 2024 19:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/7] drm/ttm: Handle cgroup based eviction in TTM
Message-ID: <202410241921.zeJ6BBAy-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next next-20241024]
[cannot apply to tj-cgroup/for-next drm-xe/drm-xe-next akpm-mm/mm-everything drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/kernel-cgroup-Add-dev-memory-accounting-cgroup/20241023-155504
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023075302.27194-4-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 3/7] drm/ttm: Handle cgroup based eviction in TTM
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241024/202410241921.zeJ6BBAy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241921.zeJ6BBAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241921.zeJ6BBAy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ttm/ttm_resource.c:29:
   include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |            ^~~
   include/linux/cgroup_dev.h:65:1: error: expected identifier or '(' before '{' token
      65 | {
         | ^
>> include/linux/cgroup_dev.h:61:16: warning: 'dev_cgroup_try_charge' used but never defined
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |                ^~~~~~~~~~~~~~~~~~~~~


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
