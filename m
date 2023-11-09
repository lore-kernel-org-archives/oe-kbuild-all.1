Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E521E526
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzIzrQ76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699537814; x=1731073814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjwECOIjx8jFpKxDQyKeYP6hXwqAJ3daCzSyUr+AkUY=;
  b=VzIzrQ763IBvAwfr3hCsKbRL3bS2A1bVuxSgiN6UhmIH3TfAEuzm+n3f
   Ls8YP+a2cXSXkNoTo90yrTXFLuEUb1cO0rPEBJYpfAQVI7/aVVJC9Ux59
   8tWVQuh1dyitNyutKn8H4UvWj5tbZ0PqZCjcJ+1pzep6MM3BIZ3aNLqCA
   ppDqFgAyq5Yb/nI2GMyd2bebl39NmWpTSAbbU11UbuQsBsEMfobaLfWil
   r8hryHEFzUk3hEbCnnY2o0G3JiwyblPQcNvUUD+55Cau7MCYn4uMnZyjX
   LYXnInx53Ehicez4r9lOlL0wgiqWZ1SNakgZLjl0poAuORLWSsWQ5oexz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="389787458"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="389787458"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739849591"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="739849591"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Nov 2023 05:50:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15Q5-0008lX-1y;
	Thu, 09 Nov 2023 13:50:05 +0000
Date: Thu, 9 Nov 2023 21:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 8440/29121] init/main.c:251:6: sparse:
 sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
Message-ID: <202311092116.hIjLxbDs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   2ac128c04e339e37898b7a798b7fcaa391d965c5
commit: dca811b6c4342bf1b98b67e199b9b01d3b3c2166 [8440/29121] UPSTREAM: bootconfig: init: Allow admin to use bootconfig for kernel command line
config: i386-randconfig-061-20231022 (https://download.01.org/0day-ci/archive/20231109/202311092116.hIjLxbDs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092116.hIjLxbDs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092116.hIjLxbDs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> init/main.c:251:6: sparse: sparse: symbol 'xbc_namebuf' was not declared. Should it be static?
   init/main.c:327:5: sparse: sparse: symbol 'boot_config_checksum' was not declared. Should it be static?

vim +/xbc_namebuf +251 init/main.c

   250	
 > 251	char xbc_namebuf[XBC_KEYLEN_MAX] __initdata;
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
