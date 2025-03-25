Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682031FE471
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887688; cv=none; b=sQ0ORfJSF26URknDB5UVMDi1csvkjcPz/BhYnFO58r0tNClfMKkLUs97aYUdXpCHRieihwbJe/hepyCCO8O96Gud8pCaz7PHdd+3OqfK4OPzF0Bsevqzr9bKvjdKTKva2a/UgWtd16xglwMCEeJgHORCzyEtXrmgMK+CztJXxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887688; c=relaxed/simple;
	bh=8HOarppCMoUX0sO18vCp2r3hljuh7yqGQkiTrJHjy2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1qhfjEbLXldR/8geA6rudfIwNxffs00bJWHVcPwFdtig0tqv5evTPn4uViRritOBYdK4AbCKhb3z+3gFLjAb+EsRC1nA/frlgb+l447iXnfTPZRXNI036qNlzzIN1Brm6bYr90O8dsjGjrOjk1B/K0W9fkz7rOtCvvgx3/KyKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig5Rzx1m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig5Rzx1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742887687; x=1774423687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8HOarppCMoUX0sO18vCp2r3hljuh7yqGQkiTrJHjy2g=;
  b=ig5Rzx1mod3AKYe7gOm/Qnz8Ex0kIlOTd6ulLq+pUyTrLpXBfkgdEjMz
   /olEI9xhDWUHcXgsSk+yJ6A+NL5uwOwFn//Y5NybYZTp956SPFhSRDcHa
   SY0dwPWMhuLmGWl8dd45iQjy3btdhnTbz1OVdalwv4w4GJPjzT7KIQGlF
   eRvFtNQLQ77HiuL0UYu/ETcZPb17Qxu6nDTGDWw+otWGbkU6iyBYejksx
   AlO87Z6stTw4hSuUjfQuf6qCwy7iwxNS6x1vpgGxSiYtqyAh77ZuadPLE
   JsOpVUznfbzlDNv/i9DUBtKpPtle4qvo1i+VGExre/rKsFXdYuxeYYFTF
   g==;
X-CSE-ConnectionGUID: 8Hco3Vg2SLGe+p1R32RL1A==
X-CSE-MsgGUID: OCiOq1JvTB+ETZ3evlOy6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54322915"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="54322915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 00:28:06 -0700
X-CSE-ConnectionGUID: DotnjLLkSYWWfsUXTe+Q/w==
X-CSE-MsgGUID: ch6F1Bo6ToWDr6SROVt5Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="155305761"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 00:27:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twyhT-0004Ch-38;
	Tue, 25 Mar 2025 07:27:51 +0000
Date: Tue, 25 Mar 2025 15:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.14/bbr3 1/1] ERROR: modpost: "__udivdi3"
 [net/ipv4/tcp_bbr.ko] undefined!
Message-ID: <202503251538.0hCvA1i1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.14/bbr3
head:   34167ee061e35e8bb9368e1ea575b2f1fbd4867c
commit: 34167ee061e35e8bb9368e1ea575b2f1fbd4867c [1/1] tcp/bbr3: initial import
config: csky-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250325/202503251538.0hCvA1i1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503251538.0hCvA1i1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503251538.0hCvA1i1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
