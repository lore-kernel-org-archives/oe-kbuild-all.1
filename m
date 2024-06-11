Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA2155A5D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 23:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718147959; cv=none; b=a1cSZDokwl2Ptk09fgACJsd4uM88bsR9E4HwxtPk4t0IPBaJBGLoBnDDS72wzdAZhbe8wQZJYPJ6HfiaLWNuoB/qxi4CJZxv/WwCPmpOfs4QlLXRLa/1q7fXhAww9R4e9+uoE+Fa3qYUSnoN06zK/ZdXNGvU73fZZl6SBanVqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718147959; c=relaxed/simple;
	bh=GkeXF4bgIY/txdx/CgAXI3DSCOfLrfqAJQUk4YZUx7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nrI+/FqNcMl54B/BoE0YvJudesONsuMnWUUbkUwYW5rmpwIP+wNzvs4wEQuMPpv6E7/FSfdZTU4e8Pl4P9xn42QV8pB75aNrMRQm+JGFtEOtEfa+AuOWx3Yv6DVxkDQ8yqAT3BURhyZjbun2qUkLUIAatiMh5loi5Ki6VDD1bFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhyMQ0nC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhyMQ0nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718147955; x=1749683955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkeXF4bgIY/txdx/CgAXI3DSCOfLrfqAJQUk4YZUx7U=;
  b=RhyMQ0nCWyOrYkuDhO0vQx/lRNUDCKTKzhEie/t9qGngsIR2LSYMbSyG
   XwWk6e8kyzWmgcx7IVU0cntqTDac2801rOPEieKWC7dqH5G2Xof9xWzc7
   3YNl01sj8ddxfWc3pbU7njzwihBlQMRpy7tbZuJ6mnrxEsfdhmiW+Kyd3
   AQ/y96JbskEbxQJtz1VKz9uATcSSVCkNqaVylW2tCquerf9Ovo0YILZuG
   cV9UA7hsKYppcHjWWoJXqgRLSahNUl8ZOkIRZIywoDXjQkglevS/uMtLy
   s97e3vS7rG1no8vMJsWzKE05BqP7YlYJP9tBACbOXzlzZU9UloXcM72/v
   g==;
X-CSE-ConnectionGUID: swULektRTYu7KLvDd4VCTQ==
X-CSE-MsgGUID: 3tdWAERZTXGQr6ZnJjV7Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14613016"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="14613016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 16:18:13 -0700
X-CSE-ConnectionGUID: LJBJiDZjQoC/G1aRRNOTCg==
X-CSE-MsgGUID: 0e4H7yf9S8SbhhGy3LkuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39488179"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2024 16:18:11 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHAkj-0000zB-22;
	Tue, 11 Jun 2024 23:18:09 +0000
Date: Wed, 12 Jun 2024 07:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 12/17]
 drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: error: initialization of
 'void (*)(struct platform_device *)' from incompatible pointer type 'int
 (*)(struct platform_device *)'
Message-ID: <202406120736.5AEAsytB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   fdbb3ef0d4aadf9a3374c2a892098be89e9a3abb
commit: 7eead7ebd4fa6978d3b020b2615f0680a7e98c5e [12/17] gpio: add sloppy logic analyzer using polling
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240612/202406120736.5AEAsytB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120736.5AEAsytB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120736.5AEAsytB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
     316 |         .remove = gpio_la_poll_remove,
         |                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-sloppy-logic-analyzer.c:316:19: note: (near initialization for 'gpio_la_poll_device_driver.<anonymous>.remove')
   cc1: some warnings being treated as errors


vim +316 drivers/gpio/gpio-sloppy-logic-analyzer.c

   313	
   314	static struct platform_driver gpio_la_poll_device_driver = {
   315		.probe = gpio_la_poll_probe,
 > 316		.remove = gpio_la_poll_remove,
   317		.driver = {
   318			.name = GPIO_LA_NAME,
   319			.of_match_table = gpio_la_poll_of_match,
   320		}
   321	};
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
