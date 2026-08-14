Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DD31ED81
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718448; cv=none; b=i/JNaGwVmlOIC4Up9weDKryGrXPF7YPsCCll49mwwm5uU42cFpDHKX/51CKDtTNfh57T/rrAU9lZnoUyS9jT6XNnT/xVoR7wGsih//cfdDb9Ot5/Cv29w/xstxeqX8EFNNgBwVsAxzMeSd4LsiOMyv4aVvtoZPS6xg9JKUKestM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718448; c=relaxed/simple;
	bh=QCTBEDpopnM0P6SocuEKwQclBPNGNiEmSuopCWcN1oQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W0L23c1D9gWduDe4FsKnRUAJUezFGXWRoQtgdpbm/eOXJ92reXcge+G8jjy6xLz2yGFQegkcQpZxPY21L1UhCg15HukWKfWS8+WUHEtUg/K0bQ9cZW2rPatAkJr7dL69R2kOfUJudeGtjQVYRxlodI+bruec9HWOTSx/5ndt5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mONrflVR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mONrflVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786718445; x=1818254445;
  h=date:from:to:cc:subject:message-id;
  bh=QCTBEDpopnM0P6SocuEKwQclBPNGNiEmSuopCWcN1oQ=;
  b=mONrflVRD3CCVu6HsOu0kUCzUxWFTvJNI//mmD49gmm5d4i3ZfxSxlms
   iJPlqgY3Hzk/gsGByHdZBkWtQKZXkpktsMEE4tyhoDdb4CyuhHuAwxGxw
   Fz59YRuvg0yEMYVmp3rnrlJdlDE5aKT5085WmlBt9rdTXhlMqKzhUw/3r
   KrjNCKKyaNyD8XpyCaKt3FlPWNDvt3endUVFux03vJfWfvX8XGF1O0MQS
   syW6wygSHBWE3L4TuO7cj7r3VEUTC6NrlV1eemH3Z3BFCkcES2X69ojNb
   bXJSA5xuvLf7Xb5SWmlTYjqj8LuS4nsubL2uiChE42xCXomFB3KN99d6m
   w==;
X-CSE-ConnectionGUID: UPb0kkMkR1+XR4vtEox4aA==
X-CSE-MsgGUID: hlc4AXBqQwayll1FgBY/QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87158368"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87158368"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:40:44 -0700
X-CSE-ConnectionGUID: 15WVChTlTiavu5otD0aDXw==
X-CSE-MsgGUID: FLRixYblQtOzEbEFySYKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260457886"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2026 07:40:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wut5M-000000006HU-2IwY;
	Fri, 14 Aug 2026 14:40:40 +0000
Date: Fri, 14 Aug 2026 16:39:41 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Warning: drivers/gpu/drm/vkms/vkms_connector.c:81 function
 parameter 'connector' not described in 'vkms_connector_init'
Message-ID: <202608141634.8ulEH4WD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20260807-092508
head:   c4c09a7274b7bb12e10957fc5da78e52e5bbf54d
commit: b9ad098dbdecf3a982bbbb21ba5e33f313e13c7a drm/vkms: Introduce config for connector supported colorspace
date:   8 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260814/202608141634.8ulEH4WD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141634.8ulEH4WD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141634.8ulEH4WD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:81 function parameter 'connector' not described in 'vkms_connector_init'
>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:81 function parameter 'connector_cfg' not described in 'vkms_connector_init'
>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:81 function parameter 'connector' not described in 'vkms_connector_init'
>> Warning: drivers/gpu/drm/vkms/vkms_connector.c:81 function parameter 'connector_cfg' not described in 'vkms_connector_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
