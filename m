Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CED38332A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204573; cv=none; b=RfKUEID94aSYeNO9zLNs1cNucny419T6nUBlbR1JHdA40aWbcQeKK7sHVydclUx/ZGXBgLRc7WPkMThmDvaFQUNai4C/mGrsTNSImaY2d8VNufI3VKXhmSmlLZOK4Z0qghER4oSH/GvZS72QIhGa91Vrf77NNniZZrt24aEsd0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204573; c=relaxed/simple;
	bh=aDqfZ1ffOPHuAFlxQE32BvxlClrmIe0hd8jEibV3r+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tzp9hfczhH0P94IVHE/5M3K7+UIY+hx0pCH8jMQpqhETvQofvBsHtpRk0md9oOh3IEgtvSM6lrIJqyVXsRZ3qxNH6vuzVoXldG2D8LFHEePHh7VHf7SYTO92b+jxAhBYu2aDEreooZQoNImecAR035rWkTGAiJaoJ8WQGyS4Cvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTzuiSLE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTzuiSLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790204572; x=1821740572;
  h=date:from:to:cc:subject:message-id;
  bh=aDqfZ1ffOPHuAFlxQE32BvxlClrmIe0hd8jEibV3r+8=;
  b=OTzuiSLEo1DyOxuM42smBGXLt+QrmGA6vP1VNf93oRu8qkkU0Mq6B/J4
   vpwPElCse2dOXJUXMwGXzdkM7yxYwpFYTrEEWhB2TS2z/ZiO5Hit+I+VU
   B3KHwHl80w0JXlWx5cUCn2o2m9XNIJ4Eq7Vl4aKhNhmaQAHY3DWVf+kX5
   5lBlyhOPLnf3Rjs/cQ7RYgQpVhZPqsPHaBx2oLUlBk5xHGXfbHgeBp1J9
   cfYO4M3SuMDas5D/0lx7IOAFGHNhN9AHBlZiwkMpUNdQ6+ga/J1ixLaM1
   WMaQFEGo/VSKOpur1N2/Czjmv5uEcGWHSck2AdErl9Ns300EVnY6eFwcv
   g==;
X-CSE-ConnectionGUID: gAF+0j36S7S9Mo6dLVRZag==
X-CSE-MsgGUID: IT+H4NJmTluk9oU8fZ8SPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93454285"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93454285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:02:51 -0700
X-CSE-ConnectionGUID: BReFdPeoQ9ea754pXSXS3Q==
X-CSE-MsgGUID: eGvxwmyXRsCSSmarUDCMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273998603"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2026 16:02:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9VzC-00000000HvY-2c9Q;
	Wed, 23 Sep 2026 23:02:46 +0000
Date: Thu, 24 Sep 2026 07:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Feifei Xu <Feifei.Xu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 817/8910] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:2448 This comment starts with
 '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609240635.M2G0xdSh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 7b2e99877db54cf762994af9239d7fb908f96857 [817/8910] drm/amdgpu: add amdgpu_discovery_get_mem_reserved_region_by_id
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260924/202609240635.M2G0xdSh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240635.M2G0xdSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240635.M2G0xdSh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:2448 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Query mem_reserved_info by region ID

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
