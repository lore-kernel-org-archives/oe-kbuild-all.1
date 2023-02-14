Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D847C088
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676384547; x=1707920547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aw6aWelfjqv1VQ97a/ltev/gwEL63ZW/QhE2WWi8CXE=;
  b=Ugu+dDaZgs774KgzzH+KZWRevd5/geW3Rs6vLFVdjD9RmcWs63YseP2C
   wIu1WMQbB3LGES0OGb1oRm2B2WFNVLnX7zX86/B0Kcep55XXUDM+E5S89
   or0Pwin167K0wygooFNfjMQ1KpS2CiNrF3mMQF2qNXc6zDbtP0/eYIE5L
   N0HROp5oY8wRkaxGxG2ayPEuuXDetFtOX2r8srzSMfwMzLiEKLSutIlZc
   GvzehJZJYFekIjtP9iNjpc08Mzbf7Oa5QaM+yVVAyR/LDa48GneZHJ4dR
   E1HAhgFJSxWU5njl5XXRVqxCHKimxXbyr8hD7MQwjctHBBGWCwGVOeLa+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314813509"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="314813509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 06:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619072091"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="619072091"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Feb 2023 06:22:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRwCB-0008ZB-2w;
	Tue, 14 Feb 2023 14:22:11 +0000
Date: Tue, 14 Feb 2023 22:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luke Ross <luke@lukeross.name>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/accel/da280.c:181:36: warning: 'da280_acpi_match'
 defined but not used
Message-ID: <202302142222.vVU0E4eu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luke,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f6feea56f66d34259c4222fa02e8171c4f2673d1
commit: 4c42bef0d3a1dd1a04d1f42c079f461cc1b139bc iio:accel:da280: Linx 820 Windows tablet has a da280 mapped via ACPI
date:   5 years ago
config: i386-buildonly-randconfig-r002-20230213 (https://download.01.org/0day-ci/archive/20230214/202302142222.vVU0E4eu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c42bef0d3a1dd1a04d1f42c079f461cc1b139bc
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4c42bef0d3a1dd1a04d1f42c079f461cc1b139bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash M=drivers/iio/accel

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142222.vVU0E4eu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/da280.c:181:36: warning: 'da280_acpi_match' defined but not used [-Wunused-const-variable=]
     181 | static const struct acpi_device_id da280_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~


vim +/da280_acpi_match +181 drivers/iio/accel/da280.c

   180	
 > 181	static const struct acpi_device_id da280_acpi_match[] = {
   182		{"MIRAACC", da280},
   183		{},
   184	};
   185	MODULE_DEVICE_TABLE(acpi, da280_acpi_match);
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
