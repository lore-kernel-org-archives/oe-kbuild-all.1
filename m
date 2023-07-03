Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E08111AF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 20:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688415564; x=1719951564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gYriWA8xExn/dd9s+g7KCBfoUNyGqzDgjnqnOFD6Y6U=;
  b=Ij5TRIqGq1eAxeTD7k0q1Wd4zLn+mkScPijvEuHdaR4q34GVynjh4dUs
   xcPElEeYJaE0aD7g6PiY2CTnTNvhpuL2S7SNND4aFVGlw5EDCWKAOTjks
   rIcX9TTUKPCWR7wUbdcNm5ARycRT7WqN7jHioqWz+mg2FSOcFC0H6E8Ku
   oKNaNELjv0VuDlwN+YcAMbAP/SuMfeS57tFbcjMymeoKSoKUTYArDOKAc
   2fBQfCWiy/2RQG/2vQuDO6T+LXdfu5revFnwqEJolI/2mEMdtJuc5VZut
   zkoak4hsBNj/FcmtLqA/NhgmDCTu8jwPbNhmVonKQDwAsGN7LANYsD2O3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="362999800"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="362999800"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 13:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808697560"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="808697560"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2023 13:19:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGQ13-000HdV-1p;
	Mon, 03 Jul 2023 20:19:21 +0000
Date: Tue, 4 Jul 2023 04:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:sa1100 34/41] arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:19:
 error: initialization of 'int (*)(const struct device *, struct
 kobj_uevent_env *)' from incompatible pointer type 'int (*)(struct device *,
 struct kobj_uevent_env *)'
Message-ID: <202307040426.fSjN9unW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm sa1100
head:   ca9a42edad0dbc014cfe471c5e9d106dec9093f7
commit: 1feef5951d049ea4fa2232462b9dbd7b8081368e [34/41] ARM: sa1100/h3xxx: sleeve support
config: arm-assabet_defconfig (https://download.01.org/0day-ci/archive/20230704/202307040426.fSjN9unW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040426.fSjN9unW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040426.fSjN9unW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:19: error: initialization of 'int (*)(const struct device *, struct kobj_uevent_env *)' from incompatible pointer type 'int (*)(struct device *, struct kobj_uevent_env *)' [-Werror=incompatible-pointer-types]
      69 |         .uevent = ipaq_option_sleeve_uevent,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:19: note: (near initialization for 'ipaq_option_sleeve_bus.uevent')
   cc1: some warnings being treated as errors


vim +69 arch/arm/mach-sa1100/ipaq-sleeve-bus.c

    64	
    65	struct bus_type ipaq_option_sleeve_bus = {
    66		.name = "ipaq-sleeve",
    67		.dev_groups = ipaq_option_sleeve_dev_groups,
    68		.match = ipaq_option_sleeve_match,
  > 69		.uevent = ipaq_option_sleeve_uevent,
    70	};
    71	EXPORT_SYMBOL_GPL(ipaq_option_sleeve_bus);
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
