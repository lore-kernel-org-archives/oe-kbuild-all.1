Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D6C2288CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770764706; cv=none; b=GtXp8WbqvDv5KOIfUEPDQqb/qOJ5G8BtinFKRpYdn1vNxXHHopMeZPrkvXyXIH1Bqsw2DRLpuGJ+LfU+yXGn6jL7ZrDGN981d98vAEJggxHeeQ4Yzyy4JLV/cq4luueao424Xnh+MKsUipmprQmCx94FnpX2Ig6zhp5putivUdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770764706; c=relaxed/simple;
	bh=qtpJEcMVC2V2u6xLYxQmhF7h6Lr884P2kSH7jrOMUIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QS5UjhZF/GG10mFXn7et8zY2oO0ONimJIkotaYFdIWldhBSentGQqCIigipRWgW+3RXRYIpeJuJ2m+9anwS0cUPQna5UVUGe1flSGlEOpneDpeVFcwZ4cuocEc0U+06vOJYC5tXdE9BhdIv+MJjldSDgRr/eFVZCUSNYpdQROR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2IPuk2p; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2IPuk2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770764705; x=1802300705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtpJEcMVC2V2u6xLYxQmhF7h6Lr884P2kSH7jrOMUIw=;
  b=Q2IPuk2pnQQKA6aJ7zG49rjIcV1KlsDAtaaYAu35wCTQb3AluH6oajvU
   LIfxKvjOUcgst13bmyOTfk+baJVR9NfqScIRwDxoYMfkDlVY8yEAOq84k
   S4Awu9/eXCfZ2HperocAKuuNUqCx+7ChVuudsWef0xBcgjcJc5qy8b8Qs
   jFGTLaKVuWcbeo7/CIL7UGkiQ3PPfbT6r/bwnNatLviIx88SXi/tisDjF
   ScdEmiiGj+5g7U6u8uZe4rgOClHsJ3HLOW83SHwP+bn3xe78KO0mvkCko
   JG/5NqwFBMwov/no7/zK8ukPbO4SQMMzPiml1pL1z11oh2gJ5gRUSPOCi
   w==;
X-CSE-ConnectionGUID: 9OVkC7upTF2UZj3chc7siA==
X-CSE-MsgGUID: OpiRzui+QaiC41HKkJiypQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71976728"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71976728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 15:05:04 -0800
X-CSE-ConnectionGUID: MX4f7ZkEQzqFbz9aNZhOqg==
X-CSE-MsgGUID: ZVtnhQ5VRpmO7RrLnGlc3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211130667"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2026 15:05:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpwmz-00000000pUq-0b25;
	Tue, 10 Feb 2026 23:05:01 +0000
Date: Wed, 11 Feb 2026 07:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 60/61]
 drivers/accel/ethosu/ethosu_drv.c:26:1: warning: data definition has no type
 or storage class
Message-ID: <202602110646.bsWBK8qe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   b160ea7e81b14378daf7dc40cd85e1b26ebb6634
commit: 409d5f2c32913392326ac7923364665eca17c1bb [60/61] accel/ethosu: enable drm.debug control
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602110646.bsWBK8qe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110646.bsWBK8qe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110646.bsWBK8qe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/ethosu/ethosu_drv.c:26:1: warning: data definition has no type or storage class
      26 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
   drivers/accel/ethosu/ethosu_drv.c:26:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Wimplicit-int]
   drivers/accel/ethosu/ethosu_drv.c:26:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +26 drivers/accel/ethosu/ethosu_drv.c

    25	
  > 26	DRM_CLASSMAP_USE(drm_debug_classes);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
