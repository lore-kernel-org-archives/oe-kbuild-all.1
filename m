Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD513E881
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039540; cv=none; b=GFg6H2Y9vxF9zCdHpozwIRhDxicb8XGjGuZ7D1wayYNCiZgban5KYlo1aMeW0WwtW/wnDBTnSaQD3jW1EeuM+TbEcx+Fmmv/89Z8ZXkR20tqN7Lq7TZ72DQlwn4xCq4KDHuaRa4t8IPPK+T0bsWXMFVDfmcyAS0y0c4s2N2vXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039540; c=relaxed/simple;
	bh=Sev+yS82DTjIjocqbz7Wk4jnoCEIitWfRRLfr7hF8Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0pmO0LPsMWN/waWTjuF32HRi1yYdRbq1FM+72pZDCiV5ZvUmiYcHP+2P/tciJ+N1OtrBru7T11Y3M+RZu41uWxcl3JMX+QntfD0qiRWFxVg8ffg7LetyUHr4eHuV/gW8TmgB3gDsiUteyozuaESyEd8O7pUk31kPEbfjeGtSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Khc+p3uo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Khc+p3uo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726039538; x=1757575538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sev+yS82DTjIjocqbz7Wk4jnoCEIitWfRRLfr7hF8Ig=;
  b=Khc+p3uoA3eN7tTTi9XghIRnxMEYYdXo2y9s7YFHCZWQ+l9JuahA8zGJ
   DGILaNur1uEPbnIKM2aOd7l8fz9PogiJ6ELpkbwDkesa6RoT5H3Id0jfS
   Hoz2r7EGOgreQD1YyOlo1SXnsNq79Rclt2VZq0D6pNujLhcFafftbaKkj
   dezHDd9ao9W1a8Acu7KMrCWDRJeFZeuRFYRapn4Y8OVtv5VcJpyYVvpC4
   b1JWcqe0vVR6GlW1NwgXnJdvARopPjBbAr3avWRwG1tNYmU2Mqm/Hl32C
   nyYSz5AYGoBLXBFHBB4hOivoIe1vEEu9+c/MCF+UwiwNXZN5E1c5kD5Ox
   w==;
X-CSE-ConnectionGUID: VR/ju21QRaqLK44JZDPBpA==
X-CSE-MsgGUID: nXYDXrjqTyGFO181JD5koQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24692722"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24692722"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 00:25:37 -0700
X-CSE-ConnectionGUID: Fi7z4pTFQq+NBXJ+GCLT9g==
X-CSE-MsgGUID: ALpTK6MGQ/isrxlQfURyJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72084937"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2024 00:25:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soHjK-0003B6-2d;
	Wed, 11 Sep 2024 07:25:34 +0000
Date: Wed, 11 Sep 2024 15:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 5/13] ld.lld: error: undefined
 symbol: led_mc_calc_color_components
Message-ID: <202409111518.WYJlbqo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f3eef39b58c135ec165488d1b4e6785742bae87e
commit: e1cd3ffe478871deb44f1ce2fbe6a6c8e7e08ab3 [5/13] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: x86_64-randconfig-016-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111518.WYJlbqo9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111518.WYJlbqo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111518.WYJlbqo9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_led_classdev_multicolor_register_ext
   >>> referenced by led-class-multicolor.h:74 (include/linux/led-class-multicolor.h:74)
   >>>               hid/hid-playstation.o:(ps_lightbar_register) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: led_mc_calc_color_components
   >>> referenced by hid-playstation.c:816 (drivers/hid/hid-playstation.c:816)
   >>>               hid/hid-playstation.o:(dualsense_lightbar_set_brightness) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
