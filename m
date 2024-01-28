Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91514437
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706415558; cv=none; b=MJjH5fuqUDrc4VynYYivSjyEnekDiaSk+tXM2C8oRNeF+M9mXVUwNoOAKt1bx6bXglo1RqXvzCwQEXqTogyWrJjNFES+cDLvByFAcioyd5bCpjDHH5pAwfZUQPELv9qJTIbRZFkpxU7uoixXuagsgdEPJezFiVO88l9rK7JZBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706415558; c=relaxed/simple;
	bh=mKc1JWRCEkwPh0RRo8QjWsqyo5zlUbvm69ZFmB5xFBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8PN+ddtmo/2QXL8/GLnUK3qBwdJPIlvFcRm17AjM8SR9CvI7W9L2yhWoOq/JyT64+km+IQ/diXFzzB3RlzjGz8qvKtsOlZzYzIDUSYu38mJO4fWG7aPEcLR1+skUK5sNFYq2My4EtMQ6i+VMBdeyETjkLrFwELZ0PqFHR+Spes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1nD5+Gc; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1nD5+Gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706415555; x=1737951555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mKc1JWRCEkwPh0RRo8QjWsqyo5zlUbvm69ZFmB5xFBA=;
  b=M1nD5+GcJD22bvYDYCl5/72FjmePq5tigC+nTbW+PbTtrVBMOjnNg1sB
   51Nei5R5IZhMJUv/G2iUGs8Ux+CY5wFl8sgcuqELFAjUdSuD+hAztl4/k
   yzreGQum559V2cOSrA/uBOntkv1JO2z/ZNJGdlcVTBfF7kWEVD9lKK7i4
   E4R+b9zbhAARbHLaHO0TCIg5kMF6YGKF+OIWXTbhslDs7B7gUIP2V40Xv
   t18YwFfuK21OxU/PhZcQO2OLYxQWV9BU5KYoKJ5/yNciM41MpQt8x6rsd
   L1NJnRsqSQ/CS7bRrKtIu+NxAqgxR+KrMuzIBml1PMhcegEN2TPBUhWnn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393169081"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393169081"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 20:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="821528268"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="821528268"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jan 2024 20:19:13 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTwdT-00033q-0K;
	Sun, 28 Jan 2024 04:19:11 +0000
Date: Sun, 28 Jan 2024 12:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v3 12/16] drm/i915: Simplify intel_initial_plane_config()
 calling convention
Message-ID: <202401281233.cX62UpWx-lkp@intel.com>
References: <20240116075636.6121-13-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116075636.6121-13-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-Use-struct-resource-for-memory-region-IO-as-well/20240125-222947
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240116075636.6121-13-ville.syrjala%40linux.intel.com
patch subject: [PATCH v3 12/16] drm/i915: Simplify intel_initial_plane_config() calling convention
config: alpha-randconfig-r121-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281233.cX62UpWx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240128/202401281233.cX62UpWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281233.cX62UpWx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/display/xe_plane_initial.c:270:6: sparse: sparse: symbol 'intel_crtc_initial_plane_config' was not declared. Should it be static?

vim +/intel_crtc_initial_plane_config +270 drivers/gpu/drm/xe/display/xe_plane_initial.c

44e694958b9539 Maarten Lankhorst 2023-08-17  269  
44e694958b9539 Maarten Lankhorst 2023-08-17 @270  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
