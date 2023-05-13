Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464222623
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 22:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684018759; x=1715554759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRCIwRp/XmgPB0BzldaBogrN6FweCyYCa6h2qWjNlkk=;
  b=IDY55nKAYtT/H3HiIU8SBl5Qx1qU5ZLZI6/FKvW8ct4W52kW9Y/tJdxK
   Nydg6aAQu2rCi3rQ9GXFHfg8doKODjveynuygDAT6TWkKD9OVIc2zr/mD
   FkM+u1QkFdLPzvGM2O/WdlvplFcbiFEf1SDLf9NuHDgV8+99l3DSEuAaw
   cwLPIb6ekwU688sKw6qWhLf3DdbH/YnEnU9ESFa7jstKq2fgtQi0T6WHX
   T6GUHEb5Hwof4VnnbS/oBskeFLKdRCfbHsk9U5bmqt5Hx4aAZh8YTx/Lm
   H+OSyxeyGClrQCk51YHUHBlddexqaUNUp4TbW328GWF8By0uJu8fKpd3n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330610546"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="330610546"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 15:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="678037414"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="678037414"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 May 2023 15:59:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxyCr-0005iS-0g;
	Sat, 13 May 2023 22:59:17 +0000
Date: Sun, 14 May 2023 06:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 47/95] htmldocs:
 Documentation/virt/kvm/arm/get_cur_cpufreq.rst:4: WARNING: Title underline
 too short.
Message-ID: <202305140605.ytyDh6rs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   89d010b0a9df01990fffda97770fecd4e69e0f86
commit: cd980f666a92dac9d07b3b4f3f9a3db218e881be [47/95] CHROMIUM: BACKPORT: FROMLIST: kvm: arm64: Add support for get_cur_cpufreq service
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout cd980f666a92dac9d07b3b4f3f9a3db218e881be
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140605.ytyDh6rs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/kvm/arm/get_cur_cpufreq.rst:4: WARNING: Title underline too short.

vim +4 Documentation/virt/kvm/arm/get_cur_cpufreq.rst

     2	
     3	get_cur_cpufreq support for arm/arm64
   > 4	=============================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
