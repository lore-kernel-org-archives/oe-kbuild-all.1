Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C2137B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 02:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3Qkfk76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699671316; x=1731207316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r/ZlqfDSq+8TOmz856FyYnLbMoQ2l+sWl1KHtBhC6ts=;
  b=P3Qkfk76h7PnFlaC3lQM/3dz2C28TneEEXzfN0JorY6pBtTncssCQppy
   V5joGbR73Zxj5hcH9zAwQUW5ullztCbj3aRm/IJQVy4SD3p63eyd1OB2x
   GWrdp2ztcY2hic7fzdlRSd9O+RLjeP2g9BeHHRol2gT2/rYwsdmKOnXkm
   kAawvElWWSV83XL9VFd53S2+Zw+00tQacV+JxM5AaZqwJLxbaDcvx8jt9
   Am5BfDB26/dEi/GsS1viqZHHy5iu3ZccyRKnuaehZiyNY3TvAuq2xnKkD
   YhhUthFzfmzQYkYc1+wKM7Qhh5WYnFtaEYYirF165nDIJRHqtAOt90YP3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387417383"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="387417383"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 18:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763875790"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="763875790"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 18:55:14 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1e9P-000A9m-1w;
	Sat, 11 Nov 2023 02:55:11 +0000
Date: Sat, 11 Nov 2023 10:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sainath Grandhi <sainath.grandhi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3629/30000]
 arch/x86/kernel/apic/apic_flat_64.c:32:5: sparse: sparse: symbol
 'xapic_phys' was not declared. Should it be static?
Message-ID: <202311111052.GUM4nb9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 1c28a7a26eb80ee913a8b71cfe24acfdd8aa00ce [3629/30000] Adding kernel parameter for forcing xapic in physical mode
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231111/202311111052.GUM4nb9v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111052.GUM4nb9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111052.GUM4nb9v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/apic/apic_flat_64.c:32:5: sparse: sparse: symbol 'xapic_phys' was not declared. Should it be static?
   arch/x86/kernel/apic/apic_flat_64.c:53:6: warning: no previous prototype for 'flat_init_apic_ldr' [-Wmissing-prototypes]
      53 | void flat_init_apic_ldr(void)
         |      ^~~~~~~~~~~~~~~~~~

vim +/xapic_phys +32 arch/x86/kernel/apic/apic_flat_64.c

    31	
  > 32	int xapic_phys = 0;
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
