Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA1883E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682709946; x=1714245946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tndx9Tg+HD1C4hpQG8fpimLvPurh2RE2NuFjvO2Kp4=;
  b=MlPnDxHCE+fCFYsxGtqZ1qcUHc1X2/ZbhhkkTRKgV59Jh+lE+c/3S2mV
   Vr9AOF7UbhGdvAxRMmBFG13oQ24BvcvJUTfDvNiRsrn5mrKDa9WCPrIF9
   QMl5gU5vQ0xPp19NRmHOy4AgwMnTNDPPjv8w1WHIpjlOQBG3iQvOEJ2H5
   UUZuDP2Oy5H/5Pp+Si3iqdDKiXzz+wltvkUlCQpGcTHuW3jSjrAbjX4p5
   g1J7mGO/z3ZthKB4r1ZCsmCn0gVPIqJMVDYXmVTybWBh5eYNDHOmx8xSf
   2CHxnAezvw0nqMi5jha8Ti8zrMNs8hItGXVC8j0BM4ge2bYW6IJHGcf4e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="410944593"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="410944593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 12:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="672300295"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="672300295"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Apr 2023 12:25:42 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psTiv-0000dN-08;
	Fri, 28 Apr 2023 19:25:41 +0000
Date: Sat, 29 Apr 2023 03:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 7/19] htmldocs: Warning:
 mm/cleancache.c references a file that doesn't exist:
 Documentation/vm/cleancache.rst
Message-ID: <202304290349.YsYfppg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8fa3f9cfd9f7390773eed3a1e9453fbbb872f486
commit: 71c7092b68fbeacad40d777cebd705621924e8a9 [7/19] ANDROID: Revert "mm: remove cleancache"
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 71c7092b68fbeacad40d777cebd705621924e8a9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290349.YsYfppg0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
>> Documentation/mm/frontswap.rst:11: WARNING: undefined label: cleancache (if the link has no caption the label must precede a section header)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
