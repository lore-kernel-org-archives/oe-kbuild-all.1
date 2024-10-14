Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC51487F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728901382; cv=none; b=Iq3zW/KPKgFEWXnKzuUUdHxHQZ1gvCeLXtG4Its2dLB4NhiEey2jiidoOxUHZq4SEZEWtzpuJgRwFiOBAS9qbUZ/IC6+JMiQTPNKL2yZUQsEq47hW5r/CfxAliVj61amw3g9lAITvUhQPsWTOYrCbLzGzeZJN9kj8vjzMUVTnEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728901382; c=relaxed/simple;
	bh=ECxltupT/kNikrU904XdjmWDQnVaZmw3KS2bhxc1Vv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWsos+VzXKq3Gvldjxqtl3KtWq8b/T+XDBrh3DxT5LJIZyKm6XRvuypcN4mgSxr7JYAlkXYveLNju0aiogBmEQsonHhxbuGukQYMs9mRFyiaJmXNkVB4/wF4Mj0u+qRg/Oelmgs6KTAdqr4bGnYCTM5NS+ln9Nhl/GJRbR0QV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KblIHOtw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KblIHOtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728901380; x=1760437380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ECxltupT/kNikrU904XdjmWDQnVaZmw3KS2bhxc1Vv4=;
  b=KblIHOtwYs076cyRpsKD4YCDKLFmmMu1RE0B7LAvow9N+XvETM2lStyd
   Gc16eMIQwX/UyXYXepZfYLmJxMW9b9BKBXFR1N25QItbNIeALGwgv2WsY
   wzwiAjHH/43tExjJfVNZAK0FDa4Jh6BJQJ8gYaNPNvkTFfgi5Noq0pBM1
   Nubx+1Uv6OsUsUqmTXVAefhbY5IAf8lMUD565eucwNHQovoxwoJI6DfLX
   uhAclNUMSbZfLGkV+GjOmZaqVHjmQODvLiK53VjUl33J3mnYh05KJZjAi
   DaSjBoIs7zO7m+KpfE5S2A3F1YoXZyY6hp+EHWiXFKxfBjFN11JPB8zKX
   A==;
X-CSE-ConnectionGUID: 2NVGQha+Tj+GwSirwwpupw==
X-CSE-MsgGUID: OUAOIKieSoq24roLSXITPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28384849"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28384849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 03:22:59 -0700
X-CSE-ConnectionGUID: NrGRrBfVQ2KjMP4ad0jjRg==
X-CSE-MsgGUID: 31l6HTU3RXmva30mQ4N14w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82101733"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Oct 2024 03:22:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0IE4-000FBX-1C;
	Mon, 14 Oct 2024 10:22:56 +0000
Date: Mon, 14 Oct 2024 18:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 1067/17816]
 include/drm/drm_of.h:87:12: warning: 'drm_of_component_probe_with_match'
 defined but not used
Message-ID: <202410141851.2U3H5qma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   d45fcfc7eac49282ddaa08a771318a9b0f4a01bc
commit: dcc7dc895c2b1880da843c82b41c0ed26c5c5756 [1067/17816] MLK-16290 drm: Add drm_of_component_probe_with_match() helper
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241014/202410141851.2U3H5qma-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141851.2U3H5qma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141851.2U3H5qma-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_bridge.c:34:
>> include/drm/drm_of.h:87:12: warning: 'drm_of_component_probe_with_match' defined but not used [-Wunused-function]
      87 | static int drm_of_component_probe_with_match(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_of_component_probe_with_match +87 include/drm/drm_of.h

    86	
  > 87	static int drm_of_component_probe_with_match(struct device *dev,
    88				   struct component_match *match,
    89				   int (*compare_of)(struct device *, void *),
    90				   const struct component_master_ops *m_ops)
    91	{
    92		return -EINVAL;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
