Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CB84D34
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 03:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728788978; cv=none; b=d+edN8rRQtUatI0sdbJKuQHcO4m7/yttZTJJqF0E9s7BnV3X4RfRGdlfhOblAwd72rX0LF6IepF4xNvdhro7IIi+00iU9ASXV0MRXIv/gICXVrz9iNpxde5fVdMYzYQTbrdM0Z2GsreXLDff0L0YUpYiez14TJHXwgNcMrR6IRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728788978; c=relaxed/simple;
	bh=4og+kQhUKZNKAoXrOdL4DwFF8+CMyCuEzYEg9JIUpsw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uefqr2MfSJoIYBqE6j+mfOs81uLa+N96pRmHnjJGmwcGJUYjN7Hzs3iHffLB/Rye/UZFilZV7+1QUYOtlU8VW41UpzjO8vOkxBYFoZeo8q7nUM82e0/k3S1zZHzpc+rP40yy723ey6FaTmJvuHyPN+btroIGgFA8x06AJayWn6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7ll63/0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7ll63/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728788977; x=1760324977;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4og+kQhUKZNKAoXrOdL4DwFF8+CMyCuEzYEg9JIUpsw=;
  b=k7ll63/0IDRCsa2bJfSrrkQtI7jdBZse4hSHHluPQj9jap9BM57E8Gn7
   RyDQub+8r8bZ/i6yoFzV9Xd7C6CZKUxMoLb+DlNhdYZs+tAmUMtQa5fxD
   ISq6TCfo17U0anoco/kTuAxI90sZ640uzLtggveJ+k6fN0G5ilhnzRQoE
   NkDVPkHEIYw4Ds/B8p+Z/iK++n+Hm2BZ4wtcyYEhIoB2U53OlELJVUx+Y
   5P/3yfyhp8Fii4ab8y416KP0y0kEFhtYLGBPunI5NeMDIpj7i4xYGEV2l
   yYlIFDBbPfm90+q5pQDNeodx0w7+JwzhGkeqvyfjE0Nsr9pn0tKcmSrNx
   Q==;
X-CSE-ConnectionGUID: 59rjjvpHRFmkK8vlXcvW2A==
X-CSE-MsgGUID: xmEoCF/pTLiyC1gmgy16Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50691919"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50691919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 20:09:34 -0700
X-CSE-ConnectionGUID: eEVqSxd3RiOv6Y7TAYgvvw==
X-CSE-MsgGUID: MrHCuFG9RYiNJAjqLIf21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="82050476"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2024 20:09:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szoz4-000E1T-0U;
	Sun, 13 Oct 2024 03:09:30 +0000
Date: Sun, 13 Oct 2024 11:09:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 46/107] ds90ub913.c:undefined reference to
 `__clk_get_name'
Message-ID: <202410131127.xgJoSzi4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   451df8c0a2a3bcf0656b2f6fdc49d6fb4d05f186
commit: b18364151a13ff12dcf5655d4c13e734e824206c [46/107] media: i2c: add DS90UB913 driver
config: sparc-randconfig-001-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131127.xgJoSzi4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131127.xgJoSzi4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131127.xgJoSzi4-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/media/i2c/ds90ub913.o: in function `ub913_probe':
>> ds90ub913.c:(.text+0xda8): undefined reference to `__clk_get_name'
>> sparc64-linux-ld: ds90ub913.c:(.text+0xdc4): undefined reference to `devm_clk_hw_register_fixed_factor'
>> sparc64-linux-ld: ds90ub913.c:(.text+0xde8): undefined reference to `of_clk_hw_simple_get'
>> sparc64-linux-ld: ds90ub913.c:(.text+0xdf0): undefined reference to `devm_of_clk_add_hw_provider'
   sparc64-linux-ld: ds90ub913.c:(.text+0xdf4): undefined reference to `of_clk_hw_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
