Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100D19E83E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572603; cv=none; b=g/8LvCWfJ0SIlzG6J8hKiN9KeOH5+Upwe5blMxWBSXspFDO/G+oCrjjjjhGNc7KiBYMl5lWte8bwjb2zzFTM5rQW0wR6Rss5bkkoqwSgqtN4DU8apSS91lDiszl4kLGTTBrKCwzUhc16RQkxJFynjMCsnoFsCI/oIa7Dhk/Gbdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572603; c=relaxed/simple;
	bh=IpAhX4VaH1gLmYAmQt/4h12qC6lIb9bJjxQz7EEDIpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FGY0NNK/PRbosm4qJSGZdjTGQjtMrOHJNABLaRQRgDDMITlIf8Br0YlZAQdInZkr3WWWKhq3a4nVpfB6OcRSrfdcQ7OPnBcl1Iej5uEb22m3w/k/cKEF9I3AwPYpd4apCKVKQDFSiPB8C6pjDF8LEuVpEqekXQT57fv5zNo0Isk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KL86/3hQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KL86/3hQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735572600; x=1767108600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IpAhX4VaH1gLmYAmQt/4h12qC6lIb9bJjxQz7EEDIpU=;
  b=KL86/3hQbcScnVqadYmtK2/1d9wCnPXNHZgoyWo+rDJlej63t2jgeJyx
   nQ3kASdR7g0O8JN7JzMGQVT9xr9khYoocoaJ3BMp3ZAwd1rNfEHsre4E+
   s0/qQdGhn7OvhHvIauYnsIv9NuitgrgoKw4wYMDgfgMewTfcZ6pZwtlP5
   aK4zU+LXkG/9tXrDSuvdvTkoGP8vbtabSglQoLemE2sxhet7tPMo2o3i5
   4r8ecJqCFzU7hVjgffHpXsyu3HURZdsx4DxdJDUpd9bOrUjHWMcg5Cj8P
   YfSKbPLf3f+U7RcyzTGjCgcqtEeKv5z3NFzSoPVkH+4CYswwMw+AWyUTG
   w==;
X-CSE-ConnectionGUID: 4goMHX/MQYq6iUp3BwviUg==
X-CSE-MsgGUID: Lpqp80gLSrCrkHYOSiMMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="23452699"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="23452699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 07:29:59 -0800
X-CSE-ConnectionGUID: 9qBvH0J8QPiWNOv7/dxzJA==
X-CSE-MsgGUID: vF+Ds/7xQZa/xCzwbSpPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101309972"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Dec 2024 07:29:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSHiN-0005sG-0d;
	Mon, 30 Dec 2024 15:29:55 +0000
Date: Mon, 30 Dec 2024 23:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/platforms/44x/gpio.c:63:28: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202412302306.wrnx9lgU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
commit: d5d1a1a55a7f227c0f41847b0598982f0a93170d powerpc/platforms: Move files from 4xx to 44x
date:   6 months ago
config: powerpc-randconfig-r133-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302306.wrnx9lgU-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241230/202412302306.wrnx9lgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302306.wrnx9lgU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/44x/gpio.c:63:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:63:28: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:63:28: sparse:     got restricted __be32 [noderef] __iomem *
>> arch/powerpc/platforms/44x/gpio.c:103:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:103:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:103:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:106:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:106:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:106:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:110:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:110:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:110:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:111:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:111:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:111:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:113:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:113:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:113:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:114:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:114:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:114:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:136:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:136:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:136:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:139:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:139:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:139:9: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:143:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:143:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:143:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:144:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:144:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:144:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:146:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:146:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:146:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:147:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:147:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:147:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:73:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/44x/gpio.c:75:17: sparse:     got restricted __be32 [noderef] __iomem *

vim +63 arch/powerpc/platforms/44x/gpio.c

878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   51  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   52  /*
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   53   * GPIO LIB API implementation for GPIOs
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   54   *
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   55   * There are a maximum of 32 gpios in each gpio controller.
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   56   */
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   57  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   58  static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   59  {
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   60  	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   61  	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   62  
eecdf59ad2fb90 arch/powerpc/sysdev/ppc4xx_gpio.c Linus Walleij   2015-12-21  @63  	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   64  }
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   65  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   66  static inline void
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   67  __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   68  {
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   69  	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   70  	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   71  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   72  	if (val)
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   73  		setbits32(&regs->or, GPIO_MASK(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   74  	else
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   75  		clrbits32(&regs->or, GPIO_MASK(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   76  }
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   77  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   78  static void
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   79  ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   80  {
0d36fe65f58391 arch/powerpc/sysdev/ppc4xx_gpio.c Linus Walleij   2015-12-08   81  	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   82  	unsigned long flags;
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   83  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   84  	spin_lock_irqsave(&chip->lock, flags);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   85  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   86  	__ppc4xx_gpio_set(gc, gpio, val);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   87  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   88  	spin_unlock_irqrestore(&chip->lock, flags);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   89  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   90  	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   91  }
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   92  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   93  static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   94  {
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   95  	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
0d36fe65f58391 arch/powerpc/sysdev/ppc4xx_gpio.c Linus Walleij   2015-12-08   96  	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   97  	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   98  	unsigned long flags;
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13   99  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  100  	spin_lock_irqsave(&chip->lock, flags);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  101  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  102  	/* Disable open-drain function */
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13 @103  	clrbits32(&regs->odr, GPIO_MASK(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  104  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  105  	/* Float the pin */
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  106  	clrbits32(&regs->tcr, GPIO_MASK(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  107  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  108  	/* Bits 0-15 use TSRL/OSRL, bits 16-31 use TSRH/OSRH */
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  109  	if (gpio < 16) {
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  110  		clrbits32(&regs->osrl, GPIO_MASK2(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  111  		clrbits32(&regs->tsrl, GPIO_MASK2(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  112  	} else {
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  113  		clrbits32(&regs->osrh, GPIO_MASK2(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  114  		clrbits32(&regs->tsrh, GPIO_MASK2(gpio));
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  115  	}
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  116  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  117  	spin_unlock_irqrestore(&chip->lock, flags);
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  118  
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  119  	return 0;
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  120  }
878e7556bfe7b1 arch/powerpc/sysdev/ppc4xx_gpio.c Steven A. Falco 2008-10-13  121  

:::::: The code at line 63 was first introduced by commit
:::::: eecdf59ad2fb90d8238a42e2ec41f165964349bb powerpc: ppc4cc/gpio: Be sure to clamp return value

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
