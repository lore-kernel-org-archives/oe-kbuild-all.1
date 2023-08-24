Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11702288FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692883577; x=1724419577;
  h=date:from:cc:subject:message-id:mime-version;
  bh=joURbA8Qt9jFB+x598hv2gmi+d6VF32Ke5p0bzO1pOA=;
  b=jiHi5RK3xHYelKduua1zDugCGXISHzw9ZTEH8kGE3/gGmVoOn2b1zJ/5
   k4S40TccZvX/FQnFeCNALZ3YAuhdvBjEykaJ+RKqAzToEBBaXcXLKcqnD
   OVqvqRc+RREPHIkl9/vNG9PFujSFFm4RKM6g67J1U2jziW5S9FaSTTnv6
   Qh+yiL/sHm8chmMmx3dlm1Wx2t4bxOjLRJjNP8ysR+Q8hJaXnh10rzdKq
   VePJfh583xu0vPkMpOCNgkcAQJAf7lwzmCuIN74v8zHAuBMPoDO0JSQ7O
   XyDpP0tLalWB43aNbeLoBS6VwwCwDwfBcXSUXUkWzgWvBkwO4W4yhUjyO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374402566"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374402566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="807126997"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="807126997"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2023 06:26:14 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZALl-0002hs-0I;
	Thu, 24 Aug 2023 13:26:13 +0000
Date: Thu, 24 Aug 2023 21:25:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 56/79] undefined reference to
 `pinconf_generic_dt_free_map'
Message-ID: <202308242142.cO70VExN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 7cda4826851d6659c41427fe84be1084c5aa15c1 [56/79] pinctrl: tps6594: add pinmux and gpio for TPS6594 PMIC
config: x86_64-randconfig-073-20230824 (https://download.01.org/0day-ci/archive/20230824/202308242142.cO70VExN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242142.cO70VExN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242142.cO70VExN-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_group':
>> include/linux/pinctrl/pinconf-generic.h:203: undefined reference to `pinconf_generic_dt_node_to_map'
   ld: vmlinux.o: in function `kernel_headers_data_end':
>> (.rodata+0x7fdce8): undefined reference to `pinconf_generic_dt_free_map'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
