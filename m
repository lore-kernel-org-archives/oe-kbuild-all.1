Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F99842ABA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720715436; cv=none; b=LGsMlDX6rhlLuT40n3ivr6nYliHJSA2FFtBHAs+I7X95TVuOF1cKz8R13VLMoZ3XlWvCbrPMIZz+IIGj7//K5u1+88UkQapezavXXIYt2p2TSejNu/rjMQuxf9Ff8BIDX87Tu4Kdj4fgtzVDVGnvqRfGHxeh3mUSbdRZtnMSq6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720715436; c=relaxed/simple;
	bh=pOb+S0ESEpGwGx04i6bNjuizlroFpCytYs9JzA5xHy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bs7gtQaw2BgQApLMgIqI64Y9nE7MK2rk+HFCtHA9q89FtE2uCl8is8a3duheLnpaC3/rBcjrXJqGl9aq6MtHLXkYsb3hqTVnsmuEbKv8yXerX8yx8ty/YcD9IC2QgDmRi/SYOcCsLaIBsNsxrfBciZQ4jPULWbLO36hWxuz/kC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1QkJ7Kz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1QkJ7Kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720715434; x=1752251434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOb+S0ESEpGwGx04i6bNjuizlroFpCytYs9JzA5xHy0=;
  b=n1QkJ7KzTBDJV9BMz7tXBgNN48mmY3/wiyZ9cK8ykcmJ5Y3PMNrXh7wr
   rRvglOD2HIWtO/PYpVyqwHYBmFrCiX9RDIlvQyCSMLU0QBEvZaLFaC/VI
   CXWR0GBYjtiazrvAP5YWh4kPO/YuXUoBhqPW8HwwqXIU1hxySEdGwKt30
   8PoK3ANbb6wpYs4cJVl5weGnYcSnJ4KbGBZ2IhsNgV0iu9slB3LCBpB+z
   KrwBtXrn+nWPK8qUoycRdoMgetlgdHwwL1j28UX9lUn6uuUuiFBdkDMWs
   gdmVXVOYx6dfEGhlbv4qByBef9Zx6/E36rBjb35VfrJM5Dz6rJMBgH8vA
   g==;
X-CSE-ConnectionGUID: uKPXK/FtR9GcZkzQCXoopw==
X-CSE-MsgGUID: hCBHMBHJTXW7Xx4rCjMFow==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18259569"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="18259569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 09:30:34 -0700
X-CSE-ConnectionGUID: 4Qw0l2qXSnWjuvCeBOAQzg==
X-CSE-MsgGUID: YXOArIb2SBidyzv6GnsZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53562977"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jul 2024 09:30:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRwgg-000ZVO-0R;
	Thu, 11 Jul 2024 16:30:30 +0000
Date: Fri, 12 Jul 2024 00:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1625/10661] ls2k500sfb.c:undefined reference to
 `fg_console'
Message-ID: <202407120045.vP3mrDfe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   15f539c4a521c5ae892554d0046e24f050ec0e00
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [1625/10661] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: loongarch-randconfig-r133-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120045.vP3mrDfe-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240712/202407120045.vP3mrDfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120045.vP3mrDfe-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/video/fbdev/ls2k500sfb.o: in function `.L131':
>> ls2k500sfb.c:(.text+0x102c): undefined reference to `fg_console'
>> loongarch64-linux-ld: ls2k500sfb.c:(.text+0x1030): undefined reference to `fg_console'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
