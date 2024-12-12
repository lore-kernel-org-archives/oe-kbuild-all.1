Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F352080FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016990; cv=none; b=Vttmu/azS9pfuBGwed01G880hpKGKWTL5I2CffuvI5+euTj4JlO7ksxaqd9l1hCYAWDhGAer+1nHtF1YzgYHFiLva/fYpuj+C0LAyRey2UH5WyyhaFTwlTqnINB+OjsfAHMNlbs3Ur010F60nvjvCxFxbdAet+h2CYt3CA/qEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016990; c=relaxed/simple;
	bh=CFMMHK4ogEgl/pHqScEA9FjioE8yU6a30CnrPprnCIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A661urQ+bzrGMWQJNHgDwBthgJWj6um+DoEwItngCq7ByuIEzUbkxINCeSqobgrpiDNcRXSrFt7QKWfE1Ie1OPf8UyI7TgFj6bIrOy2FdP75UtJyQcd4jEC0p7TrV19XsSDLs3/c1KMwvJlo4pONdbzgtztj96C0YAcTygOV8w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZvcmpIc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZvcmpIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734016990; x=1765552990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CFMMHK4ogEgl/pHqScEA9FjioE8yU6a30CnrPprnCIA=;
  b=mZvcmpIczFQopoF0H6mYuJUvPG7T3l0RRJxvNQkrTNq0auzsI2y2ikHp
   v4Vkd4ZGDjLgUYSUolI2HlJU++TYgX66yhyowm0rljX0Ivwy5E8jDEf+s
   8ukIyPuDTCS5/iNekOd4WhHQwp6XS6BgqKfP7lsJrHFEKptl6xEROd15p
   9tHuenSitbo1iJI44F/qhrMlo40T9va4aiblhkMA5eCtvgxzSVG8x0KXl
   980QXApdmdBlpPUibW/b4Ubvn1RTnlTnc9Uhlzv+sS8ZGfXfoWnbZ5bZR
   ycmYzQoy4K+uY/P9jTGToLZV7kER1b4lpWGl/RcR3D7oxEpI0qxy4eB5n
   g==;
X-CSE-ConnectionGUID: PRl6+5ptRJSylqIxClJfvQ==
X-CSE-MsgGUID: K+n+6ccNSQ2nZacgr3W8Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34164642"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34164642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 07:23:09 -0800
X-CSE-ConnectionGUID: c1IQjOczQbqFgODStHzcBQ==
X-CSE-MsgGUID: yoUpKuezQHCOijyqQsSbiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101206688"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2024 07:23:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLl1t-0008FV-0d;
	Thu, 12 Dec 2024 15:23:05 +0000
Date: Thu, 12 Dec 2024 23:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/features 10/15] port.c:undefined reference to
 `cxl_features_type'
Message-ID: <202412122310.KvQffbyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/features
head:   a67a7f4d25f148893d8c845b36ce97ec806f461f
commit: d632be62a52ab8d4eb49c90c883b2bd1a0859d1a [10/15] cxl: Add skeletal features driver
config: sparc-randconfig-r123-20241212 (https://download.01.org/0day-ci/archive/20241212/202412122310.KvQffbyV-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412122310.KvQffbyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412122310.KvQffbyV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/cxl/core/port.o: in function `cxl_device_id':
>> port.c:(.text+0xefc): undefined reference to `cxl_features_type'
>> sparc-linux-ld: port.c:(.text+0xf00): undefined reference to `cxl_features_type'
   sparc-linux-ld: drivers/cxl/core/port.o: in function `cxl_bus_match':
   port.c:(.text+0x270c): undefined reference to `cxl_features_type'
   sparc-linux-ld: port.c:(.text+0x2710): undefined reference to `cxl_features_type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
